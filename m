Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A96160
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 00:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696032310; x=1727568310;
  h=date:from:cc:subject:message-id:mime-version;
  bh=brtjHYgxVrRdPxxXFtmrNEnpfxsNI4ghsvcjLT9hUHI=;
  b=cGfnwxtGN9ITk0MEm/pkoC7I2KQVUQ1Sn8Cc4ym1y5R0rF/4nYUZPc3a
   9N/qd/GijJzVSGjKgkE+8VlrNbOt2a2utRHewraF2FuE96Qyvk1ogCxVP
   w4dCBl07kT8dPdBBXLt0VdiCNTywhm1A/D0lU9oJ1kf7PbkdguePdo+k5
   fRz4lBdLeF/xs40JOa8TqkOgjdEwZT0d1TmdGM3C1Wh1o5sb4lyEnA3YT
   DO/AhqWGa5zJV7zFpHQWljWhgARridwoSDzBqIEmpGZvgOuIR94k6QRkm
   XrNwhiX/OvonunpcqzI0OvjFMT1sv5UND19GUXLkaoLpNhqnIcTUkydSQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="413307936"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="413307936"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 17:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="923724678"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="923724678"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Sep 2023 17:05:08 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmNTl-0003Rp-2h;
	Sat, 30 Sep 2023 00:05:05 +0000
Date: Sat, 30 Sep 2023 08:04:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 335/382] cdns-csi2rx.c:undefined
 reference to `phy_mipi_dphy_get_default_config_for_hsclk'
Message-ID: <202309300813.2HpU9iNG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   5c91cbf4b3d6860742df8d1849095f2cc2103059
commit: abf5efa8c5ada91dc8d9c8adaa272e7792afaa17 [335/382] media: cadence: csi2rx: Support runtime PM
config: x86_64-buildonly-randconfig-005-20230930 (https://download.01.org/0day-ci/archive/20230930/202309300813.2HpU9iNG-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309300813.2HpU9iNG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300813.2HpU9iNG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/platform/cadence/cdns-csi2rx.o: in function `csi2rx_configure_external_dphy':
>> cdns-csi2rx.c:(.text+0xb3): undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
