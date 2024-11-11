Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763451BC58
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731336383; cv=none; b=VklK1ZTBaumlWd3tXZ8g/jZd1FGrx/lmmsJKnTka78lJWzGlqFduoKe6MKZUsy2ScAQNnTnciGhezXmCUba6RwFuBVWwR+nsLbOZTx4ogeVzOvfoWwVNnho59yoTjjNewKSnQXKGi26xSDQ1XTBuVHqvy5g47MODOpBKY3Qp4eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731336383; c=relaxed/simple;
	bh=/kcz22q+Xh7P78+qXf2Q5/TRZ7aOm71yZ8yTr7zBPg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qv0Elqxm/pgk6x+54TZc9XdupNFTSApUTMZ5h6C10D/LlafcA+Lnn91ydteUqqco0jIcuZPHPk2KyWFFGb3lrfwrCLMs8f6x90aXj6NQjPYasg99k+Oa1ZGTntMOICMhDg+DjLgLuc4EOINq65vu/bHp+HaEulvZCbESAyN0fMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dVBx0HdS; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dVBx0HdS"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e29047bec8fso4274791276.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 06:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731336380; x=1731941180; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuBjXOdgMWI3BuIwD303XNDgcqUxAXweoBqiSwzCoBg=;
        b=dVBx0HdS8vbm2EJNFWwqZQV1ozXeyTv/IiKXPxikwld5rIlMfGXwxDPxKJiP0Oj6hW
         B1W6dSZRF5JrQMrJHn3qjxn+Mt/r1c3No5lHTgpSa8DrfMcnVtJHueMnPaVo/k18H6oO
         XkSmlP/J/MOpJnn/QZgOZcN7NjQlRIShGnKC3ENT8c+eGGpxbZ7btB3jWyY811VG2liw
         Y1OjEFPAFtAXGgtqVzsdqn9RJ645Yt3D+oGU2r5ZVUT6xCJqOyQHaE9T4o2xLcqYTkNr
         Qoc6jEoN0rHpMFfEIQAt7Y10OyF/JMKbcSJTZWR/RcbB/J/q7i8PrvaqT29WR4mr/dyE
         rvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731336380; x=1731941180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuBjXOdgMWI3BuIwD303XNDgcqUxAXweoBqiSwzCoBg=;
        b=STXubMiSaTpuLouON7UKpnMaYdrlQmxF4wzCAIJOfCL+LZ9JxVYvCPT0TjlaHgZo7/
         BVBAEuZ3YtixUyEHEwd5xNq1BrUl7c/lfyOmpvA2MVgyZLMvDQIAxeRgIFO12cAzVNiG
         gMw4NnjjXGT2ZtHAZELE6YZm1v/3xk11T+qejDLed2BIks4Hy2yoBwBD/3Et/cUXx0Rl
         k2Dvwhds0H0OOfkMn9UpjNfZhOj/+7DefKVvy+dauifD1FgZimxx3vl5JPnSVzh8jach
         D1GV5QwCTEjL6MkwoAs7BCq7YDItwqzUXvf+PaVq4a2GFj3I5YGdP91/Qz50lS0Qw4/m
         VXSg==
X-Forwarded-Encrypted: i=1; AJvYcCUmRTZQmv2zzoLON7+1Pu9D2NM3Rz7Wf8cQ6o0DoNfG67C6dxEEW1k73kQuGY8/JJwtDVEzOEW6oG/RMTE1@lists.linux.dev
X-Gm-Message-State: AOJu0YztnfXJtQDrnOVtct1wW2uLKzgG0nBzo7UDrBfFn4ZlOFdSxevM
	hABG8wTOk8AH44osid733U32qxOYsDWpGbfX2ZDHWzUk1dUKdJXRTiZXjRtXc1EXTNa6OMPM4gd
	jvnoeUS7IK3khs4DSeY1t9l8NkloinVLP4fAD
X-Google-Smtp-Source: AGHT+IHtSkbI5TN9NEyh4i69sExMuFBKZk46/8zghhMcwS5mYXDhpMaAhdiuGEKOMx1i5ec0vF2dtkGDnKuXtuAsqeI=
X-Received: by 2002:a05:6902:1023:b0:e29:2560:914c with SMTP id
 3f1490d57ef6-e337fdc0170mr10470151276.9.1731336380318; Mon, 11 Nov 2024
 06:46:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241105184333.2305744-5-jthoughton@google.com>
 <202411061526.RAuCXKJh-lkp@intel.com> <CADrL8HU3KzDxrLsxD1+578zG6E__AjK3TMCfs-nQAnqFTZM2vQ@mail.gmail.com>
 <Zy6UefSlo8vwHxew@google.com>
In-Reply-To: <Zy6UefSlo8vwHxew@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 11 Nov 2024 09:45:44 -0500
Message-ID: <CADrL8HUY0qeDW+g0MPeBdYe9C7i0sXJN_gHVPX0nEeDRVbp-6Q@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] KVM: x86/mmu: Relax locking for kvm_test_age_gfn
 and kvm_age_gfn
To: Sean Christopherson <seanjc@google.com>
Cc: kernel test robot <lkp@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 5:45=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Nov 07, 2024, James Houghton wrote:
> > On Wed, Nov 6, 2024 at 3:22=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
> > >
> > > Hi James,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > [auto build test WARNING on a27e0515592ec9ca28e0d027f42568c47b314784]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/James-Houghton=
/KVM-Remove-kvm_handle_hva_range-helper-functions/20241106-025133
> > > base:   a27e0515592ec9ca28e0d027f42568c47b314784
> > > patch link:    https://lore.kernel.org/r/20241105184333.2305744-5-jth=
oughton%40google.com
> > > patch subject: [PATCH v8 04/11] KVM: x86/mmu: Relax locking for kvm_t=
est_age_gfn and kvm_age_gfn
> > > config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/2024=
1106/202411061526.RAuCXKJh-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20241106/202411061526.RAuCXKJh-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202411061526.RAuCXKJh=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >    arch/x86/kvm/mmu/tdp_mmu.c: In function 'kvm_tdp_mmu_age_spte':
> > > >> arch/x86/kvm/mmu/tdp_mmu.c:1189:23: warning: ignoring return value=
 of '__tdp_mmu_set_spte_atomic' declared with attribute 'warn_unused_result=
' [-Wunused-result]
> > >     1189 |                 (void)__tdp_mmu_set_spte_atomic(iter, new_=
spte);
> > >          |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
> > >
> >
> > Well, I saw this compiler warning in my latest rebase and thought the
> > `(void)` would fix it. I guess the next best way to fix it would be to
> > assign to an `int __maybe_unused`. I'll do for a v9, or Sean if you're
> > going to take the series (maybe? :)), go ahead and apply whatever fix
> > you like.
>
> Heh, actually, the compiler is correct.  Ignoring the return value is a b=
ug.
> KVM should instead return immediately, as falling through to the tracepoi=
nt will
> log bogus information.  E.g. will show a !PRESENT SPTE, instead of whatev=
er the
> current SPTE actually is (iter->old_spte will have been updating to the c=
urrent
> value of the SPTE).
>
>         trace_kvm_tdp_mmu_spte_changed(iter->as_id, iter->gfn, iter->leve=
l,
>                                        iter->old_spte, new_spte);
>
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index f5b4f1060fff..cc8ae998b7c8 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1186,7 +1186,8 @@ static void kvm_tdp_mmu_age_spte(struct tdp_iter *i=
ter)
>                  * It is safe for the following cmpxchg to fail. Leave th=
e
>                  * Accessed bit set, as the spte is most likely young any=
way.
>                  */
> -               (void)__tdp_mmu_set_spte_atomic(iter, new_spte);
> +               if (__tdp_mmu_set_spte_atomic(iter, new_spte))
> +                       return;
>         }
>
>         trace_kvm_tdp_mmu_spte_changed(iter->as_id, iter->gfn, iter->leve=
l,
>

Oh yes, you're right. Thanks Sean! The diff LGTM.
