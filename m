Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019EB4ADD8C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346764; cv=none; b=jSDnnEZoXFvw1YHbS7/RYy1gWgG6kU7QLeptlLH3WCgZRlJgkCDDl5XNiSWAYC6rQOSGmDZfzccAGXh6f1SPhZnkB4XTI+F6y1XoNTqTkEc1Q6BZ/jVdjoN8xWASoiU9cjXu7FhLyDEX+k4AQIqZJ1xyQlXmPloXPZiKQ4zpbPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346764; c=relaxed/simple;
	bh=zFm5w0KhZAvockOf0bnFegJecbwadcCJT7gWioRlGGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UpMsq0pErbPUeEaDLbTQipJzbWPUV+O9+BG9ELs2lQ3DkH7eFzWX0hn8CU17CpRlahNSYPqOvazkOAEtNeQ4Zv2CzPlVa0rNPD+XQa5GGUsTzSzUeYopIcFq9S6RL6qDifasfoNPykZneAmQlyR0/mvAfJTvbtbcD+Wh5UnxliA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4a09xbq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4a09xbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790346759; x=1821882759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zFm5w0KhZAvockOf0bnFegJecbwadcCJT7gWioRlGGw=;
  b=J4a09xbqN4AeyygNmvfu7heCC2Itbg4+s3ZKmmE7rADf2K9BLkB/Pfqm
   5viToEJjfoBBZuTk4bBg0SlyVXRT6aQdn38pWlkMXqHzmDIcxi1wMRC/H
   LGcTSraQANGbI8g3FqdSFVRsxE06MU9OTobLcKqgYa7Kq/gh78MqVSlXk
   xk78//dW0kDe5gRdBTm1lfVFNTgcBjt7CTc96izgL+rvCSA/TPwO8H5qo
   UeIK4PlABpo/LhjOXcqKH0m43U5zfNvHUxim5WU0kn/gcj4TtJT5xgGiS
   6CKVsYK/uOpK9BHUFC5gwCFLIa0Y0kmM3C6n4vmN5AgI5/oMNuST0tLvm
   Q==;
X-CSE-ConnectionGUID: 0IhoY83tS6++azwHpRQDyQ==
X-CSE-MsgGUID: BvA9gPahR0mhc7KtFQoQ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93850655"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93850655"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:32:26 -0700
X-CSE-ConnectionGUID: kUFxJYQwTjGvTF64upG93g==
X-CSE-MsgGUID: bfM73vH3Q62pCj+ZvUhzrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="300624219"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2026 07:32:25 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA6yM-00000000Kkw-2cFQ;
	Fri, 25 Sep 2026 14:32:22 +0000
Date: Fri, 25 Sep 2026 22:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 60/67]
 lib/test_bonsai_tree.c:1096:19: error: no member named 'num_jump_entries' in
 'struct module'
Message-ID: <202609252227.r2TrlJwY-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260925/202609252227.r2TrlJwY-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252227.r2TrlJwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252227.r2TrlJwY-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_bonsai_tree.c:1022:8: error: call to undeclared function 'jump_label_export_bonsai_tree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1022 |         ret = jump_label_export_bonsai_tree(&bt, &start, &count);
         |               ^
   lib/test_bonsai_tree.c:1022:8: note: did you mean 'extable_export_bonsai_tree'?
   include/linux/extable.h:49:5: note: 'extable_export_bonsai_tree' declared here
      49 | int extable_export_bonsai_tree(struct bonsai_tree **bt,
         |     ^
   lib/test_bonsai_tree.c:1029:32: error: subscript of pointer to incomplete type 'struct jump_entry'
    1029 |                 struct jump_entry *e = &start[i];
         |                                         ~~~~~^
   lib/test_bonsai_tree.c:1016:9: note: forward declaration of 'struct jump_entry'
    1016 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1030:24: error: call to undeclared function 'jump_entry_code'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1030 |                 unsigned long code = jump_entry_code(e);
         |                                      ^
   lib/test_bonsai_tree.c:1044:32: error: subscript of pointer to incomplete type 'struct jump_entry'
    1044 |                 struct jump_entry *e = &start[i];
         |                                         ~~~~~^
   lib/test_bonsai_tree.c:1016:9: note: forward declaration of 'struct jump_entry'
    1016 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1045:24: error: call to undeclared function 'jump_entry_code'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1045 |                 unsigned long code = jump_entry_code(e);
         |                                      ^
   lib/test_bonsai_tree.c:1048:8: error: call to undeclared function 'jump_entry_is_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1048 |                 if (!jump_entry_is_init(e)) {
         |                      ^
   lib/test_bonsai_tree.c:1049:13: error: call to undeclared function 'jump_entry_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1049 |                         int sz = jump_entry_size(e);
         |                                  ^
   lib/test_bonsai_tree.c:1069:7: error: call to undeclared function 'jump_entry_is_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1069 |                 if (jump_entry_is_init(&start[i]))
         |                     ^
   lib/test_bonsai_tree.c:1069:32: error: subscript of pointer to incomplete type 'struct jump_entry'
    1069 |                 if (jump_entry_is_init(&start[i]))
         |                                         ~~~~~^
   lib/test_bonsai_tree.c:1016:9: note: forward declaration of 'struct jump_entry'
    1016 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1072:11: error: call to undeclared function 'jump_entry_code'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1072 |                 bogus = jump_entry_code(&start[i]) - 1;
         |                         ^
   lib/test_bonsai_tree.c:1072:33: error: subscript of pointer to incomplete type 'struct jump_entry'
    1072 |                 bogus = jump_entry_code(&start[i]) - 1;
         |                                          ~~~~~^
   lib/test_bonsai_tree.c:1016:9: note: forward declaration of 'struct jump_entry'
    1016 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1076:34: error: subscript of pointer to incomplete type 'struct jump_entry'
    1076 |                         if (!jump_entry_is_init(&start[j])) {
         |                                                  ~~~~~^
   lib/test_bonsai_tree.c:1016:9: note: forward declaration of 'struct jump_entry'
    1016 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1077:45: error: subscript of pointer to incomplete type 'struct jump_entry'
    1077 |                                 unsigned long s = jump_entry_code(&start[j]);
         |                                                                    ~~~~~^
   lib/test_bonsai_tree.c:1016:9: note: forward declaration of 'struct jump_entry'
    1016 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1078:14: error: call to undeclared function 'jump_entry_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1078 |                                 int sz = jump_entry_size(&start[j]);
         |                                          ^
   lib/test_bonsai_tree.c:1078:36: error: subscript of pointer to incomplete type 'struct jump_entry'
    1078 |                                 int sz = jump_entry_size(&start[j]);
         |                                                           ~~~~~^
   lib/test_bonsai_tree.c:1016:9: note: forward declaration of 'struct jump_entry'
    1016 |         struct jump_entry *start = NULL;
         |                ^
>> lib/test_bonsai_tree.c:1096:19: error: no member named 'num_jump_entries' in 'struct module'
    1096 |         if (THIS_MODULE->num_jump_entries) {
         |             ~~~~~~~~~~~  ^
>> lib/test_bonsai_tree.c:1097:40: error: no member named 'jump_entries' in 'struct module'
    1097 |                 struct jump_entry *me = THIS_MODULE->jump_entries;
         |                                         ~~~~~~~~~~~  ^
   lib/test_bonsai_tree.c:1098:32: error: no member named 'num_jump_entries' in 'struct module'
    1098 |                 size_t mcount = THIS_MODULE->num_jump_entries;
         |                                 ~~~~~~~~~~~  ^
>> lib/test_bonsai_tree.c:1099:43: error: no member named 'jump_tree' in 'struct module'
    1099 |                 struct bonsai_tree *mbt = &THIS_MODULE->jump_tree;
         |                                            ~~~~~~~~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


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
