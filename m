Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED063E95A9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150119; cv=none; b=LQe9jopB6khaMUySYwJL0iL6voaAtbvRY3QLFG62/y+wGOzcxC2Np+45HeRQ5C9Hk1gqYmYguKCqNtcoBAI2PuGQ2e66b3ENs1+BNqzAOtNvyBRfgz0DB2O4XqpEbH+xZNgKWz42Xoac9uZxBPoqGUWLqIySABlG4OZ03Ne+B0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150119; c=relaxed/simple;
	bh=NvWjKGEH5AexCh1wgfM/i3jDoFq2EoAZy1t+xwdmTeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=djYy09XMO3YS4iZ2UgzswSEY307UQ37I4PQapajRVtJ58i9mfCpV9rpWnarnmWl8ux+xwHyS8gUzio1wkOmIbzd0lZVaZppfzU1F0kVxENGtqiUmOoJr0MXcedhjZtTSkKknqvtouPoZ16OJQC2dUkY+lqu/ersZlIlC6U8lad0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxhKIX+e; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxhKIX+e"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-47c7b282d73so383913b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 May 2026 03:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778150117; x=1778754917; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8K3OIHFb9yqqZ050RJZMLwdoBWgFfUeLBVGnuqXPek=;
        b=WxhKIX+eN8pd159Pe9NdCLRz+Y06CFy7dHTlxyzrh+jGwke6PkJeEBjtr/73RrE/B1
         yAUcDZ+l+kfq+ZXlUj7/p23R9Arbk/eBSFf9fLIaKQHaO2n+O7VFtob9NnX736Ts2rd9
         LpnnX8sQiFQ4Hq9A1pkoodClLaBNA+3g10Ce8/msFjOJAhx1ho4+17ua16GWfzjofw8q
         /KD2RK4wTM9MSEzvKpO8ssQYM7qNtiF+bDU7+ezLO/cqXubLFof2PyclcstKQPzw5CEH
         Li4QUyC6NTTDVv7ZPKY39sBWINwmSK2u6lfN6WmzaFuDUumeUWfOYYem+Y617GVcreEE
         KSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150117; x=1778754917;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8K3OIHFb9yqqZ050RJZMLwdoBWgFfUeLBVGnuqXPek=;
        b=gx5YKNFfxuJM20kMlp2J9ccVG2KHNMT7J4f2uT7VMwgB0+hS3NLnxnGjZHkJ3Ju5Sd
         l4lli9MDZo2NuKWcg2iPX02U8e/OsETwClgBbXLuB8bVXSWkfgdhprSacCpQWVT0Bxiq
         Pvc6wStPntRk23mvFrsjjy97Z3c1snEOmJtS/L/kuO28afLYKqkL5+OGFdjmHTkw9fVn
         DI0fTLRPptkaUGJlg4zBEmTrfzXaGhNSdhnx0Haz5NRT2MF3FFZehnYpLu8hiDCurkP6
         qhC0OrXk0DlZbi746TEgU8Tyjl1lnxScf81iN0ehxCgC30S26SJFZH8QCQ3P/HIpQX0W
         E0oQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BYVFo1YIQU5biF+/whvqh9bbU7cJvCRrmhIGkhCVL0lpDWJuwxh4bxeGq/c8COYZ4ynIP238DaQrckmv/@lists.linux.dev
X-Gm-Message-State: AOJu0YzbMsaLyGTBcOPagMxWVYVB1u6OGcQ0WZH9Vs4V3a6tE+XLD8fz
	NGhSeh7akm4lJgw9F+PtmQw5hmLoSYx4SVy9FmazCoAtfBwYB2vYm/SA
X-Gm-Gg: AeBDievQRFxCmSb7NgTOqW15nJwTbIFLi8AVtUXhevR+cgFXi0BZ8OX0Bo1RsvSUVzR
	hW6YxjDF9B0BKT4vcyg1fyluXU/z5oHrLTgs3tusG8I7zDin+MLNkxTgFG+5TadvfP8zrKEBtGR
	ZPBZIJpNW2KWAyDHkCz8rfc+AWIpDV2Y3jY62GxovExiQ0vx/WfcWBxtTcVve83HkyOUndsLPJK
	f1v5a1l4xYmq2SLH/SLfANJATMidg25QJ9pGFqJT5BTqaBbWJ+lfxBZEU4s6sde5As/B/MaQ14l
	g2vCQp7XvpR9v8nu6Qw3Lqsrq/+hMOFtCqJo+N2aUDHToHgUgaoTxhYsx2tz19btRabMLlEYUd5
	TCxyHqyN0SLuN8TNKJ/ZhSG9QDM6HwWQZG+uMEqzFUDoLWU5F1xJoLI5Lhx4A1KcU4Yic3GfJCu
	KdFm2z8l+0iOA8H43DZ/mP00SUVeIJfw==
X-Received: by 2002:a05:6808:1481:b0:479:646c:f701 with SMTP id 5614622812f47-4804253d27fmr4138047b6e.41.1778150116861;
        Thu, 07 May 2026 03:35:16 -0700 (PDT)
Received: from localhost ([206.212.255.140])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c763b33c1sm12358484b6e.1.2026.05.07.03.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:35:15 -0700 (PDT)
Date: Thu, 7 May 2026 13:35:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Lorenzo Stoakes <ljs@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [ljs:project/cow-context 4/18] mm/cow_context.c:102 __dynarray_dup()
 warn: variable dereferenced before check 'arr' (see line 91)
Message-ID: <202605071712.tNPizmiC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: 86c4a37b876ec7ed8a5b42d5c3f7b3c4b0bd5c03 [4/18] mm: add simple dynamic array implementation
config: arc-randconfig-r072-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071712.tNPizmiC-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605071712.tNPizmiC-lkp@intel.com/

smatch warnings:
mm/cow_context.c:102 __dynarray_dup() warn: variable dereferenced before check 'arr' (see line 91)

vim +/arr +102 mm/cow_context.c

86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   89  static struct dynarray *__dynarray_dup(struct dynarray *arr, int cap, gfp_t gfp)
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   90  {
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  @91  	const int nr = __dynarray_nr(arr);
                                                                                     ^^^
Dereference

86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   92  	struct dynarray *ret;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   93  
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   94  	ret = kmalloc_flex(*arr, contents, cap, gfp);
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   95  	if (!ret)
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   96  		return NULL;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   97  
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   98  	/* Just allocated, safe to assign. */
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   99  	ret->nr = nr;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  100  	ret->cap = cap;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  101  
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01 @102  	if (arr)
                                                            ^^^
Checked too late.

86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  103  		memcpy(ret->contents, arr->contents, sizeof(void *) * nr);
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  104  	return ret;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  105  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

