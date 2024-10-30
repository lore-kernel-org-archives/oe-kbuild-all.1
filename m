Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2981BD9DB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 19:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730316755; cv=none; b=qM2S13fw/IPQhXMWubYKofTO1HfcN9xXO5ETY86grLSNjnOfHROMGsAfzeA9XrD8bINT492kkXla/EskqJTzffux5EdXxwcYsypGREocCIRotJ7nwc+i2XIsoN9inJVQUrDEtTXtMkhDeOPXYUql0M8zzjvY+gQNAuMXPZZE0AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730316755; c=relaxed/simple;
	bh=AfOtZ7kIluqU4q4WWWEi8/u+/+o1y+rhkRXigyugOUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BBGecbRmxGe9ILtlk7lFkspfxpTukRzcqt50ut7e2faGWSoaChUCNQeYznBYhkQCyHhB4v+lPPxqQgZI275BMFvqa1ZYA7W78zk776zgks8Tc+dGcz4N2dxfs2r1u8gyD3k0sQHshdCKwMRLYpPCT0n7AWRhn8xVB8FGQ45gKRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flHjxmFS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flHjxmFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730316753; x=1761852753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AfOtZ7kIluqU4q4WWWEi8/u+/+o1y+rhkRXigyugOUY=;
  b=flHjxmFSRAgljxtVXxoAzJ+6rpYFEYwa6fOBoR5nVqJd6D/bmylKjDJy
   S6bc2MGfMRFVrRRqASeaDwvJ7r3YRj2+HDNv+qbmdXGoRudeET1M4gJY8
   rEwl5B9CIPvOHXifebbDmXC3Yc+kZ7pSAsQZIwOhjc7D0+UOTo87/LOKO
   vf1RviTd6MdIurkC5QU6MyqkqvKH9fcD8zlGd/MmUoSRq2BXepvnjNnL1
   p81olNcs+HJwEyPbpuhw3i7SzCrCkad+R76YVfkePcpIWLlPhjD7En1JZ
   k1kvJqM2YNk91YoI/O8l5KXaHA2G+1Y5fdeGgmQ5nXsBmJqb5kCevIevu
   g==;
X-CSE-ConnectionGUID: sIzTPyCcSsGi3XTTewCrxA==
X-CSE-MsgGUID: eWaLSW6WSc6rLolDvOil/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40573690"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40573690"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 12:32:33 -0700
X-CSE-ConnectionGUID: uN4nm01tQWewpX79kCYUEQ==
X-CSE-MsgGUID: ydUilZPORlqZC+JF6Qc8Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="83234140"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2024 12:32:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6EQe-000fEw-2Q;
	Wed, 30 Oct 2024 19:32:28 +0000
Date: Thu, 31 Oct 2024 03:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6541/26413]
 arch/arm64/kvm/hyp/nvhe/clock.c:39:undefined reference to
 `__kvm_nvhe___lshrti3'
Message-ID: <202410310347.NQunIQ3S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   19b68814b1cd60c40546f31f7cc5b7895c0b013b
commit: 022b2198fc73b7b95231730eb944d74c7f1b253c [6541/26413] ANDROID: KVM: arm64: Add clock support in the nVHE hyp
config: arm64-randconfig-002-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310347.NQunIQ3S-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310347.NQunIQ3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310347.NQunIQ3S-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
>> aarch64-linux-ld: ID map text too big or misaligned
   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: in function `trace_clock':
>> arch/arm64/kvm/hyp/nvhe/clock.c:39:(.hyp.text+0x13b98): undefined reference to `__kvm_nvhe___lshrti3'


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
