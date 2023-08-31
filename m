Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C493111BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 13:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693489855; x=1725025855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Trxak2E1fllSsFQB2+LxFyopO0RDjPU2X52GB+zonrA=;
  b=AUKUsDYqJQbngInVpvg4sZhKo3JMW85/dn/gOsyFXbzvmZ//TyiwCCRz
   O6e5VHtxLx3rJ2aI3q8RrE4E4ICDreNDJyE2ygce9RmQpIYZdP6DBiJPL
   svSwpKmQ5QDMm7sxkiL8jom5gGJ7o9tUiktc+WWRmKp9auia13JR5jwo/
   feh8HCX9jLslQC0P43e7P96Xq81FBoCIn4JWIh9RFXMw4WLGmndHEMI9U
   hLragzkPwIMula4VLx8cdCzlZU3SLQi14oVX7g5GvFG0q1DINi+WUXk+V
   J3V6IsOY284+J6Wv0IjaC2RDiz7MC7MHd/WKTDAQAJmtg1R1X6wF2ED8/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375892716"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="375892716"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 06:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="733105337"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="733105337"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Aug 2023 06:50:51 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbi4P-0000Ce-1M;
	Thu, 31 Aug 2023 13:50:49 +0000
Date: Thu, 31 Aug 2023 21:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 12690/24604]
 drivers/net/ethernet/freescale/fman/fman_port.c:2042:36: warning: unused
 variable 'fman_port_acpi_match'
Message-ID: <202308312118.qfZgufBZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vikas,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: d2f4e2f05351c1db4ce45bec364c737ad0147e3c [12690/24604] fsl/fman: add FMan Port ACPI support
config: powerpc-randconfig-r023-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312118.qfZgufBZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312118.qfZgufBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312118.qfZgufBZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/freescale/fman/fman_port.c:2042:36: warning: unused variable 'fman_port_acpi_match' [-Wunused-const-variable]
   static const struct acpi_device_id fman_port_acpi_match[] = {
                                      ^
   1 warning generated.


vim +/fman_port_acpi_match +2042 drivers/net/ethernet/freescale/fman/fman_port.c

  2041	
> 2042	static const struct acpi_device_id fman_port_acpi_match[] = {
  2043		{"NXP0026", 0}
  2044	};
  2045	MODULE_DEVICE_TABLE(acpi, fman_port_acpi_match);
  2046	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
