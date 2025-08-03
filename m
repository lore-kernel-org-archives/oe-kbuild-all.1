Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170801F55FA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 21:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754256083; cv=none; b=M9lpP4uXcL9tYB/4REQoMxwBSsxbETHMOuokSQsGIv+dGN8T2WvcoVjHRatndl5bFTy1HdE8hqaRxqbq5TdFKhGPQi/BBruuUQ7MQgiW6DJrEW3EVQpLXH4hskYHtSBy3SkofiMjan4Ehd+myl7LOy2OwkfFC+FWbBDUtuTrq84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754256083; c=relaxed/simple;
	bh=JnteLG4G8onUN7FrounMgr9UG83cvQbQS5qD1kltp7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m2ov9dx366G1ULaqp1+0jat50gBbq0evWjD2bfCGfq+2Ftv/J0//XeyPyXCCH888XD4rvHaSmMr8oXo8t1i02LWk0GHLbiEBYRyvYTPhaaHLIfF2JI+CSyzrCuL4M7gstnMjS9gSZM3vMqLf6Nv4h23tPBopvRo6IWIu7xiIaEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mm5DynRB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mm5DynRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754256081; x=1785792081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JnteLG4G8onUN7FrounMgr9UG83cvQbQS5qD1kltp7s=;
  b=mm5DynRBcT96ysgeU6Ocrq36DawvjJPNgqWTekyxLMqtpJoTkCqpJHVr
   q/L2F7tFxOAKknuXNkuoGH/7rJPf5jnY3vaUZp6XC+VuH/oSHIyTDZJRy
   NzJ9ctIrpvdCOqcrKhBpXoFDIEci8g8B1ETr9V2AmVJNg52uBkvPv8kAb
   3yfvVkiIU2saJo9HRBHJs9fHjlXWTHaiYFDfDmz/NFDiFRaAHuJhtwzpu
   QKpP/kImPHNBgX8It2CT/MSSSZ0XVogAl0qbJKO84O+fS7QONl7BkcQNT
   OBEFTi8+647jghcUW3eJMUSKcFMGqABSvgeyI5f1Gtzp9M7OPv/omieoX
   w==;
X-CSE-ConnectionGUID: vc3/jfd3Q6SQWwJ47KVNNA==
X-CSE-MsgGUID: DmuFVKbQRqe46bfI2gxyBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="60331328"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60331328"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 14:21:19 -0700
X-CSE-ConnectionGUID: ujynBSEdTWeiH1t1tkefcA==
X-CSE-MsgGUID: xljgkBcJT86tnuO4pikUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163918556"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Aug 2025 14:21:18 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uig8p-0006dw-3C;
	Sun, 03 Aug 2025 21:21:15 +0000
Date: Mon, 4 Aug 2025 05:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:asahi-wip 857/987] Warning:
 drivers/gpu/drm/drm_gem_shmem_helper.c:103 function parameter 'shmem' not
 described in 'drm_gem_shmem_init'
Message-ID: <202508040518.ZISc9nPg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: 30a44f9558120870069ed6d4b59cbae8e6603136 [857/987] drm/gem/shmem: Extract drm_gem_shmem_init() from drm_gem_shmem_create()
config: i386-buildonly-randconfig-002-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040518.ZISc9nPg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040518.ZISc9nPg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040518.ZISc9nPg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gem_shmem_helper.c:103 function parameter 'shmem' not described in 'drm_gem_shmem_init'
>> Warning: drivers/gpu/drm/drm_gem_shmem_helper.c:103 function parameter 'size' not described in 'drm_gem_shmem_init'
>> Warning: drivers/gpu/drm/drm_gem_shmem_helper.c:103 Excess function parameter 'obj' description in 'drm_gem_shmem_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
