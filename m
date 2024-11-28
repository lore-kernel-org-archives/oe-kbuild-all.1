Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D5D85628
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732782132; cv=none; b=M3VBrqjubNsiE01KxFtx/GfOg8+2FYkS7zUak0v6NkKaVfaZ0/gNtsV2iYsDuIQw6FlXLZPmkLEwY9HIO7EnSLnhSylh1oM2onpBe/Iy3gHxrmDVRJfEBKnvgIkP37a5GcP8jf6Wu740Xcq7iGZNEeM3Em/FuJnERoK5uVlNEOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732782132; c=relaxed/simple;
	bh=L5YLN2hu5ys5a83RxSbEwazaWouQf26CjAMBqyoOOqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A7R1i0WXBx9r2asf0Nugr0DpAeNzOfPwvcBy0/vbZ60vls6B+lHVEZOBUNYwvcJSkTJmndWuoSAvaTan00+dVi8DuDnw0JygreDLcV3AAjfRFj5JUthikvfVVWG2gv23SCYUXKMZRglN8P+yZz544wXACbVhuT/Zw1//RaZwSI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAmH7n7k; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAmH7n7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732782130; x=1764318130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L5YLN2hu5ys5a83RxSbEwazaWouQf26CjAMBqyoOOqo=;
  b=iAmH7n7kQf0cYwYRTlwEg74enHv1vvzKCOyZaR5/6Ew2v9osvKhp5vmI
   rofIoKAnaTHdVOTdJxB88R4NYWBcet7cEbWuntOstELnTxSp6rgYQrU0q
   Uxu+c0K1AKqbXaemHa3nThp/YgioNtaqQnsEbxkHNUmQbAnfYyM14pEAC
   wT//gwUUro/BgRku0azCo/BCvSV/zi2R9FACvmcunZlLjIRXWfnhLjkIA
   6ebGpu/mlIdnGOxannRHy3sqrx1Mmfn8ppPmM7tw0pDzeukh6AVb4WunD
   jCrlcLvJprUGFy344Lh9amlDqOFH2SUIUbhJxoH4yIJJRiyYm7tk9EwYQ
   Q==;
X-CSE-ConnectionGUID: Jk6wC0ofRMmOQi9SnjczIg==
X-CSE-MsgGUID: uih1F77cSqqhlfhj8yi5WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="36931512"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="36931512"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 00:22:10 -0800
X-CSE-ConnectionGUID: +/lL70HvSfmPHz9llzi3jQ==
X-CSE-MsgGUID: /UwIbFJ8RIm44b/2nqMFVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="129675775"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Nov 2024 00:22:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGZmo-0009L5-2E;
	Thu, 28 Nov 2024 08:22:06 +0000
Date: Thu, 28 Nov 2024 16:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1546/1546] kernel/irq/proc.c:334:13: warning: no
 previous prototype for function 'register_irqchip_proc'
Message-ID: <202411281629.stNRSuEn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5d0b95afdce7e316c8df2aac1a9d83f257e09297
commit: 3053668e6b211924bb67c19d791a5a532eca2ad8 [1546/1546] arm64: Introduce Xint software solution
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241128/202411281629.stNRSuEn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281629.stNRSuEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281629.stNRSuEn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/proc.c:334:13: warning: no previous prototype for function 'register_irqchip_proc' [-Wmissing-prototypes]
     334 | void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
         |             ^
   kernel/irq/proc.c:334:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     334 | void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
         | ^
         | static 
>> kernel/irq/proc.c:335:13: warning: no previous prototype for function 'unregister_irqchip_proc' [-Wmissing-prototypes]
     335 | void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
         |             ^
   kernel/irq/proc.c:335:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     335 | void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
         | ^
         | static 
   2 warnings generated.


vim +/register_irqchip_proc +334 kernel/irq/proc.c

   333	
 > 334	void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
 > 335	void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
