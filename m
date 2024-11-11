Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C53D156C52
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323295; cv=none; b=GkOhFKXfbPjWpQw1MunmWea0ujiefNejmWCyof9V0X/LFa08GSnOZvCZCuEMEz3WciL00LPNF3eTMDMRQrBcOzBiNVI8fq5QbhRHmC0K8B4ncse6npZ6vp1O9QFKk6VnIm67q+eTDMgmwSfUo4WiHDRA3yeVo1JozpFY0HMtQdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323295; c=relaxed/simple;
	bh=iP091bDByOoJ2tJPOC9rHuOMeKftI1DInm1WsqzK700=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJkgnbn4kS9S1pYbM48NkPiPtH0DaIhDswosGXCYyQ0FkrG3OyOLD1ztGMOzl5DN0gUXKZjZ5MdTc5CavVz3Xvapy+K9lE8F7gK4IFAYTGs4quaqBYNueV4er3yYcFv6N4wSoAZ+TOttrqN1kCaeeWcNvn8qhOyOKEC/RUypd3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJ7NJA03; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJ7NJA03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731323294; x=1762859294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iP091bDByOoJ2tJPOC9rHuOMeKftI1DInm1WsqzK700=;
  b=YJ7NJA031T5ymY/SHqoqCUuhbSYfmY430MVL692MOiDNnBxMQf/MGfPu
   bQ+9H7d98ywD23HRh4jf+KH3jU2lcuO+uC9CCreJkqNXzxzmGKLrFhEtm
   Zu2BFiSfAoa62DmJM262nel02C/ACxk6d/6/CJPUACGTLvSA0IfHbzYOT
   D5FiCh15FQHEJJBnwqrWpB1Ou+lQjfwnvYIqqgiYvXxF+TV6RTyUSmnj0
   ujStzo+/iVa9X6L6G/dXVKTQcw4FK0Rg/s8MKF4eRV1kJhFDU7ZxRyLQo
   d2RW2SyVosEpLBa9X2DUcaqV41WysmWHyHiA5CAqLJMrpUfWCp/aVA/gi
   w==;
X-CSE-ConnectionGUID: ogfxiiO9TuSpycS1gwVqYg==
X-CSE-MsgGUID: 73i2UU3hQuet/X7+S0BXPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53686018"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53686018"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 03:08:13 -0800
X-CSE-ConnectionGUID: YDXOXB0TRieHpeLsWAGHYg==
X-CSE-MsgGUID: kdNTj+4tQNmwKlDTr/ogbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="124428329"
Received: from lkp-server01.sh.intel.com (HELO dc8184e5aea1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2024 03:08:12 -0800
Received: from kbuild by dc8184e5aea1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tASHB-0000Cv-2U;
	Mon, 11 Nov 2024 11:08:09 +0000
Date: Mon, 11 Nov 2024 19:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 39/175]
 drivers/gpu/drm/udl/udl_cursor.c:68:49: sparse: sparse: cast to restricted
 __le32
Message-ID: <202411111944.YFNeZzwE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f365b9f33df7b7d0f82b6b5b8ee9ccc7667c01f7
commit: fac766c5a86ca5aa0baa0eebbd67bd9e3252a03c [39/175] CHROMIUM: drm/udl: Implement cursor.
config: i386-randconfig-063-20241111 (https://download.01.org/0day-ci/archive/20241111/202411111944.YFNeZzwE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241111/202411111944.YFNeZzwE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411111944.YFNeZzwE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/udl/udl_cursor.c:68:49: sparse: sparse: cast to restricted __le32

vim +68 drivers/gpu/drm/udl/udl_cursor.c

    58	
    59	int udl_cursor_download(struct udl_cursor *cursor,
    60			const struct iosys_map *map)
    61	{
    62		uint32_t *src_ptr, *dst_ptr;
    63		size_t i;
    64	
    65		src_ptr = map->vaddr;
    66		dst_ptr = cursor->buffer;
    67		for (i = 0; i < UDL_CURSOR_BUF; ++i)
  > 68			dst_ptr[i] = cursor_blend_val32(le32_to_cpu(src_ptr[i]));
    69		return 0;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
