Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617C079EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676751617; x=1708287617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8BqyXoY+1c1vVgTvDQ0CqKBqkXRIVHCrDkcso76dw74=;
  b=DVqe63QROhb+mw/P/hQjj9qKSn6RjVHrOnruuyaLR6oQGxUQ5ANHTlkn
   8UU2fS8cZh0kIRNN3APy36bKgDV1r89q8sHaLrO8ge3UFCm9tpWY1pRnH
   JI52y8rTCCeb8Ym1wneFgYgEbJcTFhSKhCoKumYRthBjWc/UXyPYRURya
   yVmN7NzTbGIjRRPtIIpjoKnmPFmzeEX9TyExny/CJKiO01FO2C590osuv
   3VCOHhrN+ez2Ue3D4XawEIH3M0RrXgvLjfRIQRz1Z2oPS8eiaxbiZpKe8
   8uGNAe8UY18/KIrpocbRTot3JXYnjcybJYOrS+n1F86mu5JnfERLhbLHn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="311830875"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="311830875"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 12:20:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="794779144"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="794779144"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Feb 2023 12:20:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTTgq-000Chh-0K;
	Sat, 18 Feb 2023 20:20:12 +0000
Date: Sun, 19 Feb 2023 04:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Rowand <frowand.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: [robh:for-next 57/60] drivers/of/unittest.c:3042:41: error: 'struct
 device_node' has no member named 'kobj'
Message-ID: <202302190406.co0XSfzx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   39459ce717b863556d7d75466fcbd904a6fbbbd8
commit: 65b33f3e44e2aba403d3d5da96aaf42d4b6b5a9d [57/60] of: unittest: add node lifecycle tests
config: arc-randconfig-r043-20230219 (https://download.01.org/0day-ci/archive/20230219/202302190406.co0XSfzx-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=65b33f3e44e2aba403d3d5da96aaf42d4b6b5a9d
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh for-next
        git checkout 65b33f3e44e2aba403d3d5da96aaf42d4b6b5a9d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/of/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190406.co0XSfzx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/of/unittest.c: In function 'of_unittest_lifecycle':
>> drivers/of/unittest.c:3042:41: error: 'struct device_node' has no member named 'kobj'
    3042 |                 refcount = kref_read(&np->kobj.kref);
         |                                         ^~


vim +3042 drivers/of/unittest.c

  3008	
  3009	static void __init of_unittest_lifecycle(void)
  3010	{
  3011		unsigned int refcount;
  3012		int found_refcount_one = 0;
  3013		int put_count = 0;
  3014		struct device_node *np;
  3015		struct device_node *prev_sibling, *next_sibling;
  3016		const char *refcount_path = "/testcase-data/refcount-node";
  3017		const char *refcount_parent_path = "/testcase-data";
  3018	
  3019		/*
  3020		 * Node lifecycle tests, non-dynamic node:
  3021		 *
  3022		 * - Decrementing refcount to zero via of_node_put() should cause the
  3023		 *   attempt to free the node memory by of_node_release() to fail
  3024		 *   because the node is not a dynamic node.
  3025		 *
  3026		 * - Decrementing refcount past zero should result in additional
  3027		 *   errors reported.
  3028		 */
  3029	
  3030		np = of_find_node_by_path(refcount_path);
  3031		unittest(np, "find refcount_path \"%s\"\n", refcount_path);
  3032		if (np == NULL)
  3033			goto out_skip_tests;
  3034	
  3035		while (!found_refcount_one) {
  3036	
  3037			if (put_count++ > 10) {
  3038				unittest(0, "guardrail to avoid infinite loop\n");
  3039				goto out_skip_tests;
  3040			}
  3041	
> 3042			refcount = kref_read(&np->kobj.kref);
  3043			if (refcount == 1)
  3044				found_refcount_one = 1;
  3045			else
  3046				of_node_put(np);
  3047		}
  3048	
  3049		EXPECT_BEGIN(KERN_INFO, "OF: ERROR: of_node_release() detected bad of_node_put() on /testcase-data/refcount-node");
  3050	
  3051		/*
  3052		 * refcount is now one, decrementing to zero will result in a call to
  3053		 * of_node_release() to free the node's memory, which should result
  3054		 * in an error
  3055		 */
  3056		unittest(1, "/testcase-data/refcount-node is one");
  3057		of_node_put(np);
  3058	
  3059		EXPECT_END(KERN_INFO, "OF: ERROR: of_node_release() detected bad of_node_put() on /testcase-data/refcount-node");
  3060	
  3061	
  3062		/*
  3063		 * expect stack trace for subsequent of_node_put():
  3064		 *   __refcount_sub_and_test() calls:
  3065		 *   refcount_warn_saturate(r, REFCOUNT_SUB_UAF)
  3066		 *
  3067		 * Not capturing entire WARN_ONCE() trace with EXPECT_*(), just
  3068		 * the first three lines, and the last line.
  3069		 */
  3070		EXPECT_BEGIN(KERN_INFO, "------------[ cut here ]------------");
  3071		EXPECT_BEGIN(KERN_INFO, "WARNING: <<all>>");
  3072		EXPECT_BEGIN(KERN_INFO, "refcount_t: underflow; use-after-free.");
  3073		EXPECT_BEGIN(KERN_INFO, "---[ end trace <<int>> ]---");
  3074	
  3075		/* refcount is now zero, this should fail */
  3076		unittest(1, "/testcase-data/refcount-node is zero");
  3077		of_node_put(np);
  3078	
  3079		EXPECT_END(KERN_INFO, "---[ end trace <<int>> ]---");
  3080		EXPECT_END(KERN_INFO, "refcount_t: underflow; use-after-free.");
  3081		EXPECT_END(KERN_INFO, "WARNING: <<all>>");
  3082		EXPECT_END(KERN_INFO, "------------[ cut here ]------------");
  3083	
  3084		/*
  3085		 * Q. do we expect to get yet another warning?
  3086		 * A. no, the WARNING is from WARN_ONCE()
  3087		 */
  3088		EXPECT_NOT_BEGIN(KERN_INFO, "------------[ cut here ]------------");
  3089		EXPECT_NOT_BEGIN(KERN_INFO, "WARNING: <<all>>");
  3090		EXPECT_NOT_BEGIN(KERN_INFO, "refcount_t: underflow; use-after-free.");
  3091		EXPECT_NOT_BEGIN(KERN_INFO, "---[ end trace <<int>> ]---");
  3092	
  3093		unittest(1, "/testcase-data/refcount-node is zero, second time");
  3094		of_node_put(np);
  3095	
  3096		EXPECT_NOT_END(KERN_INFO, "---[ end trace <<int>> ]---");
  3097		EXPECT_NOT_END(KERN_INFO, "refcount_t: underflow; use-after-free.");
  3098		EXPECT_NOT_END(KERN_INFO, "WARNING: <<all>>");
  3099		EXPECT_NOT_END(KERN_INFO, "------------[ cut here ]------------");
  3100	
  3101		/*
  3102		 * refcount of zero will trigger stack traces from any further
  3103		 * attempt to of_node_get() node "refcount-node". One example of
  3104		 * this is where of_unittest_check_node_linkage() will recursively
  3105		 * scan the tree, with 'for_each_child_of_node()' doing an
  3106		 * of_node_get() of the children of a node.
  3107		 *
  3108		 * Prevent the stack trace by removing node "refcount-node" from
  3109		 * its parent's child list.
  3110		 *
  3111		 * WARNING:  EVIL, EVIL, EVIL:
  3112		 *
  3113		 *   Directly manipulate the child list of node /testcase-data to
  3114		 *   remove child refcount-node.  This is ignoring all proper methods
  3115		 *   of removing a child and will leak a small amount of memory.
  3116		 */
  3117	
  3118		np = of_find_node_by_path(refcount_parent_path);
  3119		unittest(np, "find refcount_parent_path \"%s\"\n", refcount_parent_path);
  3120		unittest(np, "ERROR: devicetree live tree left in a 'bad state' if test fail\n");
  3121		if (np == NULL)
  3122			return;
  3123	
  3124		prev_sibling = np->child;
  3125		next_sibling = prev_sibling->sibling;
  3126		if (!strcmp(prev_sibling->full_name, "refcount-node")) {
  3127			np->child = next_sibling;
  3128			next_sibling = next_sibling->sibling;
  3129		}
  3130		while (next_sibling) {
  3131			if (!strcmp(next_sibling->full_name, "refcount-node"))
  3132				prev_sibling->sibling = next_sibling->sibling;
  3133			prev_sibling = next_sibling;
  3134			next_sibling = next_sibling->sibling;
  3135		}
  3136		of_node_put(np);
  3137	
  3138		return;
  3139	
  3140	out_skip_tests:
  3141		unittest(0, "One or more lifecycle tests skipped\n");
  3142	}
  3143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
