Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151CF259C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 19:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717441441; cv=none; b=lR8SS7aykWumtpRKC+/0Sejl4y2aGp9EtuQw2ClrFW8AeHJI+A6dmTSwVZTTItxj4VQoDnE2xqq5YU1I4EpOHtnjszE6GB70drH7y6MXlE4Egif8SZxeQkctaAqXA9W7S3R/fQuaXijonLlnouMFzmuxs2AkWjhOw9lLmkyd0FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717441441; c=relaxed/simple;
	bh=ynAcZJ5Mx80aHop5BiflpxWDaHS6Rw6wwSolv2YJWsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mAuBTRdDfe967Pn/svLqWUeuK2QRiuN/KeXK+KZU4+6wKyVVrMArBJs+VZ1CfV72yKVwhuFIYj1qJUy+i0o3grjRRUsKS8BLCtbyNxctTh2YEKjM1yy08F1MlN8LdN246dMjrzs9KtRoX8PH3BKid2rVF9Krq2e+v9bP5MsyKQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nl8eWGpC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nl8eWGpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717441440; x=1748977440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ynAcZJ5Mx80aHop5BiflpxWDaHS6Rw6wwSolv2YJWsg=;
  b=Nl8eWGpCz0EeTtikdUsbT3YTB+nbyLPKaSwIRUJvy5GZH4Uk62oRmxuu
   BnBjX9+s/OQL8EGBinSTLhuqyVkbum1eEW3HOybr3NOgTHAdNnDDKJtcz
   zAopeOn7RVzVtwIR/XKB1gxC8H0W7Tl4yiWDvH60FDuOSV9HRGRbqxjCw
   ulBj0G254u5JUK2NNKQO/UNiYRNFGzBhDJjFkerrYqNpDggmBXFkxCC5o
   /5MSU/rVtF5xThGggme9gc7SbT/UeZPKTEXcyiMgR0rGXiHosUDYHdRg0
   JV2B9MrlVm9X1owLSnkkkjN9M6nPD6NnGm2myhYGFdqktIF4D0jrd+Ro6
   Q==;
X-CSE-ConnectionGUID: E0oxJ2SnT12glzYKHAZtHQ==
X-CSE-MsgGUID: UQDtZAFKT9SThBQg0rDbxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="16893289"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="16893289"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 12:03:59 -0700
X-CSE-ConnectionGUID: ZEHbvfbgTBiJ/A98trwkLw==
X-CSE-MsgGUID: HkuvYjejTbaZSXsRZil8Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="36905416"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 03 Jun 2024 12:03:59 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sECyK-000M5D-0E;
	Mon, 03 Jun 2024 19:03:56 +0000
Date: Tue, 4 Jun 2024 03:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 5/69] aarch64-linux-ld:
 tlc_dp_hdcp.c:undefined reference to `tee_shm_get_va'
Message-ID: <202406040238.9OLT77Oc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   1c22e6cde5dc90ef6d53118c55e3dac17e01ad15
commit: f3d25943c1d4020b0ad7f3049b57cc70ba462af7 [5/69] FROMLIST: Subject: [PATCH] drm/mediatek/dp: Add tee client application for HDCP
config: arm64-randconfig-001-20240603 (https://download.01.org/0day-ci/archive/20240604/202406040238.9OLT77Oc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040238.9OLT77Oc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040238.9OLT77Oc-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/mediatek/tlc_dp_hdcp.o: in function `dp_tee_op_send':
   tlc_dp_hdcp.c:(.text+0x240): undefined reference to `tee_client_invoke_func'
>> aarch64-linux-ld: tlc_dp_hdcp.c:(.text+0x25c): undefined reference to `tee_shm_get_va'
   aarch64-linux-ld: drivers/gpu/drm/mediatek/tlc_dp_hdcp.o: in function `tee_remove_device':
   tlc_dp_hdcp.c:(.text+0x4c8): undefined reference to `tee_shm_free'
>> aarch64-linux-ld: tlc_dp_hdcp.c:(.text+0x508): undefined reference to `tee_client_close_session'
>> aarch64-linux-ld: tlc_dp_hdcp.c:(.text+0x520): undefined reference to `tee_client_close_context'
   aarch64-linux-ld: drivers/gpu/drm/mediatek/tlc_dp_hdcp.o: in function `tee_add_device':
   tlc_dp_hdcp.c:(.text+0x714): undefined reference to `tee_client_open_context'
>> aarch64-linux-ld: tlc_dp_hdcp.c:(.text+0x788): undefined reference to `tee_client_open_session'
   aarch64-linux-ld: tlc_dp_hdcp.c:(.text+0x7cc): undefined reference to `tee_client_close_context'
>> aarch64-linux-ld: tlc_dp_hdcp.c:(.text+0x898): undefined reference to `tee_shm_alloc_kernel_buf'
   aarch64-linux-ld: tlc_dp_hdcp.c:(.text+0x924): undefined reference to `tee_client_close_session'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
