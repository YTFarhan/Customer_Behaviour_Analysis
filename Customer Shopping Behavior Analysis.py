#!/usr/bin/env python
# coding: utf-8

# In[3]:


import pandas as pd


# In[4]:


customer_shopping = pd.read_csv(r"C:\Users\farha\Documents\Python work\customer_shopping_behavior.csv")


# In[5]:


customer_shopping.head()


# In[6]:


customer_shopping.info()


# In[7]:


customer_shopping.describe()


# In[8]:


customer_shopping.describe(include='all')


# In[9]:


customer_shopping.isnull().sum()


# In[10]:


customer_shopping['Review Rating'] = (
    customer_shopping
    .groupby('Category')['Review Rating']
    .transform(lambda x: x.fillna(x.median()))
)


# In[11]:


customer_shopping.isnull().sum()


# In[12]:


customer_shopping.columns = customer_shopping.columns.str.lower()
customer_shopping.columns = customer_shopping.columns.str.replace(' ','_')
customer_shopping = customer_shopping.rename(columns={'purchase_amount_(usd)':'purchase_amount'})


# In[14]:


customer_shopping.columns


# In[15]:


# column for age group

labels = ['Young Adult', 'Adult', 'Middle-aged', 'Senior']
customer_shopping['age_group'] = pd.qcut(customer_shopping['age'], q=4, labels = labels)


# In[17]:


customer_shopping[['age', 'age_group']].head(10)


# In[38]:


# creating a purchase_frequency_days column

frequency_mapping = {
    'Fortnightly': 14,
    'Weekly': 7,
    'Monthly': 30,
    'Quarterly': 90,
    'Bi-Weekly': 14,
    'Annually': 365,
    'Every 3 Months': 90
}
    
customer_shopping['purchase_frequency_days'] = customer_shopping['frequency_of_purchases'].map(frequency_mapping)


# In[39]:


customer_shopping[['purchase_frequency_days','frequency_of_purchases']].head(10)


# In[21]:


customer_shopping[['discount_applied', 'promo_code_used']].head(10)


# In[23]:


customer_shopping['discount_applied'] == customer_shopping['promo_code_used'].all()


# In[24]:


customer_shopping = customer_shopping.drop('promo_code_used', axis=1)


# In[35]:


customer_shopping.columns


# In[12]:


get_ipython().system('pip install psycopg2-binary sqlalchemy')


# In[13]:


from sqlalchemy import create_engine

# Step 1: Connect to PostgreSQL
# Replace placeholders with your actual details
username = "postgres"      # default user
password = "Farhan2011" # the password you set during installation
host = "localhost"         # if running locally
port = "5432"              # default PostgreSQL port
database = "customer_behavior"    # the database you created in pgAdmin

engine = create_engine(f"postgresql+psycopg2://{username}:{password}@{host}:{port}/{database}")

# Step 2: Load DataFrame into PostgreSQL
table_name = "customer"   # choose any table name
customer_shopping.to_sql(table_name, engine, if_exists="replace", index=False)

print(f"Data successfully loaded into table '{table_name}' in database '{database}'.")


# In[ ]:




