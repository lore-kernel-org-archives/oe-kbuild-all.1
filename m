Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE79F515965
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166273; cv=none; b=P7IQ/WMksix7PghHTtWwnmFrifAlD5kZBTK5kfTvqNy/lT3x2w55XYLyXEmo1Hq+qdHwXic18U3QONh4SXukczgDpFRcxVRvBct3CPqh1nEqr92q1XgHE0EfkedUi4BGW4uTHG1rCWxA/wzyb+4ZPmy/Ge+fwlWqeFbffCdNe7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166273; c=relaxed/simple;
	bh=1TGP+lmPrCowqoo+NJsiuVU7JVrVBIDLZS00oW8OQLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NX4VgO+YAlZtnJT3NnYUv/bOyhwT3T37INDRmjR1I1f/BBirUBmUNoqcpst2LyOVVOC5dgI5xAuaQubYK1gnucmu3vG917ABg1z7Zh0eHzVMqeynazCzrW82O95qLUATEfw3GKlIa8ChobFWX+8t9Sc2kSWVfssOw+bnDJ0cDoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZVTzCcN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZVTzCcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790166269; x=1821702269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1TGP+lmPrCowqoo+NJsiuVU7JVrVBIDLZS00oW8OQLo=;
  b=JZVTzCcNSo0P0J5hIdTSZDs5xBKOcAQP9nbRsBW1sOG2gePmMFAdNphL
   ohURe6n5uPZTAoGSxnqzTMnILsTD1K15OcV+TDdID0lOw1l5lXdcdSBC4
   c0kE1NJgGM0MIMu/fYQBXZ/1uAHX8vQzTM1v+00MlRoIVsRM2a9l0WB24
   100/9wUqUFkZCxzhuqTwMiQxVfqZf6J2waJ4sALjRsrHtpQFZjLsEZqQB
   sLnrxOEJmGFKtQjEUsi8utaibc8ZJ2Pm/qRuSRbJcfH8bog8AlK8SEv5N
   x2Ymw03VCOc1sN2Paacfix/V3sunv5Aa2JCf6TqyTk8tPlISEAwbHBndF
   w==;
X-CSE-ConnectionGUID: tdy1q3PpQzqY4yfd7a42HA==
X-CSE-MsgGUID: Nq5gswLjTDmsPpFfbHW03w==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90877836"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90877836"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:24:24 -0700
X-CSE-ConnectionGUID: uqwr30a/TLahnp99cv0bDg==
X-CSE-MsgGUID: +R2T8o2zSyi8MBKfqUvdyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="281660574"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2026 05:24:22 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9M1M-000000000ff-31ay;
	Wed, 23 Sep 2026 12:24:20 +0000
Date: Wed, 23 Sep 2026 14:23:20 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 60/67]
 lib/test_bonsai_tree.c:1096:26: error: 'struct module' has no member named
 'num_jump_entries'; did you mean 'num_exentries'?
Message-ID: <202609231457.9w3NKBuk-lkp@intel.com>
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
commit: ea1ef3eda16a25ba9bacade28d00c9e4b2812a5b [60/67] kernel/jump_label: Ingest modular jump tables into per-module Bonsai trees
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260923/202609231457.9w3NKBuk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231457.9w3NKBuk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231457.9w3NKBuk-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_bonsai_tree.c: In function 'test_bonsai_live_jump_label':
   lib/test_bonsai_tree.c:1022:15: error: implicit declaration of function 'jump_label_export_bonsai_tree'; did you mean 'extable_export_bonsai_tree'? [-Wimplicit-function-declaration]
    1022 |         ret = jump_label_export_bonsai_tree(&bt, &start, &count);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               extable_export_bonsai_tree
   lib/test_bonsai_tree.c:1029:46: error: invalid use of undefined type 'struct jump_entry'
    1029 |                 struct jump_entry *e = &start[i];
         |                                              ^
   lib/test_bonsai_tree.c:1030:38: error: implicit declaration of function 'jump_entry_code' [-Wimplicit-function-declaration]
    1030 |                 unsigned long code = jump_entry_code(e);
         |                                      ^~~~~~~~~~~~~~~
   lib/test_bonsai_tree.c:1044:46: error: invalid use of undefined type 'struct jump_entry'
    1044 |                 struct jump_entry *e = &start[i];
         |                                              ^
   lib/test_bonsai_tree.c:1048:22: error: implicit declaration of function 'jump_entry_is_init' [-Wimplicit-function-declaration]
    1048 |                 if (!jump_entry_is_init(e)) {
         |                      ^~~~~~~~~~~~~~~~~~
   lib/test_bonsai_tree.c:1049:34: error: implicit declaration of function 'jump_entry_size' [-Wimplicit-function-declaration]
    1049 |                         int sz = jump_entry_size(e);
         |                                  ^~~~~~~~~~~~~~~
   lib/test_bonsai_tree.c:1069:46: error: invalid use of undefined type 'struct jump_entry'
    1069 |                 if (jump_entry_is_init(&start[i]))
         |                                              ^
   lib/test_bonsai_tree.c:1072:47: error: invalid use of undefined type 'struct jump_entry'
    1072 |                 bogus = jump_entry_code(&start[i]) - 1;
         |                                               ^
   lib/test_bonsai_tree.c:1076:55: error: invalid use of undefined type 'struct jump_entry'
    1076 |                         if (!jump_entry_is_init(&start[j])) {
         |                                                       ^
   lib/test_bonsai_tree.c:1077:73: error: invalid use of undefined type 'struct jump_entry'
    1077 |                                 unsigned long s = jump_entry_code(&start[j]);
         |                                                                         ^
   lib/test_bonsai_tree.c:1078:64: error: invalid use of undefined type 'struct jump_entry'
    1078 |                                 int sz = jump_entry_size(&start[j]);
         |                                                                ^
>> lib/test_bonsai_tree.c:1096:26: error: 'struct module' has no member named 'num_jump_entries'; did you mean 'num_exentries'?
    1096 |         if (THIS_MODULE->num_jump_entries) {
         |                          ^~~~~~~~~~~~~~~~
         |                          num_exentries
>> lib/test_bonsai_tree.c:1097:54: error: 'struct module' has no member named 'jump_entries'; did you mean 'num_exentries'?
    1097 |                 struct jump_entry *me = THIS_MODULE->jump_entries;
         |                                                      ^~~~~~~~~~~~
         |                                                      num_exentries
   lib/test_bonsai_tree.c:1098:46: error: 'struct module' has no member named 'num_jump_entries'; did you mean 'num_exentries'?
    1098 |                 size_t mcount = THIS_MODULE->num_jump_entries;
         |                                              ^~~~~~~~~~~~~~~~
         |                                              num_exentries
>> lib/test_bonsai_tree.c:1099:55: error: 'struct module' has no member named 'jump_tree'
    1099 |                 struct bonsai_tree *mbt = &THIS_MODULE->jump_tree;
         |                                                       ^~
   lib/test_bonsai_tree.c:1106:73: error: invalid use of undefined type 'struct jump_entry'
    1106 |                                 unsigned long code = jump_entry_code(&me[i]);
         |                                                                         ^
   lib/test_bonsai_tree.c:1110:49: error: invalid use of undefined type 'struct jump_entry'
    1110 |                                 if (found != &me[i]) {
         |                                                 ^
   lib/test_bonsai_tree.c: In function 'bench_live_jump_label':
   lib/test_bonsai_tree.c:1164:54: error: invalid use of undefined type 'struct jump_entry'
    1164 |                 rnd_codes[i] = jump_entry_code(&start[idx]);
         |                                                      ^
   lib/test_bonsai_tree.c:1172:57: error: invalid use of undefined type 'struct jump_entry'
    1172 |                 unsigned long s = jump_entry_code(&start[i]);
         |                                                         ^
   lib/test_bonsai_tree.c:1173:51: error: invalid use of undefined type 'struct jump_entry'
    1173 |                 int sz = jump_entry_is_init(&start[i]) ? 5 : jump_entry_size(&start[i]);
         |                                                   ^
   lib/test_bonsai_tree.c:1173:84: error: invalid use of undefined type 'struct jump_entry'
    1173 |                 int sz = jump_entry_is_init(&start[i]) ? 5 : jump_entry_size(&start[i]);
         |                                                                                    ^
   lib/test_bonsai_tree.c:1175:67: error: invalid use of undefined type 'struct jump_entry'
    1175 |                 bonsai_store_range(&bt_bench, s, e, (void *)&start[i], GFP_KERNEL);
         |                                                                   ^
   lib/test_bonsai_tree.c:1184:57: error: invalid use of undefined type 'struct jump_entry'
    1184 |                 unsigned long s = jump_entry_code(&start[i]);
         |                                                         ^
   lib/test_bonsai_tree.c:1185:51: error: invalid use of undefined type 'struct jump_entry'
    1185 |                 int sz = jump_entry_is_init(&start[i]) ? 5 : jump_entry_size(&start[i]);
         |                                                   ^
   lib/test_bonsai_tree.c:1185:84: error: invalid use of undefined type 'struct jump_entry'
    1185 |                 int sz = jump_entry_is_init(&start[i]) ? 5 : jump_entry_size(&start[i]);
         |                                                                                    ^
   lib/test_bonsai_tree.c:1187:66: error: invalid use of undefined type 'struct jump_entry'
    1187 |                 mtree_store_range(&mt_bench, s, e, (void *)&start[i], GFP_KERNEL);
         |                                                                  ^
   lib/test_bonsai_tree.c:1195:60: error: invalid use of undefined type 'struct jump_entry'
    1195 |                 unsigned long code = jump_entry_code(&start[i % count]);
         |                                                            ^
   lib/test_bonsai_tree.c:1198:65: error: invalid use of undefined type 'struct jump_entry'
    1198 |                         unsigned long s = jump_entry_code(&start[j]);
         |                                                                 ^
   lib/test_bonsai_tree.c:1199:59: error: invalid use of undefined type 'struct jump_entry'
    1199 |                         int sz = jump_entry_is_init(&start[j]) ? 5 : jump_entry_size(&start[j]);
         |                                                           ^
   lib/test_bonsai_tree.c:1199:92: error: invalid use of undefined type 'struct jump_entry'
    1199 |                         int sz = jump_entry_is_init(&start[j]) ? 5 : jump_entry_size(&start[j]);
         |                                                                                            ^
   lib/test_bonsai_tree.c:1202:46: error: invalid use of undefined type 'struct jump_entry'
    1202 |                                 sink = &start[j];
         |                                              ^
   lib/test_bonsai_tree.c:1213:60: error: invalid use of undefined type 'struct jump_entry'
    1213 |                 unsigned long code = jump_entry_code(&start[i % count]);
         |                                                            ^
   lib/test_bonsai_tree.c:1222:60: error: invalid use of undefined type 'struct jump_entry'
    1222 |                 unsigned long code = jump_entry_code(&start[i % count]);
         |                                                            ^
   lib/test_bonsai_tree.c:1235:65: error: invalid use of undefined type 'struct jump_entry'
    1235 |                         unsigned long s = jump_entry_code(&start[j]);
         |                                                                 ^
   lib/test_bonsai_tree.c:1236:59: error: invalid use of undefined type 'struct jump_entry'
    1236 |                         int sz = jump_entry_is_init(&start[j]) ? 5 : jump_entry_size(&start[j]);
         |                                                           ^
   lib/test_bonsai_tree.c:1236:92: error: invalid use of undefined type 'struct jump_entry'
    1236 |                         int sz = jump_entry_is_init(&start[j]) ? 5 : jump_entry_size(&start[j]);
         |                                                                                            ^
   lib/test_bonsai_tree.c:1239:46: error: invalid use of undefined type 'struct jump_entry'
    1239 |                                 sink = &start[j];
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
   lib/test_bonsai_tree.c:1282:32: error: invalid application of 'sizeof' to incomplete type 'struct jump_entry'
    1282 |                 count * sizeof(struct jump_entry),
         |                                ^~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   lib/test_bonsai_tree.c:1281:9: note: in expansion of macro 'pr_info'
    1281 |         pr_info("  Memory   : Flat=%zu B | Maple=~%zu B | Bonsai=%zu B (nodes=%u, h=%u)\n",
         |         ^~~~~~~


vim +1096 lib/test_bonsai_tree.c

  1012	
  1013	static int test_bonsai_live_jump_label(void)
  1014	{
  1015		struct bonsai_tree *bt = NULL;
  1016		struct jump_entry *start = NULL;
  1017		size_t count = 0, i, errs = 0;
  1018		int ret;
  1019	
  1020		test_bonsai_dummy_branch();
  1021	
  1022		ret = jump_label_export_bonsai_tree(&bt, &start, &count);
  1023		if (ret || !bt || !bt->root_idx || !start || !count) {
  1024			pr_err("live jump_label test: tree not exported or empty (ret=%d)\n", ret);
  1025			return ret ? ret : -ENODATA;
  1026		}
  1027	
  1028		for (i = 0; i < count; i++) {
  1029			struct jump_entry *e = &start[i];
  1030			unsigned long code = jump_entry_code(e);
  1031			struct jump_entry *found_bt;
  1032	
  1033			found_bt = bonsai_lookup(bt, code);
  1034			if (found_bt != e) {
  1035				if (errs < 5)
  1036					pr_err("jump_label match error slot %zu code=0x%lx: exp=%p bt=%p\n",
  1037					       i, code, e, found_bt);
  1038				errs++;
  1039			}
  1040		}
  1041	
  1042		/* Mid-range lookup (skip init entries whose memory was freed after boot) */
  1043		for (i = 0; i < count; i++) {
  1044			struct jump_entry *e = &start[i];
  1045			unsigned long code = jump_entry_code(e);
  1046			struct jump_entry *found_bt;
  1047	
  1048			if (!jump_entry_is_init(e)) {
  1049				int sz = jump_entry_size(e);
  1050	
  1051				if (sz > 1) {
  1052					found_bt = bonsai_lookup(bt, code + 1);
  1053					if (found_bt != e) {
  1054						if (errs < 5)
  1055							pr_err("jump_label mid-range match error slot %zu code=0x%lx+1: exp=%p bt=%p\n",
  1056							       i, code, e, found_bt);
  1057						errs++;
  1058					}
  1059				}
  1060			}
  1061		}
  1062	
  1063		/* Negative probe: compare bonsai-accelerated text_reserved against linear scan */
  1064		for (i = 0; i < min_t(size_t, count, 200); i++) {
  1065			unsigned long bogus;
  1066			int res_bt, res_lin = 0;
  1067			size_t j;
  1068	
  1069			if (jump_entry_is_init(&start[i]))
  1070				continue;
  1071	
  1072			bogus = jump_entry_code(&start[i]) - 1;
  1073			res_bt = jump_label_text_reserved((void *)bogus, (void *)bogus);
  1074	
  1075			for (j = 0; j < count; j++) {
  1076				if (!jump_entry_is_init(&start[j])) {
  1077					unsigned long s = jump_entry_code(&start[j]);
  1078					int sz = jump_entry_size(&start[j]);
  1079	
  1080					if (bogus >= s && bogus < s + sz) {
  1081						res_lin = 1;
  1082						break;
  1083					}
  1084				}
  1085			}
  1086	
  1087			if (res_bt != res_lin) {
  1088				if (errs < 5)
  1089					pr_err("jump_label negative probe mismatch addr=0x%lx: bt=%d lin=%d\n",
  1090					       bogus, res_bt, res_lin);
  1091				errs++;
  1092			}
  1093		}
  1094	
  1095	#if defined(CONFIG_MODULES) && defined(MODULE)
> 1096		if (THIS_MODULE->num_jump_entries) {
> 1097			struct jump_entry *me = THIS_MODULE->jump_entries;
  1098			size_t mcount = THIS_MODULE->num_jump_entries;
> 1099			struct bonsai_tree *mbt = &THIS_MODULE->jump_tree;
  1100	
  1101			if (!mbt->root_idx) {
  1102				pr_err("live jump_label module test: THIS_MODULE tree empty\n");
  1103				errs++;
  1104			} else {
  1105				for (i = 0; i < mcount; i++) {
  1106					unsigned long code = jump_entry_code(&me[i]);
  1107					struct jump_entry *found = bonsai_lookup(mbt, code);
  1108					int res;
  1109	
  1110					if (found != &me[i]) {
  1111						pr_err("module jump_label match error slot %zu code=0x%lx\n", i, code);
  1112						errs++;
  1113					}
  1114	
  1115					res = jump_label_text_reserved((void *)code, (void *)code);
  1116					if (res != 1) {
  1117						pr_err("module jump_label text_reserved failed (res=%d) at 0x%lx\n",
  1118						       res, code);
  1119						errs++;
  1120					}
  1121				}
  1122				pr_info("live module jump_label test (%zu entries): PASS\n", mcount);
  1123			}
  1124		}
  1125	#endif
  1126	
  1127		if (errs) {
  1128			pr_err("live jump_label test: FAIL (%zu errors over %zu entries)\n", errs, count);
  1129			return -EINVAL;
  1130		}
  1131	
  1132		pr_info("live jump_label test (%zu entries, height %u, %u nodes): PASS\n",
  1133			count, bt->height, bt->node_count);
  1134		return 0;
  1135	}
  1136	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
