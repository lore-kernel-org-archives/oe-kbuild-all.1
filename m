Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1186934DCC4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 09:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594239; cv=none; b=kPsneFwZ99IwiQeNcE0gPPZAn93JOkHEtK6BaPvjr/Me1KrQcohKpGasTg67AiOThB4Kpl2uLgqaseZTGGvJ5Un8PWQE76azl5muR4Hc3tt5ODtozZmJzqwQi22YzmPDR1DeYxO6bqf5s+yVf3fxGaOz21KxkrGfP1O2HvXY+EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594239; c=relaxed/simple;
	bh=GggrU3bHRA2xu7TDJMBNtXtRmwXwSU/q1CIR6m78pCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PRxcdXziiCqceBC7Xmf3N9JF34zCNhCpAk1lveYvIB1IfRRFfU0NQbXdrm+AV7t07s4lS4ZxZJ4Ze4kgVE+niySiqR6paCwiKl3tCGSvsTcxGDTbnV56rT4BSkYkp0oas7f1n+V77uEoNPq5qTD3crKJABUxga1A2NW86ra/HOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rD/cYRq7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rD/cYRq7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4359019da8cso5488942f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 01:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594236; x=1770199036; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HmurQjdqSltJTABjXwnR2dRO5LAhljSLSjk5kJrk+Lk=;
        b=rD/cYRq7fgjugWFdTRge8wcXUuAsiXVjkJaq3wipEi5mKRm3hcLqKbdM5PzREobT3N
         tpBhtKGpcGBB5anH8oCIBrI6hmus/1/hBnmPo7rVvETAlStyuiKhmNZElH5tlTFcm0nJ
         ySVTicHfQEOrhLOb8ogLzCL71XHYXT5wN4ds4MvbnIK5KewSfxyisOBXBl432xQmMIbz
         Pn2JTbh2aPa5qk7EbJHzAoKC2kiQv9Y92M8kTpjE1XZek9o8OG76rFusV2tqZynWkPKE
         wwTE/IthBr8g3i2zRDkW6S6fuBtTbepSd+XKhffDNIY9Sp87MQ0fGy0CyTiddwy6KLDl
         mFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594236; x=1770199036;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmurQjdqSltJTABjXwnR2dRO5LAhljSLSjk5kJrk+Lk=;
        b=CL+41qquB/8bT76V13Q4vlRdrGegKzl2h/9YLrXiIftFG9mfeuKm5vEjv556Vsoz7y
         US0MGxlF9qZdyT2Qehnaa98L0a7x9AmRX65Viy6eyB3zWNKwMhr8U3z9MStaFtzdGCdm
         lFGYEbQGJ2phkGttBcZ6/j9DO+7YG/xCdTCYT9nKRWmRM02KpAhfaARzkXdNneiSwki/
         SQkuknnSt0xl2dga3cmMydJdM/D5zEpgoVjphrMFaKP7H5LE4R+z4LWEb3rtVZgWNJFm
         m9ZXkSBRs1Qn04MOjnEFSn5CCSVkzudEs4ES3cOOKl5qJAWbERcCR4y0Pusvp/Zt8h02
         dVSw==
X-Forwarded-Encrypted: i=1; AJvYcCVwm7vPq4IcOPZurl6nnQ3CLT0O7j8P3Y+B9fdddjdooAZRm1TKmlttnK9HC8S4znvThSfeJyqjONV9vX9U@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6YygK5sVQjWc+bAcgfHBewLB4ywa+HVvVOoSoZbGgcul1mGzn
	bq9QzsaptRznuLU082vTLg1qpYEpCguX9UgGpnfvjyc/QLo0mx+4UqBs/IUg4wxofaI=
X-Gm-Gg: AZuq6aISQ1JoyQstXCCJZWMk4UE4mvfQFG64owU/lxDx8A+0PgvLV/TWNhwDQ3JolO2
	rCv60G0T+Q3l/itGF6sjM7DkjK7A3ZctcfMKjOMiuEIbnN7M37yZO4pZ51xQqqF+iZ74vB/yKwC
	gXblfVKrPEuODQQ7RYLsgh2bw/mYkhbhW/vmTYHnudi9A7bV6KhpfsqK3XWc4CVLFim9rG1gHr/
	N7YS4FRQUwwlAZYOFE6JgFB0YiVSLJnviK9YUXABP3gOMLjIvIGyACuXv9/kfYhn/cZCuW+oY2l
	2Z3EtiKHcSTJGZJJbZUDdbhIZ7kYM6o+8O4Cd8DR+PRhGZtfw7cRw4exAIbsoC6up6DpZ+9aSBe
	vL/xCVSXcIXXSpll1QJ65f/P60FUeTe6/1h2m3UHTLnC4Qi6vrzHsPGnTbu+K/cDoDhG325rUL5
	1UmecXVpf3lQe0vRfd
X-Received: by 2002:a05:6000:290f:b0:432:7068:18a with SMTP id ffacd0b85a97d-435dd032b79mr7484322f8f.20.1769594236265;
        Wed, 28 Jan 2026 01:57:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfc9sm5507393f8f.21.2026.01.28.01.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:57:15 -0800 (PST)
Date: Wed, 28 Jan 2026 12:57:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 40/47] arch/x86/kvm/mmu/tdp_mmu.c:1485
 tdp_mmu_alloc_sp_for_split() error: dereferencing freed memory 'sp' (line
 1483)
Message-ID: <202601250549.1WtInTxT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   4277c23972d92102c257f4d22acd908a47c0d69e
commit: b1b08e9b2efc1b59d94433702c6c4669cbd86ba4 [40/47] KVM: x86/mmu: Add Dynamic PAMT support to vCPU-induced page split
config: x86_64-randconfig-161-20260124 (https://download.01.org/0day-ci/archive/20260125/202601250549.1WtInTxT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601250549.1WtInTxT-lkp@intel.com/

smatch warnings:
arch/x86/kvm/mmu/tdp_mmu.c:1485 tdp_mmu_alloc_sp_for_split() error: dereferencing freed memory 'sp' (line 1483)

vim +/sp +1485 arch/x86/kvm/mmu/tdp_mmu.c

4957bdc853d5f9d Isaku Yamahata      2026-01-21  1457  static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct tdp_iter *iter)
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1458  {
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1459  	struct kvm_mmu_page *sp;
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1460  
e1c04f7a9f4213c David Matlack       2024-06-11  1461  	sp = kmem_cache_zalloc(mmu_page_header_cache, GFP_KERNEL_ACCOUNT);
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1462  	if (!sp)
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1463  		return NULL;
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1464  
e1c04f7a9f4213c David Matlack       2024-06-11  1465  	sp->spt = (void *)get_zeroed_page(GFP_KERNEL_ACCOUNT);
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1466  	if (!sp->spt)
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1467  		goto err_spt;
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1468  
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1469  	if (is_mirror_sptep(iter->sptep)) {
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1470  		sp->external_spt = (void *)kvm_x86_call(alloc_external_sp)(GFP_KERNEL_ACCOUNT);
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1471  		if (!sp->external_spt)
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1472  			goto err_external_spt;
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1473  
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1474  		if (kvm_x86_call(topup_external_cache)(kvm_get_running_vcpu(), 1))
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1475  			goto err_external_split;
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1476  	}
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1477  
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1478  	return sp;
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1479  
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1480  err_external_split:
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1481  	kvm_x86_call(free_external_sp)((unsigned long)sp->external_spt);
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1482  err_spt:
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22 @1483  	kmem_cache_free(mmu_page_header_cache, sp);
                                                                                               ^^
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1484  err_external_spt:
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22 @1485  	free_page((unsigned long)sp->spt);
                                                                  ^^^^^^^^^^^^^^^^^^^^^^
This is done out of order.

b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1486  	return NULL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

