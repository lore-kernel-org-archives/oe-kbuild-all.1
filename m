Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2F624A05D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 21:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768254923; cv=none; b=HUiw5lADc2kiCFzBMsEptaiKki/Ovo1AiK4M/6dySETQXqmhn057mCu6OspeSkIAoHNarWVihiCVT8KTBJFCYGd3L8klbz6+GeLHJxN2NtFJ+AfNE6Rd5jyv/XZu6GdwSBoDtVX4jXaCBQ2s7jTrAcZTfQymIltYU0mxSgdKQUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768254923; c=relaxed/simple;
	bh=qBJvAm/sngP0RT3UvTKnG0q4vrR/YIuCheQ1kONswC0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dcf5chxctvfePDpT/hijb0n0364gV+Ra3QJrGUav05ZujEz9rvK8uMvy2nBRYnmBYqfXfgiNkh6jwLMyAqVgz0ea9P6oRwd4A06so+XIq84P85JM+Nzbxg+fPtxSLX40T6TkrtzrXERYPzpQ0DRMksANceeU8daCVXaRLORqeFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxbxryRR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxbxryRR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768254921; x=1799790921;
  h=date:from:to:cc:subject:message-id;
  bh=qBJvAm/sngP0RT3UvTKnG0q4vrR/YIuCheQ1kONswC0=;
  b=UxbxryRRl3kZjjVylp4obmPGxFDlOliOCKJMyyPJtdT1p/PMtxzfuHsb
   88rEgFvjohZawZn7stsGBAdpwzNroO4SY5GWznvJjopWOwAGuPfCQbppl
   r4kWi19D9fvowattV+ERiDZIxMU4vb4mDfDm4GkjcNzIorwZkqcQ4ZD1N
   /qdZ4/5gveKd/4LR3FzphBBTHCiEfP9F/LnSYySiq81qWnwXimYSRu+Ed
   2p7rKvIfhRrYTVTiLIBi8ss4LoNnsm8F7/sPUSbVt9O4KmSkxNybPksu/
   wSRXhfGbTqpiZY1QAiUxeEsZ0agSKbKZFz5A0IcYGMggP4bhmAqrdOH8n
   Q==;
X-CSE-ConnectionGUID: X3odnZQbS7657THRAOWu0A==
X-CSE-MsgGUID: 66Qk6wrrQAKdz5yLOdkg9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69461480"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69461480"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 13:55:21 -0800
X-CSE-ConnectionGUID: H4tUKJSyT+KTA6JhwT1CSw==
X-CSE-MsgGUID: WJ0H8rqdRzKwB2B9gbil6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208722803"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 13:55:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfPsa-00000000Dui-2OfI;
	Mon, 12 Jan 2026 21:55:16 +0000
Date: Tue, 13 Jan 2026 05:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/controllers/v2 2/6]
 drivers/cxl/core/memctrl/sysram_region.c:83:14: error: implicit declaration
 of function 'offline_and_remove_memory'
Message-ID: <202601130511.LlhqwQib-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/controllers/v2
head:   dcbd460f630113f17cb71133f44920a1f35c2605
commit: ba7288831d4123b81b543a90dc594081b50ca1df [2/6] cxl: add sysram_region memory controller
config: i386-randconfig-001-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130511.LlhqwQib-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130511.LlhqwQib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130511.LlhqwQib-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/memctrl/sysram_region.c: In function 'hotunplug_store':
>> drivers/cxl/core/memctrl/sysram_region.c:83:14: error: implicit declaration of function 'offline_and_remove_memory' [-Wimplicit-function-declaration]
      83 |         rc = offline_and_remove_memory(range.start, range_len(&range));
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c: In function 'state_store':
>> drivers/cxl/core/memctrl/sysram_region.c:153:38: error: 'MMOP_ONLINE_MOVABLE' undeclared (first use in this function)
     153 |                 cb_arg.online_type = MMOP_ONLINE_MOVABLE;
         |                                      ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:153:38: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/cxl/core/memctrl/sysram_region.c:155:22: error: implicit declaration of function 'walk_memory_blocks'; did you mean 'online_memory_block_cb'? [-Wimplicit-function-declaration]
     155 |                 rc = walk_memory_blocks(range.start, range_len(&range),
         |                      ^~~~~~~~~~~~~~~~~~
         |                      online_memory_block_cb
>> drivers/cxl/core/memctrl/sysram_region.c:160:38: error: 'MMOP_ONLINE' undeclared (first use in this function); did you mean 'MEM_ONLINE'?
     160 |                 cb_arg.online_type = MMOP_ONLINE;
         |                                      ^~~~~~~~~~~
         |                                      MEM_ONLINE
   drivers/cxl/core/memctrl/sysram_region.c: In function 'hotplug_store':
>> drivers/cxl/core/memctrl/sysram_region.c:206:14: error: implicit declaration of function 'add_memory_driver_managed' [-Wimplicit-function-declaration]
     206 |         rc = add_memory_driver_managed(data->mgid, range.start,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/memctrl/sysram_region.c:208:40: error: 'MHP_NID_IS_MGID' undeclared (first use in this function)
     208 |                                        MHP_NID_IS_MGID);
         |                                        ^~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c: In function 'cxl_sysram_unregister':
>> drivers/cxl/core/memctrl/sysram_region.c:240:17: error: implicit declaration of function 'memory_group_unregister' [-Wimplicit-function-declaration]
     240 |                 memory_group_unregister(data->mgid);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c: In function 'devm_cxl_add_sysram_region':
>> drivers/cxl/core/memctrl/sysram_region.c:258:9: error: unknown type name 'mhp_t'
     258 |         mhp_t mhp_flags;
         |         ^~~~~
>> drivers/cxl/core/memctrl/sysram_region.c:302:14: error: implicit declaration of function 'memory_group_register_static' [-Wimplicit-function-declaration]
     302 |         rc = memory_group_register_static(numa_node, PFN_UP(total_len));
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:324:21: error: 'MHP_NID_IS_MGID' undeclared (first use in this function)
     324 |         mhp_flags = MHP_NID_IS_MGID;
         |                     ^~~~~~~~~~~~~~~


vim +/offline_and_remove_memory +83 drivers/cxl/core/memctrl/sysram_region.c

    67	
    68	static ssize_t hotunplug_store(struct device *dev,
    69				       struct device_attribute *attr,
    70				       const char *buf, size_t len)
    71	{
    72		struct cxl_region *cxlr = to_cxl_region(dev);
    73		struct range range;
    74		int rc;
    75	
    76		if (!cxlr)
    77			return -ENODEV;
    78	
    79		rc = cxl_sysram_range(cxlr, &range);
    80		if (rc)
    81			return rc;
    82	
  > 83		rc = offline_and_remove_memory(range.start, range_len(&range));
    84	
    85		if (rc)
    86			return rc;
    87	
    88		return len;
    89	}
    90	static DEVICE_ATTR_WO(hotunplug);
    91	
    92	struct online_memory_cb_arg {
    93		int online_type;
    94		int rc;
    95	};
    96	
    97	static int online_memory_block_cb(struct memory_block *mem, void *arg)
    98	{
    99		struct online_memory_cb_arg *cb_arg = arg;
   100	
   101		if (signal_pending(current))
   102			return -EINTR;
   103	
   104		cond_resched();
   105	
   106		if (mem->state == MEM_ONLINE)
   107			return 0;
   108	
   109		mem->online_type = cb_arg->online_type;
   110		cb_arg->rc = device_online(&mem->dev);
   111	
   112		return cb_arg->rc;
   113	}
   114	
   115	static int offline_memory_block_cb(struct memory_block *mem, void *arg)
   116	{
   117		int *rc = arg;
   118	
   119		if (signal_pending(current))
   120			return -EINTR;
   121	
   122		cond_resched();
   123	
   124		if (mem->state == MEM_OFFLINE)
   125			return 0;
   126	
   127		*rc = device_offline(&mem->dev);
   128	
   129		return *rc;
   130	}
   131	
   132	static ssize_t state_store(struct device *dev,
   133				   struct device_attribute *attr,
   134				   const char *buf, size_t len)
   135	{
   136		struct cxl_region *cxlr = to_cxl_region(dev);
   137		struct online_memory_cb_arg cb_arg;
   138		struct range range;
   139		int rc;
   140	
   141		if (!cxlr)
   142			return -ENODEV;
   143	
   144		rc = cxl_sysram_range(cxlr, &range);
   145		if (rc)
   146			return rc;
   147	
   148		rc = lock_device_hotplug_sysfs();
   149		if (rc)
   150			return rc;
   151	
   152		if (sysfs_streq(buf, "online")) {
 > 153			cb_arg.online_type = MMOP_ONLINE_MOVABLE;
   154			cb_arg.rc = 0;
 > 155			rc = walk_memory_blocks(range.start, range_len(&range),
   156						&cb_arg, online_memory_block_cb);
   157			if (!rc)
   158				rc = cb_arg.rc;
   159		} else if (sysfs_streq(buf, "online_normal")) {
 > 160			cb_arg.online_type = MMOP_ONLINE;
   161			cb_arg.rc = 0;
   162			rc = walk_memory_blocks(range.start, range_len(&range),
   163						&cb_arg, online_memory_block_cb);
   164			if (!rc)
   165				rc = cb_arg.rc;
   166		} else if (sysfs_streq(buf, "offline")) {
   167			int offline_rc = 0;
   168	
   169			rc = walk_memory_blocks(range.start, range_len(&range),
   170						&offline_rc, offline_memory_block_cb);
   171			if (!rc)
   172				rc = offline_rc;
   173		} else {
   174			rc = -EINVAL;
   175		}
   176	
   177		unlock_device_hotplug();
   178	
   179		if (rc)
   180			return rc;
   181	
   182		return len;
   183	}
   184	static DEVICE_ATTR_WO(state);
   185	
   186	static ssize_t hotplug_store(struct device *dev,
   187				     struct device_attribute *attr,
   188				     const char *buf, size_t len)
   189	{
   190		struct cxl_region *cxlr = to_cxl_region(dev);
   191		struct cxl_sysram_data *data;
   192		struct range range;
   193		int rc;
   194	
   195		if (!cxlr)
   196			return -ENODEV;
   197	
   198		data = dev_get_drvdata(dev);
   199		if (!data)
   200			return -ENODEV;
   201	
   202		rc = cxl_sysram_range(cxlr, &range);
   203		if (rc)
   204			return rc;
   205	
 > 206		rc = add_memory_driver_managed(data->mgid, range.start,
   207					       range_len(&range), sysram_name,
 > 208					       MHP_NID_IS_MGID);
   209		if (rc)
   210			return rc;
   211	
   212		return len;
   213	}
   214	static DEVICE_ATTR_WO(hotplug);
   215	
   216	static struct attribute *cxl_sysram_region_attrs[] = {
   217		&dev_attr_hotunplug.attr,
   218		&dev_attr_state.attr,
   219		&dev_attr_hotplug.attr,
   220		NULL,
   221	};
   222	
   223	static const struct attribute_group cxl_sysram_region_group = {
   224		.name = "memctl",
   225		.attrs = cxl_sysram_region_attrs,
   226	};
   227	
   228	static void cxl_sysram_unregister(void *_data)
   229	{
   230		struct cxl_sysram_data *data = _data;
   231		struct range range = {
   232			.start = data->res->start,
   233			.end = data->res->end
   234		};
   235	
   236		/* We have one shot for removal, otherwise it's stuck til reboot */
   237		if (!offline_and_remove_memory(range.start, range_len(&range))) {
   238			remove_resource(data->res);
   239			kfree(data->res);
 > 240			memory_group_unregister(data->mgid);
   241			kfree(data->res_name);
   242			kfree(data);
   243			return;
   244		}
   245		pr_err("CXL: %#llx-%#llx cannot be hotremoved until next reboot\n",
   246		       range.start, range.end);
   247	}
   248	
   249	int devm_cxl_add_sysram_region(struct cxl_region *cxlr)
   250	{
   251		struct cxl_region_params *p = &cxlr->params;
   252		struct device *dev = &cxlr->dev;
   253		struct cxl_sysram_data *data;
   254		struct memory_dev_type *mtype;
   255		unsigned long total_len = 0;
   256		struct resource *res;
   257		struct range range;
 > 258		mhp_t mhp_flags;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
