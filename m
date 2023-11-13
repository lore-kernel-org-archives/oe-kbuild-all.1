Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3007B2D045
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Nov 2023 23:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfSVjs1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699918679; x=1731454679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rRcEzcSwDt/empbJyw0rytxvM5NbNENjLEvUuFjihsc=;
  b=WfSVjs1bYJy9vAcqJ8fMeS7Pxh8+C4Mw8bmyqQApVk2MKMd9q0NhGlK8
   hgIPTCzu0b9Fl/G/5vlXbMMy4vyXE76sF/GYjf53sUbr0Dl0bEXGGlwpn
   tVFjWs01SJZAjewESS9RUuQnIFfiztbWhnpBAWLQzRVdVGNMg3ggOptrX
   CkMcOy+9daYReH45MCMPkqNTaeHZ7vtgPWuLwmsifYbpDBMuFXNe997eo
   ISvFtNg/8wFxcMyLZO5DmYyGASMdB15BAVCyRntD71uL+vjl2zlju8ILC
   evIr5S7TAXjQrtOCSEbIpIYqRKD8f2V8CIfPPvsVXheygmMEN7+XW7bkK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="390333914"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="390333914"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 15:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="12231762"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2023 15:37:51 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2gV2-000Cco-1w;
	Mon, 13 Nov 2023 23:37:48 +0000
Date: Tue, 14 Nov 2023 07:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] watchdog: mediatek: mt7988: add wdt support
Message-ID: <202311140752.aTxIi7GX-lkp@intel.com>
References: <fc1c022551edc9ee2dfaa4c1dcf6b146b5b2aae5.1699890006.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc1c022551edc9ee2dfaa4c1dcf6b146b5b2aae5.1699890006.git.daniel@makrotopia.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on groeck-staging/hwmon-next linus/master v6.7-rc1 next-20231113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/watchdog-mediatek-mt7988-add-wdt-support/20231113-234836
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/fc1c022551edc9ee2dfaa4c1dcf6b146b5b2aae5.1699890006.git.daniel%40makrotopia.org
patch subject: [PATCH v2 2/2] watchdog: mediatek: mt7988: add wdt support
config: csky-randconfig-002-20231114 (https://download.01.org/0day-ci/archive/20231114/202311140752.aTxIi7GX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311140752.aTxIi7GX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311140752.aTxIi7GX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/mtk_wdt.c:131: warning: Function parameter or member 'data' not described in 'toprgu_reset_sw_en_unlocked'
>> drivers/watchdog/mtk_wdt.c:131: warning: Excess function parameter 'mtk_wdt' description in 'toprgu_reset_sw_en_unlocked'


vim +131 drivers/watchdog/mtk_wdt.c

   120	
   121	/**
   122	 * toprgu_reset_sw_en_unlocked() - enable/disable software control for reset bit
   123	 * @mtk_wdt: Pointer to instance of struct mtk_wdt_dev.
   124	 * @id: Bit number identifying the reset to be enabled or disabled.
   125	 * @enable: If true, enable software control for that bit, disable otherwise.
   126	 *
   127	 * Context: The caller must hold lock of struct mtk_wdt_dev.
   128	 */
   129	static void toprgu_reset_sw_en_unlocked(struct mtk_wdt_dev *data,
   130						unsigned long id, bool enable)
 > 131	{
   132		u32 tmp;
   133	
   134		tmp = readl(data->wdt_base + WDT_SWSYSRST_EN);
   135		if (enable)
   136			tmp |= BIT(id);
   137		else
   138			tmp &= ~BIT(id);
   139	
   140		writel(tmp, data->wdt_base + WDT_SWSYSRST_EN);
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
