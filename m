Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949DE225A8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 23:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710718977; cv=none; b=tZyFAloUOQvnhz4hWYKNlmJpLivUCzCu2+zkKYxS/kVEvccTVIIETXvoFDAgFp6WWWhjXfKKl9gk77bkTzaejfXtYg6yllNX1me/7U1T1w2IKgVwWRgweQo+vEzw4Ys6kV0cfYbxVV7uJRQW4wNDXtiKgEDI1VQbtOuBYXZfgZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710718977; c=relaxed/simple;
	bh=HkV5SHO6vapCzEGBR01S4X7J/pDotb70hj8QYJXoFFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qtwyVgllDotAvQGvL7kc59H6JekYIoVz+UmHzcvWvPxcJ9JFdGUXIleM8N1lkIvG98l5gBqwqJMl01cKeXuQ3VXB7S21nupMkQCaXMf1Cz7//XLo+PHELCxJXs/adgZvJbdXnPlfXBfE/hYb15FJxQbyj3sVzwOjvsb0s9JpzyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DenX5Ngk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DenX5Ngk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710718976; x=1742254976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HkV5SHO6vapCzEGBR01S4X7J/pDotb70hj8QYJXoFFc=;
  b=DenX5NgkDVEc5p+hOpLozU0fibiHtyPltfs8A9a0CSJ4lgxGnZNt8Xv+
   aXQdwwHnV64XFjNNFXuMVapTvj3tkij02SMrKC89eL9U+OnrRv7Fj93u+
   zRVTwvkCmuiTTZJuC68R/8DsX7K5v4M4x84hUc/HQ5q2lPTsrAyRXE78W
   drjbNL2oMSt82svP5S2PWy4FIgAy/HiY6L7k9LwHTmLeN+hf7262Q4Yqt
   b0nYECDFJidiLWXG/TUkG9FUoV2pGjHm0uOJHQdTRN0lc2Jb/rdGJ8Sqh
   pfcb0UeyG8rXLQi6+gnHY/fYaUZ7djMtuXGF3rmmACpxnftAmcMBKoXaN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5642649"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="5642649"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 16:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="13331430"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Mar 2024 16:42:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rm09T-000GX9-0o;
	Sun, 17 Mar 2024 23:42:51 +0000
Date: Mon, 18 Mar 2024 07:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:nxp/v6.8/compulab 25/25] make[4]: *** No rule to make
 target
 'arch/arm64/boot/dts/freescale/imx8mp-sb-ucm-panel-kd050hdfia020-dtb',
 needed by 'arch/arm64/boot/dts/freescale/'.
Message-ID: <202403180717.g59fnxjO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git nxp/v6.8/compulab
head:   da1ab5bceb7569e3c749e300712b5454a50f16d5
commit: da1ab5bceb7569e3c749e300712b5454a50f16d5 [25/25] arm64: dts: freescale: imx8mp-sb-ucm: Add DSI panel overlay
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240318/202403180717.g59fnxjO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403180717.g59fnxjO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403180717.g59fnxjO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/freescale/imx8mp-sb-ucm-panel-kd050hdfia020-dtb', needed by 'arch/arm64/boot/dts/freescale/'.
   make[4]: Target 'arch/arm64/boot/dts/freescale/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
