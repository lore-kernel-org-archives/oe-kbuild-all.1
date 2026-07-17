Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F483B2D18
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285074; cv=none; b=J0Anv5mtEwVKjceyr2JzxJqFaW1x2v9YhGyyKTyJLU7TSqjovxSEGkrXRJwH1cCWaiJaY2eirkzWZktjwBXEK9hb9Sr2OufF/K8g159QoVLqJl1e4cssGR5ir6uGPmQ7i/9HPUljb2E0ozFys4MJGxNA8hmPH0QmH35oIoSsCfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285074; c=relaxed/simple;
	bh=YC4okxldowzLFA1iNW0FoP2VTP6FqiFtO+3BPKxWGqw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tM2y1eCNoC9hH4creKF4hvYm4kV0i8qbr0Cag6w8vJYHGgSpOc42EZvyBuU2whqBtqngfeCl9hSOqGydvUGpzUzrA69xIcBbAkmWQ+p5aQBiuSpBhXYb6nTwE/tQB92sVkfl8mPB+/FTqFP9RIgPvKG6njhdCzMNmUxOZu1EGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0RMGXqx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0RMGXqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784285072; x=1815821072;
  h=date:from:to:cc:subject:message-id;
  bh=YC4okxldowzLFA1iNW0FoP2VTP6FqiFtO+3BPKxWGqw=;
  b=Y0RMGXqx2mzWcsIO3Y6NhCo13kQvNqnQdbnfOB5a7QX3Ee9qn/shfGkE
   1FnfY3pwAtmPuu7/MQwbyxMzUNo4f3teY24X5HSW8aCyvPZWaRFGAX9nE
   sCgrEOQ7Ti+vbwxnZZ0ovrISh9r0+L5F2TOwB1uD7R0UDtBK600wM/o11
   NfS854Fc5cUXS5+U7TVhSXtPUtiUzurIpBLz9wnrApVGpOqL90WQbmcO5
   vg56enlZZY1GTweEp9BiLFJ4kXQkWnnrufc2DIjlic20njPrGLzacK2IL
   fYT3dZehI/PywPc0SyT03Px8gaoH2cJEQM3xUO8WAPv5TUUHRtlX2rXme
   A==;
X-CSE-ConnectionGUID: PZ6xNO1eS+W/fCgxYqF14g==
X-CSE-MsgGUID: eDYgIamFQkiMIWIKZ6jMlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96089878"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="96089878"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:44:31 -0700
X-CSE-ConnectionGUID: N97iP8y+Q6iIeytqFnkOxQ==
X-CSE-MsgGUID: rAgtYRTQRJqbqVJQRdI/Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="256201863"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Jul 2026 03:44:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkg3P-00000000Se4-1R7n;
	Fri, 17 Jul 2026 10:44:27 +0000
Date: Fri, 17 Jul 2026 18:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-04 1/1]
 arch/arm64/kvm/hyp/nvhe/serial.c:42:6: warning: no previous prototype for
 'hyp_puts'
Message-ID: <202607171851.qBhbVcZ5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-04
head:   33b6171ad078b267e1bfa3617dbe417681d7d02f
commit: 485b479fee4fbb2f2b8ac3bce7cc7f994b300303 [1/1] ANDROID: KVM: arm64: Add serial framework for pKVM
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260717/202607171851.qBhbVcZ5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171851.qBhbVcZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171851.qBhbVcZ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/serial.c:42:6: warning: no previous prototype for 'hyp_puts' [-Wmissing-prototypes]
      42 | void hyp_puts(const char *s)
         |      ^~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/serial.c:54:6: warning: no previous prototype for 'hyp_putx64' [-Wmissing-prototypes]
      54 | void hyp_putx64(u64 x)
         |      ^~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/serial.c:60:6: warning: no previous prototype for 'hyp_putc' [-Wmissing-prototypes]
      60 | void hyp_putc(char c)
         |      ^~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/serial.c:66:5: warning: no previous prototype for '__pkvm_register_serial_driver' [-Wmissing-prototypes]
      66 | int __pkvm_register_serial_driver(void (*cb)(char))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hyp_puts +42 arch/arm64/kvm/hyp/nvhe/serial.c

    41	
  > 42	void hyp_puts(const char *s)
    43	{
    44		if (!hyp_serial_enabled())
    45			return;
    46	
    47		while (*s)
    48			__hyp_putc(*s++);
    49	
    50		__hyp_putc('\n');
    51		__hyp_putc('\r');
    52	}
    53	
  > 54	void hyp_putx64(u64 x)
    55	{
    56		if (hyp_serial_enabled())
    57			__hyp_putx4n(x, 64);
    58	}
    59	
    60	void hyp_putc(char c)
    61	{
    62		if (hyp_serial_enabled())
    63			__hyp_putc(c);
    64	}
    65	
  > 66	int __pkvm_register_serial_driver(void (*cb)(char))

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
