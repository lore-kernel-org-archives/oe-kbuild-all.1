Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B741FDF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 05:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689744437; x=1721280437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YIIqGfkqJ3F+4JyU6vvIceigpL0vLIbBBGLWx8ch5Bs=;
  b=VMvcXqokF/XZ9f1Y0pw1qKHcUwEDOewKjaCH6OdDIxy55b8PQ3c6wcLO
   jVz3bjfWX2vVFHyld/Vw6ozr869J1dPIx7yBNbPdMK0sldHfqqMHPWYCT
   hcjm9Vwz/ilgEz4Pnz3QXN8CVvoR+fMtoCGZNIgFXjM7pYv6M7zqOevcS
   SRPvuLlY07TRdOVrMxHDuUzjTRlzoYIZzHOjHVMJuKwBnHDgZ39N9IEWS
   ux/BPto1pnHZCBITiEMb9FRG+0dASVFCKOVqG9VuhTj35DvH0442Nrsep
   yoiO0VwpkEAF1WwiAoI6ebAKqgcLwNZWSgOnFhJr8jAq/pnTrN6tlqp1E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345964741"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="345964741"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 22:27:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="867339855"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2023 22:27:16 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLziR-0004BH-3D;
	Wed, 19 Jul 2023 05:27:13 +0000
Date: Wed, 19 Jul 2023 13:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 127/12466]
 sound/soc/fsl/fsl_xcvr_sysfs.c:106:31: warning: old-style function
 definition
Message-ID: <202307191328.G1wRUNzq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Viorel,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: d6bb8a57699c60069606540858677858f7df394d [127/12466] MLK-24965: ASoC: fsl_xcvr: bit and timestamp counters
config: alpha-randconfig-r014-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191328.G1wRUNzq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191328.G1wRUNzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191328.G1wRUNzq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/fsl/fsl_xcvr_sysfs.c: In function 'fsl_xcvr_get_attr_grp':
>> sound/soc/fsl/fsl_xcvr_sysfs.c:106:31: warning: old-style function definition [-Wold-style-definition]
     106 | const struct attribute_group *fsl_xcvr_get_attr_grp()
         |                               ^~~~~~~~~~~~~~~~~~~~~


vim +106 sound/soc/fsl/fsl_xcvr_sysfs.c

   105	
 > 106	const struct attribute_group *fsl_xcvr_get_attr_grp()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
