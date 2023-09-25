Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDB81095B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 16:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695660671; x=1727196671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z9iBiFxfoSWxcJ2iOEt3xGtFAiNTTz0RelZPLmMj/tg=;
  b=HvWZvGu6+PCFFluvZqSJFLlIXAgdnLfyesXkYmHpwG/tpOApyL8yE4cP
   xYvVIzzYo4c4KLyaRPaSFyBc4GAL7WqIqqe6oSlcC3xVJ15A9YcxtvdwF
   WMZdx6XnB4/uBkLdMxBYde4UQjdxDbvOwpz4STImENX2ACcwoN+tYTJ8t
   gR+1oaUIV28F+u9cocKC1osxHZcS6BQPIBa3sR7Nqrslu6xFC85dfH0Op
   uXLMGVc9T7LPxIgU2/eNQR/dDk6HkHB9SZHymgzyRAUR0J1/fbeuhUtHH
   L5gtf1qWpFJY1HZ6wlpJKbfrgwFr96RMofeXQ7MsS6Rl+LbxzF+5TE0p+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366356228"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="366356228"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 09:50:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079278411"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="1079278411"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2023 09:50:46 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkonE-0001pG-38;
	Mon, 25 Sep 2023 16:50:44 +0000
Date: Tue, 26 Sep 2023 00:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5k 28/28] lib/dynamic_debug.c:1330:6: warning: no
 previous prototype for 'dd_store_func_range'
Message-ID: <202309260018.e3OfOtEY-lkp@intel.com>
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
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230926/202309260018.e3OfOtEY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260018.e3OfOtEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260018.e3OfOtEY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1330:6: warning: no previous prototype for 'dd_store_func_range' [-Wmissing-prototypes]
    1330 | void dd_store_func_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next, int reps)
         |      ^~~~~~~~~~~~~~~~~~~


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
