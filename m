Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAFE2F6562
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 19:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791401479; cv=none; b=tG3xfEeF2vaiFUhmMwGQZhYY2K1Iu8Mmwh3QEQdx/o4r2t5w3JzlzjrJRrzju2tqxV66Nqx4UKOLSwfs/+8GWbcf8w9FmGhrZkYebG2ams3sLiU2ew7ovAikd+rLydNJ6iNHTiEbTvaAdvcriRyrDDyV0EWmV3+3plQrHdu0nAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791401479; c=relaxed/simple;
	bh=ehxCUMru4N1EpWtzQiQSUD5pF9CcTQrbDMPKn8VsI9A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qcuXCu6jMCh7wNhTWRODwkKM05ve7F3UMGQ9nDHtNpISAddiMs0xplfljdx0gkFYxKi+tBCYsfyev5TgsXvUon2cHGSMCHAlGGwm4ydcX/XL8o2VBZJM3CEbb5Qocw/oQcZeoCl17vaGYcuDI1tAldEa1lOOehT1oZY1Oi7loFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cnot3UDB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cnot3UDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791401477; x=1822937477;
  h=date:from:to:cc:subject:message-id;
  bh=ehxCUMru4N1EpWtzQiQSUD5pF9CcTQrbDMPKn8VsI9A=;
  b=Cnot3UDBrM649rKzMv0mdIT0M6yky2809ao/LVEziUSMo5gWkq3qjD8V
   QS8I6amp+YEfY64ZD1f6CAFFXXGJivnk+da3O3e8cry9toli7gFIhd87g
   1lO1VLFXWt2C7JboIfUzJ/0rMM55Ny2hiSAnlaWNq9ToCriXwbK/QIziZ
   rnEJE2vPehn+0WOAtWNyerkhvKxdVXG8/tBqJfQM9XicZ8lftYOk5otyt
   lmp1yjAYHiBk8UzyduT3QADgu11OVOpNvzBGKnCVhG9VhPa7nxqJD5zOl
   h/OXCuUlRUxeLzXbVYLK9Cim0wbyqUZEjP7ud+LspMsNoUwcNUxMkhNet
   Q==;
X-CSE-ConnectionGUID: 0DlkpDf3RxWDiJVbRUFcNQ==
X-CSE-MsgGUID: 1xLpXYmqT1uWpnk9VH9S6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="63814"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="63814"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 12:31:16 -0700
X-CSE-ConnectionGUID: Ci39VbmSR6aCxGDGLu+R0A==
X-CSE-MsgGUID: 7vmt+NvlTcagtN6vwjLiYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="125084"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Oct 2026 12:31:15 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEXM8-000000003So-2url;
	Wed, 07 Oct 2026 19:31:12 +0000
Date: Thu, 08 Oct 2026 03:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 391/1212] ERROR: modpost:
 "af_alg_register_type" [crypto/algif_aead.ko] undefined!
Message-ID: <202610080328.hcwnRheF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   7e498a7051b6b67bed11b347e6b66e802a20d280
commit: 7af722314e60623dd68ea324aafab1e47ffb964c [391/1212] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: i386-buildonly-randconfig-1002-20261007 (https://download.01.org/0day-ci/archive/20261008/202610080328.hcwnRheF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080328.hcwnRheF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080328.hcwnRheF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "af_alg_register_type" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_sendmsg" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_pull_tsgl" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "sock_kzfree_s" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "sock_kfree_s" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_release_parent" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "sock_kmalloc" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_unregister_type" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "lock_sock_nested" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "release_sock" [crypto/algif_aead.ko] undefined!
WARNING: modpost: suppressed 19 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [m]:
   - CRYPTO_DEV_ZYNQMP_AES [=m] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=m]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
