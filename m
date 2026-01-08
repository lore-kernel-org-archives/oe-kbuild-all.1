Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29484377A4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864223; cv=none; b=s5n2rMpNyCYCYtduFzC76jKQWcytdzCwSx9hD3RvAWwjpCS1srsYwLpbKwXXbwd/Fb5wRDwz5DiLDu5lmwsgoEW6A7sb+qv/7OOmphM8kaOaieDV9yvdbYltbK1Ib3FTeqJw2vph2UJmiLZocJA/ZQBwT68A1gi0+qAmQFrMItQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864223; c=relaxed/simple;
	bh=GE1YL8KZCkG4Mq/OgGzEYuNZCrNW1uZ7TumAhpU7sVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHMQtrY9gjWd4lCnCFiJhbcrnUmTdVECCIALk+NJ9fbLYXFCGHAb8o6Cr0gvuzmERyQKpsIFI9Wgll2A+qhpij+tZZFEFocJTMv1DrQqMU2Txdr59C9FFAjnTQlGC0DbDkW15aWK6jf58SG5+nJg+Dtbf+CFW1vJny9+Ip19res=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E+d36dJQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+d36dJQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso31780245e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 08 Jan 2026 01:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767864214; x=1768469014; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zGXQyxE2vz1SfJ48RCDqUYJUfL/Bt9aXZXLDnvM/FCI=;
        b=E+d36dJQn3LL9zKdWOOgwt0W7iFfLqSbzNy+WFYMEK+o0mf6Rws9YL1196MFN5AUSM
         taFmLG01hvq/25p+72qjuzZjlcp/i5QLDCmVX8/uP6W03jcQq3wzaDqqXuBZfweRc5UH
         LAqzmHmNT3Ai/PDVlQoKncAgOo7TAkTRfHvQV7nogEP+dleCuaQI3vQ7eHuQjGIElht/
         Cu/ty3q6w1/AQCcHaye87OAk7375u+ngOS4NVp17xMRKJaqDMaHsUzF76Aaj6IzlujS+
         koGwaydTyWyRmiurBvr3zAfiWfcbZiz2fuj5XkZ98IT9hIoC/zS+Q6CBUIkXBC0eoIOd
         J2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864214; x=1768469014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGXQyxE2vz1SfJ48RCDqUYJUfL/Bt9aXZXLDnvM/FCI=;
        b=YGH/oycAEIheZK97YGSxlNrWvQu5GrGLtApjt1KGRPQYFnNty61NspwmZC26wbo+NI
         z8KbyXuIgNF3EeeNgk6rKj71c4RGYqRf83hG1pKHwg9XDbVKF2ln9yT8wcFa5phJzI4Y
         WNuGdNBwzsbK9YsodlxttniQAPuMW0RlP+1WigH+GoxxDkXZ3Jc4N1WnZksAjKX7eERZ
         ePX050SmxQF8xwyQDJFXeRWaUNxrv5c6gd5XRg4mLyPY7qAJBDjCDB09uB3qRu83Gqmd
         aFCtXRbNIAmWCdrne3GfbTfCF3u1r0O27qvNsNqsV5F4lHCIIdT1RlH4/CE5AfN/nza3
         /XnQ==
X-Gm-Message-State: AOJu0YxoskWnBon7gjxDtR52PUFGPF40NPX1OWZwrkwpF43m81HM4keb
	dqnOd7yp3E2yqVCb2317QUa9h7DwuKCXqx8cHC2NMhyBVjYnDIuOMzoahqFQyNo8mvQ=
X-Gm-Gg: AY/fxX42F+2ZQ9BWakgYM1IDrqvN+wfUrBSfwUHZJW6fAbtBvNMkElZF22F65R3KQoj
	rQ8snYAAMIkDR7r++A4Oke8IBqBHuH0z4grq4ylPsHpFLbpF+ANLwn98w8NQn38LO6hplyGKvMj
	YVzSc5rUyF1lWJYjBJn0hXRNxERa3U4ktvOKhx9TSJwmzLX02qAZQJVmmyXFSSAbvQRkcukthRA
	P5LnuRFoxXBGVbtqmRFdtLTaLXW5qfiHV5VVb1SP3P0vXAOG6JoCPRp9IMiXc/6cYtzDQAAfscB
	5mKjCyrrkIxd/NgA0epX4uT1+tp/VNU9B2/3WkbSnw93uODmYRHRNw0HxnraAscDUd+SWEyyxAP
	FvaafD0w9Q1tMtson4qwFHf4/1UP8DizFLmq/Q2Wfyi95lrZCsmzH+PXe/uty+5/WTxMJt7IBcI
	RdJv/Dv5lc9aiwnBEMvqS3d7JyVno=
X-Google-Smtp-Source: AGHT+IF/NrMEjFeefIJzR8iU1U30zHWbFO9iluedXaDPZ4QNmkMxM8PkEMkZo2rWCUzC44gTfJ4DPw==
X-Received: by 2002:a05:600c:c08b:b0:47d:6856:9bd9 with SMTP id 5b1f17b1804b1-47d84b33bccmr53946745e9.23.1767864214162;
        Thu, 08 Jan 2026 01:23:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d86637b90sm36426085e9.2.2026.01.08.01.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:23:33 -0800 (PST)
Date: Thu, 8 Jan 2026 12:23:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Li <philip.li@intel.com>, Yujie Liu <yujie.liu@intel.com>,
	kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378
 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
Message-ID: <aV93kq7uh1cWCVF1@stanley.mountain>
References: <202512200337.um368Um1-lkp@intel.com>
 <aVt23tyDlVK0JaEU@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVt23tyDlVK0JaEU@stanley.mountain>

Hi Philip,

Sorry for not CC'ing you on this email.  Do you think you could help
me reproduce this warning?

regards,
dan carpenter

On Mon, Jan 05, 2026 at 11:31:26AM +0300, Dan Carpenter wrote:
> Hi,
> 
> I'm going to be taking a break from reporting Smatch warnings until we
> can work out new funding for it.  I'm pretty confident that we will be
> able to but there wasn't a lot of notice and everyone was off for the
> Holiday Season so we haven't really started the fund raising process.
> 
> https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/
> 
> I imagine that we should just send these warnings directly, but there
> are some which are obvious false positives so I'd like to clean that
> up before we start sending unfiltered warnings.
> 
> I've never been able to reproduce these warnings "iterator 'i' not
> incremented" false positives.  I've tried deleting my cross function
> database and using the exact same config and everything I know how to
> reproduce them but I can't.  Are you using the latest version of
> Smatch?
> 
> regards,
> dan carpenter
> 
> On Sat, Dec 20, 2025 at 03:40:19AM +0800, kernel test robot wrote:
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > CC: linux-kernel@vger.kernel.org
> > TO: Maxim Levitsky <mlevitsk@redhat.com>
> > CC: Paolo Bonzini <pbonzini@redhat.com>
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
> > commit: e4a454ced74c0ac97c8bd32f086ee3ad74528780 KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
> > date:   7 months ago
> > :::::: branch date: 22 hours ago
> > :::::: commit date: 7 months ago
> > config: riscv-randconfig-r073-20251214 (https://download.01.org/0day-ci/archive/20251220/202512200337.um368Um1-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202512200337.um368Um1-lkp@intel.com/
> > 
> > New smatch warnings:
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
> > 
> > Old smatch warnings:
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1721 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1714)
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1715)
> > include/linux/kvm_host.h:1010 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4961 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6092 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6103 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented
> > 
> > vim +/i +1378 arch/riscv/kvm/../../../virt/kvm/kvm_main.c
> > 
> > 6aa8b732ca01c3d drivers/kvm/kvm_main.c Avi Kivity     2006-12-10  1370  
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1371  int kvm_trylock_all_vcpus(struct kvm *kvm)
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1372  {
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1373  	struct kvm_vcpu *vcpu;
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1374  	unsigned long i, j;
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1375  
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1376  	lockdep_assert_held(&kvm->lock);
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1377  
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1378  	kvm_for_each_vcpu(i, vcpu, kvm)
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1379  		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1380  			goto out_unlock;
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1381  	return 0;
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1382  
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1383  out_unlock:
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1384  	kvm_for_each_vcpu(j, vcpu, kvm) {
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1385  		if (i == j)
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1386  			break;
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1387  		mutex_unlock(&vcpu->mutex);
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1388  	}
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1389  	return -EINTR;
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1390  }
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1391  EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1392  
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
