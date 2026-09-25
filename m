Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC72367F58
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334717; cv=none; b=qD0WTbIv/Cavng7PNlb6QdH9iBsJZPvzWcPAJdtkCCjEIGz2hoT2pmn2idg4MrHpkxNmjgV9Hh/pUzpcrCxCeY7q1Q34BG0+krKTDdaMGuxf74maw9tEWMQ6mjg7n0PriYh/zHK4Y6aPNAkTIVzq+AyiXOF5yY9AvpgkvYkGP8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334717; c=relaxed/simple;
	bh=zhY3VnY4uOoAzdDYMc/gNGeZdX3ArDMtvKaV08IpJU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U7sDd14t5JUHsk1wHzPr14r3xoKkr/M5cfIzQ21IGTXyoxT9AkZuzpqTSr5d9P6OylfIrU3MkdpU0MYL9D24I7TZ5KQEt2Yd0bTU9rnImRj+Ilz/2cI1GQSISeJG8/vya2bDi5wxgvsyD67sm+EMtaxNqiZ/pq+5IvwI0QkXD5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvIHrCnP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvIHrCnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790334716; x=1821870716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zhY3VnY4uOoAzdDYMc/gNGeZdX3ArDMtvKaV08IpJU0=;
  b=YvIHrCnPlEXhfHdLXL6SAEeRYAZGvV5Zz0hao9nhObIxXKvVv9++FCqw
   QbqH/3z/l7ymTI7MeRly3HLEnHjfpJbJSnwlUw+BZjmCnKu+nVHRjGQXC
   H8akheuuswGhY/oUny3u4j8XToQItzZPk/nCK2kfx+/u8yUbRYNq3s8Hk
   hzXpwxTsJKHsVd4LaJv3fsf+XuA1gQdPWgqSxZ1C4Nm1fHvXjAEtwbPIs
   7NL3pNGpamjHiWSuPRxyki9wBL+yEr7SPR/JIy4vqbquwwDD0lrCH061h
   ySKIb8XH6OeDvRBlL0phg5xNZqIB+/7vKaZJpiHPTLdN6rww2FTxeUeZh
   A==;
X-CSE-ConnectionGUID: ZrdkkDPOSjSz6zkNNAPwsA==
X-CSE-MsgGUID: gcifXkCtQKOGEk/rbC69uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101694950"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="101694950"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:11:55 -0700
X-CSE-ConnectionGUID: p8WJ8V8JQc6yrz/G/OHlAA==
X-CSE-MsgGUID: hgRQeWl2QnecuAQ+WINVYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="277693108"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Sep 2026 04:11:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA3qI-00000000KVO-3fPm;
	Fri, 25 Sep 2026 11:11:50 +0000
Date: Fri, 25 Sep 2026 19:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 59/67]
 lib/test_bonsai_tree.c:1012:8: error: call to undeclared function
 'jump_label_export_bonsai_tree'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202609251900.c663K18G-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260925/202609251900.c663K18G-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251900.c663K18G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251900.c663K18G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_bonsai_tree.c:1012:8: error: call to undeclared function 'jump_label_export_bonsai_tree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1012 |         ret = jump_label_export_bonsai_tree(&bt, &start, &count);
         |               ^
   lib/test_bonsai_tree.c:1012:8: note: did you mean 'extable_export_bonsai_tree'?
   include/linux/extable.h:49:5: note: 'extable_export_bonsai_tree' declared here
      49 | int extable_export_bonsai_tree(struct bonsai_tree **bt,
         |     ^
>> lib/test_bonsai_tree.c:1019:32: error: subscript of pointer to incomplete type 'struct jump_entry'
    1019 |                 struct jump_entry *e = &start[i];
         |                                         ~~~~~^
   lib/test_bonsai_tree.c:1008:9: note: forward declaration of 'struct jump_entry'
    1008 |         struct jump_entry *start = NULL;
         |                ^
>> lib/test_bonsai_tree.c:1020:24: error: call to undeclared function 'jump_entry_code'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1020 |                 unsigned long code = jump_entry_code(e);
         |                                      ^
   lib/test_bonsai_tree.c:1034:32: error: subscript of pointer to incomplete type 'struct jump_entry'
    1034 |                 struct jump_entry *e = &start[i];
         |                                         ~~~~~^
   lib/test_bonsai_tree.c:1008:9: note: forward declaration of 'struct jump_entry'
    1008 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1035:24: error: call to undeclared function 'jump_entry_code'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1035 |                 unsigned long code = jump_entry_code(e);
         |                                      ^
>> lib/test_bonsai_tree.c:1038:8: error: call to undeclared function 'jump_entry_is_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1038 |                 if (!jump_entry_is_init(e)) {
         |                      ^
>> lib/test_bonsai_tree.c:1039:13: error: call to undeclared function 'jump_entry_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1039 |                         int sz = jump_entry_size(e);
         |                                  ^
   lib/test_bonsai_tree.c:1059:7: error: call to undeclared function 'jump_entry_is_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1059 |                 if (jump_entry_is_init(&start[i]))
         |                     ^
   lib/test_bonsai_tree.c:1059:32: error: subscript of pointer to incomplete type 'struct jump_entry'
    1059 |                 if (jump_entry_is_init(&start[i]))
         |                                         ~~~~~^
   lib/test_bonsai_tree.c:1008:9: note: forward declaration of 'struct jump_entry'
    1008 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1062:11: error: call to undeclared function 'jump_entry_code'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1062 |                 bogus = jump_entry_code(&start[i]) - 1;
         |                         ^
   lib/test_bonsai_tree.c:1062:33: error: subscript of pointer to incomplete type 'struct jump_entry'
    1062 |                 bogus = jump_entry_code(&start[i]) - 1;
         |                                          ~~~~~^
   lib/test_bonsai_tree.c:1008:9: note: forward declaration of 'struct jump_entry'
    1008 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1066:34: error: subscript of pointer to incomplete type 'struct jump_entry'
    1066 |                         if (!jump_entry_is_init(&start[j])) {
         |                                                  ~~~~~^
   lib/test_bonsai_tree.c:1008:9: note: forward declaration of 'struct jump_entry'
    1008 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1067:45: error: subscript of pointer to incomplete type 'struct jump_entry'
    1067 |                                 unsigned long s = jump_entry_code(&start[j]);
         |                                                                    ~~~~~^
   lib/test_bonsai_tree.c:1008:9: note: forward declaration of 'struct jump_entry'
    1008 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1068:14: error: call to undeclared function 'jump_entry_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1068 |                                 int sz = jump_entry_size(&start[j]);
         |                                          ^
   lib/test_bonsai_tree.c:1068:36: error: subscript of pointer to incomplete type 'struct jump_entry'
    1068 |                                 int sz = jump_entry_size(&start[j]);
         |                                                           ~~~~~^
   lib/test_bonsai_tree.c:1008:9: note: forward declaration of 'struct jump_entry'
    1008 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1112:8: error: call to undeclared function 'jump_label_export_bonsai_tree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1112 |         ret = jump_label_export_bonsai_tree(&bt_live, &start, &count);
         |               ^
   lib/test_bonsai_tree.c:1122:18: error: call to undeclared function 'jump_entry_code'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1122 |                 rnd_codes[i] = jump_entry_code(&start[idx]);
         |                                ^
   lib/test_bonsai_tree.c:1122:40: error: subscript of pointer to incomplete type 'struct jump_entry'
    1122 |                 rnd_codes[i] = jump_entry_code(&start[idx]);
         |                                                 ~~~~~^
   lib/test_bonsai_tree.c:1099:9: note: forward declaration of 'struct jump_entry'
    1099 |         struct jump_entry *start = NULL;
         |                ^
   lib/test_bonsai_tree.c:1130:21: error: call to undeclared function 'jump_entry_code'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1130 |                 unsigned long s = jump_entry_code(&start[i]);
         |                                   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/jump_label_export_bonsai_tree +1012 lib/test_bonsai_tree.c

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
