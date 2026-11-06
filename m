Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793944601;
	b=U3LTNaXlgJWf7fWdjVJU1Z9GmgTJ+7vyO2DWgypj/vugTB2D2MFeGF4YYG4gajxD9SHd
	 OTVsbgwSzI1ZZAawcfnAEoI/FvEuujB+BmYxjqhPAHhEklW/Gcnbk3ZaLk7whsb0v+HjE
	 AIl1+dgVKTDOD67a3GGnDeGE5Lta6zE556YZT/ZcrGwAZZJFf+a2kjWYd+LdA0PXv4vfe
	 BcOHxHrtBdrX/3zSbxlMLouCA/V8Y5Y9tsv1i9Mi8MWB4TYyR+z/8KTTtdnE3KCSi5brY
	 V5pGxeb+jxOcI+U9uBeoRzbbcYKk8hhdcAFYOlMSYXmlOJD2aiEiwzvHzWtR6cGtBDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=BGGRk7lDKsEk+C3tLTVM8Qk9LJJPZRiWXHhogF4BcsM=;
	b=ieV96QnWNNtOOORNCQuf3ap1bQwnHVFO8IfOccrd8DNiWfys64gwkwDIgP/SBgNiK1JU
	 k8djyxVcN+m6+K4TgBkgoM1shX3+qFqMyr115G2GFH2jjKSviTH45ZiMELGBRQTVtpHlb
	 Ju3vXvAQHqZ1lBq42aNEVzms7cLpZlQ+a75d7z8XVpA3jqAA88zgXuL0SVfpXkT+Ef8rk
	 FkhbMf2+FeeR7jkWhKJHZHWzovKy+F6FKfBOo/hY1fzIWrCmygQDNt5qLEE91RNMBwrLy
	 y3AwTgM274CUZ1TseAreCWBTkxNoKbczHkwPodXwrqLr8bHi7c0rJQ7IhJ7cOD2Qt/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DjSN9+Ht;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E264F606A32C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 05:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E264F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DjSN9+Ht
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso1241495e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 05 Nov 2026 21:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793944599; x=1794549399; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGGRk7lDKsEk+C3tLTVM8Qk9LJJPZRiWXHhogF4BcsM=;
        b=DjSN9+HtvK64QcXfzr3UBBgfpA1kJDs8ZDO3ZiJ/f4b62x2lPukGA4O0BI+DS1b5ZE
         vdj5q3CD6WeoAjS+bgqAQM8wko5Qsf3Td2Wz8RhZXAG+ELrzchOoM/jGfmlDvRbG2srN
         JAFTG1+xRcwri+zgnSGgzHsVSguVymLvcBeCg0L6vn61PjxKAwILYcNR+Zx1eggN75a2
         +CO3fwrc+tlj4SeJQaD2349eY9KdqjJXkQhIToNYcnIBRBrssbCubDLm45iFOwRmMcS9
         VW9igv7vda49wPHnlvQsuAN2kRNfBXSh9rsVA/bVvyqLmrJMC6oeZak51UEtdgV6hM87
         Crag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793944599; x=1794549399;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGGRk7lDKsEk+C3tLTVM8Qk9LJJPZRiWXHhogF4BcsM=;
        b=WDYoJlpRz0TADkKrLdsO4mzlXKNsq+iMll8X1MM4uQ1SUggFnpJJNlmv8lgvPrUeyc
         0jl3l8ufzuWZLE8zrSl2IHP7DTyEWvmGVhNB+XGcPbFzQuq0EBTkACd7dDOFzbT2r0Az
         MUNjq8hNdsPZ5KPw37b9V2orzAnLZRkzJCo530zyRYPiZX7iW3tTKyb8ygVOLK14AktW
         HNkaX9L2mRMPhp6WRbbtp1pO/nwmq7KcE17kbKPnFH4iLORyXp0XJL3gTMH3jckkCXsl
         GGT6Shs8XOgt/24G10e8NURJCY+X1Kfmty5+I3q3T8M7l3m0Iuh4Kg5dJvKRBqrWyfJ0
         WdbA==
X-Forwarded-Encrypted: i=1; AKwUvByA6Znggq5N288MCVs0SsVooRFv8mBKRvg+A98iTb8J2vatDaaLPpO4+JxFC1HcB5CbAyuP91D/czEyV7wD@lists.linux.dev
X-Gm-Message-State: APuU4Z8yLqNZIKKOmWmOMnxQjlB++vfYoqUA7XlhmRndcFag09h4UUzn
	MpSV/0VMMiF4nVVTgOgHQQ+wySALHD9Z9+y69fPgNFkoCRjyXfzprwQ1
X-Gm-Gg: AYBFou2U2PoFAxjL9hl8QVvFCjs/Sru3aslVM2yopQgruJLp/ULlRs1qWQe6U7axJIA
	3PeQPGQlwu9RkMWPdX5BR8CigM+68J9ihx+ocClMzOojYyQy646tr7/ZH6THlHwxJVaAgzpVH1i
	y5ghZAJCq2xKfwitI3tSu8zOv4zA60YqqF9yrwSoRAHbC9hGMBRx/XMe2cgito8apt69XLkufzn
	/mALkipCh3nGvnRFbBoEJGaGuyJpdpSqLFuluatLgYYeJrFivwSQV7nHJKQZPCI6yp7J8utMzTn
	C11jUy4arQy4HuHjNVURPYilvvXN0CdnzgZ70MnLmOeJDhyGFkBeX2xM/mFcGaUsCgAEXDt/pS4
	FjZaOF8gG1/TP+d4qNMlG6cI1JBZ0aLSTPjOmWnQ2oZ3MK4gMj3U9Tt3Ev61kYDMoNlICFGd6gS
	n2drtg2ccFVn0SMSC5txEZl6rzuzuqA+dVHWqyNTb/fBpMUqoRkN3HPougYe19hzCOS34XhI6YO
	uN4oyNb7JOmD82hPVtrmbHP0Xxwau7xwBO+XkZh+sIM/R/nbQHGryKVdzloB7rfDXd8Z2e1vav1
	g3oq8CQjf7/3vbs4/nHPczUf5OJXSX9b2U1DBoGFJ6DA+8xOrg9VDsvUfgMW0gkfmnc6qzi9ueF
	lt9BJ0K0Qz15qhcjVnuFUy8OMf+nBjiCOzVWukc9Wm/EjbzisC8DTz54iw7YzOKtWvg==
X-Received: by 2002:a05:600c:8b28:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4b6dfba8628mr16268215e9.30.1793944598951;
        Thu, 05 Nov 2026 21:56:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm27279965e9.2.2026.11.05.21.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:56:37 -0800 (PST)
Date: Fri, 6 Nov 2026 08:56:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 390/390]
 drivers/mtd/mtdcore.c:955 mtd_otp_nvmem_add() warn: missing unwind goto?
Message-ID: <202611060606.xbU3zu11-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   900d46d1c904d34d7c3eeb0ef2119cffc5a8ab3d
commit: 534fd7770b6ddedc6c6ef6fa724987d3397f9b3b [390/390] mtd: core: Report error if first mtd_otp_size() call fails in mtd_otp_nvmem_add()
config: arm-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060606.xbU3zu11-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611060606.xbU3zu11-lkp@intel.com/

smatch warnings:
drivers/mtd/mtdcore.c:955 mtd_otp_nvmem_add() warn: missing unwind goto?

vim +955 drivers/mtd/mtdcore.c

4b361cfa862479 Michael Walle 2021-04-24  936  static int mtd_otp_nvmem_add(struct mtd_info *mtd)
4b361cfa862479 Michael Walle 2021-04-24  937  {
26358f330405af Michael Walle 2023-03-08  938  	struct device *dev = mtd->dev.parent;
4b361cfa862479 Michael Walle 2021-04-24  939  	struct nvmem_device *nvmem;
4b361cfa862479 Michael Walle 2021-04-24  940  	ssize_t size;
4b361cfa862479 Michael Walle 2021-04-24  941  	int err;
4b361cfa862479 Michael Walle 2021-04-24  942  
4b361cfa862479 Michael Walle 2021-04-24  943  	if (mtd->_get_user_prot_info && mtd->_read_user_prot_reg) {
4b361cfa862479 Michael Walle 2021-04-24  944  		size = mtd_otp_size(mtd, true);
534fd7770b6dde Aapo Vienamo  2024-03-13  945  		if (size < 0) {
534fd7770b6dde Aapo Vienamo  2024-03-13  946  			err = size;
534fd7770b6dde Aapo Vienamo  2024-03-13  947  			goto err;

This goto err is wrong.  We haven't done the register so it should
return directly.

534fd7770b6dde Aapo Vienamo  2024-03-13  948  		}
4b361cfa862479 Michael Walle 2021-04-24  949  
4b361cfa862479 Michael Walle 2021-04-24  950  		if (size > 0) {
4b361cfa862479 Michael Walle 2021-04-24  951  			nvmem = mtd_otp_nvmem_register(mtd, "user-otp", size,
4b361cfa862479 Michael Walle 2021-04-24  952  						       mtd_nvmem_user_otp_reg_read);
4b361cfa862479 Michael Walle 2021-04-24  953  			if (IS_ERR(nvmem)) {
26358f330405af Michael Walle 2023-03-08  954  				dev_err(dev, "Failed to register OTP NVMEM device\n");
4b361cfa862479 Michael Walle 2021-04-24 @955  				return PTR_ERR(nvmem);
4b361cfa862479 Michael Walle 2021-04-24  956  			}
4b361cfa862479 Michael Walle 2021-04-24  957  			mtd->otp_user_nvmem = nvmem;
4b361cfa862479 Michael Walle 2021-04-24  958  		}
4b361cfa862479 Michael Walle 2021-04-24  959  	}
4b361cfa862479 Michael Walle 2021-04-24  960  
4b361cfa862479 Michael Walle 2021-04-24  961  	if (mtd->_get_fact_prot_info && mtd->_read_fact_prot_reg) {
4b361cfa862479 Michael Walle 2021-04-24  962  		size = mtd_otp_size(mtd, false);
4b361cfa862479 Michael Walle 2021-04-24  963  		if (size < 0) {
4b361cfa862479 Michael Walle 2021-04-24  964  			err = size;
4b361cfa862479 Michael Walle 2021-04-24  965  			goto err;
4b361cfa862479 Michael Walle 2021-04-24  966  		}
4b361cfa862479 Michael Walle 2021-04-24  967  
4b361cfa862479 Michael Walle 2021-04-24  968  		if (size > 0) {
4b361cfa862479 Michael Walle 2021-04-24  969  			nvmem = mtd_otp_nvmem_register(mtd, "factory-otp", size,
4b361cfa862479 Michael Walle 2021-04-24  970  						       mtd_nvmem_fact_otp_reg_read);
4b361cfa862479 Michael Walle 2021-04-24  971  			if (IS_ERR(nvmem)) {
26358f330405af Michael Walle 2023-03-08  972  				dev_err(dev, "Failed to register OTP NVMEM device\n");
4b361cfa862479 Michael Walle 2021-04-24  973  				err = PTR_ERR(nvmem);
4b361cfa862479 Michael Walle 2021-04-24  974  				goto err;
4b361cfa862479 Michael Walle 2021-04-24  975  			}
4b361cfa862479 Michael Walle 2021-04-24  976  			mtd->otp_factory_nvmem = nvmem;
4b361cfa862479 Michael Walle 2021-04-24  977  		}
4b361cfa862479 Michael Walle 2021-04-24  978  	}
4b361cfa862479 Michael Walle 2021-04-24  979  
4b361cfa862479 Michael Walle 2021-04-24  980  	return 0;
4b361cfa862479 Michael Walle 2021-04-24  981  
4b361cfa862479 Michael Walle 2021-04-24  982  err:
4b361cfa862479 Michael Walle 2021-04-24  983  	nvmem_unregister(mtd->otp_user_nvmem);
4b361cfa862479 Michael Walle 2021-04-24  984  	return err;
4b361cfa862479 Michael Walle 2021-04-24  985  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

