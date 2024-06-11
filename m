Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698AC17578
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 02:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718071498; cv=none; b=NU5tzmZ5LXTHVuH/rppNNQ+Uh7OBzZjfcIuIKq0+n2TiLeyah+Vm9RII7IgmwHNOOkiVwUPQjSG6AI5HNXAVXYB5kSwz/Yv8v4M1v3t5Mq5Ca3v1oaCUynZz5nm6NSE7C9VevkpuvRCYuNRLXfvbyrSrUCl+KKUTV5MWV/hE60k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718071498; c=relaxed/simple;
	bh=jIw2bKDp8ss8BV0kmdiPx/7a6sKRUAMaxlYTVIf369Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jtd7IovyE5imHvlmYrrGva292hSwRcXJb48XwnrXoUCN2Wq6CmRDLkHwksZthDugM2uTHfxBG/asS/gnW1aewhb6ovjwR7azpET1d/iir/Uib0sLrGkIcSW/ulvHi8kvGaOFBTQHuucMbr5qTqJ7FNvueSBNz5ZV4EXj0++Cg4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoY5Kj98; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoY5Kj98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718071497; x=1749607497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jIw2bKDp8ss8BV0kmdiPx/7a6sKRUAMaxlYTVIf369Y=;
  b=eoY5Kj98H5dAxy/9wUsI+faiUwBfQ/2MHQOjjqHkZKdls4mc6RFfS/QF
   MXyt4OWPCNadbDe6iXVmo03ngDUUTSMCWmhZpilkdpmd66XJV2CBCd0pl
   DkZRW4X27Yc5wW33r/xOJZ06Sz6rqF7Vs/lCS2TjVehEIdlFjrj2K7xYW
   jbwHsdxZuGNHTB6Zi1uy5KYQYpkTTriSv629t8Q/RTHqoIWDhasdCUQwv
   O4RhS6zTejluJGU/lBpjGm/gjP3X5KMD2Xj5jJuSK1VPrpMgkMMlpohZ8
   Dk6Ram6gcztWGvkAf/WIbUuDPqBQpgzNgzDB7JfInnLr0v7e6GUtt5yqe
   A==;
X-CSE-ConnectionGUID: HbN0H5yLRyO4EO/nxqULKQ==
X-CSE-MsgGUID: AfBl5t3VSR6xRJiSnnG+0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14910501"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14910501"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 19:04:56 -0700
X-CSE-ConnectionGUID: mY+JX4VzQQq756AZ3kWX4Q==
X-CSE-MsgGUID: enVoAXmsSZSwmjXHd+K/jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39247748"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jun 2024 19:04:55 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGqsW-0002g5-2c;
	Tue, 11 Jun 2024 02:04:52 +0000
Date: Tue, 11 Jun 2024 10:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Wang <foxywang@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [kvm-x86:generic 7/9] include/linux/kvm_host.h:2106:5: warning: no
 previous prototype for 'kvm_init_irq_routing'
Message-ID: <202406111054.tfC7sg5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kvm-x86/linux generic
head:   96545c0ccf1cdcbeeaca77399af27da12da6c833
commit: 2207798ccd0adc8995a71f93fd77c8ece3eb330a [7/9] KVM: Setup empty IRQ routing when creating a VM
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240611/202406111054.tfC7sg5g-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111054.tfC7sg5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111054.tfC7sg5g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/kvm_ppc.h:19,
                    from arch/powerpc/include/asm/dbell.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:36:
>> include/linux/kvm_host.h:2106:5: warning: no previous prototype for 'kvm_init_irq_routing' [-Wmissing-prototypes]
    2106 | int kvm_init_irq_routing(struct kvm *kvm) {}
         |     ^~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h: In function 'kvm_init_irq_routing':
>> include/linux/kvm_host.h:2106:44: warning: control reaches end of non-void function [-Wreturn-type]
    2106 | int kvm_init_irq_routing(struct kvm *kvm) {}
         |                                            ^
--
   In file included from arch/powerpc/include/asm/kvm_ppc.h:19,
                    from arch/powerpc/include/asm/dbell.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:36:
>> include/linux/kvm_host.h:2106:5: warning: no previous prototype for 'kvm_init_irq_routing' [-Wmissing-prototypes]
    2106 | int kvm_init_irq_routing(struct kvm *kvm) {}
         |     ^~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h: In function 'kvm_init_irq_routing':
>> include/linux/kvm_host.h:2106:44: warning: control reaches end of non-void function [-Wreturn-type]
    2106 | int kvm_init_irq_routing(struct kvm *kvm) {}
         |                                            ^


vim +/kvm_init_irq_routing +2106 include/linux/kvm_host.h

  2104	
  2105	static inline void kvm_free_irq_routing(struct kvm *kvm) {}
> 2106	int kvm_init_irq_routing(struct kvm *kvm) {}
  2107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
