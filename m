Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD473CF69F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 20:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780518612; cv=none; b=Ye6CkzsJA1DCVe2PkYh9hUluZkTFQ6Vv5wiiUYEZodhcJ6em/nL53jXhpxahFN9SVe7UI41QUSzmylJBTA+YfrxmykBBoNlshf4z0sB197ukk0V8LpAaKGrtDweQWjt5sNoEmjlFhMn43p5kEJFndELDgMy5G0n5qHw3IipHmR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780518612; c=relaxed/simple;
	bh=NuGTlXTWJmkFICwgiLWzNvGS0DcQDKZNbjpM/AUThdE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K73ts1MtRbMhmo5KERwFnTyGKTrzVAewSr1yiwTqJISUK30+HKpDDVjJsgY2kNdH42prh5gvF+zYhveHY+PUrzBCIvySL4gIRbsgMFH6jY8ta8TfDJ+1X1nBffOz0Njwyclbvx/fkZahKsNHRUikCYw/MiUnpLdyBSJdUZCCdgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLMJ1jdM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLMJ1jdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780518612; x=1812054612;
  h=date:from:to:cc:subject:message-id;
  bh=NuGTlXTWJmkFICwgiLWzNvGS0DcQDKZNbjpM/AUThdE=;
  b=FLMJ1jdMqNMSPVol0sVEmMXrQzfzmQvUKtG3VrVjt94vxgjSciI5mfCz
   5Vbb7I91UXlz+h2h0/TX7HDiw6thi2Kt6PFe7Rz7wBYdP7KLWFQnmZti5
   YNDOicPHugWcmA5TQGD/2O2Bx2X03BfQO65k9etJRjbH99CeFdUSJFaMk
   OzMNU6ODlG29QkVc6rqk4WpeIrIB8P+5vbh9L6hqqYbC09w9OuF01UuGC
   tiLJPZIL0mOm2uk79Ea5FmXCeyWlExJfk6QjmN86MemSxdxlpleuCYr3b
   M4mNgq0ZDOWEu/8kNps5SxM8n2V4Ns2e+c+9ekiP3JXYrhmWT4Ka0AyEj
   w==;
X-CSE-ConnectionGUID: X96VCMXNQLmu65M2T8oLKQ==
X-CSE-MsgGUID: 7bccw7g5Qf+jOERlpa5+Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="98912888"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="98912888"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 13:30:11 -0700
X-CSE-ConnectionGUID: cNLJJ20RTEa7ePs1fji/fA==
X-CSE-MsgGUID: /LKlA9gBRBWyTMibGlFNtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="241846430"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jun 2026 13:30:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUsE3-00000000Dru-1IvU;
	Wed, 03 Jun 2026 20:30:07 +0000
Date: Thu, 04 Jun 2026 04:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alexandre Courbot <acourbot@nvidia.com>
Subject: [dakr:drm-lifetime 1312/1329] Warning:
 drivers/gpu/drm/drm_gem_shmem_helper.c:174 expecting prototype for
 __drm_gem_shmem_release_sgt_locked(). Prototype was for
 __drm_gem_shmem_free_sgt_locked() instead
Message-ID: <202606040434.JoDqxPvu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git drm-lifetime
head:   305b04e26f0cdff2c8c0db208dbec0d9c9984a48
commit: b78dab829760aee9b83f5cf15550a0fe36c6f4b0 [1312/1329] drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
config: powerpc64-randconfig-r071-20260603 (https://download.01.org/0day-ci/archive/20260604/202606040434.JoDqxPvu-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040434.JoDqxPvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040434.JoDqxPvu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gem_shmem_helper.c:174 expecting prototype for __drm_gem_shmem_release_sgt_locked(). Prototype was for __drm_gem_shmem_free_sgt_locked() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
