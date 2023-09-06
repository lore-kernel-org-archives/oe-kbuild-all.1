Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B7411CAF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 21:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694034368; x=1725570368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fYP03Ee38R2+bDdt7md8wZEcEk3EWLNVdezDvMchfzc=;
  b=YuFDn+Xa2c2pzw/ceF6nmW2gphtsmRYKhG0FmaHLPVpNIcjilf1PNXI2
   eZabIj8PpUTAlXPNklBquIu7HW6eFObp6R4BRG71YWqHEyi1+7hchPfG1
   Wf+xRywDDvpb/9kPur5A47zbQVPaI/rwweJQi5WFVSDdtJzp4N8ERB4U2
   tcSVk5fSDKy90mxg3AArTdHAunkuxDedZcO4W6u4dNFwR2jTtnGZ3b3JU
   u/qieBbAJzcIdwt5DfnXGsIzed5gA39hgQVa8gYZmm05X9/VnFDyOWQgh
   PVCQIuIZTAsuY9NoeuCPv1VQSxAOitu0Y2rab37pUdeWEhpHwJybSe2R9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379894711"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="379894711"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 14:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741720426"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="741720426"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Sep 2023 14:06:03 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdzir-0000ah-0u;
	Wed, 06 Sep 2023 21:06:01 +0000
Date: Thu, 7 Sep 2023 05:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
Cc: oe-kbuild-all@lists.linux.dev, Ayush Singh <ayushdevel1325@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, Vaishnav M A <vaishnav@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>
Subject: Re: [PATCH v4 2/3] greybus: Add BeaglePlay Linux Driver
Message-ID: <202309070423.35kLcJgy-lkp@intel.com>
References: <20230902182845.1840620-3-ayushdevel1325@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230902182845.1840620-3-ayushdevel1325@gmail.com>

Hi Ayush,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.5 next-20230906]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ayush-Singh/dt-bindings-Add-beaglecc1352/20230903-022958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230902182845.1840620-3-ayushdevel1325%40gmail.com
patch subject: [PATCH v4 2/3] greybus: Add BeaglePlay Linux Driver
config: microblaze-randconfig-r022-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070423.35kLcJgy-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070423.35kLcJgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070423.35kLcJgy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/greybus/gb-beagleplay.c:490:1: warning: data definition has no type or storage class
     490 | module_serdev_device_driver(gb_beagleplay_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/greybus/gb-beagleplay.c:490:1: error: type defaults to 'int' in declaration of 'module_serdev_device_driver' [-Werror=implicit-int]
>> drivers/greybus/gb-beagleplay.c:490:1: warning: parameter names (without types) in function declaration
>> drivers/greybus/gb-beagleplay.c:481:36: warning: 'gb_beagleplay_driver' defined but not used [-Wunused-variable]
     481 | static struct serdev_device_driver gb_beagleplay_driver = {
         |                                    ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +490 drivers/greybus/gb-beagleplay.c

   480	
 > 481	static struct serdev_device_driver gb_beagleplay_driver = {
   482		.probe = gb_beagleplay_probe,
   483		.remove = gb_beagleplay_remove,
   484		.driver = {
   485		      .name = "gb_beagleplay",
   486		      .of_match_table = of_match_ptr(gb_beagleplay_of_match),
   487		    },
   488	};
   489	
 > 490	module_serdev_device_driver(gb_beagleplay_driver);
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
