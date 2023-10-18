Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877CDCA47
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 07:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQ8BWR1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697612905; x=1729148905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A7i64G9Pzy50SFgStmzNG9ddGeG3J9zIgFxYcGJd7OI=;
  b=kQ8BWR1IkxqBudFQnssdfoQZaTP6//fh/cVIFVQRSkj5Rm4yWuJwuppX
   0LKkwTpOG5Q15jd7SuX5R2ZOZbL5OlL1ebc2Has+Ofv3hIdoyynoc5tjQ
   BpBjYQZDKOdpixXC3piEHgowdNlgW9AnSUh8F52m6Nzv3ChYayVTUv3yA
   2pN/7lI6fqLdsDywaLoUfqmzZjNM50AI4qa2zMars4VahVQq5gQ96eBS+
   VahyqoZCk5dW7f1jLDwgezRStRdkOojwhc4UfC4aQfQjS//ClDG24W9EA
   CmrFG7ft1PC4YySJ6kbHTduSRTNIczqmy4UJbaPWmXoPvDNN5tl5ITz1F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="452426781"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="452426781"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 00:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826757514"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="826757514"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Oct 2023 00:08:22 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt0fD-000032-1m;
	Wed, 18 Oct 2023 07:08:19 +0000
Date: Wed, 18 Oct 2023 15:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4303/15768] swphy.c:(.text+0x1b4):
 multiple definition of `fwnode_fixed_phy_register';
 drivers/net/phy/phylink.o:phylink.c:(.text+0x4994): first defined here
Message-ID: <202310181353.CMjsYOuk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 4e304ae887f2d46b897cbf0214c90c561a4394b8 [4303/15768] net: phy: fixed_phy: add fixed PHY ACPI support
config: mips-loongson1b_defconfig (https://download.01.org/0day-ci/archive/20231018/202310181353.CMjsYOuk-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181353.CMjsYOuk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181353.CMjsYOuk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/phy/phylink.c:16:
>> include/linux/phy_fixed.h:41:20: warning: no previous prototype for 'fwnode_fixed_phy_register' [-Wmissing-prototypes]
      41 | struct phy_device *fwnode_fixed_phy_register(struct fwnode_handle *fwnode_np,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   mipsel-linux-ld: drivers/net/phy/swphy.o: in function `fwnode_fixed_phy_register':
>> swphy.c:(.text+0x1b4): multiple definition of `fwnode_fixed_phy_register'; drivers/net/phy/phylink.o:phylink.c:(.text+0x4994): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
