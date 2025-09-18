Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAC51F4181
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 04:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758168846; cv=none; b=Vb3RZprdx8mFKD7aKZ75Zyxgs60QZX9euZURYIOahBvFmmO/DAAta2pWxA0rpM/yuZXz41JQGy1K1al7fmKMBbqVhLaENCPQz+KeLHlxgOxoCbSIqyAWVywM3+c9De5NJzwLWLfo3xudDfKJWwswSYiVP3KmXiBAk4r8tW3IEwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758168846; c=relaxed/simple;
	bh=f1AUq/Rt4KqlZN2V3h9k15Vtp8n9YX3fXZURQ7NQ+kA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vyevj/JpUXNl8zng9WX8MJn698rvpHO+rXHid1JROe6L5i2qVNE0VcQB2KyBDQJDYwbXly838CKb2PiqApy2ndg/++zJFIonIhLuwZPn1mWeJYyi8dOLJ49TUpOSN1YRCMnp7vz5A/L2Xdnxso1JLH0TMe6nX6qwZoWkABYoBiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jcm5vuWe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jcm5vuWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758168843; x=1789704843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f1AUq/Rt4KqlZN2V3h9k15Vtp8n9YX3fXZURQ7NQ+kA=;
  b=Jcm5vuWevb4tGCATdDFtWmHNJK9NV57PqONCezsG24UtJzZfCSXGLslw
   8z5QgYDjzrLoDazPPRcd5zamF6xvPX79E2dw6kVpeRMWAj20IGvrM4U8E
   fwsWheY4IhlfKt3pWfEXVUwUWExRrFJsL+Y/LMCHUMCygkglJ5d5j0xUs
   kw3rXoD0vIIXJD2jGPeeGsMNG4Q8g8BrmRXXxaZrU/O2CuiXOzwCW9Mku
   Pml3a1azKLpqdzLfSj9FRmsIcEr5qsoHk3ztLSxscMPhqJPLxcEqGXgHh
   8aaIXYr04aBwrtq0tpmFjANbWa0JNTsqMFaEe42bOA/4RBgi9S6DI6bfD
   Q==;
X-CSE-ConnectionGUID: oRITI0p0TkmdoXqZ3pXeYA==
X-CSE-MsgGUID: OHp1CIVrSYqCRNET3EneSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="77925167"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="77925167"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 21:14:02 -0700
X-CSE-ConnectionGUID: iE/1GJURTyGmYW62vOBUxw==
X-CSE-MsgGUID: TWnAJL/KRjOcvJ4ILDpHbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="179715767"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Sep 2025 21:14:00 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uz61u-0002kv-0F;
	Thu, 18 Sep 2025 04:13:58 +0000
Date: Thu, 18 Sep 2025 12:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Liang <wangliang74@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2904/2904] net/oenetcls/oenetcls_ntuple.c:14:27:
 sparse: sparse: symbol 'oecls_sk_rules' was not declared. Should it be
 static?
Message-ID: <202509181257.lJX7E7VA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8ba53a0f68c5722dd787f872e161bbd850b225c4
commit: 22d4075bf5ef29ba4b329f954ac28a7de1d69a65 [2904/2904] net/oenetcls: remove oenetcls trace hook
config: loongarch-randconfig-r111-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181257.lJX7E7VA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181257.lJX7E7VA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181257.lJX7E7VA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/oenetcls/oenetcls_ntuple.c:14:27: sparse: sparse: symbol 'oecls_sk_rules' was not declared. Should it be static?
>> net/oenetcls/oenetcls_ntuple.c:14:43: sparse: sparse: symbol 'oecls_sk_list' was not declared. Should it be static?
>> net/oenetcls/oenetcls_ntuple.c:147:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dip4 @@     got restricted __be32 [usertype] ifa_local @@
   net/oenetcls/oenetcls_ntuple.c:147:38: sparse:     expected unsigned int [usertype] dip4
   net/oenetcls/oenetcls_ntuple.c:147:38: sparse:     got restricted __be32 [usertype] ifa_local
>> net/oenetcls/oenetcls_ntuple.c:161:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   net/oenetcls/oenetcls_ntuple.c:161:16: sparse:     expected unsigned short [usertype]
   net/oenetcls/oenetcls_ntuple.c:161:16: sparse:     got restricted __be16 [usertype]
>> net/oenetcls/oenetcls_ntuple.c:169:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   net/oenetcls/oenetcls_ntuple.c:169:23: sparse:     expected unsigned int [usertype]
   net/oenetcls/oenetcls_ntuple.c:169:23: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
>> net/oenetcls/oenetcls_ntuple.c:393:9: sparse: sparse: cast to restricted __be16
>> net/oenetcls/oenetcls_ntuple.c:393:9: sparse: sparse: cast to restricted __be16
>> net/oenetcls/oenetcls_ntuple.c:393:9: sparse: sparse: cast to restricted __be16
>> net/oenetcls/oenetcls_ntuple.c:406:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4dst @@     got unsigned int [usertype] dip4 @@
   net/oenetcls/oenetcls_ntuple.c:406:38: sparse:     expected restricted __be32 [usertype] ip4dst
   net/oenetcls/oenetcls_ntuple.c:406:38: sparse:     got unsigned int [usertype] dip4
>> net/oenetcls/oenetcls_ntuple.c:407:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] pdst @@     got unsigned short [usertype] dport @@
   net/oenetcls/oenetcls_ntuple.c:407:36: sparse:     expected restricted __be16 [usertype] pdst
   net/oenetcls/oenetcls_ntuple.c:407:36: sparse:     got unsigned short [usertype] dport
>> net/oenetcls/oenetcls_ntuple.c:409:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4dst @@     got unsigned int [usertype] @@
   net/oenetcls/oenetcls_ntuple.c:409:46: sparse:     expected restricted __be32 [usertype] ip4dst
   net/oenetcls/oenetcls_ntuple.c:409:46: sparse:     got unsigned int [usertype]
>> net/oenetcls/oenetcls_ntuple.c:410:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] pdst @@     got unsigned short [usertype] @@
   net/oenetcls/oenetcls_ntuple.c:410:36: sparse:     expected restricted __be16 [usertype] pdst
   net/oenetcls/oenetcls_ntuple.c:410:36: sparse:     got unsigned short [usertype]
   net/oenetcls/oenetcls_ntuple.c:442:25: sparse: sparse: cast to restricted __be16
   net/oenetcls/oenetcls_ntuple.c:442:25: sparse: sparse: cast to restricted __be16
   net/oenetcls/oenetcls_ntuple.c:442:25: sparse: sparse: cast to restricted __be16
--
>> net/oenetcls/oenetcls_main.c:265:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *useraddr @@     got void [noderef] __user *ifru_data @@
   net/oenetcls/oenetcls_main.c:265:31: sparse:     expected void *useraddr
   net/oenetcls/oenetcls_main.c:265:31: sparse:     got void [noderef] __user *ifru_data
>> net/oenetcls/oenetcls_main.c:344:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *[addressable] ifru_data @@     got void *cmd @@
   net/oenetcls/oenetcls_main.c:344:22: sparse:     expected void [noderef] __user *[addressable] ifru_data
   net/oenetcls/oenetcls_main.c:344:22: sparse:     got void *cmd
--
>> net/oenetcls/oenetcls_flow.c:18:6: sparse: sparse: symbol 'is_oecls_config_netdev' was not declared. Should it be static?
>> net/oenetcls/oenetcls_flow.c:40:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/oenetcls/oenetcls_flow.c:40:22: sparse:    void [noderef] __rcu *
   net/oenetcls/oenetcls_flow.c:40:22: sparse:    void *
   net/oenetcls/oenetcls_flow.c:149:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/oenetcls/oenetcls_flow.c:149:15: sparse:    void [noderef] __rcu *
   net/oenetcls/oenetcls_flow.c:149:15: sparse:    void *
   net/oenetcls/oenetcls_flow.c:235:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/oenetcls/oenetcls_flow.c:235:15: sparse:    void [noderef] __rcu *
   net/oenetcls/oenetcls_flow.c:235:15: sparse:    void *
   net/oenetcls/oenetcls_flow.c:258:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/oenetcls/oenetcls_flow.c:258:23: sparse:    void [noderef] __rcu *
   net/oenetcls/oenetcls_flow.c:258:23: sparse:    void *
   net/oenetcls/oenetcls_flow.c:260:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/oenetcls/oenetcls_flow.c:260:17: sparse:    void [noderef] __rcu *
   net/oenetcls/oenetcls_flow.c:260:17: sparse:    void *
   net/oenetcls/oenetcls_flow.c:309:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/oenetcls/oenetcls_flow.c:309:17: sparse:    void [noderef] __rcu *
   net/oenetcls/oenetcls_flow.c:309:17: sparse:    void *
>> net/oenetcls/oenetcls_flow.c:258:23: sparse: sparse: dereference of noderef expression

vim +/oecls_sk_rules +14 net/oenetcls/oenetcls_ntuple.c

4bed6ba0e88f50 Wang Liang 2025-08-26   13  
4bed6ba0e88f50 Wang Liang 2025-08-26  @14  struct oecls_sk_rule_list oecls_sk_rules, oecls_sk_list;
4bed6ba0e88f50 Wang Liang 2025-08-26   15  
4bed6ba0e88f50 Wang Liang 2025-08-26   16  static void init_oecls_sk_rules(void)
4bed6ba0e88f50 Wang Liang 2025-08-26   17  {
4bed6ba0e88f50 Wang Liang 2025-08-26   18  	unsigned int i;
4bed6ba0e88f50 Wang Liang 2025-08-26   19  
4bed6ba0e88f50 Wang Liang 2025-08-26   20  	for (i = 0; i < OECLS_SK_RULE_HASHSIZE; i++)
4bed6ba0e88f50 Wang Liang 2025-08-26   21  		INIT_HLIST_HEAD(oecls_sk_rules.hash + i);
4bed6ba0e88f50 Wang Liang 2025-08-26   22  	mutex_init(&oecls_sk_rules.mutex);
4bed6ba0e88f50 Wang Liang 2025-08-26   23  }
4bed6ba0e88f50 Wang Liang 2025-08-26   24  
4bed6ba0e88f50 Wang Liang 2025-08-26   25  static inline struct hlist_head *get_rule_hashlist(u32 dip4, u16 dport)
4bed6ba0e88f50 Wang Liang 2025-08-26   26  {
4bed6ba0e88f50 Wang Liang 2025-08-26   27  	return oecls_sk_rules.hash + (jhash_2words(dip4, dport, 0) & OECLS_SK_RULE_HASHMASK);
4bed6ba0e88f50 Wang Liang 2025-08-26   28  }
4bed6ba0e88f50 Wang Liang 2025-08-26   29  
4bed6ba0e88f50 Wang Liang 2025-08-26   30  static inline struct hlist_head *get_sk_hashlist(void *sk)
4bed6ba0e88f50 Wang Liang 2025-08-26   31  {
4bed6ba0e88f50 Wang Liang 2025-08-26   32  	return oecls_sk_list.hash + (jhash(sk, sizeof(sk), 0) & OECLS_SK_RULE_HASHMASK);
4bed6ba0e88f50 Wang Liang 2025-08-26   33  }
4bed6ba0e88f50 Wang Liang 2025-08-26   34  
4bed6ba0e88f50 Wang Liang 2025-08-26   35  static void add_sk_rule(int devid, u32 dip4, u16 dport, void *sk, int action,
4bed6ba0e88f50 Wang Liang 2025-08-26   36  			int ruleid, int nid)
4bed6ba0e88f50 Wang Liang 2025-08-26   37  {
4bed6ba0e88f50 Wang Liang 2025-08-26   38  	struct hlist_head *hlist = get_rule_hashlist(dip4, dport);
4bed6ba0e88f50 Wang Liang 2025-08-26   39  	struct hlist_head *sk_hlist = get_sk_hashlist(sk);
4bed6ba0e88f50 Wang Liang 2025-08-26   40  	struct oecls_sk_rule *rule;
4bed6ba0e88f50 Wang Liang 2025-08-26   41  	struct oecls_sk_entry *entry;
4bed6ba0e88f50 Wang Liang 2025-08-26   42  
4bed6ba0e88f50 Wang Liang 2025-08-26   43  	rule = kzalloc(sizeof(*rule), GFP_ATOMIC);
4bed6ba0e88f50 Wang Liang 2025-08-26   44  	entry = kzalloc(sizeof(*entry), GFP_ATOMIC);
4bed6ba0e88f50 Wang Liang 2025-08-26   45  	if (!rule || !entry)
4bed6ba0e88f50 Wang Liang 2025-08-26   46  		goto out;
4bed6ba0e88f50 Wang Liang 2025-08-26   47  
4bed6ba0e88f50 Wang Liang 2025-08-26   48  	rule->sk = sk;
4bed6ba0e88f50 Wang Liang 2025-08-26   49  	rule->dip4 = dip4;
4bed6ba0e88f50 Wang Liang 2025-08-26   50  	rule->dport = dport;
4bed6ba0e88f50 Wang Liang 2025-08-26   51  	rule->devid = devid;
4bed6ba0e88f50 Wang Liang 2025-08-26   52  	rule->action = action;
4bed6ba0e88f50 Wang Liang 2025-08-26   53  	rule->ruleid = ruleid;
4bed6ba0e88f50 Wang Liang 2025-08-26   54  	rule->nid = nid;
4bed6ba0e88f50 Wang Liang 2025-08-26   55  	hlist_add_head(&rule->node, hlist);
4bed6ba0e88f50 Wang Liang 2025-08-26   56  
4bed6ba0e88f50 Wang Liang 2025-08-26   57  	entry->sk = sk;
4bed6ba0e88f50 Wang Liang 2025-08-26   58  	entry->sk_rule_hash = jhash_2words(dip4, dport, 0);
4bed6ba0e88f50 Wang Liang 2025-08-26   59  	hlist_add_head(&entry->node, sk_hlist);
4bed6ba0e88f50 Wang Liang 2025-08-26   60  	return;
4bed6ba0e88f50 Wang Liang 2025-08-26   61  out:
4bed6ba0e88f50 Wang Liang 2025-08-26   62  	oecls_debug("alloc failed rule:%p entry:%p\n", rule, entry);
4bed6ba0e88f50 Wang Liang 2025-08-26   63  	kfree(entry);
4bed6ba0e88f50 Wang Liang 2025-08-26   64  	kfree(rule);
4bed6ba0e88f50 Wang Liang 2025-08-26   65  }
4bed6ba0e88f50 Wang Liang 2025-08-26   66  
4bed6ba0e88f50 Wang Liang 2025-08-26   67  static struct oecls_sk_entry *get_sk_entry(void *sk)
4bed6ba0e88f50 Wang Liang 2025-08-26   68  {
4bed6ba0e88f50 Wang Liang 2025-08-26   69  	struct hlist_head *sk_hlist = get_sk_hashlist(sk);
4bed6ba0e88f50 Wang Liang 2025-08-26   70  	struct oecls_sk_entry *entry = NULL;
4bed6ba0e88f50 Wang Liang 2025-08-26   71  
4bed6ba0e88f50 Wang Liang 2025-08-26   72  	hlist_for_each_entry(entry, sk_hlist, node) {
4bed6ba0e88f50 Wang Liang 2025-08-26   73  		if (entry->sk == sk)
4bed6ba0e88f50 Wang Liang 2025-08-26   74  			break;
4bed6ba0e88f50 Wang Liang 2025-08-26   75  	}
4bed6ba0e88f50 Wang Liang 2025-08-26   76  	return entry;
4bed6ba0e88f50 Wang Liang 2025-08-26   77  }
4bed6ba0e88f50 Wang Liang 2025-08-26   78  
4bed6ba0e88f50 Wang Liang 2025-08-26   79  static void del_sk_rule(struct oecls_sk_rule *rule)
4bed6ba0e88f50 Wang Liang 2025-08-26   80  {
4bed6ba0e88f50 Wang Liang 2025-08-26   81  	struct oecls_sk_entry *entry;
4bed6ba0e88f50 Wang Liang 2025-08-26   82  
4bed6ba0e88f50 Wang Liang 2025-08-26   83  	entry = get_sk_entry(rule->sk);
4bed6ba0e88f50 Wang Liang 2025-08-26   84  	if (!entry)
4bed6ba0e88f50 Wang Liang 2025-08-26   85  		return;
4bed6ba0e88f50 Wang Liang 2025-08-26   86  	hlist_del_init(&entry->node);
4bed6ba0e88f50 Wang Liang 2025-08-26   87  	kfree(entry);
4bed6ba0e88f50 Wang Liang 2025-08-26   88  
4bed6ba0e88f50 Wang Liang 2025-08-26   89  	oecls_debug("del rule=%p\n", rule);
4bed6ba0e88f50 Wang Liang 2025-08-26   90  	hlist_del_init(&rule->node);
4bed6ba0e88f50 Wang Liang 2025-08-26   91  	kfree(rule);
4bed6ba0e88f50 Wang Liang 2025-08-26   92  }
4bed6ba0e88f50 Wang Liang 2025-08-26   93  
4bed6ba0e88f50 Wang Liang 2025-08-26   94  static struct oecls_sk_rule *get_sk_rule(int devid, u32 dip4, u16 dport)
4bed6ba0e88f50 Wang Liang 2025-08-26   95  {
4bed6ba0e88f50 Wang Liang 2025-08-26   96  	struct hlist_head *hlist = get_rule_hashlist(dip4, dport);
4bed6ba0e88f50 Wang Liang 2025-08-26   97  	struct oecls_sk_rule *rule = NULL;
4bed6ba0e88f50 Wang Liang 2025-08-26   98  
4bed6ba0e88f50 Wang Liang 2025-08-26   99  	hlist_for_each_entry(rule, hlist, node) {
4bed6ba0e88f50 Wang Liang 2025-08-26  100  		if (rule->devid == devid && rule->dip4 == dip4 && rule->dport == dport)
4bed6ba0e88f50 Wang Liang 2025-08-26  101  			break;
4bed6ba0e88f50 Wang Liang 2025-08-26  102  	}
4bed6ba0e88f50 Wang Liang 2025-08-26  103  	return rule;
4bed6ba0e88f50 Wang Liang 2025-08-26  104  }
4bed6ba0e88f50 Wang Liang 2025-08-26  105  
4bed6ba0e88f50 Wang Liang 2025-08-26  106  static struct oecls_sk_rule *get_rule_from_sk(int devid, void *sk)
4bed6ba0e88f50 Wang Liang 2025-08-26  107  {
4bed6ba0e88f50 Wang Liang 2025-08-26  108  	struct oecls_sk_rule *rule = NULL;
4bed6ba0e88f50 Wang Liang 2025-08-26  109  	struct oecls_sk_entry *entry;
4bed6ba0e88f50 Wang Liang 2025-08-26  110  	struct hlist_head *hlist;
4bed6ba0e88f50 Wang Liang 2025-08-26  111  
4bed6ba0e88f50 Wang Liang 2025-08-26  112  	entry = get_sk_entry(sk);
4bed6ba0e88f50 Wang Liang 2025-08-26  113  	if (!entry)
4bed6ba0e88f50 Wang Liang 2025-08-26  114  		return NULL;
4bed6ba0e88f50 Wang Liang 2025-08-26  115  
4bed6ba0e88f50 Wang Liang 2025-08-26  116  	hlist = oecls_sk_rules.hash + (entry->sk_rule_hash & OECLS_SK_RULE_HASHMASK);
4bed6ba0e88f50 Wang Liang 2025-08-26  117  	hlist_for_each_entry(rule, hlist, node) {
4bed6ba0e88f50 Wang Liang 2025-08-26  118  		if (rule->devid == devid && rule->sk == sk)
4bed6ba0e88f50 Wang Liang 2025-08-26  119  			break;
4bed6ba0e88f50 Wang Liang 2025-08-26  120  	}
4bed6ba0e88f50 Wang Liang 2025-08-26  121  	return rule;
4bed6ba0e88f50 Wang Liang 2025-08-26  122  }
4bed6ba0e88f50 Wang Liang 2025-08-26  123  
4bed6ba0e88f50 Wang Liang 2025-08-26  124  static inline bool reuseport_check(int devid, u32 dip4, u16 dport)
4bed6ba0e88f50 Wang Liang 2025-08-26  125  {
4bed6ba0e88f50 Wang Liang 2025-08-26  126  	return !!get_sk_rule(devid, dip4, dport);
4bed6ba0e88f50 Wang Liang 2025-08-26  127  }
4bed6ba0e88f50 Wang Liang 2025-08-26  128  
4bed6ba0e88f50 Wang Liang 2025-08-26  129  static u32 get_first_ip4_addr(struct net *net)
4bed6ba0e88f50 Wang Liang 2025-08-26  130  {
4bed6ba0e88f50 Wang Liang 2025-08-26  131  	struct in_device *in_dev;
4bed6ba0e88f50 Wang Liang 2025-08-26  132  	struct net_device *dev;
4bed6ba0e88f50 Wang Liang 2025-08-26  133  	struct in_ifaddr *ifa;
4bed6ba0e88f50 Wang Liang 2025-08-26  134  	u32 dip4 = 0;
4bed6ba0e88f50 Wang Liang 2025-08-26  135  
4bed6ba0e88f50 Wang Liang 2025-08-26  136  	rtnl_lock();
4bed6ba0e88f50 Wang Liang 2025-08-26  137  	rcu_read_lock();
4bed6ba0e88f50 Wang Liang 2025-08-26  138  	for_each_netdev(net, dev) {
4bed6ba0e88f50 Wang Liang 2025-08-26  139  		if (dev->flags & IFF_LOOPBACK || !(dev->flags & IFF_UP))
4bed6ba0e88f50 Wang Liang 2025-08-26  140  			continue;
4bed6ba0e88f50 Wang Liang 2025-08-26  141  		in_dev = __in_dev_get_rcu(dev);
4bed6ba0e88f50 Wang Liang 2025-08-26  142  		if (!in_dev)
4bed6ba0e88f50 Wang Liang 2025-08-26  143  			continue;
4bed6ba0e88f50 Wang Liang 2025-08-26  144  
4bed6ba0e88f50 Wang Liang 2025-08-26  145  		in_dev_for_each_ifa_rcu(ifa, in_dev) {
4bed6ba0e88f50 Wang Liang 2025-08-26  146  			if (!strcmp(dev->name, ifa->ifa_label)) {
4bed6ba0e88f50 Wang Liang 2025-08-26 @147  				dip4 = ifa->ifa_local;
4bed6ba0e88f50 Wang Liang 2025-08-26  148  				oecls_debug("dev: %s, dip4:%pI4\n", dev->name, &dip4);
4bed6ba0e88f50 Wang Liang 2025-08-26  149  				goto out;
4bed6ba0e88f50 Wang Liang 2025-08-26  150  			}
4bed6ba0e88f50 Wang Liang 2025-08-26  151  		}
4bed6ba0e88f50 Wang Liang 2025-08-26  152  	}
4bed6ba0e88f50 Wang Liang 2025-08-26  153  out:
4bed6ba0e88f50 Wang Liang 2025-08-26  154  	rcu_read_unlock();
4bed6ba0e88f50 Wang Liang 2025-08-26  155  	rtnl_unlock();
4bed6ba0e88f50 Wang Liang 2025-08-26  156  	return dip4;
4bed6ba0e88f50 Wang Liang 2025-08-26  157  }
4bed6ba0e88f50 Wang Liang 2025-08-26  158  
4bed6ba0e88f50 Wang Liang 2025-08-26  159  static void get_sk_rule_addr(struct sock *sk, u32 *dip4, u16 *dport)
4bed6ba0e88f50 Wang Liang 2025-08-26  160  {
4bed6ba0e88f50 Wang Liang 2025-08-26 @161  	*dport = htons(sk->sk_num);
4bed6ba0e88f50 Wang Liang 2025-08-26  162  
4bed6ba0e88f50 Wang Liang 2025-08-26  163  	if (!match_ip_flag) {
4bed6ba0e88f50 Wang Liang 2025-08-26  164  		*dip4 = 0;
4bed6ba0e88f50 Wang Liang 2025-08-26  165  		return;
4bed6ba0e88f50 Wang Liang 2025-08-26  166  	}
4bed6ba0e88f50 Wang Liang 2025-08-26  167  
4bed6ba0e88f50 Wang Liang 2025-08-26  168  	if (sk->sk_rcv_saddr)
4bed6ba0e88f50 Wang Liang 2025-08-26 @169  		*dip4 = sk->sk_rcv_saddr;
4bed6ba0e88f50 Wang Liang 2025-08-26  170  	else
4bed6ba0e88f50 Wang Liang 2025-08-26  171  		*dip4 = get_first_ip4_addr(sock_net(sk));
4bed6ba0e88f50 Wang Liang 2025-08-26  172  }
4bed6ba0e88f50 Wang Liang 2025-08-26  173  

:::::: The code at line 14 was first introduced by commit
:::::: 4bed6ba0e88f50484fd5fb06bd993727b981b718 net/oenetcls: introduce oenetcls for network optimization

:::::: TO: Wang Liang <wangliang74@huawei.com>
:::::: CC: Wang Liang <wangliang74@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
