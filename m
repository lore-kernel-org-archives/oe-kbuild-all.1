Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857AF3B2B5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTFlnY6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701439999; x=1732975999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=smGTfk+fEmzkfLEOWPz94kj9lAqTySLCchhtvSSKhhw=;
  b=cTFlnY6ICNu02vMy3lP+ExOBzfEsm+jTg07cAPYj9gAryI5hK/MxZ2bM
   YxANk6w8kycWfALlHcCVHo8LV6iBF+v1CIdDvA+G8UnUJ7F6hnjUyD48A
   lt+kPdeof1favt47NPibcywCOuDo72QCyxEoqfbUSfkVIfHRk4HHn3tQg
   41hjdl9hIKIr2cetjxpb9ktlQvGGCV6F3jIFV56LPxybZqSqYubHqGg/A
   zkcdFZPc7hB4Xq5Mhl7trZJkDnsbY5I9a3uHEV6OqUWXMcHhHBkcUduz9
   04a9qqHQSoCiVE2wMOmMmAil4uoufIFEATwSxSSvCbylSV+oU0DEwNvRX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="508782"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="508782"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 06:13:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="1017046021"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="1017046021"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2023 06:13:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r94GY-0003n6-01;
	Fri, 01 Dec 2023 14:13:14 +0000
Date: Fri, 1 Dec 2023 22:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: drivers/watchdog/ath79_wdt.c:161:37: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202312012220.3eFrkDts-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: e5fc436f06eef54ef512ea55a9db8eb9f2e76959 sparse: use static inline for __chk_{user,io}_ptr()
date:   3 years, 3 months ago
config: arm-randconfig-r123-20231107 (https://download.01.org/0day-ci/archive/20231201/202312012220.3eFrkDts-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312012220.3eFrkDts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312012220.3eFrkDts-lkp@intel.com/

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
