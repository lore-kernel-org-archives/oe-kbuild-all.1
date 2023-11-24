Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11B3944D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1SqGPKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700812660; x=1732348660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DKmAQ2qYw1sLOGN0fetMZdbxePUZXL0fXN+bc7UmtX0=;
  b=c1SqGPKDhIZGlGoym2gS28XBg19DqqDRvsLMHol3/0sEhYOh5/R/FEWn
   Eo8DvDXknOcqFpWEYNKKuRuBj3DYl1TECHPr2tzqTcsqhr/na5Of44zEW
   4u+ic1/pmC5sm7EMuSA3sVylSlQqPaXXyhAXAe7CAo0W68pbnNi8lc/HJ
   wTFx0z7D4k++/FSjSIA5tqXRMwhRoqw9kCfPVyWjYQ0BM0UR/3fdCHyws
   g/ukA4xreS+MKLWCCwHohOseKig2EMGivzl6ybdTWAFofWSdkqQHR4OFQ
   JIzWH21st2hWEFmgqMQgsxlyrnW72280tUN5vqtH2e6PWAMUi0AQ1ward
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395199305"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="395199305"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 23:57:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="767393124"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="767393124"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2023 23:57:35 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6R49-0002F4-1m;
	Fri, 24 Nov 2023 07:57:33 +0000
Date: Fri, 24 Nov 2023 15:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: Anshul Dalal <anshulusr@gmail.com>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Anshul Dalal <anshulusr@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 3/3] iio: chemical: add support for Aosong AGS02MA
Message-ID: <202311241129.HrMrED0B-lkp@intel.com>
References: <20231121095800.2180870-3-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121095800.2180870-3-anshulusr@gmail.com>

Hi Anshul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshul-Dalal/dt-bindings-iio-chemical-add-aosong-ags02ma/20231121-180435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20231121095800.2180870-3-anshulusr%40gmail.com
patch subject: [PATCH v3 3/3] iio: chemical: add support for Aosong AGS02MA
config: s390-randconfig-r081-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241129.HrMrED0B-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241129.HrMrED0B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241129.HrMrED0B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/chemical/ags02ma.c:150:34: warning: unused variable 'ags02ma_of_table' [-Wunused-const-variable]
     150 | static const struct of_device_id ags02ma_of_table[] = {
         |                                  ^
   1 warning generated.


vim +/ags02ma_of_table +150 drivers/iio/chemical/ags02ma.c

   149	
 > 150	static const struct of_device_id ags02ma_of_table[] = {
   151		{ .compatible = "aosong,ags02ma"},
   152		{ /* Sentinel */ }
   153	};
   154	MODULE_DEVICE_TABLE(of, ags02ma_of_table);
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
