Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870465;
	b=1uCbA9Rm8+v00kyI2aZf3uVfSCTQ0er8G4hfE1+gW5tnp8Kpe+z+73lTEoyFsFzIgHKn
	 UIwCk4T/r0t2vqBj2D3/3QAPQdVSk/mzHnSOt7B2ZuuADwdyG3MUwDK6TCHCMrXenOSAX
	 hnQDBzMQGUiOghc9WvPoAHBCBgETa27XxndIgKa1drkL3uXrhk5Y4/DuGnrmoxwUFSMql
	 knAcXNHXVQfoTdtBp6VO38zOI/2j6P5oNlzMqz0zLpjzTOVLlB4BGB2xt1z6Ta7MzkiIu
	 7j72r12S+DaurRreEEL6Hd6hMf9U1us+CyqUplBHpmZUK4pLB0ZxnGlk+IbEhEUAIYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870465;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HVIv5Rcz945/g2+GW8R38DF1IIN6/nkT+hD0S0DQC8E=;
	b=xKhAtk9A2H9WQPXrpc6rmxDfSSeo9SZ17tdON9rwCsTQx84zFV8wnTEoBMPVRvivPHsN
	 pie1bgHzD3vG1tbcfcC2e8B93ug8mBdsuVot1XuNd6Rj4tNophKV2OYJ4eLFv/5wKPk4T
	 wl8KbTDYWOarra9As4jYQ0xiJyxgBHnCQQ/meEfUR+EBDecmYuq92MeFtRhOadT1iAa2c
	 rbAr7g04buXG9jn1c8GT4nJga/2UBmXwHiTUyPQbviNqWnNW7WtvK5ySFq6QRoqKIFylK
	 X1Z0q8g5KDbr0MUHQ0WkoXQ4YDC8ELvx9fZKSeVv7f9oveXWxqMfwPCTtz/TAUnHpnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c5COQJlM;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2D2606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 09:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2D2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c5COQJlM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793870465; x=1825406465;
  h=date:from:to:cc:subject:message-id;
  bh=8cmK4m70C4830X+zqN2DCqehng30y5HhOuepBVgRxOY=;
  b=c5COQJlMvYUwvzXeA2G9Metb+QN/5HziKU94NOv7yQ+27WghaAaw2O5E
   ML31fTcCBBdMQNp7l0xX2QVSzRX/4dSo3BQs3A39u7lDijgGkV7xyWXl9
   pImrA8d38EClyYCSt16kI6J83lwT7ovdadRnG9Ayv1NyBhISRFwpmIhir
   YE5u+UjXzwqcKNBraXFlxwwgnnG4VaS9Y/o3pTzUyHbIwIu0/aLrJAwij
   okzTeHhwAbDBHSeCZAQ21rf9t5H+zLJ0LT3ufuZXUlem1S/JGAvQxk/eS
   Fw9FSmPfcE5BBRq+ParCeqSByl+tRPtD0mwmSAK8Z36HnNFjGFeaqoo+C
   Q==;
X-CSE-ConnectionGUID: VBfl6SzFQHqJXu8UrnR/Ew==
X-CSE-MsgGUID: q6SKbUU2RHu4aVEkEA38wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2535065"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2535065"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:21:05 -0800
X-CSE-ConnectionGUID: Y5CgblzQQEWKJ6bWX0dh7Q==
X-CSE-MsgGUID: edick5nuR5OcgkKdaVvIhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6973802"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2026 01:21:03 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOteX-000000009bj-181n;
	Thu, 05 Nov 2026 09:21:01 +0000
Date: Thu, 05 Nov 2026 10:20:36 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6/6]
 drivers/android/android_debug_symbols.c:56:9: sparse: sparse: cast removes
 address space '__percpu' of expression
Message-ID: <202611051016.i2cD7x1E-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   2e8ed1192bdfba1592fdf7720e748e175448d8b0
commit: dfabd2e38be31725210d182c5648b8c24157cef8 [6/6] ANDROID: android: Create debug_symbols driver
config: arm64-randconfig-r2309-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051016.i2cD7x1E-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7303edbc6496e00558bf44850d63a99fc376c92)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051016.i2cD7x1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051016.i2cD7x1E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/android_debug_symbols.c:56:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +56 drivers/android/android_debug_symbols.c

    50	
    51	/*
    52	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    53	 */
    54	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    55	#ifdef CONFIG_ARM64
  > 56		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    57	#endif
    58	#ifdef CONFIG_X86
    59		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    60	#endif
    61	};
    62	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
