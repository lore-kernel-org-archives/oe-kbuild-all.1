Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3702224D7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 20:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715459549; cv=none; b=RkZ+llH4zwtNYmNijKfG1h6/zuVLZK/6zAcJsISCRLQA5TrViTYAypMAsSw58Ydpq02BcKKqSHwh4ONur+5MjLLx4ulkmuPC5zAZQC6nciS/66/6W5ZkYDOM/M4isA5WWO+OToFqnq1zeyhOQUhxXPQKXzmTsqr0HPTDUbqKZpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715459549; c=relaxed/simple;
	bh=KZwk5HhhG3XPKDgASfzGWdXAs8Ym3OazE2YbuGDQn+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ri+xYFZlcipFLLLpAJlntFPE5U5mhn58+2hPQTroH1yxe0ipH9zn28iGiwRWdQR56+UNg0bRdpJzQpXrhlFbflLo3xliS9210qS088P/QmS69yg0mrTmOcRy9NR8PLiEkUQEZO20FrG78dNdYNAFQ7WETY0X/df9PKYHs1X/Iqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ih56ld1U; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ih56ld1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715459547; x=1746995547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KZwk5HhhG3XPKDgASfzGWdXAs8Ym3OazE2YbuGDQn+Q=;
  b=ih56ld1UOVMgDwYepOIIOyRZg2BbK0k81uTgollB8Pkw/uv7kRit/lJU
   +hEvmOjZfMpgXXvRoFWuuYpv56cIpAJcGrytRFtOOitEK41jt03qgVJbo
   2Za+yW3JBLdHtRDV7vo/sUCTHz6wIruwbgHg9oMHrUTYauKpr/Fgl8aSh
   29T9HAVqhb2XwSjglRv+yx/xcorUK85nkBjplOQZk6m45fvH6mbLSNwoE
   j5tzHAVRdbvimOUJi68fCrQerNWMByp4Pc95U3ko9RyTVJBXAbH6eX/31
   QJENsSSUkCImskTb7DIbhgtJmdsrZnCMrKXpJR4XvPpZJJBVoegX1RUna
   A==;
X-CSE-ConnectionGUID: 7R2KmfBpQw6xLwWNDQKGJQ==
X-CSE-MsgGUID: Z7jiJLkmTm65RM+2eLu/Fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="15231213"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="15231213"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 13:32:25 -0700
X-CSE-ConnectionGUID: NIAQDp7ISo688fs+RvQ1pA==
X-CSE-MsgGUID: cp26mi2XRaq32NmgKIlEgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="34491774"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 May 2024 13:32:23 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5tOG-0007oZ-2W;
	Sat, 11 May 2024 20:32:20 +0000
Date: Sun, 12 May 2024 04:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hao Chen <970353908@qq.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9538/9601]
 arch/arm64/kvm/vgic/vgic-mmio.c:266:38: warning: variable 'is_pending' set
 but not used
Message-ID: <202405120422.ZROC7rNv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   15bef328224e70041aba4aaa6b23977efba191a9
commit: cb0003ae0500bb69eefa2275722d08bc39a0f157 [9538/9601] irqchip: gicv3: Add workaround for hip09 erratum 162200806
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240512/202405120422.ZROC7rNv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405120422.ZROC7rNv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405120422.ZROC7rNv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-mmio.c: In function '__read_pending':
>> arch/arm64/kvm/vgic/vgic-mmio.c:266:38: warning: variable 'is_pending' set but not used [-Wunused-but-set-variable]
     266 |                                 bool is_pending;
         |                                      ^~~~~~~~~~


vim +/is_pending +266 arch/arm64/kvm/vgic/vgic-mmio.c

   230	
   231	#define VIRTUAL_SGI_PENDING_OFFSET	0x3F0
   232	static unsigned long __read_pending(struct kvm_vcpu *vcpu,
   233					    gpa_t addr, unsigned int len,
   234					    bool is_user)
   235	{
   236		u32 intid = VGIC_ADDR_TO_INTID(addr, 1);
   237		u32 value = 0;
   238		int i;
   239		struct its_vpe *vpe = &vcpu->arch.vgic_cpu.vgic_v3.its_vpe;
   240	
   241		/* Loop over all IRQs affected by this read */
   242		for (i = 0; i < len * 8; i++) {
   243			struct vgic_irq *irq = vgic_get_irq(vcpu->kvm, vcpu, intid + i);
   244			unsigned long flags;
   245			bool val;
   246	
   247			/*
   248			 * When used from userspace with a GICv3 model:
   249			 *
   250			 * Pending state of interrupt is latched in pending_latch
   251			 * variable.  Userspace will save and restore pending state
   252			 * and line_level separately.
   253			 * Refer to Documentation/virt/kvm/devices/arm-vgic-v3.rst
   254			 * for handling of ISPENDR and ICPENDR.
   255			 */
   256			raw_spin_lock_irqsave(&irq->irq_lock, flags);
   257			if (vgic_direct_sgi_or_ppi(irq)) {
   258				int err;
   259	
   260				if (irq->hw && vgic_irq_is_sgi(irq->intid) &&
   261				    (kvm_vgic_global_state.flags &
   262				     FLAGS_WORKAROUND_HIP09_ERRATUM_162200806)) {
   263					void *va;
   264					u8 *ptr;
   265					int mask;
 > 266					bool is_pending;
   267	
   268					mask = BIT(irq->intid % BITS_PER_BYTE);
   269					va = page_address(vpe->vpt_page);
   270					ptr = va + VIRTUAL_SGI_PENDING_OFFSET +
   271					      irq->intid / BITS_PER_BYTE;
   272					is_pending = *ptr & mask;
   273				}
   274	
   275				val = false;
   276				err = irq_get_irqchip_state(irq->host_irq,
   277							    IRQCHIP_STATE_PENDING,
   278							    &val);
   279				WARN_RATELIMIT(err, "IRQ %d", irq->host_irq);
   280			} else if (!is_user && vgic_irq_is_mapped_level(irq)) {
   281				val = vgic_get_phys_line_level(irq);
   282			} else {
   283				switch (vcpu->kvm->arch.vgic.vgic_model) {
   284				case KVM_DEV_TYPE_ARM_VGIC_V3:
   285					if (is_user) {
   286						val = irq->pending_latch;
   287						break;
   288					}
   289					fallthrough;
   290				default:
   291					val = irq_is_pending(irq);
   292					break;
   293				}
   294			}
   295	
   296			value |= ((u32)val << i);
   297			raw_spin_unlock_irqrestore(&irq->irq_lock, flags);
   298	
   299			vgic_put_irq(vcpu->kvm, irq);
   300		}
   301	
   302		return value;
   303	}
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
