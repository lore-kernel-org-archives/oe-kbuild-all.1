Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE3D2421C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 21:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695678775; x=1727214775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JHeVC/tbF3v7Nwq9QnuhqTPmw9B2stuy6QcGwLqcI00=;
  b=Bo62r0g3neZuh9ScNczroFc/sVsR3dytBFuvnkhuQ82GW763YeUkExWE
   0gvL2dLVJ79LdUlASdromOyLa5R1Sc3ajm+Mn2I/EO4bh8ZejbQdl6VHX
   7l5JV6AzZKP46B1IqZVC8ykw7T8b30RDMhoXGgGgt9O52ZtOamMp59fVj
   5J3ja7uGY6m4z4leF/tu5JrSO29InKPzXftqpf9yLrsF4XDPHUrNZ9OKv
   jvIcs+C0cNKbNZoupQ6Fhe4FWQ/M79VYyy2I/809p43gBVQFyqGmTcqq2
   /LRF549OqIGECeQFJFhzbRMfC3DChKCc0NbnQaG45F1GAulKxa3arq6zv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="381315495"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="381315495"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 14:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="864126093"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="864126093"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2023 14:52:54 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qktVb-00023b-2g;
	Mon, 25 Sep 2023 21:52:51 +0000
Date: Tue, 26 Sep 2023 05:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5k 28/28] lib/dynamic_debug.c:1330:6: warning: no
 previous declaration for 'dd_store_func_range'
Message-ID: <202309260510.4jC061ER-lkp@intel.com>
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
config: i386-randconfig-002-20230925 (https://download.01.org/0day-ci/archive/20230926/202309260510.4jC061ER-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260510.4jC061ER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260510.4jC061ER-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1330:6: warning: no previous declaration for 'dd_store_func_range' [-Wmissing-declarations]
    void dd_store_func_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next, int reps)
         ^~~~~~~~~~~~~~~~~~~


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
