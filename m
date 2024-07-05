Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AF92AEEE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720194535; cv=none; b=dJj9Co2UKURbL3KsExhwhaANAZA41GaNo9Rlyk+qo2b05SrK50FaHA5LS9/OCt+6YfEWXAeTA+V/eOkETCInflfmvGavzjO2U3FhuKuhw4ZZkaF8MgL3mOHBqMnI3vELcZJPWA6mBsF23NKQvvFthr6m0XqUBkKFF4hdyHftt+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720194535; c=relaxed/simple;
	bh=JkqTkOLFCMvm2w7YblkgY0p/1f3qzl8z/m9arwDub2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BKfh9FJtBrpFn8XDlZWZvNu10G+iKRq+39goPTHqqxBs1Tqbk1spacpkx+sKwXPdteUtJyifMc5+AgEGe4/jfQnVVbT70ra8FxS68wuMh3V8TFcRu6BLPGZhmKXgvwaxWaqjT0OuQ8H+00HkR64HQR2yTsYTw4HK547twNs2WJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eb5ckq7m; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eb5ckq7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720194534; x=1751730534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JkqTkOLFCMvm2w7YblkgY0p/1f3qzl8z/m9arwDub2E=;
  b=eb5ckq7m/AyUiMSfFxMYCda6S/nrCw5f1Gp0KkkKousZ3pEl6hz8QJVn
   LuB2m36GHFxKTyhd1HypJcejVmF3FQZr7i4qd2mKo4GPjB3j7zntkvnr/
   wbBFg6Gxmr51TAytfZVgnAtEnu/LXR39oh9lyo+fe4wM0aOTzwdcUHIBY
   SPFWa0yWV+JTeNaFR9VoQjaKbz7enuWm/eVEB+bnbCoAwhXRcpBmQlyj/
   WhkEuk/9hYf6ZZsK98ohyIsW/w/k1u6k9KODRVb07lkyRo5m6HOyUr4fa
   bxx/7SMC53FPG19Hoq4XZ3/VYZm7oUDySrhDLuInjClVhayv/Dfh+tsoM
   Q==;
X-CSE-ConnectionGUID: zt4N4UKTRaaNE9aJEwJlCw==
X-CSE-MsgGUID: pRNlqi5OSs61JCCxGN5KIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17622248"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="17622248"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 08:48:53 -0700
X-CSE-ConnectionGUID: nbMX/nQgQPWvOB1BMnpYqg==
X-CSE-MsgGUID: m3rP14tPTguSdWOXiWxJQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="47560505"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Jul 2024 08:48:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPlB3-000SXa-01;
	Fri, 05 Jul 2024 15:48:49 +0000
Date: Fri, 5 Jul 2024 23:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@sandeen.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sandeen:f2fs-mount-api 11/11] fs/f2fs/super.c:772:15: warning:
 unused variable 'name'
Message-ID: <202407052335.EqHGMT26-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git f2fs-mount-api
head:   bf51728fb8134742e7da61ecff42fd585d05f264
commit: bf51728fb8134742e7da61ecff42fd585d05f264 [11/11] patch f2fs_convert_new_mount_api
config: i386-buildonly-randconfig-001-20240705 (https://download.01.org/0day-ci/archive/20240705/202407052335.EqHGMT26-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407052335.EqHGMT26-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407052335.EqHGMT26-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/super.c: In function 'f2fs_parse_param':
>> fs/f2fs/super.c:772:15: warning: unused variable 'name' [-Wunused-variable]
     772 |         char *name;
         |               ^~~~


vim +/name +772 fs/f2fs/super.c

   760	
   761	static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
   762	{
   763		struct f2fs_sb_info *sbi = fc->s_fs_info;
   764		struct fs_parse_result result;
   765		bool is_remount = (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE);
   766		substring_t args[MAX_OPT_ARGS];
   767	#ifdef CONFIG_F2FS_FS_COMPRESSION
   768		unsigned char (*ext)[F2FS_EXTENSION_LEN];
   769		unsigned char (*noext)[F2FS_EXTENSION_LEN];
   770		int ext_cnt, noext_cnt;
   771	#endif
 > 772		char *name;
   773		kuid_t uid;
   774		kgid_t gid;
   775		int opt, ret, token, arg;
   776	
   777		opt = fs_parse(fc, f2fs_fs_parameters, param, &result);
   778		if (opt < 0)
   779			return opt;
   780	
   781		switch (opt) {
   782		case Opt_gc_background:
   783			F2FS_OPTION(sbi).bggc_mode = result.uint_32;
   784			break;
   785		case Opt_disable_roll_forward:
   786			set_opt(sbi, DISABLE_ROLL_FORWARD);
   787			break;
   788		case Opt_norecovery:
   789			/* this option mounts f2fs with ro, check in fill_super */
   790			set_opt(sbi, NORECOVERY);
   791			break;
   792		case Opt_discard:
   793			if (result.negated)
   794				clear_opt(sbi, DISCARD);
   795			else
   796				set_opt(sbi, DISCARD);
   797			F2FS_OPTION(sbi).user_set_discard = true;
   798			break;
   799		case Opt_noheap:
   800		case Opt_heap:
   801			f2fs_warn(sbi, "heap/no_heap options were deprecated");
   802			break;
   803	#ifdef CONFIG_F2FS_FS_XATTR
   804		case Opt_user_xattr:
   805			if (result.negated)
   806				clear_opt(sbi, XATTR_USER);
   807			else
   808				set_opt(sbi, XATTR_USER);
   809			break;
   810		case Opt_inline_xattr:
   811			if (result.negated)
   812				clear_opt(sbi, INLINE_XATTR);
   813			else
   814				set_opt(sbi, INLINE_XATTR);
   815			break;
   816		case Opt_inline_xattr_size:
   817			set_opt(sbi, INLINE_XATTR_SIZE);
   818			F2FS_OPTION(sbi).inline_xattr_size = result.uint_32;
   819			break;
   820	#else
   821		case Opt_user_xattr:
   822			f2fs_info(sbi, "user_xattr options not supported");
   823			break;
   824		case Opt_inline_xattr:
   825			f2fs_info(sbi, "inline_xattr options not supported");
   826			break;
   827	#endif
   828	#ifdef CONFIG_F2FS_FS_POSIX_ACL
   829		case Opt_acl:
   830			if (result.negated)
   831				clear_opt(sbi, POSIX_ACL);
   832			else
   833				set_opt(sbi, POSIX_ACL);
   834			break;
   835	#else
   836		case Opt_acl:
   837			f2fs_info(sbi, "acl options not supported");
   838			break;
   839	#endif
   840		case Opt_active_logs:
   841			if (result.uint_32 != 2 && result.uint_32 != 4 &&
   842				result.uint_32 != NR_CURSEG_PERSIST_TYPE)
   843				return -EINVAL;
   844			F2FS_OPTION(sbi).active_logs = result.uint_32;
   845			break;
   846		case Opt_disable_ext_identify:
   847			set_opt(sbi, DISABLE_EXT_IDENTIFY);
   848			break;
   849		case Opt_inline_data:
   850			set_opt(sbi, INLINE_DATA);
   851			break;
   852		case Opt_inline_dentry:
   853			if (result.negated)
   854				clear_opt(sbi, INLINE_DENTRY);
   855			else
   856				set_opt(sbi, INLINE_DENTRY);
   857			break;
   858		case Opt_flush_merge:
   859			if (result.negated)
   860				clear_opt(sbi, FLUSH_MERGE);
   861			else
   862				set_opt(sbi, NOBARRIER);
   863			F2FS_OPTION(sbi).user_set_flush_merge = true;
   864			break;
   865		case Opt_barrier:
   866			if (result.negated)
   867				clear_opt(sbi, NOBARRIER);
   868			else
   869				set_opt(sbi, NOBARRIER);
   870			break;
   871		case Opt_fastboot:
   872			set_opt(sbi, FASTBOOT);
   873			break;
   874		case Opt_extent_cache:
   875			if (result.negated)
   876				clear_opt(sbi, READ_EXTENT_CACHE);
   877			else
   878				set_opt(sbi, READ_EXTENT_CACHE);
   879			break;
   880		case Opt_noinline_data:
   881			clear_opt(sbi, INLINE_DATA);
   882			break;
   883		case Opt_data_flush:
   884			set_opt(sbi, DATA_FLUSH);
   885			break;
   886		case Opt_reserve_root:
   887			if (test_opt(sbi, RESERVE_ROOT)) {
   888				f2fs_info(sbi, "Preserve previous reserve_root=%u",
   889					  F2FS_OPTION(sbi).root_reserved_blocks);
   890			} else {
   891				F2FS_OPTION(sbi).root_reserved_blocks = result.uint_32;
   892				set_opt(sbi, RESERVE_ROOT);
   893			}
   894			break;
   895		case Opt_resuid:
   896			uid = make_kuid(current_user_ns(), result.uint_32);
   897			if (!uid_valid(uid)) {
   898				f2fs_err(sbi, "Invalid uid value %d", result.uint_32);
   899				return -EINVAL;
   900			}
   901			F2FS_OPTION(sbi).s_resuid = uid;
   902			break;
   903		case Opt_resgid:
   904			gid = make_kgid(current_user_ns(), result.uint_32);
   905			if (!gid_valid(gid)) {
   906				f2fs_err(sbi, "Invalid gid value %d", result.uint_32);
   907				return -EINVAL;
   908			}
   909			F2FS_OPTION(sbi).s_resgid = gid;
   910			break;
   911		case Opt_mode:
   912			F2FS_OPTION(sbi).fs_mode = result.uint_32;
   913			break;
   914	#ifdef CONFIG_F2FS_FAULT_INJECTION
   915		case Opt_fault_injection:
   916			if (f2fs_build_fault_attr(sbi, result.uint_32, F2FS_ALL_FAULT_TYPE))
   917				return -EINVAL;
   918			set_opt(sbi, FAULT_INJECTION);
   919			break;
   920	
   921		case Opt_fault_type:
   922			if (f2fs_build_fault_attr(sbi, 0, result.uint_32))
   923				return -EINVAL;
   924			set_opt(sbi, FAULT_INJECTION);
   925			break;
   926	#else
   927		case Opt_fault_injection:
   928			f2fs_info(sbi, "fault_injection options not supported");
   929			break;
   930	
   931		case Opt_fault_type:
   932			f2fs_info(sbi, "fault_type options not supported");
   933			break;
   934	#endif
   935	#ifdef CONFIG_QUOTA
   936		case Opt_quota:
   937		case Opt_usrquota:
   938			set_opt(sbi, USRQUOTA);
   939			break;
   940		case Opt_grpquota:
   941			set_opt(sbi, GRPQUOTA);
   942			break;
   943		case Opt_prjquota:
   944			set_opt(sbi, PRJQUOTA);
   945			break;
   946		case Opt_usrjquota:
   947			ret = f2fs_set_qf_name(sbi, USRQUOTA, param->string);
   948			if (ret)
   949				return ret;
   950			param->string = NULL; /* param->string stolen */
   951			break;
   952		case Opt_grpjquota:
   953			ret = f2fs_set_qf_name(sbi, GRPQUOTA, param->string);
   954			if (ret)
   955				return ret;
   956			param->string = NULL; /* param->string stolen */
   957			break;
   958		case Opt_prjjquota:
   959			ret = f2fs_set_qf_name(sbi, PRJQUOTA, param->string);
   960			if (ret)
   961				return ret;
   962			param->string = NULL; /* param->string stolen */
   963			break;
   964		case Opt_offusrjquota:
   965			ret = f2fs_clear_qf_name(sbi, USRQUOTA);
   966			if (ret)
   967				return ret;
   968			break;
   969		case Opt_offgrpjquota:
   970			ret = f2fs_clear_qf_name(sbi, GRPQUOTA);
   971			if (ret)
   972				return ret;
   973			break;
   974		case Opt_offprjjquota:
   975			ret = f2fs_clear_qf_name(sbi, PRJQUOTA);
   976			if (ret)
   977				return ret;
   978			break;
   979		case Opt_jqfmt:
   980			F2FS_OPTION(sbi).s_jquota_fmt = result.uint_32;;
   981			break;
   982		case Opt_noquota:
   983			clear_opt(sbi, QUOTA);
   984			clear_opt(sbi, USRQUOTA);
   985			clear_opt(sbi, GRPQUOTA);
   986			clear_opt(sbi, PRJQUOTA);
   987			break;
   988	#else
   989		case Opt_quota:
   990		case Opt_usrquota:
   991		case Opt_grpquota:
   992		case Opt_prjquota:
   993		case Opt_usrjquota:
   994		case Opt_grpjquota:
   995		case Opt_prjjquota:
   996		case Opt_offusrjquota:
   997		case Opt_offgrpjquota:
   998		case Opt_offprjjquota:
   999		case Opt_jqfmt:
  1000		case Opt_noquota:
  1001			f2fs_info(sbi, "quota operations not supported");
  1002			break;
  1003	#endif
  1004		case Opt_alloc:
  1005			F2FS_OPTION(sbi).alloc_mode = result.uint_32;
  1006			break;
  1007		case Opt_fsync:
  1008			F2FS_OPTION(sbi).fsync_mode = result.uint_32;
  1009			break;
  1010		case Opt_test_dummy_encryption:
  1011			ret = f2fs_set_test_dummy_encryption(param, sbi, is_remount);
  1012			if (ret)
  1013				return ret;
  1014			break;
  1015		case Opt_inlinecrypt:
  1016	#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
  1017			set_opt(sbi, INLINECRYPT);
  1018	#else
  1019			f2fs_info(sbi, "inline encryption not supported");
  1020	#endif
  1021			break;
  1022		case Opt_checkpoint:
  1023			/* revert to match_table for this odd option */
  1024			token = match_token(param->string, f2fs_checkpoint_tokens, args);
  1025			switch (token) {
  1026			case Opt_checkpoint_disable_cap_perc:
  1027				if (args->from && match_int(args, &arg))
  1028					return -EINVAL;
  1029				if (arg < 0 || arg > 100)
  1030					return -EINVAL;
  1031				F2FS_OPTION(sbi).unusable_cap_perc = arg;
  1032				set_opt(sbi, DISABLE_CHECKPOINT);
  1033				break;
  1034			case Opt_checkpoint_disable_cap:
  1035				if (args->from && match_int(args, &arg))
  1036					return -EINVAL;
  1037				F2FS_OPTION(sbi).unusable_cap = arg;
  1038				set_opt(sbi, DISABLE_CHECKPOINT);
  1039				break;
  1040			case Opt_checkpoint_disable:
  1041				set_opt(sbi, DISABLE_CHECKPOINT);
  1042				break;
  1043			case Opt_checkpoint_enable:
  1044				clear_opt(sbi, DISABLE_CHECKPOINT);
  1045				break;
  1046			}
  1047			break;
  1048		case Opt_checkpoint_merge:
  1049			if (result.negated)
  1050				clear_opt(sbi, MERGE_CHECKPOINT);
  1051			else
  1052				set_opt(sbi, MERGE_CHECKPOINT);
  1053			break;
  1054	#ifdef CONFIG_F2FS_FS_COMPRESSION
  1055		case Opt_compress_algorithm:
  1056			name = param->string;
  1057			if (!strcmp(name, "lzo")) {
  1058	#ifdef CONFIG_F2FS_FS_LZO
  1059				F2FS_OPTION(sbi).compress_level = 0;
  1060				F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZO;
  1061	#else
  1062				f2fs_info(sbi, "kernel doesn't support lzo compression");
  1063	#endif
  1064			} else if (!strncmp(name, "lz4", 3)) {
  1065	#ifdef CONFIG_F2FS_FS_LZ4
  1066				ret = f2fs_set_lz4hc_level(sbi, name);
  1067				if (ret)
  1068					return -EINVAL;
  1069				F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
  1070	#else
  1071				f2fs_info(sbi, "kernel doesn't support lz4 compression");
  1072	#endif
  1073			} else if (!strncmp(name, "zstd", 4)) {
  1074	#ifdef CONFIG_F2FS_FS_ZSTD
  1075				ret = f2fs_set_zstd_level(sbi, name);
  1076				if (ret)
  1077					return -EINVAL;
  1078				F2FS_OPTION(sbi).compress_algorithm = COMPRESS_ZSTD;
  1079	#else
  1080				f2fs_info(sbi, "kernel doesn't support zstd compression");
  1081	#endif
  1082			} else if (!strcmp(name, "lzo-rle")) {
  1083	#ifdef CONFIG_F2FS_FS_LZORLE
  1084				F2FS_OPTION(sbi).compress_level = 0;
  1085				F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZORLE;
  1086	#else
  1087				f2fs_info(sbi, "kernel doesn't support lzorle compression");
  1088	#endif
  1089				} else
  1090					return -EINVAL;
  1091				break;
  1092		case Opt_compress_log_size:
  1093			if (result.uint_32 < MIN_COMPRESS_LOG_SIZE ||
  1094				result.uint_32 > MAX_COMPRESS_LOG_SIZE) {
  1095				f2fs_err(sbi,
  1096					"Compress cluster log size is out of range");
  1097				return -EINVAL;
  1098			}
  1099			F2FS_OPTION(sbi).compress_log_size = result.uint_32;
  1100			break;
  1101		case Opt_compress_extension:
  1102			ext = F2FS_OPTION(sbi).extensions;
  1103			ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
  1104	
  1105			if (strlen(param->string) >= F2FS_EXTENSION_LEN ||
  1106				ext_cnt >= COMPRESS_EXT_NUM) {
  1107				f2fs_err(sbi, "invalid extension length/number");
  1108				return -EINVAL;
  1109			}
  1110	
  1111			if (is_compress_extension_exist(sbi, param->string, true))
  1112				break;
  1113	
  1114			/* XXX ERS can we just steal param->string */
  1115			strcpy(ext[ext_cnt], param->string);
  1116			F2FS_OPTION(sbi).compress_ext_cnt++;
  1117			break;
  1118		case Opt_nocompress_extension:
  1119			noext = F2FS_OPTION(sbi).noextensions;
  1120			noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
  1121	
  1122			if (strlen(param->string) >= F2FS_EXTENSION_LEN ||
  1123				noext_cnt >= COMPRESS_EXT_NUM) {
  1124				f2fs_err(sbi, "invalid extension length/number");
  1125				return -EINVAL;
  1126			}
  1127	
  1128			if (is_compress_extension_exist(sbi, param->string, false))
  1129				break;
  1130	
  1131			/* XXX ERS can we just steal param->string */
  1132			strcpy(noext[noext_cnt], param->string);
  1133			F2FS_OPTION(sbi).nocompress_ext_cnt++;
  1134			break;
  1135		case Opt_compress_chksum:
  1136			F2FS_OPTION(sbi).compress_chksum = true;
  1137			break;
  1138		case Opt_compress_mode:
  1139			F2FS_OPTION(sbi).compress_mode = result.uint_32;
  1140			break;
  1141		case Opt_compress_cache:
  1142			set_opt(sbi, COMPRESS_CACHE);
  1143			break;
  1144	#else
  1145		case Opt_compress_algorithm:
  1146		case Opt_compress_log_size:
  1147		case Opt_compress_extension:
  1148		case Opt_nocompress_extension:
  1149		case Opt_compress_chksum:
  1150		case Opt_compress_mode:
  1151		case Opt_compress_cache:
  1152			f2fs_info(sbi, "compression options not supported");
  1153			break;
  1154	#endif
  1155		case Opt_atgc:
  1156			set_opt(sbi, ATGC);
  1157			break;
  1158		case Opt_gc_merge:
  1159			if (result.negated)
  1160				clear_opt(sbi, GC_MERGE);
  1161			else
  1162				set_opt(sbi, GC_MERGE);
  1163			break;
  1164		case Opt_discard_unit:
  1165			F2FS_OPTION(sbi).discard_unit = result.uint_32;
  1166			break;
  1167		case Opt_memory_mode:
  1168			F2FS_OPTION(sbi).memory_mode = result.uint_32;
  1169			break;
  1170		case Opt_age_extent_cache:
  1171			set_opt(sbi, AGE_EXTENT_CACHE);
  1172			break;
  1173		case Opt_errors:
  1174			F2FS_OPTION(sbi).errors = result.uint_32;
  1175			break;
  1176		default:
  1177			return -EINVAL;
  1178		}
  1179		return 0;
  1180	}
  1181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
