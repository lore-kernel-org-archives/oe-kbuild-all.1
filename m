Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909E6B666
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 02:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743648019; cv=none; b=jvba+S7l+3eyXlDBLaXRnIEEH6iIdKG9cpf18r9XSuk3vjlk7cFtu0oJ4eVYF71O4H0ft82b4ixIANiaN12db3OuO0o79LKa2K5wYQ7n4mCGIHTOGqTwH8zh6FVqjK59l9o2WXv3P9bVK34NXKOE52C0XJC4lbA8st4vMQ/27YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743648019; c=relaxed/simple;
	bh=tY5/MQciixgB/niWR5/K6aNjG/EI0fwW3ctK9EKeA7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tMm/zulhTBFHpP4/LNWouRo1ep0ndOcBKz4eaUHLsfh1hQCA2r9+scqNGr/znaj9BMjCF+asf40qKJVZbSEuDFEYw900BqIHsNZmfEJLYLKAV5UuL2fBIZ2LYpNoUt7+qbbcr7U253lg4DZZUCGqq2yeV3sxIfNH5oi0/bbKce8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7YN3de3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7YN3de3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743648017; x=1775184017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tY5/MQciixgB/niWR5/K6aNjG/EI0fwW3ctK9EKeA7o=;
  b=Q7YN3de3mhUDEUxhtxfIwSMAH0o289pwcArtfZIrfpfJoeUNNBHfAEQ8
   LejU49VmCbtawBRlulTu4KyPo1d3XTq+RqtV7eYsXeSmn/VFw1E8F11MC
   RjilJSNDVZq3xVi6gkB00KgjMHIqUhcbxbVXQwRPKffNc5k8Vo2t75aUb
   EI7Ti+vkAHu4jt4xfVNz9zmh/YvRhVZ8aEuWvOQhghKNHFJ1HTvjZvZFn
   eHLJBgtdD1D/GpgJW5ULgwvqy58wvhsZZBAFW+E0V7yJvby4r0hcO+dHd
   m5ReBLaK/AnFJ5jhPpSvT7Hv2VdxxicvW6G/GKrXC3fd0h9x4OmwLygk+
   g==;
X-CSE-ConnectionGUID: hsztJTFlR1my2ePaifuqTg==
X-CSE-MsgGUID: VtJiLXkwSNWzmP1BPMUeEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44747149"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44747149"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:40:15 -0700
X-CSE-ConnectionGUID: Z9u+wO47TTifPG+5Uiltsw==
X-CSE-MsgGUID: IqgnjdmKRkuWlQJZFe62bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127370072"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Apr 2025 19:40:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0AV2-000BB8-2R;
	Thu, 03 Apr 2025 02:40:12 +0000
Date: Thu, 3 Apr 2025 10:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:ns-migration 10/18]
 drivers/nvme/host/core.c:3704:37: error: passing argument 1 of
 'nvme_mpath_alloc_disk' from incompatible pointer type
Message-ID: <202504031011.zZYOsI85-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git ns-migration
head:   1cd2ac8db713fdf42bc7bb10329d795f7aee4f1f
commit: 0ba654ee6c31e479dd7236afec32fcd3ba7e7578 [10/18] nvme: use a subsystem argument in nvme_alloc_ns_head()
config: csky-randconfig-001-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031011.zZYOsI85-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031011.zZYOsI85-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031011.zZYOsI85-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c: In function 'nvme_alloc_ns_head':
>> drivers/nvme/host/core.c:3704:37: error: passing argument 1 of 'nvme_mpath_alloc_disk' from incompatible pointer type [-Wincompatible-pointer-types]
    3704 |         ret = nvme_mpath_alloc_disk(subsys, head);
         |                                     ^~~~~~
         |                                     |
         |                                     struct nvme_subsystem *
   In file included from drivers/nvme/host/core.c:27:
   drivers/nvme/host/nvme.h:1005:59: note: expected 'struct nvme_ctrl *' but argument is of type 'struct nvme_subsystem *'
    1005 | static inline int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl,
         |                                         ~~~~~~~~~~~~~~~~~~^~~~
   drivers/nvme/host/core.c: In function 'nvme_scan_work':
   drivers/nvme/host/core.c:4310:44: error: 'struct nvme_ctrl' has no member named 'ana_work'; did you mean 'ka_work'?
    4310 |                 queue_work(nvme_wq, &ctrl->ana_work);
         |                                            ^~~~~~~~
         |                                            ka_work


vim +/nvme_mpath_alloc_disk +3704 drivers/nvme/host/core.c

  3675	
  3676		head = kzalloc(size, GFP_KERNEL);
  3677		if (!head)
  3678			goto out;
  3679		ret = ida_alloc_min(&subsys->ns_ida, 1, GFP_KERNEL);
  3680		if (ret < 0)
  3681			goto out_free_head;
  3682		head->instance = ret;
  3683		INIT_LIST_HEAD(&head->list);
  3684		ret = init_srcu_struct(&head->srcu);
  3685		if (ret)
  3686			goto out_ida_remove;
  3687		head->subsys = subsys;
  3688		head->ns_id = info->nsid;
  3689		head->ids = info->ids;
  3690		head->shared = info->is_shared;
  3691		head->rotational = info->is_rotational;
  3692		head->unique_nsid = head->shared || nvme_ctrl_is_unique_nsid(ctrl);
  3693		ratelimit_state_init(&head->rs_nuse, 5 * HZ, 1);
  3694		ratelimit_set_flags(&head->rs_nuse, RATELIMIT_MSG_ON_RELEASE);
  3695		kref_init(&head->ref);
  3696	
  3697		if (head->ids.csi) {
  3698			ret = nvme_get_effects_log(ctrl, head->ids.csi, &head->effects);
  3699			if (ret)
  3700				goto out_cleanup_srcu;
  3701		} else
  3702			head->effects = ctrl->effects;
  3703	
> 3704		ret = nvme_mpath_alloc_disk(subsys, head);
  3705		if (ret)
  3706			goto out_cleanup_srcu;
  3707	
  3708		list_add_tail(&head->entry, &subsys->nsheads);
  3709	
  3710		kref_get(&subsys->ref);
  3711	
  3712		return head;
  3713	out_cleanup_srcu:
  3714		cleanup_srcu_struct(&head->srcu);
  3715	out_ida_remove:
  3716		ida_free(&subsys->ns_ida, head->instance);
  3717	out_free_head:
  3718		kfree(head);
  3719	out:
  3720		if (ret > 0)
  3721			ret = blk_status_to_errno(nvme_error_status(ret));
  3722		return ERR_PTR(ret);
  3723	}
  3724	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
