Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E227429AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 22:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693348324; x=1724884324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o45umvMPrKbwAN7jZa4hOL8rwFEgdWOiWmYLe271E7U=;
  b=OgfnA+novoSoVkiqwVlxg3TDgEkvh3EVTB623o+tT+ssorsdc5rfNX88
   rTOpsNPXMKKpfan7qEXz8tgZ2EwGGXQmnxmEooHPIkEBnRiZj5NFFC5qu
   aBnJ9WsxTo5MQpwh8Fc7d3wN2hY/l0LVuQXyopEf8HfmMPyXdHzjbmXMA
   phk4Vd/u3abBIljMYnoulcb7fknJK5g0AlL0uMnJz0fvPyi9ZH55Inxbx
   wOVkt71QrnrYtAWUn+tr4OfhPaloyJxke2aNyf5d3tT0Kba51HPBnkkMa
   nMIOhaqiyiSlBVwTBw+1hIYTyoTuo97PtRqfoRkkDRXkIAdWCQx9sl8x1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="439443727"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="439443727"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 15:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="738876735"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="738876735"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Aug 2023 15:32:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb7Fg-00099D-0F;
	Tue, 29 Aug 2023 22:32:00 +0000
Date: Wed, 30 Aug 2023 06:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6541/11251]
 arch/arm64/kvm/hyp/nvhe/clock.c:39:undefined reference to
 `__kvm_nvhe___lshrti3'
Message-ID: <202308300622.vFMKCQLx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   e44e3955f7e78d5609a5c472bb261adbef142d63
commit: 022b2198fc73b7b95231730eb944d74c7f1b253c [6541/11251] ANDROID: KVM: arm64: Add clock support in the nVHE hyp
config: arm64-randconfig-r023-20230830 (https://download.01.org/0day-ci/archive/20230830/202308300622.vFMKCQLx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300622.vFMKCQLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300622.vFMKCQLx-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
>> aarch64-linux-ld: ID map text too big or misaligned
   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: in function `__kvm_nvhe_trace_clock':
>> arch/arm64/kvm/hyp/nvhe/clock.c:39:(.hyp.text+0x14648): undefined reference to `__kvm_nvhe___lshrti3'


vim +39 arch/arm64/kvm/hyp/nvhe/clock.c

    21	
    22	/*
    23	 * This clock is relying on host provided slope and epoch values to return
    24	 * something synchronized with the host. The downside is we can't trust the
    25	 * output which must not be used for anything else than debugging.
    26	 */
    27	u64 trace_clock(void)
    28	{
    29		u64 cyc = __arch_counter_get_cntpct() - trace_clock_data.epoch_cyc;
    30		__uint128_t ns;
    31	
    32		/*
    33		 * The host kernel can avoid the 64-bits overflow of the multiplication
    34		 * by updating the epoch value with a timer (see
    35		 * kernel/time/clocksource.c). The hypervisor doesn't have that option,
    36		 * so let's do a more costly 128-bits mult here.
    37		 */
    38		ns = (__uint128_t)cyc * trace_clock_data.mult;
  > 39		ns >>= trace_clock_data.shift;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
