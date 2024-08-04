Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C855BA38
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Aug 2024 01:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722735175; cv=none; b=Noet+Uqel+LWy2c3fXabsRqWpXDzw14yB4h+fL+/9SW982kYljIp+986BeQ0m60G6hYR1SGPkEkodwq7KDr2TZS6m+EFgDbNMOR8wlb+9FgPptPT7cAWoxd6qup9Dydoxa22p3hUNJOFn7gdk59lGX8K3GX4QtvPxpOFiuHOU0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722735175; c=relaxed/simple;
	bh=2cTOlLqeYWF+ZMmqGMSR2peUZcdQnn/9WMOR4a7IyYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tVSMZSVX92G1XOV6SDZ/iWFVnoVc655TQuynUKMhn7OjzfzWNdX0ZEp/adxZZdywIDgrQr92tCHKNRVi/u21CESftJxiYaLcPZmc+AYrFzyLte+Dg5O3N7M0M0gL1L2Olv/RsdHxIv7xzvbtkRrtXYcHLSBjkOHw3Z2ih49gnK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nliRpY4D; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nliRpY4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722735174; x=1754271174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2cTOlLqeYWF+ZMmqGMSR2peUZcdQnn/9WMOR4a7IyYU=;
  b=nliRpY4Dj7nu/TocJmjZaW3PRtCqrRma0zA+xC+9QqJ6Cyi3V950A/jU
   DhanJRiTz9EAeKYKaxi9zjqSHOf/S1ePE1O/tAUPDR9O1Ckt+OGCcd+9C
   FrfU6MTiIJy6B006SxMRQ03vQmcKd+b+50I0d4u533/DbpO1b87/VN9cL
   wQz+ZbqFHFJGSkx3lnxaDRQIVv8lkT6Eq4Uw4sH9G61CPxkGhiD6BSCgn
   T9QKjFArsLlBaq2i7Nm28E57gaOYz2DM3rQI5qjTxiUUNgfMfv1vSLJA/
   12Lptapdgg8jkdQQzNqt77JhWM3t/kO0/Wt2CrGwiUBLgvhR3FCUENLH5
   Q==;
X-CSE-ConnectionGUID: k45osWyxS76L++IF0RGzqw==
X-CSE-MsgGUID: JjPPoBdaSq+ph/bsj4Ebtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="32127186"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="32127186"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 18:32:41 -0700
X-CSE-ConnectionGUID: lONrNZcmQtm021hi98KLOA==
X-CSE-MsgGUID: Uq0DgxgkQRuw6N2KVSX9HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="55753100"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Aug 2024 18:32:40 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saQ6w-00013k-0X;
	Sun, 04 Aug 2024 01:32:38 +0000
Date: Sun, 4 Aug 2024 09:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:renesas-clk-for-v6.12 29/29] /usr/bin/ld:
 drivers/clk/renesas/rzv2h-cpg.o:undefined reference to `r9a09g057_cpg_info'
Message-ID: <202408040932.SqrqyXGU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.12
head:   42b54d52ecb7a81998592c2b40f8a963e82ed02e
commit: 42b54d52ecb7a81998592c2b40f8a963e82ed02e [29/29] clk: renesas: Add RZ/V2H(P) CPG driver
config: um-randconfig-r122-20240803 (https://download.01.org/0day-ci/archive/20240804/202408040932.SqrqyXGU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040932.SqrqyXGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040932.SqrqyXGU-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
>> /usr/bin/ld: drivers/clk/renesas/rzv2h-cpg.o:(.rodata+0xc0): undefined reference to `r9a09g057_cpg_info'
   clang-14: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
