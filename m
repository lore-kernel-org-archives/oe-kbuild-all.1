Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0944201027
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 16:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687470; cv=none; b=KIw9DaAHOdTcJ6e63Xu3GWPWv7YTU+vIhZgHcCxKpGRLt9iATiXurkH8zFsXNMu+mv76G1R+FUNYmORh0pUr8PMSIhX3FKHYclxhxkspYuETASn5OdSUgmdSZJF9szFE11pvgSIN3NB8Q3lKM9DYXu86fjHA18mDqnvOxeZsrKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687470; c=relaxed/simple;
	bh=4HdCFW9e/RZA+fVtJxXuH7DDeBTmXtt+nkWYvm15PIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r4+MRcwA9uQUL21ZwZSsd/6rPBlsK03Ui06KAqg8NpHGALNk/mfilLAK5ehIQZJan7+X4N7HYcj/zSdzQK7TjkNmCtee3+pjBe+pA59ge/DIFJ3pfBagweBSzaL5fzSJVWfZD6FNUYqvlnPek8Pgmj70E1ScvQ9dOuiDJBz3x60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNPEBU+z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNPEBU+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738687469; x=1770223469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4HdCFW9e/RZA+fVtJxXuH7DDeBTmXtt+nkWYvm15PIk=;
  b=QNPEBU+zWusQMi6GLETfoW6I++zkCBNA4RTwjiNZmRvOS0mMoo4ZYsFd
   v57JdCKfyIPScpJ2ZAdsX0vdygQF9W3ZuwIuzOhLLbuVHYYIou45bQmvr
   h9HPMf9UscYoB6zJZXK+Sg4CmBQ3dZVAh2Zk/bseVIyhSDHoRm7+MnRm5
   +dQWHGZUy1/fvWjAqtftqYYQCq5DohocrAGX7JOAqV2YEMb6OPSABotbg
   Umi3Rn61dbNlvphXeTMYt+rgVAyoTTx/TKG/Htrcu+E/Dz4hydeArhNir
   HKEmKxh//rsel6yZmAtBJqtvuyoL8Onqhylhw6TPaRajJ4VuRmUrOgt8e
   w==;
X-CSE-ConnectionGUID: Td+0OoLAQs6KLS1CPcHmFg==
X-CSE-MsgGUID: TfReMiYDSLGk4RGl4i58hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39254465"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="39254465"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 08:44:28 -0800
X-CSE-ConnectionGUID: CimFtG1hQa2DPTpIqni2hA==
X-CSE-MsgGUID: Z2p9hKTgT5iGBZNnq9/aDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110469459"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Feb 2025 08:44:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfM2B-000shv-2S;
	Tue, 04 Feb 2025 16:44:23 +0000
Date: Wed, 5 Feb 2025 00:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Harini Katakam <harini.katakam@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	Suraj Gupta <suraj.gupta2@amd.com>
Subject: [xilinx-xlnx:lkp_test 292/504] include/uapi/linux/bits.h:9:19:
 warning: right shift count is negative
Message-ID: <202502050001.x0zN00yY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   4bb3217d050fc4871623ae6035fa7b73d33d90ad
commit: 7d9d8b99480cf77ab11493c3787f3ccd959621be [292/504] ptp: Add Xilinx PTP timer driver with EXTTS support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250205/202502050001.x0zN00yY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050001.x0zN00yY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050001.x0zN00yY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:7,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/ptp/ptp_xilinx.c:8:
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_tod_read':
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:62:41: note: in expansion of macro 'GENMASK'
      62 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:113:51: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     113 |         ts->tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:6:
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_ptp_adjtime':
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/ptp/ptp_xilinx.c:64:41: note: in expansion of macro 'BIT'
      64 | #define XPTPTIMER_TOD_OFFSET_NEG        BIT(47)
         |                                         ^~~
   drivers/ptp/ptp_xilinx.c:254:24: note: in expansion of macro 'XPTPTIMER_TOD_OFFSET_NEG'
     254 |                 sign = XPTPTIMER_TOD_OFFSET_NEG;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_ptp_timer_isr':
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:62:41: note: in expansion of macro 'GENMASK'
      62 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:377:60: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     377 |                         sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_ptp_timer_probe':
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:62:41: note: in expansion of macro 'GENMASK'
      62 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:481:50: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     481 |         ts.tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:62:41: note: in expansion of macro 'GENMASK'
      62 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:487:51: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     487 |         tsp.tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~


vim +9 include/uapi/linux/bits.h

3c7a8e190bc580 Paolo Bonzini 2023-12-12   6  
3c7a8e190bc580 Paolo Bonzini 2023-12-12   7  #define __GENMASK(h, l) \
3c7a8e190bc580 Paolo Bonzini 2023-12-12   8          (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
3c7a8e190bc580 Paolo Bonzini 2023-12-12  @9           (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
3c7a8e190bc580 Paolo Bonzini 2023-12-12  10  

:::::: The code at line 9 was first introduced by commit
:::::: 3c7a8e190bc580813ddd9259f62971c8d2a6b5ad uapi: introduce uapi-friendly macros for GENMASK

:::::: TO: Paolo Bonzini <pbonzini@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
