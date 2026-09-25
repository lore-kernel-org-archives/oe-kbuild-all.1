Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6944C9DFC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349927; cv=none; b=lLlhsRQGgBA6ldO//lb3ouoMgCuai0JyMpo3h/zLY4ppNtX3Vcx59yg+3b3KkMU0dB7BhYUwMVMx+fZ4xRBHDpWUPt6eBYn6Da+y2j297Ku4K+6cnVZJ6fpKu71CnSDKJamfWJmKd1q+zVE+FLY20saOJ+rP6XTxBgVwdbh8WPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349927; c=relaxed/simple;
	bh=Q0v/SVqBOgybppgC0FjZOVLyGfnt9VCWOQtZt+Yhdd0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ctAFRI1csZVeFiUwLcpF9+lIVIRG4QCURAxASGLm6e5gadkhm/QIlklxLzmYeKlwmP5DmWOmqTJAkmUKeC9nMorimQoQQp+Rg3tm5BuGv/Vao1+vLaMUSLDDlBuea3ctOkRTLyyALjXYIQPpijIevr9rDfx3GaIB2MYBd9L58MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiJ0gGMR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiJ0gGMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790349926; x=1821885926;
  h=date:from:to:cc:subject:message-id;
  bh=Q0v/SVqBOgybppgC0FjZOVLyGfnt9VCWOQtZt+Yhdd0=;
  b=OiJ0gGMRrK4oHhwg7GuSsXY62aGwFkwF9XjVcKzGStSLhtFqYUjGGDFI
   2Yq0dMwmigx5zw2dRaZ3hJ0QbOSuB8nU5Ot6XmVVBFn7AYtK50qN6x7eo
   eHGTQDveLrtqwqXrl1R898xJ0gKZCAQ/jxUyvXW1SRNGmTYzrRKnqUFZg
   1DWGvUZVy+lqkGay+5R7AQer+UisAQp5Sq1ZxAVz8oorMJ0zolo2/yTMC
   gImpIy3Hevrx6rqJrU/ZoVgmkMELPjZzZT95dGrmFN89OEpBmf7mLM735
   7C7MooUtj2ikYJOD6K7x8yIdgn3egN3fcgFFGwqFZCu7EdLBrIvOSGyx2
   Q==;
X-CSE-ConnectionGUID: /kMzF3moRmuZolrLBrN/LA==
X-CSE-MsgGUID: VADXNZJWQ4C+g9OByCSxeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="100470345"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="100470345"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 08:25:26 -0700
X-CSE-ConnectionGUID: E9+h2ZvnTK+Vx6BiaqboOw==
X-CSE-MsgGUID: AQZeOsTQSO6rNzaEM1WWOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272500303"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 25 Sep 2026 08:25:25 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA7nc-000000000nS-3CJd;
	Fri, 25 Sep 2026 15:25:20 +0000
Date: Fri, 25 Sep 2026 17:25:15 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 214/214]
 utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202609251738.DDPNcr0G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   27e8d41a42f73cb2b271df0e897e25224889f6d0
commit: ac7acf4900d414b9c8167c90de6adab60baf00a0 [214/214] firmware: add aeonsemi firmware
config: sh-randconfig-2000-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251738.DDPNcr0G-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251738.DDPNcr0G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251738.DDPNcr0G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.1.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.2.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
