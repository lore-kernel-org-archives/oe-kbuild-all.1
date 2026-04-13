Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB692BEC3F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 16:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776098660; cv=none; b=ZpQQZmmbz7i5NvN1SRflEJ1y3cNwCiq7fCN2A8r7VPTe/zuHwqUCD0WCWiu0OH/mepT77O3ng5mvyPv09+MEz0IT7ltXUM3ERyujnIcWNuenAPuEAxOJKtYTnUk6WS0h2PMe/PxueqPbJUmG/XqjgAA//3UHdtxAq2TEbrdGOD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776098660; c=relaxed/simple;
	bh=b/pe0z7HCtnOHxrmC8N06rOBxHgLiHy08YRt6dpG+rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BG+MoxorOq9Auq1OjkEEMCqQFlRqoBn6Vcei9bZJKrAHrRqcetrUk1yzo4weKKoJgd2BHHx+4FZ6t1LxSrNa7Dw40+gMv91/vRMii4rngTvwEDHFkRmgy4IqF0/4yRAcorBfBg3K1AA934cN32e37S4H6tiXZm9deVYH1UE9NMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vl3IS5yK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vl3IS5yK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776098658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QinWo9Aenh7noN26qv3lnlA/589VFNF6tJzopX0vwC4=;
	b=Vl3IS5yKl61GXGpu7Q4z5fWbqhPjpBQ5M3B2JHNNDCTYW5AZ2dghjyAWQTgMTqjSw1qu/y
	6FxYhqGB+OLAN98l7OnjQBhmGXS8nKyrCIn6NRfPjQrbD4+IgoPz5BiQQMgP8/oGUyiOcm
	AwCtQ1F7Li14CfVJvtZfxVRjEuiT0xk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-IXdUd082MVSmPwrAsvdiCA-1; Mon, 13 Apr 2026 12:44:17 -0400
X-MC-Unique: IXdUd082MVSmPwrAsvdiCA-1
X-Mimecast-MFC-AGG-ID: IXdUd082MVSmPwrAsvdiCA_1776098656
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d1dea12aaso3358245f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 09:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776098656; x=1776703456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QinWo9Aenh7noN26qv3lnlA/589VFNF6tJzopX0vwC4=;
        b=qDa3fOcWhtt9/IoJ2Se8pehOOGuIRwTRwGsGFaiV/o9d8Z9oHkQ7mDLa48Tz2woa4+
         EaYHCB3D6y4Vfx1aIzDJ2WgiYbnnmG0rH1lx6W7hIlV0hedAP+ZZcksY8MiSmZQ83u41
         D1Ue8Z/gDhMbn2kC394aZqMLyzseCMPIDCPITBcvlOA20fawqCY1Gj88Ae4d5jTG8Vpl
         gEVUFwuMYnwlUJzk5LPMz3JOu9NrlX8wdI2AgCIAjlM7vUfb1T5DOxKgxSVNZrBLTEW1
         DWSQ5STKsMf5e4OOEnSJ8aCl4Jo+0sjdvmpquehYEagZol+prG5djMjuYhenr1hF1gEL
         vN1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+bLLs/Z5wQKfLsY6JJs2S3Ru0LTpEcY3UWVeeE5DyuO/Fqs15Xe7rcwCRsxp/AGJQ4/g239y0K6zBkO+8m@lists.linux.dev
X-Gm-Message-State: AOJu0YwrV7DrBdVHRkah1Ga/c6xn4PTzAAusDk/FL0+TmxzfjdGPt2uS
	EPTrKjTPuJT4YbqYlH04lb8IDnnW0URBV4lIRa5tj3ePeqmz8Tklz/F3ww5uBnRl77vKYwcDI2x
	plOLkdu3k1ITK8rnKi7rTnw3LDVm88L35k2nzoeUlxb69oUzhl7InwRiNGH3lQZUwO/hZqSpWfE
	2z04Wbrq48Eh95Rt9NV79dovKCxGIsWuiTk8k1FAmnSg==
X-Gm-Gg: AeBDievB9OwxKkA0pfx3A2I/YGRCcrH/vKFC6wWg1NC9tQZOBf4qqPg1ibsi86A2SGj
	6vgSHvrfEGKiHdKfQ61TNo2QSI+wPRG5ktUIBeDbqecKZ8mnHuO8vL5ADzUrdOK/I8sV3g36CqK
	1PYXNpomnMTn//pAgTEU7B80Rx+RGBFQBJ6pqlxUcaDMT4YgkTy3Zk3ciECVIODfjlfexyReF0E
	cmY9f3yjwavlNiJReqjYriw+tWeU1TIzWeMOLbZe7u7VnJDYtk2e2ZW1NKJ8Ts/gP9pbPPCW2JJ
	eV3x
X-Received: by 2002:a05:6000:2888:b0:43b:3d44:6624 with SMTP id ffacd0b85a97d-43d6427bad1mr20760610f8f.2.1776098655711;
        Mon, 13 Apr 2026 09:44:15 -0700 (PDT)
X-Received: by 2002:a05:6000:2888:b0:43b:3d44:6624 with SMTP id
 ffacd0b85a97d-43d6427bad1mr20760552f8f.2.1776098655216; Mon, 13 Apr 2026
 09:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604131813.Sp3bcsFp-lkp@intel.com> <ad0c8lNL5ZoSRZI6@google.com>
In-Reply-To: <ad0c8lNL5ZoSRZI6@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 13 Apr 2026 18:43:42 +0200
X-Gm-Features: AQROBzCmhNlgjLbboQMvOQmRweVH3YNctKQuxweJHyEPJsOZUQn15zDnx5VIbKg
Message-ID: <CABgObfbv1VwPYB3N5P+bxkxBgvPTU5cUN5eF3jCQHMe+vA0qVA@mail.gmail.com>
Subject: Re: [kvm:queue 12/12] arch/x86/kvm/svm/avic.c:240:39: error: passing
 argument 1 of 'is_sev_es_guest' from incompatible pointer type
To: Sean Christopherson <seanjc@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org, 
	Farrah Chen <farrah.chen@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P4Vp1K2KDJ1r1rb-TgW53_1iUjUzJBqrOph9YRjUY3U_1776098656
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 6:42=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Mon, Apr 13, 2026, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> > head:   8f65c76d62f1f07d68b8a14829a59049311547b1
> > commit: 8f65c76d62f1f07d68b8a14829a59049311547b1 [12/12] Merge tag 'kvm=
-x86-svm-7.1' of https://github.com/kvm-x86/linux into HEAD
> > config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20=
260413/202604131813.Sp3bcsFp-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260413/202604131813.Sp3bcsFp-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202604131813.Sp3bcsFp-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    arch/x86/kvm/svm/avic.c: In function 'avic_deactivate_vmcb':
> > >> arch/x86/kvm/svm/avic.c:240:39: error: passing argument 1 of 'is_sev=
_es_guest' from incompatible pointer type [-Wincompatible-pointer-types]
> >      240 |         if (!is_sev_es_guest(svm->vcpu.kvm))
> >          |                              ~~~~~~~~~^~~~
> >          |                                       |
> >          |                                       struct kvm *
> >    In file included from arch/x86/kvm/svm/avic.c:31:
> >    arch/x86/kvm/svm/svm.h:415:62: note: expected 'struct kvm_vcpu *' bu=
t argument is of type 'struct kvm *'
> >      415 | static __always_inline bool is_sev_es_guest(struct kvm_vcpu =
*vcpu)
> >          |                                             ~~~~~~~~~~~~~~~~=
~^~~~
> >
> >
> > vim +/is_sev_es_guest +240 arch/x86/kvm/svm/avic.c
> >
> >    232
> >    233        static void avic_deactivate_vmcb(struct vcpu_svm *svm)
> >    234        {
> >    235                struct vmcb *vmcb =3D svm->vmcb01.ptr;
> >    236
> >    237                vmcb->control.int_ctl &=3D ~(AVIC_ENABLE_MASK | X=
2APIC_MODE_MASK);
> >    238                vmcb->control.avic_physical_id &=3D ~AVIC_PHYSICA=
L_MAX_INDEX_MASK;
> >    239
> >  > 240                if (!is_sev_es_guest(svm->vcpu.kvm))
> >    241                        svm_set_intercept(svm, INTERCEPT_CR8_WRIT=
E);
>
> Ha!  Not my fault :-)

Yes, I have already pushed the right one.

Paolo

