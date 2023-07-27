Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A949AA945
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 22:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690497452; x=1722033452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ii6X2W7DCUSMEYSKf8uUT08Bk8jhWrz62OFiv9SArA0=;
  b=GDj4yXC5xnhnJzwfPaih48ut2Sfmhh8syaFkLkaGElr1EeF2LSwfB1Z3
   gu1cvBkNFAgJX1GsQ6aJj9ywNYv9I4AcfH0Frg+S/C85VBw6KFW9NLEDx
   K5N9uwWttvLVZvJflQbwmYjey4Cxcr1cHBONZgdtpoMtYanUGk+9aN9tk
   vKJm2Ufr21PeWVjW208xEjaG50PJEPfgbazg42z+bzjRCFqAC4FmTcpX9
   E4Fk9K0Di+KIUSDu6L+U/HCqgPu+K3hpht6HgGXhFrmWGFgTUVgHqG+5o
   AAlpUPaPaWMdJVePMDPAH8FLhCaOSnNX2etaNoYnH3M8DzzrvLKVExbAv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353360873"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="353360873"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 15:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704310191"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="704310191"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 15:37:28 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP9br-0002fF-1y;
	Thu, 27 Jul 2023 22:37:27 +0000
Date: Fri, 28 Jul 2023 06:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 08/11] iio: adc: sd modulator: add scale and offset
 support
Message-ID: <202307280606.nuOkLxgk-lkp@intel.com>
References: <20230727150324.1157933-9-olivier.moysan@foss.st.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727150324.1157933-9-olivier.moysan@foss.st.com>

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
patch link:    https://lore.kernel.org/r/20230727150324.1157933-9-olivier.moysan%40foss.st.com
patch subject: [RFC v2 08/11] iio: adc: sd modulator: add scale and offset support
config: um-randconfig-r002-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280606.nuOkLxgk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280606.nuOkLxgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307280606.nuOkLxgk-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/iio/adc/sd_adc_modulator.o: in function `iio_sd_mod_probe':
>> sd_adc_modulator.c:(.text+0x378): undefined reference to `iio_backend_alloc'
>> /usr/bin/ld: sd_adc_modulator.c:(.text+0x3da): undefined reference to `iio_backend_register'
>> /usr/bin/ld: sd_adc_modulator.c:(.text+0x4fc): undefined reference to `iio_backend_free'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
