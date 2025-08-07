Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E4510A3E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584254; cv=none; b=hO7SQS0Q/1/n3GE/6Mgdnxo2GI03oOxx/f3heIB1P+arS7BbU6f7z2SVAianLsj/qcZ4Crf4ZV6ip12eyWVAhwIHm0Ua1DFO7RHK4bNMeOwgKNs6SFCi3OqCcEnYQ4ETGkfqLY5VpcwwKPA1BzDeO0sSshGkxUhUSx/pRjmiCOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584254; c=relaxed/simple;
	bh=yh4nTQ2tm+2LOaLyOYy7O/FOrtXL+2Wroh+eFeu6KQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILdo7AG0zCN/o1vYwfSYGUIbx5OHUxebSlXoHZV8kRwfjkR0ysXlt1MhTmHMqAQ3XpUdknUAQNqkI9HBVs+sLdsItt8Jtqt99/aybuakV5/arO7VMtQtI8Gl2+zzEAtu/Nv2lAsjDhupXe5j7CjKKLNG4tORpzKu6g/llJzeP/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PissA2XY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PissA2XY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754584253; x=1786120253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yh4nTQ2tm+2LOaLyOYy7O/FOrtXL+2Wroh+eFeu6KQM=;
  b=PissA2XYvYOnUIOqekVVt9Sl/tmyKedZocgTLsUYIOA+DrNBOSijN8XZ
   QfEYEuh283//7hsCjRQLpPKlXAPLaTpCNKUEc80srEWxZPPWGrtzZ+ijV
   HsZt18hsSBpEYacYE0G6Y7yvUgjec8+az2ucjrQwJObcURZuwBQ/4/OpD
   KEAyjS0Uib/dmvGpOLz00VK4iPxqWhMU3pTT0twFz0Lv34BPUIeFAhyFP
   DCw3231GZdMNG7Qa2+VVCGGaOFZ+7EhlpZ1J6wjcFyq5/MROsNps9q5Sc
   jDzm0ga51yyu20aK3YUi7xPZ+gwdIop9VjbGCvuSgRlrvWfMirZHo0oKA
   Q==;
X-CSE-ConnectionGUID: ce84J1PITJqovYKkggKyZg==
X-CSE-MsgGUID: LDhiAlgqSsWNf39hQxQbiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57060457"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="57060457"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 09:30:39 -0700
X-CSE-ConnectionGUID: qum1jl2WST2pQRxNywU8uw==
X-CSE-MsgGUID: wrQGSy1gTymDe3fubkCVoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="202269962"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 07 Aug 2025 09:30:38 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk3Vj-0002Uh-0m;
	Thu, 07 Aug 2025 16:30:35 +0000
Date: Thu, 7 Aug 2025 18:30:23 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 444/444]
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3834:25: warning: ISO C90 forbids
 mixed declarations and code
Message-ID: <202508071801.4G2RSQVo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   d7bfd4b043082929d98d2883c5f6a205fe89c195
commit: dc796cdae6dd826a01cb0b048d774caf01b69c7c [444/444] drm/vmwgfx: Add seqno waiter for sync_files
config: i386-randconfig-2005-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071801.4G2RSQVo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071801.4G2RSQVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071801.4G2RSQVo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c: In function 'vmw_execbuf_process':
>> drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3834:25: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3834 |                         struct seqno_waiter_rm_context *ctx =
         |                         ^~~~~~


vim +3834 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c

  3640	
  3641	int vmw_execbuf_process(struct drm_file *file_priv,
  3642				struct vmw_private *dev_priv,
  3643				void __user *user_commands, void *kernel_commands,
  3644				uint32_t command_size, uint64_t throttle_us,
  3645				uint32_t dx_context_handle,
  3646				struct drm_vmw_fence_rep __user *user_fence_rep,
  3647				struct vmw_fence_obj **out_fence, uint32_t flags)
  3648	{
  3649		struct vmw_sw_context *sw_context = &dev_priv->ctx;
  3650		struct vmw_fence_obj *fence = NULL;
  3651		struct vmw_cmdbuf_header *header;
  3652		uint32_t handle = 0;
  3653		int ret;
  3654		int32_t out_fence_fd = -1;
  3655		struct sync_file *sync_file = NULL;
  3656		DECLARE_VAL_CONTEXT(val_ctx, &sw_context->res_ht, 1);
  3657	
  3658		vmw_validation_set_val_mem(&val_ctx, &dev_priv->vvm);
  3659	
  3660		if (flags & DRM_VMW_EXECBUF_FLAG_EXPORT_FENCE_FD) {
  3661			out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
  3662			if (out_fence_fd < 0) {
  3663				VMW_DEBUG_USER("Failed to get a fence fd.\n");
  3664				return out_fence_fd;
  3665			}
  3666		}
  3667	
  3668		if (throttle_us) {
  3669			ret = vmw_wait_lag(dev_priv, &dev_priv->fifo.marker_queue,
  3670					   throttle_us);
  3671	
  3672			if (ret)
  3673				goto out_free_fence_fd;
  3674		}
  3675	
  3676		kernel_commands = vmw_execbuf_cmdbuf(dev_priv, user_commands,
  3677						     kernel_commands, command_size,
  3678						     &header);
  3679		if (IS_ERR(kernel_commands)) {
  3680			ret = PTR_ERR(kernel_commands);
  3681			goto out_free_fence_fd;
  3682		}
  3683	
  3684		ret = mutex_lock_interruptible(&dev_priv->cmdbuf_mutex);
  3685		if (ret) {
  3686			ret = -ERESTARTSYS;
  3687			goto out_free_header;
  3688		}
  3689	
  3690		sw_context->kernel = false;
  3691		if (kernel_commands == NULL) {
  3692			ret = vmw_resize_cmd_bounce(sw_context, command_size);
  3693			if (unlikely(ret != 0))
  3694				goto out_unlock;
  3695	
  3696			ret = copy_from_user(sw_context->cmd_bounce, user_commands,
  3697					     command_size);
  3698			if (unlikely(ret != 0)) {
  3699				ret = -EFAULT;
  3700				VMW_DEBUG_USER("Failed copying commands.\n");
  3701				goto out_unlock;
  3702			}
  3703	
  3704			kernel_commands = sw_context->cmd_bounce;
  3705		} else if (!header) {
  3706			sw_context->kernel = true;
  3707		}
  3708	
  3709		sw_context->fp = vmw_fpriv(file_priv);
  3710		INIT_LIST_HEAD(&sw_context->ctx_list);
  3711		sw_context->cur_query_bo = dev_priv->pinned_bo;
  3712		sw_context->last_query_ctx = NULL;
  3713		sw_context->needs_post_query_barrier = false;
  3714		sw_context->dx_ctx_node = NULL;
  3715		sw_context->dx_query_mob = NULL;
  3716		sw_context->dx_query_ctx = NULL;
  3717		memset(sw_context->res_cache, 0, sizeof(sw_context->res_cache));
  3718		INIT_LIST_HEAD(&sw_context->res_relocations);
  3719		INIT_LIST_HEAD(&sw_context->bo_relocations);
  3720	
  3721		if (sw_context->staged_bindings)
  3722			vmw_binding_state_reset(sw_context->staged_bindings);
  3723	
  3724		if (!sw_context->res_ht_initialized) {
  3725			ret = drm_ht_create(&sw_context->res_ht, VMW_RES_HT_ORDER);
  3726			if (unlikely(ret != 0))
  3727				goto out_unlock;
  3728	
  3729			sw_context->res_ht_initialized = true;
  3730		}
  3731	
  3732		INIT_LIST_HEAD(&sw_context->staged_cmd_res);
  3733		sw_context->ctx = &val_ctx;
  3734		ret = vmw_execbuf_tie_context(dev_priv, sw_context, dx_context_handle);
  3735		if (unlikely(ret != 0))
  3736			goto out_err_nores;
  3737	
  3738		ret = vmw_cmd_check_all(dev_priv, sw_context, kernel_commands,
  3739					command_size);
  3740		if (unlikely(ret != 0))
  3741			goto out_err_nores;
  3742	
  3743		ret = vmw_resources_reserve(sw_context);
  3744		if (unlikely(ret != 0))
  3745			goto out_err_nores;
  3746	
  3747		ret = vmw_validation_bo_reserve(&val_ctx, true);
  3748		if (unlikely(ret != 0))
  3749			goto out_err_nores;
  3750	
  3751		ret = vmw_validation_bo_validate(&val_ctx, true);
  3752		if (unlikely(ret != 0))
  3753			goto out_err;
  3754	
  3755		ret = vmw_validation_res_validate(&val_ctx, true);
  3756		if (unlikely(ret != 0))
  3757			goto out_err;
  3758	
  3759		vmw_validation_drop_ht(&val_ctx);
  3760	
  3761		ret = mutex_lock_interruptible(&dev_priv->binding_mutex);
  3762		if (unlikely(ret != 0)) {
  3763			ret = -ERESTARTSYS;
  3764			goto out_err;
  3765		}
  3766	
  3767		if (dev_priv->has_mob) {
  3768			ret = vmw_rebind_contexts(sw_context);
  3769			if (unlikely(ret != 0))
  3770				goto out_unlock_binding;
  3771		}
  3772	
  3773		if (!header) {
  3774			ret = vmw_execbuf_submit_fifo(dev_priv, kernel_commands,
  3775						      command_size, sw_context);
  3776		} else {
  3777			ret = vmw_execbuf_submit_cmdbuf(dev_priv, header, command_size,
  3778							sw_context);
  3779			header = NULL;
  3780		}
  3781		mutex_unlock(&dev_priv->binding_mutex);
  3782		if (ret)
  3783			goto out_err;
  3784	
  3785		vmw_query_bo_switch_commit(dev_priv, sw_context);
  3786		ret = vmw_execbuf_fence_commands(file_priv, dev_priv, &fence,
  3787						 (user_fence_rep) ? &handle : NULL);
  3788		/*
  3789		 * This error is harmless, because if fence submission fails,
  3790		 * vmw_fifo_send_fence will sync. The error will be propagated to
  3791		 * user-space in @fence_rep
  3792		 */
  3793		if (ret != 0)
  3794			VMW_DEBUG_USER("Fence submission error. Syncing.\n");
  3795	
  3796		vmw_execbuf_bindings_commit(sw_context, false);
  3797		vmw_bind_dx_query_mob(sw_context);
  3798		vmw_validation_res_unreserve(&val_ctx, false);
  3799	
  3800		vmw_validation_bo_fence(sw_context->ctx, fence);
  3801	
  3802		if (unlikely(dev_priv->pinned_bo != NULL && !dev_priv->query_cid_valid))
  3803			__vmw_execbuf_release_pinned_bo(dev_priv, fence);
  3804	
  3805		/*
  3806		 * If anything fails here, give up trying to export the fence and do a
  3807		 * sync since the user mode will not be able to sync the fence itself.
  3808		 * This ensures we are still functionally correct.
  3809		 */
  3810		if (flags & DRM_VMW_EXECBUF_FLAG_EXPORT_FENCE_FD) {
  3811	
  3812			sync_file = sync_file_create(&fence->base);
  3813			if (!sync_file) {
  3814				VMW_DEBUG_USER("Sync file create failed for fence\n");
  3815				put_unused_fd(out_fence_fd);
  3816				out_fence_fd = -1;
  3817	
  3818				(void) vmw_fence_obj_wait(fence, false, false,
  3819							  VMW_FENCE_WAIT_TIMEOUT);
  3820			}
  3821		}
  3822	
  3823		ret = vmw_execbuf_copy_fence_user(dev_priv, vmw_fpriv(file_priv), ret,
  3824					    user_fence_rep, fence, handle, out_fence_fd);
  3825	
  3826		if (sync_file) {
  3827			if (ret) {
  3828				/* usercopy of fence failed, put the file object */
  3829				fput(sync_file->file);
  3830				put_unused_fd(out_fence_fd);
  3831			} else {
  3832				/* Link the fence with the FD created earlier */
  3833				fd_install(out_fence_fd, sync_file->file);
> 3834				struct seqno_waiter_rm_context *ctx =
  3835					kmalloc(sizeof(*ctx), GFP_KERNEL);
  3836				ctx->dev_priv = dev_priv;
  3837				vmw_seqno_waiter_add(dev_priv);
  3838				if (dma_fence_add_callback(&fence->base, &ctx->base,
  3839							   seqno_waiter_rm_cb) < 0) {
  3840					vmw_seqno_waiter_remove(dev_priv);
  3841					kfree(ctx);
  3842				}
  3843			}
  3844		}
  3845	
  3846		/* Don't unreference when handing fence out */
  3847		if (unlikely(out_fence != NULL)) {
  3848			*out_fence = fence;
  3849			fence = NULL;
  3850		} else if (likely(fence != NULL)) {
  3851			vmw_fence_obj_unreference(&fence);
  3852		}
  3853	
  3854		vmw_cmdbuf_res_commit(&sw_context->staged_cmd_res);
  3855		mutex_unlock(&dev_priv->cmdbuf_mutex);
  3856	
  3857		/*
  3858		 * Unreference resources outside of the cmdbuf_mutex to avoid deadlocks
  3859		 * in resource destruction paths.
  3860		 */
  3861		vmw_validation_unref_lists(&val_ctx);
  3862	
  3863		return ret;
  3864	
  3865	out_unlock_binding:
  3866		mutex_unlock(&dev_priv->binding_mutex);
  3867	out_err:
  3868		vmw_validation_bo_backoff(&val_ctx);
  3869	out_err_nores:
  3870		vmw_execbuf_bindings_commit(sw_context, true);
  3871		vmw_validation_res_unreserve(&val_ctx, true);
  3872		vmw_resource_relocations_free(&sw_context->res_relocations);
  3873		vmw_free_relocations(sw_context);
  3874		if (unlikely(dev_priv->pinned_bo != NULL && !dev_priv->query_cid_valid))
  3875			__vmw_execbuf_release_pinned_bo(dev_priv, NULL);
  3876	out_unlock:
  3877		vmw_cmdbuf_res_revert(&sw_context->staged_cmd_res);
  3878		vmw_validation_drop_ht(&val_ctx);
  3879		WARN_ON(!list_empty(&sw_context->ctx_list));
  3880		mutex_unlock(&dev_priv->cmdbuf_mutex);
  3881	
  3882		/*
  3883		 * Unreference resources outside of the cmdbuf_mutex to avoid deadlocks
  3884		 * in resource destruction paths.
  3885		 */
  3886		vmw_validation_unref_lists(&val_ctx);
  3887	out_free_header:
  3888		if (header)
  3889			vmw_cmdbuf_header_free(header);
  3890	out_free_fence_fd:
  3891		if (out_fence_fd >= 0)
  3892			put_unused_fd(out_fence_fd);
  3893	
  3894		return ret;
  3895	}
  3896	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
