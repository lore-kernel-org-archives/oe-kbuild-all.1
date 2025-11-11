Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69D35950
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762853354; cv=none; b=dE/11WZaij++mN/MAbmCPlH7DVMFH6fipYwicGfWDmUdwjf3Xw3diOv4ZaBTro2x1vT2V/EssVVgvxwkhX0TArVAn6ceZydKaTRnJzpUoUykb6IoSG6BjhUKuzTQ8UBZcgZ1NZfX4xwMnuqF7xgNZFf38HI/psYb0NMRREoZnVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762853354; c=relaxed/simple;
	bh=m+natFa7DJRJmZlp0ffFnGJHdzhwzbEUzCN2Lv/T0Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C8rtqnyi3Ab51pFr2CIi5uvNIwD+0kmZPBM0E4SdG4rQ9e02YDdxrOJZb8WUUR4F2cz4c3CpGjnb0QOde6162Q8w31GgnROgDymlRg7z0rZL5del2pNH+aqcaEWAxoGfDRuAsWF+q+jz6xZH7YDEqLTgGBVXZZhXw2R0CcU0VTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6O81qhp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6O81qhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762853353; x=1794389353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m+natFa7DJRJmZlp0ffFnGJHdzhwzbEUzCN2Lv/T0Dc=;
  b=l6O81qhpkukrWzyP4MTkgZh+qK98gilIbVUh2IABR0llS0uBAzRwfUAO
   AWIbnNgMX36QVVsBF+eSKmiLtMIFMAyUH/iG0DLc4kJczq2slhNbao0oy
   mGMfxgsA0eKmuomNM8fxLKlRR9eWaYlEUq2eVnBqtRGHlA49TH6PiLGI6
   rt87o6qWFoBjvk5gCbWNxq6UdWG7AzNvfbkFxnK2ZfGLGaxGscWl92OBw
   WPBhV7LxsGL1n5dUIN0goXuT0vRMilye24xNXziqg9ys5jQwP/R7Kw97I
   D/fb8Rm/x28+LN5aR4jIoYxsd+aEnZfPgGJqzP3sdlnF8G7CAiOWZrg7c
   Q==;
X-CSE-ConnectionGUID: hhg4DPPITqKfwvKIiRuUSw==
X-CSE-MsgGUID: QhzsMz8xQqGg4rMTeyZTOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="65068427"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="65068427"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 01:29:13 -0800
X-CSE-ConnectionGUID: 97uhS0odSQCiPnErqwOsuw==
X-CSE-MsgGUID: Ooy8sJBVRh+griQiLLWyaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="189350612"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Nov 2025 01:29:11 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIkgX-00030d-1e;
	Tue, 11 Nov 2025 09:29:09 +0000
Date: Tue, 11 Nov 2025 17:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-upstream-mt7987 16/25] make[4]: *** No
 rule to make target
 'arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-nand.dtbo',
 needed by 'arch/arm64/boot/dts/mediatek/'.
Message-ID: <202511111710.qhHEL2eC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-upstream-mt7987
head:   ec10f8ba1916a5d0cabad62514f52a11fdc8ac75
commit: 301b4560190acace7a127e52d62738ea7c8da686 [16/25] arm64: dts: add bpi-r4 lite overlays
config: arm64-randconfig-003-20251111 (https://download.01.org/0day-ci/archive/20251111/202511111710.qhHEL2eC-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111710.qhHEL2eC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111710.qhHEL2eC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-nand.dtbo', needed by 'arch/arm64/boot/dts/mediatek/'.
   make[4]: Target 'arch/arm64/boot/dts/mediatek/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
