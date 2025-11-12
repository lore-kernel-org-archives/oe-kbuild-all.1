Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A160A1D5AC0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 05:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762924929; cv=none; b=mHrI2TeU/+5EXkH0wDFZW4uCk1XAmqw0wIlMchBkyw1Q8zvqlGILpntq+M0SE691HdHlOW34lph6L+dNOPKR9OOxdp3FkcfzDvUmZSsexL39qClVSOy6uidFgIKOq1k+pFDs8vfAEb7YRanHKKKpFK8H5p2fV+JPeKaNeUSH+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762924929; c=relaxed/simple;
	bh=A06/4riA9CwEDRFPfv6xqGjvdapKqXSPUIHQhtplJO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyKjPiFQawgeNUFBZC7d6a1taM0JWwUCy9e9ILcTRkisbZpvl8dzspM5CAQym4MH8gPv0GXAu6pHBWxqflv0CsFqLB8w5J4w4ziid+55Ri14MeCCani7TsQ9DAe9/mNXi4BkPAe84QdOZzQvin2p1gCfMQ2MKtOJ/obrx8bszn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0I6zFxJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0I6zFxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762924928; x=1794460928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A06/4riA9CwEDRFPfv6xqGjvdapKqXSPUIHQhtplJO0=;
  b=b0I6zFxJQJmolX+YoPC+Wcctgv57/PsUud1EnFfmO0txPgn8zuDlvCgn
   p2wQnZkca2OFnKmRbUF+7HnOMyTZ6InU4cM5TwyeooDHE0a6uhxhk80My
   Jsx3ifVSOH5ul2fsRfQX0sDE1JjzJ1o7dklvEVDLQAoZRouvPP4amcBBH
   LHHdNkNaBy56dtpkZ3fWsYt3vQl6F5XNEgv3hjYtgFUb+xsi1KH1GAJ7K
   /sYtn7IyekBCKb5+jZhDOT1kLrOlLX7N3dcItwTy36qBUeCxmffOl5Kl/
   +dhPlLlhYHTNv5+d3Pb4OIO312bYwZGPbNSqablOiCcmJkWozVejcdJRG
   A==;
X-CSE-ConnectionGUID: 3dtvPlptTlGtE6cf3Amwmw==
X-CSE-MsgGUID: PIYF+ndyQ3+nvJmQXLZXXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="87613083"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="87613083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 21:22:07 -0800
X-CSE-ConnectionGUID: U9BocXusT+uhcjWpS2HI1g==
X-CSE-MsgGUID: mdMGKaRHS6qgnuPlT6YRBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="188971021"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Nov 2025 21:22:06 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJ3Ix-0003qs-2f;
	Wed, 12 Nov 2025 05:22:03 +0000
Date: Wed, 12 Nov 2025 13:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Chenghai Huang <huangchenghai2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/4] asm-generic/io.h: add io{read,write}128 accessors
Message-ID: <202511121203.2yAbgprF-lkp@intel.com>
References: <20251112015846.1842207-3-huangchenghai2@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112015846.1842207-3-huangchenghai2@huawei.com>

Hi Chenghai,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on arm64/for-next/core soc/for-next linus/master v6.18-rc5 next-20251111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chenghai-Huang/UAPI-Introduce-128-bit-types-and-byteswap-operations/20251112-100133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20251112015846.1842207-3-huangchenghai2%40huawei.com
patch subject: [PATCH RFC 2/4] asm-generic/io.h: add io{read,write}128 accessors
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20251112/202511121203.2yAbgprF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121203.2yAbgprF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121203.2yAbgprF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/riscv/include/uapi/asm/byteorder.h:10,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/riscv/include/asm/bitops.h:376,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/kernel/asm-offsets.c:8:
   include/asm-generic/io.h: In function 'ioread128':
>> include/asm-generic/io.h:948:61: warning: passing argument 1 of '__raw_read128' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     948 |         val = __le128_to_cpu((__le128 __force)__raw_read128(addr));
         |                                                             ^~~~
   include/uapi/linux/byteorder/little_endian.h:35:54: note: in definition of macro '__le128_to_cpu'
      35 | #define __le128_to_cpu(x) ((__force __u128)(__le128)(x))
         |                                                      ^
   In file included from arch/riscv/include/asm/io.h:136,
                    from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/riscv/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from arch/riscv/kernel/asm-offsets.c:10:
   include/asm-generic/io.h:152:57: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     152 | static inline u128 __raw_read128(volatile void __iomem *addr)
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~^~~~
--
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/riscv/include/uapi/asm/byteorder.h:10,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/riscv/include/asm/bitops.h:376,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/kernel/asm-offsets.c:8:
   include/asm-generic/io.h: In function 'ioread128':
>> include/asm-generic/io.h:948:61: warning: passing argument 1 of '__raw_read128' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     948 |         val = __le128_to_cpu((__le128 __force)__raw_read128(addr));
         |                                                             ^~~~
   include/uapi/linux/byteorder/little_endian.h:35:54: note: in definition of macro '__le128_to_cpu'
      35 | #define __le128_to_cpu(x) ((__force __u128)(__le128)(x))
         |                                                      ^
   In file included from arch/riscv/include/asm/io.h:136,
                    from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/riscv/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from arch/riscv/kernel/asm-offsets.c:10:
   include/asm-generic/io.h:152:57: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     152 | static inline u128 __raw_read128(volatile void __iomem *addr)
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +948 include/asm-generic/io.h

   939	
   940	#ifdef CONFIG_ARCH_SUPPORTS_INT128
   941	#ifndef ioread128
   942	#define ioread128 ioread128
   943	static inline u128 ioread128(const volatile void __iomem *addr)
   944	{
   945		u128 val;
   946	
   947		__io_br();
 > 948		val = __le128_to_cpu((__le128 __force)__raw_read128(addr));
   949		__io_ar(val);
   950	
   951		return val;
   952	}
   953	#endif
   954	#endif /* CONFIG_ARCH_SUPPORTS_INT128 */
   955	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
