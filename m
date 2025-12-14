Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641C1DF26B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765734579; cv=none; b=NnHFdmWntzuQdoJ5BaHMQu1pcuZcA0B4+Yq1w2K8B7ByHnTo478LetGGM7GdorT1wEqX4LZlw7I2SKh3ch8dWjugSjGaji3mo6FMDNbysDnMIHwMVDeGvhBLgvjP94h1NeVi7bj3dmkJqwzscpdfLvm0gcyOt6rXt1XmRqmEcVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765734579; c=relaxed/simple;
	bh=6yJWLbe0IPKyjXBvV3dYkEsBDlibf57K1H8ZeMIKeSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HmeO6I8lJ/weFtG9bZoOwf/Hx3W3ootZu1rW2PN/9+f8wxmxKpkIV4R16WftxUeGn4dq5JJdv0wV4t9rSGs38ZKfrTGtT2E9UkOSBc/FOUQFQ6OW6uXVwb4myGAH3iyTJ2Q9gMRdQ+kytPa4tYMxEynHdemxXOPjxLUt6oe6Hmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kopqT3GI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kopqT3GI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765734577; x=1797270577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6yJWLbe0IPKyjXBvV3dYkEsBDlibf57K1H8ZeMIKeSQ=;
  b=kopqT3GIAbl5yYyiypbhPTvAlhW27oFQ6lHmIUNhH8tptsnkHghWeZAw
   yrIgxhUIAZF1YOYtKwPa/rFbxtHEFM4d7/+yoCHZL9/R83pu/P0D+/GEA
   MoXlYAO+3eXK3AUrW04UVsFfye9waHfGYKYc+KqHlnXkUXh53woTes0tl
   uPZZYEpHOGDLZtgTDyGI+y2ce21rXB3xhmk44hcDYAVeio1HGP5itaDq4
   TZqjByc6lg8BpnzZhXvRlp8pP373BkAnVLpPPJiEj6Edb8lIpI3LcOteR
   La7rlj/Qngm1XXYZufJ7qQqPY6IYyuRoaUBcKSN2pA0jK5WR6qucTZTUc
   g==;
X-CSE-ConnectionGUID: nTJEPaEbQqyVwsAwj+E+3g==
X-CSE-MsgGUID: HVoJ9RSKQoyxqKdK/Hh15A==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85063546"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="85063546"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 09:49:37 -0800
X-CSE-ConnectionGUID: O0wVDGGUSWmPoVyPtBYnLw==
X-CSE-MsgGUID: 5S3oSFXsR0ycUC70+fCowQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197438041"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Dec 2025 09:49:36 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUqDt-000000009Fa-3KEQ;
	Sun, 14 Dec 2025 17:49:33 +0000
Date: Mon, 15 Dec 2025 01:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: drivers/gpu/drm/nouveau/nv10_fence.c:35:40: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202512150150.LLdn83bp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 0df26c0d69dce1141218e0e5ed0ad378a0c6c058 drm/nouveau: remove push pointer from nouveau_channel
date:   1 year, 5 months ago
config: powerpc64-randconfig-r112-20251212 (https://download.01.org/0day-ci/archive/20251215/202512150150.LLdn83bp-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150150.LLdn83bp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150150.LLdn83bp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nv10_fence.c:35:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct nvif_push *push @@     got struct nvif_push [noderef] __rcu * @@
   drivers/gpu/drm/nouveau/nv10_fence.c:35:40: sparse:     expected struct nvif_push *push
   drivers/gpu/drm/nouveau/nv10_fence.c:35:40: sparse:     got struct nvif_push [noderef] __rcu *

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
