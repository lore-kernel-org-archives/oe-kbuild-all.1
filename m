Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37FF61683
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXqa40H6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702387327; x=1733923327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vComJbd8kBDo3YrHK5c9ly3E/Fx3FjjEgUVzcOkwUsk=;
  b=QXqa40H6u0KaZpE3sZBw2swzI/JthBvdpI2Q+88KRoow92+zpsz5iVde
   yG6LLUZnKv3Fugt5UvdB13qaFFIUEgZmvu3+nhgKiLCV6x/NZDhHjJ5tL
   iVSvmBDbcbxXxu+52JGG8ibCuGoMT3txsbgI+ssMxZ4ICl8ersriE3y0q
   97BUjebiXBOil4fT8nfItgFQsYVzqoLtAtLpt64b/uadZVWYS6G1A8USo
   GNT85puOm3QWmbjxhz+lHfS3Ki9qwFS9iYJqYfDk4ZatIKJq5sVQX7nlX
   Y+0r6EkPAAQ4sy0l0s9EpMUCm6DaLyuU7kBYGSvXZy92RNlYrAFj7mBFM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1624029"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1624029"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 05:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104906549"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1104906549"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2023 05:21:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD2hx-000JDA-1m;
	Tue, 12 Dec 2023 13:21:57 +0000
Date: Tue, 12 Dec 2023 21:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, vkoul@kernel.org,
	jic23@kernel.org, olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
	fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
	ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
	will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
	richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>,
	peng.fan@oss.nxp.com, lars@metafoo.de, rcsekar@samsung.com,
	wg@grandegger.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 05/13] firewall: introduce stm32_firewall framework
Message-ID: <202312122156.5wsnpd5l-lkp@intel.com>
References: <20231211183044.808204-6-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211183044.808204-6-gatien.chevallier@foss.st.com>

Hi Gatien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on robh/for-next jic23-iio/togreg broonie-sound/for-next linus/master v6.7-rc5 next-20231212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gatien-Chevallier/dt-bindings-document-generic-access-controllers/20231212-023824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20231211183044.808204-6-gatien.chevallier%40foss.st.com
patch subject: [PATCH v7 05/13] firewall: introduce stm32_firewall framework
config: alpha-kismet-CONFIG_OF_DYNAMIC-CONFIG_STM32_FIREWALL-0-0 (https://download.01.org/0day-ci/archive/20231212/202312122156.5wsnpd5l-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312122156.5wsnpd5l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312122156.5wsnpd5l-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_DYNAMIC when selected by STM32_FIREWALL
   
   WARNING: unmet direct dependencies detected for OF_DYNAMIC
     Depends on [n]: OF [=n]
     Selected by [y]:
     - STM32_FIREWALL [=y] && (ARCH_STM32 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
