Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F6A3655FF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 19:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779909193; cv=none; b=HucqZAMGN4J79rx5KSrGBXHdel2pr/XbdtQpssrY6gQMy72Yq3NIznhH9GXpwMiHW52qyDKC05W0XOuCYDswxKYbEDxKnxBsidTjUKBpNsa/mkmqnT7V+P5FIXdiSzA1hHDGWTPkTsP9oL/GdcFENYc5EulcXUlPNP/wF3WsmCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779909193; c=relaxed/simple;
	bh=z3kvo3WLagg06+RgWih/Ik0h/y0BaH1lzt2bmYD0gMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uUfaJ2sSL9VHCItVmLMZ12lOxII8oS7Z3qbC94j7jq47RFz9cXUt5Z4kd6T3M6zNDWYEZuAKn/E3qBtzQpLwRbToyrOJkMXNvy2LkGYdEi3w1LVnF/75WRVB86qqwsp/ad4rVHMBtvPUl6ChKGsMbd0cYmWpSwmhSxoHQ7aRSeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vtl/2H8H; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vtl/2H8H"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48fde648a71so80066225e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 12:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779909190; x=1780513990; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jpxBKDh5pDd0JFZBOF4cl+ZIfpcNg83H3YdC1zjzFa8=;
        b=Vtl/2H8HHZgvsaxTGbbSlsZBI8QQ1Xm/NrdcR8XEgU+iFnYPDUpkCVq/3w/4OQrk3M
         rrHosvQqRgQ/9il3/J4pY7gZegDtLB6zwiEzMdXKNKK0lP9kGpXqNi13kYiAZDYtNGo9
         ilj7ZHoFLOQ4tCYKo9wHkaFt0fHJ0aW4wf5rz49pbL1TqCGsrkNlqGmXZvqP1FgIFsgl
         T6FhgWU/+e7xBD0xIFnin6/sas/P9RmRayHFxLhdezoAbIviSHl5WjmaRaSsX5p8SzZH
         jnK4N8dtPU2+M67oG71kUAmGUgYgF5rqAq6ZB1/OoGJIj/HQAhUR5PXUuqEvHbkG5ZZU
         NSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779909190; x=1780513990;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpxBKDh5pDd0JFZBOF4cl+ZIfpcNg83H3YdC1zjzFa8=;
        b=dEDvAClDtU0lNXTJ6/vN86J7eVFBPivlT/XsPavloFrKXmOjOB5Am6Xam65u3OFwCU
         LZjpWL6jcVdfKeVIuhgjteL6HqWJVeW6m9kG89ijQ3VuKyb9jnpIa6ugZRO/tUnScJIW
         4G4u/iDdlzq6EaBgBOuNdGMwQtgju5indzMfKackKgn4SAIOagVAYUiUXK4ISkgsKthT
         oj1kRWVpKdO1eQPfXnrQh/5cpGuVvpSJJXw3FOtJVPigYj2Yi4w1x8Krs4FiyH3p4U5C
         sLPVjuokb2mJ5yBk4mhiKMoerDvZO5YFmsIbgsu409GpKGsU88YoEZztbcrW/QRwuk6d
         v0gg==
X-Forwarded-Encrypted: i=1; AFNElJ/ddlOipYZEfxrutzfusCURmV9bNJeKY1o4tlI2M+sRTw+vxZJq5wFFG9tWG2Qm7UAgQ5zRgpGMpEC3E/3b@lists.linux.dev
X-Gm-Message-State: AOJu0YzFwg/4KIbFDvSTjMnXpCsZN0WOKIwAnNRhcCHoYK/vBAVmHwHl
	oMhP/kQiBF6E/2e3qa15lPQ6UwKeT81/KHATCyjBTKQR3jrMjzly5IX3BWJRhQ==
X-Gm-Gg: Acq92OHxSuRU8DdMo4N/4zd1E2yrt4hfl/aiiqK11P9FVy7IdiMU5cNMhdblNqMB0tJ
	D6CNIFbfXvxSeoWyWXfMUeFfMMPK/5jDg1KcEzwRwkkaHXe/CRtHtGtHFAVntNH5y8KtliFebvS
	al53SIUnLcpFKKL8BntdFOWU20X8ASl/smt9KT8x7Os1TJ9GByWG0d36VikngLjmehJNnpcsjQt
	nG1Raf1dGJ0UixN+RCXrud01uwao4wBVP3kY4+oazUAgKxSfhGiU6F/wdPe6PHgKf8F6i9MW2h0
	wGCySxnyiCljsrARQyigJw8EMWE81sGVgJakSaun0YRHT2mmixjeLzKr/jNgbd8JCtHKLWOHNWy
	TZKNZhVZ0QJFCYgF7cin/IMbEKWhsaoN2k775Qikp2ySL8jB1a6RH3jTDg+P9kOjnqPcCNrRBbC
	XqIcDmRPwlAB8IYTXSnoX2oy4KKD9+VmcIFQ==
X-Received: by 2002:a05:600c:6b12:b0:488:7d5b:125d with SMTP id 5b1f17b1804b1-49035f2e4f2mr309955995e9.7.1779909190118;
        Wed, 27 May 2026 12:13:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b2bbfsm8509775f8f.32.2026.05.27.12.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:13:09 -0700 (PDT)
Date: Wed, 27 May 2026 22:13:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/gpib/ines/ines_gpib.c:917 ines_isa_attach() warn:
 'config->ibbase' from __request_region() not released on lines: 913.
Message-ID: <202605271229.d8wGTffx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb3f4b7426cfd2b79d65b7d37155480b32259a11
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
config: alpha-randconfig-r071-20260527 (https://download.01.org/0day-ci/archive/20260527/202605271229.d8wGTffx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6ab504633e4 ("staging: gpib: Destage gpib")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605271229.d8wGTffx-lkp@intel.com/

New smatch warnings:
drivers/gpib/ines/ines_gpib.c:917 ines_isa_attach() warn: 'config->ibbase' from __request_region() not released on lines: 913.

vim +917 drivers/gpib/ines/ines_gpib.c

cfa6673eae0281 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-05-02  889  static int ines_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  890  {
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  891  	struct ines_priv *ines_priv;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  892  	struct nec7210_priv *nec_priv;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  893  	int isr_flags = 0;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  894  	int retval;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  895  
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  896  	retval = ines_generic_attach(board);
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  897  	if (retval)
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  898  		return retval;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  899  
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  900  	ines_priv = board->private_data;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  901  	nec_priv = &ines_priv->nec7210_priv;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  902  
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  903  	if (!request_region(config->ibbase, ines_isa_iosize, DRV_NAME)) {
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  904  		dev_err(board->gpib_dev, "ioports at 0x%x already in use\n",
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  905  			config->ibbase);
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  906  		return -EBUSY;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  907  	}
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  908  	nec_priv->iobase = config->ibbase;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  909  	nec_priv->offset = 1;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  910  	nec7210_board_reset(nec_priv, board);
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  911  	if (request_irq(config->ibirq, ines_pci_interrupt, isr_flags, DRV_NAME, board)) {
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  912  		dev_err(board->gpib_dev, "failed to allocate IRQ %d\n", config->ibirq);

Need to called request_region() before returning and maybe something
to clean up the ines_generic_attach()?

bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  913  		return -1;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  914  	}
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  915  	ines_priv->irq = config->ibirq;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  916  	ines_online(ines_priv, board, 1);
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18 @917  	return 0;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  918  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

