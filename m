Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E928B4FA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 05:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778046332; cv=none; b=ORDldlD2Nd0bil5rrJ4i4NUBoenQ6QhyxcpxkverArKXSkzOj8dTL/hgHOmQ+U9N8JOFDu39O0BESTlA24101PZ5tRAr+waiRjawt3FATlYa+v6SNgJXRvA7u8N9Eb+/tUyhCpB8FFd+nPli0XYPBT3YvVZAgfzq/Y2lbqGWteI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778046332; c=relaxed/simple;
	bh=Cu46kF9sfzDZD1DNRHe/0Qeo7p52dWh8gf29/bSTDVQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=irKOnHZ3CURwhZ2jViA7nH55tzfubh9ywCpWvupfH2zb0Se9D4sw/jojXRH5AnVuNDyXfwS/4UzqQ9D08J1KiNehAhpHUylpDb7klZFV2XJ0Dpd/eZs5McNZMJ+ran9LfPwsywaO5e4WowZCBzz1Sk3yQ/yhYmUz/ntEOAyett4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YG0uUGRg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YG0uUGRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778046331; x=1809582331;
  h=date:from:to:cc:subject:message-id;
  bh=Cu46kF9sfzDZD1DNRHe/0Qeo7p52dWh8gf29/bSTDVQ=;
  b=YG0uUGRgOfsLGRk9Jgd3A7oqvzdv/ZMfIxRe4MMgbz4w6uhoa/F+UqcJ
   Vl1gy3dChjLYOnMpO3pAXOVqEI5rlkR+bGcNTAzptninMiAoXw2PGhkR1
   m84UGt/mV5p8uo0vMG94Xy7WPXJwNdn2kbcWfCblR9aTyOQDjt9rH2AUj
   /Y3qt07LzK07pxz1TvHEjZlgNg7wTNgNm0iXGAN5a1ncIOGbv/mty62iv
   83QxqhdywLD+GZ/cckF8n6bHPFf/8Kr/4N3b9aDKJlJaR5WylCwluw3t5
   zp/GVS3DZ/QGD6BjqEUSo0hHHoIMjxRC7wKiZAWBoFNl2mJBqBrDJYezB
   A==;
X-CSE-ConnectionGUID: gYyteNMLQ5adrdaPEe6ZbQ==
X-CSE-MsgGUID: mWruXj37RlmL4YZTdXcmZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96363053"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="96363053"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 22:45:30 -0700
X-CSE-ConnectionGUID: aeJoVKQmTmibUeAu2sK0uw==
X-CSE-MsgGUID: R4nppS8gRnSaTi6Y3/T9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="231445354"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2026 22:45:29 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKV4Y-000000000jx-2zpA;
	Wed, 06 May 2026 05:45:26 +0000
Date: Wed, 06 May 2026 13:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:virtual-subsys.v7 3/7]
 drivers/nvme/host/core.c:3960:30: error: passing argument 1 of
 'nvme_mpath_alloc_disk' from incompatible pointer type
Message-ID: <202605061351.XHUVdwuK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git virtual-subsys.v7
head:   d28dfc8d88a694c49437ebff946b86d35fb2ce56
commit: 743f32b59ff12e69735b0d0aeb7d289f968a56ce [3/7] nvme: use a subsystem argument in nvme_alloc_ns_head()
config: nios2-randconfig-001-20260506 (https://download.01.org/0day-ci/archive/20260506/202605061351.XHUVdwuK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061351.XHUVdwuK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061351.XHUVdwuK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c: In function 'nvme_alloc_ns_head':
>> drivers/nvme/host/core.c:3960:30: error: passing argument 1 of 'nvme_mpath_alloc_disk' from incompatible pointer type [-Werror=incompatible-pointer-types]
     ret = nvme_mpath_alloc_disk(subsys, head);
                                 ^~~~~~
   In file included from drivers/nvme/host/core.c:27:
   drivers/nvme/host/nvme.h:1088:59: note: expected 'struct nvme_ctrl *' but argument is of type 'struct nvme_subsystem *'
    static inline int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl,
                                            ~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/nvme_mpath_alloc_disk +3960 drivers/nvme/host/core.c

  3931	
  3932		head = kzalloc(size, GFP_KERNEL);
  3933		if (!head)
  3934			goto out;
  3935		ret = ida_alloc_min(&subsys->ns_ida, 1, GFP_KERNEL);
  3936		if (ret < 0)
  3937			goto out_free_head;
  3938		head->instance = ret;
  3939		INIT_LIST_HEAD(&head->list);
  3940		ret = init_srcu_struct(&head->srcu);
  3941		if (ret)
  3942			goto out_ida_remove;
  3943		head->subsys = subsys;
  3944		head->ns_id = info->nsid;
  3945		head->ids = info->ids;
  3946		head->shared = info->is_shared;
  3947		head->rotational = info->is_rotational;
  3948		head->unique_nsid = head->shared || nvme_ctrl_is_unique_nsid(ctrl);
  3949		ratelimit_state_init(&head->rs_nuse, 5 * HZ, 1);
  3950		ratelimit_set_flags(&head->rs_nuse, RATELIMIT_MSG_ON_RELEASE);
  3951		kref_init(&head->ref);
  3952	
  3953		if (head->ids.csi) {
  3954			ret = nvme_get_effects_log(ctrl, head->ids.csi, &head->effects);
  3955			if (ret)
  3956				goto out_cleanup_srcu;
  3957		} else
  3958			head->effects = ctrl->effects;
  3959	
> 3960		ret = nvme_mpath_alloc_disk(subsys, head);
  3961		if (ret)
  3962			goto out_cleanup_srcu;
  3963	
  3964		list_add_tail(&head->entry, &subsys->nsheads);
  3965	
  3966		kref_get(&subsys->ref);
  3967	
  3968		return head;
  3969	out_cleanup_srcu:
  3970		cleanup_srcu_struct(&head->srcu);
  3971	out_ida_remove:
  3972		ida_free(&subsys->ns_ida, head->instance);
  3973	out_free_head:
  3974		kfree(head);
  3975	out:
  3976		if (ret > 0)
  3977			ret = blk_status_to_errno(nvme_error_status(ret));
  3978		return ERR_PTR(ret);
  3979	}
  3980	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
