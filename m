Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843790;
	b=u3eVaawucKRG6ixVbvlMM6nbhd4uVh1RSyi2K0Tt4O4w+2UKUggRwFwzNR+gj1p0avyX
	 UKVpd+naIyyNrykXFjnM6LjgydKYVLot8dJQduIZwge/VcAprZUBsty7gARAVT62lY4ep
	 /ntpW9QNAwdNuNh12e1ZczQ0hoyOPHYMnWMVEhJT+NKfgFY2Xggjm5NRAtJp0rUKs/fkA
	 b0nSSKbPRhIEwj50C8P+JmPshgczIT2Lf6fG0ayQwSXmsxH73sPwi0plEwqY2O+yyyJ+0
	 6N83r9zolXeZietZqNdbg3cudZhj04DdZXkBaQs7sZfeoBS0xE0LGWRskWJy8OU46ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843790;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=u6Gq9flThtULHh6xNyi8YrXKgqd3TaMLR0PXIDkbobc=;
	b=QP8Wah0YLAzYhjwDP/XSWJj7okIz+kXhfjDpud2eyKXH0HeosSwXzbpIdIOfEc4IPRZ/
	 AFiWhD1h/cJOqZtNgcR2jrAwI8UZUDr7gzNggKFfGBRkluhHdoPCTacbwiW1ZlRmQNG8T
	 zigE6T73dUa+qRPemS9Fc1Pkfr86xC5vJ+Ow3Gp/MFL/URh5qZChzogogflPsu7044py0
	 sEm7Y2tm9FfYJ68GjVSwQsWd96OGyxrr28tt0xJPN9jHzn0GHwecpzx++EL0l3diw+s0y
	 Z8FX8bEGSTUl0rY/QdRQ1k4usTo5sOLW0FBLNPQe+qiiZeGCQIYZX1dcc/aInSJ4XSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NXRfzdMs;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8B4606A32C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 15:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8B4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NXRfzdMs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794843788; x=1826379788;
  h=date:from:to:cc:subject:message-id;
  bh=c6aPnrOuVHLSARRBDLHdGv9LkXaxegiJkbHetnfqmT4=;
  b=NXRfzdMsjewQX9YeiAu+MxVqhOxXbAJpUG7jF9qB6uMn1/6eiHZDOb+T
   h3QawiosG2197xt5zVg+Y5ul/wX7sY1/czVQNwL/WtKXKCnW1xeE9hSCg
   8JsmCPql5knMiuREJB0d8SCjHHzdg17GG8Uc721kfnxf1PZkHsaHJK+XJ
   QayPI/ieqYTXqWIbhUjlhLmIAQo/h+G0ryAVxfrZsQvAP2g+mDTpv6vpZ
   hpeNLsl1SFc02w6k3rUxT04xMx6DjINRE3B+iSVsf036GDzBqnIgqGkak
   tLIAAvfKMFArY9ko+OGYVRSWdWEzXediVrVBsKVOTAxuIdAngs/ANb1kz
   w==;
X-CSE-ConnectionGUID: l04X6ojcTmyjDeGakYMSHQ==
X-CSE-MsgGUID: ADJHSzUUSAyleq6JUo7m9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3573684"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3573684"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 07:43:08 -0800
X-CSE-ConnectionGUID: DUOmxBadQYCoYYoPcwwE+g==
X-CSE-MsgGUID: QwYSINQKTNmj0P4epiEAJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9565869"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Nov 2026 07:43:07 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSyrH-000000002ja-3hbB;
	Mon, 16 Nov 2026 15:43:03 +0000
Date: Mon, 16 Nov 2026 16:42:24 +0100
From: kernel test robot <lkp@intel.com>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sspesa_v2 4/98] arch/riscv/kvm/main.c:37:30:
 warning: result of comparison of constant 9223372036854775816 with expression
 of type 'unsigned long' is always false
Message-ID: <202611161622.aqdYjq0c-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sspesa_v2
head:   6deccfa10a938ba2257b489c067a1928022d510d
commit: c4002f83490c6cd2ffd1ac02fb961b1082a0b1b1 [4/98] RISC-V: KVM: Do not touch the envcfg CSRs on the SiFive P550
config: riscv-randconfig-r2306-20261116 (https://download.01.org/0day-ci/archive/20261116/202611161622.aqdYjq0c-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161622.aqdYjq0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161622.aqdYjq0c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/main.c:37:30: warning: result of comparison of constant 9223372036854775816 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
      37 |             riscv_cached_marchid(0) == 0x8000000000000008ULL) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
>> arch/riscv/kvm/main.c:37:30: warning: result of comparison of constant 9223372036854775816 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
      37 |             riscv_cached_marchid(0) == 0x8000000000000008ULL) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   2 warnings generated.


vim +37 arch/riscv/kvm/main.c

    25	
    26	static void kvm_riscv_setup_vendor_features(void)
    27	{
    28		/* Andes AX66: split two-stage TLBs */
    29		if (riscv_cached_mvendorid(0) == ANDES_VENDOR_ID &&
    30		    (riscv_cached_marchid(0) & 0xFFFF) == 0x8A66) {
    31			static_branch_enable(&kvm_riscv_vsstage_tlb_no_gpa);
    32			kvm_info("VS-stage TLB does not cache guest physical address and VMID\n");
    33		}
    34	
    35		/* SiFive P550 (ESWIN EIC7700X): H on a 1.11 base, no henvcfg/senvcfg */
    36		if (riscv_cached_mvendorid(0) == SIFIVE_VENDOR_ID &&
  > 37		    riscv_cached_marchid(0) == 0x8000000000000008ULL) {
    38			static_branch_enable(&kvm_riscv_no_xenvcfg);
    39			kvm_info("henvcfg and senvcfg CSRs not implemented\n");
    40		}
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
