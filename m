Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259EA15B990
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 18:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717007537; cv=none; b=JVys6mxXL80ACzlR1JYbsYMSw92xxW2GKY0phzGKzltHa/QiDj0+QVpKc5L3bO9yAbHfMuF849RdaFaegj4nClQJHv+34r472pTjCo+0X9Yd26BkT/LUms9C0KYk8Gfmee39zYlq0vBc6BU2Fx5FnOmnv14iUMBcnFlk21LqzMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717007537; c=relaxed/simple;
	bh=aObcPV7/1urBW8Zs6kqX2NL+wGZSdpbLjdECccXm5wU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3VJ9ai+7HTSoYQnpcStxUrSX3HWIPiqPXLgPzVlOR3Ch88a9VhMS+x/uhbKKWnOSPIXReGmSzlY1DRfKGZH2KXOt/XshNqOBuCntT0P7MEanuuwPzGcDT8NHrEuCeucQjVQRzOLpKwE9hOrlOXbKCbSmrmE6w4Y/Hg1qHy2oWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhrdP3Cb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhrdP3Cb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717007536; x=1748543536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aObcPV7/1urBW8Zs6kqX2NL+wGZSdpbLjdECccXm5wU=;
  b=BhrdP3Cbn+L5at0/roJByW3y6+sCmCHrgzRtrNQUNIywYrMW6AEUm7WZ
   C+u3v3XaufFEF+GJxj6hH+CjGkxCJ12KQjOB4E91ySibc5yCESS8Cz0rV
   Oa/BgnSlGOEr2pksve5puDk89wYOv1eEXr9T1wGmkmQK/S+hkuq649uOe
   458FS9q6nCDtZI2zUDh64OoyiElxCH6F6kSd78WpRIjPdfBkss7a3S0di
   /nyaSLkVI+rd4dg7VSluhckz2tEtOMTIIbJfem6JZQmTZILEjpy5r0GTf
   i/o9CGOE/0ZyBIGad83gy5LFvcvnjnYnx+qKA/wOFuolPKqryP3bJDJ23
   g==;
X-CSE-ConnectionGUID: 2kTfFH90RlaZclnjEi9U3g==
X-CSE-MsgGUID: ByTKW5lNRSer9F2eAMiVqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13254176"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13254176"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 11:32:15 -0700
X-CSE-ConnectionGUID: GAHPneGmQ+mSounZZzkxVQ==
X-CSE-MsgGUID: icqJjtn6QIuE5tdr4Xna6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="66726353"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2024 11:32:14 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCO5s-000E5P-1P;
	Wed, 29 May 2024 18:32:12 +0000
Date: Thu, 30 May 2024 02:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 5/9] tlc_dp_hdcp.c:undefined reference to
 `tee_client_invoke_func'
Message-ID: <202405300239.ITUSN5ec-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   8b97081ebca485a952dbf0187bfcefe20f71dd01
commit: f3d25943c1d4020b0ad7f3049b57cc70ba462af7 [5/9] FROMLIST: Subject: [PATCH] drm/mediatek/dp: Add tee client application for HDCP
config: arm-randconfig-003-20240529 (https://download.01.org/0day-ci/archive/20240530/202405300239.ITUSN5ec-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300239.ITUSN5ec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300239.ITUSN5ec-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/mediatek/tlc_dp_hdcp.o: in function `dp_tee_op_send':
>> tlc_dp_hdcp.c:(.text+0xf0): undefined reference to `tee_client_invoke_func'
>> arm-linux-gnueabi-ld: tlc_dp_hdcp.c:(.text+0x118): undefined reference to `tee_shm_get_va'
   arm-linux-gnueabi-ld: drivers/gpu/drm/mediatek/tlc_dp_hdcp.o: in function `tee_remove_device':
>> tlc_dp_hdcp.c:(.text+0x250): undefined reference to `tee_shm_free'
>> arm-linux-gnueabi-ld: tlc_dp_hdcp.c:(.text+0x25c): undefined reference to `tee_client_close_session'
>> arm-linux-gnueabi-ld: tlc_dp_hdcp.c:(.text+0x264): undefined reference to `tee_client_close_context'
   arm-linux-gnueabi-ld: drivers/gpu/drm/mediatek/tlc_dp_hdcp.o: in function `tee_add_device':
>> tlc_dp_hdcp.c:(.text+0x318): undefined reference to `tee_client_open_context'
>> arm-linux-gnueabi-ld: tlc_dp_hdcp.c:(.text+0x35c): undefined reference to `tee_client_open_session'
   arm-linux-gnueabi-ld: tlc_dp_hdcp.c:(.text+0x3a4): undefined reference to `tee_client_close_context'
>> arm-linux-gnueabi-ld: tlc_dp_hdcp.c:(.text+0x3f0): undefined reference to `tee_shm_alloc_kernel_buf'
   arm-linux-gnueabi-ld: tlc_dp_hdcp.c:(.text+0x42c): undefined reference to `tee_client_close_session'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
