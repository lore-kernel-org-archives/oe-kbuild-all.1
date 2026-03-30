Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270053BE643
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 10:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867380; cv=none; b=JALWCYgDEuYvbkBaQeoFgPWKey88/l1mDkCZIBrn7QcxtUPj/qivhboabldR0IDxmk0xHNTSKW6KCBpvJJt3pBUWiX/Tn6Og9zXduWS/97VCXAw6wUWAu0SqmEi3BpBX0AohRNPL7bDUyxecHb/7Gpp9hEVCQcR3xwfw1SJ33bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867380; c=relaxed/simple;
	bh=He++gvZe/U7BlM85yGgQn5ZM2DpJnmmH7zUGRqWzo7A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nq0+D/FvROsGcP3iQLX0mdSDtiNfgh1WIG0B/iN4uhckSFLd/+4H7p6zw/diFE2mtM6+vaZAoGg7QXn5CVdNk7N4vGvIzg0QNNk7gdxCIc1GyB+1FQBnk8/mpyxzEEPIszoRABsUJpv1PoOF9bn/RKvV+1E9JD3jY8i8yUTDLGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQrH6Mln; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQrH6Mln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774867377; x=1806403377;
  h=date:from:to:cc:subject:message-id;
  bh=He++gvZe/U7BlM85yGgQn5ZM2DpJnmmH7zUGRqWzo7A=;
  b=UQrH6MlnpJWh6BlOSQUhJXO7jkyOPmbdQ765Li/8D/OqZxhYxiPgqCi3
   aW1A1p3EGtl+uHpX4sXPCe1QcZXu57GF35CoYmMD8Zg81ZAkR5ELtxOoo
   mSYHL90La2KmpU5elzTfnPcITJmTFmfeA+qLP55uYn131AKu/3AHxQgfy
   E5QIqJFd8S0Qb/f3cf62LDnRcQ1xJ4dHm5lNJQwIWMC+OgImc1Wi2iX8A
   xeepLe/SLrDi12fFC1EPNA9rGGNEWnXH4p3vZnMjQaTC3C07ChdwEpVOf
   54JUXodI46PtvgKmzMQ7JxtgYtAiCbCumFV5uXBm82PW61aXXesK+H3GK
   g==;
X-CSE-ConnectionGUID: Ez0rFPTnTZySPCsaQqm5lQ==
X-CSE-MsgGUID: ByJPufRlRjCBQv30uNi7EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="98467300"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="98467300"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 03:42:56 -0700
X-CSE-ConnectionGUID: vSI1YWx8Ty6sH79//neLYQ==
X-CSE-MsgGUID: SXblO6BSRwek02romfiJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="219370248"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2026 03:42:54 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7A55-000000000yn-34lJ;
	Mon, 30 Mar 2026 10:42:51 +0000
Date: Mon, 30 Mar 2026 18:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 4/4]
 arch/arm64/kvm/hyp/nvhe/serial.c:42:6: warning: no previous prototype for
 'hyp_puts'
Message-ID: <202603301804.G7ByGunz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: ea53aa5d800829a9adc17df0b6615eb845a9314b [4/4] ANDROID: KVM: arm64: Add serial framework for pKVM
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260330/202603301804.G7ByGunz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301804.G7ByGunz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301804.G7ByGunz-lkp@intel.com/

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
