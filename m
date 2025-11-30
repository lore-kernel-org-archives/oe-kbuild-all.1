Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5423F188A3A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764508738; cv=none; b=sEca2yQA1Z0/aiUskcjtGIHJkR5HwWNbk07Ke5xnu5PavlEJGkTbOSVF1I+fMn0haW9S+eTw/CLk7URzCcIl3lO9PPCsPL0PXsZXhEWLbaG3wg5bGNochDNkeeXJDvXZQ6meZIp8r5UMcsvGSxkiyd1vVQCLd5MUFX8LDbwAbKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764508738; c=relaxed/simple;
	bh=naJZrTBB8AeMeIcysNmRx6k1nunyD0t2lJiRtjEobtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iCQsB7uTX3CN4ihTBIpfoWs7+ZMj5WIiciuRHzdUxLir+pWnTZhI+2+YnMchjsGkp5zvHAg2DWa13yRBBbruOOSkU08DjejlB66/lEIBYdZplFzljX4BRdaEbRCS2SiPnUbn2XkzLRwTKBxyKH7YYVvmge3xqayWIUMn9R+o88w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5z8RHty; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5z8RHty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764508736; x=1796044736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=naJZrTBB8AeMeIcysNmRx6k1nunyD0t2lJiRtjEobtM=;
  b=n5z8RHtyxiH+2NXJfVcll6Pnqagl4xemVRE2dWe/om3VtSiuD64sFOTb
   OqY8MTVwcpUmrsprS+zdlDSf90dQ7y8XNjSQENqzG1fp+HrC+JDkvSlD7
   DgSsRVja7CsSNyq+yVX4bsWhAus0F77RNwpITHNRA80JGRdni3oYE+Ai4
   kUJWspqkrG+x4mjfO61AFF5rqh8T/63PfkbATmlqjSCalml8Zk1dWtOeY
   WoO9lImwxk2FOmn90kqetTb0gJDzevHtYbI9tLMl/1gbCc5m7KDXSBJvE
   Aa8JKM5+0BdF21yzXDpVb3iQMn4xX1kF+WURJpwbUv86dzafZO5EzKqQE
   w==;
X-CSE-ConnectionGUID: NQe9QaNxQ1WGKdfYjUwW5g==
X-CSE-MsgGUID: s+NxQ1TwS9KIr60O/ns4Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="70310558"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="70310558"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 05:18:55 -0800
X-CSE-ConnectionGUID: n9jKBHw/SJ6Ng7dNSIa8Tg==
X-CSE-MsgGUID: biYb/Gv2RrC/C1kS+VtKLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="224803857"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Nov 2025 05:18:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPhKG-000000007yX-2Bqi;
	Sun, 30 Nov 2025 13:18:52 +0000
Date: Sun, 30 Nov 2025 21:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oupton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 11145/12740] include/linux/bitfield.h:114:9:
 error: braced-group within expression allowed only inside a function
Message-ID: <202511302141.kTQNZHzn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d31f578f3230f3b7b33b0930b08f9afd8429817
commit: 81e9fe5c6f25dda9090697deee6f7aa8ac7ea84a [11145/12740] KVM: arm64: Teach ptdump about FEAT_XNX permissions
config: arm64-randconfig-004-20251130 (https://download.01.org/0day-ci/archive/20251130/202511302141.kTQNZHzn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511302141.kTQNZHzn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511302141.kTQNZHzn-lkp@intel.com/

Note: the linux-next/master HEAD 7d31f578f3230f3b7b33b0930b08f9afd8429817 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/sysreg.h:1155,
                    from arch/arm64/include/asm/memory.h:219,
                    from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/debugfs.h:15,
                    from arch/arm64/kvm/ptdump.c:9:
>> include/linux/bitfield.h:114:9: error: braced-group within expression allowed only inside a function
     114 |         ({                                                              \
         |         ^
   arch/arm64/kvm/ptdump.c:49:27: note: in expansion of macro 'FIELD_PREP'
      49 |                 .val    = FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b00),
         |                           ^~~~~~~~~~
>> include/linux/bitfield.h:114:9: error: braced-group within expression allowed only inside a function
     114 |         ({                                                              \
         |         ^
   arch/arm64/kvm/ptdump.c:54:27: note: in expansion of macro 'FIELD_PREP'
      54 |                 .val    = FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b01),
         |                           ^~~~~~~~~~
>> include/linux/bitfield.h:114:9: error: braced-group within expression allowed only inside a function
     114 |         ({                                                              \
         |         ^
   arch/arm64/kvm/ptdump.c:59:27: note: in expansion of macro 'FIELD_PREP'
      59 |                 .val    = FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b10),
         |                           ^~~~~~~~~~
>> include/linux/bitfield.h:114:9: error: braced-group within expression allowed only inside a function
     114 |         ({                                                              \
         |         ^
   arch/arm64/kvm/ptdump.c:64:27: note: in expansion of macro 'FIELD_PREP'
      64 |                 .val    = FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b11),
         |                           ^~~~~~~~~~


vim +114 include/linux/bitfield.h

bff8c3848e071d Peter Zijlstra 2021-11-10   62  
3e9b3112ec74f1 Jakub Kicinski 2016-08-31   63  #define __BF_FIELD_CHECK(_mask, _reg, _val, _pfx)			\
3e9b3112ec74f1 Jakub Kicinski 2016-08-31   64  	({								\
3e9b3112ec74f1 Jakub Kicinski 2016-08-31   65  		BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),		\
3e9b3112ec74f1 Jakub Kicinski 2016-08-31   66  				 _pfx "mask is not constant");		\
e36488c83b6d87 Arnd Bergmann  2018-08-17   67  		BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");	\
3e9b3112ec74f1 Jakub Kicinski 2016-08-31   68  		BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?		\
416eb60317c646 Johannes Berg  2024-02-23   69  				 ~((_mask) >> __bf_shf(_mask)) &	\
416eb60317c646 Johannes Berg  2024-02-23   70  					(0 + (_val)) : 0,		\
3e9b3112ec74f1 Jakub Kicinski 2016-08-31   71  				 _pfx "value too large for the field"); \
bff8c3848e071d Peter Zijlstra 2021-11-10   72  		BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >	\
bff8c3848e071d Peter Zijlstra 2021-11-10   73  				 __bf_cast_unsigned(_reg, ~0ull),	\
3e9b3112ec74f1 Jakub Kicinski 2016-08-31   74  				 _pfx "type of reg too small for mask"); \
3e9b3112ec74f1 Jakub Kicinski 2016-08-31   75  		__BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +			\
3e9b3112ec74f1 Jakub Kicinski 2016-08-31   76  					      (1ULL << __bf_shf(_mask))); \
3e9b3112ec74f1 Jakub Kicinski 2016-08-31   77  	})
3e9b3112ec74f1 Jakub Kicinski 2016-08-31   78  
e31a50162feb35 Alex Elder     2020-03-12   79  /**
e31a50162feb35 Alex Elder     2020-03-12   80   * FIELD_MAX() - produce the maximum value representable by a field
e31a50162feb35 Alex Elder     2020-03-12   81   * @_mask: shifted mask defining the field's length and position
e31a50162feb35 Alex Elder     2020-03-12   82   *
e31a50162feb35 Alex Elder     2020-03-12   83   * FIELD_MAX() returns the maximum value that can be held in the field
e31a50162feb35 Alex Elder     2020-03-12   84   * specified by @_mask.
e31a50162feb35 Alex Elder     2020-03-12   85   */
e31a50162feb35 Alex Elder     2020-03-12   86  #define FIELD_MAX(_mask)						\
e31a50162feb35 Alex Elder     2020-03-12   87  	({								\
e31a50162feb35 Alex Elder     2020-03-12   88  		__BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_MAX: ");	\
e31a50162feb35 Alex Elder     2020-03-12   89  		(typeof(_mask))((_mask) >> __bf_shf(_mask));		\
e31a50162feb35 Alex Elder     2020-03-12   90  	})
e31a50162feb35 Alex Elder     2020-03-12   91  
1697599ee301a5 Jakub Kicinski 2017-02-09   92  /**
1697599ee301a5 Jakub Kicinski 2017-02-09   93   * FIELD_FIT() - check if value fits in the field
1697599ee301a5 Jakub Kicinski 2017-02-09   94   * @_mask: shifted mask defining the field's length and position
1697599ee301a5 Jakub Kicinski 2017-02-09   95   * @_val:  value to test against the field
1697599ee301a5 Jakub Kicinski 2017-02-09   96   *
1697599ee301a5 Jakub Kicinski 2017-02-09   97   * Return: true if @_val can fit inside @_mask, false if @_val is too big.
1697599ee301a5 Jakub Kicinski 2017-02-09   98   */
1697599ee301a5 Jakub Kicinski 2017-02-09   99  #define FIELD_FIT(_mask, _val)						\
1697599ee301a5 Jakub Kicinski 2017-02-09  100  	({								\
444da3f52407d7 Jakub Kicinski 2020-08-10  101  		__BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_FIT: ");	\
1697599ee301a5 Jakub Kicinski 2017-02-09  102  		!((((typeof(_mask))_val) << __bf_shf(_mask)) & ~(_mask)); \
1697599ee301a5 Jakub Kicinski 2017-02-09  103  	})
1697599ee301a5 Jakub Kicinski 2017-02-09  104  
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  105  /**
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  106   * FIELD_PREP() - prepare a bitfield element
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  107   * @_mask: shifted mask defining the field's length and position
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  108   * @_val:  value to put in the field
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  109   *
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  110   * FIELD_PREP() masks and shifts up the value.  The result should
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  111   * be combined with other fields of the bitfield using logical OR.
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  112   */
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  113  #define FIELD_PREP(_mask, _val)						\
3e9b3112ec74f1 Jakub Kicinski 2016-08-31 @114  	({								\
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  115  		__BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");	\
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  116  		((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);	\
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  117  	})
3e9b3112ec74f1 Jakub Kicinski 2016-08-31  118  

:::::: The code at line 114 was first introduced by commit
:::::: 3e9b3112ec74f192eaab976c3889e34255cae940 add basic register-field manipulation macros

:::::: TO: Jakub Kicinski <jakub.kicinski@netronome.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
