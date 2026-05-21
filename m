Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0CC221F20
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347066; cv=none; b=qk0rfkgfVfvLkUMUWfCUPOEVRiVtA7jGXSx3ff+e+auTEhbbF0/HYccvT8r/0unGrFKOC9/fS8n8fH54HPcc/QalQPqOgzZ2CSVQA/5Dpp2F89VumVg4wtFEEKvwu1ZsQf/qiLkCMwtPTtmjuRh2dpUTbmZ303yl106MaFlC/VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347066; c=relaxed/simple;
	bh=8J3Bp3xEgSN8zagDUVe3cbXRyW1VeMPKwFpRCLMYlgY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MRHEguoAvXQR1tVOmKDdVZ3qMGd7gjmnDYMA4NKavF3mh9zlms4S/fqCy/DW4gxJnefkwzPLYuCDW3gaw3DjgJ5EhEpNDJIF9ufKmdHu1rd5oVjAWjrxcwlPczSiX9whjmpSkMPcteqCmWCmqZcYPmUbQsMuGkB29qiJJGAaNfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crgKmR7I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crgKmR7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779347065; x=1810883065;
  h=date:from:to:cc:subject:message-id;
  bh=8J3Bp3xEgSN8zagDUVe3cbXRyW1VeMPKwFpRCLMYlgY=;
  b=crgKmR7I+HTVZ6kaJsZiCnZaiysCVNUA85mxGjfEduX4BbrYNpz5ueWM
   n0LADjdnZX34oHDIG7TnfQFknyX5WJ3k1CIH5ftVyI4CzPdA9N4xtPG1o
   rWRAQmrgRYbt5OjfHr9hMYSO6k++INywRXpfmZ2dW7o9WaJLTjFXsEpeQ
   JfTasbkNqm6pr7elKhWPyCnj5FjLy63yzPJsJDoLU7AHHxprGnBjMG/za
   tVefO6sqUUydDHz4I3knYmsUzwr9n/vJmY2l0ivfgm+eEUYn6i7ZFOULu
   UF2nQjHQAv/yElotVdywg8spfBon1MfKysMrQ32TtY/j5OaCS/y1u1OoL
   Q==;
X-CSE-ConnectionGUID: xfTRYM5/SXOGgfT2byn8+w==
X-CSE-MsgGUID: RdgudaAMRhyXtd8NGWXVOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="84145916"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="84145916"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:04:25 -0700
X-CSE-ConnectionGUID: 60lIFIonRfCaVZnpCCN9rA==
X-CSE-MsgGUID: 9wEfHUjUSBSg7wGJlMyEvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="240684282"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 May 2026 00:04:23 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPxS8-000000004Yh-1hKB;
	Thu, 21 May 2026 07:04:20 +0000
Date: Thu, 21 May 2026 15:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1079/1130]
 drivers/gpu/drm/virtio/virtgpu_ioctl.c:600:24: warning: assignment to 'struct
 drm_virtgpu_context_set_param *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202605211403.OFIi3BqZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 75072a089efc76ac43e7976637cdf3efa458bd18 [1079/1130] cheri: compat64: virtio_gpu: Implement compat64 handling
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605211403.OFIi3BqZ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211403.OFIi3BqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211403.OFIi3BqZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/sched/user.h:7,
                    from include/linux/cred.h:18,
                    from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/irq_work.h:6,
                    from include/linux/dma-fence-array.h:16,
                    from include/linux/sync_file.h:21,
                    from drivers/gpu/drm/virtio/virtgpu_ioctl.c:29:
   drivers/gpu/drm/virtio/virtgpu_ioctl.c: In function 'virtio_gpu_context_init_ioctl':
   drivers/gpu/drm/virtio/virtgpu_ioctl.c:600:45: error: 'user_buckets' undeclared (first use in this function); did you mean 'kmem_buckets'?
     600 |         ctx_set_params = kmem_buckets_alloc(user_buckets, alloclen,
         |                                             ^~~~~~~~~~~~
   include/linux/alloc_tag.h:251:16: note: in definition of macro 'alloc_hooks_tag'
     251 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:969:9: note: in expansion of macro 'alloc_hooks'
     969 |         alloc_hooks(__kmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, _b), _flags, NUMA_NO_NODE))
         |         ^~~~~~~~~~~
   include/linux/slab.h:969:43: note: in expansion of macro 'PASS_BUCKET_PARAMS'
     969 |         alloc_hooks(__kmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, _b), _flags, NUMA_NO_NODE))
         |                                           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_ioctl.c:600:26: note: in expansion of macro 'kmem_buckets_alloc'
     600 |         ctx_set_params = kmem_buckets_alloc(user_buckets, alloclen,
         |                          ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_ioctl.c:600:45: note: each undeclared identifier is reported only once for each function it appears in
     600 |         ctx_set_params = kmem_buckets_alloc(user_buckets, alloclen,
         |                                             ^~~~~~~~~~~~
   include/linux/alloc_tag.h:251:16: note: in definition of macro 'alloc_hooks_tag'
     251 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:969:9: note: in expansion of macro 'alloc_hooks'
     969 |         alloc_hooks(__kmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, _b), _flags, NUMA_NO_NODE))
         |         ^~~~~~~~~~~
   include/linux/slab.h:969:43: note: in expansion of macro 'PASS_BUCKET_PARAMS'
     969 |         alloc_hooks(__kmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, _b), _flags, NUMA_NO_NODE))
         |                                           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_ioctl.c:600:26: note: in expansion of macro 'kmem_buckets_alloc'
     600 |         ctx_set_params = kmem_buckets_alloc(user_buckets, alloclen,
         |                          ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/virtio/virtgpu_ioctl.c:600:24: warning: assignment to 'struct drm_virtgpu_context_set_param *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     600 |         ctx_set_params = kmem_buckets_alloc(user_buckets, alloclen,
         |                        ^


vim +600 drivers/gpu/drm/virtio/virtgpu_ioctl.c

   574	
   575	static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
   576						 void *data, struct drm_file *file)
   577	{
   578		int ret = 0;
   579		uint32_t num_params, i;
   580		uint64_t valid_ring_mask, param;
   581		__u64ptr value;
   582		size_t alloclen;
   583		struct drm_virtgpu_context_set_param *ctx_set_params = NULL;
   584		struct virtio_gpu_device *vgdev = dev->dev_private;
   585		struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
   586		struct drm_virtgpu_context_init *args = data;
   587		void __user *uparams;
   588	
   589		num_params = args->num_params;
   590		alloclen = num_params * sizeof(struct drm_virtgpu_context_set_param);
   591	
   592		if (!vgdev->has_context_init || !vgdev->has_virgl_3d)
   593			return -EINVAL;
   594	
   595		/* Number of unique parameters supported at this time. */
   596		if (num_params > 4)
   597			return -EINVAL;
   598	
   599		uparams = u64_to_user_ptr(args->ctx_set_params);
 > 600		ctx_set_params = kmem_buckets_alloc(user_buckets, alloclen,
   601						    GFP_USER | __GFP_NOWARN);
   602		if (!ctx_set_params)
   603			return -ENOMEM;
   604		for (i = 0; i < num_params; ++i) {
   605			if (__c64_copy_from_user_with_ptr(drm_virtgpu_context_set_param,
   606							  &ctx_set_params[i], uparams)) {
   607				ret = -EFAULT;
   608				goto out_free;
   609			}
   610			uparams += __c64_sizeof(drm_virtgpu_context_set_param);
   611		}
   612	
   613	
   614		mutex_lock(&vfpriv->context_lock);
   615		if (vfpriv->context_created) {
   616			ret = -EEXIST;
   617			goto out_unlock;
   618		}
   619	
   620		for (i = 0; i < num_params; i++) {
   621			param = ctx_set_params[i].param;
   622			value = ctx_set_params[i].value;
   623	
   624			switch (param) {
   625			case VIRTGPU_CONTEXT_PARAM_CAPSET_ID:
   626				if (value > MAX_CAPSET_ID) {
   627					ret = -EINVAL;
   628					goto out_unlock;
   629				}
   630	
   631				if ((vgdev->capset_id_mask & (1ULL << __c_ua(value))) == 0) {
   632					ret = -EINVAL;
   633					goto out_unlock;
   634				}
   635	
   636				/* Context capset ID already set */
   637				if (vfpriv->context_init &
   638				    VIRTIO_GPU_CONTEXT_INIT_CAPSET_ID_MASK) {
   639					ret = -EINVAL;
   640					goto out_unlock;
   641				}
   642	
   643				vfpriv->context_init |= value;
   644				break;
   645			case VIRTGPU_CONTEXT_PARAM_NUM_RINGS:
   646				if (vfpriv->base_fence_ctx) {
   647					ret = -EINVAL;
   648					goto out_unlock;
   649				}
   650	
   651				if (value > MAX_RINGS) {
   652					ret = -EINVAL;
   653					goto out_unlock;
   654				}
   655	
   656				vfpriv->base_fence_ctx = dma_fence_context_alloc(value);
   657				vfpriv->num_rings = value;
   658				break;
   659			case VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK:
   660				if (vfpriv->ring_idx_mask) {
   661					ret = -EINVAL;
   662					goto out_unlock;
   663				}
   664	
   665				vfpriv->ring_idx_mask = __c_ua(value);
   666				break;
   667			case VIRTGPU_CONTEXT_PARAM_DEBUG_NAME:
   668				if (vfpriv->explicit_debug_name) {
   669					ret = -EINVAL;
   670					goto out_unlock;
   671				}
   672	
   673				ret = strncpy_from_user(vfpriv->debug_name,
   674							u64_to_user_ptr(value),
   675							DEBUG_NAME_MAX_LEN - 1);
   676				if (ret < 0)
   677					goto out_unlock;
   678	
   679				vfpriv->explicit_debug_name = true;
   680				ret = 0;
   681				break;
   682			default:
   683				ret = -EINVAL;
   684				goto out_unlock;
   685			}
   686		}
   687	
   688		if (vfpriv->ring_idx_mask) {
   689			valid_ring_mask = 0;
   690			for (i = 0; i < vfpriv->num_rings; i++)
   691				valid_ring_mask |= 1ULL << i;
   692	
   693			if (~valid_ring_mask & vfpriv->ring_idx_mask) {
   694				ret = -EINVAL;
   695				goto out_unlock;
   696			}
   697		}
   698	
   699		virtio_gpu_create_context_locked(vgdev, vfpriv);
   700		virtio_gpu_notify(vgdev);
   701	
   702	out_unlock:
   703		mutex_unlock(&vfpriv->context_lock);
   704	out_free:
   705		kfree(ctx_set_params);
   706		return ret;
   707	}
   708	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
