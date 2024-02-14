Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64ED1B943
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707911394; cv=none; b=WwJjC8nSghgqAd5vjDATroQPH1l2aFG8aIR5XtAHtO4aXa1jTZnxijWIOB49M+Z3GeK6fbGorqhoxloDsFlwDM+JJtdZDJzspOa8771hC7t+KPT2fdkAQZKmsY8hVwy2UlW2igRl36OWg2Ml1fmUPENaGp3Qm+DnksJuOeDXQac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707911394; c=relaxed/simple;
	bh=ee7tvInUY7pqkMpsyXetY5LgTUSkOiWIC/1hpCGUjfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AEFff6GgCrhz/hbhLlDa1B2uGBxUmMwVZq+scaUwccX+xxiXf8X3tJPCZSasRPcIcWEHbW9vT/JPq55u8IlKDcvZQWcES5B85GxTcXlZdkxKDYlwTOzrF0xKQm53XtqIRxh2JA/F543cdoyFJxd3S/itNm269Et1DlIf5sw2dqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIpReUxL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIpReUxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707911392; x=1739447392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ee7tvInUY7pqkMpsyXetY5LgTUSkOiWIC/1hpCGUjfs=;
  b=PIpReUxL4IfbymtJ1gc4yFw3hC90ZkpHhFCVmyfFJmOrV4cz85Bx3Ma4
   WZf3b2dBiv9qKC5cN4674fra34hZMyH41n1kUCw2M0I7D8aYnrBdEFsN8
   KyIYnYeu6G0F7R42pvZ6qOuvCXAenqHu6V5QWOCMNqKNUTlMR/iIkMyBa
   NoLk+ebtIBnlIpEiEs6GZk+mUxEOckSVwqVKvrTIEU+M04RwClxMCHX0H
   XccNiG/me474BfBFataJWgmse+dWUHk7znlo66gaCcB0+l8g+AkLSto4l
   w8xWwi48kSGdql+IO3HkSPWLlexxD8uByTxeUl4RCvBGTwAj+hhLSGS3i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="4915330"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="4915330"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 03:49:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="26330081"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Feb 2024 03:49:49 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raDlr-0008jU-1H;
	Wed, 14 Feb 2024 11:49:47 +0000
Date: Wed, 14 Feb 2024 19:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>
Subject: [agd5f:amd-staging-drm-next 3/4]
 drivers/gpu/drm/amd/amdgpu/amdgpu.h:1559:13: warning:
 'amdgpu_choose_low_power_state' defined but not used
Message-ID: <202402141926.Hp5FMw4P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   f0ec34378e0c33a23efa875aa8836b363ae44d8b
commit: c1251e31ec259ff955cc1f7ed74e91f28c7a0e7c [3/4] drm/amd: Stop evicting resources on APUs in suspend
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20240214/202402141926.Hp5FMw4P-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141926.Hp5FMw4P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141926.Hp5FMw4P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:34:
>> drivers/gpu/drm/amd/amdgpu/amdgpu.h:1559:13: warning: 'amdgpu_choose_low_power_state' defined but not used [-Wunused-function]
    1559 | static void amdgpu_choose_low_power_state(struct amdgpu_device *adev) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:27:
>> drivers/gpu/drm/amd/amdgpu/amdgpu.h:1559:13: warning: 'amdgpu_choose_low_power_state' defined but not used [-Wunused-function]
    1559 | static void amdgpu_choose_low_power_state(struct amdgpu_device *adev) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function 'amdgpu_gfx_kiq_init_ring':
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:40: warning: '%d' directive writing between 1 and 10 bytes into a region of size between 0 and 8 [-Wformat-overflow=]
     332 |         sprintf(ring->name, "kiq_%d.%d.%d.%d", xcc_id, ring->me, ring->pipe, ring->queue);
         |                                        ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:29: note: directive argument in the range [0, 2147483647]
     332 |         sprintf(ring->name, "kiq_%d.%d.%d.%d", xcc_id, ring->me, ring->pipe, ring->queue);
         |                             ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:9: note: 'sprintf' output between 12 and 41 bytes into a destination of size 16
     332 |         sprintf(ring->name, "kiq_%d.%d.%d.%d", xcc_id, ring->me, ring->pipe, ring->queue);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:30:
>> drivers/gpu/drm/amd/amdgpu/amdgpu.h:1559:13: warning: 'amdgpu_choose_low_power_state' defined but not used [-Wunused-function]
    1559 | static void amdgpu_choose_low_power_state(struct amdgpu_device *adev) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c: In function 'gfx_v9_0_early_init':
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1255:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
    1255 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
         |                                                    ^~
   ......
    1393 |                 r = gfx_v9_0_init_cp_gfx_microcode(adev, ucode_prefix);
         |                                                          ~~~~~~~~~~~~
   In function 'gfx_v9_0_init_cp_gfx_microcode',
       inlined from 'gfx_v9_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1393:7,
       inlined from 'gfx_v9_0_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4540:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1255:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 30
    1255 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c: In function 'gfx_v9_0_early_init':
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1261:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
    1261 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
         |                                                    ^~
   ......
    1393 |                 r = gfx_v9_0_init_cp_gfx_microcode(adev, ucode_prefix);
         |                                                          ~~~~~~~~~~~~
   In function 'gfx_v9_0_init_cp_gfx_microcode',
       inlined from 'gfx_v9_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1393:7,
       inlined from 'gfx_v9_0_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4540:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1261:9: note: 'snprintf' output between 15 and 44 bytes into a destination of size 30
    1261 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c: In function 'gfx_v9_0_early_init':
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1267:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
    1267 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
         |                                                    ^~
   ......
    1393 |                 r = gfx_v9_0_init_cp_gfx_microcode(adev, ucode_prefix);
         |                                                          ~~~~~~~~~~~~
   In function 'gfx_v9_0_init_cp_gfx_microcode',
       inlined from 'gfx_v9_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1393:7,
       inlined from 'gfx_v9_0_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4540:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1267:9: note: 'snprintf' output between 15 and 44 bytes into a destination of size 30
    1267 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c: In function 'gfx_v9_0_early_init':
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1303:60: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
    1303 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc_am4.bin", chip_name);
         |                                                            ^~
   ......
    1398 |         r = gfx_v9_0_init_rlc_microcode(adev, ucode_prefix);
         |                                               ~~~~~~~~~~~~  
   In function 'gfx_v9_0_init_rlc_microcode',
       inlined from 'gfx_v9_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1398:6,
       inlined from 'gfx_v9_0_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4540:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1303:17: note: 'snprintf' output between 20 and 49 bytes into a destination of size 30
    1303 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc_am4.bin", chip_name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c: In function 'gfx_v9_0_early_init':
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1309:60: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
    1309 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_kicker_rlc.bin", chip_name);
         |                                                            ^~
   ......
    1398 |         r = gfx_v9_0_init_rlc_microcode(adev, ucode_prefix);
         |                                               ~~~~~~~~~~~~  
   In function 'gfx_v9_0_init_rlc_microcode',
       inlined from 'gfx_v9_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1398:6,
       inlined from 'gfx_v9_0_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4540:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1309:17: note: 'snprintf' output between 23 and 52 bytes into a destination of size 30
    1309 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_kicker_rlc.bin", chip_name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c: In function 'gfx_v9_0_early_init':
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1311:60: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
    1311 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
         |                                                            ^~
   ......
    1398 |         r = gfx_v9_0_init_rlc_microcode(adev, ucode_prefix);
         |                                               ~~~~~~~~~~~~  
   In function 'gfx_v9_0_init_rlc_microcode',
       inlined from 'gfx_v9_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1398:6,
       inlined from 'gfx_v9_0_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4540:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1311:17: note: 'snprintf' output between 16 and 45 bytes into a destination of size 30
    1311 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:29:
>> drivers/gpu/drm/amd/amdgpu/amdgpu.h:1559:13: warning: 'amdgpu_choose_low_power_state' defined but not used [-Wunused-function]
    1559 | static void amdgpu_choose_low_power_state(struct amdgpu_device *adev) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c: In function 'gfx_v10_0_init_microcode':
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3979:58: warning: '%s' directive output may be truncated writing up to 4 bytes into a region of size between 0 and 29 [-Wformat-truncation=]
    3979 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", ucode_prefix, wks);
         |                                                          ^~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3979:9: note: 'snprintf' output between 16 and 49 bytes into a destination of size 40
    3979 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", ucode_prefix, wks);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3985:57: warning: '%s' directive output may be truncated writing up to 4 bytes into a region of size between 1 and 30 [-Wformat-truncation=]
    3985 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", ucode_prefix, wks);
         |                                                         ^~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3985:9: note: 'snprintf' output between 15 and 48 bytes into a destination of size 40
    3985 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", ucode_prefix, wks);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3991:57: warning: '%s' directive output may be truncated writing up to 4 bytes into a region of size between 1 and 30 [-Wformat-truncation=]
    3991 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", ucode_prefix, wks);
         |                                                         ^~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3991:9: note: 'snprintf' output between 15 and 48 bytes into a destination of size 40
    3991 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", ucode_prefix, wks);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3998:62: warning: '_rlc.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
    3998 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                                                              ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3998:17: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
    3998 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4014:58: warning: '%s' directive output may be truncated writing up to 4 bytes into a region of size between 0 and 29 [-Wformat-truncation=]
    4014 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", ucode_prefix, wks);
         |                                                          ^~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4014:9: note: 'snprintf' output between 16 and 49 bytes into a destination of size 40
    4014 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", ucode_prefix, wks);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4021:54: warning: '_mec2' directive output may be truncated writing 5 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
    4021 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", ucode_prefix, wks);
         |                                                      ^~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4021:9: note: 'snprintf' output between 17 and 50 bytes into a destination of size 40
    4021 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", ucode_prefix, wks);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:28:
>> drivers/gpu/drm/amd/amdgpu/amdgpu.h:1559:13: warning: 'amdgpu_choose_low_power_state' defined but not used [-Wunused-function]
    1559 | static void amdgpu_choose_low_power_state(struct amdgpu_device *adev) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c: In function 'gfx_v11_0_init_microcode':
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:519:54: warning: '_pfp.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     519 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:519:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     519 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:536:54: warning: '_me.bin' directive output may be truncated writing 7 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     536 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |                                                      ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:536:9: note: 'snprintf' output between 15 and 44 bytes into a destination of size 40
     536 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:553:70: warning: '_rlc.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     553 |                         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:553:25: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     553 |                         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:565:54: warning: '_mec.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     565 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:565:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     565 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:28:
>> drivers/gpu/drm/amd/amdgpu/amdgpu.h:1559:13: warning: 'amdgpu_choose_low_power_state' defined but not used [-Wunused-function]
    1559 | static void amdgpu_choose_low_power_state(struct amdgpu_device *adev) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c: In function 'amdgpu_mes_init_microcode':
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1486:66: warning: '%s' directive output may be truncated writing up to 1 bytes into a region of size between 0 and 29 [-Wformat-truncation=]
    1486 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                                                                  ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1486:17: note: 'snprintf' output between 16 and 46 bytes into a destination of size 40
    1486 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1487 |                          ucode_prefix,
         |                          ~~~~~~~~~~~~~
    1488 |                          pipe == AMDGPU_MES_SCHED_PIPE ? "" : "1");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1481:66: warning: '%s' directive output may be truncated writing 1 byte into a region of size between 0 and 29 [-Wformat-truncation=]
    1481 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                                                                  ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1481:17: note: 'snprintf' output between 17 and 46 bytes into a destination of size 40
    1481 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1482 |                          ucode_prefix,
         |                          ~~~~~~~~~~~~~
    1483 |                          pipe == AMDGPU_MES_SCHED_PIPE ? "_2" : "1");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1481:66: warning: '%s' directive output may be truncated writing 2 bytes into a region of size between 0 and 29 [-Wformat-truncation=]
    1481 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                                                                  ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1481:17: note: 'snprintf' output between 18 and 47 bytes into a destination of size 40
    1481 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1482 |                          ucode_prefix,
         |                          ~~~~~~~~~~~~~
    1483 |                          pipe == AMDGPU_MES_SCHED_PIPE ? "_2" : "1");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1493:62: warning: '_mes.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
    1493 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes.bin",
         |                                                              ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1493:17: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
    1493 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes.bin",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1494 |                          ucode_prefix);
         |                          ~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:34:
>> drivers/gpu/drm/amd/amdgpu/amdgpu.h:1559:13: warning: 'amdgpu_choose_low_power_state' defined but not used [-Wunused-function]
    1559 | static void amdgpu_choose_low_power_state(struct amdgpu_device *adev) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c: In function 'amdgpu_vcn_early_init':
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:97:58: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
      97 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                          ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:97:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 40
      97 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.c:27:
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1559:13: warning: 'amdgpu_choose_low_power_state' defined but not used [-Wunused-function]
    1559 | static void amdgpu_choose_low_power_state(struct amdgpu_device *adev) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:31:
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1559:13: warning: 'amdgpu_choose_low_power_state' defined but not used [-Wunused-function]
    1559 | static void amdgpu_choose_low_power_state(struct amdgpu_device *adev) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c: In function 'smu_v11_0_init_microcode':
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:110:54: warning: '.bin' directive output may be truncated writing 4 bytes into a region of size between 0 and 29 [-Wformat-truncation=]
     110 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                      ^~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:110:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 36
     110 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c:31:
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1559:13: warning: 'amdgpu_choose_low_power_state' defined but not used [-Wunused-function]
    1559 | static void amdgpu_choose_low_power_state(struct amdgpu_device *adev) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c: In function 'smu_v13_0_init_microcode':
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c:108:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
     108 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                    ^~       ~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c:108:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 30
     108 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/amdgpu_choose_low_power_state +1559 drivers/gpu/drm/amd/amdgpu/amdgpu.h

  1551	
  1552	#if defined(CONFIG_ACPI) && defined(CONFIG_SUSPEND)
  1553	bool amdgpu_acpi_is_s3_active(struct amdgpu_device *adev);
  1554	bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev);
  1555	void amdgpu_choose_low_power_state(struct amdgpu_device *adev);
  1556	#else
  1557	static inline bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev) { return false; }
  1558	static inline bool amdgpu_acpi_is_s3_active(struct amdgpu_device *adev) { return false; }
> 1559	static void amdgpu_choose_low_power_state(struct amdgpu_device *adev) { }
  1560	#endif
  1561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
