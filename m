Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1379635894
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 21:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709501467; cv=none; b=psq1M9zLQd5XTq5ELr4bMKlS01ib9pdzdVXoLioq7V6vZ7GJlKqDCDALBTeNbcxLygA4QRHYLH74BTuts7FOT246tI87QzfrNSpamK3yqeamGGeCsvBJn9IxmApmPM+ZmRHeTbsrz3PlO0s+OOXHfnVyr0pkjzPMv7KkV/rGX5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709501467; c=relaxed/simple;
	bh=hKKMa0DBRQLKtuBJrU8/70WE+pQBsA0WrRQZZgbbLhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GadiCjK0cAI56RnTo/1pbCQhyi7ozheb+9+AQYjkpNM9zlYVtR5K0qsZ28yJL8eIw7hckGPgBs2ditCmg3xKJwMBILsD9B4nqJMU96DnAVZN/nieedJSn0mjo4rtg6Ilw5va91dyKLGY1M5oNIT47SZR8OwWH9wkZ0Eu2weuHlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbwaN/Cl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbwaN/Cl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709501465; x=1741037465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hKKMa0DBRQLKtuBJrU8/70WE+pQBsA0WrRQZZgbbLhc=;
  b=PbwaN/Cla8Zwgeef/39JSMzOoLq1hoop0XAtso3ORQFi3REixgytAl3Z
   FqEzk2ynzPZgArbDib5YAzU8+9TGUbMRWcY1QJFa6ERDCURHiIlNKcsDo
   PWR07I8i5ozn7mBO0TLhPMt6FRnR95KVWdhm8DZSKt4EkB/wQOKdFKySi
   Ci2Yesejb5jg+DzXyslMR9m8XJfCzObLe9A7E9Iln64RMbPSnwFVa4O7s
   ub6zh5kAMx6RnGluc/KVhjCitumU3qwXwonFDFwrm0nKaKbFucTWSvMnr
   tbgMTcdivY1ooH5HxTc5SMcjLDIfsY1DPTlFo6+bi428uWItpwfEiKj+J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3837939"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="3837939"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 13:31:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13461714"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Mar 2024 13:31:03 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgtQC-00027o-2j;
	Sun, 03 Mar 2024 21:31:00 +0000
Date: Mon, 4 Mar 2024 05:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Wagner <wagi@monom.org>
Subject: [cip:linux-4.19.y-cip-rt 1969/30000] net/core/skbuff.c:335:30:
 warning: 'napi_alloc_cache_lock' defined but not used
Message-ID: <202403040520.JdZN3naF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   dcbd51e7744fcf9baa3ea87a028b574fda95d428
commit: 68dbe5174b05c433fa3da973e7580f5432ef4b5a [1969/30000] net/core: protect users of napi_alloc_cache against reentrance
config: arm-randconfig-002-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040520.JdZN3naF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040520.JdZN3naF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040520.JdZN3naF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/skbuff.c:66:
>> net/core/skbuff.c:335:30: warning: 'napi_alloc_cache_lock' defined but not used [-Wunused-const-variable=]
     335 | static DEFINE_LOCAL_IRQ_LOCK(napi_alloc_cache_lock);
         |                              ^~~~~~~~~~~~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~
   net/core/skbuff.c:334:30: warning: 'netdev_alloc_lock' defined but not used [-Wunused-const-variable=]
     334 | static DEFINE_LOCAL_IRQ_LOCK(netdev_alloc_lock);
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~
   net/core/skbuff.c:5034: warning: Function parameter or member 'skb' not described in 'skb_gso_size_check'


vim +/napi_alloc_cache_lock +335 net/core/skbuff.c

   331	
   332	static DEFINE_PER_CPU(struct page_frag_cache, netdev_alloc_cache);
   333	static DEFINE_PER_CPU(struct napi_alloc_cache, napi_alloc_cache);
   334	static DEFINE_LOCAL_IRQ_LOCK(netdev_alloc_lock);
 > 335	static DEFINE_LOCAL_IRQ_LOCK(napi_alloc_cache_lock);
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
