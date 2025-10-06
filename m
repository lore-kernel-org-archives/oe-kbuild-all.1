Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3321DE4C2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Oct 2025 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759736001; cv=none; b=Dqop9dDz0Bz4YEIAKcFWJ6FRbw5+hSseYzUZ85YipGZQzcUg4JAhW3gjp6tmzMTICAeWAfpxQ2Tl4a96sO6WW5tk3fJdnEw2EZwZg75/cqiEeufgklSZOPty92PzT+7pY249yoDI8j1PaMjBT0gG7iAvvgLCKXq76V/1mjAlZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759736001; c=relaxed/simple;
	bh=SZzGHvqd25HlgCSKTD0VdSNQ1UMIgyKDNBEAI3lCnbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=r60GL1Rb+eVgKs4p9FM0o8FhgybWtP4PaaA9t+ZWwXi8pxP6ua2l3dgV9Odtn3mgxc5/j5shwypK5zS7NT0Dy58hWQYQu9K6Z4MaYgAJrpui3vc4oBYYAtS1+NxSNvgpj770W17jesBz0IP6c/hsH46ThbJeR+R1hguKNg3jjTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OptTUq2E; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OptTUq2E"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso29145675e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Oct 2025 00:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759735998; x=1760340798; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D3ZEr2d7pwTIHaluHUG7JQgfUgOPLmXul/6qgxWDE8g=;
        b=OptTUq2EDWjI3uLZpQDQB/zw6IfDNj6VAeGAdYHLk/ZZDiCLzWSBCj3hyF+6No4/rr
         RqYCZMCvcwU2oUUqw7ZlqbMWYcCPz1Bn9ebrVAi3gjEwDsQmOJGNXPtphJfH0HWDyV5h
         mHNm0IMNZX/7y+sPn4h7n6c6JI0IeRDBMw5leocD2n0wPX1e2fKUVMTrSov5eIlYOg0J
         rksNMb2OIm11N6DbltJVimvaau8E2MXfQpxA3ZSlxMgLCDsAvPO4ksRdFFztS2EjzQWA
         bXcAon4L01yvEJxRVk2dXApPx26c+vfEKpSJZvRIhEMdXOL2hYF/PVKNx+7Y+qL6vCse
         dj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759735998; x=1760340798;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3ZEr2d7pwTIHaluHUG7JQgfUgOPLmXul/6qgxWDE8g=;
        b=Ys9y0f5466jS4nji3ZgP9tt0PZE6shC+Mdoe4paczT6eg/YWUIar3agCVSS1ucdMbQ
         0bUuyBbUwQtIUb14HF498WFc2/0cLi7rhMpDHkgLlKG1gqTV2VoJ0k03y69ZXH27fDE8
         Dql3+0BVoz5VsGjP6MO0zPyv7sg4Nc/JcNpItMhExSqqdxSm6x1BkT75UmOt+8FrB5mD
         9hDpckoVLn811XsDoxc0iCVXhiEhwho2ZfZ1+qhamKUhyEOE+5ENQOq68d15p/moxz9w
         viGSrPyfJ3lgqBs+ZD9pGQAIE+Ihk3tuXGvJeU9b7bEYVPqdj3uDnJ6xdu0OR7oRN4km
         FzuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe9xezfgllDHeYidI052gLYpCqLQg+fvdQtiQQbV0vCBzBGdvocfl7P3gJn5FrXw+0qHOf3m8Jcq+GQZ3c@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh1IkNv3QepREOzM/d/tbQUO13hpI3GzQHGpJxJUrf6RBSZ77o
	KZbLlpX4Ej3Ai9+f+8KFGq3glRlAuKUNa2HHvdKPFCBMpZM5JOY79U2DtAzpA6OI/P8=
X-Gm-Gg: ASbGncvu3VsqvMtX4EkQ4S4WDCd2eesd4eRdYBFhTe8aVKMYv8OMO18htOWzcb5xnLT
	1zn7A8rDIN91Oswc60lfIhQemlQP5jc67QyCGJxKqPyT+VcXN/Z7l2i6iTmR10SXJNUQ2WaeD45
	Ygh4+D3sElRTrzKLDW6pGAqxmkwKJwReO6Ng3fijyAiu4pOCEUEcemjRyqIwJrFa/mv/HlLTbFy
	Mz7xMCxgXIErDwTQm0GHy0oXz3A3hXntHYstAaGtFMdyuZNqhzXyrfFA/oYDxpVvcb4JMsTK3by
	sntGhl3d+nU5FaipdHWsHZ5yMpmlRcmrW2MsdVmh7zwBLuJlnsLJLb9hpfI6f8O063Rfcyo6kJI
	CsY9zglenMbnCOM5hLgs2i3VnDMSDbyW2zbNu4mKqZO5UUcyFwAKDQNbek0Pu9FvV4No=
X-Google-Smtp-Source: AGHT+IEY3Vdz6DSENDPXWHaU3Pw3qJ2jmGm2AQUbIDp0HgmMLAwC9lJKK+vWRw7LBtZ3XAYcVnYPJQ==
X-Received: by 2002:a05:600c:3149:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-46e7114829cmr64921245e9.32.1759735998124;
        Mon, 06 Oct 2025 00:33:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e619b8507sm243679325e9.3.2025.10.06.00.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 00:33:17 -0700 (PDT)
Date: Mon, 6 Oct 2025 10:33:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, James Houghton <jthoughton@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	James Houghton <jthoughton@google.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: For manual-protect GET_DIRTY_LOG, do not hold
 slots lock
Message-ID: <202510041919.LaZWBcDN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930172850.598938-1-jthoughton@google.com>

Hi James,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/James-Houghton/KVM-selftests-Add-parallel-KVM_GET_DIRTY_LOG-to-dirty_log_perf_test/20251001-013306
base:   a6ad54137af92535cfe32e19e5f3bc1bb7dbd383
patch link:    https://lore.kernel.org/r/20250930172850.598938-1-jthoughton%40google.com
patch subject: [PATCH 1/2] KVM: For manual-protect GET_DIRTY_LOG, do not hold slots lock
config: x86_64-randconfig-161-20251004 (https://download.01.org/0day-ci/archive/20251004/202510041919.LaZWBcDN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510041919.LaZWBcDN-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/../../../virt/kvm/kvm_main.c:2290 kvm_get_dirty_log_protect() error: uninitialized symbol 'flush'.

vim +/flush +2290 arch/x86/kvm/../../../virt/kvm/kvm_main.c

ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2255  	n = kvm_dirty_bitmap_bytes(memslot);
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2256  	if (!protect) {
2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  2257  		/*
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2258  		 * Unlike kvm_get_dirty_log, we never flush, because no flush is
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2259  		 * needed until KVM_CLEAR_DIRTY_LOG.  There is some code
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2260  		 * duplication between this function and kvm_get_dirty_log, but
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2261  		 * hopefully all architecture transition to
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2262  		 * kvm_get_dirty_log_protect and kvm_get_dirty_log can be
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2263  		 * eliminated.
2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  2264  		 */
2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  2265  		dirty_bitmap_buffer = dirty_bitmap;
2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  2266  	} else {
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2267  		bool flush;

flush needs to be initialized to false.

82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2268  
03133347b4452ef virt/kvm/kvm_main.c    Claudio Imbrenda    2018-04-30  2269  		dirty_bitmap_buffer = kvm_second_dirty_bitmap(memslot);
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2270  		memset(dirty_bitmap_buffer, 0, n);
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2271  
531810caa9f4bc9 virt/kvm/kvm_main.c    Ben Gardon          2021-02-02  2272  		KVM_MMU_LOCK(kvm);
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2273  		for (i = 0; i < n / sizeof(long); i++) {
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2274  			unsigned long mask;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2275  			gfn_t offset;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2276  
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2277  			if (!dirty_bitmap[i])
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2278  				continue;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2279  
0dff084607bd555 virt/kvm/kvm_main.c    Sean Christopherson 2020-02-18  2280  			flush = true;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2281  			mask = xchg(&dirty_bitmap[i], 0);
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2282  			dirty_bitmap_buffer[i] = mask;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2283  
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2284  			offset = i * BITS_PER_LONG;
58d2930f4ee335a virt/kvm/kvm_main.c    Takuya Yoshikawa    2015-03-17  2285  			kvm_arch_mmu_enable_log_dirty_pt_masked(kvm, memslot,
58d2930f4ee335a virt/kvm/kvm_main.c    Takuya Yoshikawa    2015-03-17  2286  								offset, mask);
58d2930f4ee335a virt/kvm/kvm_main.c    Takuya Yoshikawa    2015-03-17  2287  		}
531810caa9f4bc9 virt/kvm/kvm_main.c    Ben Gardon          2021-02-02  2288  		KVM_MMU_UNLOCK(kvm);
2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  2289  
0dff084607bd555 virt/kvm/kvm_main.c    Sean Christopherson 2020-02-18 @2290  		if (flush)

Either uninitialized or true.  Never false.

619b5072443c05c virt/kvm/kvm_main.c    David Matlack       2023-08-11  2291  			kvm_flush_remote_tlbs_memslot(kvm, memslot);
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2292  	}
0dff084607bd555 virt/kvm/kvm_main.c    Sean Christopherson 2020-02-18  2293  
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2294  	if (copy_to_user(log->dirty_bitmap, dirty_bitmap_buffer, n))
58d6db349172786 virt/kvm/kvm_main.c    Markus Elfring      2017-01-22  2295  		return -EFAULT;
58d6db349172786 virt/kvm/kvm_main.c    Markus Elfring      2017-01-22  2296  	return 0;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2297  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

