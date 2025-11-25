Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5130F1FDE14
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 19:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764097306; cv=none; b=DQ4aB+p13fqgFrggCrVbNoUdQ7arO9xGzqi+g8biAs/d391D+++1ZeGoafGyFcSIfIKhYCwgEmq+BbyuvMfDRvY0Mw3LFEvpazWsVFDm2y6QLoEVF+tOkdr0BjHtH0ogO+A/hHGp8Fx4Bw0CHNUxNNjWEWWX+fOdDVTNOGA1+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764097306; c=relaxed/simple;
	bh=YRa3Oe0SOJcysDAiAdnjrMjYwfhBpMiZ8q9QvoO5GP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kMxj5TWEP5z6DHJ1FPTG6QLuJ4jiagBtNHi6wtO2oQKnJbkH1pA3ByZdO0MYP8kj/nx+7VnOWkJVVDXv5SYSAQ2V85yaqRcUb/6SRUKJc2IPJZE8X24jVimiX4A11VeTEBb3vZjqVsqcRSddIvFw+vATP4GYHTM8mzn4cEqdXac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YTh/urfx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YTh/urfx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so56581275e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 11:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764097302; x=1764702102; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cTgUKzvtPmH71SG11kWbnj/1vHSAxLcPsYKvhGea9/8=;
        b=YTh/urfxjilapjpcJK2TE8c31goa2lQzmqYylsl24nVgMK8ahkQwi1Ew9Uv13spCze
         j8sZqCLGRopXKGmZK01vWLe0y12maeRvWiGWdktTmcHBYjwk+s5fk7HszAg8VuR8vWas
         CFdPzdSMbDbonHQ8oPt80OTfYcJupCfUSx3UbKb5KMvu05+/kQlZhwCTL4HP2HF2X4AR
         j2b87ILXaMinL6ECJgyFF6q7LKEmOIXa+VKI0pt/MbgC20A9G6/MZ6xX0igqVw8aGzsr
         I3dlvEClWQ0ogX4VZqqH84rwDVPrZLETotXxOsR/58lJrUUdxYPGv7ur7UwtH4Seos7m
         J9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764097302; x=1764702102;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTgUKzvtPmH71SG11kWbnj/1vHSAxLcPsYKvhGea9/8=;
        b=ATPJaEsztRHYRiOtB6iMAk9IRwpe9ZOHQp535IQZxXnltjvyPL/8mRY3ui2LuOYxfL
         KiEQnAwKpQdTPqQgg6Bh4mR45FkjNt5hpebwteputHC8YChvdmL/WV5UOl5VmoaoWdKC
         aSaAD5b9ffARicfye7qbRQcAIW2LjRnifxmrHigm+mf/wD0Jvu1hx+BRQayjOqImJ8n6
         qnty+mtHH7JiIgMv0iIV8y23U8juylxBcso79B6yLWMeNzASA7c5m+Y2KpA0nR0Jnm34
         3wURvxYynD9UWTTPKB3VFB81PYHkx2nv+iNDhZNis1foNrw0xxAsKzFUOPwiGrFiyqFg
         F75w==
X-Forwarded-Encrypted: i=1; AJvYcCVrUTsM7GmQkVsrPsXxonO1rbXZNCl7ZzU6hKZUJVb7edR45l8FTkmue8zeJzkj5OuzHZahHJwJ0YwiWwYv@lists.linux.dev
X-Gm-Message-State: AOJu0YyYNvFnsKoq/0QcqGoemrPTCgqh2vwFxrB6aHaF2O/LhSVGfW58
	1zRgxVHazyyW2Xw+fc9nXg/P7KJUNTTrYWAomSYb+gNrQvZD0zbuW90O/8tJSnuXg7U=
X-Gm-Gg: ASbGncs7F8EghpyHYFF2ufpnOnyZPUh1sL023uiI9bF3GxN7hA9pIu9v/KVmlWV2/oH
	n0wGaNnU7ndDlISXoTujOpan1/v/vd8pf94F9CWnr8dqFe67XyRK/3gdDJER+GPX1OjsVAQfSAp
	Q1bQlTPjt3CH2cOeWtffBDJHEslCcrV56Bm3GRkbZhy7PyUfNyVWj5m+rLApBp0Vby8/e1c0hUR
	7AdEPPfpnShRhRLxUFpVhvd0I9l906gOVGq87A2lC0a0g7vZFeElsHKxhX1KcA+N2L7k8LrJ4Uc
	jwKbMz/R3Y3zCYXalKfUzAPDtmIThdAggQMf7pPxH8DNNrVUqbAVhHkducqsYIsnTlL1c4B/DIO
	74NUhaVj2dxvYES30YsSsygGt62PlBRPNoMbnGUBS525aGuWNW5S+5p0lgyLX9f6e2rz+EWOiu+
	PRQh8mo1MOuJtqJ787BYdO6E7LNWg=
X-Google-Smtp-Source: AGHT+IFE+7S0vwfFxZ+kkhH8VJefM13Q0uuZ0KbXhvaQzZSdMDgPVZsWN2CFveC29hwaBgSYCYiPXw==
X-Received: by 2002:a05:600c:3b96:b0:477:b0b9:312a with SMTP id 5b1f17b1804b1-477c11030a4mr178804865e9.7.1764097301550;
        Tue, 25 Nov 2025 11:01:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4790ade13ddsm3759095e9.8.2025.11.25.11.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 11:01:41 -0800 (PST)
Date: Tue, 25 Nov 2025 22:01:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/vmxon_sucks 10/16] arch/x86/virt/hw.c:118
 x86_vmx_put_cpu() error: uninitialized symbol 'r'.
Message-ID: <202511252332.56suD8dT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/vmxon_sucks
head:   8cc09ceb7eb4fc1e727ffebe33e01e28d6f475eb
commit: 1d12733bef630ec915992646f80fcea097c84f0c [10/16] KVM: x86: Extract VMXON and EFER.SVME enablement to kernel
config: i386-randconfig-141-20251125 (https://download.01.org/0day-ci/archive/20251125/202511252332.56suD8dT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511252332.56suD8dT-lkp@intel.com/

smatch warnings:
arch/x86/virt/hw.c:118 x86_vmx_put_cpu() error: uninitialized symbol 'r'.

vim +/r +118 arch/x86/virt/hw.c

1d12733bef630e Sean Christopherson 2025-10-09  102  static int x86_vmx_put_cpu(void)
1d12733bef630e Sean Christopherson 2025-10-09  103  {
1d12733bef630e Sean Christopherson 2025-10-09  104  	int r;

int r = 0;

1d12733bef630e Sean Christopherson 2025-10-09  105  
1d12733bef630e Sean Christopherson 2025-10-09  106  	asm goto("1: vmxoff\n\t"
1d12733bef630e Sean Christopherson 2025-10-09  107  		 _ASM_EXTABLE(1b, %l[fault])
1d12733bef630e Sean Christopherson 2025-10-09  108  		 ::: "cc", "memory" : fault);
1d12733bef630e Sean Christopherson 2025-10-09  109  
1d12733bef630e Sean Christopherson 2025-10-09  110  	goto clear_vmxe;
1d12733bef630e Sean Christopherson 2025-10-09  111  
1d12733bef630e Sean Christopherson 2025-10-09  112  fault:
1d12733bef630e Sean Christopherson 2025-10-09  113  	r = -EIO;
1d12733bef630e Sean Christopherson 2025-10-09  114  
1d12733bef630e Sean Christopherson 2025-10-09  115  clear_vmxe:
1d12733bef630e Sean Christopherson 2025-10-09  116  	cr4_clear_bits(X86_CR4_VMXE);
1d12733bef630e Sean Christopherson 2025-10-09  117  	intel_pt_handle_vmx(0);
1d12733bef630e Sean Christopherson 2025-10-09 @118  	return r;
1d12733bef630e Sean Christopherson 2025-10-09  120  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

