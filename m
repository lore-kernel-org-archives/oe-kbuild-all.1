Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CF310F5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 09:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694597795; x=1726133795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pEsdX9brDLDl2UdzPN3RVAUV8oKTnUNIDHboCqHyPxk=;
  b=InWuCT0GyAUdP7u7XiwJLms7QN/Ez+16X/xgIKpDG0zN+TtVwK1rHch2
   +x/tkan93qfIt64RxOgxa1e5W+GTuegOoDapvP5S52pFeTJr4VfGEPohM
   BmqJgA5y1qFlnKftbOWVNvkTZcwbn/x8I4TvGRV9tH/M8w6gVe5esMPlM
   4HSkEez9oBT8TK8LRAxmRq5/BjtvX+9V09pOO7Jxbf9HHbiZv4T/fBz+u
   N9cjLkBvflHF6un8iEzT6sLrrxT4qoQG4BSqnqEC9T+zXR1YdMytpHOos
   aaKA5i8qMFh4R1tiLSdgPQvwjWOCklcuePk3z6E79zEUsAlRgfTuVkwNH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="445050118"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="445050118"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 02:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990857156"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="990857156"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Sep 2023 02:36:13 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgMI6-0000LD-1P;
	Wed, 13 Sep 2023 09:36:10 +0000
Date: Wed, 13 Sep 2023 17:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5i 26/26] lib/dynamic_debug.c:1323:8: error: assigning
 to 'char *' from 'const char *' discards qualifiers
Message-ID: <202309131701.fAPAUFyx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-5i
head:   856641f5651b4822791e2a79f02962fa891ca325
commit: 856641f5651b4822791e2a79f02962fa891ca325 [26/26] dyndbg: WIP stuff _ddebug.{modname,filenam,function} into maple-tree
config: powerpc64-randconfig-r012-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131701.fAPAUFyx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131701.fAPAUFyx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131701.fAPAUFyx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/dynamic_debug.c:1323:8: error: assigning to 'char *' from 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                           mod = dp->modname;
                               ^ ~~~~~~~~~~~
   lib/dynamic_debug.c:1329:8: error: assigning to 'char *' from 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                           src = dp->filename;
                               ^ ~~~~~~~~~~~~
   lib/dynamic_debug.c:1335:7: error: assigning to 'char *' from 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                           fn = dp->function;
                              ^ ~~~~~~~~~~~~
   3 errors generated.


vim +1323 lib/dynamic_debug.c

  1311	
  1312	static void intervalize_descs(struct _ddebug_info *di)
  1313	{
  1314		struct _ddebug *dp;
  1315		char *mod, *src, *fn;
  1316		int i;
  1317	
  1318		mod = src = fn = "";
  1319		for_each_boxed_vector(di, descs, num_descs, i, dp) {
  1320	
  1321			if (strcmp(mod, dp->modname)) {
  1322				v3pr_info(" modname: %s\n", dp->modname);
> 1323				mod = dp->modname;
  1324				mtree_insert(&dd_mt_sites, (unsigned long)dp - 3,
  1325					     (void*)mod, GFP_KERNEL);
  1326			}
  1327			if (strcmp(src, dp->filename)) {
  1328				v3pr_info(" filename: %s\n", dp->filename);
  1329				src = dp->filename;
  1330				mtree_insert(&dd_mt_sites, (unsigned long)dp - 2,
  1331					     (void*)src, GFP_KERNEL);
  1332			}
  1333			if (strcmp(fn, dp->function)) {
  1334				v3pr_info(" function: %s\n", dp->function);
  1335				fn = dp->function;
  1336				mtree_insert(&dd_mt_sites, (unsigned long)dp - 1,
  1337					     (void*)fn, GFP_KERNEL);
  1338			}
  1339		}
  1340	}
  1341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
