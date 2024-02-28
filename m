Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836C02D607
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709110064; cv=none; b=A9NOza5kg9/vkkZq8qwiZRu7r4mHxlJjTFU1smrIoSmpGYOjK4SM6iJ/mbW4CC48n7/Mn7Xih1/Sd968czUdUgen+W4COKGMF7OfgzinlGOQmTdMbYYPQrJYjL0fkwvS4UIAgB0nOiyEZlJQDyiZNpEOKzc11CEjZwpHsCUhTNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709110064; c=relaxed/simple;
	bh=e8C/HtZ1IHSr3abgvvQYBQmb8cc74rFrskWcsthQq78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qEkxVPt4H1DJkPDLHrWlvQvLzDE+bVBpGd6Ym6o7Cu2WE5THOusbOj9GYKoPGTXoBTDThye1KNufG75koXAWl6lt+7pV6cjVw5K57uIRtbL6AjKGHjtKLpFCBucHt1EaXfmA3NhgNBWy/lTvlcAkpjCzl7rcs6chudfREgrwpYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmKaaI03; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmKaaI03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709110062; x=1740646062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8C/HtZ1IHSr3abgvvQYBQmb8cc74rFrskWcsthQq78=;
  b=PmKaaI03tft1uwBqBYU0abMqgxWhkavIuh/YC0wVr1M+d7CVVWo3QlhE
   EkCFsxZcz3OVaQp5VceBSljGDSaqYhRdwEpNoXxoz3SiKLQMjLnWqa4nn
   K/jKa77+CqK/jkSL2CsnzKdcF9/sLfgF8epaYlsDJkHQCoZpg3gxWXWkN
   UcY8xhMZoFu9sfg2cGYGbrBHC4S9ZYwa2R4T4fszuu0/Bh55xEyb83U2Y
   TFZYMUh/gLuSATIssiXMWDJTHMkEKuO7zoiDPvTOIe8uWbPpAUXlt3rx7
   jBHl6b38UK5nG1uBstanl/3BnZ11eXBuFy+J86UpUcKEI/CfmOe/AwyGb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3659886"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3659886"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 00:47:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7296398"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Feb 2024 00:47:41 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfFbG-000Bw0-1p;
	Wed, 28 Feb 2024 08:47:38 +0000
Date: Wed, 28 Feb 2024 16:47:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/in_nmi_bool 8/8] include/linux/preempt.h:144:79: error:
 expected ';' before '}' token
Message-ID: <202402281636.8gB3QQeJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/in_nmi_bool
head:   d0492e5e30b653d0c203cfabae6c31cea4583c40
commit: d0492e5e30b653d0c203cfabae6c31cea4583c40 [8/8] preempt: Convert in_task() to boolean-returning function
config: arm-gemini_defconfig (https://download.01.org/0day-ci/archive/20240228/202402281636.8gB3QQeJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240228/202402281636.8gB3QQeJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402281636.8gB3QQeJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:15,
                    from arch/arm/kernel/asm-offsets.c:11:
   include/linux/preempt.h: In function 'in_task':
>> include/linux/preempt.h:144:79: error: expected ';' before '}' token
     144 |         return !(preempt_count() & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET))
         |                                                                               ^
         |                                                                               ;
     145 | #endif
     146 | }
         | ~                                                                              
   make[3]: *** [scripts/Makefile.build:116: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1199: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +144 include/linux/preempt.h

   138	
   139	static __always_inline bool in_task(void)
   140	{
   141	#ifdef CONFIG_PREEMPT_RT
   142		return !((preempt_count() & (NMI_MASK | HARDIRQ_MASK)) || in_serving_softirq());
   143	#else
 > 144		return !(preempt_count() & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET))
   145	#endif
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
