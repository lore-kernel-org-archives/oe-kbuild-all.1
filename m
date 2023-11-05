Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C193F2F26
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJzrOsVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699193777; x=1730729777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oPWigeKSMr34Y47ZV9VPY1QlP95Bu0wkm1ZXwSXypIA=;
  b=iJzrOsVeGonOpnGaXySXg3Xuj3LJwIF/tLdVfJMEK8OhtWKpu2pExbFi
   PVGe/A//p8W3QzZlwqCN9mherQyootN2uQ/LaOpyEjkcgkiEqzk0AU584
   27OmY6OVi7vh89uyu1mM4JhPtpctKjcBBuw8c8Zl7qyp/ZpZBT5QTxb9l
   ZtC049t5MAAHQd498kj8NDFe0Z3jdo+mZoT+1AzLm83NSZAJn8wVFm2d1
   l4HxKDKp8hJZmXoH0+yPBeYBitydW/UBfhoX91T9mM+RHCv+hi9feQ9kE
   7fKaY+O9RCOfrCUgd9S18luw/hoKzE/heO2wJdIo2zujyHsS+Mr5Uqs9c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="10690633"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="10690633"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 06:16:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="905818046"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="905818046"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2023 06:16:14 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzdvA-0005Vs-0p;
	Sun, 05 Nov 2023 14:16:12 +0000
Date: Sun, 5 Nov 2023 22:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5k 28/28] lib/dynamic_debug.c:1330:6: sparse: sparse:
 symbol 'dd_store_func_range' was not declared. Should it be static?
Message-ID: <202311052116.beiNrpT9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-5k
head:   eac2af73427b308c426b03a2ad349d76e7daa5c7
commit: eac2af73427b308c426b03a2ad349d76e7daa5c7 [28/28] dyndbg: WIP insert _ddebug_site fields into a maple-tree
config: i386-randconfig-062-20230925 (https://download.01.org/0day-ci/archive/20231105/202311052116.beiNrpT9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311052116.beiNrpT9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311052116.beiNrpT9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:1330:6: sparse: sparse: symbol 'dd_store_func_range' was not declared. Should it be static?

vim +/dd_store_func_range +1330 lib/dynamic_debug.c

  1328	
  1329	#define TAIL_SPACER 1
> 1330	void dd_store_func_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next, int reps)
  1331	{
  1332		int rc;
  1333	
  1334		BUG_ON(next != start + reps);
  1335	
  1336		v3pr_info("  function: %s, %d debugs %lx-%lx\n",
  1337			  desc_function(start), reps, (unsigned long)start,
  1338			  (unsigned long)(next - TAIL_SPACER));
  1339	
  1340		rc = mtree_store_range(mt, (unsigned long)start,
  1341				       (unsigned long)(next - TAIL_SPACER),
  1342				       (void*)desc_function(start), GFP_KERNEL);
  1343		if (rc)
  1344			pr_warn("func:%s range store failed: %d\n",
  1345				desc_function(start), rc);
  1346	}
  1347				 
  1348	#define find_save_edge(var, name, cur, N) ({				\
  1349		if (strcmp(var, name)) {					\
  1350			var = (char*) name;					\
  1351			v3pr_info(" "#var"name: %s %lx\n", var, (unsigned long)cur - N); \
  1352			rc = mtree_insert(di->sites_mt, (unsigned long)cur - N,	\
  1353					  (void*)var, GFP_KERNEL);		\
  1354			switch (rc) {						\
  1355			case EEXIST:	pr_err("dd: range is occupied\n"); break; \
  1356			case EINVAL:	pr_err("dd: invalid request\n"); break;	\
  1357			case ENOMEM:	pr_err("dd: no memory\n"); break;	\
  1358			case 0:		v4pr_info(" dd: ok on %s\n", var); break; \
  1359			default:	pr_warn(" start "#var":%s\n", var);	\
  1360			}							\
  1361		}								\
  1362	})
  1363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
