Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2AC165F17
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 16:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725899878; cv=none; b=JOr0XCvnAnBoG2r8OchV6Bw0z3KVKsWftDc20sdjUa3M1T4PMZ5hwn8gDs0C4j8epk9xsDHQPOiw+MEl+J2pE9R9EmOoDgpVX6cf6KFx1qDPcyM8tbegLp8pAwCklr4fAjEF1ruE4PrXY7xCIaSXCTM8xpjIRDx2XuaOdLmMWnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725899878; c=relaxed/simple;
	bh=J+TMqA4hWjbwioo7PODnJ2Mu8+DiW0Hq5YpHKC4cp8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e55xvbu+77OVxHOfuw0qAppi8DB4d/Gfi0WickEabvUnuAh5HnpjbRLgwDVhcaZ8Pkh6xSnusFOXZWFQ2c1vVMV1YDxdCuqw78AfvEx8JUcD4Rn0zrQekOz0WXKmJyCWHoUCCZXY9PVSrcao6RZcEMX6KAOYQjbTpKbrnV3T2h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yPSOt+fA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yPSOt+fA"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2056aa5cefcso1775ad.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Sep 2024 09:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725899876; x=1726504676; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JOOFqUYicDKJWHormB2k8+g8FNmBdRSZdqhfGZx3tz0=;
        b=yPSOt+fAqoZZMkyWrURSLwAEJrlOYQ7otHkinZZpvj0EmtRYDcTNIMKe6RNjyK9JHP
         nzK94qJERjnvK+BEyjRsaHIrWLbsy/uuQ1Tg81lveEkzvnH5eXwZ1h/AutFrIHXlXUyF
         s+X0othiLMxudNCvVDBzQJt0wuJjDErL3gaopi+eeByRHIyJ3RYNGf6dd6ofS2tJLYse
         pXvC2Or/3VmZ9xQbwhsXU4gqV78oNedSght1MCR+/JSgW940NWRYZaa8oJ8DsUHaxsw0
         2Tq3BFJqoBj/5rd5Q2O4g9bne76ykYmKUkcRUI6VazuYc7qad31tUfT9jXhy0CFeFN8Z
         DyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725899876; x=1726504676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOOFqUYicDKJWHormB2k8+g8FNmBdRSZdqhfGZx3tz0=;
        b=oWjNJ3D5oog2NJ7afaUxjy5fs3fYiKr4Qe2XhRHnfZcRAcP7eZpnMGaqaKk4bdYkF8
         otZeGOVuGgJzZnCODrZbgAEsn2qOw9w3DEzkBsgEfS+MiwJ22UkZ4hIT6dcjU4oUe90Z
         cO0jf7S+EgRz9QjezhnUTO62Uv8is3BF9eVrArtjCfz3EivIcCBUUNUHvG5rP7ylCceF
         9wh1efpt0Mk4jCT9vPIknl8pYB62IeOGjNc5kMz/rse9ndupFeB9fE8BdGkFXjFHLtcK
         fI+63sT/zpfGFb5R21O9G9oBw5dsMefR39PQS3+20orCuzRFIhe7N1q64qOP7YEErvxh
         EKkA==
X-Forwarded-Encrypted: i=1; AJvYcCUfTvUvUGJ+xh1HTiA2JTprtAs3p9JJF6mON1csAmamY94rTKxpk/pCeYdPEdX3/sFHQQ9wDktxMLeaWUb5@lists.linux.dev
X-Gm-Message-State: AOJu0YwWWz9K9qDwVZg75Lhk9PBS8bENhwnEra+crhDXcQlEicJZABUW
	E/jHBnMAp367cO49Y/CP7moNQ1DL7JiN8FTYMdz4KPjYrNSrqoLsYnc8BjDiGA==
X-Google-Smtp-Source: AGHT+IGt/zGxoLNJ1MV7IGrwUFYrUiSbdM2BjUXKwF/MUTbDmVMYeXNMDIi6QqLiLEXzyPirUfM6Kg==
X-Received: by 2002:a17:902:c401:b0:1eb:3f4f:6f02 with SMTP id d9443c01a7336-2070a839333mr5222855ad.12.1725899875805;
        Mon, 09 Sep 2024 09:37:55 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc1104a3sm6839200a91.45.2024.09.09.09.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 09:37:54 -0700 (PDT)
Date: Mon, 9 Sep 2024 09:37:49 -0700
From: Vipin Sharma <vipinsh@google.com>
To: kernel test robot <lkp@intel.com>
Cc: seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] KVM: x86/mmu: Recover TDP MMU NX huge pages using
 MMU read lock
Message-ID: <20240909163749.GA2168505.vipinsh@google.com>
References: <20240906204515.3276696-3-vipinsh@google.com>
 <202409090949.xuOxMsJ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202409090949.xuOxMsJ2-lkp@intel.com>

On 2024-09-09 07:29:55, kernel test robot wrote:
> Hi Vipin,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 332d2c1d713e232e163386c35a3ba0c1b90df83f]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Vipin-Sharma/KVM-x86-mmu-Track-TDP-MMU-NX-huge-pages-separately/20240907-044800
> base:   332d2c1d713e232e163386c35a3ba0c1b90df83f
> patch link:    https://lore.kernel.org/r/20240906204515.3276696-3-vipinsh%40google.com
> patch subject: [PATCH v3 2/2] KVM: x86/mmu: Recover TDP MMU NX huge pages using MMU read lock
> config: i386-randconfig-005-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090949.xuOxMsJ2-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090949.xuOxMsJ2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409090949.xuOxMsJ2-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: kvm_tdp_mmu_zap_possible_nx_huge_page
>    >>> referenced by mmu.c:7415 (arch/x86/kvm/mmu/mmu.c:7415)
>    >>>               arch/x86/kvm/mmu/mmu.o:(kvm_recover_nx_huge_pages) in archive vmlinux.a

I missed it because i386 command I used was from config given in v1 of
the series by lkp bot. That command was just for build kvm directory and
ldd didn't get invoke.

I will send out a new version after collecting feedback on this version
of the series. I am thinking of below change to fix the error.

diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index ed4bdceb9aec..37620496f64a 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -20,8 +20,6 @@ __must_check static inline bool kvm_tdp_mmu_get_root(struct kvm_mmu_page *root)
 void kvm_tdp_mmu_put_root(struct kvm *kvm, struct kvm_mmu_page *root);

 bool kvm_tdp_mmu_zap_leafs(struct kvm *kvm, gfn_t start, gfn_t end, bool flush);
-bool kvm_tdp_mmu_zap_possible_nx_huge_page(struct kvm *kvm,
-                                          struct kvm_mmu_page *sp);
 void kvm_tdp_mmu_zap_all(struct kvm *kvm);
 void kvm_tdp_mmu_invalidate_all_roots(struct kvm *kvm);
 void kvm_tdp_mmu_zap_invalidated_roots(struct kvm *kvm);
@@ -73,8 +71,17 @@ void kvm_tdp_mmu_recover_nx_huge_pages(struct kvm *kvm);

 #ifdef CONFIG_X86_64
 static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return sp->tdp_mmu_page; }
+bool kvm_tdp_mmu_zap_possible_nx_huge_page(struct kvm *kvm,
+                                          struct kvm_mmu_page *sp);
 #else
 static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return false; }
+static bool kvm_tdp_mmu_zap_possible_nx_huge_page(struct kvm *kvm,
+                                          struct kvm_mmu_page *sp)
+{
+       WARN_ONCE(1, "TDP MMU not supported in 32bit builds");
+       return false;
+}
+
 #endif

 #endif /* __KVM_X86_MMU_TDP_MMU_H */


> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
