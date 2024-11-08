Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62908D528
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 03:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731034852; cv=none; b=MSMyskLzJKTcozNx6Qavbb8YpVdQVqloMlrw1ske0Ox6jWA1UxKC3tjkduI/3NNneOBM8Dh37zVomomQHMWlgsLEH5ihVx6iAf/QdM2eIe+3fU7OZo8lBRn2Y1vqJcVNrY7GoSBReKRKL34QOPDpmOXK/JODmR1ngqGzAdzLVV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731034852; c=relaxed/simple;
	bh=1lqzFGn1eXbAen/HouRQEXecZLXqEsPyxz4EZS5zSGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4aKuEwnZdzeXm6doFjRE+jBtWkfJFbLDY4SDo7l/2sEduYHPaskWNR1bbrit11ptZGgWBevJSlAWvnOK53HQqcixUNpB8K6BTSJRoIgOblVb69qusKkLpQMvrWLsO5fQOL3taDbePKpqh2d7rm21pgxqq2Uz+t1utOzXs5j/LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZZZm+XAj; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZZZm+XAj"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e5a5a59094so15907607b3.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 Nov 2024 19:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731034849; x=1731639649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpzEZp7ZlditrMUaR0RY215WGeQ8zIPi7Ck1Zq/zD0c=;
        b=ZZZm+XAjFNCY/r00O9Wgp5vaoAf3kNdVQcRezHrM/cV1kfWFFgfvsAoFAiMK381r2x
         E4OEx4TCUTRnnEzFvXkFl5g+uyDQx3zHg6jPhg2JAwvAY+uE4a2moR5iE3agLZCWNHS7
         fWvo20Oq3KXOqDi/xzDULdddmWZuQ6OSmIJUjgVmsMGxrGV3mCj354mcFbmlBF+cEwzX
         t2RAWseEOlUWS+8rMwf4mlts3E7+2ClY4FrBtZvyJzhs9gZZApkxEiVvvZAU0lwTIxae
         kykpgvCAbHNp3zK1Mzw1iEd107I7pUbqd0dCqowepIFNB+Yj0E6y3kO085v8yR/5RUPY
         uZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731034849; x=1731639649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpzEZp7ZlditrMUaR0RY215WGeQ8zIPi7Ck1Zq/zD0c=;
        b=DZbvgdcijjrSHxTZ/rF5bPbTkwPsDtU9n0/8ujCwz7O6YUQ4go7t+VpPsWCcij6FG+
         w0NXhgmjoqz7oCjlUToA4rXQGIn9UNBN+bJKX2xgr71ID2v3Vt91VJvbn6ZExfAihq5l
         dmW1BjSK6MrqlF8RwZRT3QC3++Le1b19o+dds3osoLzsX8c+4yimYUfdKKVOVIcgzlHV
         ROax5OWc3JzW9I367OyhO2uFtRLODEKpAAs8/wJt23ZHVX6tAN6qq6ssPqp95rDCkBQd
         Ux17lDT40KxlchatgUNoCKVmaRkLeajirFc4ApzdYAw3nN6tqtS7rL40TTgZYle54RHg
         5j4g==
X-Forwarded-Encrypted: i=1; AJvYcCVvfROIMCv/PwVnL/LiIsxQ07BEWTAF67C70f5aubJnU60PClYUKUZ6tvscYQy77Bmc7y2y0Z+5Y6RVHMJE@lists.linux.dev
X-Gm-Message-State: AOJu0YytiWVRVyMo1G6UERCEsoCitptTGL02CtSQV33YjiQ2aJhC68t8
	ZFIMTv148IAQVj6AvUbVNT+en+kcn74WZz/NCSasui3r/aB/ALpyyPsCH9dveGmyMk/GTq+auRk
	xrbJEGF+KvJBGRJygSQ/R4V87SaVkLdd0Na1S
X-Google-Smtp-Source: AGHT+IHR4yckEoMuQ7L6FZx8C9n+6mGcTLb5/EhQ62bRePk5jVdh0KVFPZSYTuKhRFZX0cTeNXh9dAaW7vwAUxwoHQM=
X-Received: by 2002:a05:690c:c93:b0:6e3:3336:7932 with SMTP id
 00721157ae682-6eaddf8dc3emr16216267b3.27.1731034849279; Thu, 07 Nov 2024
 19:00:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241105184333.2305744-5-jthoughton@google.com> <202411061526.RAuCXKJh-lkp@intel.com>
In-Reply-To: <202411061526.RAuCXKJh-lkp@intel.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 7 Nov 2024 22:00:13 -0500
Message-ID: <CADrL8HU3KzDxrLsxD1+578zG6E__AjK3TMCfs-nQAnqFTZM2vQ@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] KVM: x86/mmu: Relax locking for kvm_test_age_gfn
 and kvm_age_gfn
To: kernel test robot <lkp@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	oe-kbuild-all@lists.linux.dev, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 3:22=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi James,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on a27e0515592ec9ca28e0d027f42568c47b314784]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/James-Houghton/KVM=
-Remove-kvm_handle_hva_range-helper-functions/20241106-025133
> base:   a27e0515592ec9ca28e0d027f42568c47b314784
> patch link:    https://lore.kernel.org/r/20241105184333.2305744-5-jthough=
ton%40google.com
> patch subject: [PATCH v8 04/11] KVM: x86/mmu: Relax locking for kvm_test_=
age_gfn and kvm_age_gfn
> config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241106=
/202411061526.RAuCXKJh-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241106/202411061526.RAuCXKJh-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411061526.RAuCXKJh-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    arch/x86/kvm/mmu/tdp_mmu.c: In function 'kvm_tdp_mmu_age_spte':
> >> arch/x86/kvm/mmu/tdp_mmu.c:1189:23: warning: ignoring return value of =
'__tdp_mmu_set_spte_atomic' declared with attribute 'warn_unused_result' [-=
Wunused-result]
>     1189 |                 (void)__tdp_mmu_set_spte_atomic(iter, new_spte=
);
>          |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
>

Well, I saw this compiler warning in my latest rebase and thought the
`(void)` would fix it. I guess the next best way to fix it would be to
assign to an `int __maybe_unused`. I'll do for a v9, or Sean if you're
going to take the series (maybe? :)), go ahead and apply whatever fix
you like.
