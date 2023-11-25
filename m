Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16352D051
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 17:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdnP9The"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700934984; x=1732470984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dn8XipVgAaps4TxtDYrHvcsS9CDJrbxtaaZojaMQVSQ=;
  b=OdnP9ThefBh1oMSTao6O5B35Qle/2iPV2/LSfCAkIuGCcoXCMsadVxCv
   qQ9ngCDI4INE494qJTP0kxAgBkjDsXBDcGwlXY+kf9ecYd0ANiiqDiC0B
   IMSnxj+xyPDp0bfewiYn2XD8qR8UJKQTT5bfYNSqt0uwRkM9OX+wIhG4A
   QeeugbXPlwZuTYFT04NGTa9tEQPd6KAmgue9GU98R7JeGC39fwP0qraVc
   QL4eC7EOnbLPYE08HbT54r/Hab9ERwprmNvnbX2RcssrayGTvXpM42vFH
   rkNxyrva4PA5qHBVoy04yu2FljddkPM5ecrv2e/LgA636MJ1FkA61gz8h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="377572078"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="377572078"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 09:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="858627603"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="858627603"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2023 09:56:22 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6wtA-0004G2-1d;
	Sat, 25 Nov 2023 17:56:20 +0000
Date: Sun, 26 Nov 2023 01:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ASoC: imx-rpmsg: SND_SOC_IMX_RPMSG should depend on OF
 and I2C
Message-ID: <202311260157.jWA5CE1P-lkp@intel.com>
References: <20231125065300.6385-1-chancel.liu@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125065300.6385-1-chancel.liu@nxp.com>

Hi Chancel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chancel-Liu/ASoC-imx-rpmsg-SND_SOC_IMX_RPMSG-should-depend-on-OF-and-I2C/20231125-151826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231125065300.6385-1-chancel.liu%40nxp.com
patch subject: [PATCH] ASoC: imx-rpmsg: SND_SOC_IMX_RPMSG should depend on OF and I2C
config: alpha-kismet-CONFIG_SND_SOC_IMX_RPMSG-CONFIG_SND_SOC_FSL_RPMSG-0-0 (https://download.01.org/0day-ci/archive/20231126/202311260157.jWA5CE1P-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311260157.jWA5CE1P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260157.jWA5CE1P-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_IMX_RPMSG when selected by SND_SOC_FSL_RPMSG
   
   WARNING: unmet direct dependencies detected for SND_SOC_IMX_RPMSG
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_IMX_SOC [=y] && RPMSG [=y] && OF [=n] && I2C [=y]
     Selected by [y]:
     - SND_SOC_FSL_RPMSG [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && COMMON_CLK [=y] && RPMSG [=y] && (SND_IMX_SOC [=y] || SND_IMX_SOC [=y]=n) && SND_IMX_SOC [=y]!=n

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
