Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A8B49BD8A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 11:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163740; cv=none; b=EqXVZuo9MrS050VhAp1LSt7sEglFM+JQ2iBwa6swrS5zDS5wglZx1IVZCwA2nxo4G8egUc9WyOEg4HZOADv1lTLNpDjexcsS/MjMfc/7sxJ356yks11wbN8t31ftUhBKySeW2MfeWyeJFMxdglhNnlSkVa47aN1OlKCTM+XfBWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163740; c=relaxed/simple;
	bh=WWOcicKrpxNfbp73YQvXRS9gUlVsg144+RLaaRiEoQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mLSQkV6vT0pPagWFXBw2r3fNwvyxrJr4clQ0YdS4XoljnbP1wySz58q7RphXV4Ew4Krjvs8jJDT/hbIA/u57GABgV2m69qnGDFxiI/l1a6hPGB6P+cvN6yVGjJJM6SyQUF4TXZqKVy28zXt0bT9ZWuQfG6tgAjmH8wMSAzs0pjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mib+Dgy9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mib+Dgy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790163732; x=1821699732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWOcicKrpxNfbp73YQvXRS9gUlVsg144+RLaaRiEoQ8=;
  b=mib+Dgy90Au/FGpwruZ0n3KPLFUQ7nl3BA36rnxc8g7SseQ3QNR2J+yH
   Cu0ek775O30JyXwOvbANOnOaDfLlNmsC61P6YGaDz5+YBjRPvszqEOKe3
   ByIvhrGNwjouZPGqfEazsuj0PM6yj0M+G7Xia0CeZLwK2wFN1+mz86Rdf
   C/X/80sEbUYErAWrkLMLs4yWtVCCtvpWihI5gDx3D9KHuBCu049gjY45a
   u9KSkb/o6rOSorSHD4Ts6ncw6P3+Id37/HjCLG0picM5qX+ysbiFoDcCb
   hFhY8wUiwn7iTROT6bsjotCP4++VYzyqfMsl+cMlIVr6EqS427m8J5FIN
   g==;
X-CSE-ConnectionGUID: OTnHVsMmSMCjXh1HQoAJJw==
X-CSE-MsgGUID: KQW1FKC1TJSZWItFslA5qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="116371359"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="116371359"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 04:42:04 -0700
X-CSE-ConnectionGUID: qyeXoVSRR2aSx2/ja/vQ9A==
X-CSE-MsgGUID: aHYzRJ3/QSavZ6usSSqH5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="301488655"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2026 04:42:02 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9LMM-000000000dd-2m20;
	Wed, 23 Sep 2026 11:41:58 +0000
Date: Wed, 23 Sep 2026 13:41:56 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 59/67]
 lib/test_bonsai_tree.c:1012:15: error: implicit declaration of function
 'jump_label_export_bonsai_tree'; did you mean 'extable_export_bonsai_tree'?
Message-ID: <202609231353.0yyIe9nF-lkp@intel.com>
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
commit: 4da770c0da4d19c83490a6cac464615ec913da10 [59/67] kernel/jump_label: Accelerate jump label text reservation with Bonsai Tree
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260923/202609231353.0yyIe9nF-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231353.0yyIe9nF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231353.0yyIe9nF-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_bonsai_tree.c: In function 'test_bonsai_live_jump_label':
>> lib/test_bonsai_tree.c:1012:15: error: implicit declaration of function 'jump_label_export_bonsai_tree'; did you mean 'extable_export_bonsai_tree'? [-Wimplicit-function-declaration]
    1012 |         ret = jump_label_export_bonsai_tree(&bt, &start, &count);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               extable_export_bonsai_tree
>> lib/test_bonsai_tree.c:1019:46: error: invalid use of undefined type 'struct jump_entry'
    1019 |                 struct jump_entry *e = &start[i];
         |                                              ^
>> lib/test_bonsai_tree.c:1020:38: error: implicit declaration of function 'jump_entry_code' [-Wimplicit-function-declaration]
    1020 |                 unsigned long code = jump_entry_code(e);
         |                                      ^~~~~~~~~~~~~~~
   lib/test_bonsai_tree.c:1034:46: error: invalid use of undefined type 'struct jump_entry'
    1034 |                 struct jump_entry *e = &start[i];
         |                                              ^
>> lib/test_bonsai_tree.c:1038:22: error: implicit declaration of function 'jump_entry_is_init' [-Wimplicit-function-declaration]
    1038 |                 if (!jump_entry_is_init(e)) {
         |                      ^~~~~~~~~~~~~~~~~~
>> lib/test_bonsai_tree.c:1039:34: error: implicit declaration of function 'jump_entry_size' [-Wimplicit-function-declaration]
    1039 |                         int sz = jump_entry_size(e);
         |                                  ^~~~~~~~~~~~~~~
   lib/test_bonsai_tree.c:1059:46: error: invalid use of undefined type 'struct jump_entry'
    1059 |                 if (jump_entry_is_init(&start[i]))
         |                                              ^
   lib/test_bonsai_tree.c:1062:47: error: invalid use of undefined type 'struct jump_entry'
    1062 |                 bogus = jump_entry_code(&start[i]) - 1;
         |                                               ^
   lib/test_bonsai_tree.c:1066:55: error: invalid use of undefined type 'struct jump_entry'
    1066 |                         if (!jump_entry_is_init(&start[j])) {
         |                                                       ^
   lib/test_bonsai_tree.c:1067:73: error: invalid use of undefined type 'struct jump_entry'
    1067 |                                 unsigned long s = jump_entry_code(&start[j]);
         |                                                                         ^
   lib/test_bonsai_tree.c:1068:64: error: invalid use of undefined type 'struct jump_entry'
    1068 |                                 int sz = jump_entry_size(&start[j]);
         |                                                                ^
   lib/test_bonsai_tree.c: In function 'bench_live_jump_label':
   lib/test_bonsai_tree.c:1122:54: error: invalid use of undefined type 'struct jump_entry'
    1122 |                 rnd_codes[i] = jump_entry_code(&start[idx]);
         |                                                      ^
   lib/test_bonsai_tree.c:1130:57: error: invalid use of undefined type 'struct jump_entry'
    1130 |                 unsigned long s = jump_entry_code(&start[i]);
         |                                                         ^
   lib/test_bonsai_tree.c:1131:51: error: invalid use of undefined type 'struct jump_entry'
    1131 |                 int sz = jump_entry_is_init(&start[i]) ? 5 : jump_entry_size(&start[i]);
         |                                                   ^
   lib/test_bonsai_tree.c:1131:84: error: invalid use of undefined type 'struct jump_entry'
    1131 |                 int sz = jump_entry_is_init(&start[i]) ? 5 : jump_entry_size(&start[i]);
         |                                                                                    ^
   lib/test_bonsai_tree.c:1133:67: error: invalid use of undefined type 'struct jump_entry'
    1133 |                 bonsai_store_range(&bt_bench, s, e, (void *)&start[i], GFP_KERNEL);
         |                                                                   ^
   lib/test_bonsai_tree.c:1142:57: error: invalid use of undefined type 'struct jump_entry'
    1142 |                 unsigned long s = jump_entry_code(&start[i]);
         |                                                         ^
   lib/test_bonsai_tree.c:1143:51: error: invalid use of undefined type 'struct jump_entry'
    1143 |                 int sz = jump_entry_is_init(&start[i]) ? 5 : jump_entry_size(&start[i]);
         |                                                   ^
   lib/test_bonsai_tree.c:1143:84: error: invalid use of undefined type 'struct jump_entry'
    1143 |                 int sz = jump_entry_is_init(&start[i]) ? 5 : jump_entry_size(&start[i]);
         |                                                                                    ^
   lib/test_bonsai_tree.c:1145:66: error: invalid use of undefined type 'struct jump_entry'
    1145 |                 mtree_store_range(&mt_bench, s, e, (void *)&start[i], GFP_KERNEL);
         |                                                                  ^
   lib/test_bonsai_tree.c:1153:60: error: invalid use of undefined type 'struct jump_entry'
    1153 |                 unsigned long code = jump_entry_code(&start[i % count]);
         |                                                            ^
   lib/test_bonsai_tree.c:1156:65: error: invalid use of undefined type 'struct jump_entry'
    1156 |                         unsigned long s = jump_entry_code(&start[j]);
         |                                                                 ^
   lib/test_bonsai_tree.c:1157:59: error: invalid use of undefined type 'struct jump_entry'
    1157 |                         int sz = jump_entry_is_init(&start[j]) ? 5 : jump_entry_size(&start[j]);
         |                                                           ^
   lib/test_bonsai_tree.c:1157:92: error: invalid use of undefined type 'struct jump_entry'
    1157 |                         int sz = jump_entry_is_init(&start[j]) ? 5 : jump_entry_size(&start[j]);
         |                                                                                            ^
   lib/test_bonsai_tree.c:1160:46: error: invalid use of undefined type 'struct jump_entry'
    1160 |                                 sink = &start[j];
         |                                              ^
   lib/test_bonsai_tree.c:1171:60: error: invalid use of undefined type 'struct jump_entry'
    1171 |                 unsigned long code = jump_entry_code(&start[i % count]);
         |                                                            ^
   lib/test_bonsai_tree.c:1180:60: error: invalid use of undefined type 'struct jump_entry'
    1180 |                 unsigned long code = jump_entry_code(&start[i % count]);
         |                                                            ^
   lib/test_bonsai_tree.c:1193:65: error: invalid use of undefined type 'struct jump_entry'
    1193 |                         unsigned long s = jump_entry_code(&start[j]);
         |                                                                 ^
   lib/test_bonsai_tree.c:1194:59: error: invalid use of undefined type 'struct jump_entry'
    1194 |                         int sz = jump_entry_is_init(&start[j]) ? 5 : jump_entry_size(&start[j]);
         |                                                           ^
   lib/test_bonsai_tree.c:1194:92: error: invalid use of undefined type 'struct jump_entry'
    1194 |                         int sz = jump_entry_is_init(&start[j]) ? 5 : jump_entry_size(&start[j]);
         |                                                                                            ^
   lib/test_bonsai_tree.c:1197:46: error: invalid use of undefined type 'struct jump_entry'
    1197 |                                 sink = &start[j];
         |                                              ^
   In file included from include/asm-generic/bug.h:31,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from lib/test_bonsai_tree.c:13:
>> lib/test_bonsai_tree.c:1240:32: error: invalid application of 'sizeof' to incomplete type 'struct jump_entry'
    1240 |                 count * sizeof(struct jump_entry),
         |                                ^~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   lib/test_bonsai_tree.c:1239:9: note: in expansion of macro 'pr_info'
    1239 |         pr_info("  Memory   : Flat=%zu B | Maple=~%zu B | Bonsai=%zu B (nodes=%u, h=%u)\n",
         |         ^~~~~~~


vim +1012 lib/test_bonsai_tree.c

  1004	
  1005	static int test_bonsai_live_jump_label(void)
  1006	{
  1007		struct bonsai_tree *bt = NULL;
  1008		struct jump_entry *start = NULL;
  1009		size_t count = 0, i, errs = 0;
  1010		int ret;
  1011	
> 1012		ret = jump_label_export_bonsai_tree(&bt, &start, &count);
  1013		if (ret || !bt || !bt->root_idx || !start || !count) {
  1014			pr_err("live jump_label test: tree not exported or empty (ret=%d)\n", ret);
  1015			return ret ? ret : -ENODATA;
  1016		}
  1017	
  1018		for (i = 0; i < count; i++) {
> 1019			struct jump_entry *e = &start[i];
> 1020			unsigned long code = jump_entry_code(e);
  1021			struct jump_entry *found_bt;
  1022	
  1023			found_bt = bonsai_lookup(bt, code);
  1024			if (found_bt != e) {
  1025				if (errs < 5)
  1026					pr_err("jump_label match error slot %zu code=0x%lx: exp=%p bt=%p\n",
  1027					       i, code, e, found_bt);
  1028				errs++;
  1029			}
  1030		}
  1031	
  1032		/* Mid-range lookup (skip init entries whose memory was freed after boot) */
  1033		for (i = 0; i < count; i++) {
  1034			struct jump_entry *e = &start[i];
  1035			unsigned long code = jump_entry_code(e);
  1036			struct jump_entry *found_bt;
  1037	
> 1038			if (!jump_entry_is_init(e)) {
> 1039				int sz = jump_entry_size(e);
  1040	
  1041				if (sz > 1) {
  1042					found_bt = bonsai_lookup(bt, code + 1);
  1043					if (found_bt != e) {
  1044						if (errs < 5)
  1045							pr_err("jump_label mid-range match error slot %zu code=0x%lx+1: exp=%p bt=%p\n",
  1046							       i, code, e, found_bt);
  1047						errs++;
  1048					}
  1049				}
  1050			}
  1051		}
  1052	
  1053		/* Negative probe: compare bonsai-accelerated text_reserved against linear scan */
  1054		for (i = 0; i < min_t(size_t, count, 200); i++) {
  1055			unsigned long bogus;
  1056			int res_bt, res_lin = 0;
  1057			size_t j;
  1058	
  1059			if (jump_entry_is_init(&start[i]))
  1060				continue;
  1061	
  1062			bogus = jump_entry_code(&start[i]) - 1;
  1063			res_bt = jump_label_text_reserved((void *)bogus, (void *)bogus);
  1064	
  1065			for (j = 0; j < count; j++) {
  1066				if (!jump_entry_is_init(&start[j])) {
  1067					unsigned long s = jump_entry_code(&start[j]);
  1068					int sz = jump_entry_size(&start[j]);
  1069	
  1070					if (bogus >= s && bogus < s + sz) {
  1071						res_lin = 1;
  1072						break;
  1073					}
  1074				}
  1075			}
  1076	
  1077			if (res_bt != res_lin) {
  1078				if (errs < 5)
  1079					pr_err("jump_label negative probe mismatch addr=0x%lx: bt=%d lin=%d\n",
  1080					       bogus, res_bt, res_lin);
  1081				errs++;
  1082			}
  1083		}
  1084	
  1085		if (errs) {
  1086			pr_err("live jump_label test: FAIL (%zu errors over %zu entries)\n", errs, count);
  1087			return -EINVAL;
  1088		}
  1089	
  1090		pr_info("live jump_label test (%zu entries, height %u, %u nodes): PASS\n",
  1091			count, bt->height, bt->node_count);
  1092		return 0;
  1093	}
  1094	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
