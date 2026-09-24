Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046584AF690
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278496; cv=none; b=qCCOXMsc3icz2YbiC08vOwrSA657NRHp9CW1l9NnIasX2fmgWxnOUdvLFFR5Dg9602SbTiylVt6hsBZ5BnglLmEMEJ6pXMG3FTprzmMrVhUKwy4LgTxB+N9CV1FcGZC1OKJ62fFaIDeiPK+c6X0GOHvWwvRlUbKIM18vVnTdrWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278496; c=relaxed/simple;
	bh=tAtOy7yqdoonmqdxBl5Aj4ovM1yHmQX/0+wttvUKMDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ja4/0TD9bMK2TAFALrWisNUBH+uNy8dq7fO/Vy0Lwry4GimXrLMp3hwgb25PZxXVQCYFkx3++Rd2sLvYElArPmYufGDybFfFpzrjFOaVJBeCTboqysEOGnJDGuhptU/PZOdsdyybxbOtQmw8qM0CEJ6Ui0HE+E+LKaWwBNca6xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLXoNTYC; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLXoNTYC"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so95712f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790278489; x=1790883289; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLORYJfZZsaQptFGcOysl3n3xiXH6JOHvS+eDrSitKw=;
        b=FLXoNTYCdA7E88v9SnrrnZHryL2wT5Cq6YraSRr85HQg3XHFA6HNfURhtTh/HF90PE
         7sgPEGOW84l9eqqm7ommZ+iFm4mL3Qm4vT4nk62e94ZzDCXxV0G9Nw4JInR1h6NmmL5h
         SoBEk+nnut5iBgPFqN5FbCRVeCNZjgmWyr4qQ48mzTULooYGmjsMTl29DVjNxfgR0lnd
         +RRuVWvLb6/fKvoqHZKac13TNYMrsW46KLngpJ7HhK5uHjJUO6Y0wQ43KxS8w5HKxDX4
         nMQlZzbW2eUVUn7vDngAbMcQpakq0jEuevOlzIquCtExKROBBOWYO6utZZxDEEqmRiKT
         wHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278489; x=1790883289;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLORYJfZZsaQptFGcOysl3n3xiXH6JOHvS+eDrSitKw=;
        b=RnZp/F2WrgVT26Wt3aAKX0WbRzNH+6DEy//kEeRLQRWYqYIb73e5d5ylECKGlOKIvV
         2HXXCnyIt80jhHT+R/azW8XtwGH6sB3e034qRvT/QX+CrfHUDsFaE7gV1Bkjp8Pw0mIU
         f0k1P4HEiOvBoqQVsqo1wviEdVYTjesKK2oaGugtRVP52Bs8A8Gq0gSe9Jixw44bKBbd
         dt7DSFKG3XYVmr+5tKzWG6Ifh3ZQxZ40acbKllAAMlee9sUEgqf8UhDMk1ksuhAFsysv
         lIblqaNLlWnxtMwSuKFFdRMJZ4miV7Mg0HMROFa0+plN2AODKOBuyN3Zki2pABgK+Pei
         kxqw==
X-Forwarded-Encrypted: i=1; AKwUvBwWmjYR8FLS6rFR65C3Pc4PQSLeDc9GE7+jImwxPsZ00M6tZns3LRqBKhlSq+XDHhT98uB1MKAdUWguqgPm@lists.linux.dev
X-Gm-Message-State: AFuF++nY0QQHuueeHiJ91oZ62QbHLRK5XeMNFe4ZwbtZXkKT1qaARc5U
	ozvNXebv57abLnovbb7Y2OkQ4oKQUIbvGV+JbxO7Kfy4PJoBo7ND+JeX
X-Gm-Gg: AYBFou3XJfuPzL02X9vsJRRk5RDy1ZBYgshGp1PiFym8bx4zE+bAucqP2kU/Qrmn/r2
	XiR1j4KtJ0WfVrwsb1zNeYPzuHHb7+cm58HjuXoNPZWG4OoQRUpqOg8wDsagvsa+DDsSMEJdWhh
	cHn9OrLlwyVizGaZEFKiPeGm/YysrXVa0AfE4Mr9jQdc8T0A282n9l549sIghj2BnRIjBFtz0qq
	zUHSsd4I4F0MpnqUPqiqCi0guVxSz5KVuduoExKT+l4UMCsQIyfusfG/ikmuHL5INycVOo/vRHE
	+zqhtDHU2C/ljrPUYuTAVIXztI9Ka+p3Nvd+ic4SH8Y/TyDuO6Rrynnx1Z0zdrTfOf+zfdbQ89t
	sw50tiM7FQEoGzWl+tj4thtYzc6RNdfGRzFb/EAC5ngYyPUJ5bo5CM9FIH5J3PyMPD8pE9vyAU9
	wEaT8TR/YJrfzk/gQ7Z/oG+mLgWx420syHlguhdqSCmdrMi1/6azAbtXf/hgiSv0IUdnZ2dV2Wl
	zkzmA==
X-Received: by 2002:a05:6000:400e:b0:487:a0f:7f7b with SMTP id ffacd0b85a97d-488716b2a0amr7003899f8f.10.1790278488428;
        Thu, 24 Sep 2026 12:34:48 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm1233850f8f.13.2026.09.24.12.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:34:47 -0700 (PDT)
Date: Thu, 24 Sep 2026 22:34:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [intel-tdx:v7.3-rc4_tdx_connect_phase2.for_upstream 11/44]
 drivers/pci/tsm/core.c:589 pci_tsm_accept() warn: set_bit() takes a bit
 number
Message-ID: <202609241930.KhG7E8hz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git v7.3-rc4_tdx_connect_phase2.for_upstream
head:   69fd611d89afafa408b11f0e1304297433d3d471
commit: 36ae7ba2d3e2102d24370481ce968489667bff26 [11/44] PCI/TSM: Add device interface security RUN support
config: i386-randconfig-r2202-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241930.KhG7E8hz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609241930.KhG7E8hz-lkp@intel.com/

smatch warnings:
drivers/pci/tsm/core.c:589 pci_tsm_accept() warn: set_bit() takes a bit number

vim +589 drivers/pci/tsm/core.c

36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  564  static int pci_tsm_accept(struct pci_dev *pdev)
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  565  {
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  566  	int rc;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  567  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  568  	ACQUIRE(rwsem_read_intr, lock)(&pci_tsm_rwsem);
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  569  	if ((rc = ACQUIRE_ERR(rwsem_read_intr, &lock)))
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  570  		return rc;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  571  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  572  	if (!pdev->tsm)
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  573  		return -EINVAL;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  574  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  575  	ACQUIRE(device_intr, dev_lock)(&pdev->dev);
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  576  	if ((rc = ACQUIRE_ERR(device_intr, &dev_lock)))
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  577  		return rc;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  578  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  579  	if (pdev->dev.driver)
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  580  		return -EBUSY;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  581  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  582  	if (test_bit(PCI_TSM_F_ACCEPT, &pdev->tsm->flags))

PCI_TSM_F_ACCEPT is (1UL << 0).  This is a double BIT(BIT()) bug
where it's checking bit 1 instead of bit 0.

Also we miss Dan.  :(

36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  583  		return 0;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  584  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  585  	rc = to_pci_tsm_ops(pdev->tsm)->run(pdev);
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  586  	if (rc)
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  587  		return rc;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  588  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24 @589  	set_bit(PCI_TSM_F_ACCEPT, &pdev->tsm->flags);
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  590  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  591  	return 0;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  592  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

