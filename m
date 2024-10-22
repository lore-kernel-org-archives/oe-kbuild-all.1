Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037041BE22D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 17:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729618794; cv=none; b=Q/mS49QsgDsOko0HmRE04iBVOEuX686PLSPcwqqOgowAfjaVyZMCRr7rj7EVAmjoiSF+euYxqJumwchKan0r67OWSh60GKjO/GaX30By778WHZ/p2o3wXsZwFKEigIqCT+J2DA2JK/u47HcFQybJWvIWBSh7qUPyOEgteYbvhhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729618794; c=relaxed/simple;
	bh=h4MIPBEL4V9WAYqdDHnPysjEyy+AelhbALPsCcTQfEw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eukSJuxNsKefv+j5xhKejcDLCjk5madP9GAck3niYQkCyqKRKdyzNKrtPOgkWSA9S+j5ydlJ2+q6VSmXr2/afZDLCfVKeO10rF5okPvkKaOXzJ6iidLW9WSldZ2MhhPQgz/DSeLdNI43xPqhMelrOTNGXwxPT4FPPyD43B4iPlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fMpuVjHF; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fMpuVjHF"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2b9f2c6559so9073176276.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 10:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729618790; x=1730223590; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5jr7QRncEkRO5SGsMaaqDvlhl7ffAWX+JklGyW9eHR0=;
        b=fMpuVjHF5BhHuGm3xpJY2XVcZPSDXEKjNTVksrwynRy1EaAXs++Kzsa/pfU7RQIHoH
         0kTWHAA4iM6A8v14Snud6q3x+bgTWv+n6BPsvOM2OoTyL2234YigpB/bwYd2nrf6YF7P
         GZatDxOPN8cVXCvg0MvDUVLM3p7Uc5+L48IptZvZxvWuif+YcwXsnALtq5kuBDcmVw2c
         GoUItb4UgPsNFYMl8EVnFsWbOt21gYIiYDJixLTKOPmoD3QnYQ+1ztGPRXsF6uNT1w8c
         SpLqCTlI9l3q7kefMeFdNpp5kj/Ytew2pKb2vMQx3pch220up9yTju3QP6VwD8D8wdiQ
         ovMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729618790; x=1730223590;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jr7QRncEkRO5SGsMaaqDvlhl7ffAWX+JklGyW9eHR0=;
        b=TUK8lEaeFj2kuQGWbAer85A1Py+Wq1ihJjnasncbPbiFuG+RYUUghMRqCiPdHeOWCr
         OptvTpy4yxEfKyzynALcRCeJHig/kRAsgf1lWH69wPHUVXmGgp6bRrJP9mK6GhBQ+yMB
         HMV0sjfI2SHOOl9N66frY6EzK2qoSadXKcLrxle/VUI7XKBrOuo6HK5rfQhNMXJywZSK
         3jT7boNAzg2Lrm2pjnRz5QIaffDOhlFGpN23PDa66IE2cscDV04HkOh4ZoW617k78Q9f
         pBI+y9QYcpxQif6eL2j3TntelUfHgZWuEnzRaBXsmbikrKowY+8XsOtgdfcTI/cRD/ob
         AEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5B1NVG6VZJ5pP9VnE8Kc4/HFAfvJkAZ1rQH93PVtAYcI5SJoU8GUCDwF0LzQ4p38054OZh0CxYaRJDonj@lists.linux.dev
X-Gm-Message-State: AOJu0YzuZmOjuGbAi4aLuT6FqIFDkldaJU2GRH3jEe+kIIPFsPY7IXCS
	XLbXC2CG7ApnOFTNq/N2WVffZeom/PiWojAWQLDW2tI0aAgbVmV6d2zUXBLUAkXScGAd6uy6KpU
	lPg==
X-Google-Smtp-Source: AGHT+IHdcr2KhjJfi0r4/pv863MLMN/g4e+rJOpfIkh1PjtUb3WAG+XrA2IzFLb2akxoRH6w2udzXx0f8U4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:7485:0:b0:e2b:cd96:67a6 with SMTP id
 3f1490d57ef6-e2bcd966c76mr6652276.5.1729618789765; Tue, 22 Oct 2024 10:39:49
 -0700 (PDT)
Date: Tue, 22 Oct 2024 10:39:48 -0700
In-Reply-To: <202410201716.n8f4T911-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202410201716.n8f4T911-lkp@intel.com>
Message-ID: <ZxfjZDVjgmBF918G@google.com>
Subject: Re: arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse: sparse: incorrect
 type in assignment (different base types)
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Sun, Oct 20, 2024, kernel test robot wrote:
> Hi Steven,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
> commit: 59cbd4eea48fdbc68fc17a29ad71188fea74b28b KVM: Remove HIGH_RES_TIMERS dependency

I highly doubt this changed anything.

> date:   6 weeks ago
> config: x86_64-randconfig-123-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201716.n8f4T911-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201716.n8f4T911-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410201716.n8f4T911-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [assigned] ret @@     got restricted vm_fault_t @@
>    arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse:     expected int [assigned] ret
>    arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse:     got restricted vm_fault_t
> >> arch/x86/kernel/cpu/sgx/virt.c:60:20: sparse: sparse: restricted vm_fault_t degrades to integer
> >> arch/x86/kernel/cpu/sgx/virt.c:354:36: sparse: sparse: cast removes address space '__user' of expression
>    arch/x86/kernel/cpu/sgx/virt.c:385:24: sparse: sparse: cast removes address space '__user' of expression
>    arch/x86/kernel/cpu/sgx/virt.c:385:43: sparse: sparse: cast removes address space '__user' of expression
>    arch/x86/kernel/cpu/sgx/virt.c:385:58: sparse: sparse: cast removes address space '__user' of expression

These are all easy enough to resolve.  If I find myself twiddling my thumbs, I'll
send patches.

>    arch/x86/kernel/cpu/sgx/virt.c: note: in included file (through include/linux/miscdevice.h):
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
> 
> vim +59 arch/x86/kernel/cpu/sgx/virt.c
> 
> 540745ddbc70ea Sean Christopherson 2021-03-19  32  
> 540745ddbc70ea Sean Christopherson 2021-03-19  33  static int __sgx_vepc_fault(struct sgx_vepc *vepc,

LOL, I can't outrun my past.
