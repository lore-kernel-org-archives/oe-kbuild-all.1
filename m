Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F43D3DA7FC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863288; cv=none; b=qHJ1ZHGoaEKtr/9bymghtW97y/6knQSCBJg7cRNqDgcXyHtILBOK1sLCgevXk0+vevwgHz6ClX9x9x2pIpSotoEKnJmkUVny84JVmErTq+Abl2hKJUfgsD/eiAf6B5kvgfGHcCDNjRW8b1gLTc59dwhIhdn9K50pCiKxWS2TqJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863288; c=relaxed/simple;
	bh=EurNCdkX13vvFzzFrxFqH9EtiasCa0P6ndZevKzGZc8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h2mADVX+qt55R+zzn0ehLwwxSzB2Sttjann+9IF26BiiLhCpdZ9k2y4w34hucRix+0qb1sNZhNvsmk3cCkkApHDhaNCeDK2OfFlQUODbPA/4/JDr7Srmnu71VDW6ruxM8iorMsp8/wPz0Hu23MK4ZwpWWYaKJuojct6vonKRCZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsddTxkp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsddTxkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767863279; x=1799399279;
  h=date:from:to:cc:subject:message-id;
  bh=EurNCdkX13vvFzzFrxFqH9EtiasCa0P6ndZevKzGZc8=;
  b=MsddTxkpxaIWSsH7g+2zD+ThBCfi0cPNthnqhtDyzENOYDcDo7hOUUPi
   frb2bDNWhx3wyG8bwzu6KHn0sk+aD7B5ATmVh3ofWJhax3bKDCwb1QD7E
   UQsSsq0P5rBen9Tq8WAECR/k/va56jTed4g+m+JUKxdHfsLaeNVdGidi7
   W7LYhnUvW7aFC++su5X4qPO81GAwKbE0xlTrtewP7OhYEibmx56nzfn3/
   QgA1fGUpqQTEZ7f2Khw0BlqhhtKyFviB7CBDHqTD/5lLbl6pTvLbuu4HJ
   HvWIzQ5uHqwy52bEK09H38S7xnWPBmG4/BvBgQaZOF/kI/nBCoiW6Y8Br
   Q==;
X-CSE-ConnectionGUID: B2hBlYCzQ92jky5w088iOw==
X-CSE-MsgGUID: b0H6o05uTvCKzmdUfdUl6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="79879045"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="79879045"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 01:07:47 -0800
X-CSE-ConnectionGUID: 3NckUXGMQvmV6qhs++/GAQ==
X-CSE-MsgGUID: 2uygjwjSS/a+VSEzG0lSIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="202355401"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jan 2026 01:07:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdlza-000000004XE-14iM;
	Thu, 08 Jan 2026 09:07:42 +0000
Date: Thu, 08 Jan 2026 17:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v3 7/9]
 drivers/dax/kmem.c:98:10: warning: variable 'rc' is uninitialized when used
 here
Message-ID: <202601081800.7cg24FfU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v3
head:   8a4f71e8f0a8aef992da7df176a352073872a47c
commit: 1af0d8e02635ffeccfda23b44794ec8d205e53f3 [7/9] drivers/dax: add private_node bit to dev_dax
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260108/202601081800.7cg24FfU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601081800.7cg24FfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601081800.7cg24FfU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dax/kmem.c:98:10: warning: variable 'rc' is uninitialized when used here [-Wuninitialized]
      98 |                 return rc;
         |                        ^~
   drivers/dax/kmem.c:74:11: note: initialize the variable 'rc' to silence this warning
      74 |         int i, rc, mapped = 0;
         |                  ^
         |                   = 0
   1 warning generated.


vim +/rc +98 drivers/dax/kmem.c

    67	
    68	static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
    69	{
    70		struct device *dev = &dev_dax->dev;
    71		unsigned long total_len = 0, orig_len = 0;
    72		struct dax_kmem_data *data;
    73		struct memory_dev_type *mtype;
    74		int i, rc, mapped = 0;
    75		mhp_t mhp_flags;
    76		int numa_node;
    77		int adist = MEMTIER_DEFAULT_DAX_ADISTANCE;
    78	
    79		/*
    80		 * Ensure good NUMA information for the persistent memory.
    81		 * Without this check, there is a risk that slow memory
    82		 * could be mixed in a node with faster memory, causing
    83		 * unavoidable performance issues.
    84		 */
    85		numa_node = dev_dax->target_node;
    86		if (numa_node < 0) {
    87			dev_warn(dev, "rejecting DAX region with invalid node: %d\n",
    88					numa_node);
    89			return -EINVAL;
    90		}
    91	
    92		/*
    93		 * If this memory is intended for a private node, set the
    94		 * node private now.  If it can't be done, fail before hotplug
    95		 */
    96		if (dev_dax->private_node && node_mark_private(numa_node, true)) {
    97			dev_warn(dev, "failed to mark node private\n");
  > 98			return rc;
    99		}
   100	
   101		mt_calc_adistance(numa_node, &adist);
   102		mtype = kmem_find_alloc_memory_type(adist);
   103		if (IS_ERR(mtype))
   104			return PTR_ERR(mtype);
   105	
   106		for (i = 0; i < dev_dax->nr_range; i++) {
   107			struct range range;
   108	
   109			orig_len += range_len(&dev_dax->ranges[i].range);
   110			rc = dax_kmem_range(dev_dax, i, &range);
   111			if (rc) {
   112				dev_info(dev, "mapping%d: %#llx-%#llx too small after alignment\n",
   113						i, range.start, range.end);
   114				continue;
   115			}
   116			total_len += range_len(&range);
   117		}
   118	
   119		if (!total_len) {
   120			dev_warn(dev, "rejecting DAX region without any memory after alignment\n");
   121			return -EINVAL;
   122		} else if (total_len != orig_len) {
   123			char buf[16];
   124	
   125			string_get_size(orig_len - total_len, 1, STRING_UNITS_2,
   126					buf, sizeof(buf));
   127			dev_warn(dev, "DAX region truncated by %s due to alignment\n", buf);
   128		}
   129	
   130		init_node_memory_type(numa_node, mtype);
   131	
   132		rc = -ENOMEM;
   133		data = kzalloc(struct_size(data, res, dev_dax->nr_range), GFP_KERNEL);
   134		if (!data)
   135			goto err_dax_kmem_data;
   136	
   137		data->res_name = kstrdup(dev_name(dev), GFP_KERNEL);
   138		if (!data->res_name)
   139			goto err_res_name;
   140	
   141		rc = memory_group_register_static(numa_node, PFN_UP(total_len));
   142		if (rc < 0)
   143			goto err_reg_mgid;
   144		data->mgid = rc;
   145	
   146		for (i = 0; i < dev_dax->nr_range; i++) {
   147			struct resource *res;
   148			struct range range;
   149	
   150			rc = dax_kmem_range(dev_dax, i, &range);
   151			if (rc)
   152				continue;
   153	
   154			/* Region is permanently reserved if hotremove fails. */
   155			res = request_mem_region(range.start, range_len(&range), data->res_name);
   156			if (!res) {
   157				dev_warn(dev, "mapping%d: %#llx-%#llx could not reserve region\n",
   158						i, range.start, range.end);
   159				/*
   160				 * Once some memory has been onlined we can't
   161				 * assume that it can be un-onlined safely.
   162				 */
   163				if (mapped)
   164					continue;
   165				rc = -EBUSY;
   166				goto err_request_mem;
   167			}
   168			data->res[i] = res;
   169	
   170			/*
   171			 * Set flags appropriate for System RAM.  Leave ..._BUSY clear
   172			 * so that add_memory() can add a child resource.  Do not
   173			 * inherit flags from the parent since it may set new flags
   174			 * unknown to us that will break add_memory() below.
   175			 */
   176			res->flags = IORESOURCE_SYSTEM_RAM;
   177	
   178			mhp_flags = MHP_NID_IS_MGID;
   179			if (dev_dax->memmap_on_memory)
   180				mhp_flags |= MHP_MEMMAP_ON_MEMORY;
   181	
   182			/*
   183			 * Ensure that future kexec'd kernels will not treat
   184			 * this as RAM automatically.
   185			 */
   186			rc = add_memory_driver_managed(data->mgid, range.start,
   187					range_len(&range), kmem_name, mhp_flags);
   188	
   189			if (rc) {
   190				dev_warn(dev, "mapping%d: %#llx-%#llx memory add failed\n",
   191						i, range.start, range.end);
   192				remove_resource(res);
   193				kfree(res);
   194				data->res[i] = NULL;
   195				if (mapped)
   196					continue;
   197				goto err_request_mem;
   198			}
   199			mapped++;
   200		}
   201	
   202		dev_set_drvdata(dev, data);
   203	
   204		return 0;
   205	
   206	err_request_mem:
   207		memory_group_unregister(data->mgid);
   208	err_reg_mgid:
   209		kfree(data->res_name);
   210	err_res_name:
   211		kfree(data);
   212	err_dax_kmem_data:
   213		clear_node_memory_type(numa_node, mtype);
   214		return rc;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
