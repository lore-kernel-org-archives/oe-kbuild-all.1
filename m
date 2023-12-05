Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E879941202
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 23:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIpOkKyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701818704; x=1733354704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BOo943kXiot0+zKGN4PvVd6kTI3itwMLBYdViiwwY0c=;
  b=PIpOkKyH7THUvR8ErrnhSrqrIIWZOo/yGTtVOXNhWsJjurrtk3z+nJpZ
   b5/VRIAtVOTdXAjPqY5XGl8HhtMeNwfqGnj2B1WSlzWqln0u76H79qBzv
   Rg8J8jzpMTNsgen09QyNdQ7uzTwBOQBiCfBxOTpanpx9v6OR5zf0pEoNG
   /i2GH8y8DRwTuFj05Ctq+YDH0bcaRMlWv4GLOqSM0whVhOsnn3CuTIQrv
   ATemFU6c7F4vqlzdenSnXSJmK1yZkP56evbeUPQyNZ6k1MAeKJ2KJfo76
   4YTfytbY/yiC87qi2NQ7vUERsCx312HGPw/Fv6mlWsrVhwS18aFPEtrhV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="480173532"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="480173532"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 15:25:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="861916800"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="861916800"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2023 15:25:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAemg-0009ro-0b;
	Tue, 05 Dec 2023 23:24:58 +0000
Date: Wed, 6 Dec 2023 07:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmo Chou <chou.cosmo@gmail.com>, jdelvare@suse.com,
	linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	corbet@lwn.net, heiko@sntech.de, jernej.skrabec@gmail.com,
	macromorgan@hotmail.com, linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: Re: [PATCH 3/3] hwmon: Add driver for Astera Labs PT516XX retimer
Message-ID: <202312060716.Zh0AHxKs-lkp@intel.com>
References: <20231205074723.3546295-4-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205074723.3546295-4-chou.cosmo@gmail.com>

Hi Cosmo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmo-Chou/dt-bindings-vendor-prefixes-add-asteralabs/20231205-155020
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231205074723.3546295-4-chou.cosmo%40gmail.com
patch subject: [PATCH 3/3] hwmon: Add driver for Astera Labs PT516XX retimer
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060716.Zh0AHxKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060716.Zh0AHxKs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/hwmon/pt516xx.rst:4: WARNING: Title underline too short.

vim +4 Documentation/hwmon/pt516xx.rst

     2	
     3	Kernel driver pt516xx
   > 4	====================
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
