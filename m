Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB75C214A67
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 06:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733726794; cv=none; b=X/8pjg1WvkiTtYsi2zQ2e2XdqjHmVIhaHacJEhlGzNl73LtuVnH7LIO8NC1SWaL9SFacJYjuCy0oOz5eFt2CLeEatr2GrkhFvJng+MHxbCsn204pO96zFykEGTC20lMxgk38znOhibwf6wHggb3NjsfLz2H4nJPu6+sL91pKuao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733726794; c=relaxed/simple;
	bh=eYESRqEX20YdrEN6eVSJ/cbln30rq2T4so8Lf6iFg0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vh9izw7ZJbBaTup7Ie5vjE0uwy2E982cnvLTuaieDVMI76eimL1AsznoCTBkwHj1yb7r582PJT4xBaYQM/g8aB0PvezJNgVVF2qyMNDu7hvqXDtMVnIhq952qQr69c/RUBlrumNej4zJ2cytFGY2KSQJxY6mEdzNUSICdg4mYOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sKLcEPqc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sKLcEPqc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so25620105e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 08 Dec 2024 22:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733726790; x=1734331590; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IPx4odjlhYjxbYRXDXRscRJAb1NNIdgNbsIotKHiFzs=;
        b=sKLcEPqcdEFPVWS/yRN6aIvBdE01IlpJv1s08IVP2Cmpr+1AUxk6xk/VpkikzXk64K
         tJXVgE+ULQ5/gkkH+K6nYTXZBqZHY9Xh6/3coS35lQ/g8+uYB6zf7bi0svBv6D+pSqp5
         rZFVkheFOyMEOfdo8ZLoeHSYZhdcvMmv+QkRhlhOkPK9vLQ63aIZ7rBRQKRyCOIhwP48
         GK+revvA2JiPbHZJ4tRDiVtmz9rWGZB3fPIHmEB6nKUG4qlnxgsAmpSwfUZ2Urhh053R
         4quXAToVGufLX0boEHaNGmX0Q+qjACe0yxmvCkQe2uFn+oL/E+7CCdXM0NkRrFvadnCi
         PnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733726790; x=1734331590;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPx4odjlhYjxbYRXDXRscRJAb1NNIdgNbsIotKHiFzs=;
        b=N6MBu0Nr7W+eXltGZiiQEJ0KwTSZw7XN6q23SiudNxMAZTN95Z3+ettFe3fo7/6ibC
         mgDb0APd/sHJdEutJ2I87H+HXSjQ/A9sXPmGpS8VrF5CiUDTVg1c2OmuGLExvEJuysps
         sVxuYCP+XDDBwMfJjp09T0LgBERzysjQRQXM6LpgavGAH75d9O6cDS6MHZ5wfbUdusT4
         kNX7YS5wFXZ+/fBAdvFMs7PFMBzRcJgMQESyY+341fRkFmL0lCHF7nfW63ju9jfQlhTl
         IncvrVuZ4IfTJ1/OIEKQOfQN60HPm0ufT5eiIbahlfV1Sca2qsqPqkCpcoVp3C9pOR/2
         LVrg==
X-Forwarded-Encrypted: i=1; AJvYcCVYlSygGK8wULdq1UOyKNvUXDY3N4N1rK7OM0YwEZItqm7aRS13H5HNFjITGFyW1jIdrLm7HYY2z2Zeyes4@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1/7OL0ysie1+uJEHCWahGrsUsu6C3flkjlB65h+6bYvpRf+xL
	Wsb+CSXy/pHz/G2dc2z+S889FSfe9iYl2Xjeeum8axvosnybIwdDe6kItWnbTHE=
X-Gm-Gg: ASbGncsnpb/WTaKrDe1nreJ7Wc40h1Yc842tRzgl4mgS70s4h1Yv0wNASw62i+crigQ
	jkbYmWWTk5NGZx2sU8CbKC30bROeO0XRelfABU5yGFcMPPIy1b+pF75XSLLRro2yD3tIvw5LI/x
	1wZ+uYXrNB3Uw26ICyxYp2qMhCnkUVQFnmDZNMxuKLV5x22BjeJcl3JIvqWGuOuKZG3g3SOGojh
	kmMWq/9nfdWJruiUyDFNNVVzrxVI4IgeWVzYLi4bc1zATZ0zwpMm4g=
X-Google-Smtp-Source: AGHT+IHnAJmMRP6QYNzcPZsWpNbhVGss2B/vywFHRiKi88KuTzAR1y2aY4Yw49AUiw7ay5CLzYKxXA==
X-Received: by 2002:a5d:47a5:0:b0:385:e968:f189 with SMTP id ffacd0b85a97d-3862b3e7d5cmr8527452f8f.51.1733726790108;
        Sun, 08 Dec 2024 22:46:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38621fbbe15sm12111687f8f.92.2024.12.08.22.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 22:46:29 -0800 (PST)
Date: Mon, 9 Dec 2024 09:46:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anup Patel <apatel@ventanamicro.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: drivers/irqchip/irq-riscv-imsic-state.c:854 imsic_setup_state()
 error: we previously assumed 'mmios_va' could be null (see line 745)
Message-ID: <7d0f9113-8709-4fe9-a47c-10e17b41dd24@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anup,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: 0eebc69db358fd2f6fe34cc4db6428df6a540dd7 RISC-V: Select APLIC and IMSIC drivers
config: riscv-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071811.QdFBrzA6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412071811.QdFBrzA6-lkp@intel.com/

New smatch warnings:
drivers/irqchip/irq-riscv-imsic-state.c:854 imsic_setup_state() error: we previously assumed 'mmios_va' could be null (see line 745)

vim +/mmios_va +854 drivers/irqchip/irq-riscv-imsic-state.c

21a8f8a0eb35ceb Anup Patel 2024-03-07  691  int __init imsic_setup_state(struct fwnode_handle *fwnode)
21a8f8a0eb35ceb Anup Patel 2024-03-07  692  {
21a8f8a0eb35ceb Anup Patel 2024-03-07  693  	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_handlers = 0;
21a8f8a0eb35ceb Anup Patel 2024-03-07  694  	struct imsic_global_config *global;
21a8f8a0eb35ceb Anup Patel 2024-03-07  695  	struct imsic_local_config *local;
21a8f8a0eb35ceb Anup Patel 2024-03-07  696  	void __iomem **mmios_va = NULL;
21a8f8a0eb35ceb Anup Patel 2024-03-07  697  	struct resource *mmios = NULL;
21a8f8a0eb35ceb Anup Patel 2024-03-07  698  	unsigned long reloff, hartid;
21a8f8a0eb35ceb Anup Patel 2024-03-07  699  	phys_addr_t base_addr;
21a8f8a0eb35ceb Anup Patel 2024-03-07  700  	int rc, cpu;
21a8f8a0eb35ceb Anup Patel 2024-03-07  701  
21a8f8a0eb35ceb Anup Patel 2024-03-07  702  	/*
21a8f8a0eb35ceb Anup Patel 2024-03-07  703  	 * Only one IMSIC instance allowed in a platform for clean
21a8f8a0eb35ceb Anup Patel 2024-03-07  704  	 * implementation of SMP IRQ affinity and per-CPU IPIs.
21a8f8a0eb35ceb Anup Patel 2024-03-07  705  	 *
21a8f8a0eb35ceb Anup Patel 2024-03-07  706  	 * This means on a multi-socket (or multi-die) platform we
21a8f8a0eb35ceb Anup Patel 2024-03-07  707  	 * will have multiple MMIO regions for one IMSIC instance.
21a8f8a0eb35ceb Anup Patel 2024-03-07  708  	 */
21a8f8a0eb35ceb Anup Patel 2024-03-07  709  	if (imsic) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  710  		pr_err("%pfwP: already initialized hence ignoring\n", fwnode);
21a8f8a0eb35ceb Anup Patel 2024-03-07  711  		return -EALREADY;
21a8f8a0eb35ceb Anup Patel 2024-03-07  712  	}
21a8f8a0eb35ceb Anup Patel 2024-03-07  713  
21a8f8a0eb35ceb Anup Patel 2024-03-07  714  	if (!riscv_isa_extension_available(NULL, SxAIA)) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  715  		pr_err("%pfwP: AIA support not available\n", fwnode);
21a8f8a0eb35ceb Anup Patel 2024-03-07  716  		return -ENODEV;
21a8f8a0eb35ceb Anup Patel 2024-03-07  717  	}
21a8f8a0eb35ceb Anup Patel 2024-03-07  718  
21a8f8a0eb35ceb Anup Patel 2024-03-07  719  	imsic = kzalloc(sizeof(*imsic), GFP_KERNEL);
21a8f8a0eb35ceb Anup Patel 2024-03-07  720  	if (!imsic)
21a8f8a0eb35ceb Anup Patel 2024-03-07  721  		return -ENOMEM;
21a8f8a0eb35ceb Anup Patel 2024-03-07  722  	imsic->fwnode = fwnode;
21a8f8a0eb35ceb Anup Patel 2024-03-07  723  	global = &imsic->global;
21a8f8a0eb35ceb Anup Patel 2024-03-07  724  
21a8f8a0eb35ceb Anup Patel 2024-03-07  725  	global->local = alloc_percpu(typeof(*global->local));
21a8f8a0eb35ceb Anup Patel 2024-03-07  726  	if (!global->local) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  727  		rc = -ENOMEM;
21a8f8a0eb35ceb Anup Patel 2024-03-07  728  		goto out_free_priv;
21a8f8a0eb35ceb Anup Patel 2024-03-07  729  	}
21a8f8a0eb35ceb Anup Patel 2024-03-07  730  
21a8f8a0eb35ceb Anup Patel 2024-03-07  731  	/* Parse IMSIC fwnode */
21a8f8a0eb35ceb Anup Patel 2024-03-07  732  	rc = imsic_parse_fwnode(fwnode, global, &nr_parent_irqs, &nr_mmios);
21a8f8a0eb35ceb Anup Patel 2024-03-07  733  	if (rc)
21a8f8a0eb35ceb Anup Patel 2024-03-07  734  		goto out_free_local;
21a8f8a0eb35ceb Anup Patel 2024-03-07  735  
21a8f8a0eb35ceb Anup Patel 2024-03-07  736  	/* Allocate MMIO resource array */
21a8f8a0eb35ceb Anup Patel 2024-03-07  737  	mmios = kcalloc(nr_mmios, sizeof(*mmios), GFP_KERNEL);
21a8f8a0eb35ceb Anup Patel 2024-03-07  738  	if (!mmios) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  739  		rc = -ENOMEM;
21a8f8a0eb35ceb Anup Patel 2024-03-07  740  		goto out_free_local;
21a8f8a0eb35ceb Anup Patel 2024-03-07  741  	}
21a8f8a0eb35ceb Anup Patel 2024-03-07  742  
21a8f8a0eb35ceb Anup Patel 2024-03-07  743  	/* Allocate MMIO virtual address array */
21a8f8a0eb35ceb Anup Patel 2024-03-07  744  	mmios_va = kcalloc(nr_mmios, sizeof(*mmios_va), GFP_KERNEL);
21a8f8a0eb35ceb Anup Patel 2024-03-07 @745  	if (!mmios_va) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  746  		rc = -ENOMEM;
21a8f8a0eb35ceb Anup Patel 2024-03-07  747  		goto out_iounmap;

This goto will crash.

21a8f8a0eb35ceb Anup Patel 2024-03-07  748  	}
21a8f8a0eb35ceb Anup Patel 2024-03-07  749  
21a8f8a0eb35ceb Anup Patel 2024-03-07  750  	/* Parse and map MMIO register sets */
21a8f8a0eb35ceb Anup Patel 2024-03-07  751  	for (i = 0; i < nr_mmios; i++) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  752  		rc = imsic_get_mmio_resource(fwnode, i, &mmios[i]);
21a8f8a0eb35ceb Anup Patel 2024-03-07  753  		if (rc) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  754  			pr_err("%pfwP: unable to parse MMIO regset %d\n", fwnode, i);
21a8f8a0eb35ceb Anup Patel 2024-03-07  755  			goto out_iounmap;
21a8f8a0eb35ceb Anup Patel 2024-03-07  756  		}
21a8f8a0eb35ceb Anup Patel 2024-03-07  757  
21a8f8a0eb35ceb Anup Patel 2024-03-07  758  		base_addr = mmios[i].start;
21a8f8a0eb35ceb Anup Patel 2024-03-07  759  		base_addr &= ~(BIT(global->guest_index_bits +
21a8f8a0eb35ceb Anup Patel 2024-03-07  760  				   global->hart_index_bits +
21a8f8a0eb35ceb Anup Patel 2024-03-07  761  				   IMSIC_MMIO_PAGE_SHIFT) - 1);
21a8f8a0eb35ceb Anup Patel 2024-03-07  762  		base_addr &= ~((BIT(global->group_index_bits) - 1) <<
21a8f8a0eb35ceb Anup Patel 2024-03-07  763  			       global->group_index_shift);
21a8f8a0eb35ceb Anup Patel 2024-03-07  764  		if (base_addr != global->base_addr) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  765  			rc = -EINVAL;
21a8f8a0eb35ceb Anup Patel 2024-03-07  766  			pr_err("%pfwP: address mismatch for regset %d\n", fwnode, i);
21a8f8a0eb35ceb Anup Patel 2024-03-07  767  			goto out_iounmap;
21a8f8a0eb35ceb Anup Patel 2024-03-07  768  		}
21a8f8a0eb35ceb Anup Patel 2024-03-07  769  
21a8f8a0eb35ceb Anup Patel 2024-03-07  770  		mmios_va[i] = ioremap(mmios[i].start, resource_size(&mmios[i]));
21a8f8a0eb35ceb Anup Patel 2024-03-07  771  		if (!mmios_va[i]) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  772  			rc = -EIO;
21a8f8a0eb35ceb Anup Patel 2024-03-07  773  			pr_err("%pfwP: unable to map MMIO regset %d\n", fwnode, i);
21a8f8a0eb35ceb Anup Patel 2024-03-07  774  			goto out_iounmap;
21a8f8a0eb35ceb Anup Patel 2024-03-07  775  		}
21a8f8a0eb35ceb Anup Patel 2024-03-07  776  	}
21a8f8a0eb35ceb Anup Patel 2024-03-07  777  
21a8f8a0eb35ceb Anup Patel 2024-03-07  778  	/* Initialize local (or per-CPU )state */
21a8f8a0eb35ceb Anup Patel 2024-03-07  779  	rc = imsic_local_init();
21a8f8a0eb35ceb Anup Patel 2024-03-07  780  	if (rc) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  781  		pr_err("%pfwP: failed to initialize local state\n",
21a8f8a0eb35ceb Anup Patel 2024-03-07  782  		       fwnode);
21a8f8a0eb35ceb Anup Patel 2024-03-07  783  		goto out_iounmap;
21a8f8a0eb35ceb Anup Patel 2024-03-07  784  	}
21a8f8a0eb35ceb Anup Patel 2024-03-07  785  
21a8f8a0eb35ceb Anup Patel 2024-03-07  786  	/* Configure handlers for target CPUs */
21a8f8a0eb35ceb Anup Patel 2024-03-07  787  	for (i = 0; i < nr_parent_irqs; i++) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  788  		rc = imsic_get_parent_hartid(fwnode, i, &hartid);
21a8f8a0eb35ceb Anup Patel 2024-03-07  789  		if (rc) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  790  			pr_warn("%pfwP: hart ID for parent irq%d not found\n", fwnode, i);
21a8f8a0eb35ceb Anup Patel 2024-03-07  791  			continue;
21a8f8a0eb35ceb Anup Patel 2024-03-07  792  		}
21a8f8a0eb35ceb Anup Patel 2024-03-07  793  
21a8f8a0eb35ceb Anup Patel 2024-03-07  794  		cpu = riscv_hartid_to_cpuid(hartid);
21a8f8a0eb35ceb Anup Patel 2024-03-07  795  		if (cpu < 0) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  796  			pr_warn("%pfwP: invalid cpuid for parent irq%d\n", fwnode, i);
21a8f8a0eb35ceb Anup Patel 2024-03-07  797  			continue;
21a8f8a0eb35ceb Anup Patel 2024-03-07  798  		}
21a8f8a0eb35ceb Anup Patel 2024-03-07  799  
21a8f8a0eb35ceb Anup Patel 2024-03-07  800  		/* Find MMIO location of MSI page */
21a8f8a0eb35ceb Anup Patel 2024-03-07  801  		index = nr_mmios;
21a8f8a0eb35ceb Anup Patel 2024-03-07  802  		reloff = i * BIT(global->guest_index_bits) *
21a8f8a0eb35ceb Anup Patel 2024-03-07  803  			 IMSIC_MMIO_PAGE_SZ;
21a8f8a0eb35ceb Anup Patel 2024-03-07  804  		for (j = 0; nr_mmios; j++) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  805  			if (reloff < resource_size(&mmios[j])) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  806  				index = j;
21a8f8a0eb35ceb Anup Patel 2024-03-07  807  				break;
21a8f8a0eb35ceb Anup Patel 2024-03-07  808  			}
21a8f8a0eb35ceb Anup Patel 2024-03-07  809  
21a8f8a0eb35ceb Anup Patel 2024-03-07  810  			/*
21a8f8a0eb35ceb Anup Patel 2024-03-07  811  			 * MMIO region size may not be aligned to
21a8f8a0eb35ceb Anup Patel 2024-03-07  812  			 * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ
21a8f8a0eb35ceb Anup Patel 2024-03-07  813  			 * if holes are present.
21a8f8a0eb35ceb Anup Patel 2024-03-07  814  			 */
21a8f8a0eb35ceb Anup Patel 2024-03-07  815  			reloff -= ALIGN(resource_size(&mmios[j]),
21a8f8a0eb35ceb Anup Patel 2024-03-07  816  			BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ);
21a8f8a0eb35ceb Anup Patel 2024-03-07  817  		}
21a8f8a0eb35ceb Anup Patel 2024-03-07  818  		if (index >= nr_mmios) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  819  			pr_warn("%pfwP: MMIO not found for parent irq%d\n", fwnode, i);
21a8f8a0eb35ceb Anup Patel 2024-03-07  820  			continue;
21a8f8a0eb35ceb Anup Patel 2024-03-07  821  		}
21a8f8a0eb35ceb Anup Patel 2024-03-07  822  
21a8f8a0eb35ceb Anup Patel 2024-03-07  823  		local = per_cpu_ptr(global->local, cpu);
21a8f8a0eb35ceb Anup Patel 2024-03-07  824  		local->msi_pa = mmios[index].start + reloff;
21a8f8a0eb35ceb Anup Patel 2024-03-07  825  		local->msi_va = mmios_va[index] + reloff;
21a8f8a0eb35ceb Anup Patel 2024-03-07  826  
21a8f8a0eb35ceb Anup Patel 2024-03-07  827  		nr_handlers++;
21a8f8a0eb35ceb Anup Patel 2024-03-07  828  	}
21a8f8a0eb35ceb Anup Patel 2024-03-07  829  
21a8f8a0eb35ceb Anup Patel 2024-03-07  830  	/* If no CPU handlers found then can't take interrupts */
21a8f8a0eb35ceb Anup Patel 2024-03-07  831  	if (!nr_handlers) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  832  		pr_err("%pfwP: No CPU handlers found\n", fwnode);
21a8f8a0eb35ceb Anup Patel 2024-03-07  833  		rc = -ENODEV;
21a8f8a0eb35ceb Anup Patel 2024-03-07  834  		goto out_local_cleanup;
21a8f8a0eb35ceb Anup Patel 2024-03-07  835  	}
21a8f8a0eb35ceb Anup Patel 2024-03-07  836  
21a8f8a0eb35ceb Anup Patel 2024-03-07  837  	/* Initialize matrix allocator */
21a8f8a0eb35ceb Anup Patel 2024-03-07  838  	rc = imsic_matrix_init();
21a8f8a0eb35ceb Anup Patel 2024-03-07  839  	if (rc) {
21a8f8a0eb35ceb Anup Patel 2024-03-07  840  		pr_err("%pfwP: failed to create matrix allocator\n", fwnode);
21a8f8a0eb35ceb Anup Patel 2024-03-07  841  		goto out_local_cleanup;
21a8f8a0eb35ceb Anup Patel 2024-03-07  842  	}
21a8f8a0eb35ceb Anup Patel 2024-03-07  843  
21a8f8a0eb35ceb Anup Patel 2024-03-07  844  	/* We don't need MMIO arrays anymore so let's free-up */
21a8f8a0eb35ceb Anup Patel 2024-03-07  845  	kfree(mmios_va);
21a8f8a0eb35ceb Anup Patel 2024-03-07  846  	kfree(mmios);
21a8f8a0eb35ceb Anup Patel 2024-03-07  847  
21a8f8a0eb35ceb Anup Patel 2024-03-07  848  	return 0;
21a8f8a0eb35ceb Anup Patel 2024-03-07  849  
21a8f8a0eb35ceb Anup Patel 2024-03-07  850  out_local_cleanup:
21a8f8a0eb35ceb Anup Patel 2024-03-07  851  	imsic_local_cleanup();
21a8f8a0eb35ceb Anup Patel 2024-03-07  852  out_iounmap:
21a8f8a0eb35ceb Anup Patel 2024-03-07  853  	for (i = 0; i < nr_mmios; i++) {
21a8f8a0eb35ceb Anup Patel 2024-03-07 @854  		if (mmios_va[i])
                                                            ^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

