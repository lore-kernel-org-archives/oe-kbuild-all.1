Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CC77C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 00:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690246597; x=1721782597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c5sJvZsbZZIUoFb6IT+CifXCE9H4rDLG6u44HNSVgdA=;
  b=bb8HxP5C1jC9hW5Zovi0PAc8051VQ5l2KqTaeL5qXCRPdvuJgRSFpjjz
   RpEQtnEGTd8oFTIpn3PoG9+KOuZSPhXptLLVvOjXPr+vcEY/1onD4YNgG
   6dZWh3c11LxTwzYCCCP2SzSrffiHRsAVNgtKrhz1X8epEn+fQLG1bUsQU
   QrcfVulBQNNiJcruVE9fu9FaR16jaJx7VXI1JlJbQTg3LAJgckBuCjn9o
   Gs4e+cO5C4wgm4r1Mu/Eea4L30nJ7q9DfxDxS5CKPaAJlEQVRXsGW7bBw
   RCSKzhCTnUKAY5qhK5ezVEoftaNJ9wO452AvCveo2gHnWKX8/L1e7X+Ni
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367612878"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="367612878"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 17:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="849810993"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="849810993"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Jul 2023 17:56:34 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO6Ln-000A96-2Q;
	Tue, 25 Jul 2023 00:56:32 +0000
Date: Tue, 25 Jul 2023 08:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] net: Explicitly include correct DT includes
Message-ID: <202307250840.v3G8w3bm-lkp@intel.com>
References: <20230724212222.809909-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724212222.809909-1-robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on linus/master v6.5-rc3]
[cannot apply to net-next/main xilinx-xlnx/master next-20230724]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/net-Explicitly-include-correct-DT-includes/20230725-052339
base:   net/main
patch link:    https://lore.kernel.org/r/20230724212222.809909-1-robh%40kernel.org
patch subject: [PATCH v2] net: Explicitly include correct DT includes
config: sh-randconfig-r001-20230724 (https://download.01.org/0day-ci/archive/20230725/202307250840.v3G8w3bm-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250840.v3G8w3bm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250840.v3G8w3bm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/korina.c:1406:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
    1406 |                 .of_match_table = of_match_ptr(korina_match),
         |                                   ^~~~~~~~~~~~
>> drivers/net/ethernet/korina.c:1406:48: error: 'korina_match' undeclared here (not in a function); did you mean 'korina_ioctl'?
    1406 |                 .of_match_table = of_match_ptr(korina_match),
         |                                                ^~~~~~~~~~~~
         |                                                korina_ioctl
   cc1: some warnings being treated as errors


vim +/of_match_ptr +1406 drivers/net/ethernet/korina.c

10b26f0781511d drivers/net/ethernet/korina.c Thomas Bogendoerfer 2021-04-19  1402  
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  1403  static struct platform_driver korina_driver = {
10b26f0781511d drivers/net/ethernet/korina.c Thomas Bogendoerfer 2021-04-19  1404  	.driver = {
10b26f0781511d drivers/net/ethernet/korina.c Thomas Bogendoerfer 2021-04-19  1405  		.name = "korina",
10b26f0781511d drivers/net/ethernet/korina.c Thomas Bogendoerfer 2021-04-19 @1406  		.of_match_table = of_match_ptr(korina_match),
10b26f0781511d drivers/net/ethernet/korina.c Thomas Bogendoerfer 2021-04-19  1407  	},
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  1408  	.probe = korina_probe,
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  1409  	.remove = korina_remove,
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  1410  };
ef11291bcd5f96 drivers/net/korina.c          Florian Fainelli    2008-03-19  1411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
