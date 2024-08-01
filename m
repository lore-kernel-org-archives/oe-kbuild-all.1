Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233A31EB4BD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722506615; cv=none; b=UE5aDMLjLsybDoKRqcUzbpYbOkrmYUrdXgmDmH2KpDgtddZzmKkmv39lTErg2rSqj/yoPZkGe0EHPn8topUcXfiFLCgRdRQD0yFaWOfthzHDuYWo7TJWcPA5q8PgAo5YCbYrH7XT7XO/4CA1gabn07urcGsw1/lySlE/GMr7ceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722506615; c=relaxed/simple;
	bh=TD0pBoAN2/QaDnbA1siTb8dEJdgNy8cpN2YYlS/Cpz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TEavJC2/A6eUK/ZUKOYzDxM3AeWdWYmlD/qafjOEOo9zFeIGBrlmyFZ0CggtIDTezGOpLdMeuceLiTHG899Url2MmSWlRKh91T3iFHe7hLteOmMo83ULzHDzs6zL7oauwGhW3kjMrvBBXsLClWX4fjmnV6ieaRqag4+XvmiNk/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtJpJrQ6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtJpJrQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722506613; x=1754042613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TD0pBoAN2/QaDnbA1siTb8dEJdgNy8cpN2YYlS/Cpz8=;
  b=WtJpJrQ6c5ZepygpoYan7ddKfFu3YU/wHXH8qBwdVycceu0tH88q6CwO
   hsdidAhPAllJ8PA3jVdnYZLeY2RVLwZagWY+bH1rXe5rU5kkFsYaWBiu0
   qa9TM74CNv6CFO5EWiCaRAPL0jZf//fMFdL/c0egYc5adtedwZZ+SktVa
   w1aqX3ey8mNYTamjqMRf0YxN6ZbtiQwEc/+jPet0MhruqNlDnQo81rU0s
   QIThvRB5LGveW08lu0rI72yfrvgKP1FGOZtgQc4//TXMiXVw2E/9Zl7BL
   4ZnYMALKuHhpF3QgBeOS5201+Zh69EfHjttKpeOqoCDQKPaoSZwdF1Oym
   g==;
X-CSE-ConnectionGUID: WODe1QlHQIiyZIMxLs9eBg==
X-CSE-MsgGUID: AkjXGKliT6altnZ86PGbwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20603733"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20603733"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 03:03:27 -0700
X-CSE-ConnectionGUID: Tp/tCzS6RyqlKYGsa76aQg==
X-CSE-MsgGUID: lAbWpKIARSOUiqchHayrrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="54647646"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Aug 2024 03:03:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZSeZ-000vRi-2o;
	Thu, 01 Aug 2024 10:03:23 +0000
Date: Thu, 1 Aug 2024 18:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [linux-next:master 1060/2655]
 drivers/gpu/drm/nouveau/nv10_fence.c:35:40: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202408011836.hAzQyIkl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   048d8cb65cde9fe7534eb4440bcfddcf406bb49c
commit: 0df26c0d69dce1141218e0e5ed0ad378a0c6c058 [1060/2655] drm/nouveau: remove push pointer from nouveau_channel
config: x86_64-randconfig-122-20240801 (https://download.01.org/0day-ci/archive/20240801/202408011836.hAzQyIkl-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011836.hAzQyIkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011836.hAzQyIkl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nv10_fence.c:35:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct nvif_push *push @@     got struct nvif_push [noderef] __rcu * @@
   drivers/gpu/drm/nouveau/nv10_fence.c:35:40: sparse:     expected struct nvif_push *push
   drivers/gpu/drm/nouveau/nv10_fence.c:35:40: sparse:     got struct nvif_push [noderef] __rcu *
   drivers/gpu/drm/nouveau/nv10_fence.c:38:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv10_fence.c:38:17: sparse: sparse: cast removes address space '__iomem' of expression

vim +35 drivers/gpu/drm/nouveau/nv10_fence.c

    31	
    32	int
    33	nv10_fence_emit(struct nouveau_fence *fence)
    34	{
  > 35		struct nvif_push *push = &fence->channel->chan.push;
    36		int ret = PUSH_WAIT(push, 2);
    37		if (ret == 0) {
    38			PUSH_MTHD(push, NV06E, SET_REFERENCE, fence->base.seqno);
    39			PUSH_KICK(push);
    40		}
    41		return ret;
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
