Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9592F5311
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 01:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750208560; cv=none; b=AUJb2OEiu26TZplz5ujzjnSMNbpI8B7qeXc9iFlOskNATAApD+Xcyo1i/KEaaAE5cS0eVJqa4RQtGDNSd9eyJaX8xMLLTJPkTd2KQhkv0ieG8B0ZVauKLiKHC62QRVRuzIQ2VRvGJVApaEGZhWpZmRq2xpm3gB7UYic2YL0VBzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750208560; c=relaxed/simple;
	bh=+iBhewKxw6qplHpqULN+ImD5snFP0XkL4TYedjG3nSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rXQ6y1a++BK7qU02pLOaZaLibgOBwzm3wR5HJV++9N7G6MfD/cs/YBP85PIp+lumugeGqD26YlERh/uF3lREbhczbq3d1XTIduzP9+E8qFNX0wa9pBKLJLY7Iyb38lanrVyDPni5gDIfp9JhKJFY8/VpduggsHxNO+3HhrOLl0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwqD2+Wi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwqD2+Wi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750208559; x=1781744559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+iBhewKxw6qplHpqULN+ImD5snFP0XkL4TYedjG3nSg=;
  b=CwqD2+WiW5jiQzStciWeZh8X6TcrbG2HYD5aVcspgVbeJP/Czc8De6OB
   ZblKBtB2qc67M0VBL2db3KcxR2QaROquGdlGAWdeiNC8DOPCbct6CBDM5
   DUQDkYWm05EXw7/P37O4PM0dnR2h1bIXK87HYK/RJUzlvlJd4yX/9AZDD
   dvJSjkojAaDZNjMQKcHz8J7ZxSkUUeKEtn57i1/x7thsh//BnOQzw41aR
   46S4fEZtougnwhnnj9WSGCChjdebsAc2+I09zjOHz+8pR3ehN6/HkgYxv
   aIBlgLdKY0orENrkAuKFm6CuGsK3GxjKI3IOe2lcZeqAzLKxk5s37/QOE
   A==;
X-CSE-ConnectionGUID: mUvEWF5VToWMXGdo71SZhA==
X-CSE-MsgGUID: It7yqcMQSQewav+5AYdRug==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52547550"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52547550"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 18:02:38 -0700
X-CSE-ConnectionGUID: tJwnTueJTnWIVbyK4Vrddw==
X-CSE-MsgGUID: QK4LX+8YTFinDs5ce3sWfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="149047544"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jun 2025 18:02:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRhCF-000JGW-01;
	Wed, 18 Jun 2025 01:02:35 +0000
Date: Wed, 18 Jun 2025 09:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/gicv5-v5 28/28]
 drivers/irqchip/irq-gic-v5-its.c:941:30: warning: variable 'its' set but not
 used
Message-ID: <202506180844.cc0B5lTd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lorenzo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/gicv5-v5
head:   93e6020b4a68410920bb2759fdd64639b59857db
commit: 93e6020b4a68410920bb2759fdd64639b59857db [28/28] arm64: Kconfig: Enable GICv5
config: arm64-randconfig-002-20250618 (https://download.01.org/0day-ci/archive/20250618/202506180844.cc0B5lTd-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180844.cc0B5lTd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180844.cc0B5lTd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v5-its.c:941:30: warning: variable 'its' set but not used [-Wunused-but-set-variable]
     941 |         struct gicv5_its_chip_data *its;
         |                                     ^
   1 warning generated.


vim +/its +941 drivers/irqchip/irq-gic-v5-its.c

dac392cbeba5af Lorenzo Pieralisi 2024-10-03  935  
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  936  static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  937  				      unsigned int nr_irqs, void *arg)
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  938  {
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  939  	u32 device_id, event_id_base, lpi;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  940  	struct msi_domain_info *msi_info;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03 @941  	struct gicv5_its_chip_data *its;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  942  	struct gicv5_its_dev *its_dev;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  943  	msi_alloc_info_t *info = arg;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  944  	irq_hw_number_t hwirq;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  945  	struct irq_data *irqd;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  946  	int ret, i;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  947  
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  948  	its_dev = info->scratchpad[0].ptr;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  949  	device_id = its_dev->device_id;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  950  
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  951  	msi_info = msi_get_domain_info(domain);
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  952  	its = msi_info->data;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  953  
ffca573d670e39 Lorenzo Pieralisi 2024-10-08  954  	ret = gicv5_its_alloc_eventid(its_dev, info, nr_irqs, &event_id_base);
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  955  	if (ret)
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  956  		return ret;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  957  
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  958  	ret = iommu_dma_prepare_msi(info->desc, its_dev->its_trans_phys_base);
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  959  	if (ret)
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  960  		goto out_eventid;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  961  
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  962  	for (i = 0; i < nr_irqs; i++) {
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  963  		lpi = gicv5_alloc_lpi();
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  964  		if (ret < 0) {
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  965  			pr_debug("Failed to find free LPI!\n");
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  966  			goto out_eventid;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  967  		}
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  968  
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  969  		ret = irq_domain_alloc_irqs_parent(domain, virq + i, 1, &lpi);
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  970  		if (ret)
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  971  			goto out_free_lpi;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  972  
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  973  		/*
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  974  		 * Store eventid and deviceid into the hwirq for later use.
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  975  		 *
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  976  		 *	hwirq  = event_id << 32 | device_id
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  977  		 */
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  978  		hwirq = FIELD_PREP(GICV5_ITS_HWIRQ_DEVICE_ID, device_id) |
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  979  			FIELD_PREP(GICV5_ITS_HWIRQ_EVENT_ID, (u64)event_id_base + i);
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  980  		irq_domain_set_info(domain, virq + i, hwirq,
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  981  				    &gicv5_its_irq_chip, its_dev,
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  982  				    handle_fasteoi_irq, NULL, NULL);
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  983  
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  984  		irqd = irq_get_irq_data(virq + i);
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  985  		irqd_set_single_target(irqd);
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  986  		irqd_set_affinity_on_activate(irqd);
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  987  		irqd_set_resend_when_in_progress(irqd);
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  988  	}
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  989  
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  990  	return 0;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  991  out_free_lpi:
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  992  	gicv5_free_lpi(lpi);
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  993  out_eventid:
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  994  	gicv5_its_free_eventid(its_dev, event_id_base, nr_irqs);
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  995  
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  996  	return ret;
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  997  }
dac392cbeba5af Lorenzo Pieralisi 2024-10-03  998  

:::::: The code at line 941 was first introduced by commit
:::::: dac392cbeba5af44e834c5ab4d1cbec318654fd5 irqchip/gic-v5: Add GICv5 ITS support

:::::: TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
:::::: CC: Lorenzo Pieralisi <lpieralisi@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
