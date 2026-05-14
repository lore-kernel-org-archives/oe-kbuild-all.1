Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DCA30E0FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 01:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722086; cv=none; b=AbWtYyTo9FgDww4ubQtctV8rPHTgIx4S836pxHr5TPh0Hq/495/zdUSjhaDzBUfOFUwF7x9b7lFTIJX7WwLJidSigDCZLryZ03XqKOp+nJu1v7lnTglJimW0qvgypzokwitDHlN9lBEZk0Pz+LUkghfCADBnHf8VqdNZ8GfdKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722086; c=relaxed/simple;
	bh=2JJ2Px5nbctwqn7+FoCTuSlmyr+CFgMV/kaIucqUMjU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jqREOwRYRw3WX23bZfzU85UNVNadBd2U/hRsQpJFHZkxFtirtmooXERLhxet2K2g/RdGPBp6lCGncisILUeABUdGnqdPXXebbMvrAZ1lb/a8PB+6s3FqYFGqYhKjgU4gm1nqvKqk0uYrGO+7c9l3Y6GWLxP7jLkBo8RoMblmxiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXAse84T; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXAse84T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778722083; x=1810258083;
  h=date:from:to:cc:subject:message-id;
  bh=2JJ2Px5nbctwqn7+FoCTuSlmyr+CFgMV/kaIucqUMjU=;
  b=EXAse84TkSHPR4GmuytL+UdxhxzTxSt1k38f2/Ecgxe4Gv65fBMJhpMS
   3KxLdIUkZZug1zAC9oyCi3KrvdWZV11zN9sL8pzPj/edUT+tFnQW3+onF
   LTOLEDuhD+nzLJcQBJW8f1FbNxyem3jTRPHK65++X2FiIySxW2ICRiu/+
   CHHMz51hqU+d03D195tCBU6OWszfQ7aDb7QoZn2bRwLzlbYHZ623LYKoW
   nZLS36aDi+3sUVGRAcr3+sBC9zKyJlNRLs417xCJiNB+MH1X/jGgZNdyd
   88BR3g1MhccD5cek3mNvi0DBFTr/pBI8AmngTv4MulejebXj+rkFfJeSM
   Q==;
X-CSE-ConnectionGUID: wxCWV2F1TVSTmBs6r60Ndw==
X-CSE-MsgGUID: chY+xL0wRne0D7lZhkLTwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91121900"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="91121900"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 18:28:00 -0700
X-CSE-ConnectionGUID: T2Dkno/wTAyNB6CfdEMXsA==
X-CSE-MsgGUID: jWHkJ+7RSqmBBpT8qlK1QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238362200"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 May 2026 18:27:59 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNKrj-000000005W3-2W1q;
	Thu, 14 May 2026 01:27:55 +0000
Date: Thu, 14 May 2026 09:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
 Daniel Vacek <neelx@suse.com>
Subject: [kdave-btrfs-devel:ext/dv/fscrypt 34/43]
 fs/btrfs/super.c:659:3: error: a label can only be part of a statement and a
 declaration is not a statement
Message-ID: <202605140955.Dr60lOTF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
commit: 69bb73593025c83c008129a68acd562e97870998 [34/43] btrfs: add test_dummy_encryption support
config: nios2-randconfig-r073-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140955.Dr60lOTF-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140955.Dr60lOTF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140955.Dr60lOTF-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/super.c: In function 'btrfs_parse_param':
>> fs/btrfs/super.c:659:3: error: a label can only be part of a statement and a declaration is not a statement
      int ret;
      ^~~


vim +659 fs/btrfs/super.c

   344	
   345	static int btrfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
   346	{
   347		struct btrfs_fs_context *ctx = fc->fs_private;
   348		struct fs_parse_result result;
   349		int opt;
   350	
   351		opt = fs_parse(fc, btrfs_fs_parameters, param, &result);
   352		if (opt < 0)
   353			return opt;
   354	
   355		switch (opt) {
   356		case Opt_degraded:
   357			btrfs_set_opt(ctx->mount_opt, DEGRADED);
   358			break;
   359		case Opt_subvol_empty:
   360			/*
   361			 * This exists because we used to allow it on accident, so we're
   362			 * keeping it to maintain ABI.  See 37becec95ac3 ("Btrfs: allow
   363			 * empty subvol= again").
   364			 */
   365			break;
   366		case Opt_subvol:
   367			kfree(ctx->subvol_name);
   368			ctx->subvol_name = kstrdup(param->string, GFP_KERNEL);
   369			if (!ctx->subvol_name)
   370				return -ENOMEM;
   371			break;
   372		case Opt_subvolid:
   373			ctx->subvol_objectid = result.uint_64;
   374	
   375			/* subvolid=0 means give me the original fs_tree. */
   376			if (!ctx->subvol_objectid)
   377				ctx->subvol_objectid = BTRFS_FS_TREE_OBJECTID;
   378			break;
   379		case Opt_device: {
   380			struct btrfs_device *device;
   381	
   382			mutex_lock(&uuid_mutex);
   383			device = btrfs_scan_one_device(param->string, false);
   384			mutex_unlock(&uuid_mutex);
   385			if (IS_ERR(device))
   386				return PTR_ERR(device);
   387			break;
   388		}
   389		case Opt_datasum:
   390			if (result.negated) {
   391				btrfs_set_opt(ctx->mount_opt, NODATASUM);
   392			} else {
   393				btrfs_clear_opt(ctx->mount_opt, NODATACOW);
   394				btrfs_clear_opt(ctx->mount_opt, NODATASUM);
   395			}
   396			break;
   397		case Opt_datacow:
   398			if (result.negated) {
   399				btrfs_clear_opt(ctx->mount_opt, COMPRESS);
   400				btrfs_clear_opt(ctx->mount_opt, FORCE_COMPRESS);
   401				btrfs_set_opt(ctx->mount_opt, NODATACOW);
   402				btrfs_set_opt(ctx->mount_opt, NODATASUM);
   403			} else {
   404				btrfs_clear_opt(ctx->mount_opt, NODATACOW);
   405			}
   406			break;
   407		case Opt_compress_force:
   408		case Opt_compress_force_type:
   409			btrfs_set_opt(ctx->mount_opt, FORCE_COMPRESS);
   410			fallthrough;
   411		case Opt_compress:
   412		case Opt_compress_type:
   413			if (btrfs_parse_compress(ctx, param, opt))
   414				return -EINVAL;
   415			break;
   416		case Opt_ssd:
   417			if (result.negated) {
   418				btrfs_set_opt(ctx->mount_opt, NOSSD);
   419				btrfs_clear_opt(ctx->mount_opt, SSD);
   420				btrfs_clear_opt(ctx->mount_opt, SSD_SPREAD);
   421			} else {
   422				btrfs_set_opt(ctx->mount_opt, SSD);
   423				btrfs_clear_opt(ctx->mount_opt, NOSSD);
   424			}
   425			break;
   426		case Opt_ssd_spread:
   427			if (result.negated) {
   428				btrfs_clear_opt(ctx->mount_opt, SSD_SPREAD);
   429			} else {
   430				btrfs_set_opt(ctx->mount_opt, SSD);
   431				btrfs_set_opt(ctx->mount_opt, SSD_SPREAD);
   432				btrfs_clear_opt(ctx->mount_opt, NOSSD);
   433			}
   434			break;
   435		case Opt_barrier:
   436			if (result.negated)
   437				btrfs_set_opt(ctx->mount_opt, NOBARRIER);
   438			else
   439				btrfs_clear_opt(ctx->mount_opt, NOBARRIER);
   440			break;
   441		case Opt_thread_pool:
   442			if (result.uint_32 == 0) {
   443				btrfs_err(NULL, "invalid value 0 for thread_pool");
   444				return -EINVAL;
   445			}
   446			ctx->thread_pool_size = result.uint_32;
   447			break;
   448		case Opt_max_inline:
   449			ctx->max_inline = memparse(param->string, NULL);
   450			break;
   451		case Opt_acl:
   452			if (result.negated) {
   453				fc->sb_flags &= ~SB_POSIXACL;
   454			} else {
   455	#ifdef CONFIG_BTRFS_FS_POSIX_ACL
   456				fc->sb_flags |= SB_POSIXACL;
   457	#else
   458				btrfs_err(NULL, "support for ACL not compiled in");
   459				return -EINVAL;
   460	#endif
   461			}
   462			/*
   463			 * VFS limits the ability to toggle ACL on and off via remount,
   464			 * despite every file system allowing this.  This seems to be
   465			 * an oversight since we all do, but it'll fail if we're
   466			 * remounting.  So don't set the mask here, we'll check it in
   467			 * btrfs_reconfigure and do the toggling ourselves.
   468			 */
   469			if (fc->purpose != FS_CONTEXT_FOR_RECONFIGURE)
   470				fc->sb_flags_mask |= SB_POSIXACL;
   471			break;
   472		case Opt_treelog:
   473			if (result.negated)
   474				btrfs_set_opt(ctx->mount_opt, NOTREELOG);
   475			else
   476				btrfs_clear_opt(ctx->mount_opt, NOTREELOG);
   477			break;
   478		case Opt_norecovery:
   479			btrfs_info(NULL,
   480	"'norecovery' is for compatibility only, recommended to use 'rescue=nologreplay'");
   481			btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
   482			break;
   483		case Opt_flushoncommit:
   484			if (result.negated)
   485				btrfs_clear_opt(ctx->mount_opt, FLUSHONCOMMIT);
   486			else
   487				btrfs_set_opt(ctx->mount_opt, FLUSHONCOMMIT);
   488			break;
   489		case Opt_ratio:
   490			ctx->metadata_ratio = result.uint_32;
   491			break;
   492		case Opt_discard:
   493			if (result.negated) {
   494				btrfs_clear_opt(ctx->mount_opt, DISCARD_SYNC);
   495				btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
   496				btrfs_set_opt(ctx->mount_opt, NODISCARD);
   497			} else {
   498				btrfs_set_opt(ctx->mount_opt, DISCARD_SYNC);
   499				btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
   500			}
   501			break;
   502		case Opt_discard_mode:
   503			switch (result.uint_32) {
   504			case Opt_discard_sync:
   505				btrfs_clear_opt(ctx->mount_opt, DISCARD_ASYNC);
   506				btrfs_set_opt(ctx->mount_opt, DISCARD_SYNC);
   507				break;
   508			case Opt_discard_async:
   509				btrfs_clear_opt(ctx->mount_opt, DISCARD_SYNC);
   510				btrfs_set_opt(ctx->mount_opt, DISCARD_ASYNC);
   511				break;
   512			default:
   513				btrfs_err(NULL, "unrecognized discard mode value %s",
   514					  param->key);
   515				return -EINVAL;
   516			}
   517			btrfs_clear_opt(ctx->mount_opt, NODISCARD);
   518			break;
   519		case Opt_space_cache:
   520			if (result.negated) {
   521				btrfs_set_opt(ctx->mount_opt, NOSPACECACHE);
   522				btrfs_clear_opt(ctx->mount_opt, SPACE_CACHE);
   523				btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
   524			} else {
   525				btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
   526				btrfs_set_opt(ctx->mount_opt, SPACE_CACHE);
   527			}
   528			break;
   529		case Opt_space_cache_version:
   530			switch (result.uint_32) {
   531			case Opt_space_cache_v1:
   532				btrfs_set_opt(ctx->mount_opt, SPACE_CACHE);
   533				btrfs_clear_opt(ctx->mount_opt, FREE_SPACE_TREE);
   534				break;
   535			case Opt_space_cache_v2:
   536				btrfs_clear_opt(ctx->mount_opt, SPACE_CACHE);
   537				btrfs_set_opt(ctx->mount_opt, FREE_SPACE_TREE);
   538				break;
   539			default:
   540				btrfs_err(NULL, "unrecognized space_cache value %s",
   541					  param->key);
   542				return -EINVAL;
   543			}
   544			break;
   545		case Opt_rescan_uuid_tree:
   546			btrfs_set_opt(ctx->mount_opt, RESCAN_UUID_TREE);
   547			break;
   548		case Opt_clear_cache:
   549			btrfs_set_opt(ctx->mount_opt, CLEAR_CACHE);
   550			break;
   551		case Opt_user_subvol_rm_allowed:
   552			btrfs_set_opt(ctx->mount_opt, USER_SUBVOL_RM_ALLOWED);
   553			break;
   554		case Opt_enospc_debug:
   555			if (result.negated)
   556				btrfs_clear_opt(ctx->mount_opt, ENOSPC_DEBUG);
   557			else
   558				btrfs_set_opt(ctx->mount_opt, ENOSPC_DEBUG);
   559			break;
   560		case Opt_defrag:
   561			if (result.negated)
   562				btrfs_clear_opt(ctx->mount_opt, AUTO_DEFRAG);
   563			else
   564				btrfs_set_opt(ctx->mount_opt, AUTO_DEFRAG);
   565			break;
   566		case Opt_usebackuproot:
   567			btrfs_warn(NULL,
   568				   "'usebackuproot' is deprecated, use 'rescue=usebackuproot' instead");
   569			btrfs_set_opt(ctx->mount_opt, USEBACKUPROOT);
   570	
   571			/* If we're loading the backup roots we can't trust the space cache. */
   572			btrfs_set_opt(ctx->mount_opt, CLEAR_CACHE);
   573			break;
   574		case Opt_skip_balance:
   575			btrfs_set_opt(ctx->mount_opt, SKIP_BALANCE);
   576			break;
   577		case Opt_fatal_errors:
   578			switch (result.uint_32) {
   579			case Opt_fatal_errors_panic:
   580				btrfs_set_opt(ctx->mount_opt, PANIC_ON_FATAL_ERROR);
   581				break;
   582			case Opt_fatal_errors_bug:
   583				btrfs_clear_opt(ctx->mount_opt, PANIC_ON_FATAL_ERROR);
   584				break;
   585			default:
   586				btrfs_err(NULL, "unrecognized fatal_errors value %s",
   587					  param->key);
   588				return -EINVAL;
   589			}
   590			break;
   591		case Opt_commit_interval:
   592			ctx->commit_interval = result.uint_32;
   593			if (ctx->commit_interval > BTRFS_WARNING_COMMIT_INTERVAL) {
   594				btrfs_warn(NULL, "excessive commit interval %u, use with care",
   595					   ctx->commit_interval);
   596			}
   597			if (ctx->commit_interval == 0)
   598				ctx->commit_interval = BTRFS_DEFAULT_COMMIT_INTERVAL;
   599			break;
   600		case Opt_rescue:
   601			switch (result.uint_32) {
   602			case Opt_rescue_usebackuproot:
   603				btrfs_set_opt(ctx->mount_opt, USEBACKUPROOT);
   604				break;
   605			case Opt_rescue_nologreplay:
   606				btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
   607				break;
   608			case Opt_rescue_ignorebadroots:
   609				btrfs_set_opt(ctx->mount_opt, IGNOREBADROOTS);
   610				break;
   611			case Opt_rescue_ignoredatacsums:
   612				btrfs_set_opt(ctx->mount_opt, IGNOREDATACSUMS);
   613				break;
   614			case Opt_rescue_ignoremetacsums:
   615				btrfs_set_opt(ctx->mount_opt, IGNOREMETACSUMS);
   616				break;
   617			case Opt_rescue_ignoresuperflags:
   618				btrfs_set_opt(ctx->mount_opt, IGNORESUPERFLAGS);
   619				break;
   620			case Opt_rescue_parameter_all:
   621				btrfs_set_opt(ctx->mount_opt, IGNOREDATACSUMS);
   622				btrfs_set_opt(ctx->mount_opt, IGNOREMETACSUMS);
   623				btrfs_set_opt(ctx->mount_opt, IGNORESUPERFLAGS);
   624				btrfs_set_opt(ctx->mount_opt, IGNOREBADROOTS);
   625				btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
   626				break;
   627			default:
   628				btrfs_info(NULL, "unrecognized rescue option '%s'",
   629					   param->key);
   630				return -EINVAL;
   631			}
   632			break;
   633	#ifdef CONFIG_BTRFS_DEBUG
   634		case Opt_fragment:
   635			switch (result.uint_32) {
   636			case Opt_fragment_parameter_all:
   637				btrfs_set_opt(ctx->mount_opt, FRAGMENT_DATA);
   638				btrfs_set_opt(ctx->mount_opt, FRAGMENT_METADATA);
   639				break;
   640			case Opt_fragment_parameter_metadata:
   641				btrfs_set_opt(ctx->mount_opt, FRAGMENT_METADATA);
   642				break;
   643			case Opt_fragment_parameter_data:
   644				btrfs_set_opt(ctx->mount_opt, FRAGMENT_DATA);
   645				break;
   646			default:
   647				btrfs_info(NULL, "unrecognized fragment option '%s'",
   648					   param->key);
   649				return -EINVAL;
   650			}
   651			break;
   652		case Opt_ref_verify:
   653			btrfs_set_opt(ctx->mount_opt, REF_VERIFY);
   654			break;
   655		case Opt_ref_tracker:
   656			btrfs_set_opt(ctx->mount_opt, REF_TRACKER);
   657			break;
   658		case Opt_test_dummy_encryption:
 > 659			int ret;
   660	
   661			/*
   662			 * We only support v2, so reject any v1 policies.
   663			 */
   664			if (param->type == fs_value_is_string && *param->string &&
   665			    !strcmp(param->string, "v1")) {
   666				btrfs_info(NULL, "v1 encryption isn't supported");
   667				return -EINVAL;
   668			}
   669	
   670			btrfs_set_opt(ctx->mount_opt, TEST_DUMMY_ENCRYPTION);
   671			ret = fscrypt_parse_test_dummy_encryption(param, &ctx->dummy_enc_policy);
   672			if (ret)
   673				return ret;
   674			break;
   675	#endif
   676		default:
   677			btrfs_err(NULL, "unrecognized mount option '%s'", param->key);
   678			return -EINVAL;
   679		}
   680	
   681		return 0;
   682	}
   683	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
