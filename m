Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D362581
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 03:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743652697; cv=none; b=Xw93DbKGBfs/6j8/G5KCmNXiLZvixCpX75pj/f2JFcixtTJ+MY60CkBPpHgnjT2gG3fPcJZHH5SSL2iW5Eklti6DHApyEFKqeeR/b2s5zx0d5ZV+r7l1k7PlHf+M8A/nofAMB5Hqq3rgrwdF8gsYKV3BKuXO6DJ0h9j2MjyP7tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743652697; c=relaxed/simple;
	bh=vnfH3UC1jQLKs4mYyqdF9Vi17z5ag0IGibYTjQV9rYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sf5wWPglW+0meiq8hhKJbfDZGuGtHpo5Jp1qPmZ5etl75I7nKMemjVLBCz/Uesrd2lPyKAV4ps6v8akUv6xpD3d5gf7uq5Pt2IW6yQt0i+uNFQXTN4Raw80pt0BUxp1SMrXvUKWCUKKoBIiL6NMHXj8bwlGtszSa1BiZ2mqdlEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFqG/UHx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFqG/UHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743652695; x=1775188695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vnfH3UC1jQLKs4mYyqdF9Vi17z5ag0IGibYTjQV9rYw=;
  b=mFqG/UHxSwktaHG5NHhxvn8vDOpQsmN3OI73kchJ8AuBEzU5FSgtXawb
   /DCfnrcst9SIG8KwQKldjsqeBxI25xSmZE9M2n9cpIBVWg7P31xmo+xVN
   INtn/iCFReO33Fo9+AhwS5nDAPounGUuu2xpiAZ+MPZot9nVEocSL13/R
   zlzQwBW9hEcLsnIV8/FBaD24r2OA69zGym7Qfb4ozIuxl5Zcv/Qst4GN9
   tREMZHyia6y5Ok1g5ZCFAFVUya3o3mSa12OFugrOHqDU+wXqHB2eVGsOx
   lKEct/o3Y2Ms9xcC48b+9Q7TzdZvTovWUUssHljJOTbSaWSQLY4ca/zHj
   w==;
X-CSE-ConnectionGUID: Uf9RpWOSQCifg4CxRgGZXw==
X-CSE-MsgGUID: 7MWpNAk4Qhy/oPnEcDThrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45165929"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="45165929"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 20:58:14 -0700
X-CSE-ConnectionGUID: D6zDeBc0TDujMyRKleEPBg==
X-CSE-MsgGUID: uF93ya70QpCwZ4QqnLljjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="132096347"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Apr 2025 20:58:13 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0BiU-00003t-1D;
	Thu, 03 Apr 2025 03:58:10 +0000
Date: Thu, 3 Apr 2025 11:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:ns-migration 17/18]
 drivers/nvme/host/core.c:4179:37: error: 'struct nvme_ns_head' has no member
 named 'lock'
Message-ID: <202504031132.Gr53MqDq-lkp@intel.com>
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
commit: c99bbaa789ad558a900b867b376d68801acbbf9a [17/18] nvme: namespace migration
config: csky-randconfig-001-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031132.Gr53MqDq-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031132.Gr53MqDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031132.Gr53MqDq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c: In function 'nvme_alloc_ns_head':
   drivers/nvme/host/core.c:3727:37: error: passing argument 1 of 'nvme_mpath_alloc_disk' from incompatible pointer type [-Wincompatible-pointer-types]
    3727 |         ret = nvme_mpath_alloc_disk(subsys, head);
         |                                     ^~~~~~
         |                                     |
         |                                     struct nvme_subsystem *
   In file included from drivers/nvme/host/core.c:27:
   drivers/nvme/host/nvme.h:1008:59: note: expected 'struct nvme_ctrl *' but argument is of type 'struct nvme_subsystem *'
    1008 | static inline int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl,
         |                                         ~~~~~~~~~~~~~~~~~~^~~~
   drivers/nvme/host/core.c: In function 'nvme_validate_ns':
>> drivers/nvme/host/core.c:4179:37: error: 'struct nvme_ns_head' has no member named 'lock'
    4179 |                 mutex_lock(&ns->head->lock);
         |                                     ^~
   drivers/nvme/host/core.c:4182:47: error: 'struct nvme_ns_head' has no member named 'lock'
    4182 |                         mutex_unlock(&ns->head->lock);
         |                                               ^~
   drivers/nvme/host/core.c:4193:39: error: 'struct nvme_ns_head' has no member named 'lock'
    4193 |                 mutex_unlock(&ns->head->lock);
         |                                       ^~
   drivers/nvme/host/core.c: In function 'nvme_scan_work':
   drivers/nvme/host/core.c:4449:44: error: 'struct nvme_ctrl' has no member named 'ana_work'; did you mean 'ka_work'?
    4449 |                 queue_work(nvme_wq, &ctrl->ana_work);
         |                                            ^~~~~~~~
         |                                            ka_work


vim +4179 drivers/nvme/host/core.c

  4124	
  4125	static void nvme_validate_ns(struct nvme_ns *ns, struct nvme_ns_info *info)
  4126	{
  4127		int ret = NVME_SC_INVALID_NS | NVME_STATUS_DNR;
  4128		struct nvme_ctrl *ctrl = ns->ctrl;
  4129		struct nvme_subsystem *subsys, *old_subsys = NULL;
  4130		struct nvme_ns_head *head;
  4131	
  4132		if (!nvme_ns_ids_equal(&ns->head->ids, &info->ids)) {
  4133			dev_err(ns->ctrl->device,
  4134				"identifiers changed for nsid %d\n", ns->head->ns_id);
  4135			goto out;
  4136		}
  4137	
  4138		if (uuid_is_null(&info->ids.migration_uuid)) {
  4139			/*
  4140			 * Migration UUID not present:
  4141			 * use the controller subsystem
  4142			 */
  4143			subsys = ctrl->subsys;
  4144			kref_get(&subsys->ref);
  4145		} else if (uuid_is_null(&ns->head->ids.migration_uuid)) {
  4146			/*
  4147			 * Migration UUID present, but not set for ns_head:
  4148			 * create migration subsystem
  4149			 */
  4150			subsys = nvme_migration_subsys(info);
  4151			if (!subsys) {
  4152				dev_err(ctrl->device,
  4153					"nsid %u: failed to allocate migration subsys\n",
  4154					ns->head->ns_id);
  4155				goto out;
  4156			}
  4157		} else {
  4158			/*
  4159			 * Migration UUID present, and set for ns_head:
  4160			 * use ns_head subsystem
  4161			 */
  4162			subsys = ns->head->subsys;
  4163			kref_get(&subsys->ref);
  4164		}
  4165	
  4166		mutex_lock(&subsys->lock);
  4167		head = nvme_find_ns_head(subsys, ns->head->ns_id);
  4168		if (head) {
  4169			nvme_put_ns_head(head);
  4170			if (head != ns->head) {
  4171				dev_err(ctrl->device,
  4172					"nsid %u already present in subsys %s\n",
  4173					ns->head->ns_id, subsys->subnqn);
  4174				mutex_unlock(&subsys->lock);
  4175				nvme_put_subsystem(subsys);
  4176				goto out;
  4177			}
  4178		} else {
> 4179			mutex_lock(&ns->head->lock);
  4180			old_subsys = ns->head->subsys;
  4181			if (nvme_mpath_move_head(ns->head, subsys) < 0) {
  4182				mutex_unlock(&ns->head->lock);
  4183				mutex_unlock(&subsys->lock);
  4184				nvme_put_subsystem(subsys);
  4185				dev_err(ctrl->device,
  4186					"failed to move nsid %u to subsystem\n",
  4187					ns->head->ns_id);
  4188				old_subsys = NULL;
  4189				goto out;
  4190			}
  4191			kref_get(&subsys->ref);
  4192			ns->head->ids = info->ids;
  4193			mutex_unlock(&ns->head->lock);
  4194			mutex_unlock(&subsys->lock);
  4195		}
  4196		mutex_unlock(&subsys->lock);
  4197		nvme_put_subsystem(subsys);
  4198		if (old_subsys)
  4199			nvme_put_subsystem(old_subsys);
  4200	
  4201		ret = nvme_update_ns_info(ns, info);
  4202	out:
  4203		/*
  4204		 * Only remove the namespace if we got a fatal error back from the
  4205		 * device, otherwise ignore the error and just move on.
  4206		 *
  4207		 * TODO: we should probably schedule a delayed retry here.
  4208		 */
  4209		if (ret > 0 && (ret & NVME_STATUS_DNR))
  4210			nvme_ns_remove(ns);
  4211	}
  4212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
