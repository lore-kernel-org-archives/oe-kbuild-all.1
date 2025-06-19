Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0D19D07B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 02:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750299912; cv=none; b=F2/YgtCBzGUNufE/KiNCP301yMN0CrPqpPqS0zGl5kjnr1FSvhtX/0f5hknPeCVJCaswcd2dvdoFXTUKXUtU4Gcn9DcXlbB6nlNpXdb9tfq0Kl0sAYOrU4Ggz0dY4ILtH4PrLju/DoFuLtxDD5Bmq7vHoplYMYjm1lgXp5oBTUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750299912; c=relaxed/simple;
	bh=wQwxwmvKs0ZeOs8UI/GMK2sjFEbNRZpQGnHvoK4cVhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDOCxrW5uRiDLzg0OKOfvL/vC1qAMiU8qbYYitlRIrmsBGdzYU6Z6WdTQC2q06u1iIhmniatiXZ4icl7dGKjLu1DUQ8AZ9RtzlrHRgVJQEYTV2NNuPWORYGo0H9YAjbesgIwv5C/TvPQ+daBy9zjL7jhpXFSteKVKUSscXLTJ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUDPFoTF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUDPFoTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750299910; x=1781835910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wQwxwmvKs0ZeOs8UI/GMK2sjFEbNRZpQGnHvoK4cVhE=;
  b=HUDPFoTFILV25RK6V+dIcWKfa3e923royVVPa4FpkFZPCd74yS9ds63X
   Rf8axMwWHX6sxlS8iX8k5IZOWhWCs5H82Vj/t3d1KVAkbJhSDm3EZUJup
   teayph8/8uAZY5tHoQ5yaf8QHlGZy4xutnH+kEpAlHz+03ohKPj+2GHWE
   mW/DWku937h/v3CPU6DGhm/kQ2ox6n/ID0jpHMIdHOjxnHEBzQqYw1YKb
   TPmcJWd8ptIwuhITA7PY4tP4YrfmrdjqLH5Yykl89FtWtWd+pXKN+dIIp
   zuNBZiP/9khx9NJPJkQgEdKTEpdoEhnUmmpAtKL4z3RZFr5ToDVMdiZir
   Q==;
X-CSE-ConnectionGUID: lrAhAizfRImtIE4VptKxDA==
X-CSE-MsgGUID: wSjWTffIQpKgjgXFMD5Otw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52635753"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="52635753"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 19:25:02 -0700
X-CSE-ConnectionGUID: OAZuNevNToCgmdIBm2wwxA==
X-CSE-MsgGUID: DT6DxRT9QEef3rSTSoOEoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="149907645"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jun 2025 19:25:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS4xW-000KKs-0o;
	Thu, 19 Jun 2025 02:24:58 +0000
Date: Thu, 19 Jun 2025 10:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] riscv: introduce percpu.h into include/asm
Message-ID: <202506191007.08uYnHT5-lkp@intel.com>
References: <20250618034328.21904-2-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618034328.21904-2-cuiyunhui@bytedance.com>

Hi Yunhui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on dennis-percpu/for-next v6.16-rc2 next-20250618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunhui-Cui/riscv-introduce-percpu-h-into-include-asm/20250618-114735
base:   linus/master
patch link:    https://lore.kernel.org/r/20250618034328.21904-2-cuiyunhui%40bytedance.com
patch subject: [PATCH RFC 2/2] riscv: introduce percpu.h into include/asm
config: riscv-randconfig-001-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191007.08uYnHT5-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191007.08uYnHT5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191007.08uYnHT5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/riscv/include/asm/percpu.h: Assembler messages:
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,a2,0(a5)'
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,a2,0(a5)'
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,a2,0(a5)'
--
   arch/riscv/include/asm/percpu.h: Assembler messages:
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,s6,0(a5)'
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,a2,0(a5)'
--
   arch/riscv/include/asm/percpu.h: Assembler messages:
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,a2,0(a5)'
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,a0,0(a5)'
--
   arch/riscv/include/asm/percpu.h: Assembler messages:
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,a2,0(a5)'
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,a2,0(a5)'
--
   In file included from include/linux/bits.h:7,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/cmpxchg.h:9,
                    from arch/riscv/include/asm/barrier.h:14,
                    from include/linux/list.h:11,
                    from include/linux/backing-dev-defs.h:5,
                    from fs/bcachefs/bcachefs.h:196,
                    from fs/bcachefs/disk_accounting.c:3:
   fs/bcachefs/buckets.h: In function 'bch2_disk_reservation_add':
>> include/uapi/linux/bits.h:7:56: warning: right shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/bits.h:87:38: note: in expansion of macro '__GENMASK'
      87 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:150:32: note: in expansion of macro 'GENMASK'
     150 |                 ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)   \
         |                                ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:221:17: note: in expansion of macro '__arch_cmpxchg_masked'
     221 |                 __arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,             \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:262:9: note: in expansion of macro '_arch_cmpxchg'
     262 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
         |                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h:84:33: note: in expansion of macro 'cmpxchg_relaxed'
      84 |         __retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);        \
         |                                 ^~
   arch/riscv/include/asm/percpu.h:131:41: note: in expansion of macro '_pcp_protect_return'
     131 | #define this_cpu_cmpxchg_1(pcp, o, n)   _pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:108:17: note: in expansion of macro 'this_cpu_cmpxchg_1'
     108 |         __val = _cmpxchg(pcp, __old, nval);                             \
         |                 ^~~~~~~~
   include/asm-generic/percpu.h:481:9: note: in expansion of macro '__cpu_fallback_try_cmpxchg'
     481 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg_1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:354:31: note: in expansion of macro 'this_cpu_try_cmpxchg_1'
     354 |         case 1: pscr2_ret__ = stem##1(variable, __VA_ARGS__); break;    \
         |                               ^~~~
   include/linux/percpu-defs.h:508:9: note: in expansion of macro '__pcpu_size_call_return2bool'
     508 |         __pcpu_size_call_return2bool(this_cpu_try_cmpxchg_, pcp, ovalp, nval)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/buckets.h:322:19: note: in expansion of macro 'this_cpu_try_cmpxchg'
     322 |         } while (!this_cpu_try_cmpxchg(c->pcpu->sectors_available, &old, new));
         |                   ^~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/bits.h:87:38: note: in expansion of macro '__GENMASK'
      87 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:150:32: note: in expansion of macro 'GENMASK'
     150 |                 ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)   \
         |                                ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:227:17: note: in expansion of macro '__arch_cmpxchg_masked'
     227 |                 __arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,             \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:262:9: note: in expansion of macro '_arch_cmpxchg'
     262 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
         |                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h:84:33: note: in expansion of macro 'cmpxchg_relaxed'
      84 |         __retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);        \
         |                                 ^~
   arch/riscv/include/asm/percpu.h:131:41: note: in expansion of macro '_pcp_protect_return'
     131 | #define this_cpu_cmpxchg_1(pcp, o, n)   _pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:108:17: note: in expansion of macro 'this_cpu_cmpxchg_1'
     108 |         __val = _cmpxchg(pcp, __old, nval);                             \
         |                 ^~~~~~~~
   include/asm-generic/percpu.h:481:9: note: in expansion of macro '__cpu_fallback_try_cmpxchg'
     481 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg_1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:354:31: note: in expansion of macro 'this_cpu_try_cmpxchg_1'
     354 |         case 1: pscr2_ret__ = stem##1(variable, __VA_ARGS__); break;    \
         |                               ^~~~
   include/linux/percpu-defs.h:508:9: note: in expansion of macro '__pcpu_size_call_return2bool'
     508 |         __pcpu_size_call_return2bool(this_cpu_try_cmpxchg_, pcp, ovalp, nval)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/buckets.h:322:19: note: in expansion of macro 'this_cpu_try_cmpxchg'
     322 |         } while (!this_cpu_try_cmpxchg(c->pcpu->sectors_available, &old, new));
         |                   ^~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/bits.h:87:38: note: in expansion of macro '__GENMASK'
      87 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:150:32: note: in expansion of macro 'GENMASK'
     150 |                 ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)   \
         |                                ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:221:17: note: in expansion of macro '__arch_cmpxchg_masked'
     221 |                 __arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,             \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:262:9: note: in expansion of macro '_arch_cmpxchg'
     262 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
         |                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h:84:33: note: in expansion of macro 'cmpxchg_relaxed'
      84 |         __retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);        \
         |                                 ^~
   arch/riscv/include/asm/percpu.h:132:41: note: in expansion of macro '_pcp_protect_return'
     132 | #define this_cpu_cmpxchg_2(pcp, o, n)   _pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:108:17: note: in expansion of macro 'this_cpu_cmpxchg_2'
     108 |         __val = _cmpxchg(pcp, __old, nval);                             \
         |                 ^~~~~~~~
   include/asm-generic/percpu.h:490:9: note: in expansion of macro '__cpu_fallback_try_cmpxchg'
     490 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg_2)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:355:31: note: in expansion of macro 'this_cpu_try_cmpxchg_2'
     355 |         case 2: pscr2_ret__ = stem##2(variable, __VA_ARGS__); break;    \
         |                               ^~~~
   include/linux/percpu-defs.h:508:9: note: in expansion of macro '__pcpu_size_call_return2bool'
     508 |         __pcpu_size_call_return2bool(this_cpu_try_cmpxchg_, pcp, ovalp, nval)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/buckets.h:322:19: note: in expansion of macro 'this_cpu_try_cmpxchg'
     322 |         } while (!this_cpu_try_cmpxchg(c->pcpu->sectors_available, &old, new));
         |                   ^~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/bits.h:87:38: note: in expansion of macro '__GENMASK'
      87 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:150:32: note: in expansion of macro 'GENMASK'
     150 |                 ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)   \
         |                                ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:227:17: note: in expansion of macro '__arch_cmpxchg_masked'
     227 |                 __arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,             \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:262:9: note: in expansion of macro '_arch_cmpxchg'
     262 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
         |                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h:84:33: note: in expansion of macro 'cmpxchg_relaxed'
      84 |         __retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);        \
         |                                 ^~
   arch/riscv/include/asm/percpu.h:132:41: note: in expansion of macro '_pcp_protect_return'
     132 | #define this_cpu_cmpxchg_2(pcp, o, n)   _pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:108:17: note: in expansion of macro 'this_cpu_cmpxchg_2'
     108 |         __val = _cmpxchg(pcp, __old, nval);                             \
         |                 ^~~~~~~~
   include/asm-generic/percpu.h:490:9: note: in expansion of macro '__cpu_fallback_try_cmpxchg'
     490 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg_2)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:355:31: note: in expansion of macro 'this_cpu_try_cmpxchg_2'
     355 |         case 2: pscr2_ret__ = stem##2(variable, __VA_ARGS__); break;    \
         |                               ^~~~
   include/linux/percpu-defs.h:508:9: note: in expansion of macro '__pcpu_size_call_return2bool'
     508 |         __pcpu_size_call_return2bool(this_cpu_try_cmpxchg_, pcp, ovalp, nval)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/buckets.h:322:19: note: in expansion of macro 'this_cpu_try_cmpxchg'
     322 |         } while (!this_cpu_try_cmpxchg(c->pcpu->sectors_available, &old, new));
         |                   ^~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/bits.h:87:38: note: in expansion of macro '__GENMASK'
      87 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:150:32: note: in expansion of macro 'GENMASK'
     150 |                 ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)   \
         |                                ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:221:17: note: in expansion of macro '__arch_cmpxchg_masked'
     221 |                 __arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,             \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:262:9: note: in expansion of macro '_arch_cmpxchg'
     262 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
         |                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h:84:33: note: in expansion of macro 'cmpxchg_relaxed'
      84 |         __retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);        \
         |                                 ^~
   arch/riscv/include/asm/percpu.h:133:41: note: in expansion of macro '_pcp_protect_return'
     133 | #define this_cpu_cmpxchg_4(pcp, o, n)   _pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:108:17: note: in expansion of macro 'this_cpu_cmpxchg_4'
     108 |         __val = _cmpxchg(pcp, __old, nval);                             \
         |                 ^~~~~~~~
   include/asm-generic/percpu.h:499:9: note: in expansion of macro '__cpu_fallback_try_cmpxchg'
     499 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg_4)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:356:31: note: in expansion of macro 'this_cpu_try_cmpxchg_4'
     356 |         case 4: pscr2_ret__ = stem##4(variable, __VA_ARGS__); break;    \
         |                               ^~~~
   include/linux/percpu-defs.h:508:9: note: in expansion of macro '__pcpu_size_call_return2bool'
     508 |         __pcpu_size_call_return2bool(this_cpu_try_cmpxchg_, pcp, ovalp, nval)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/buckets.h:322:19: note: in expansion of macro 'this_cpu_try_cmpxchg'
     322 |         } while (!this_cpu_try_cmpxchg(c->pcpu->sectors_available, &old, new));
         |                   ^~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/bits.h:87:38: note: in expansion of macro '__GENMASK'
      87 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:150:32: note: in expansion of macro 'GENMASK'
     150 |                 ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)   \
         |                                ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:227:17: note: in expansion of macro '__arch_cmpxchg_masked'
     227 |                 __arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,             \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:262:9: note: in expansion of macro '_arch_cmpxchg'
     262 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
         |                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h:84:33: note: in expansion of macro 'cmpxchg_relaxed'
      84 |         __retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);        \
         |                                 ^~
   arch/riscv/include/asm/percpu.h:133:41: note: in expansion of macro '_pcp_protect_return'
     133 | #define this_cpu_cmpxchg_4(pcp, o, n)   _pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:108:17: note: in expansion of macro 'this_cpu_cmpxchg_4'
     108 |         __val = _cmpxchg(pcp, __old, nval);                             \
         |                 ^~~~~~~~
   include/asm-generic/percpu.h:499:9: note: in expansion of macro '__cpu_fallback_try_cmpxchg'
     499 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg_4)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:356:31: note: in expansion of macro 'this_cpu_try_cmpxchg_4'
     356 |         case 4: pscr2_ret__ = stem##4(variable, __VA_ARGS__); break;    \
         |                               ^~~~
   include/linux/percpu-defs.h:508:9: note: in expansion of macro '__pcpu_size_call_return2bool'
     508 |         __pcpu_size_call_return2bool(this_cpu_try_cmpxchg_, pcp, ovalp, nval)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/buckets.h:322:19: note: in expansion of macro 'this_cpu_try_cmpxchg'
     322 |         } while (!this_cpu_try_cmpxchg(c->pcpu->sectors_available, &old, new));
         |                   ^~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/bits.h:87:38: note: in expansion of macro '__GENMASK'
      87 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:150:32: note: in expansion of macro 'GENMASK'
     150 |                 ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)   \
         |                                ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:221:17: note: in expansion of macro '__arch_cmpxchg_masked'
     221 |                 __arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,             \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:262:9: note: in expansion of macro '_arch_cmpxchg'
     262 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
         |                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h:84:33: note: in expansion of macro 'cmpxchg_relaxed'
      84 |         __retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);        \
         |                                 ^~
   arch/riscv/include/asm/percpu.h:134:41: note: in expansion of macro '_pcp_protect_return'
     134 | #define this_cpu_cmpxchg_8(pcp, o, n)   _pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:108:17: note: in expansion of macro 'this_cpu_cmpxchg_8'
     108 |         __val = _cmpxchg(pcp, __old, nval);                             \
         |                 ^~~~~~~~
   include/asm-generic/percpu.h:508:9: note: in expansion of macro '__cpu_fallback_try_cmpxchg'
     508 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg_8)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:357:31: note: in expansion of macro 'this_cpu_try_cmpxchg_8'
     357 |         case 8: pscr2_ret__ = stem##8(variable, __VA_ARGS__); break;    \
         |                               ^~~~
   include/linux/percpu-defs.h:508:9: note: in expansion of macro '__pcpu_size_call_return2bool'
     508 |         __pcpu_size_call_return2bool(this_cpu_try_cmpxchg_, pcp, ovalp, nval)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/buckets.h:322:19: note: in expansion of macro 'this_cpu_try_cmpxchg'
     322 |         } while (!this_cpu_try_cmpxchg(c->pcpu->sectors_available, &old, new));
         |                   ^~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/bits.h:87:38: note: in expansion of macro '__GENMASK'
      87 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:150:32: note: in expansion of macro 'GENMASK'
     150 |                 ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)   \
         |                                ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:227:17: note: in expansion of macro '__arch_cmpxchg_masked'
     227 |                 __arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,             \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:262:9: note: in expansion of macro '_arch_cmpxchg'
     262 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
         |                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h:84:33: note: in expansion of macro 'cmpxchg_relaxed'
      84 |         __retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);        \
         |                                 ^~
   arch/riscv/include/asm/percpu.h:134:41: note: in expansion of macro '_pcp_protect_return'
     134 | #define this_cpu_cmpxchg_8(pcp, o, n)   _pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:108:17: note: in expansion of macro 'this_cpu_cmpxchg_8'
     108 |         __val = _cmpxchg(pcp, __old, nval);                             \
         |                 ^~~~~~~~
   include/asm-generic/percpu.h:508:9: note: in expansion of macro '__cpu_fallback_try_cmpxchg'
     508 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg_8)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:357:31: note: in expansion of macro 'this_cpu_try_cmpxchg_8'
     357 |         case 8: pscr2_ret__ = stem##8(variable, __VA_ARGS__); break;    \
         |                               ^~~~
   include/linux/percpu-defs.h:508:9: note: in expansion of macro '__pcpu_size_call_return2bool'
     508 |         __pcpu_size_call_return2bool(this_cpu_try_cmpxchg_, pcp, ovalp, nval)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/buckets.h:322:19: note: in expansion of macro 'this_cpu_try_cmpxchg'
     322 |         } while (!this_cpu_try_cmpxchg(c->pcpu->sectors_available, &old, new));
         |                   ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h: Assembler messages:
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,s2,0(a5)'
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,a2,0(a5)'
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,a2,0(a5)'
>> arch/riscv/include/asm/percpu.h:62: Error: unrecognized opcode `amoadd.d zero,a2,0(a5)'
..


vim +62 arch/riscv/include/asm/percpu.h

    61	
  > 62	PERCPU_OP(add, add)
    63	PERCPU_OP(andnot, and)
    64	PERCPU_OP(or, or)
  > 65	PERCPU_RET_OP(add, add)
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
