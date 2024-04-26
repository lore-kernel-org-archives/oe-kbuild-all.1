Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA4E42A9B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714118802; cv=none; b=Bv/hxkaaWUpvLoHUWCp/qkkH/aLMCMxDpD1SUoUGSBTKbHCFR7CP1VhRYb7//kXyngswbmzJ6qLUHT+xu9oXstXJ1ZWQw1blxS8O0HCvSSWRxGoiqVTEwDPes9w28FW/Zcgo6JSnZzvAeyETIju8i9NJZoaa6k8tJog6wUyM5/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714118802; c=relaxed/simple;
	bh=GoAmb9y+5DzQa/ZV3IThwf+cSqbutqrc63ajB6CucN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fRRuCLdtJdSm+0I9IcrFdBCk9FoN7ZAOd/y4hAY8Bymqh6HKD4BEXRYUegtZ3SM0oeolsEPI5aQpAMUNH5dKvWUYh+/iOgFZEJ+izVTN3uPI9FGGMT8VcfUE3wbptEeQN9vIjJ9JDKI31mY0vskO6wOxaOYxLOoAf0v+AkdUmNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhMsrYlM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhMsrYlM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714118801; x=1745654801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GoAmb9y+5DzQa/ZV3IThwf+cSqbutqrc63ajB6CucN4=;
  b=GhMsrYlM8pub5RSD6la6eBTx3Vr5qcKqRkdUw86sQsgaw1/mX2n6zF5g
   3B1Vk03idDbgwsZri5WBiGZW3lszbe51gZTUJuyrxhb+iswwFPsfKUKKj
   EifDSr/ImfNYIICZb4SVZB9DO0E+v3SWBr+yVmfTRDYJACOoOaPqSLRa6
   cllihP4QaxvWsz2bwWtp7eTGChXR+Y75D1jEcjnBYU5JAAM0wGdHCgPW3
   XeaydgOnCjxHuN6J9b3aJxoM69DWwyV+XiOGA8ZXii/98JjYnx5jx4Pna
   bqaoLX0Keyx3dWDtaSuIdu/BUJpb6oJDAcWm5rOHq7+fg7sfi/Bcr1xpk
   Q==;
X-CSE-ConnectionGUID: ELHR8u01TLCSdTcUEIFzQA==
X-CSE-MsgGUID: kS+Z2YH0TuOT6JKlNYC6Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10008806"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="10008806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:06:41 -0700
X-CSE-ConnectionGUID: luX4wepIRIqq9HNbZ2hy6w==
X-CSE-MsgGUID: YU8y3TwYTBeK7VjboqBZhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="62821017"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Apr 2024 01:06:39 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0GbM-0003RS-2M;
	Fri, 26 Apr 2024 08:06:36 +0000
Date: Fri, 26 Apr 2024 16:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Chauhan <quic_abchauha@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@linux.dev>,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: [martin-lau-bpf-next:skb.tstamp_type 5/7] net/core/filter.c:9373:38:
 warning: comparison between 'enum skb_tstamp_type' and 'enum <anonymous>'
Message-ID: <202404261654.4wggRWN8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git skb.tstamp_type
head:   733e964360fa81da0f709620d3485fa8297ec07f
commit: 0c332d2a7030235b72caf88dc472503632c542d6 [5/7] net: Add additional bit to support clockid_t timestamp type
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240426/202404261654.4wggRWN8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404261654.4wggRWN8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404261654.4wggRWN8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <command-line>:
   net/core/filter.c: In function 'bpf_convert_tstamp_type_read':
>> net/core/filter.c:9373:38: warning: comparison between 'enum skb_tstamp_type' and 'enum <anonymous>' [-Wenum-compare]
    9373 |         BUILD_BUG_ON(__SKB_CLOCK_MAX != BPF_SKB_TSTAMP_DELIVERY_TAI);
         |                                      ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   net/core/filter.c:9373:9: note: in expansion of macro 'BUILD_BUG_ON'
    9373 |         BUILD_BUG_ON(__SKB_CLOCK_MAX != BPF_SKB_TSTAMP_DELIVERY_TAI);
         |         ^~~~~~~~~~~~
   net/core/filter.c: In function 'bpf_convert_tstamp_read':
   net/core/filter.c:9415:30: warning: comparison between 'enum skb_tstamp_type' and 'enum <anonymous>' [-Wenum-compare]
    9415 | BUILD_BUG_ON(__SKB_CLOCK_MAX != BPF_SKB_TSTAMP_DELIVERY_TAI);
         |                              ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   net/core/filter.c:9415:1: note: in expansion of macro 'BUILD_BUG_ON'
    9415 | BUILD_BUG_ON(__SKB_CLOCK_MAX != BPF_SKB_TSTAMP_DELIVERY_TAI);
         | ^~~~~~~~~~~~


vim +9373 net/core/filter.c

  9367	
  9368	static struct bpf_insn *bpf_convert_tstamp_type_read(const struct bpf_insn *si,
  9369							     struct bpf_insn *insn)
  9370	{
  9371		__u8 value_reg = si->dst_reg;
  9372		__u8 skb_reg = si->src_reg;
> 9373		BUILD_BUG_ON(__SKB_CLOCK_MAX != BPF_SKB_TSTAMP_DELIVERY_TAI);
  9374		*insn++ = BPF_LDX_MEM(BPF_B, value_reg, skb_reg, SKB_BF_MONO_TC_OFFSET);
  9375		*insn++ = BPF_ALU32_IMM(BPF_AND, value_reg, SKB_TSTAMP_TYPE_MASK);
  9376	#ifdef __BIG_ENDIAN_BITFIELD
  9377		*insn++ = BPF_ALU32_IMM(BPF_RSH, value_reg, SKB_TSTAMP_TYPE_RSH);
  9378	#else
  9379		BUILD_BUG_ON(!(SKB_TSTAMP_TYPE_MASK & 0x1));
  9380	#endif
  9381		*insn++ = BPF_JMP32_IMM(BPF_JNE, value_reg, SKB_TSTAMP_TYPE_MASK, 1);
  9382		/* Both the bits set then mark it BPF_SKB_TSTAMP_UNSPEC */
  9383		*insn++ = BPF_MOV64_IMM(value_reg, BPF_SKB_TSTAMP_UNSPEC);
  9384		return insn;
  9385	}
  9386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
