Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D6957C9F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 16:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107738; cv=none; b=lCmwzzQOFOJzn00DEkHL0EWQb+a//JgVKFu9hzgGh0qaDYtcbjeusmyjaiGzG/TML8EFcLLuWpIMONgvWDIvb2/xXmtoy3FPl5ebQoRtPeoeFeJuMiP/QEG0IwkS9S2G0yNXGwn1a/TWipERMBWujrrxIyu75e7mi751g79NWXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107738; c=relaxed/simple;
	bh=kb9eQCla6K+1PxoWHtudOX5c8IjGGN3cVw2ah/+Dy3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QrhiV4euJgjFSlmCspfMWpPHLLq4Ho3L9qr42A/juwEXdaaS3Xr1kHx0wDeBoGWNCaAjnNJ1EFwudOF3moQ8oTC424/YyKLOEbwx2EV/OOby5zRRaWWuz4gctp4P9ojd+xPZv6S5yi3F2QlbNVfYDyCLopa0foDya4+DGQzoBUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1vTxg8i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1vTxg8i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734107737; x=1765643737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kb9eQCla6K+1PxoWHtudOX5c8IjGGN3cVw2ah/+Dy3M=;
  b=N1vTxg8i8ElAdYOx9D49tHjUFbMh2nQRa8R6RAX11QV0ZL8ZU8ZHJmJu
   ffcN/PablC2Td0+DNWSqsxZi81jcomYQx49sLfD1YXYlyfi4ckrHZd1bT
   k7sE353cgFEgkHEPrLu1xd7YEldayjHACx+goU8iUDiW/BVTRDCYorV2O
   NYnVPkYhb1bMq8hVbuoxAOGLqhZZw6zuITmoQTMCc4zDHkUJP3bAE6RkQ
   VJJbnX4Px6sHBreq7vkIPylNvF8yVev9jQU2LRugXKWuh8IJWSTSE7fEX
   h3HwH04plHb0mFI1MzRetiF0QxlnuW0Wb7yAC0GSTXJMm+5+5amdvzMGX
   Q==;
X-CSE-ConnectionGUID: fJpjQHJZR62Mn0Flj2V9Fw==
X-CSE-MsgGUID: qYizLABZRq6vTPcxMtEa2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45041243"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45041243"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 08:35:36 -0800
X-CSE-ConnectionGUID: CTa/rgeHTjulVRUf1si9Cw==
X-CSE-MsgGUID: Bq/HodgFQ+OHKXYLtkesuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97366854"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2024 08:35:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tM8dY-000CEf-0b;
	Fri, 13 Dec 2024 16:35:32 +0000
Date: Sat, 14 Dec 2024 00:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1636/1636]
 arch/loongarch/kvm/intc/pch_pic.c:459:16: warning: variable 'ret' set but
 not used
Message-ID: <202412140030.ws7cfuVO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d68dc6ee371ec5466be9b2d76bdca0b360940adc
commit: bd254ad9ed5fb35dc87b90f98ebb805567ff0472 [1636/1636] LoongArch: KVM: Add irqfd support
config: loongarch-randconfig-001-20241213 (https://download.01.org/0day-ci/archive/20241214/202412140030.ws7cfuVO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140030.ws7cfuVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140030.ws7cfuVO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kvm/intc/pch_pic.c: In function 'kvm_setup_default_irq_routing':
>> arch/loongarch/kvm/intc/pch_pic.c:459:16: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     459 |         int i, ret;
         |                ^~~
--
>> arch/loongarch/kvm/irqfd.c:81: warning: Function parameter or member 'e' not described in 'kvm_set_msi'
>> arch/loongarch/kvm/irqfd.c:81: warning: Function parameter or member 'kvm' not described in 'kvm_set_msi'
>> arch/loongarch/kvm/irqfd.c:81: warning: Function parameter or member 'irq_source_id' not described in 'kvm_set_msi'
>> arch/loongarch/kvm/irqfd.c:81: warning: Function parameter or member 'level' not described in 'kvm_set_msi'
>> arch/loongarch/kvm/irqfd.c:81: warning: Function parameter or member 'line_status' not described in 'kvm_set_msi'


vim +/ret +459 arch/loongarch/kvm/intc/pch_pic.c

   453	
   454	static int kvm_setup_default_irq_routing(struct kvm *kvm)
   455	{
   456		struct kvm_irq_routing_entry *entries;
   457	
   458		u32 nr = KVM_IRQCHIP_NUM_PINS;
 > 459		int i, ret;
   460	
   461		entries = kcalloc(nr, sizeof(*entries), GFP_KERNEL);
   462		if (!entries)
   463			return -ENOMEM;
   464	
   465		for (i = 0; i < nr; i++) {
   466			entries[i].gsi = i;
   467			entries[i].type = KVM_IRQ_ROUTING_IRQCHIP;
   468			entries[i].u.irqchip.irqchip = 0;
   469			entries[i].u.irqchip.pin = i;
   470		}
   471		ret = kvm_set_irq_routing(kvm, entries, nr, 0);
   472		kfree(entries);
   473	
   474		return 0;
   475	}
   476	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
