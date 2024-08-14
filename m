Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E81BD4E9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723659877; cv=none; b=mcbhoJU+HALqgvm5I3ralXTFwRB9KhVn91r1jk6q0xW85sGCIV7JLM5aLqNPMKZxp/7XasrUx6PUUS8aWgjYyF193oHGxF8ZnSIMqx0bytU4IDyYfFfDI5zpG40WMZ9tv4GbsavrEtyl5M6/LahKERElljU3ZTmLBz5BgqJO2z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723659877; c=relaxed/simple;
	bh=fUPdp1FJP9o6RPzeUXh0crfnPnpeOC6DOpOpQNM1eGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFDSg3hlKEEMy+7G/5M5vrR6ZJngo5Q0znrD8xa6L3wOjR6a8FTtZvtsCRx2bkKvVhjt24o4PNTLhk71UFiUj5X8Fn/UyUgUgKyDg3iwkLTagFdP/Q5BvRIAz7N8fxjxvgTwvJMswFp3pFBraEqH2zE9WBQ9fLBV40HpB1F9q7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A4aPBABl; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A4aPBABl"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5a79df5af51so2086437a12.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 11:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723659873; x=1724264673; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgcHiPfghS6i54uArWpbh4/aE1GPzyWbEj0Bz9CZ81s=;
        b=A4aPBABlen9GX7fPENeQgsliGFYp8oFNr2SXemXLPbPLfeg5hKAeVc8XTLXSujOvxd
         P4jWvY3OZYyV1c4f3oPHJpLIqhy0Ahyr+adl123ycOmJbEyU2Tzqyt1znrJdtWy5CJvc
         3vtBN/AdLWGU66HzWad84Ro+6NBm/EDdjsF2DLR/kwVwlo1eocKoUw3eI+4Y08aj7yFj
         qFGRBLzCb/aRNC0EtlULVAFeffaiskWOXp69gzqfTn8dxkj/pC0tnV6wNkgFsOt9UKpv
         KZ21v3i7iHQ5PY+pF5wUZxIr3f0OVhEMs1Cb4n5VaV84pKZWWyO7E5SkkAx5vn3nVkG9
         Sh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723659873; x=1724264673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgcHiPfghS6i54uArWpbh4/aE1GPzyWbEj0Bz9CZ81s=;
        b=cByfroPzrx89qXl89onH0O0U/dqIGsfWloFk9faEPnXbjcmBdghIM7iqg6d8Hw1GyY
         yfflbrPZ7xfUJXa23boBtkrgdVcdgSDy4Wwe7VKwniR6/+HbIjx26C1fRHieapxqvIeC
         1XEor6aG1Ctc07pQw+EXCriRsl9QgD0pT9FRTMdcj0Y7xLI+CcAe3pMhu/ASxVxqtkGl
         WGSPLds5xoOWTBJWhd5kKCa28OUWzrRLGgqJ4pM13czDyqbDiIUAfMl8ysPGEGqUNuDj
         wiXLe2U5d+FN1PNeqMPwGPjJD5L4/tZCOl/pSGXpwz5kYbonFtkxs2vuAyN7/WCZRRrq
         ggHw==
X-Forwarded-Encrypted: i=1; AJvYcCVlqJZA5XXzt+F0m53wqaBEwZd131U6sI4VmRfO5OfzB0iAPe5CdR+lIA/CnfTFvmw5M/iBTNaz5ARMQk0r9+460FDtp7m0u4yvYKp5xw==
X-Gm-Message-State: AOJu0YxEbGzoYW24tOqI5C5ILLr41zMcBwrOZaWWhCuzajJglxeZ9Q4l
	m3KSLk0CLt+VLbHmUQPb/uX4pNQyeeblzwZzUV9aSyHCfUxy9/38th3ozTPIZL2sXjxGenS3hCz
	EyZOgNocQhLAvPXPKWKSMGohSlA/9WvQ3Ve29
X-Google-Smtp-Source: AGHT+IEuVeVZJ3rSBIB5OeRdUr94JEf8OV3NfVjLFDKBu9xzaqHB1bnQJOXdTCu5jNStYLiHlAVBEgjlFrDB6wDlfTE=
X-Received: by 2002:a17:907:2cc6:b0:a7c:d284:4f1d with SMTP id
 a640c23a62f3a-a837cd582d8mr39310866b.28.1723659872437; Wed, 14 Aug 2024
 11:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240812171341.1763297-3-vipinsh@google.com> <202408141753.ZY1CSmGo-lkp@intel.com>
In-Reply-To: <202408141753.ZY1CSmGo-lkp@intel.com>
From: Vipin Sharma <vipinsh@google.com>
Date: Wed, 14 Aug 2024 11:23:55 -0700
Message-ID: <CAHVum0ddyzHs+7Zv1SaL9Ox5qY7V4bjciPsnj21HekAavz_x4Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: x86/mmu: Recover NX Huge pages belonging to TDP
 MMU under MMU read lock
To: kernel test robot <lkp@intel.com>
Cc: seanjc@google.com, pbonzini@redhat.com, oe-kbuild-all@lists.linux.dev, 
	dmatlack@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 2:33=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Vipin,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 332d2c1d713e232e163386c35a3ba0c1b90df83f]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vipin-Sharma/KVM-x=
86-mmu-Split-NX-hugepage-recovery-flow-into-TDP-and-non-TDP-flow/20240814-0=
91542
> base:   332d2c1d713e232e163386c35a3ba0c1b90df83f
> patch link:    https://lore.kernel.org/r/20240812171341.1763297-3-vipinsh=
%40google.com
> patch subject: [PATCH 2/2] KVM: x86/mmu: Recover NX Huge pages belonging =
to TDP MMU under MMU read lock
> config: i386-buildonly-randconfig-005-20240814 (https://download.01.org/0=
day-ci/archive/20240814/202408141753.ZY1CSmGo-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240814/202408141753.ZY1CSmGo-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408141753.ZY1CSmGo-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arch/x86/kvm/mmu/mmu.c: In function 'kvm_mmu_possible_nx_huge_page':
> >> arch/x86/kvm/mmu/mmu.c:7324:29: error: 'struct kvm_arch' has no member=
 named 'tdp_mmu_pages_lock'
>     7324 |         spin_lock(&kvm->arch.tdp_mmu_pages_lock);
>          |                             ^
>    arch/x86/kvm/mmu/mmu.c:7335:47: error: 'struct kvm_arch' has no member=
 named 'tdp_mmu_pages_lock'
>     7335 |                         spin_unlock(&kvm->arch.tdp_mmu_pages_l=
ock);
>          |                                               ^
>    arch/x86/kvm/mmu/mmu.c:7340:31: error: 'struct kvm_arch' has no member=
 named 'tdp_mmu_pages_lock'
>     7340 |         spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
>          |                               ^
My bad, didn't check for 32 bit build. In next version, I will take
the lock in tdp_mmu.c.
