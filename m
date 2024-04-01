Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C3E623
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 00:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711932901; cv=none; b=EwkIvuXg6+zyQtVM4ZCHNv8k9ChbU7h2kY1L+3eftrIHFLS04mJkb+Zqd5Oo7a/K+WK8Z6S7sVx7mt9VP6NrfmqjWPRr8Y04+Q8+ZjKct9OopVX69ciVCGrGy7sGmsvmSf6MfTnrJi310aocoo+OvZxFIjsjv+rzaMnxPakz/4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711932901; c=relaxed/simple;
	bh=qNcl+CDgQWkYN7Vya4cPCy47ewtUPUKwfTQkzT2P6nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NrJ0jk/fEEBtrpNNjRJVncZbuzCQ+fi1wWJqwBlIORYsCopResn6+QufR5Az7WgTDC4enq2S0WMK5k0dl3amaQ6qP1KxFJtBZHk4r6KzGOheWo6Hmh3uaKtyaPnMXMPOmqTqwp+VA9UjyGt/2M/h4aO6mgjWOOzckZ9INokQErg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtaXult2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtaXult2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711932899; x=1743468899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qNcl+CDgQWkYN7Vya4cPCy47ewtUPUKwfTQkzT2P6nQ=;
  b=dtaXult2Q7yDlH9hAgenj4ZCaGScY890FJit8zkV3waAhmNGu0o8wjv4
   sF/Er4DQO3d9FdB5OHmOSFBsvGo9tlrUpJ+V1rMTTulA1pnK3rCxjKy5n
   P66RsqxWYZF0pfL/Z3FMTP4DBEmSZUZV8N36z/Q+ieM7J0IjMyFGyl9Wp
   8G6N3qs0xmJWIPxC9fmgIeMVHWIoAklimZsKup/woYhrzILSg22eMXkis
   j4yq6UUrn4k0KsxsygQJC2XhMofo0ECQazvbtrz+h1GUTabGBPtHkP+L4
   cVh5vd1W4gUMsFRas7QCrzi7MT3YV/O9r6l26hTNSG+U0vQeF3kQy+qMg
   Q==;
X-CSE-ConnectionGUID: tZ10Om5GQ9mdvfokDNpOKw==
X-CSE-MsgGUID: /fc/4WmYRt29OkBCSRtTbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="18492350"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="18492350"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 17:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="17946847"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Mar 2024 17:54:57 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr5ws-0001Wi-2b;
	Mon, 01 Apr 2024 00:54:54 +0000
Date: Mon, 1 Apr 2024 08:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21291/22010] kismet: WARNING: unmet
 direct dependencies detected for SPI_PHYTIUM when selected by
 SPI_PHYTIUM_PLAT
Message-ID: <202404010843.9bkQDLQJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6726609c5990ede3a9fdb318d1dc759d03678a1a
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [21291/22010] spi: add phytium spi support
config: arm64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PLAT-0-0 (https://download.01.org/0day-ci/archive/20240401/202404010843.9bkQDLQJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240401/202404010843.9bkQDLQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010843.9bkQDLQJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PLAT
   
   WARNING: unmet direct dependencies detected for PINCTRL_EXYNOS
     Depends on [n]: PINCTRL [=y] && OF [=y] && GPIOLIB [=n] && (ARCH_EXYNOS [=y] || ARCH_S5PV210)
     Selected by [y]:
     - ARCH_EXYNOS [=y]
   
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PLAT [=y] && SPI [=y] && SPI_MASTER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
