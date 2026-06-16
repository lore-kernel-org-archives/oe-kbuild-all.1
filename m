Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E9E314A98
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 06:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592949; cv=none; b=XiVkAHA5W+vJNUJFCvZIbzu85eIzyluenJWVuxAk6ptIyQbFQT/2PSrExosmEstaLtcSiNRmDS3q0Lmr7+9bSdKtXMYEVvr1vgjEZJJB7lk20AsKeaUTNUXhaEHm1FgcJRRgSjWJ2KGaVQ8Fqj95QSfJoRSWnpAeWYpUwAmLgGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592949; c=relaxed/simple;
	bh=nxudG/uypIUYSYYwBu5hf1G7wtpHgk3vK4HD50Y3Xd4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vbzp+EXDfkHScH0En394oYlyUV0EnxFCnCAVbKTLFyJ09rZxZbcFclO1lUKIoZubjDgZAm0parYbgcAHujEXNPf7xXnBckv0iCq/qMqlal6PM7Fe3UcP7t8R+jR7ved7DT9Y2gvhonBvxMNYUl7AqiEZVsq8kglOYlp338jWA40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpONIaV7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpONIaV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781592947; x=1813128947;
  h=date:from:to:cc:subject:message-id;
  bh=nxudG/uypIUYSYYwBu5hf1G7wtpHgk3vK4HD50Y3Xd4=;
  b=DpONIaV7yOrKLQfre6x9f4rVrtiXik6DrQd20xony1cOg4CreFajWiUk
   ItyFP+fILxzS/rElA5konTS/omIBM7RaDrrA7gsrNGOpRuwNLmpIXrWdI
   yD/Nfr66GogDdnlTpovGKOIviYTJ0GnYDxktz234vKKFvw5nBSWl3qYkp
   dkqCSQnmxD1f03Mjxil3W46+8HhzhRjBLoxe8DIXoFWfTKMGHW1YbrO5J
   6e+QzffiPjbexuK8yAWFgBAIjd9t1bNnr4BIrI7w3h0Z31/F2Nf83gB5w
   pv0CfXhDypUgejX5Py1FZRqvy63yLkT9umQyrwdx0wggH7C4wti6q6ijg
   g==;
X-CSE-ConnectionGUID: qCkQXhhzQumBhDN5T3/Yyw==
X-CSE-MsgGUID: F1bgpRgoTgaptnQoxW1NPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93020809"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="93020809"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 23:55:47 -0700
X-CSE-ConnectionGUID: Ep3RQ9bXS4GMSkXuTUpz8Q==
X-CSE-MsgGUID: LzaexE5HREyriuQIH6HYrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="285800126"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jun 2026 23:55:45 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZNi1-00000000Sp0-2RNY;
	Tue, 16 Jun 2026 06:55:41 +0000
Date: Tue, 16 Jun 2026 14:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: Harini Katakam <harini.katakam@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>,
 Michal Simek <monstr@monstr.eu>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 18197/27391]
 include/vdso/bits.h:7:40: warning: left shift count >= width of type
Message-ID: <202606161407.GJ2rpiVl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Harini,

FYI, the error/warning still remains.

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: 1bf02f0625dc1372031ca84b0c2768c0d8f80314 [18197/27391] ptp: Add Xilinx PTP timer driver
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260616/202606161407.GJ2rpiVl-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161407.GJ2rpiVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161407.GJ2rpiVl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/ptp/ptp_xilinx.c:8:
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_tod_read':
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:53:41: note: in expansion of macro 'GENMASK'
      53 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:107:51: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     107 |         ts->tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:6:
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_ptp_adjtime':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/ptp/ptp_xilinx.c:55:41: note: in expansion of macro 'BIT'
      55 | #define XPTPTIMER_TOD_OFFSET_NEG        BIT(47)
         |                                         ^~~
   drivers/ptp/ptp_xilinx.c:216:24: note: in expansion of macro 'XPTPTIMER_TOD_OFFSET_NEG'
     216 |                 sign = XPTPTIMER_TOD_OFFSET_NEG;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_ptp_timer_probe':
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:53:41: note: in expansion of macro 'GENMASK'
      53 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:347:50: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     347 |         ts.tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:53:41: note: in expansion of macro 'GENMASK'
      53 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:353:51: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     353 |         tsp.tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~


vim +7 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20 @7  #define BIT(nr)			(UL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  8  

:::::: The code at line 7 was first introduced by commit
:::::: 3945ff37d2f48d39fd1751d282c80176654049e4 linux/bits.h: Extract common header for vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
