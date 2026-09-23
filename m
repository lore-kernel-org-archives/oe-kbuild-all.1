Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C1430C14A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 18:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188316; cv=none; b=KBJL+BUnNqzDs4DbOOux+F0ukoFBakqqD/IDZeDAGWyIk9f3I65bFzb26Px+biFHVwwLSXqi4mdivFPMU//eXhzPGn886SCtFDQ5XiPfxV/sjCc0XHTIv7KfZwT/E5d7x3F0hjCokUsiTUud/1Au44dd+vUX3ArbOpBOydye38o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188316; c=relaxed/simple;
	bh=foYKE0uK3SRqNArcFFUBiPyDUJ6yKVxOqXeUJ9FUPr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A6ObW43QGIhLyNfzxdwOUgA+3oGxvigFFrHXqtE31JzqhFSC6/jS/CpcrwYoHGkG/Xq9UgjQ3mNiuRWODrLJ4Uxf6x80b+w6tpfhUWo9Pk1vN2JKnZoqIbgar2jJvkyeBr+tRBYe3YH/ka63VSOGX58LBuYCALlmAjKBu9ko2Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axHUSYcf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axHUSYcf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790188314; x=1821724314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=foYKE0uK3SRqNArcFFUBiPyDUJ6yKVxOqXeUJ9FUPr8=;
  b=axHUSYcfNJdg0GP0BK9nlc78D30gxh4flaIfNRbcoirroF9uj8X222mE
   asE7iUa9nVGVAmFgmMfV6ZNHNRnG95ghex+kWvaxKecxnOfOMXCO5Ubba
   ujA7HhyjJLxF1miIA5h4tJ1luhLBQ33OI1ceYSmOOqAjkHjZR50yC3L6M
   UXgo8y68pIfGDZ6WHG2mLQklQNzCTORNN6xzjB4k/ZsnHb32Am8shauAr
   qRxmRPya4V47wbeOHAJxjO1U6PQQv7e4RAuDaJ79krSG8sfpkLOsFqNEX
   N2xNmCl2IOvlIbBEWNIFIoH2+QXP57gVEq1ftxwpuZT305OtlkISKKQmn
   w==;
X-CSE-ConnectionGUID: Kq0Z/y7gTBaJEc2iWoCGjQ==
X-CSE-MsgGUID: LOLj9kgSQcKZXJ04U7oBMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101578661"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="101578661"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:31:52 -0700
X-CSE-ConnectionGUID: CWT+Tx8TQMeBSrhlukExGA==
X-CSE-MsgGUID: mg03yQAwSI+5WH2eHHGkmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="281810464"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2026 11:31:50 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Rkv-000000000m3-3YIw;
	Wed, 23 Sep 2026 18:31:45 +0000
Date: Wed, 23 Sep 2026 20:30:48 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 54/67]
 lib/test_bonsai_tree.c:743:15: error: implicit declaration of function
 'ddebug_export_builtin_site_map'
Message-ID: <202609232055.zH1GBpV3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-bonsai-clean
head:   1b386f2c853c6e84025fa93d485e69ba8c1d76f4
commit: 7b4edca75e4f5e59ede2e42d572827699a0a173c [54/67] lib/test_bonsai_tree: Add bridge, live tests, and debugfs bench
config: x86_64-randconfig-r2200-20260923 (https://download.01.org/0day-ci/archive/20260923/202609232055.zH1GBpV3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609232055.zH1GBpV3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609232055.zH1GBpV3-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_bonsai_tree.c: In function 'test_bonsai_live_builtin':
>> lib/test_bonsai_tree.c:743:15: error: implicit declaration of function 'ddebug_export_builtin_site_map' [-Wimplicit-function-declaration]
     743 |         ret = ddebug_export_builtin_site_map(&bt_live, &mt_live, &start_descs, &num_descs);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ddebug_export_builtin_site_map +743 lib/test_bonsai_tree.c

   730	
   731	static int test_bonsai_live_builtin(void)
   732	{
   733		struct bonsai_tree bt_live, bt_repot;
   734		struct maple_tree mt_live;
   735		struct _ddebug *start_descs = NULL;
   736		size_t num_descs = 0, i;
   737		int ret, errs = 0;
   738	
   739		bonsai_init(&bt_live);
   740		bonsai_init(&bt_repot);
   741		mt_init_flags(&mt_live, 0);
   742	
 > 743		ret = ddebug_export_builtin_site_map(&bt_live, &mt_live, &start_descs, &num_descs);
   744		if (ret || !bt_live.root_idx || !start_descs || !num_descs) {
   745			pr_info("live builtin test: built-in sites not available or empty (ret=%d)\n", ret);
   746			bonsai_destroy(&bt_live);
   747			mtree_destroy(&mt_live);
   748			return 0;
   749		}
   750	
   751		pr_info("live builtin test: testing against %zu descriptors (tree nodes=%u, height=%u)\n",
   752			num_descs, bt_live.node_count, bt_live.height);
   753	
   754		ret = maple_to_bonsai(&mt_live, &bt_repot, GFP_KERNEL);
   755		if (ret) {
   756			pr_err("live builtin test: maple_to_bonsai failed (%d)\n", ret);
   757			errs++;
   758		}
   759	
   760		/* Cross-validate every single live descriptor */
   761		for (i = 0; i < num_descs; i++) {
   762			struct _ddebug *dp = &start_descs[i];
   763			unsigned long addr = (unsigned long)dp & 0x0FFFFFFFFFFFFFFFULL;
   764			unsigned long mod_key = (1ULL << 60) | addr;
   765			unsigned long file_key = (2ULL << 60) | addr;
   766			unsigned long func_key = (3ULL << 60) | addr;
   767	
   768			void *b_mod = bonsai_lookup(&bt_live, mod_key);
   769			void *m_mod = mtree_load(&mt_live, mod_key);
   770			void *r_mod = bonsai_lookup(&bt_repot, mod_key);
   771	
   772			void *b_file = bonsai_lookup(&bt_live, file_key);
   773			void *m_file = mtree_load(&mt_live, file_key);
   774			void *r_file = bonsai_lookup(&bt_repot, file_key);
   775	
   776			void *b_func = bonsai_lookup(&bt_live, func_key);
   777			void *m_func = mtree_load(&mt_live, func_key);
   778			void *r_func = bonsai_lookup(&bt_repot, func_key);
   779	
   780			if (b_mod != m_mod || b_mod != r_mod || !b_mod) {
   781				if (errs < 5)
   782					pr_err("live test: mod mismatch at desc %zu: b=%p m=%p r=%p\n",
   783					       i, b_mod, m_mod, r_mod);
   784				errs++;
   785			}
   786			if (b_file != m_file || b_file != r_file || !b_file) {
   787				if (errs < 5)
   788					pr_err("live test: file mismatch at desc %zu: b=%p m=%p r=%p\n",
   789					       i, b_file, m_file, r_file);
   790				errs++;
   791			}
   792			if (b_func != m_func || b_func != r_func || !b_func) {
   793				if (errs < 5)
   794					pr_err("live test: func mismatch at desc %zu: b=%p m=%p r=%p\n",
   795					       i, b_func, m_func, r_func);
   796				errs++;
   797			}
   798		}
   799	
   800		bonsai_destroy(&bt_live);
   801		bonsai_destroy(&bt_repot);
   802		mtree_destroy(&mt_live);
   803	
   804		if (errs) {
   805			pr_err("live builtin test: FAIL (%d errors over %zu descs)\n", errs, num_descs);
   806			return -EINVAL;
   807		}
   808	
   809		pr_info("live builtin test (%zu descs): PASS\n", num_descs);
   810		return 0;
   811	}
   812	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
