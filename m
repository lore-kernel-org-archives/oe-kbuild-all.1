Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8252D97B5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 11:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782128742; cv=none; b=I/t13lZCcCZR+k+74clrArmJhvg6syFQWMUidOirx5qHCdOZu/X2xIQ7+ibhqvFQDyFnNtjDTUWWDwiZqFoPFh4c/WMPKm8XkyrmHw02WlOP5kJTkmfxXmtSEIxozcKkaVHsdi3N68OV3v5wau1DvyQEA7bBdqmnG7eItB39vzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782128742; c=relaxed/simple;
	bh=7odSQAOcL6xofd31Vhm+B0Td/Bwm9rMy5IYxH2RZNaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rVNgI6HhzN+XlSIUginOzT6R8rrU4NkGCrPPw9uaY29E7Lz42hJv5yjD5nbp5Pc5AzG+93gfPkIvuGFS+NkUMS85ylFqvLTlQSZKXN0ZeAUmlsC8UshKiJp6uIcUYCcUuHos2epbSj6cSyjL9Zlx+gFE45j7c7o7t6yGomXjUQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eV8rQXJj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eV8rQXJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782128740; x=1813664740;
  h=date:from:to:cc:subject:message-id;
  bh=7odSQAOcL6xofd31Vhm+B0Td/Bwm9rMy5IYxH2RZNaY=;
  b=eV8rQXJjEkO6bvmm2gSpIwVzBF58nS/ECysTxxH4c9+qfNJMH7zoi4Sy
   nrKRe6Yhb+ajEwJDHVc1QCyniNSn2GRN4elX1ItwWDVpDMz/8j9QTUBax
   wS4+Va0i9XbTdZ9PHbUAcpWj7CrLpxXOzEi+X5karr6kADkXd33aOJV3z
   MhWxRjhy+YS3xrOBgIDD2aBmBDCoGRhBU/YBR+tgm/PTMe469ynlCU/vr
   iTl6rK6z2g/I+cjx5l6Yk8cYxMgOWmUtejUKVz3Eaf+Gxd6IMRw8pzKKh
   20ZT2Sd8CxmqPG8wOyj5Q0ttpJr7GkQtqWs9R2MpTQrOqPoBibWyQn/mz
   Q==;
X-CSE-ConnectionGUID: uAd2IW0YTiyFw0VsIy/Qsw==
X-CSE-MsgGUID: xlcpFvDTSyKGTnwmvmKcBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93509938"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="93509938"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 04:45:39 -0700
X-CSE-ConnectionGUID: HzeNX09FTGCUuZ6y8xhRuQ==
X-CSE-MsgGUID: +cPAfnzQTi+8jBkuDu5/iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="272909168"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Jun 2026 04:45:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbd5r-00000000160-10M7;
	Mon, 22 Jun 2026 11:45:35 +0000
Date: Mon, 22 Jun 2026 19:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 34/47]
 fs/smb/server/smb2pdu.c:3941:undefined reference to `__moddi3'
Message-ID: <202606221904.YrBtA9aZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   e8683c3fba9d37761fcfb08ab47017e7cc7ca665
commit: b5040be73ddbcea282706f484f9b7eae08327706 [34/47] ksmbd: return requested create allocation size
config: i386-buildonly-randconfig-005-20260622 (https://download.01.org/0day-ci/archive/20260622/202606221904.YrBtA9aZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221904.YrBtA9aZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606221904.YrBtA9aZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/smb/server/smb2pdu.o: in function `smb2_open':
>> fs/smb/server/smb2pdu.c:3941:(.text+0x92f4): undefined reference to `__moddi3'


vim +3941 fs/smb/server/smb2pdu.c

  3100	
  3101	/**
  3102	 * smb2_open() - handler for smb file open request
  3103	 * @work:	smb work containing request buffer
  3104	 *
  3105	 * Return:      0 on success, otherwise error
  3106	 */
  3107	int smb2_open(struct ksmbd_work *work)
  3108	{
  3109		struct ksmbd_conn *conn = work->conn;
  3110		struct ksmbd_session *sess = work->sess;
  3111		struct ksmbd_tree_connect *tcon = work->tcon;
  3112		struct smb2_create_req *req;
  3113		struct smb2_create_rsp *rsp;
  3114		struct path path;
  3115		struct ksmbd_share_config *share = tcon->share_conf;
  3116		struct ksmbd_file *fp = NULL;
  3117		struct file *filp = NULL;
  3118		struct mnt_idmap *idmap = NULL;
  3119		struct kstat stat;
  3120		struct create_context *context;
  3121		struct lease_ctx_info *lc = NULL;
  3122		struct create_ea_buf_req *ea_buf = NULL;
  3123		struct oplock_info *opinfo;
  3124		struct durable_info dh_info = {0};
  3125		__le32 *next_ptr = NULL;
  3126		int req_op_level = 0, open_flags = 0, may_flags = 0, file_info = 0;
  3127		int rc = 0;
  3128		int contxt_cnt = 0, query_disk_id = 0;
  3129		bool maximal_access_ctxt = false, posix_ctxt = false;
  3130		int s_type = 0;
  3131		int next_off = 0;
  3132		char *name = NULL;
  3133		char *stream_name = NULL;
  3134		bool file_present = false, created = false, already_permitted = false;
  3135		int share_ret, need_truncate = 0;
  3136		u64 time, alloc_size = 0;
  3137		umode_t posix_mode = 0;
  3138		__le32 daccess, maximal_access = 0;
  3139		int iov_len = 0;
  3140	
  3141		ksmbd_debug(SMB, "Received smb2 create request\n");
  3142	
  3143		WORK_BUFFERS(work, req, rsp);
  3144	
  3145		if (req->hdr.NextCommand && !work->next_smb2_rcv_hdr_off &&
  3146		    (req->hdr.Flags & SMB2_FLAGS_RELATED_OPERATIONS)) {
  3147			ksmbd_debug(SMB, "invalid flag in chained command\n");
  3148			rsp->hdr.Status = STATUS_INVALID_PARAMETER;
  3149			smb2_set_err_rsp(work);
  3150			return -EINVAL;
  3151		}
  3152	
  3153		if (test_share_config_flag(share, KSMBD_SHARE_FLAG_PIPE)) {
  3154			ksmbd_debug(SMB, "IPC pipe create request\n");
  3155			return create_smb2_pipe(work);
  3156		}
  3157	
  3158		if (req->CreateContextsOffset && tcon->posix_extensions) {
  3159			context = smb2_find_context_vals(req, SMB2_CREATE_TAG_POSIX, 16);
  3160			if (IS_ERR(context)) {
  3161				rc = PTR_ERR(context);
  3162				goto err_out2;
  3163			} else if (context) {
  3164				struct create_posix *posix = (struct create_posix *)context;
  3165	
  3166				if (le16_to_cpu(context->DataOffset) +
  3167					le32_to_cpu(context->DataLength) <
  3168				    sizeof(struct create_posix) - 4) {
  3169					rc = -EINVAL;
  3170					goto err_out2;
  3171				}
  3172				ksmbd_debug(SMB, "get posix context\n");
  3173	
  3174				posix_mode = le32_to_cpu(posix->Mode);
  3175				posix_ctxt = true;
  3176			}
  3177		}
  3178	
  3179		if (req->NameLength) {
  3180			name = smb2_get_name((char *)req + le16_to_cpu(req->NameOffset),
  3181					     le16_to_cpu(req->NameLength),
  3182					     work->conn->local_nls);
  3183			if (IS_ERR(name)) {
  3184				rc = PTR_ERR(name);
  3185				name = NULL;
  3186				goto err_out2;
  3187			}
  3188	
  3189			ksmbd_debug(SMB, "converted name = %s\n", name);
  3190	
  3191			if (posix_ctxt == false) {
  3192				if (strchr(name, ':')) {
  3193					if (!test_share_config_flag(work->tcon->share_conf,
  3194								KSMBD_SHARE_FLAG_STREAMS)) {
  3195						rc = -EBADF;
  3196						goto err_out2;
  3197					}
  3198					rc = parse_stream_name(name, &stream_name, &s_type);
  3199					if (rc < 0)
  3200						goto err_out2;
  3201				}
  3202	
  3203				rc = ksmbd_validate_filename(name);
  3204				if (rc < 0)
  3205					goto err_out2;
  3206			}
  3207	
  3208			if (ksmbd_share_veto_filename(share, name)) {
  3209				rc = -ENOENT;
  3210				ksmbd_debug(SMB, "Reject open(), vetoed file: %s\n",
  3211					    name);
  3212				goto err_out2;
  3213			}
  3214		} else {
  3215			name = kstrdup("", KSMBD_DEFAULT_GFP);
  3216			if (!name) {
  3217				rc = -ENOMEM;
  3218				goto err_out2;
  3219			}
  3220		}
  3221	
  3222		req_op_level = req->RequestedOplockLevel;
  3223	
  3224		if (server_conf.flags & KSMBD_GLOBAL_FLAG_DURABLE_HANDLE &&
  3225		    req->CreateContextsOffset) {
  3226			lc = parse_lease_state(req);
  3227			if (IS_ERR(lc)) {
  3228				rc = PTR_ERR(lc);
  3229				lc = NULL;
  3230				goto err_out2;
  3231			}
  3232			if (lc && lc->version == 2 && conn->dialect < SMB30_PROT_ID) {
  3233				kfree(lc);
  3234				lc = NULL;
  3235				if (req_op_level == SMB2_OPLOCK_LEVEL_LEASE)
  3236					req_op_level = SMB2_OPLOCK_LEVEL_NONE;
  3237			}
  3238			rc = parse_durable_handle_context(work, req, lc, &dh_info);
  3239			if (rc) {
  3240				ksmbd_debug(SMB, "error parsing durable handle context\n");
  3241				goto err_out2;
  3242			}
  3243			rc = parse_app_instance_id(req, &dh_info);
  3244			if (rc)
  3245				goto err_out2;
  3246	
  3247			if (dh_info.reconnected == true) {
  3248				rc = smb2_check_durable_oplock(conn, share, dh_info.fp,
  3249						lc, sess->user, name);
  3250				if (rc)
  3251					goto err_out2;
  3252	
  3253				rc = ksmbd_reopen_durable_fd(work, dh_info.fp);
  3254				if (rc)
  3255					goto err_out2;
  3256	
  3257				fp = dh_info.fp;
  3258	
  3259				if (ksmbd_override_fsids(work)) {
  3260					rc = -ENOMEM;
  3261					goto err_out2;
  3262				}
  3263	
  3264				file_info = FILE_OPENED;
  3265	
  3266				rc = ksmbd_vfs_getattr(&fp->filp->f_path, &stat);
  3267				if (rc)
  3268					goto err_out2;
  3269	
  3270				goto reconnected_fp;
  3271			}
  3272	
  3273			if (dh_info.type == DURABLE_REQ_V2 && dh_info.app_instance_id)
  3274				ksmbd_close_fd_app_instance_id(dh_info.AppInstanceId);
  3275		} else if (req_op_level == SMB2_OPLOCK_LEVEL_LEASE) {
  3276			lc = parse_lease_state(req);
  3277			if (IS_ERR(lc)) {
  3278				rc = PTR_ERR(lc);
  3279				lc = NULL;
  3280				goto err_out2;
  3281			}
  3282			if (lc && lc->version == 2 && conn->dialect < SMB30_PROT_ID) {
  3283				kfree(lc);
  3284				lc = NULL;
  3285				req_op_level = SMB2_OPLOCK_LEVEL_NONE;
  3286			}
  3287		}
  3288	
  3289		if (le32_to_cpu(req->ImpersonationLevel) > le32_to_cpu(IL_DELEGATE)) {
  3290			pr_err("Invalid impersonationlevel : 0x%x\n",
  3291			       le32_to_cpu(req->ImpersonationLevel));
  3292			rc = -EIO;
  3293			rsp->hdr.Status = STATUS_BAD_IMPERSONATION_LEVEL;
  3294			goto err_out2;
  3295		}
  3296	
  3297		if (req->CreateOptions && !(req->CreateOptions & CREATE_OPTIONS_MASK_LE)) {
  3298			pr_err("Invalid create options : 0x%x\n",
  3299			       le32_to_cpu(req->CreateOptions));
  3300			rc = -EINVAL;
  3301			goto err_out2;
  3302		} else {
  3303			if (req->CreateOptions & FILE_SEQUENTIAL_ONLY_LE &&
  3304			    req->CreateOptions & FILE_RANDOM_ACCESS_LE)
  3305				req->CreateOptions &= ~FILE_SEQUENTIAL_ONLY_LE;
  3306	
  3307			if (req->CreateOptions &
  3308			    (FILE_OPEN_BY_FILE_ID_LE | CREATE_TREE_CONNECTION |
  3309			     FILE_RESERVE_OPFILTER_LE)) {
  3310				rc = -EOPNOTSUPP;
  3311				goto err_out2;
  3312			}
  3313	
  3314			if (req->CreateOptions & FILE_DIRECTORY_FILE_LE) {
  3315				if (req->CreateOptions & FILE_NON_DIRECTORY_FILE_LE) {
  3316					rc = -EINVAL;
  3317					goto err_out2;
  3318				} else if (req->CreateOptions & FILE_NO_COMPRESSION_LE) {
  3319					req->CreateOptions &= ~FILE_NO_COMPRESSION_LE;
  3320				}
  3321			}
  3322		}
  3323	
  3324		if (le32_to_cpu(req->CreateDisposition) >
  3325		    le32_to_cpu(FILE_OVERWRITE_IF_LE)) {
  3326			pr_err("Invalid create disposition : 0x%x\n",
  3327			       le32_to_cpu(req->CreateDisposition));
  3328			rc = -EINVAL;
  3329			goto err_out2;
  3330		}
  3331	
  3332		if (!(req->DesiredAccess & DESIRED_ACCESS_MASK)) {
  3333			pr_err("Invalid desired access : 0x%x\n",
  3334			       le32_to_cpu(req->DesiredAccess));
  3335			rc = -EACCES;
  3336			goto err_out2;
  3337		}
  3338	
  3339		if (req->DesiredAccess == FILE_SYNCHRONIZE_LE &&
  3340		    req->CreateDisposition == FILE_OPEN_IF_LE &&
  3341		    !req->FileAttributes) {
  3342			rc = -EACCES;
  3343			goto err_out2;
  3344		}
  3345	
  3346		if (req->FileAttributes &&
  3347		    (req->FileAttributes & ~cpu_to_le32(SMB2_CREATE_FILE_ATTRIBUTE_MASK))) {
  3348			pr_err("Invalid file attribute : 0x%x\n",
  3349			       le32_to_cpu(req->FileAttributes));
  3350			rc = -EINVAL;
  3351			goto err_out2;
  3352		}
  3353	
  3354		if (req->CreateContextsOffset) {
  3355			/* Parse non-durable handle create contexts */
  3356			context = smb2_find_context_vals(req, SMB2_CREATE_EA_BUFFER, 4);
  3357			if (IS_ERR(context)) {
  3358				rc = PTR_ERR(context);
  3359				goto err_out2;
  3360			} else if (context) {
  3361				ea_buf = (struct create_ea_buf_req *)context;
  3362				if (le16_to_cpu(context->DataOffset) +
  3363				    le32_to_cpu(context->DataLength) <
  3364				    sizeof(struct create_ea_buf_req)) {
  3365					rc = -EINVAL;
  3366					goto err_out2;
  3367				}
  3368				if (req->CreateOptions & FILE_NO_EA_KNOWLEDGE_LE) {
  3369					rsp->hdr.Status = STATUS_ACCESS_DENIED;
  3370					rc = -EACCES;
  3371					goto err_out2;
  3372				}
  3373			}
  3374	
  3375			context = smb2_find_context_vals(req,
  3376							 SMB2_CREATE_QUERY_MAXIMAL_ACCESS_REQUEST, 4);
  3377			if (IS_ERR(context)) {
  3378				rc = PTR_ERR(context);
  3379				goto err_out2;
  3380			} else if (context) {
  3381				ksmbd_debug(SMB,
  3382					    "get query maximal access context\n");
  3383				maximal_access_ctxt = 1;
  3384			}
  3385	
  3386			context = smb2_find_context_vals(req,
  3387							 SMB2_CREATE_TIMEWARP_REQUEST, 4);
  3388			if (IS_ERR(context)) {
  3389				rc = PTR_ERR(context);
  3390				goto err_out2;
  3391			} else if (context) {
  3392				ksmbd_debug(SMB, "get timewarp context\n");
  3393				rc = -EBADF;
  3394				goto err_out2;
  3395			}
  3396		}
  3397	
  3398		if (ksmbd_override_fsids(work)) {
  3399			rc = -ENOMEM;
  3400			goto err_out2;
  3401		}
  3402	
  3403		rc = ksmbd_vfs_kern_path(work, name, LOOKUP_NO_SYMLINKS,
  3404					 &path, 1);
  3405	
  3406		/*
  3407		 * A durable handle opened with delete-on-close is preserved across a
  3408		 * disconnect so it can be reclaimed by a durable reconnect.  When a new
  3409		 * delete-on-close open for the same name arrives instead, the
  3410		 * disconnected handle must give way: close it so its delete-on-close
  3411		 * removes the file, then re-resolve so this open can create a fresh one.
  3412		 */
  3413		if (!rc && (req->CreateOptions & FILE_DELETE_ON_CLOSE_LE) &&
  3414		    (req->CreateDisposition == FILE_OVERWRITE_IF_LE ||
  3415		     req->CreateDisposition == FILE_OPEN_IF_LE) &&
  3416		    ksmbd_close_disconnected_durable_delete_on_close(path.dentry)) {
  3417			path_put(&path);
  3418			rc = ksmbd_vfs_kern_path(work, name, LOOKUP_NO_SYMLINKS,
  3419						 &path, 1);
  3420		}
  3421	
  3422		if (!rc) {
  3423			file_present = true;
  3424	
  3425			if (req->CreateOptions & FILE_DELETE_ON_CLOSE_LE) {
  3426				/*
  3427				 * If file exists with under flags, return access
  3428				 * denied error.
  3429				 */
  3430				if (req->CreateDisposition == FILE_OVERWRITE_IF_LE ||
  3431				    req->CreateDisposition == FILE_OPEN_IF_LE) {
  3432					rc = -EACCES;
  3433					goto err_out;
  3434				}
  3435	
  3436				if (!test_tree_conn_flag(tcon, KSMBD_TREE_CONN_FLAG_WRITABLE)) {
  3437					ksmbd_debug(SMB,
  3438						    "User does not have write permission\n");
  3439					rc = -EACCES;
  3440					goto err_out;
  3441				}
  3442			} else if (d_is_symlink(path.dentry)) {
  3443				rc = -EACCES;
  3444				goto err_out;
  3445			}
  3446	
  3447			idmap = mnt_idmap(path.mnt);
  3448		} else {
  3449			if (rc != -ENOENT)
  3450				goto err_out;
  3451			ksmbd_debug(SMB, "can not get linux path for %s, rc = %d\n",
  3452				    name, rc);
  3453			rc = 0;
  3454		}
  3455	
  3456		if (stream_name) {
  3457			if (req->CreateOptions & FILE_DIRECTORY_FILE_LE) {
  3458				if (s_type == DATA_STREAM) {
  3459					rc = -EIO;
  3460					rsp->hdr.Status = STATUS_NOT_A_DIRECTORY;
  3461				}
  3462			} else {
  3463				if (file_present && S_ISDIR(d_inode(path.dentry)->i_mode) &&
  3464				    s_type == DATA_STREAM) {
  3465					rc = -EIO;
  3466					rsp->hdr.Status = STATUS_FILE_IS_A_DIRECTORY;
  3467				}
  3468			}
  3469	
  3470			if (req->CreateOptions & FILE_DIRECTORY_FILE_LE &&
  3471			    req->FileAttributes & FILE_ATTRIBUTE_NORMAL_LE) {
  3472				rsp->hdr.Status = STATUS_NOT_A_DIRECTORY;
  3473				rc = -EIO;
  3474			}
  3475	
  3476			if (rc < 0)
  3477				goto err_out;
  3478		}
  3479	
  3480		if (file_present && req->CreateOptions & FILE_NON_DIRECTORY_FILE_LE &&
  3481		    S_ISDIR(d_inode(path.dentry)->i_mode) &&
  3482		    !(req->CreateOptions & FILE_DELETE_ON_CLOSE_LE)) {
  3483			ksmbd_debug(SMB, "open() argument is a directory: %s, %x\n",
  3484				    name, req->CreateOptions);
  3485			rsp->hdr.Status = STATUS_FILE_IS_A_DIRECTORY;
  3486			rc = -EIO;
  3487			goto err_out;
  3488		}
  3489	
  3490		if (file_present && (req->CreateOptions & FILE_DIRECTORY_FILE_LE) &&
  3491		    !(req->CreateDisposition == FILE_CREATE_LE) &&
  3492		    !S_ISDIR(d_inode(path.dentry)->i_mode)) {
  3493			rsp->hdr.Status = STATUS_NOT_A_DIRECTORY;
  3494			rc = -EIO;
  3495			goto err_out;
  3496		}
  3497	
  3498		if (!stream_name && file_present &&
  3499		    req->CreateDisposition == FILE_CREATE_LE) {
  3500			rc = -EEXIST;
  3501			goto err_out;
  3502		}
  3503	
  3504		daccess = smb_map_generic_desired_access(req->DesiredAccess);
  3505	
  3506		if (file_present && !(req->CreateOptions & FILE_DELETE_ON_CLOSE_LE)) {
  3507			rc = smb_check_perm_dacl(conn, &path, &daccess,
  3508						 sess->user->uid);
  3509			if (rc)
  3510				goto err_out;
  3511		}
  3512	
  3513		if (daccess & FILE_MAXIMAL_ACCESS_LE) {
  3514			if (!file_present) {
  3515				daccess = cpu_to_le32(GENERIC_ALL_FLAGS);
  3516			} else {
  3517				ksmbd_vfs_query_maximal_access(idmap,
  3518								    path.dentry,
  3519								    &daccess);
  3520				already_permitted = true;
  3521			}
  3522			maximal_access = daccess;
  3523		}
  3524	
  3525		open_flags = smb2_create_open_flags(file_present, daccess,
  3526						    req->CreateDisposition,
  3527						    &may_flags,
  3528						    req->CreateOptions,
  3529						    file_present ? d_inode(path.dentry)->i_mode : 0);
  3530	
  3531		if (!test_tree_conn_flag(tcon, KSMBD_TREE_CONN_FLAG_WRITABLE)) {
  3532			if (open_flags & (O_CREAT | O_TRUNC)) {
  3533				ksmbd_debug(SMB,
  3534					    "User does not have write permission\n");
  3535				rc = -EACCES;
  3536				goto err_out;
  3537			}
  3538		}
  3539	
  3540		/*create file if not present */
  3541		if (!file_present) {
  3542			rc = smb2_creat(work, &path, name, open_flags,
  3543					posix_mode,
  3544					req->CreateOptions & FILE_DIRECTORY_FILE_LE);
  3545			if (rc) {
  3546				if (rc == -ENOENT) {
  3547					rc = -EIO;
  3548					rsp->hdr.Status = STATUS_OBJECT_PATH_NOT_FOUND;
  3549				}
  3550				goto err_out;
  3551			}
  3552	
  3553			created = true;
  3554			idmap = mnt_idmap(path.mnt);
  3555			if (ea_buf) {
  3556				if (le32_to_cpu(ea_buf->ccontext.DataLength) <
  3557				    sizeof(struct smb2_ea_info)) {
  3558					rc = -EINVAL;
  3559					goto err_out;
  3560				}
  3561	
  3562				rc = smb2_set_ea(&ea_buf->ea,
  3563						 le32_to_cpu(ea_buf->ccontext.DataLength),
  3564						 &path, false);
  3565				if (rc == -EOPNOTSUPP)
  3566					rc = 0;
  3567				else if (rc)
  3568					goto err_out;
  3569			}
  3570		} else if (!already_permitted) {
  3571			/* FILE_READ_ATTRIBUTE is allowed without inode_permission,
  3572			 * because execute(search) permission on a parent directory,
  3573			 * is already granted.
  3574			 */
  3575			if (daccess & ~(FILE_READ_ATTRIBUTES_LE | FILE_READ_CONTROL_LE)) {
  3576				rc = inode_permission(idmap,
  3577						      d_inode(path.dentry),
  3578						      may_flags);
  3579				if (rc)
  3580					goto err_out;
  3581	
  3582				if ((daccess & FILE_DELETE_LE) ||
  3583				    (req->CreateOptions & FILE_DELETE_ON_CLOSE_LE)) {
  3584					rc = inode_permission(idmap,
  3585							      d_inode(path.dentry->d_parent),
  3586							      MAY_EXEC | MAY_WRITE);
  3587					if (rc)
  3588						goto err_out;
  3589				}
  3590			}
  3591		}
  3592	
  3593		rc = ksmbd_query_inode_status(path.dentry->d_parent);
  3594		if (rc == KSMBD_INODE_STATUS_PENDING_DELETE) {
  3595			rc = -EBUSY;
  3596			goto err_out;
  3597		}
  3598	
  3599		rc = 0;
  3600		filp = dentry_open(&path, open_flags, current_cred());
  3601		if (IS_ERR(filp)) {
  3602			rc = PTR_ERR(filp);
  3603			pr_err("dentry open for dir failed, rc %d\n", rc);
  3604			goto err_out;
  3605		}
  3606	
  3607		if (file_present) {
  3608			if (!(open_flags & O_TRUNC))
  3609				file_info = FILE_OPENED;
  3610			else
  3611				file_info = FILE_OVERWRITTEN;
  3612	
  3613			if ((req->CreateDisposition & FILE_CREATE_MASK_LE) ==
  3614			    FILE_SUPERSEDE_LE)
  3615				file_info = FILE_SUPERSEDED;
  3616		} else if (open_flags & O_CREAT) {
  3617			file_info = FILE_CREATED;
  3618		}
  3619	
  3620		ksmbd_vfs_set_fadvise(filp, req->CreateOptions);
  3621	
  3622		/* Obtain Volatile-ID */
  3623		fp = ksmbd_open_fd(work, filp);
  3624		if (IS_ERR(fp)) {
  3625			fput(filp);
  3626			rc = PTR_ERR(fp);
  3627			fp = NULL;
  3628			goto err_out;
  3629		}
  3630	
  3631		/* Get Persistent-ID */
  3632		ksmbd_open_durable_fd(fp);
  3633		if (!has_file_id(fp->persistent_id)) {
  3634			rc = -ENOMEM;
  3635			goto err_out;
  3636		}
  3637	
  3638		fp->cdoption = req->CreateDisposition;
  3639		fp->daccess = daccess;
  3640		fp->saccess = req->ShareAccess;
  3641		fp->coption = req->CreateOptions;
  3642	
  3643		/* Set default windows and posix acls if creating new file */
  3644		if (created) {
  3645			int posix_acl_rc;
  3646			struct inode *inode = d_inode(path.dentry);
  3647	
  3648			posix_acl_rc = ksmbd_vfs_inherit_posix_acl(idmap,
  3649								   &path,
  3650								   d_inode(path.dentry->d_parent));
  3651			if (posix_acl_rc)
  3652				ksmbd_debug(SMB, "inherit posix acl failed : %d\n", posix_acl_rc);
  3653	
  3654			if (test_share_config_flag(work->tcon->share_conf,
  3655						   KSMBD_SHARE_FLAG_ACL_XATTR)) {
  3656				rc = smb_inherit_dacl(conn, &path, sess->user->uid,
  3657						      sess->user->gid);
  3658			}
  3659	
  3660			if (rc) {
  3661				rc = smb2_create_sd_buffer(work, req, &path);
  3662				if (rc) {
  3663					if (posix_acl_rc)
  3664						ksmbd_vfs_set_init_posix_acl(idmap,
  3665									     &path);
  3666	
  3667					if (test_share_config_flag(work->tcon->share_conf,
  3668								   KSMBD_SHARE_FLAG_ACL_XATTR)) {
  3669						struct smb_fattr fattr;
  3670						struct smb_ntsd *pntsd;
  3671						int pntsd_size;
  3672						size_t scratch_len;
  3673	
  3674						ksmbd_acls_fattr(&fattr, idmap, inode);
  3675						scratch_len = smb_acl_sec_desc_scratch_len(&fattr,
  3676								NULL, 0,
  3677								OWNER_SECINFO | GROUP_SECINFO |
  3678								DACL_SECINFO);
  3679						if (!scratch_len || scratch_len == SIZE_MAX) {
  3680							rc = -EFBIG;
  3681							posix_acl_release(fattr.cf_acls);
  3682							posix_acl_release(fattr.cf_dacls);
  3683							goto err_out;
  3684						}
  3685	
  3686						pntsd = kvzalloc(scratch_len, KSMBD_DEFAULT_GFP);
  3687						if (!pntsd) {
  3688							rc = -ENOMEM;
  3689							posix_acl_release(fattr.cf_acls);
  3690							posix_acl_release(fattr.cf_dacls);
  3691							goto err_out;
  3692						}
  3693	
  3694						rc = build_sec_desc(idmap,
  3695								    pntsd, NULL, 0,
  3696								    OWNER_SECINFO |
  3697								    GROUP_SECINFO |
  3698								    DACL_SECINFO,
  3699								    &pntsd_size, &fattr);
  3700						posix_acl_release(fattr.cf_acls);
  3701						posix_acl_release(fattr.cf_dacls);
  3702						if (rc) {
  3703							kvfree(pntsd);
  3704							goto err_out;
  3705						}
  3706	
  3707						rc = ksmbd_vfs_set_sd_xattr(conn,
  3708									    idmap,
  3709									    &path,
  3710									    pntsd,
  3711									    pntsd_size,
  3712									    false);
  3713						kvfree(pntsd);
  3714						if (rc)
  3715							pr_err("failed to store ntacl in xattr : %d\n",
  3716							       rc);
  3717					}
  3718				}
  3719			}
  3720			rc = 0;
  3721		}
  3722	
  3723		if (stream_name) {
  3724			rc = smb2_set_stream_name_xattr(&path,
  3725							fp,
  3726							stream_name,
  3727							s_type);
  3728			if (rc)
  3729				goto err_out;
  3730			file_info = FILE_CREATED;
  3731		}
  3732	
  3733		fp->attrib_only = !(req->DesiredAccess & ~(FILE_READ_ATTRIBUTES_LE |
  3734				FILE_WRITE_ATTRIBUTES_LE | FILE_SYNCHRONIZE_LE));
  3735	
  3736		fp->is_posix_ctxt = posix_ctxt;
  3737	
  3738		/* fp should be searchable through ksmbd_inode.m_fp_list
  3739		 * after daccess, saccess, attrib_only, and stream are
  3740		 * initialized.
  3741		 */
  3742		down_write(&fp->f_ci->m_lock);
  3743		list_add(&fp->node, &fp->f_ci->m_fp_list);
  3744		up_write(&fp->f_ci->m_lock);
  3745	
  3746		/* Check delete pending among previous fp before oplock break */
  3747		if (ksmbd_inode_pending_delete(fp)) {
  3748			rc = -EBUSY;
  3749			goto err_out;
  3750		}
  3751	
  3752		if (!stream_name && daccess & FILE_DELETE_LE &&
  3753		    ksmbd_has_stream_without_delete_share(fp)) {
  3754			rc = -EPERM;
  3755			goto err_out;
  3756		}
  3757	
  3758		if (file_present || created)
  3759			path_put(&path);
  3760	
  3761		if (!S_ISDIR(file_inode(filp)->i_mode) && open_flags & O_TRUNC &&
  3762		    !fp->attrib_only && !stream_name) {
  3763			smb_break_all_oplock(work, fp);
  3764			need_truncate = 1;
  3765		}
  3766	
  3767		share_ret = ksmbd_smb_check_shared_mode(fp->filp, fp);
  3768		if (!test_share_config_flag(work->tcon->share_conf, KSMBD_SHARE_FLAG_OPLOCKS) ||
  3769		    (req_op_level == SMB2_OPLOCK_LEVEL_LEASE &&
  3770		     !(conn->vals->req_capabilities & SMB2_GLOBAL_CAP_LEASING))) {
  3771			if (share_ret < 0 && !S_ISDIR(file_inode(fp->filp)->i_mode)) {
  3772				rc = share_ret;
  3773				goto err_out1;
  3774			}
  3775		} else {
  3776			if (req_op_level == SMB2_OPLOCK_LEVEL_LEASE && lc) {
  3777				if (S_ISDIR(file_inode(filp)->i_mode)) {
  3778					lc->req_state &= ~SMB2_LEASE_WRITE_CACHING_LE;
  3779					lc->is_dir = true;
  3780				}
  3781	
  3782				/*
  3783				 * Compare parent lease using parent key. If there is no
  3784				 * a lease that has same parent key, Send lease break
  3785				 * notification.
  3786				 */
  3787				smb_send_parent_lease_break_noti(fp, lc);
  3788	
  3789				req_op_level = smb2_map_lease_to_oplock(lc->req_state);
  3790				ksmbd_debug(SMB,
  3791					    "lease req for(%s) req oplock state 0x%x, lease state 0x%x\n",
  3792					    name, req_op_level, lc->req_state);
  3793				rc = find_same_lease_key(conn, fp->f_ci, lc);
  3794				if (rc)
  3795					goto err_out1;
  3796			} else if (open_flags == O_RDONLY &&
  3797				   (req_op_level == SMB2_OPLOCK_LEVEL_BATCH ||
  3798				    req_op_level == SMB2_OPLOCK_LEVEL_EXCLUSIVE))
  3799				req_op_level = SMB2_OPLOCK_LEVEL_II;
  3800	
  3801			rc = smb_grant_oplock(work, req_op_level,
  3802					      fp->persistent_id, fp,
  3803					      le32_to_cpu(req->hdr.Id.SyncId.TreeId),
  3804					      lc, share_ret);
  3805			if (rc < 0)
  3806				goto err_out1;
  3807		}
  3808	
  3809		if (req->CreateOptions & FILE_DELETE_ON_CLOSE_LE) {
  3810			smb_break_all_levII_oplock(work, fp, 0);
  3811			ksmbd_fd_set_delete_on_close(fp, file_info);
  3812		}
  3813	
  3814		if (need_truncate) {
  3815			rc = smb2_create_truncate(&fp->filp->f_path);
  3816			if (rc)
  3817				goto err_out1;
  3818		}
  3819	
  3820		if (req->CreateContextsOffset) {
  3821			struct create_alloc_size_req *az_req;
  3822	
  3823			az_req = (struct create_alloc_size_req *)smb2_find_context_vals(req,
  3824						SMB2_CREATE_ALLOCATION_SIZE, 4);
  3825			if (IS_ERR(az_req)) {
  3826				rc = PTR_ERR(az_req);
  3827				goto err_out1;
  3828			} else if (az_req) {
  3829				int err;
  3830	
  3831				if (le16_to_cpu(az_req->ccontext.DataOffset) +
  3832				    le32_to_cpu(az_req->ccontext.DataLength) <
  3833				    sizeof(struct create_alloc_size_req)) {
  3834					rc = -EINVAL;
  3835					goto err_out1;
  3836				}
  3837				alloc_size = le64_to_cpu(az_req->AllocationSize);
  3838				ksmbd_debug(SMB,
  3839					    "request smb2 create allocate size : %llu\n",
  3840					    alloc_size);
  3841				smb_break_all_levII_oplock(work, fp, 1);
  3842				err = vfs_fallocate(fp->filp, FALLOC_FL_KEEP_SIZE, 0,
  3843						    alloc_size);
  3844				if (err < 0)
  3845					ksmbd_debug(SMB,
  3846						    "vfs_fallocate is failed : %d\n",
  3847						    err);
  3848			}
  3849	
  3850			context = smb2_find_context_vals(req, SMB2_CREATE_QUERY_ON_DISK_ID, 4);
  3851			if (IS_ERR(context)) {
  3852				rc = PTR_ERR(context);
  3853				goto err_out1;
  3854			} else if (context) {
  3855				ksmbd_debug(SMB, "get query on disk id context\n");
  3856				query_disk_id = 1;
  3857			}
  3858	
  3859			if (conn->is_aapl == false) {
  3860				context = smb2_find_context_vals(req, SMB2_CREATE_AAPL, 4);
  3861				if (IS_ERR(context)) {
  3862					rc = PTR_ERR(context);
  3863					goto err_out1;
  3864				} else if (context)
  3865					conn->is_aapl = true;
  3866			}
  3867		}
  3868	
  3869		rc = ksmbd_vfs_getattr(&path, &stat);
  3870		if (rc)
  3871			goto err_out1;
  3872	
  3873		if (stat.result_mask & STATX_BTIME)
  3874			fp->create_time = ksmbd_UnixTimeToNT(stat.btime);
  3875		else
  3876			fp->create_time = ksmbd_UnixTimeToNT(stat.ctime);
  3877		fp->change_time = ksmbd_UnixTimeToNT(stat.ctime);
  3878		fp->allocation_size = S_ISDIR(stat.mode) ? 0 :
  3879			(alloc_size ?: stat.blocks << 9);
  3880		if (req->FileAttributes || fp->f_ci->m_fattr == 0)
  3881			fp->f_ci->m_fattr =
  3882				cpu_to_le32(smb2_get_dos_mode(&stat, le32_to_cpu(req->FileAttributes)));
  3883	
  3884		if (!created)
  3885			smb2_update_xattrs(tcon, &path, fp);
  3886	
  3887		ksmbd_vfs_update_compressed_fattr(path.dentry, &fp->f_ci->m_fattr);
  3888	
  3889		if (created)
  3890			smb2_new_xattrs(tcon, &path, fp);
  3891	
  3892		memcpy(fp->client_guid, conn->ClientGUID, SMB2_CLIENT_GUID_SIZE);
  3893	
  3894		if (dh_info.type == DURABLE_REQ_V2 || dh_info.type == DURABLE_REQ) {
  3895			if (dh_info.type == DURABLE_REQ_V2 && dh_info.persistent &&
  3896			    test_share_config_flag(work->tcon->share_conf,
  3897						   KSMBD_SHARE_FLAG_CONTINUOUS_AVAILABILITY))
  3898				fp->is_persistent = true;
  3899			else
  3900				fp->is_durable = true;
  3901	
  3902			if (dh_info.type == DURABLE_REQ_V2) {
  3903				memcpy(fp->create_guid, dh_info.CreateGuid,
  3904						SMB2_CREATE_GUID_SIZE);
  3905				if (dh_info.app_instance_id)
  3906					memcpy(fp->app_instance_id,
  3907					       dh_info.AppInstanceId,
  3908					       SMB2_CREATE_GUID_SIZE);
  3909				if (dh_info.timeout)
  3910					fp->durable_timeout =
  3911						min_t(unsigned int, dh_info.timeout,
  3912						      DURABLE_HANDLE_MAX_TIMEOUT);
  3913				else
  3914					fp->durable_timeout = 60;
  3915			}
  3916		}
  3917	
  3918	reconnected_fp:
  3919		rsp->StructureSize = cpu_to_le16(89);
  3920		opinfo = opinfo_get(fp);
  3921		rsp->OplockLevel = opinfo != NULL ? opinfo->level : 0;
  3922		rsp->Flags = 0;
  3923		rsp->CreateAction = cpu_to_le32(file_info);
  3924		rsp->CreationTime = cpu_to_le64(fp->create_time);
  3925		time = ksmbd_UnixTimeToNT(stat.atime);
  3926		rsp->LastAccessTime = cpu_to_le64(time);
  3927		time = ksmbd_UnixTimeToNT(stat.mtime);
  3928		rsp->LastWriteTime = cpu_to_le64(time);
  3929		rsp->ChangeTime = cpu_to_le64(fp->change_time);
  3930		/*
  3931		 * The cached allocation size hides filesystem rounding for the
  3932		 * requested allocation, but it can go stale when the file grows past
  3933		 * it via writes (e.g. across a durable reconnect). Refresh it once the
  3934		 * file exceeds the cached value, rounding the end of file up to the
  3935		 * volume allocation unit (the filesystem block size, matching the
  3936		 * SectorsPerAllocationUnit/BytesPerSector ksmbd advertises) rather than
  3937		 * using the raw on-disk block count, which can include filesystem
  3938		 * preallocation and metadata rounding.
  3939		 */
  3940		if (!S_ISDIR(stat.mode) && stat.size > fp->allocation_size)
> 3941			fp->allocation_size = roundup(stat.size, stat.blksize);
  3942		rsp->AllocationSize = cpu_to_le64(fp->allocation_size);
  3943		rsp->EndofFile = S_ISDIR(stat.mode) ? 0 : cpu_to_le64(stat.size);
  3944		rsp->FileAttributes = fp->f_ci->m_fattr;
  3945	
  3946		rsp->Reserved2 = 0;
  3947	
  3948		rsp->PersistentFileId = fp->persistent_id;
  3949		rsp->VolatileFileId = fp->volatile_id;
  3950	
  3951		rsp->CreateContextsOffset = 0;
  3952		rsp->CreateContextsLength = 0;
  3953		iov_len = offsetof(struct smb2_create_rsp, Buffer);
  3954	
  3955		/* If lease is request send lease context response */
  3956		if (opinfo && opinfo->is_lease) {
  3957			struct create_context *lease_ccontext;
  3958	
  3959			ksmbd_debug(SMB, "lease granted on(%s) lease state 0x%x\n",
  3960				    name, opinfo->o_lease->state);
  3961			rsp->OplockLevel = SMB2_OPLOCK_LEVEL_LEASE;
  3962	
  3963			lease_ccontext = (struct create_context *)rsp->Buffer;
  3964			contxt_cnt++;
  3965			create_lease_buf(rsp->Buffer, opinfo->o_lease);
  3966			le32_add_cpu(&rsp->CreateContextsLength,
  3967				     conn->vals->create_lease_size);
  3968			iov_len += conn->vals->create_lease_size;
  3969			next_ptr = &lease_ccontext->Next;
  3970			next_off = conn->vals->create_lease_size;
  3971		}
  3972		opinfo_put(opinfo);
  3973	
  3974		if (maximal_access_ctxt) {
  3975			struct create_context *mxac_ccontext;
  3976	
  3977			if (maximal_access == 0)
  3978				ksmbd_vfs_query_maximal_access(idmap,
  3979							       path.dentry,
  3980							       &maximal_access);
  3981			mxac_ccontext = (struct create_context *)(rsp->Buffer +
  3982					le32_to_cpu(rsp->CreateContextsLength));
  3983			contxt_cnt++;
  3984			create_mxac_rsp_buf(rsp->Buffer +
  3985					le32_to_cpu(rsp->CreateContextsLength),
  3986					le32_to_cpu(maximal_access));
  3987			le32_add_cpu(&rsp->CreateContextsLength,
  3988				     conn->vals->create_mxac_size);
  3989			iov_len += conn->vals->create_mxac_size;
  3990			if (next_ptr)
  3991				*next_ptr = cpu_to_le32(next_off);
  3992			next_ptr = &mxac_ccontext->Next;
  3993			next_off = conn->vals->create_mxac_size;
  3994		}
  3995	
  3996		if (query_disk_id) {
  3997			struct create_context *disk_id_ccontext;
  3998	
  3999			disk_id_ccontext = (struct create_context *)(rsp->Buffer +
  4000					le32_to_cpu(rsp->CreateContextsLength));
  4001			contxt_cnt++;
  4002			create_disk_id_rsp_buf(rsp->Buffer +
  4003					le32_to_cpu(rsp->CreateContextsLength),
  4004					stat.ino, tcon->id);
  4005			le32_add_cpu(&rsp->CreateContextsLength,
  4006				     conn->vals->create_disk_id_size);
  4007			iov_len += conn->vals->create_disk_id_size;
  4008			if (next_ptr)
  4009				*next_ptr = cpu_to_le32(next_off);
  4010			next_ptr = &disk_id_ccontext->Next;
  4011			next_off = conn->vals->create_disk_id_size;
  4012		}
  4013	
  4014		if (dh_info.type == DURABLE_REQ || dh_info.type == DURABLE_REQ_V2) {
  4015			struct create_context *durable_ccontext;
  4016	
  4017			durable_ccontext = (struct create_context *)(rsp->Buffer +
  4018					le32_to_cpu(rsp->CreateContextsLength));
  4019			contxt_cnt++;
  4020			if (dh_info.type == DURABLE_REQ) {
  4021				create_durable_rsp_buf(rsp->Buffer +
  4022						le32_to_cpu(rsp->CreateContextsLength));
  4023				le32_add_cpu(&rsp->CreateContextsLength,
  4024						conn->vals->create_durable_size);
  4025				iov_len += conn->vals->create_durable_size;
  4026			} else {
  4027				create_durable_v2_rsp_buf(rsp->Buffer +
  4028						le32_to_cpu(rsp->CreateContextsLength),
  4029						fp);
  4030				le32_add_cpu(&rsp->CreateContextsLength,
  4031						conn->vals->create_durable_v2_size);
  4032				iov_len += conn->vals->create_durable_v2_size;
  4033			}
  4034	
  4035			if (next_ptr)
  4036				*next_ptr = cpu_to_le32(next_off);
  4037			next_ptr = &durable_ccontext->Next;
  4038			next_off = conn->vals->create_durable_size;
  4039		}
  4040	
  4041		if (posix_ctxt) {
  4042			contxt_cnt++;
  4043			create_posix_rsp_buf(rsp->Buffer +
  4044					le32_to_cpu(rsp->CreateContextsLength),
  4045					fp);
  4046			le32_add_cpu(&rsp->CreateContextsLength,
  4047				     conn->vals->create_posix_size);
  4048			iov_len += conn->vals->create_posix_size;
  4049			if (next_ptr)
  4050				*next_ptr = cpu_to_le32(next_off);
  4051		}
  4052	
  4053		if (contxt_cnt > 0) {
  4054			rsp->CreateContextsOffset =
  4055				cpu_to_le32(offsetof(struct smb2_create_rsp, Buffer));
  4056		}
  4057	
  4058	err_out:
  4059		if (rc && (file_present || created))
  4060			path_put(&path);
  4061	
  4062	err_out1:
  4063		ksmbd_revert_fsids(work);
  4064	
  4065	err_out2:
  4066		if (!rc) {
  4067			rc = ksmbd_update_fstate(&work->sess->file_table, fp,
  4068						 FP_INITED);
  4069			if (!rc)
  4070				rc = ksmbd_iov_pin_rsp(work, (void *)rsp, iov_len);
  4071		}
  4072		if (rc) {
  4073			if (rc == -EINVAL)
  4074				rsp->hdr.Status = STATUS_INVALID_PARAMETER;
  4075			else if (rc == -EOPNOTSUPP)
  4076				rsp->hdr.Status = STATUS_NOT_SUPPORTED;
  4077			else if (rc == -EACCES || rc == -ESTALE || rc == -EXDEV)
  4078				rsp->hdr.Status = STATUS_ACCESS_DENIED;
  4079			else if (rc == -ENOENT)
  4080				rsp->hdr.Status = STATUS_OBJECT_NAME_INVALID;
  4081			else if (rc == -EPERM)
  4082				rsp->hdr.Status = STATUS_SHARING_VIOLATION;
  4083			else if (rc == -EBUSY)
  4084				rsp->hdr.Status = STATUS_DELETE_PENDING;
  4085			else if (rc == -EBADF)
  4086				rsp->hdr.Status = STATUS_OBJECT_NAME_NOT_FOUND;
  4087			else if (rc == -ENOEXEC)
  4088				rsp->hdr.Status = STATUS_DUPLICATE_OBJECTID;
  4089			else if (rc == -ENXIO)
  4090				rsp->hdr.Status = STATUS_NO_SUCH_DEVICE;
  4091			else if (rc == -EEXIST)
  4092				rsp->hdr.Status = STATUS_OBJECT_NAME_COLLISION;
  4093			else if (rc == -EMFILE)
  4094				rsp->hdr.Status = STATUS_INSUFFICIENT_RESOURCES;
  4095			if (!rsp->hdr.Status)
  4096				rsp->hdr.Status = STATUS_UNEXPECTED_IO_ERROR;
  4097	
  4098			if (fp)
  4099				ksmbd_fd_put(work, fp);
  4100			smb2_set_err_rsp(work);
  4101			ksmbd_debug(SMB, "Error response: %x\n", rsp->hdr.Status);
  4102		}
  4103	
  4104		if (dh_info.reconnected) {
  4105			/*
  4106			 * If reconnect succeeded, fp was republished in the
  4107			 * session file table.  On a later error, ksmbd_fd_put()
  4108			 * above drops the session reference; drop the durable
  4109			 * lookup reference through the same session-aware path so
  4110			 * final close removes the volatile id before freeing fp.
  4111			 */
  4112			if (rc && fp == dh_info.fp)
  4113				ksmbd_fd_put(work, dh_info.fp);
  4114			else
  4115				ksmbd_put_durable_fd(dh_info.fp);
  4116		}
  4117	
  4118		kfree(name);
  4119		kfree(lc);
  4120	
  4121		return rc;
  4122	}
  4123	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
