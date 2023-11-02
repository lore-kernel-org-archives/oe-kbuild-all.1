Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E202321A15
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 21:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLQtR1uU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698962341; x=1730498341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hPncJ/tczIojvzuxs6+9ig2+6Plzo2BNcq4eDxaFWjw=;
  b=fLQtR1uUhRlI13gT3ZI1qmUZ118Imk1TIJ0R7Mh+iFncILQErQBc7pfg
   u9Snv/InmOPtbUDoT4HF/9IB2XxKAZyJh7wrP2JuvtOO3bj/QNWyf+q0V
   8crZyoAbsMkdd4UUAAWIJq3mKp/b9H4UgH8bQ6HOaHk3S7GAFk+EKfBLH
   Qz1lvZk56MdGf4fTNpSrdoR05+RUDuSyZBublsFMLzSfUh8vB/ddtfyR7
   5rCrhrf6QeYva3mHC6PA60oodN3LajpHKOPfQgwFGa7yllRQkUqJJWHwt
   Ock7ts5uA5GMt07xnbxrUt8oQCFbgSo7o6oJ9BuKK25ANUOW5vwj1r/Fb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="10359424"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="10359424"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 14:59:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="2695126"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2023 14:58:58 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyfiK-0001tr-0d;
	Thu, 02 Nov 2023 21:58:56 +0000
Date: Fri, 3 Nov 2023 05:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 CPU_DCACHE_WRITETHROUGH when selected by ARCH_DAVINCI_DA830
Message-ID: <202311030513.LDYgnPoh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4652b8e4f3ffa48c706ec334f048c217a7d9750d
commit: f962396ce29244d9a64f241481fa73fa370404c3 ARM: davinci: support multiplatform build for ARM v5
date:   4 years, 2 months ago
config: arm-kismet-CONFIG_CPU_DCACHE_WRITETHROUGH-CONFIG_ARCH_DAVINCI_DA830-0-0 (https://download.01.org/0day-ci/archive/20231103/202311030513.LDYgnPoh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311030513.LDYgnPoh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030513.LDYgnPoh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CPU_DCACHE_WRITETHROUGH when selected by ARCH_DAVINCI_DA830
   .config:6902:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for CRYPTO_HMAC
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - IPV6_SEG6_HMAC [=y] && NET [=y] && INET [=y] && IPV6 [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA1
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - IPV6_SEG6_HMAC [=y] && NET [=y] && INET [=y] && IPV6 [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - IPV6_SEG6_HMAC [=y] && NET [=y] && INET [=y] && IPV6 [=y]
   
   WARNING: unmet direct dependencies detected for CPU_DCACHE_WRITETHROUGH
     Depends on [n]: (CPU_ARM740T [=n] || CPU_ARM920T [=n] || CPU_ARM922T [=n] || CPU_ARM925T [=n] || CPU_ARM926T [=n] || CPU_ARM940T [=n] || CPU_ARM946E [=n] || CPU_ARM1020 [=n] || CPU_FA526 [=n]) && !CPU_DCACHE_DISABLE [=n]
     Selected by [y]:
     - ARCH_DAVINCI_DA830 [=y] && ARCH_DAVINCI [=y] && (!ARCH_DAVINCI_DMx [=y] || AUTO_ZRELADDR [=y] && ARM_PATCH_PHYS_VIRT [=y]) && !CPU_DCACHE_DISABLE [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
