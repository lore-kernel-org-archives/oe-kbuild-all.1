Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EC940E8C1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 17:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781630995; cv=none; b=U3Qk994Zhs3A62b1v5Tcfg4JlD5fbmyP20GM4U/vgsKHze1gJ+K3Up+12niyH79GWpHwiknG6T5Kbno6xVA3dSLoRzJglqQ1q9E5ENzoS/jl6PrWFqVQ18byioTNlvLb+wqa8Zgd4VssvuxfEB0p5gQ6+GhejfMbeDxWo5sFgVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781630995; c=relaxed/simple;
	bh=OdjXOZZyT2VAdu6qwL+QKQQPgXFKYSD9pzmhQxMrg8M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f439NYbWKI4EzNF7spIzJjLYY5lCrqt5P0+oBaKMnV0sFROE3PWPvKXVh+kCmHGvfne0eEz/azPN1B+bYUYW/ozcZJHKKiFcJ5rf1MPIE9n5+yqi69iX3t4BpR0pBi5EDMinsCl5PHtcydbMlkDvZxJOUP8gU5jYRxswumjBA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nV7zto/J; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nV7zto/J"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8425a9979e1so3175228b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781630993; x=1782235793; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5url6GgdQAe3Rj1rbX0oE/WHqyGvLSj5nPFWzeaFngI=;
        b=nV7zto/Jv9zAXZdapeQYOJaR/Osy/JZwFgFBXMjl1dACCM7/QB2xK+eBhP78+veutB
         Z/sd2B4TD5fJtt0ju2bsNm0Q8hknX1e/w4jL/xlNSloKdXGKMgw404KOQmALrlUKpY2i
         7YyoQmaIfgDBVKEZ193O+I3ikp4sPxjaJREE3M2pTx/Nk8uvK8tkoDXsM/4N8b754Wm0
         MXcvf8b7Sf8hBNeCKgk1vTBjGTfHEp6/yC4vbNwtDhe+24lNN2O/xvjdOwsxw2eg58bC
         xyJFLao579NgwWnEmOGSw7ZDytZkJR2aYSFNoqlySU2hnyNeh5WVD+oibXNT8Wn/atII
         4p+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781630993; x=1782235793;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5url6GgdQAe3Rj1rbX0oE/WHqyGvLSj5nPFWzeaFngI=;
        b=Onz+OnE22ErNGEZEVuLy9PZ7MPyo4dnc0q8MFjjirbek1/iE4cI66lsosF2Qb6NJc/
         +SsFtd2F5Dmi2Rs0/7umMbDT6alpRL1IsZTezbsrCIp+kf+EyeoBz7UTXRWyCSGmtfXg
         ZXlJoghcJe0jUkJv65iD3Pv9YZ21/bqFx4PeqJjckwGynQfd+dzXRNpEYW64NQfm5d/Z
         t4ykJx9pMTLPPRuwTf2uRBjZctuHu9NFREZeiIssZKXUlJT0nus43UOkIQ6a/icNvh43
         N/iYe+0UgCasj0pH2XnNRwPfgl0lVljB+D+QbAAiWmnbsjIOsCGuU9YcGf5ZJN6IslPc
         TfQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+z9N1ASJsBJQm+xCjpmLW3PHoI0M3+y+cLmfG5rWReG/7UhOvgQEAXG3B+B9pxMcIvpTmifHfhdRjo1G+@lists.linux.dev
X-Gm-Message-State: AOJu0YyYEghK619gwlsoPno28AswfnkB9OnZhYJVB0AMHuYyXBKQW218
	194Te8rGMCp9X9YTjX3BPsa+ZqO28PP/T/MfWmNdG11TIrxaBEB1Tpaog8QmQTk01M9/+wjp305
	bAdK5bg==
X-Received: from pfdf25.prod.google.com ([2002:aa7:8b19:0:b0:842:8af7:db0d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:340c:b0:841:58b0:82c8
 with SMTP id d2e1a72fcca58-84524447251mr127999b3a.13.1781630992854; Tue, 16
 Jun 2026 10:29:52 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:29:52 -0700
In-Reply-To: <CAO9r8zNdGav1sSS1oYxMOvatGg6mmXv=8-952E5HjB1+YT-HcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202606161302.xMRLP5W1-lkp@intel.com> <CAO9r8zNdGav1sSS1oYxMOvatGg6mmXv=8-952E5HjB1+YT-HcA@mail.gmail.com>
Message-ID: <ajGIEGG508I8iwBL@google.com>
Subject: Re: ERROR: modpost: "kvm_free_tlb_tag" [arch/x86/kvm/kvm-intel.ko] undefined!
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026, Yosry Ahmed wrote:
> On Tue, Jun 16, 2026 at 4:21=E2=80=AFAM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > Hi Yosry,
> >
> > FYI, the error/warning was bisected to this commit, please ignore it if=
 it's irrelevant.
> >
> > tree:   https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/KVM-=
nSVM-Flush-the-TLB-after-forcefully-leaving-nested/20260616-104539
> > head:   8ffd2ccdf3cac4abc0d2fd686f0ec3c7a453a24a
> > commit: c431a77735b3877be989d51a32b73ef4e80902ca KVM: VMX: Generalize V=
PID allocation to be vendor-neutral
> > date:   9 hours ago
> > config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260616/=
202606161302.xMRLP5W1-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project=
 f43d6834093b19baf79beda8c0337ab020ac5f17)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260616/202606161302.xMRLP5W1-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202606161302.xMRLP5W1-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> ERROR: modpost: "kvm_free_tlb_tag" [arch/x86/kvm/kvm-intel.ko] undef=
ined!
> > >> ERROR: modpost: "kvm_alloc_tlb_tag" [arch/x86/kvm/kvm-intel.ko] unde=
fined!
> > >> ERROR: modpost: "kvm_destroy_tlb_tags" [arch/x86/kvm/kvm-intel.ko] u=
ndefined!
> > >> ERROR: modpost: "kvm_init_tlb_tags" [arch/x86/kvm/kvm-intel.ko] unde=
fined!
>=20
> Hmm I used EXPORT_SYMBOL_FOR_KVM_INTERNAL() for all these symbols. Is
> this not the right way to do this?

You put them inside an CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES #ifdef.
