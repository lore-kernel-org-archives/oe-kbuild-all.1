Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E781C1F0E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 22:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731105918; cv=none; b=NjIdtOF56Lm27y0fPP5kWLpASxByhC+xSsuN1eL8sLYkz3wSJ9nE0dGgsxhprj/vdubmMnHun6b3uMgflOkP3x7fc73SwP/vYFXr6ofAq7dOuMI6PX3qXDD7eR4Wjm+h5tfH4tuP97FFdKAk64DBSxci2qeeSnZKPQIMIb38uB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731105918; c=relaxed/simple;
	bh=VJOHr6pLH52nLdtup1E2zosFidmBhr4gFI+cehtqUZo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KokaevBpkl37wDwo4jqXPrcSPkaIBLMamD3k17lLT4ebWJPq/GBQ9KAC4xFgFTMzg8bHQakII82flJbbWZg2uVZB/69dherdGVNr9Zc7SeOr6HexP4gwLf68B6O4q0LujHwb6MY4r2tiM04wKctb4MBLk96mz1QZvlY5vtEikpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uSbI4My8; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uSbI4My8"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e30c7a7ca60so3508918276.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 08 Nov 2024 14:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731105915; x=1731710715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3xf4ICT1HLEEjjHW7v8PG1MES5H37LOIRN6Xle54KA=;
        b=uSbI4My8v6mKvuWFa+aTiFtn6o+pQ37t+eD6LvH4VBi6JR+TgTt8ZeF2Bdu02xwjIZ
         3taGOstmWZen/WeXsKFFT5Jl23w8r/z31SJnCoZi9pompirWPw6FzMR3w3Fl9DQHyOtp
         +uvnDCr1dR+ive5hvqDlR2FrhW1vQO6e5BwC/g8cm+raYhfmJ7b46NxlxiDCv9Mx4ZSS
         5TyFLDcBTp5DbYeqT64TYXTg/3Snk4rItvA2s6OF3WLAWxrmPFnc7mhPeMbhttFvxfNP
         gO65P93ILkV8kQEbe8Lw/4Io1ulS07h48CGSF+FOjCquOJWNxZka0TY04v3Vwbkf98rU
         6cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731105915; x=1731710715;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k3xf4ICT1HLEEjjHW7v8PG1MES5H37LOIRN6Xle54KA=;
        b=t914yt8m2rwrVlcz9l6YGGrJmW9wSsfb2R2M3AixG2G4U1N+bM1bOvlOw8vkbJx6+A
         LN//Il+7WBVXTxvck6mxsHMjwQclln0+Cjf7WQWNFRi3sIlN0H+wX0XwSpJwM84i1Rvg
         C5I8OMxMKMr+79X+W6EqWD58gLvMnuWg78Mdl64OiTSq2adxvpRZ27ZwEfIo4tpU8HFr
         IsTO+Wp8fXdhNQb1djlJ57bO0l7j8ERe4Q83JL0+Q57V3uM2jGYg7261XAxivGE/6/Bj
         JwLUkdFdjiZuxBMY7HRdstvxSwvZ3rtH3b7EQseadl6HpnCM63nkM0Tr3NuNjf6tRDwW
         sqmw==
X-Forwarded-Encrypted: i=1; AJvYcCXbsItP7YZLJeEkwhfrPxxjuMG67tl9mkrEDn69S685vE9o+CVbiWOZ23SWW/WONIlV0D7NBQ2+pcJ191Oa@lists.linux.dev
X-Gm-Message-State: AOJu0YzrzYpuXeJvOSi1vcagXUE+m/rBiPE+xHU5OXlaPhiUKidMpTCI
	3xUF8mxUp65ddNH9YDZT/tCCal2n9d+5t0SModrY8LKusbwBETCuUyeS6TLUUo/uAJ5vxI4oE5S
	sZg==
X-Google-Smtp-Source: AGHT+IGCSVtE+1R9XBNFFNqX8pkttvkmLYFQyPVUgZrgW3CVTQDdGkU6v+To7f5XBAZcgJYJuQNBftfUplQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:bc84:0:b0:e2b:d0e9:1cdc with SMTP id
 3f1490d57ef6-e337f908f8dmr5594276.10.1731105915426; Fri, 08 Nov 2024 14:45:15
 -0800 (PST)
Date: Fri, 8 Nov 2024 14:45:13 -0800
In-Reply-To: <CADrL8HU3KzDxrLsxD1+578zG6E__AjK3TMCfs-nQAnqFTZM2vQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241105184333.2305744-5-jthoughton@google.com>
 <202411061526.RAuCXKJh-lkp@intel.com> <CADrL8HU3KzDxrLsxD1+578zG6E__AjK3TMCfs-nQAnqFTZM2vQ@mail.gmail.com>
Message-ID: <Zy6UefSlo8vwHxew@google.com>
Subject: Re: [PATCH v8 04/11] KVM: x86/mmu: Relax locking for kvm_test_age_gfn
 and kvm_age_gfn
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: kernel test robot <lkp@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024, James Houghton wrote:
> On Wed, Nov 6, 2024 at 3:22=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
> >
> > Hi James,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on a27e0515592ec9ca28e0d027f42568c47b314784]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/James-Houghton/K=
VM-Remove-kvm_handle_hva_range-helper-functions/20241106-025133
> > base:   a27e0515592ec9ca28e0d027f42568c47b314784
> > patch link:    https://lore.kernel.org/r/20241105184333.2305744-5-jthou=
ghton%40google.com
> > patch subject: [PATCH v8 04/11] KVM: x86/mmu: Relax locking for kvm_tes=
t_age_gfn and kvm_age_gfn
> > config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/202411=
06/202411061526.RAuCXKJh-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20241106/202411061526.RAuCXKJh-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202411061526.RAuCXKJh-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    arch/x86/kvm/mmu/tdp_mmu.c: In function 'kvm_tdp_mmu_age_spte':
> > >> arch/x86/kvm/mmu/tdp_mmu.c:1189:23: warning: ignoring return value o=
f '__tdp_mmu_set_spte_atomic' declared with attribute 'warn_unused_result' =
[-Wunused-result]
> >     1189 |                 (void)__tdp_mmu_set_spte_atomic(iter, new_sp=
te);
> >          |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
> >
>=20
> Well, I saw this compiler warning in my latest rebase and thought the
> `(void)` would fix it. I guess the next best way to fix it would be to
> assign to an `int __maybe_unused`. I'll do for a v9, or Sean if you're
> going to take the series (maybe? :)), go ahead and apply whatever fix
> you like.

Heh, actually, the compiler is correct.  Ignoring the return value is a bug=
.
KVM should instead return immediately, as falling through to the tracepoint=
 will
log bogus information.  E.g. will show a !PRESENT SPTE, instead of whatever=
 the
current SPTE actually is (iter->old_spte will have been updating to the cur=
rent
value of the SPTE).

	trace_kvm_tdp_mmu_spte_changed(iter->as_id, iter->gfn, iter->level,
				       iter->old_spte, new_spte);

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index f5b4f1060fff..cc8ae998b7c8 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1186,7 +1186,8 @@ static void kvm_tdp_mmu_age_spte(struct tdp_iter *ite=
r)
                 * It is safe for the following cmpxchg to fail. Leave the
                 * Accessed bit set, as the spte is most likely young anywa=
y.
                 */
-               (void)__tdp_mmu_set_spte_atomic(iter, new_spte);
+               if (__tdp_mmu_set_spte_atomic(iter, new_spte))
+                       return;
        }
=20
        trace_kvm_tdp_mmu_spte_changed(iter->as_id, iter->gfn, iter->level,

