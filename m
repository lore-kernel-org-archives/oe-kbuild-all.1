Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E363064A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758723322; cv=none; b=BftSLbsoRHc/NNzFIz7/yRqtqOvxTZq3TVW6nsl+h9eKYu0RseOgu/45KS3hQ5IYu7HKuiYik7O9V3dKi4Mq6ONTWWdDKPo93m9sXsgo4BJcWkhk8W8F7KWd6uFX5TvY5pWMw0W5atYFaK+1J4qpXqrnROmpPV5hriRsc72bYwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758723322; c=relaxed/simple;
	bh=RCDk6T9SCSjcnUzQofULJ8Qqi43XMk3t0zQPrhL7Xkw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QZE0dOvoNOZAnIv4SfvRDymPpxi+25HDooHd5iOptZEm7ZgXDpFaTPD1+9HmRhZYgfvqLejoImZXkpdx1PGiDbHkdBG/eTuc5/Rdp4TpqrWU1nW1nciMh/JrsItJg3LmDgT4QdkDPAbAFqAA0QgHjJ1KsAoN7fYzEfbW1foxkjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FmWj1QPt; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FmWj1QPt"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b5529da7771so3460164a12.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 07:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758723320; x=1759328120; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cKy30PXQHtmPw/ZPKOvPmHBbU/VK+gwP24H7ZBwe994=;
        b=FmWj1QPtdyUgKh/fLrcpeOxJKxwB6tBY+JSXNP/TcrBqBgp4WqQKSRN1FVyyiFketn
         Jx5kf0KFDYWFt659Hy56DYIWo9gAoKwfHk9bFBUfDK9nlojxHeQuceomqJBLl+GzaWp8
         QiSdUhiafx7fJXIbXnccD1HakkCLwxwFifsXMK3u/mFr5KCzHGJFl38q/WY6SJ2G6lWv
         7uQ86RdR1WPsiHePWbE8JRJpFkIDtzllTyeoiVr1vgQzvfni7XMMkD9ENo6RnJuZFqcC
         rAyHWsc7NwVySpaZ8GuudBu7Vbi8uyVBnwicretAhpOxJoy1Q9uPtUXV0djAu0ror+Wr
         BAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758723320; x=1759328120;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKy30PXQHtmPw/ZPKOvPmHBbU/VK+gwP24H7ZBwe994=;
        b=oE7K7YgfNQ7356KiCz1zhqO8oV+jQQl7k+cjdZy3gSvSYWTWCbqDbzpJlir7oHL6PP
         ViI3F+QZPW56mRxMPPJ1HWiv1Ia+Wm17uFe/akVI3fMaw34okma2ulUQ97Xdwc/5DORU
         dh4/c3UGA+gHQBC9f2LDNT3P0QsfgWRdbTnwL2n/9wJeRyzcTfeCYEUFSoQWJgcY70Hp
         lBXMZQl82LojOiQJ+AutvB0TBLZ30j05vvPgGuSHldUiyX63nThrwtMrjmy+Me771y57
         7ft4H1DYv+eqaoG5ktIF/1R4vD+kFBR2PcJyAv9qijtpB+OHF7Oew9XasdmHfsC9R6xV
         8yig==
X-Gm-Message-State: AOJu0YxX1+ML0OvnXHrl56oNws0btQfaJwS/m88yaTCFmwkJQ3NUuE3w
	JXSr7kiky/AY7XH/uG7lmGk2PQH6TPWiCUVumZFh5wug1T1Vlb0U4C2KrIq6MHZckPXnPFg91Rs
	cJQLB2w==
X-Google-Smtp-Source: AGHT+IHQgupTbg3NDGp94ILVQ9FZKQEGKNNB/y+J+IIso0QIG/il0LXYRb40rg64cy9Qq5m4E2XLujzXwjA=
X-Received: from pjbqa13.prod.google.com ([2002:a17:90b:4fcd:b0:329:e84e:1c50])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5107:b0:32e:24cf:e658
 with SMTP id 98e67ed59e1d1-332a91ba7b8mr7108869a91.3.1758723320411; Wed, 24
 Sep 2025 07:15:20 -0700 (PDT)
Date: Wed, 24 Sep 2025 07:15:18 -0700
In-Reply-To: <202509242018.H6effaVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202509242018.H6effaVS-lkp@intel.com>
Message-ID: <aNP89rCj7W8yTyXj@google.com>
Subject: Re: [kvm-x86:exports 60/60] arch/x86/kvm/kvm_onhyperv.c:104:58:
 error: expected ')' before string constant
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 24, 2025, kernel test robot wrote:
> Hi Sean,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://github.com/kvm-x86/linux exports

...

> head:   ca1831d6ffa3a240830014a0c96633aed6d07367
> commit: ca1831d6ffa3a240830014a0c96633aed6d07367 [60/60] KVM: x86: Export KVM-internal symbols for sub-modules only
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/x86/include/asm/bug.h:5,
>                     from include/linux/bug.h:5,
>                     from include/linux/alloc_tag.h:8,
>                     from include/linux/percpu.h:5,
>                     from include/linux/context_tracking_state.h:5,
>                     from include/linux/hardirq.h:5,
>                     from include/linux/kvm_host.h:7,
>                     from arch/x86/kvm/kvm_onhyperv.c:7:
> >> arch/x86/kvm/kvm_onhyperv.c:104:58: error: expected ')' before string constant
>      104 | EXPORT_SYMBOL_FOR_KVM_INTERNAL(hv_flush_remote_tlbs_range);

*sigh*

I based "exports" on "misc" to avoid a few annoying conflicts, but the patches
were posted against effectively kvm/next+kvm-x86/misc.  Unfortunately, "misc" is
based on 6.17-rc2, which doesn't have commit 6d3c3ca4c77e ("module: Rename
EXPORT_SYMBOL_GPL_FOR_MODULES to EXPORT_SYMBOL_FOR_MODULES"), and so building
kvm-x86/exports in isolation fails because EXPORT_SYMBOL_FOR_MODULES doesn't
exist.

kvm-x86/next and linux-next build just fine, because they incorporate v6.17-rc3
and thus commit 6d3c3ca4c77e.

I inserted a backmerge of 6.17-rc3 into kvm-x86/exports, rebased the commits on
top, and force pushed.  The late rebase is undesirable (understatement), but in
practice the code that's being tested by myself and pretty much everyone else
except the 0-day build bot isn't changing.
