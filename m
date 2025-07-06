Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2E629E10F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 22:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751840098; cv=none; b=TRhQkYPxeQ5pjuHLHBHkFenTbwmCgGab7ApiZgO+QDDUyrq9qvXRwMTJ5Q4luXczy7DxP6JsfoKowiURapXBaWoSGk8KEAfPamW2xbPD1syX34NPtr4MJLm3MiUNdou+Xok2N4CIbateQT/P/vpOSq1s+2eA2iKj/aCuSZV1fTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751840098; c=relaxed/simple;
	bh=hmEXNIJmR0D3RDDCbO8lUZB66YQ9TLzRBzv6R4R6YlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8+WqLWXBH2mpjb4lvUKUvGBaXXIJvSrGj/LBnapb+kO3FwX0jDIdT5yAptp/pqA4QAemf3V9bUdZqXz+UT7fImPX9sEE46lQ1hpjKDQycdAi2eU7je+PihKqedAAEkBOOdbmiiV67xl2tcUmwwguOBoE9eZx7wIo042lKo1uqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cb3+Aa8f; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cb3+Aa8f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751840097; x=1783376097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hmEXNIJmR0D3RDDCbO8lUZB66YQ9TLzRBzv6R4R6YlU=;
  b=cb3+Aa8fdEnHz11/EtNSs9ygKStKac59kFea9ffRRoxIOtDpktBoAZZC
   +THkkGLTaI8AGUsO0yIhyTsgRq/KLJCoANFdyvvK/pv0PVbpy9b9yAERi
   WE7cLJX1KMmBytP89UFK85BVupk/7ee1b9UVuP5Da+JpBP4H1EA7v45/1
   NdcRmBZI/BmMn6rOlEQRXhO42UpvsXReUJdd+knJVC/yNRu76FUIDXhg5
   OVq4e83aY8rZ+Dq3mfecvirRakmbtsLKgCVhFOC6WG3seP8mAZ604HgUu
   lIOAMRE6i9MNv7ZgWxfDwlBfiGsyFpct1/tsdfsR0PD074eupZwzsmhpo
   w==;
X-CSE-ConnectionGUID: CbWhYkoMSwiMZjYBg57GEw==
X-CSE-MsgGUID: yeSda/wpTuifv7CQbI4dPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65123390"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="65123390"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 15:14:52 -0700
X-CSE-ConnectionGUID: lZON38qeQimdCh/Ao2QCUw==
X-CSE-MsgGUID: lapjV7n8RzS9ZyZMsn4OuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="154802322"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Jul 2025 15:14:49 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYXdH-00001A-2k;
	Sun, 06 Jul 2025 22:14:47 +0000
Date: Mon, 7 Jul 2025 06:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/1] watchdog: Don't use "proxy" headers
Message-ID: <202507070407.CE8Utfgk-lkp@intel.com>
References: <20250627073753.589509-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627073753.589509-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/watchdog-Don-t-use-proxy-headers/20250627-153933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250627073753.589509-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 1/1] watchdog: Don't use "proxy" headers
config: i386-randconfig-052-20250706 (https://download.01.org/0day-ci/archive/20250707/202507070407.CE8Utfgk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070407.CE8Utfgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507070407.CE8Utfgk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/watchdog/it87_wdt.c: In function 'superio_enter':
>> drivers/watchdog/it87_wdt.c:121:14: error: implicit declaration of function 'request_muxed_region' [-Werror=implicit-function-declaration]
     121 |         if (!request_muxed_region(REG, 2, WATCHDOG_NAME))
         |              ^~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/it87_wdt.c: In function 'superio_exit':
>> drivers/watchdog/it87_wdt.c:135:9: error: implicit declaration of function 'release_region' [-Werror=implicit-function-declaration]
     135 |         release_region(REG, 2);
         |         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/request_muxed_region +121 drivers/watchdog/it87_wdt.c

e1fee94f346387 Oliver Schuster 2008-03-05  115  
a134b825608df6 Nat Gurumoorthy 2011-05-09  116  static inline int superio_enter(void)
e1fee94f346387 Oliver Schuster 2008-03-05  117  {
a134b825608df6 Nat Gurumoorthy 2011-05-09  118  	/*
a134b825608df6 Nat Gurumoorthy 2011-05-09  119  	 * Try to reserve REG and REG + 1 for exclusive access.
a134b825608df6 Nat Gurumoorthy 2011-05-09  120  	 */
a134b825608df6 Nat Gurumoorthy 2011-05-09 @121  	if (!request_muxed_region(REG, 2, WATCHDOG_NAME))
a134b825608df6 Nat Gurumoorthy 2011-05-09  122  		return -EBUSY;
a134b825608df6 Nat Gurumoorthy 2011-05-09  123  
e1fee94f346387 Oliver Schuster 2008-03-05  124  	outb(0x87, REG);
e1fee94f346387 Oliver Schuster 2008-03-05  125  	outb(0x01, REG);
e1fee94f346387 Oliver Schuster 2008-03-05  126  	outb(0x55, REG);
e1fee94f346387 Oliver Schuster 2008-03-05  127  	outb(0x55, REG);
a134b825608df6 Nat Gurumoorthy 2011-05-09  128  	return 0;
e1fee94f346387 Oliver Schuster 2008-03-05  129  }
e1fee94f346387 Oliver Schuster 2008-03-05  130  
e1fee94f346387 Oliver Schuster 2008-03-05  131  static inline void superio_exit(void)
e1fee94f346387 Oliver Schuster 2008-03-05  132  {
e1fee94f346387 Oliver Schuster 2008-03-05  133  	outb(0x02, REG);
e1fee94f346387 Oliver Schuster 2008-03-05  134  	outb(0x02, VAL);
a134b825608df6 Nat Gurumoorthy 2011-05-09 @135  	release_region(REG, 2);
e1fee94f346387 Oliver Schuster 2008-03-05  136  }
e1fee94f346387 Oliver Schuster 2008-03-05  137  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
