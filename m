Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3BF70963
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 21:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVvSNrp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701899134; x=1733435134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7cAGoQzZIbmDbG+03g94HSkTpHFYYeUTPBnhwuM5LtI=;
  b=nVvSNrp2CMntIu1qAIKfL7qaQQ/HawZ3nXwIBruZm5n4MhvRKP6j8EOD
   VotQoMF3jci79CKGGuOTTrHc4N1cluL19Eb0ztBrk88Uf/CXlw4XARBJd
   J1er12mxNA0aYf5dgujaje5OrscLfrjMK8IO0eKPB5RF5t5abn+TQzP5+
   nTDgk+1gFzJNHzNzgue5IyzBg1Kwk+8vLp4aZHXRjlhd0zRW2whPB1upu
   RCH0HZk/IAcIm74Plav5RRqFeJ6dDekG/HDEDDk64el/D1t0AmX5CxIvo
   oAz83dU8NvV/NQUdp8P46CYbVBO3u+dZ+RYFGimi/Kpjh5SqEdVZS6ivK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7433740"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7433740"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 13:41:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="889485583"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889485583"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 06 Dec 2023 13:41:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAzeL-000BSg-2w;
	Wed, 06 Dec 2023 21:41:45 +0000
Date: Thu, 7 Dec 2023 05:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
Message-ID: <202312070551.cihPHn7H-lkp@intel.com>
References: <20231128084236.157152-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128084236.157152-4-wenst@chromium.org>

Hi Chen-Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on chrome-platform/for-next chrome-platform/for-firmware-next wsa/i2c/for-next linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/i2c-of-Introduce-component-probe-function/20231128-174325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231128084236.157152-4-wenst%40chromium.org
patch subject: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree hardware prober
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20231207/202312070551.cihPHn7H-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070551.cihPHn7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070551.cihPHn7H-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/platform/chrome/chromeos_of_hw_prober.o: in function `chromeos_i2c_component_prober':
   chromeos_of_hw_prober.c:(.text+0x48): undefined reference to `i2c_of_probe_component'
>> csky-linux-ld: chromeos_of_hw_prober.c:(.text+0x68): undefined reference to `i2c_of_probe_component'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
