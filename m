Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D8CEC7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 03:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBoHYyYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698636660; x=1730172660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZTdrwNgn89jCcw+f2C1L6vc7zBe4IhqFVPlYVlEhNNM=;
  b=PBoHYyYTKZqDviBOb00dpKzW/PLYj3bm2WnlzKsP8tB8Z8QwC+3aF7qi
   Sp9ZiPy3tgQlSiXSVMd1BsS9fmWsNdcJSN6rzy6fLSDFcvpb5r7qaZw5U
   7LPSQQXhYr9W6X1SpL2hrTOLnx2qW23ImcV4U4KkRzJnFa9aMkuola2jy
   BSJUHLTsVhZDiMlUqVuD4Ncb9xxZe6pke0/lzxUhi1IJ3Knd3Q2D0vhC8
   us4nyTatv2bNghzm3BR+7Q2V/UPtpx/FOJkyNw3CPbFSh3rkuaBg1eqtE
   wsUXll0rvIJkIS79fKGppINXcVT46bmC4W+0B/R2tOlM7D1zhkMLU+zvj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="373058099"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="373058099"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 20:30:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="903860366"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="903860366"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Oct 2023 20:28:21 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxIzO-000D1G-1y;
	Mon, 30 Oct 2023 03:30:54 +0000
Date: Mon, 30 Oct 2023 11:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 41/49] make[4]: *** No rule to make
 target
 'arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtbo',
 needed by 'arch/arm64/boot/dts/ti/k3-j721e-evm.dtb'.
Message-ID: <202310301124.OMeLlhsw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   18d932095e7671a279370244699bdeb3fc8604de
commit: a2bf2ab7932fb334e6ff900915b80387422f92a5 [41/49] arm64: dts: ti: Add k3-j721e-common-proc-board-infotainment.dtso
config: arm64-randconfig-003-20231030 (https://download.01.org/0day-ci/archive/20231030/202310301124.OMeLlhsw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310301124.OMeLlhsw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310301124.OMeLlhsw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtbo', needed by 'arch/arm64/boot/dts/ti/k3-j721e-evm.dtb'.
   make[4]: Target 'arch/arm64/boot/dts/ti/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
