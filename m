Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857184;
	b=n9VMVgnZxRmXxMrED97C3stjVmoCe+T/lRXATdjb80sH29UoQnUsgmMtqwS3MPuG56Kt
	 vFYMfYlEQoYVjudOhq7FEK9GsdLd3Dmjppx9Q5emA+Grdg7VN7Yt3lETAPGrlEnTDSebe
	 2ESpwq64j7RdyJT/IIsRFJQ9CfhXFS5ya6XK5FYQDjpID4+QslECQqSD6tn1esHuPwnkB
	 SgHyNDM8K7DlEgixaGEKhyAaGKE+vyuGoo2UfeSFIKohsbwhj9oq4WOE/U2Bpbv2fcrz0
	 zNspATYo7R0xpQUQifxVw4wgza/wO9HVhmGSLqpB7fJYIVCOcHTxgTovhl8k68vbljw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=RiKLCCHXrKouJKGgmvGdShWyJEpyaPvWqrasOaZl+Qk=;
	b=D6UgXtKN3f2rP41nRW1pUlShlAHbuNRSCNowK+lPwc/sVr7rpB0+quad567rdvZ0MRWJ
	 036A+KHjegGVT1zaQL82ELmZey8jrXXDGUM/7DAqgNtQyv8fg+QgeL2hIE1/iGeLUCXW+
	 +W+ebZ8WxGf72a6RTxxeIp8Y2re3YDc9nRT6biwjICyPnM5rmI3ezBP0lEZXN0sCscR6V
	 s4cbegi5kUREmVynO730Y5knVJXyEjNE8OCisS3LTWXEGUzNnHNPVA6SIfK2IyKe8xpeD
	 Zi7YRXI7+wmlPev5MAnCr94NCNuDcufguQSv43QSrxVWY7hmbO5UP9fIdOnUr/PFsGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRsGcGo0;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C697606A328
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 05:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C697606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRsGcGo0
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so11820085e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Nov 2026 21:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793857182; x=1794461982; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiKLCCHXrKouJKGgmvGdShWyJEpyaPvWqrasOaZl+Qk=;
        b=NRsGcGo03ILEQRj4yMBkXX4lWGToaf6QCyxv7kqaKrzoWB+6V2dN4T9xCaJSHP34Pl
         j4IpqAArCy6YNtmccc2gFmDORrYxMHAC/9x5AdPIOjjVJ1oGEzDldKM9OU9MozEi/OkM
         xGD79NUh/Nyee7lc4ya6ottpDsTUVGYWxTntfOETq1E1UsfA6OyWlJZB/i6ROpjWljtE
         y2DdZD/QnP0K4Ko5z+OtDgA7n/JEtSTbASNBbt/6Eq3txY55XC1hkuaPno7hnwHqbzpX
         QlbZ/kpYTisLxEMm8XXxVqvnDay/r+OABtHQqlNnZ0RJ1MFtRlk/vyhsNZWCrxselx4W
         vuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793857182; x=1794461982;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RiKLCCHXrKouJKGgmvGdShWyJEpyaPvWqrasOaZl+Qk=;
        b=m+erGtoPhTmGaVW+ZcrRfak0JJWQIkjSXn8n/YSwtNOTom63pprXD3GOUZEHBbQqTL
         bAHJYhGcb/h6fPy5wjuwx17lj2s1F694ugSLtj3xnL/AawoomVNq4iD71ISFol1geZfU
         up5l6No62y53P1dDyFBT8PZvjAIlpvbuBTJAyQIy/zulpLusx6ZwyziYSsercM5M6Rtq
         147HqgUDM9RU1Kvfa8H6/InSoTRRZEk11XLbbKJQeCsCEWC8Wb/5QgX40CxBvkChZw6D
         +8iJQxE07Jw6zh0sVHEEmXec4UM9aA4rJTVg+fkMV3ZFeykxFsSQKO6Pi0C0ONRSjWff
         5KtQ==
X-Forwarded-Encrypted: i=1; AKwUvByExINFX/Gc8nxNyIgJDizhq7V6KBejLu2r6Q/PqaKAk88OiJ9OgQAzf0NSl0wZtS7Kfrkdsf6ULTu1oqy2@lists.linux.dev
X-Gm-Message-State: APuU4Z/xYcjq3y9yQkDxTce4j3dkHy6bjwSZ0+9K8RLAFOhtX37PlTQE
	x8inLnYde0Iko7gEoxcfmtegqARXY/0+ZVs67WnKElSFL2wobY4q8qqY
X-Gm-Gg: AYBFou2PBEfW2y8N5Wfc30dNL/g+AWKqbgulNsmydVEXA51rFWlWX16z9kM2YIwVm5o
	2jLDpdIWTUX+QvN8Q449h4I/Okii0Q5XbEoeZr3V7rn2StRSOKcIEaablynvlLxqf7mgNgVfOyS
	TgVZZyFxFqYLoOS85/9a4luUHSwb3lljXVCo1lTERW6NXY0csJupiuWcRWn6gmuUXpkZ/9RP/QC
	a8ewM1RQIHuWK3YT1egAHIBr7brEuNUP4H3Zv1Fkd+zwft7ImnWjL7vfw2ujz799abmtK1AEKGM
	P9WAfXTYqdJHJxThexsdWDWAIbJEtms4HPyGhqiHA3TmPShiZNkcw4zMtDvb/YNVGr1efzEjsTr
	LlJGA9tsgdl4Doud4BVqIEwsuaShPgeWMlIP5bds3+9fQkQuSAmP0qIY9RB14y0c3g3cDr5h8dd
	Zlo5xz+8mMzEVt468cS8b7H/HZdixkY/ujRBWnnkwNYv2+oawO5laEO5yUMsqsyeUt1CQ9/TsRz
	Hj5Rz/C7EYDehhAmvUKgNpZZACp2WmxL2pdQXX72TRVryuayXfHOPGZErR+lVmkb3kG0umIVery
	BV9JM5mS/qe25DBt8DQa4mubgE6k6URKQk9zXncKbla2bGzV1F0PBGrsBcMp6snqylK/HImWc7x
	XAAII31THGfdW23LUr2U5Cvxr9aTeqPWRSGAP829Vs8vTx2lfGd1k4AMd2JDM7PWoYpZzqS7yZt
	e27RpDDGZDALA=
X-Received: by 2002:a05:6000:4559:b0:48e:752b:9f90 with SMTP id ffacd0b85a97d-48e752ba019mr24236069f8f.38.1793857182424;
        Wed, 04 Nov 2026 21:39:42 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20935sm7419968f8f.54.2026.11.04.21.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:39:41 -0800 (PST)
Date: Thu, 5 Nov 2026 08:39:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_iommu_misc_v1 27/35] arch/riscv/kvm/aia_imsic.c:711
 __kvm_riscv_vcpu_irq_update() warn: mixing irq and irqsave
Message-ID: <202611042200.NX4mTopN-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_iommu_misc_v1
head:   bfa7a6c4f67f2d4d155c3aa2fbc606e5c5189ca0
commit: ef0d72018fdf0d8d92e9031e7c12f621e1f36d7e [27/35] RISC-V: KVM: Add guest file irqbypass support
config: riscv-randconfig-2200-20261104 (https://download.01.org/0day-ci/archive/20261104/202611042200.NX4mTopN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611042200.NX4mTopN-lkp@intel.com/

smatch warnings:
arch/riscv/kvm/aia_imsic.c:711 __kvm_riscv_vcpu_irq_update() warn: mixing irq and irqsave

vim +711 arch/riscv/kvm/aia_imsic.c

ef0d72018fdf0d Andrew Jones 2026-04-19  665  static void __kvm_riscv_vcpu_irq_update(struct kvm_vcpu *vcpu, bool release)
ef0d72018fdf0d Andrew Jones 2026-04-19  666  {
ef0d72018fdf0d Andrew Jones 2026-04-19  667  	struct kvm *kvm = vcpu->kvm;
ef0d72018fdf0d Andrew Jones 2026-04-19  668  	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
ef0d72018fdf0d Andrew Jones 2026-04-19  669  	gpa_t gpa = vcpu->arch.aia_context.imsic_addr;
ef0d72018fdf0d Andrew Jones 2026-04-19  670  	struct kvm_aia *aia = &kvm->arch.aia;
ef0d72018fdf0d Andrew Jones 2026-04-19  671  	u64 msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia);
ef0d72018fdf0d Andrew Jones 2026-04-19  672  	struct riscv_iommu_ir_vcpu_info vcpu_info = {
ef0d72018fdf0d Andrew Jones 2026-04-19  673  		.gpa = gpa,
ef0d72018fdf0d Andrew Jones 2026-04-19  674  		.msi_addr_mask = msi_addr_mask,
ef0d72018fdf0d Andrew Jones 2026-04-19  675  		.msi_addr_pattern = (gpa >> IMSIC_MMIO_PAGE_SHIFT) & ~msi_addr_mask,
ef0d72018fdf0d Andrew Jones 2026-04-19  676  		.group_index_bits = aia->nr_group_bits,
ef0d72018fdf0d Andrew Jones 2026-04-19  677  		.group_index_shift = aia->nr_group_shift,
ef0d72018fdf0d Andrew Jones 2026-04-19  678  	};
ef0d72018fdf0d Andrew Jones 2026-04-19  679  	struct kvm_kernel_irq_routing_entry *irq_entry;
ef0d72018fdf0d Andrew Jones 2026-04-19  680  	struct kvm_kernel_irqfd *irqfd;
ef0d72018fdf0d Andrew Jones 2026-04-19  681  	unsigned long flags;
ef0d72018fdf0d Andrew Jones 2026-04-19  682  	gpa_t target;
ef0d72018fdf0d Andrew Jones 2026-04-19  683  	int host_irq, ret;
ef0d72018fdf0d Andrew Jones 2026-04-19  684  
ef0d72018fdf0d Andrew Jones 2026-04-19  685  	spin_lock_irq(&kvm->irqfds.lock);

We disable IRQs here

ef0d72018fdf0d Andrew Jones 2026-04-19  686  
ef0d72018fdf0d Andrew Jones 2026-04-19  687  	list_for_each_entry(irqfd, &kvm->irqfds.items, list) {
ef0d72018fdf0d Andrew Jones 2026-04-19  688  		if (!irqfd->producer)
ef0d72018fdf0d Andrew Jones 2026-04-19  689  			continue;
ef0d72018fdf0d Andrew Jones 2026-04-19  690  
ef0d72018fdf0d Andrew Jones 2026-04-19  691  		irq_entry = &irqfd->irq_entry;
ef0d72018fdf0d Andrew Jones 2026-04-19  692  		if (irq_entry->type != KVM_IRQ_ROUTING_MSI)
ef0d72018fdf0d Andrew Jones 2026-04-19  693  			continue;
ef0d72018fdf0d Andrew Jones 2026-04-19  694  
ef0d72018fdf0d Andrew Jones 2026-04-19  695  		target = ((gpa_t)irq_entry->msi.address_hi << 32) | irq_entry->msi.address_lo;
ef0d72018fdf0d Andrew Jones 2026-04-19  696  		if (WARN_ON_ONCE(target & (IMSIC_MMIO_PAGE_SZ - 1)))
ef0d72018fdf0d Andrew Jones 2026-04-19  697  			continue;
ef0d72018fdf0d Andrew Jones 2026-04-19  698  
ef0d72018fdf0d Andrew Jones 2026-04-19  699  		if (target != gpa)
ef0d72018fdf0d Andrew Jones 2026-04-19  700  			continue;
ef0d72018fdf0d Andrew Jones 2026-04-19  701  
ef0d72018fdf0d Andrew Jones 2026-04-19  702  		host_irq = irqfd->producer->irq;
ef0d72018fdf0d Andrew Jones 2026-04-19  703  
ef0d72018fdf0d Andrew Jones 2026-04-19  704  		if (release) {
ef0d72018fdf0d Andrew Jones 2026-04-19  705  			ret = irq_set_vcpu_affinity(host_irq, NULL);
ef0d72018fdf0d Andrew Jones 2026-04-19  706  		} else {
ef0d72018fdf0d Andrew Jones 2026-04-19  707  			/*
ef0d72018fdf0d Andrew Jones 2026-04-19  708  			 * irqfds.lock -> vsfile_lock(read), same order as
ef0d72018fdf0d Andrew Jones 2026-04-19  709  			 * kvm_arch_update_irqfd_routing()
ef0d72018fdf0d Andrew Jones 2026-04-19  710  			 */
ef0d72018fdf0d Andrew Jones 2026-04-19 @711  			read_lock_irqsave(&imsic->vsfile_lock, flags);

So there should be no need to disable it again.

ef0d72018fdf0d Andrew Jones 2026-04-19  712  			if (imsic->vsfile_cpu < 0) {
ef0d72018fdf0d Andrew Jones 2026-04-19  713  				read_unlock_irqrestore(&imsic->vsfile_lock, flags);
ef0d72018fdf0d Andrew Jones 2026-04-19  714  				break;
ef0d72018fdf0d Andrew Jones 2026-04-19  715  			}
ef0d72018fdf0d Andrew Jones 2026-04-19  716  			vcpu_info.hpa = imsic->vsfile_pa;
ef0d72018fdf0d Andrew Jones 2026-04-19  717  			ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
ef0d72018fdf0d Andrew Jones 2026-04-19  718  			read_unlock_irqrestore(&imsic->vsfile_lock, flags);
ef0d72018fdf0d Andrew Jones 2026-04-19  719  		}
ef0d72018fdf0d Andrew Jones 2026-04-19  720  		WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
ef0d72018fdf0d Andrew Jones 2026-04-19  721  		if (ret)
ef0d72018fdf0d Andrew Jones 2026-04-19  722  			break;
ef0d72018fdf0d Andrew Jones 2026-04-19  723  	}
ef0d72018fdf0d Andrew Jones 2026-04-19  724  
ef0d72018fdf0d Andrew Jones 2026-04-19  725  	spin_unlock_irq(&kvm->irqfds.lock);
ef0d72018fdf0d Andrew Jones 2026-04-19  726  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

