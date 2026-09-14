Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B84437187F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408094; cv=none; b=RR+DyBVL6aRlvGJ9eq4ezYbAGGsED9kjPg2ten6VLnsOOZ6CKcHZlUsBE8HCvDtqUMKbbXNtZrs6PuTWqWnqclL6pB+pugNiPyBb7D592sTk3IoTQabJnPo0DS7wnoch7w9mtrM7tgm3/1/hUvbKw0gHNUb1U9PhKlifl7H36XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408094; c=relaxed/simple;
	bh=+czmN/O4wJrToCnRtpbx+ur9lDkisPgjqTTWjqrjt/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q7QMFNKRgtRLvkAkd4mj4WNFNSuvDAEfS1JQKgTrV9M861foWXyNp/xFfN8R79Kdk1BXgF371ZmRblQ1Fk3cjtOsLbW38N2+0ONE2YGl1waNYbDVKwZRGxyxFdqpfhmhNmsEUGsVRy6Db+P26TS/RSOXvav/ubeUizELuJZpN4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FC2NVQgQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FC2NVQgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789408094; x=1820944094;
  h=date:from:to:cc:subject:message-id;
  bh=+czmN/O4wJrToCnRtpbx+ur9lDkisPgjqTTWjqrjt/Y=;
  b=FC2NVQgQmwnqQUIl/N4nMQpNW27djPakNgK4QAnyE4hkfH409CJ6LoAP
   72OtmaN/GQRIWaUPpEexKG5eBB82Uz8mk+BVxc4u3alN1/i0XaT75oYaL
   9YsdX3C9Fn5KjSmFzBOjlEEmfvBRpKsKEqUXwBPD2/LmhQKoDqrUCSlJp
   fEunHpC7eY0MczMkOBiGsNOlSc9MGBbOop4jBmsmbj0oRFaqRWCFUMuD4
   G2Hyq+uLvi4Eil/Kao+Wz1hownoanSsHoYJltgF5QncbCK8BO63pu0TPl
   tkQwcB3mK9NEqcEYJWG0juS16oCmWsTtyJdlfgTM6LUb9Oqy40OWxE5PW
   A==;
X-CSE-ConnectionGUID: FuSNDOTITAeH1f0iQ2VPPQ==
X-CSE-MsgGUID: LomD0deoTTKQp5ftOudqvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100359977"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100359977"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 10:48:13 -0700
X-CSE-ConnectionGUID: xyODwMZzTpqbUABfqNpQmA==
X-CSE-MsgGUID: xR6bhZAzRxOg+tZd8GU/eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268420020"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 14 Sep 2026 10:48:12 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Amn-000000000F5-3GcE;
	Mon, 14 Sep 2026 17:48:09 +0000
Date: Mon, 14 Sep 2026 19:47:26 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irqflags 2/22]
 include/uapi/../../rust/helpers/interrupt_rc.h:16:undefined reference to
 `local_interrupt_disable_state'
Message-ID: <202609141903.64ODgiaA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   60735555f9a14d6c3e0a576e9ea7bcdb883ce747
commit: c056c0ad20a894eb3c65f5c61d03cb00441243d5 [2/22] irq: Move local_irq_enable/disable() into Rust
config: i386-randconfig-141-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141903.64ODgiaA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141903.64ODgiaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141903.64ODgiaA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/irq/refcount_interrupt_test.o: in function `__local_interrupt_save_state':
>> include/uapi/../../rust/helpers/interrupt_rc.h:16:(.text+0x3f): undefined reference to `local_interrupt_disable_state'
   ld: kernel/irq/refcount_interrupt_test.o: in function `__local_interrupt_enable':
   include/uapi/../../rust/helpers/interrupt_rc.h:23:(.text+0x13c): undefined reference to `local_interrupt_disable_state'


vim +16 include/uapi/../../rust/helpers/interrupt_rc.h

    13	
    14	static __always_inline void __local_interrupt_save_state(unsigned long flags)
    15	{
  > 16		raw_cpu_write(local_interrupt_disable_state, flags);
    17	}
    18	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
