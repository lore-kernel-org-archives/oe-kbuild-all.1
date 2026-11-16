Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806839;
	b=SHVIKzTddIPr+x+7y7zBJqh83OH1wFfwDskWynu9CDv8nzINQ+Y2sI5SnNBBOoSLNvQ6
	 289pk34suat8/QhWA/HZQB3QQgjd7+mUp4F/k17cj4MrA45/hhA8jE8Unh1WpxuUPpvfu
	 qyszSJP/YHP2JrWjiFLXKJOwvP4ch9UyeK4kb+yerdf+tqQOT3DCndj/tIoJ8S7nxITUu
	 nKRo/GO51vZ3ssQUsgT3nOvtSWEljvfGPwCFz4jc9EMQujY0wvOA8bjHMatIsevwmWX+J
	 yxWLs0JNg0U7+SUizXSbHYJJyzSPmciOOFQdhjL9GXZh3bivyH87AWKNyEhbd7TQSJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=ZOE8GXAOSW5LmYfusUtd1UWIlrbsVn9dk+RMd/mj69g=;
	b=JqTcuecE482pwojLQicsqoyX9KKhR/9PZqzcZgkXCTiQRijlrMeDMGAenr7coPD9eN1U
	 lOz7NcL1FuCV3iXeo3H98FDgzgkCpTb+kS5F5rCdnw0fPsuASYW5KoSUbVgudJFCU82R2
	 5FlWCeWoILM0ZOtDlbv8ioqjZUbQ/OYNr2Q0xuXQywtdvNcIj5/E5w+kEVf3/hP0/WobG
	 Z1JitTKx1gmk+Ucj9H36KDt86ergUGn/ak0gra2aNiCMSZu4kM8P6RUPbTDdL016RcoC2
	 I+fwfkwpOk9/ip6NMFPdTyOazqZkByKifDMe4s6ehFlPSH+Hm7FAB/jGtIWknaCTnCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e0pcrO/U";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1BA606A323
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 05:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F1BA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e0pcrO/U
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1177737f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 21:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794806838; x=1795411638; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOE8GXAOSW5LmYfusUtd1UWIlrbsVn9dk+RMd/mj69g=;
        b=e0pcrO/UrWI8RPULlQ4Pz9hG+hKy1zGCD0WMW/TEQigdv8SkTW6ltDRolx2+ceWxF/
         DYt2s0Fdb89iJTjlgy/OcyL35bIscc180ExPidPsNPbyGEGHTz5LpW1XA99/vf0LDmwd
         h0imDAjJtxOxAwM91Th6C828H11qdY4vlJtd+aCwCqd4f52YXSp9EZ0YqIhjkkXKeBkB
         Yuepo44la2iBCrsTk7qnagXJb4klP3M/BM5ufBL4zq5tpZSJ/7l5nCGvZmgxxLsB4THb
         D1JDxLP/+VJ7MOfvdqbX9c+enIOaVzg6+ZWnn8d0R4xZTfPYoWrSvmAawFnDKvY+AQB4
         mmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806838; x=1795411638;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOE8GXAOSW5LmYfusUtd1UWIlrbsVn9dk+RMd/mj69g=;
        b=PYnQ92MXhyQc+EXcte+t1wESWRnKw50EnAtZkOMSqGn/GfbwcN5i2TlcofR7IAoFfk
         gYC3+5dFQ3kqbZ/X7VB6YdgwMRQM6aNMDys7HE8ZKgD35HFGzLGa+8iXXtHV9Wmsc7iP
         8l0ItZttN569uNE5C4FR6l4OqfxLRqkt0bKI1FB4JZIs4Hjs/JhUyKzb69VkhA5WtMO6
         u/gFZO+3N5R/vDzOGWZIbMzmNA0SIbWT7LjpDOv6pwejm+/L1Qioy6ATYSj7mp04pOc4
         bqY4IOWWnxj/I0D7qUXmd2Bx2L/gplKvG72ntuWb5XsSlSgUyWPsVX8BNKvU0gU8grK5
         fxug==
X-Forwarded-Encrypted: i=1; AL+hErHqXkHbmJhT7GpFpaJKxdPfH6PdkVVXX7BXsq73310esi6X61R+X7zDSdSqlO5QefOeCjT7sA7GeZVnlChQ@lists.linux.dev
X-Gm-Message-State: APuU4Z/tCthYPVJ7ZQhs7CGE1YsRqua0fDi97IQPdeyamDZRCF8i+ek6
	jvh1FgVmHgJVnmzNYQzuh20yL2zXL4duKV7aTIrQUzJD46Am7WrCgBUh
X-Gm-Gg: AYBFou1qFoqUQM49MaS5oJFEBj73Gr1u7dsmw4HBALRdyxew9naG9uYmrwAuMyInxhf
	k2FWlorvDglMHFFvXNatW9olAZIizQdMHFOTKn1djXHGLHKtiKMojistxjRYPjFSclJ42x3MVCO
	PsC7966x9o41EBeWP7pAcN9Xs53UxoqTJWvjH8rL0MrdBnj8a301ZQP9PWJ+Vd1zkSVnP5Iovwe
	A/sNJm2rVZkJ8oqAOhk3AauXMNSCOm6Y+reWKrmC0eqgO/7uH5tLWa3+iWkvuloM7Ewdkr25L2O
	dFROJZDnQ/1C74GhR/oa8O/1X6Jg7napYc9OQ2XWt9XD4HdftPd8uPYh70H2NxjanyS1xNcqNut
	g/AM7XLCd2kMJNFDnFaavTvU55Mrz5PMbvpp9Idunv31aWN66G2gSmOgv8yV0uz4zGtYq8LyQP3
	v1ZjE4N+UNouy0/gS+G5a/NcVcs8PD12Phuddw7UhciEfRch1OZODILY3aGGo6EnTwYHOwGrkiU
	l/EGka0PXV+ci7VtDzQpekW21b27jz1kfOhjc1StgV5p7RhrIB/mXqYFthzbYy0MMa0D/CGEKzH
	MEqTRarriK1WSW+urhalUtBD6GorNth/St4w14nrSKO5yIZXJSUgcmRrEmDX6eOTBqqDwKP7uvH
	PQy01uq+65IrQfqrySIbBLXbZuLm4mjH8Li36DVrhbOc9husNrfsZqSouT6+vousVeEs=
X-Received: by 2002:a5d:64cf:0:b0:493:690c:8364 with SMTP id ffacd0b85a97d-49c6fc9e96amr19530743f8f.3.1794806837659;
        Sun, 15 Nov 2026 21:27:17 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e4a2asm19580683f8f.39.2026.11.15.21.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:27:17 -0800 (PST)
Date: Mon, 16 Nov 2026 08:27:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Pengpeng Hou <hppiscas@163.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [kvm-riscv:riscv_kvm_fixes 1/7] arch/riscv/kvm/aia_device.c:311
 aia_init() warn: missing unwind goto?
Message-ID: <202611132302.clUdzKjd-lkp@intel.com>
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

tree:   https://github.com/kvm-riscv/linux.git riscv_kvm_fixes
head:   46740f9f0fab8ecff4895617c79cec33131b13f0
commit: 235a629ef66ed4e7f88a8946749ed4ff6e3764cf [1/7] RISC-V: KVM: Validate AIA MMIO address ranges
config: riscv-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611132302.clUdzKjd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611132302.clUdzKjd-lkp@intel.com/

smatch warnings:
arch/riscv/kvm/aia_device.c:311 aia_init() warn: missing unwind goto?

vim +311 arch/riscv/kvm/aia_device.c

89d01306e34d6ac Anup Patel          2023-06-15  251  static int aia_init(struct kvm *kvm)
89d01306e34d6ac Anup Patel          2023-06-15  252  {
89d01306e34d6ac Anup Patel          2023-06-15  253  	int ret, i;
89d01306e34d6ac Anup Patel          2023-06-15  254  	unsigned long idx;
89d01306e34d6ac Anup Patel          2023-06-15  255  	struct kvm_vcpu *vcpu;
89d01306e34d6ac Anup Patel          2023-06-15  256  	struct kvm_vcpu_aia *vaia;
89d01306e34d6ac Anup Patel          2023-06-15  257  	struct kvm_aia *aia = &kvm->arch.aia;
89d01306e34d6ac Anup Patel          2023-06-15  258  	gpa_t base_ppn = KVM_RISCV_AIA_UNDEF_ADDR;
89d01306e34d6ac Anup Patel          2023-06-15  259  
89d01306e34d6ac Anup Patel          2023-06-15  260  	/* Irqchip can be initialized only once */
89d01306e34d6ac Anup Patel          2023-06-15  261  	if (kvm_riscv_aia_initialized(kvm))
89d01306e34d6ac Anup Patel          2023-06-15  262  		return -EBUSY;
89d01306e34d6ac Anup Patel          2023-06-15  263  
89d01306e34d6ac Anup Patel          2023-06-15  264  	/* We might be in the middle of creating a VCPU? */
10f4082b754f18e Sean Christopherson 2026-09-21  265  	if (kvm_is_vcpu_creation_in_progress(kvm))
89d01306e34d6ac Anup Patel          2023-06-15  266  		return -EBUSY;
89d01306e34d6ac Anup Patel          2023-06-15  267  
89d01306e34d6ac Anup Patel          2023-06-15  268  	/* Number of sources should be less than or equals number of IDs */
89d01306e34d6ac Anup Patel          2023-06-15  269  	if (aia->nr_ids < aia->nr_sources)
89d01306e34d6ac Anup Patel          2023-06-15  270  		return -EINVAL;
89d01306e34d6ac Anup Patel          2023-06-15  271  
89d01306e34d6ac Anup Patel          2023-06-15  272  	/* APLIC base is required for non-zero number of sources */
89d01306e34d6ac Anup Patel          2023-06-15  273  	if (aia->nr_sources && aia->aplic_addr == KVM_RISCV_AIA_UNDEF_ADDR)
89d01306e34d6ac Anup Patel          2023-06-15  274  		return -EINVAL;
89d01306e34d6ac Anup Patel          2023-06-15  275  
235a629ef66ed4e Pengpeng Hou        2026-09-20  276  	/* The GPA width may change after setting APLIC's address on an empty VM. */
235a629ef66ed4e Pengpeng Hou        2026-09-20  277  	if (aia->nr_sources) {
235a629ef66ed4e Pengpeng Hou        2026-09-20  278  		ret = aia_check_addr_range(kvm, aia->aplic_addr,
235a629ef66ed4e Pengpeng Hou        2026-09-20  279  					   KVM_DEV_RISCV_APLIC_ALIGN,
235a629ef66ed4e Pengpeng Hou        2026-09-20  280  					   KVM_DEV_RISCV_APLIC_SIZE);
235a629ef66ed4e Pengpeng Hou        2026-09-20  281  		if (ret)
235a629ef66ed4e Pengpeng Hou        2026-09-20  282  			return ret;
235a629ef66ed4e Pengpeng Hou        2026-09-20  283  	}
235a629ef66ed4e Pengpeng Hou        2026-09-20  284  
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  285  	/* Group index bits must not overlap guest and HART index bits. */
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  286  	if (aia->nr_group_bits &&
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  287  	    aia->nr_group_shift < (IMSIC_MMIO_PAGE_SHIFT +
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  288  	    			   aia->nr_guest_bits + aia->nr_hart_bits))
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  289  		return -EINVAL;
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  290  
89d01306e34d6ac Anup Patel          2023-06-15  291  	/* Initialize APLIC */
89d01306e34d6ac Anup Patel          2023-06-15  292  	ret = kvm_riscv_aia_aplic_init(kvm);
89d01306e34d6ac Anup Patel          2023-06-15  293  	if (ret)
89d01306e34d6ac Anup Patel          2023-06-15  294  		return ret;
89d01306e34d6ac Anup Patel          2023-06-15  295  
89d01306e34d6ac Anup Patel          2023-06-15  296  	/* Iterate over each VCPU */
89d01306e34d6ac Anup Patel          2023-06-15  297  	kvm_for_each_vcpu(idx, vcpu, kvm) {
89d01306e34d6ac Anup Patel          2023-06-15  298  		vaia = &vcpu->arch.aia_context;
89d01306e34d6ac Anup Patel          2023-06-15  299  
89d01306e34d6ac Anup Patel          2023-06-15  300  		/* IMSIC base is required */
89d01306e34d6ac Anup Patel          2023-06-15  301  		if (vaia->imsic_addr == KVM_RISCV_AIA_UNDEF_ADDR) {
89d01306e34d6ac Anup Patel          2023-06-15  302  			ret = -EINVAL;
89d01306e34d6ac Anup Patel          2023-06-15  303  			goto fail_cleanup_imsics;
89d01306e34d6ac Anup Patel          2023-06-15  304  		}
89d01306e34d6ac Anup Patel          2023-06-15  305  
235a629ef66ed4e Pengpeng Hou        2026-09-20  306  		/* The GPA width may change after setting IMSIC addresses on an empty VM. */
235a629ef66ed4e Pengpeng Hou        2026-09-20  307  		ret = aia_check_addr_range(kvm, vaia->imsic_addr,
235a629ef66ed4e Pengpeng Hou        2026-09-20  308  					   KVM_DEV_RISCV_IMSIC_ALIGN,
235a629ef66ed4e Pengpeng Hou        2026-09-20  309  					   KVM_DEV_RISCV_IMSIC_SIZE);
235a629ef66ed4e Pengpeng Hou        2026-09-20  310  		if (ret)
235a629ef66ed4e Pengpeng Hou        2026-09-20 @311  			return ret;

This needs to cleanup before returning.

235a629ef66ed4e Pengpeng Hou        2026-09-20  312  
89d01306e34d6ac Anup Patel          2023-06-15  313  		/* All IMSICs should have matching base PPN */
89d01306e34d6ac Anup Patel          2023-06-15  314  		if (base_ppn == KVM_RISCV_AIA_UNDEF_ADDR)
89d01306e34d6ac Anup Patel          2023-06-15  315  			base_ppn = aia_imsic_ppn(aia, vaia->imsic_addr);
89d01306e34d6ac Anup Patel          2023-06-15  316  		if (base_ppn != aia_imsic_ppn(aia, vaia->imsic_addr)) {
89d01306e34d6ac Anup Patel          2023-06-15  317  			ret = -EINVAL;
89d01306e34d6ac Anup Patel          2023-06-15  318  			goto fail_cleanup_imsics;
89d01306e34d6ac Anup Patel          2023-06-15  319  		}
89d01306e34d6ac Anup Patel          2023-06-15  320  
89d01306e34d6ac Anup Patel          2023-06-15  321  		/* Update HART index of the IMSIC based on IMSIC base */
89d01306e34d6ac Anup Patel          2023-06-15  322  		vaia->hart_index = aia_imsic_hart_index(aia,
89d01306e34d6ac Anup Patel          2023-06-15  323  							vaia->imsic_addr);
89d01306e34d6ac Anup Patel          2023-06-15  324  
89d01306e34d6ac Anup Patel          2023-06-15  325  		/* Initialize IMSIC for this VCPU */
89d01306e34d6ac Anup Patel          2023-06-15  326  		ret = kvm_riscv_vcpu_aia_imsic_init(vcpu);
89d01306e34d6ac Anup Patel          2023-06-15  327  		if (ret)
89d01306e34d6ac Anup Patel          2023-06-15  328  			goto fail_cleanup_imsics;
89d01306e34d6ac Anup Patel          2023-06-15  329  	}
89d01306e34d6ac Anup Patel          2023-06-15  330  
89d01306e34d6ac Anup Patel          2023-06-15  331  	/* Set the initialized flag */
89d01306e34d6ac Anup Patel          2023-06-15  332  	kvm->arch.aia.initialized = true;
89d01306e34d6ac Anup Patel          2023-06-15  333  
89d01306e34d6ac Anup Patel          2023-06-15  334  	return 0;
89d01306e34d6ac Anup Patel          2023-06-15  335  
89d01306e34d6ac Anup Patel          2023-06-15  336  fail_cleanup_imsics:
89d01306e34d6ac Anup Patel          2023-06-15  337  	for (i = idx - 1; i >= 0; i--) {
89d01306e34d6ac Anup Patel          2023-06-15  338  		vcpu = kvm_get_vcpu(kvm, i);
89d01306e34d6ac Anup Patel          2023-06-15  339  		if (!vcpu)
89d01306e34d6ac Anup Patel          2023-06-15  340  			continue;
89d01306e34d6ac Anup Patel          2023-06-15  341  		kvm_riscv_vcpu_aia_imsic_cleanup(vcpu);
89d01306e34d6ac Anup Patel          2023-06-15  342  	}
89d01306e34d6ac Anup Patel          2023-06-15  343  	kvm_riscv_aia_aplic_cleanup(kvm);
89d01306e34d6ac Anup Patel          2023-06-15  344  	return ret;
89d01306e34d6ac Anup Patel          2023-06-15  345  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

