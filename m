Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E7E5CBB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 18:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693678169; x=1725214169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G/IhRnLl+NSrKu9mh/8Xlj2Zv3N0mvumeKipzy+eQ3g=;
  b=CmGPDe/1vx1q8xJp4a0uAyihw3KdwUya7Zg2LYMNboZo/0CJcFTQRXLC
   DQV4gRVMDbxGB1V36kiCwlGSpoOY+ETavIjFXTLLt7uWUNUIfD3IqFLtt
   jWLF1MIQViSR1UH8MG2eo1x35aZuSr/M0QHKLE63AW3KCv7bZtTyBOgQE
   CaIHI7cTmGtScptFIcKnJ5izG6WSrglQBY/J2DuycgOH5pzVcC560XLBy
   NfpYoZGEqWi9peCOSItetbiyOHmmZnpB5R/iOxP/V9rcFHa1CtAv9tfEx
   Zqaga5g1uywrlQ2rNpALTh7t90oKS5Iv9uCFrZsGuB+HQHmP6P9tyscMh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="376320124"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="376320124"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 11:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="830468243"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="830468243"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2023 11:09:27 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcV3l-0002Wp-0V;
	Sat, 02 Sep 2023 18:09:25 +0000
Date: Sun, 3 Sep 2023 02:09:09 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 8/15] include/linux/spdm.h:26:36: warning: 'struct
 x509_certificate' declared inside parameter list will not be visible outside
 of this definition or declaration
Message-ID: <202309030141.TKyc5emi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   ed763a31e6c59b6da2def6097fb0463b710121af
commit: e1b1c6bba0267c230d1776987b241dfd53a00305 [8/15] PCI/CMA: Validate Subject Alternative Name in certificates
config: arc-randconfig-001-20230902 (https://download.01.org/0day-ci/archive/20230903/202309030141.TKyc5emi-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309030141.TKyc5emi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030141.TKyc5emi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pci.h:42,
                    from include/drm/drm_module.h:6,
                    from drivers/gpu/drm/sun4i/sun4i_drv.c:22:
>> include/linux/spdm.h:26:36: warning: 'struct x509_certificate' declared inside parameter list will not be visible outside of this definition or declaration
      26 |                             struct x509_certificate *leaf_cert);
         |                                    ^~~~~~~~~~~~~~~~


vim +26 include/linux/spdm.h

    20	
    21	typedef int (spdm_transport)(void *priv, struct device *dev,
    22				     const void *request, size_t request_sz,
    23				     void *response, size_t response_sz);
    24	
    25	typedef int (spdm_validate)(struct device *dev,
  > 26				    struct x509_certificate *leaf_cert);
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
