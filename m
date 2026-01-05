Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F5B33436D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 08:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601894; cv=none; b=cDkQ+nuiIn4yIsUFckreuSbRPcbqL9QFn+H9bS8KDFIOm/ryoKX33TAC0JpkqBTyMsk6ohrklBuRClytODTpYyD57li6CqZ3T7iUEPgdtdiIVW3z9VfgwShsX4nj4X0+4jT+2TsBCaUAaLrHNuu7JmwEU6W1U8uTaxLbH2vzQkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601894; c=relaxed/simple;
	bh=xeSemJ+uXEGmBcLZFkHtNULUfuAFMGra4geqJudMdxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbvnfWppbKzH++C6ROugGFloKYyT+n53OZr09s76tTShh3YP7IipKF/I/UBvwJFaJgG0X6RET6o5ZNokBB3U4ZXZ1yv0Uvag0KYeRysbvymuSOLt8JRfSuyJ5C9c+Zns/q9tby7Sw2HZZPwsR/6qSUAkqRFVWt6r9LrH9QR2P9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XIIgzewt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XIIgzewt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so68425775e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 00:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767601891; x=1768206691; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S8CXn4FbTh1coEuPTarZ5rxlt4EPjQvflCQ7n5ArsPs=;
        b=XIIgzewtR6BWwFEGPKDnrLixEDhKe/OZ42P9pXhMgJD4T5NuwKWyG1CXCq+IuSfy3a
         SGdI8Y9RUcOL4K8egyMOz0mgwMcHQuGCLLumLFa/u85cAQeLxQdKGjeeRXPjWC7ffeB3
         qI8ZVrG8fXRwB38IJseyRTKJfWO1yAuvw323YpcBJwQXPsTW6qrw3e6VMnxrQliCY7qB
         GTLcr+7eIGw8Qmuo1MfMp1miuX3QD0lbkpVkzFHZSCRQBY1UJVKwUcOZebVa1gXHWI5p
         Itn/cTmNJcW1HSx0mZ/gBa31U67cBAObp5fUi0d5CUn0RGNQakO4prJ+xUA12EaRi71V
         H37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601891; x=1768206691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8CXn4FbTh1coEuPTarZ5rxlt4EPjQvflCQ7n5ArsPs=;
        b=dYYer41xFriGxhriSk0vpCNBl/NLTjDxlMyYdVzDH3vCyZOD3RKSrtP8X3EwXGGzhL
         nAghWqfvwGXMunTfjo/1f0PNST0D1TfG/QumR6atyQiDGFV8zKDsjs/DtXom2nDt4DRB
         Hryv7Ukm1qooo5eZkl7PFJsjjzbpk78kdXN2DR/ABdAcrRFH3sOaMG/QwJ7AKNoY5NBd
         TX0cSyBMnBf7gKvb9JcASyr5TdUGHAu1kD64++hLMhidFiazoP7S7mKQzuSXQB/MrC09
         J7fJzhodc0cAm62Ap1gJIYJFdI4Fmf+7UmWkXUGp3p/ip6taQII4WmeUVfz3UGR1DIDU
         AHCA==
X-Gm-Message-State: AOJu0YwNU8gJoTwHJwIcX3VBf1avQu/Op2eHIVeahP5DhFD8cbhesbi6
	exfb+wfuCFIlCXnX95a5YcaZb7LOm0vzRsPbb22+lt1Q4CjRwJOek+CpYo3FRMLhizfG22m3CMk
	0AviV
X-Gm-Gg: AY/fxX4vWhxmuL5x5k2uXKkcXnA0LiLTNdAPZKFY0tFSBm2FpBX7dYoRlEIcBPY5jVU
	kBcNc9xTKn0BBqxNr0JskmxsLnFtylT4mD3BPf/kJwu5OdyuZXtQt05NwIztlMFLepEckRe2LMN
	evDfZNDo4LjrzsirTIBAuX7O9S2aAMukebiA/WDG0CUVq3pztmYXtOskzoPvzy3sLEb4aIYeKA+
	H5sav69hPatfge4YAxvWum12X5X2/CCpje36zdzZZqrmSym3AHdwRRseDiiNWOR3Xq4lVffnBSq
	dN/YC4MMjedl4D3IW/s6hVA0aV0oLTeNeQl6c8r1XvRJmEjWESmLhqJfq1kwdiZaggofgjrqymI
	ttoccqcWOK4uEVI4yf8XJL6fC8oLDuFX3Wu82GjwB8SPfSx/9q2fBHRl+FCFBlcIs0DUEV8v53z
	XDNp9Y3hLRC/Iq504T
X-Google-Smtp-Source: AGHT+IE8jRh2/AvjkGS3Fm1BHrh8dWGCAOhOvB3fSV8ZKetGr6oaxMUrKR6wPOvhfyTPIrhdsDQIBQ==
X-Received: by 2002:a05:600c:4746:b0:479:33be:b23e with SMTP id 5b1f17b1804b1-47d34de4cacmr509787465e9.17.1767601890497;
        Mon, 05 Jan 2026 00:31:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d14912asm138093835e9.8.2026.01.05.00.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:31:30 -0800 (PST)
Date: Mon, 5 Jan 2026 11:31:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378
 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
Message-ID: <aVt23tyDlVK0JaEU@stanley.mountain>
References: <202512200337.um368Um1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512200337.um368Um1-lkp@intel.com>

Hi,

I'm going to be taking a break from reporting Smatch warnings until we
can work out new funding for it.  I'm pretty confident that we will be
able to but there wasn't a lot of notice and everyone was off for the
Holiday Season so we haven't really started the fund raising process.

https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/

I imagine that we should just send these warnings directly, but there
are some which are obvious false positives so I'd like to clean that
up before we start sending unfiltered warnings.

I've never been able to reproduce these warnings "iterator 'i' not
incremented" false positives.  I've tried deleting my cross function
database and using the exact same config and everything I know how to
reproduce them but I can't.  Are you using the latest version of
Smatch?

regards,
dan carpenter

On Sat, Dec 20, 2025 at 03:40:19AM +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Maxim Levitsky <mlevitsk@redhat.com>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
> commit: e4a454ced74c0ac97c8bd32f086ee3ad74528780 KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
> date:   7 months ago
> :::::: branch date: 22 hours ago
> :::::: commit date: 7 months ago
> config: riscv-randconfig-r073-20251214 (https://download.01.org/0day-ci/archive/20251220/202512200337.um368Um1-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202512200337.um368Um1-lkp@intel.com/
> 
> New smatch warnings:
> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
> 
> Old smatch warnings:
> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented
> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1721 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1714)
> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1715)
> include/linux/kvm_host.h:1010 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4961 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6092 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6103 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented
> 
> vim +/i +1378 arch/riscv/kvm/../../../virt/kvm/kvm_main.c
> 
> 6aa8b732ca01c3d drivers/kvm/kvm_main.c Avi Kivity     2006-12-10  1370  
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1371  int kvm_trylock_all_vcpus(struct kvm *kvm)
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1372  {
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1373  	struct kvm_vcpu *vcpu;
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1374  	unsigned long i, j;
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1375  
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1376  	lockdep_assert_held(&kvm->lock);
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1377  
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1378  	kvm_for_each_vcpu(i, vcpu, kvm)
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1379  		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1380  			goto out_unlock;
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1381  	return 0;
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1382  
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1383  out_unlock:
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1384  	kvm_for_each_vcpu(j, vcpu, kvm) {
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1385  		if (i == j)
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1386  			break;
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1387  		mutex_unlock(&vcpu->mutex);
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1388  	}
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1389  	return -EINTR;
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1390  }
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1391  EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
> e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1392  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
