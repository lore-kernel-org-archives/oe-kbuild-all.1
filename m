Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E842EAFB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 22:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIRTfyNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699308261; x=1730844261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DHdBm2pLkPhJr9UAZMbl35Z/fyBQIhnPChy3iWSGc0M=;
  b=DIRTfyNIFmtAL3Cb9VyB8d4n7o+NDWwD7jFQrxygdGdIYZIeMck8+AQT
   P6Iegqb/pKTOU8JR7dECB4seNfjxzMfoi2JmUn84oeJw+F/37V0coWgZq
   cJFbdBjqbG/nkvIOBDi2NSk0/FvAD3IahQxANWUckV1ub1OfIyW/l50RZ
   gEx4wUTJOT2SSgUp5HFxE+kt3v8CbqpOTZwcj1rR2QblTpBePKqh+cMSf
   +20AT6MJE/jBjvNoitw0PRYGOP6uL5NDK0nBFMQOR62cVMNW3uAZdgagv
   a9jwMSmKCLNvLarHhxu4T30Q8iIccxDKrwTxt/qr8CiBtAk3jkSfvCcdo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="379770933"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="379770933"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 14:04:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="3760794"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2023 14:04:16 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r07he-0006lA-1C;
	Mon, 06 Nov 2023 22:04:14 +0000
Date: Tue, 7 Nov 2023 06:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 PINCTRL_SINGLE when selected by ARCH_DAVINCI
Message-ID: <202311070548.0f6XfBrh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: f962396ce29244d9a64f241481fa73fa370404c3 ARM: davinci: support multiplatform build for ARM v5
date:   4 years, 2 months ago
config: arm-kismet-CONFIG_PINCTRL_SINGLE-CONFIG_ARCH_DAVINCI-0-0 (https://download.01.org/0day-ci/archive/20231107/202311070548.0f6XfBrh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070548.0f6XfBrh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311070548.0f6XfBrh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PINCTRL_SINGLE when selected by ARCH_DAVINCI
   .config:6824:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for PINCTRL_SINGLE
     Depends on [n]: PINCTRL [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - ARCH_DAVINCI [=y] && ARCH_MULTI_V5 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
