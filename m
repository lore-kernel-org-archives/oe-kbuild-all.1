Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FD3271A6D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 23:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779060125; cv=none; b=U+bRgQLbgV1WvM4c5jt/U7t5hM4q1a2Hh1/dYJAK7mXkPZCR2B5ty6i0xePYG8e6cY9S3GZUy9iOftH7GuHORBgL020W7kco8rGef51fcy29i+zoHoLqP6Mjzp5VVpNOZWNHrBHFnovhEacNQeY1qgHgglyGX47z3zU5F98ZNXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779060125; c=relaxed/simple;
	bh=XTTUu36IkKDT2cQyEFhhTBrTLLdnkWj6U11o5pAlPp8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lnkrjy5ODzx1ULTk+ju72U1qPg1Q/A3tXut1SwQ5/iT5X0tLPMEdRgLWES1wnTd5WHTncsfi8a2pXsgzfeQsefQQeSL7dAmHHlR4KbSiAhJyADNYtXNQPsX2HUeo/JWOptpG5fULKvKNL/9PdbcbyLm5EgV0kmyAS+xyOiPTgZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dNNA69PX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNNA69PX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779060123; x=1810596123;
  h=date:from:to:cc:subject:message-id;
  bh=XTTUu36IkKDT2cQyEFhhTBrTLLdnkWj6U11o5pAlPp8=;
  b=dNNA69PXnqJZykayEjjqh51qoYFpgHiLTiMbz0CTlgA2D4doHpFJxzQw
   kjBRC/tpFuhZwEEuc9c8yMZ8CXBuafmoIKDb4r4jQnu6QPQSXVvvZVdok
   VVeBKbHeXSVYRmR6RcUZyjWMBHdLP4iYx8d+4BWj5eDBpPG144xN6+1HI
   0eb9/t33X2mv9N9FsUuPkqqur8C09mdphjW9m353h1Y5rf9Y14z/m1m3R
   pKtPyYbcvPWwFSA0htuyN+2B+fUXQd1RZYXh2OZKuSn08CoSWOSZr1AUo
   LIVXsc2n9PY6rqs1teqY53tui84TC+B1iC7jnbIvSl8jw+Yf1y5wR+HC1
   g==;
X-CSE-ConnectionGUID: hRNL1W/GRGGl8SbNy+KcCg==
X-CSE-MsgGUID: hQL02yGhQhq3hpPxgmzUhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90612238"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="90612238"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 16:22:02 -0700
X-CSE-ConnectionGUID: wYbhJCOUQP+Ij3brAvzZvQ==
X-CSE-MsgGUID: lgLlKjZBST64Fthh76/uvw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 May 2026 16:22:01 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOko2-0000000023G-3bEh;
	Sun, 17 May 2026 23:21:58 +0000
Date: Mon, 18 May 2026 07:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel J Blueman <daniel@quora.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Rob Clark <robin.clark@oss.qualcomm.com>
Subject: [drm-msm:msm-next 9/11]
 drivers/gpu/drm/msm/msm_gem_shrinker.c:105:35: error: parameter name omitted
Message-ID: <202605180748.O1a168W1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next
head:   db339b6bc9f234b4883eb02946ea01d8d9faa11c
commit: 3392291fc509d8ad6e4ad90f15b0a193f721cbc9 [9/11] drm/msm: Fix shrinker deadlock
config: arm64-randconfig-002-20260518 (https://download.01.org/0day-ci/archive/20260518/202605180748.O1a168W1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180748.O1a168W1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180748.O1a168W1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/msm_gem_shrinker.c: In function 'purge':
>> drivers/gpu/drm/msm/msm_gem_shrinker.c:105:35: error: parameter name omitted
    purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem_shrinker.c: In function 'evict':
   drivers/gpu/drm/msm/msm_gem_shrinker.c:117:35: error: parameter name omitted
    evict(struct drm_gem_object *obj, struct ww_acquire_ctx *)
                                      ^~~~~~~~~~~~~~~~~~~~~~~


vim +105 drivers/gpu/drm/msm/msm_gem_shrinker.c

   103	
   104	static bool
 > 105	purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
   106	{
   107		if (!is_purgeable(to_msm_bo(obj)))
   108			return false;
   109	
   110		if (msm_gem_active(obj))
   111			return false;
   112	
   113		return with_vm_locks(msm_gem_purge, obj);
   114	}
   115	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
