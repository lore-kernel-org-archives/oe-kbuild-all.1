Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092703FF4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 22:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690497449; x=1722033449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D3sVJE5sVruL2VGm4sCc6nQYj4I+T6x3hFggWJk/8Ys=;
  b=TuevjejSSccH4argG/X78Rf3xmdzCIdRfTORVezU1DNNJjD8y3Z9M5UN
   mYwrb5JxyNZWUM1HGunYWi8faSByfMIoqYxXEQqWJiSphXRE/v+lNiw7Q
   pRVKcDfgmAq8/u4pOO9TlOmbjrEycq0X9ZcsoO3z1cPexQJRsseu1H1N6
   csqiamGIsXLTcszOf8p1Br7+Wqb0qsoNyAwm7J0HBLWNqr5/n0M3p49up
   FeEKxKl4pWTMtDsqGpWXcuOBqGH9vdZlexDyCnQcLsD2iQ3K7jJNbYrUf
   jfavSgLEDuAjUKcV4eB2b9l8B2snohdbv2r9hJ84kw1utCVBN4YgAtCVh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353360871"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="353360871"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 15:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704310192"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="704310192"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 15:37:28 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP9br-0002fH-26;
	Thu, 27 Jul 2023 22:37:27 +0000
Date: Fri, 28 Jul 2023 06:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 07/11] iio: adc: stm32-dfsdm: add scaling support to
 dfsdm
Message-ID: <202307280647.YJVidOPD-lkp@intel.com>
References: <20230727150324.1157933-8-olivier.moysan@foss.st.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727150324.1157933-8-olivier.moysan@foss.st.com>

Hi Olivier,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on atorgue-stm32/stm32-next robh/for-next linus/master v6.5-rc3 next-20230727]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Olivier-Moysan/iio-introduce-iio-backend-device/20230727-231112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20230727150324.1157933-8-olivier.moysan%40foss.st.com
patch subject: [RFC v2 07/11] iio: adc: stm32-dfsdm: add scaling support to dfsdm
config: loongarch-randconfig-r003-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280647.YJVidOPD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280647.YJVidOPD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307280647.YJVidOPD-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/iio/adc/stm32-dfsdm-adc.o: in function `stm32_dfsdm_channel_parse_of':
>> stm32-dfsdm-adc.c:(.text+0x1d60): undefined reference to `fwnode_iio_backend_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
