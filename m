Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314111EB54
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 11:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOzu7G+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700826533; x=1732362533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AfXvf3qvfeStQo6tf+73OVvS+fZve2z7v49Vu1mwb7k=;
  b=eOzu7G+7L0a+5oxQKET9IPq5n62GhKUnKDeCZKb1OFrtTJDIp31RArRb
   CQxSF4EP8I8qa+FQnBZnczG+2/hFJ1NOPYo0TKKXDue/2xDXWBLcscn5l
   2vgQUaJdbXOmkWBKpawGa+NZ7qjSH55A98z0Rc9meks6lGHf1F7Tzhg4e
   5QkbrzZNGvvmSBukgIUicePz2hrGjaf0PVFMhqdYD1iS+v7QcvL0fv2dc
   +L9LbDBhQx4UenORjJfHXTiEftBxpJEQLfE0g2zgHNjO1HZ0iBxle3H9Y
   w1nsND7N/nVggzgSCgHoGs2ofEeiFakgHGIjBjbWHzJQKgW1A29B42kDG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377449245"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="377449245"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1014884514"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="1014884514"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2023 03:48:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Ufw-0002iJ-1v;
	Fri, 24 Nov 2023 11:48:48 +0000
Date: Fri, 24 Nov 2023 19:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [kdave:for-next 47/66] fs/btrfs/super.c:519:25: error: 'ret'
 undeclared; did you mean 'net'?
Message-ID: <202311241419.x3wcM1Nc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
head:   56b765789a0aa3c3ead93af87bcb3c2c62e6a89c
commit: 1f8c15f421cfe748407898def0b16952386dd665 [47/66] btrfs: add parse_param callback for the new mount api
config: m68k-amiga_defconfig (https://download.01.org/0day-ci/archive/20231124/202311241419.x3wcM1Nc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241419.x3wcM1Nc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241419.x3wcM1Nc-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/super.c: In function 'btrfs_parse_param':
>> fs/btrfs/super.c:519:25: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     519 |                         ret = -EINVAL;
         |                         ^~~
         |                         net
   fs/btrfs/super.c:519:25: note: each undeclared identifier is reported only once for each function it appears in
>> fs/btrfs/super.c:520:25: error: label 'out' used but not defined
     520 |                         goto out;
         |                         ^~~~


vim +519 fs/btrfs/super.c

   366	
   367	static int btrfs_parse_param(struct fs_context *fc,
   368				     struct fs_parameter *param)
   369	{
   370		struct btrfs_fs_context *ctx = fc->fs_private;
   371		struct fs_parse_result result;
   372		int opt;
   373	
   374		opt = fs_parse(fc, btrfs_fs_parameters, param, &result);
   375		if (opt < 0)
   376			return opt;
   377	
   378		switch (opt) {
   379		case Opt_degraded:
   380			btrfs_set_opt(ctx->mount_opt, DEGRADED);
   381			break;
   382		case Opt_subvol_empty:
   383			/*
   384			 * This exists because we used to allow it on accident, so we're
   385			 * keeping it to maintain ABI.  See 37becec95ac3 ("Btrfs: allow
   386			 * empty subvol= again").
   387			 */
   388			break;
   389		case Opt_subvol:
   390			kfree(ctx->subvol_name);
   391			ctx->subvol_name = kstrdup(param->string, GFP_KERNEL);
   392			if (!ctx->subvol_name)
   393				return -ENOMEM;
   394			break;
   395		case Opt_subvolid:
   396			ctx->subvol_objectid = result.uint_64;
   397	
   398			/* subvolid=0 means give me the original fs_tree. */
   399			if (!ctx->subvol_objectid)
   400				ctx->subvol_objectid = BTRFS_FS_TREE_OBJECTID;
   401			break;
   402		case Opt_device: {
   403			struct btrfs_device *device;
   404			blk_mode_t mode = sb_open_mode(fc->sb_flags);
   405	
   406			mutex_lock(&uuid_mutex);
   407			device = btrfs_scan_one_device(param->string, mode, false);
   408			mutex_unlock(&uuid_mutex);
   409			if (IS_ERR(device))
   410				return PTR_ERR(device);
   411			break;
   412		}
   413		case Opt_datasum:
   414			if (result.negated) {
   415				btrfs_set_opt(ctx->mount_opt, NODATASUM);
   416			} else {
   417				btrfs_clear_opt(ctx->mount_opt, NODATACOW);
   418				btrfs_clear_opt(ctx->mount_opt, NODATASUM);
   419			}
   420			break;
   421		case Opt_datacow:
   422			if (result.negated) {
   423				btrfs_clear_opt(ctx->mount_opt, COMPRESS);
   424				btrfs_clear_opt(ctx->mount_opt, FORCE_COMPRESS);
   425				btrfs_set_opt(ctx->mount_opt, NODATACOW);
   426				btrfs_set_opt(ctx->mount_opt, NODATASUM);
   427			} else {
   428				btrfs_clear_opt(ctx->mount_opt, NODATACOW);
   429			}
   430			break;
   431		case Opt_compress_force:
   432		case Opt_compress_force_type:
   433			btrfs_set_opt(ctx->mount_opt, FORCE_COMPRESS);
   434			fallthrough;
   435		case Opt_compress:
   436		case Opt_compress_type:
   437			if (opt == Opt_compress || opt == Opt_compress_force) {
   438				ctx->compress_type = BTRFS_COMPRESS_ZLIB;
   439				ctx->compress_level = BTRFS_ZLIB_DEFAULT_LEVEL;
   440				btrfs_set_opt(ctx->mount_opt, COMPRESS);
   441				btrfs_clear_opt(ctx->mount_opt, NODATACOW);
   442				btrfs_clear_opt(ctx->mount_opt, NODATASUM);
   443			} else if (strncmp(param->string, "zlib", 4) == 0) {
   444				ctx->compress_type = BTRFS_COMPRESS_ZLIB;
   445				ctx->compress_level =
   446					btrfs_compress_str2level(BTRFS_COMPRESS_ZLIB,
   447								 param->string + 4);
   448				btrfs_set_opt(ctx->mount_opt, COMPRESS);
   449				btrfs_clear_opt(ctx->mount_opt, NODATACOW);
   450				btrfs_clear_opt(ctx->mount_opt, NODATASUM);
   451			} else if (strncmp(param->string, "lzo", 3) == 0) {
   452				ctx->compress_type = BTRFS_COMPRESS_LZO;
   453				ctx->compress_level = 0;
   454				btrfs_set_opt(ctx->mount_opt, COMPRESS);
   455				btrfs_clear_opt(ctx->mount_opt, NODATACOW);
   456				btrfs_clear_opt(ctx->mount_opt, NODATASUM);
   457			} else if (strncmp(param->string, "zstd", 4) == 0) {
   458				ctx->compress_type = BTRFS_COMPRESS_ZSTD;
   459				ctx->compress_level =
   460					btrfs_compress_str2level(BTRFS_COMPRESS_ZSTD,
   461								 param->string + 4);
   462				btrfs_set_opt(ctx->mount_opt, COMPRESS);
   463				btrfs_clear_opt(ctx->mount_opt, NODATACOW);
   464				btrfs_clear_opt(ctx->mount_opt, NODATASUM);
   465			} else if (strncmp(param->string, "no", 2) == 0) {
   466				ctx->compress_level = 0;
   467				ctx->compress_type = 0;
   468				btrfs_clear_opt(ctx->mount_opt, COMPRESS);
   469				btrfs_clear_opt(ctx->mount_opt, FORCE_COMPRESS);
   470			} else {
   471				btrfs_err(NULL, "unrecognized compression value %s",
   472					  param->string);
   473				return -EINVAL;
   474			}
   475			break;
   476		case Opt_ssd:
   477			if (result.negated) {
   478				btrfs_set_opt(ctx->mount_opt, NOSSD);
   479				btrfs_clear_opt(ctx->mount_opt, SSD);
   480				btrfs_clear_opt(ctx->mount_opt, SSD_SPREAD);
   481			} else {
   482				btrfs_set_opt(ctx->mount_opt, SSD);
   483				btrfs_clear_opt(ctx->mount_opt, NOSSD);
   484			}
   485			break;
   486		case Opt_ssd_spread:
   487			if (result.negated) {
   488				btrfs_clear_opt(ctx->mount_opt, SSD_SPREAD);
   489			} else {
   490				btrfs_set_opt(ctx->mount_opt, SSD);
   491				btrfs_set_opt(ctx->mount_opt, SSD_SPREAD);
   492				btrfs_clear_opt(ctx->mount_opt, NOSSD);
   493			}
   494			break;
   495		case Opt_barrier:
   496			if (result.negated)
   497				btrfs_set_opt(ctx->mount_opt, NOBARRIER);
   498			else
   499				btrfs_clear_opt(ctx->mount_opt, NOBARRIER);
   500			break;
   501		case Opt_thread_pool:
   502			if (result.uint_32 == 0) {
   503				btrfs_err(NULL, "invalid value 0 for thread_pool");
   504				return -EINVAL;
   505			}
   506			ctx->thread_pool_size = result.uint_32;
   507			break;
   508		case Opt_max_inline:
   509			ctx->max_inline = memparse(param->string, NULL);
   510			break;
   511		case Opt_acl:
   512			if (result.negated) {
   513				fc->sb_flags &= ~SB_POSIXACL;
   514			} else {
   515	#ifdef CONFIG_BTRFS_FS_POSIX_ACL
   516				fc->sb_flags |= SB_POSIXACL;
   517	#else
   518				btrfs_err(NULL, "support for ACL not compiled in!");
 > 519				ret = -EINVAL;
 > 520				goto out;
   521	#endif
   522			}
   523			/*
   524			 * VFS limits the ability to toggle ACL on and off via remount,
   525			 * despite every file system allowing this.  This seems to be an
   526			 * oversight since we all do, but it'll fail if we're
   527			 * remounting.  So don't set the mask here, we'll check it in
   528			 * btrfs_reconfigure and do the toggling ourselves.
   529			 */
   530			if (fc->purpose != FS_CONTEXT_FOR_RECONFIGURE)
   531				fc->sb_flags_mask |= SB_POSIXACL;
   532			break;
   533		case Opt_treelog:
   534			if (result.negated)
   535				btrfs_set_opt(ctx->mount_opt, NOTREELOG);
   536			else
   537				btrfs_clear_opt(ctx->mount_opt, NOTREELOG);
   538			break;
   539		case Opt_recovery:
   540			/*
   541			 * -o recovery used to be an alias for usebackuproot, and then
   542			 * norecovery was an alias for nologreplay, hence the different
   543			 * behaviors for negated and not.
   544			 */
   545			if (result.negated) {
   546				btrfs_warn(NULL,
   547					   "'norecovery' is deprecated, use 'rescue=nologreplay' instead");
   548				btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
   549			} else {
   550				btrfs_warn(NULL,
   551					   "'recovery' is deprecated, use 'rescue=usebackuproot' instead");
   552				btrfs_set_opt(ctx->mount_opt, USEBACKUPROOT);
   553			}
   554			break;
   555		case Opt_nologreplay:
   556			btrfs_warn(NULL,
   557				   "'nologreplay' is deprecated, use 'rescue=nologreplay' instead");
   558			btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
   559			break;
   560		case Opt_flushoncommit:
   561			if (result.negated)
   562				btrfs_clear_opt(ctx->mount_opt, FLUSHONCOMMIT);
   563			else
   564				btrfs_set_opt(ctx->mount_opt, FLUSHONCOMMIT);
   565			break;
   566		case Opt_ratio:
   567			ctx->metadata_ratio = result.uint_32;
   568			break;
   569		case Opt_discard:
   570			if (result.negated) {
   571				btrfs_clear_opt(ctx->mount_opt, DISCARD_SYNC);
   572				btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
   573				btrfs_set_opt(ctx->mount_opt, NODISCARD);
   574			} else {
   575				btrfs_set_opt(ctx->mount_opt, DISCARD_SYNC);
   576				btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
   577			}
   578			break;
   579		case Opt_discard_mode:
   580			switch (result.uint_32) {
   581			case Opt_discard_sync:
   582				btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
   583				btrfs_set_opt(ctx->mount_opt, DISCARD_SYNC);
   584				break;
   585			case Opt_discard_async:
   586				btrfs_clear_opt(ctx->mount_opt, DISCARD_SYNC);
   587				btrfs_set_opt(ctx->mount_opt, DISCARD_ASYNC);
   588				break;
   589			default:
   590				btrfs_err(NULL, "unrecognized discard mode value %s",
   591					  param->key);
   592				return -EINVAL;
   593			}
   594			btrfs_clear_opt(ctx->mount_opt, NODISCARD);
   595			break;
   596		case Opt_space_cache:
   597			if (result.negated) {
   598				btrfs_set_opt(ctx->mount_opt, NOSPACECACHE);
   599				btrfs_clear_opt(ctx->mount_opt, SPACE_CACHE);
   600				btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
   601			} else {
   602				btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
   603				btrfs_set_opt(ctx->mount_opt, SPACE_CACHE);
   604			}
   605			break;
   606		case Opt_space_cache_version:
   607			switch (result.uint_32) {
   608			case Opt_space_cache_v1:
   609				btrfs_set_opt(ctx->mount_opt, SPACE_CACHE);
   610				btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
   611				break;
   612			case Opt_space_cache_v2:
   613				btrfs_clear_opt(ctx->mount_opt, SPACE_CACHE);
   614				btrfs_set_opt(ctx->mount_opt, FREE_SPACE_TREE);
   615				break;
   616			default:
   617				btrfs_err(NULL, "unrecognized space_cache value %s",
   618					  param->key);
   619				return -EINVAL;
   620			}
   621			break;
   622		case Opt_rescan_uuid_tree:
   623			btrfs_set_opt(ctx->mount_opt, RESCAN_UUID_TREE);
   624			break;
   625		case Opt_inode_cache:
   626			btrfs_warn(NULL,
   627				   "the 'inode_cache' option is deprecated and has no effect since 5.11");
   628			break;
   629		case Opt_clear_cache:
   630			btrfs_set_opt(ctx->mount_opt, CLEAR_CACHE);
   631			break;
   632		case Opt_user_subvol_rm_allowed:
   633			btrfs_set_opt(ctx->mount_opt, USER_SUBVOL_RM_ALLOWED);
   634			break;
   635		case Opt_enospc_debug:
   636			if (result.negated)
   637				btrfs_clear_opt(ctx->mount_opt, ENOSPC_DEBUG);
   638			else
   639				btrfs_set_opt(ctx->mount_opt, ENOSPC_DEBUG);
   640			break;
   641		case Opt_defrag:
   642			if (result.negated)
   643				btrfs_clear_opt(ctx->mount_opt, AUTO_DEFRAG);
   644			else
   645				btrfs_set_opt(ctx->mount_opt, AUTO_DEFRAG);
   646			break;
   647		case Opt_usebackuproot:
   648			btrfs_warn(NULL,
   649				   "'usebackuproot' is deprecated, use 'rescue=usebackuproot' instead");
   650			btrfs_set_opt(ctx->mount_opt, USEBACKUPROOT);
   651			break;
   652		case Opt_skip_balance:
   653			btrfs_set_opt(ctx->mount_opt, SKIP_BALANCE);
   654			break;
   655		case Opt_fatal_errors:
   656			switch (result.uint_32) {
   657			case Opt_fatal_errors_panic:
   658				btrfs_set_opt(ctx->mount_opt, PANIC_ON_FATAL_ERROR);
   659				break;
   660			case Opt_fatal_errors_bug:
   661				btrfs_clear_opt(ctx->mount_opt, PANIC_ON_FATAL_ERROR);
   662				break;
   663			default:
   664				btrfs_err(NULL, "unrecognized fatal_errors value %s",
   665					  param->key);
   666				return -EINVAL;
   667			}
   668			break;
   669		case Opt_commit_interval:
   670			ctx->commit_interval = result.uint_32;
   671			if (!ctx->commit_interval)
   672				ctx->commit_interval = BTRFS_DEFAULT_COMMIT_INTERVAL;
   673			break;
   674		case Opt_rescue:
   675			switch (result.uint_32) {
   676			case Opt_rescue_usebackuproot:
   677				btrfs_set_opt(ctx->mount_opt, USEBACKUPROOT);
   678				break;
   679			case Opt_rescue_nologreplay:
   680				btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
   681				break;
   682			case Opt_rescue_ignorebadroots:
   683				btrfs_set_opt(ctx->mount_opt, IGNOREBADROOTS);
   684				break;
   685			case Opt_rescue_ignoredatacsums:
   686				btrfs_set_opt(ctx->mount_opt, IGNOREDATACSUMS);
   687				break;
   688			case Opt_rescue_parameter_all:
   689				btrfs_set_opt(ctx->mount_opt, IGNOREDATACSUMS);
   690				btrfs_set_opt(ctx->mount_opt, IGNOREBADROOTS);
   691				btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
   692				break;
   693			default:
   694				btrfs_info(NULL, "unrecognized rescue option '%s'",
   695					   param->key);
   696				return -EINVAL;
   697			}
   698			break;
   699	#ifdef CONFIG_BTRFS_DEBUG
   700		case Opt_fragment:
   701			switch (result.uint_32) {
   702			case Opt_fragment_parameter_all:
   703				btrfs_set_opt(ctx->mount_opt, FRAGMENT_DATA);
   704				btrfs_set_opt(ctx->mount_opt, FRAGMENT_METADATA);
   705				break;
   706			case Opt_fragment_parameter_metadata:
   707				btrfs_set_opt(ctx->mount_opt, FRAGMENT_METADATA);
   708				break;
   709			case Opt_fragment_parameter_data:
   710				btrfs_set_opt(ctx->mount_opt, FRAGMENT_DATA);
   711				break;
   712			default:
   713				btrfs_info(NULL, "unrecognized fragment option '%s'",
   714					   param->key);
   715				return -EINVAL;
   716			}
   717			break;
   718	#endif
   719	#ifdef CONFIG_BTRFS_FS_REF_VERIFY
   720		case Opt_ref_verify:
   721			btrfs_set_opt(ctx->mount_opt, REF_VERIFY);
   722			break;
   723	#endif
   724		default:
   725			btrfs_err(NULL, "unrecognized mount option '%s'", param->key);
   726			return -EINVAL;
   727		}
   728	
   729		return 0;
   730	}
   731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
