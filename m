Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B926FCDC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 21:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQ9AkMSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701813417; x=1733349417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P686fvsMqjcZ08N/dNNsQ9HlTRKppMPrmcB94hY4uCs=;
  b=OQ9AkMSjTZu1FF1f9WPKS59YXTI/eY/gG7iq8ocY0p8kKWzggGhJvR+R
   goZwbwYHUYkUnirQrcNT8XQSQtDLft9jh0UVV9X1DvPAz+svcGI5HscEm
   1K4dOOsyqjG0Hf839cylFZg+XjvWbS8wOa9cTCv96hlHDPeSB7URKG6lY
   q7wJq7uRdE5BV0Jtru8moNjemhXGDnmXgHWcx+ezdT6900C7XBosfcC/G
   Eyx2ZHWqeOOw5bLdZUmKaEeSaZ/hmux0YlJe5ULejOAXnsgZ2blHcALrJ
   v/ZqxPkOCPylmN2bDBiJNMLgIBegME13Zg56OjK55nlSf7SXvgiwK8gLe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393697567"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="393697567"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 13:56:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889087070"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="889087070"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 13:56:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAdPP-0009mM-2t;
	Tue, 05 Dec 2023 21:56:51 +0000
Date: Wed, 6 Dec 2023 05:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: drivers/watchdog/ath79_wdt.c:161:37: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202312060528.63wKEM3f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 25fd529c34d063d1bef23742f2e8f8341c639dc3 sparse: group the defines by functionality
date:   3 years, 4 months ago
config: arm-randconfig-r123-20231107 (https://download.01.org/0day-ci/archive/20231206/202312060528.63wKEM3f-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060528.63wKEM3f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060528.63wKEM3f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/watchdog/ath79_wdt.c:161:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got char const * @@
   drivers/watchdog/ath79_wdt.c:161:37: sparse:     expected void const volatile [noderef] __user *ptr
   drivers/watchdog/ath79_wdt.c:161:37: sparse:     got char const *
   drivers/watchdog/ath79_wdt.c:235:27: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *write )( ... ) @@     got int ( * )( ... ) @@
   drivers/watchdog/ath79_wdt.c:235:27: sparse:     expected int ( *write )( ... )
   drivers/watchdog/ath79_wdt.c:235:27: sparse:     got int ( * )( ... )

vim +161 drivers/watchdog/ath79_wdt.c

f8394f61c66f48 Gabor Juhos 2011-01-04  148  
f8394f61c66f48 Gabor Juhos 2011-01-04  149  static ssize_t ath79_wdt_write(struct file *file, const char *data,
f8394f61c66f48 Gabor Juhos 2011-01-04  150  				size_t len, loff_t *ppos)
f8394f61c66f48 Gabor Juhos 2011-01-04  151  {
f8394f61c66f48 Gabor Juhos 2011-01-04  152  	if (len) {
f8394f61c66f48 Gabor Juhos 2011-01-04  153  		if (!nowayout) {
f8394f61c66f48 Gabor Juhos 2011-01-04  154  			size_t i;
f8394f61c66f48 Gabor Juhos 2011-01-04  155  
f8394f61c66f48 Gabor Juhos 2011-01-04  156  			clear_bit(WDT_FLAGS_EXPECT_CLOSE, &wdt_flags);
f8394f61c66f48 Gabor Juhos 2011-01-04  157  
f8394f61c66f48 Gabor Juhos 2011-01-04  158  			for (i = 0; i != len; i++) {
f8394f61c66f48 Gabor Juhos 2011-01-04  159  				char c;
f8394f61c66f48 Gabor Juhos 2011-01-04  160  
f8394f61c66f48 Gabor Juhos 2011-01-04 @161  				if (get_user(c, data + i))
f8394f61c66f48 Gabor Juhos 2011-01-04  162  					return -EFAULT;
f8394f61c66f48 Gabor Juhos 2011-01-04  163  
f8394f61c66f48 Gabor Juhos 2011-01-04  164  				if (c == 'V')
f8394f61c66f48 Gabor Juhos 2011-01-04  165  					set_bit(WDT_FLAGS_EXPECT_CLOSE,
f8394f61c66f48 Gabor Juhos 2011-01-04  166  						&wdt_flags);
f8394f61c66f48 Gabor Juhos 2011-01-04  167  			}
f8394f61c66f48 Gabor Juhos 2011-01-04  168  		}
f8394f61c66f48 Gabor Juhos 2011-01-04  169  
f8394f61c66f48 Gabor Juhos 2011-01-04  170  		ath79_wdt_keepalive();
f8394f61c66f48 Gabor Juhos 2011-01-04  171  	}
f8394f61c66f48 Gabor Juhos 2011-01-04  172  
f8394f61c66f48 Gabor Juhos 2011-01-04  173  	return len;
f8394f61c66f48 Gabor Juhos 2011-01-04  174  }
f8394f61c66f48 Gabor Juhos 2011-01-04  175  

:::::: The code at line 161 was first introduced by commit
:::::: f8394f61c66f48b1fe9d6964ddce492d7f9a4cd9 watchdog: add driver for the Atheros AR71XX/AR724X/AR913X SoCs

:::::: TO: Gabor Juhos <juhosg@openwrt.org>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
