Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA40E3DC878
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 16:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784390720; cv=none; b=bWeYUCGhtx/TfqlHFTRhG8QANA7evJUT6CPpW7aRLJk/Nau3LbA2omXpNwinve+23W/wuM5BnJ330dVhsxIFp2NWClj8V1uSSMEc5iVijNhDW3HVgcuagqIkeJGBgn3kvBnW6voYlT0tMYqI9yCLNwIdkig75Eso4hpzlWdEBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784390720; c=relaxed/simple;
	bh=w6ws6Q2XN2FnoxH12vIu29XyVbBiBFsjzFV6mEEPvfE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S7/adnJfbew+OG45RoVsUMnUi9N72WEnaUd7IVpVW2N2xzQRsq9YRVJkx8l98GKIqcJFCyxc/8/WGYL/slG/o1+gqEURlv4AVAJLdXhtCoTWpO9ACcezGPbUxvWZQTqkkJ6cXWhkQGWgJILD8RUPJW6Pd1FJGcEgUr0tBEjEpcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lp3BDRFl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lp3BDRFl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784390715; x=1815926715;
  h=date:from:to:cc:subject:message-id;
  bh=w6ws6Q2XN2FnoxH12vIu29XyVbBiBFsjzFV6mEEPvfE=;
  b=Lp3BDRFlSdMoOcjJTMkNuDKUuDb39/jK6j8wJbuRDkx0JOzfRDOm1Y4F
   7L4TbNjeblOPIvLKDCj9zHUBeZYb+pOxKQAd2YrZx69OHFGURK6jZpzLd
   3TXr4ZC6dwHKVvU+CqIChtFVbHrUknN7UmTzb6+RCCZW8dBS8dl4Fr8yL
   kuZ6WK0FpDGhdnO99cRR3DOy4MX0ZkO2shY3oj0wYwtczFGiS6yEUzsfm
   V/Ivz72eTNCR2Cn12oKMopzf6LIAU1Bjhb+vZ6MsrQ4UzmvjdNjJPUEKy
   1mUMUldsXjiV1CwPO1Hn+SQq/B+wTDHY3tfsv6QnYkJbr9sAyxLBrKvvK
   Q==;
X-CSE-ConnectionGUID: gVhh9oUxRbCnjye4UjBIGw==
X-CSE-MsgGUID: otOYzOBiRFanDE4H19aDeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="96169968"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="96169968"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 09:05:11 -0700
X-CSE-ConnectionGUID: +itk6SppS3mJztYJob0vXA==
X-CSE-MsgGUID: EFQ9JK7IQW64z/ShbCkm8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="254415845"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jul 2026 09:05:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl7XG-00000000Usc-3bza;
	Sat, 18 Jul 2026 16:05:06 +0000
Date: Sun, 19 Jul 2026 00:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 192/192]
 arch/arm64/kvm/hyp_trace.c:245:6: warning: no previous prototype for function
 'hyp_poke_tracing'
Message-ID: <202607182313.Xpz9UR86-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   15bdff0dd01eed4ffc4ae138c5a611d8b102a4b6
commit: a262be0c417b3b3b6c6390f34b468049fab254e1 [192/192] ANDROID: KVM: arm64: Flush hyp trace pipe when tracing stops
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260718/202607182313.Xpz9UR86-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607182313.Xpz9UR86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607182313.Xpz9UR86-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> arch/arm64/kvm/hyp_trace.c:245:6: warning: no previous prototype for function 'hyp_poke_tracing' [-Wmissing-prototypes]
     245 | void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
         |      ^
   arch/arm64/kvm/hyp_trace.c:245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     245 | void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
         | ^
         | static 
   arch/arm64/kvm/hyp_trace.c:713:5: warning: no previous prototype for function 'hyp_trace_release' [-Wmissing-prototypes]
     713 | int hyp_trace_release(struct inode *inode, struct file *file)
         |     ^
   arch/arm64/kvm/hyp_trace.c:713:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     713 | int hyp_trace_release(struct inode *inode, struct file *file)
         | ^
         | static 
   3 warnings generated.


vim +/hyp_poke_tracing +245 arch/arm64/kvm/hyp_trace.c

   244	
 > 245	void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
   246	{
   247		if (cpu == RING_BUFFER_ALL_CPUS) {
   248			for_each_cpu(cpu, cpus)
   249				WARN_ON_ONCE(ring_buffer_poke(hyp_trace_buffer, cpu));
   250		} else {
   251			WARN_ON_ONCE(ring_buffer_poke(hyp_trace_buffer, cpu));
   252		}
   253	}
   254	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
