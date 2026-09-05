Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF318381E9A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616519; cv=none; b=iHbMnkL1ArAIduON6xg7Pc+cBXz6Zs6O7oxIqRRpcDjopZr/jJV8TQlgASY9SaTsAg5kzQPyASr/+KDc8cI2SlJqRxfKrdZAkA+qwFF2TxMBmgVkksYgxqndHhCOPZlsxX0lMFgUvNl8mBMCuk/c8VvMNLfWUppAmE+erwr/M/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616519; c=relaxed/simple;
	bh=z6FrMUSD7HejfKXZ0hRh5/dRSNczP6dB3y09E/XFZFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CSmkcJUutz032MmbxdzfHTSG66WcKu5AiPnOgvm+UQ4x0fA1zgDFtVMirSFdDxlkq4oiqjIE2A8JfzYYFi5TAxj3ZWEwig+6cTd0j39oAP7td52FxFHKmviXjamBKxxX+2/11MUupgifXfSdjJOCdReGxYEVb5KfB3uZ9mrdYrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzIrX3ux; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzIrX3ux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788616517; x=1820152517;
  h=date:from:to:cc:subject:message-id;
  bh=z6FrMUSD7HejfKXZ0hRh5/dRSNczP6dB3y09E/XFZFg=;
  b=ZzIrX3ux/5kqrsXP5Kxg0uruXZ/epblFhlxiueQqs5XtWWHfBTZ35zmJ
   dA+lO5IbZr8mNF8fS+YtsgWNbWteIfahjwQD9zxnyaYGWaUoWnug8Ui15
   nzx05xdPj3qJov3Mi8fZi9vSIuZHa5Zd+kEbwyDbx6E4WEIUehRE9cGK5
   hnxRDocTCYva1uVdrMDWwtnd1WF0tGTFWxJARsPwRPTIQqImBineixJks
   cCSUvyNtTs8jZLSdj1dX9lIvX8KZoKrs6Vo1wLF4aKJeZIo/hMHdybPS/
   5iUe7lMQpOuHpQGbyBgHKqWpxhDsKLNbFHK3/Ob6ML6JVXokyRn8i8qCz
   Q==;
X-CSE-ConnectionGUID: 27W+8VFRTYuJfodk09tKTA==
X-CSE-MsgGUID: uL4wmC8vS2eKbGzio2SbpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89216957"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="89216957"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 06:55:16 -0700
X-CSE-ConnectionGUID: kN3i2ZsfR+6Hpb3BO6Jhhw==
X-CSE-MsgGUID: MoQFdbVDR/y5gwAhk9UirQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="264105184"
Received: from igk-lkp-server01.igk.intel.com (HELO 097213dcb3de) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 Sep 2026 06:55:14 -0700
Received: from kbuild by 097213dcb3de with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2qrQ-0000000008l-0mMV;
	Sat, 05 Sep 2026 13:55:12 +0000
Date: Sat, 05 Sep 2026 15:54:32 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 George Zhang <george.zhang@amd.com>, linux-doc@vger.kernel.org
Subject: [agd5f:amd-staging-drm-next 1875/2958] htmldocs:
 Documentation/gpu/amdgpu/display/display-manager:29:
 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c:1580: WARNING: Error
 in declarator or parameters
Message-ID: <202609051521.dVjPj9Zw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   c22f9a61e288580824edbbc3ae5a29c9a338594f
commit: 91019266ceaeb1bca0dfd3c4832ac26d623242e9 [1875/2958] drm/amd/display: Test dmub HPD callbacks and handlers
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260905/202609051521.dVjPj9Zw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051521.dVjPj9Zw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:728 struct member 'boot_time_crc_info' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:728 struct member 'power_module' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:728 struct member 'hdmi_frl_status_polling_wq' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:728 struct member 'hdmi_frl_status_polling_delay_ms' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:728 struct member 'boot_time_crc_info' not described in 'amdgpu_display_manager'
>> Documentation/gpu/amdgpu/display/display-manager:29: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c:1580: WARNING: Error in declarator or parameters
   Invalid C declaration: Expected identifier in nested name, got keyword: void [error at 21]
   STATIC_IFN_KUNIT void dmub_hpd_callback (struct amdgpu_device *adev, struct dmub_notification *notify)
   ---------------------^
   Documentation/gpu/amdgpu/display/display-manager:29: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c:1656: WARNING: Error in declarator or parameters
   Invalid C declaration: Expected identifier in nested name, got keyword: void [error at 21]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
