Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB54A19BA1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 16:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691600265; x=1723136265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hdfdo4wv37cAHHWEilNe64sBxFeQ5uL3wqNmOs2PXu0=;
  b=H+RJhdxMsC4OwL24M8ST3cgrVU2TFLEb4rkCTeI/mvvdC7I6/wInj5G9
   wbACE4VCRH53Uj/5mO9QRIRPXKc0UfyJbL7k/nRIebXWgSuEdYQFMRTL+
   hz4IXRG32sS9dpCSDCbDAtIYUnWTfc9UmuefRDebUfQs24gS2gGRMHcT+
   NatNobBYMaVEI0YwOGB6fZc4YUrGtIgFwPhPC7mrGWyCEZkvOIUhqeor6
   DS8QQ5lUwqs/GMONQt30xVO55LdS+VE+4WqrSWYH/A5jtmhUKE9gn+IWD
   1s5N9my4fX2xn/M8izu9aMYB6WGKkJxzeXEFmesUAFfx9URKel13+tW2m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370077715"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="370077715"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 09:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="731888827"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="731888827"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Aug 2023 09:57:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTmV9-0006Gu-1W;
	Wed, 09 Aug 2023 16:57:39 +0000
Date: Thu, 10 Aug 2023 00:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/soc/mediatek/mtk-svs.c:1618:34: warning: 'mtk_svs_of_match'
 defined but not used
Message-ID: <202308100022.cNgiDDgE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core62-50-1
head:   aa035fb1ea0a81817398b02a7ca3914558fe23a5
commit: 8cafd5ac5f113cb45e075c67cdf1217569d93a36 FROMLIST: soc: mediatek: SVS: introduce MTK SVS engine
date:   2 years, 3 months ago
config: x86_64-buildonly-randconfig-r003-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100022.cNgiDDgE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100022.cNgiDDgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100022.cNgiDDgE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-svs.c:1618:34: warning: 'mtk_svs_of_match' defined but not used [-Wunused-const-variable=]
    1618 | static const struct of_device_id mtk_svs_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-svs.c:1384:12: warning: 'svs_resume' defined but not used [-Wunused-function]
    1384 | static int svs_resume(struct device *dev)
         |            ^~~~~~~~~~
   drivers/soc/mediatek/mtk-svs.c:1345:12: warning: 'svs_suspend' defined but not used [-Wunused-function]
    1345 | static int svs_suspend(struct device *dev)
         |            ^~~~~~~~~~~


vim +/mtk_svs_of_match +1618 drivers/soc/mediatek/mtk-svs.c

  1617	
> 1618	static const struct of_device_id mtk_svs_of_match[] = {
  1619		{
  1620			.compatible = "mediatek,mt8183-svs",
  1621			.data = &svs_get_svs_mt8183_platform_data,
  1622		}, {
  1623			/* Sentinel */
  1624		},
  1625	};
  1626	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
