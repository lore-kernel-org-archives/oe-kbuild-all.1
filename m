Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7383246ED
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776099305; cv=none; b=sOd92bLyVGqqfsiGgY0qsA12zQMsTcw2Vvlgz/LPEROxYopnQlo57LgvUD6n7xjcCFgBsB/XlGCwGpPvllpp29NsEyHh0LxIRD9F2EzGliAB2JOWBUUAvcLu4W2npCILBUUDQd7WmJoeQoo6UFCI8nWgYVBg58QP8r3wjoJAtus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776099305; c=relaxed/simple;
	bh=ClzR7UQzXTe3HzyCT4OZzGbXNT6kioWjGLs7pHzfNTU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CwsQPGplIufYUXoPMfw65vn1Xo3jiahBO5mq3DSVnL4CU3HcIEuYj5Tj28fgCfIGg4WWUKiczPIeCp5kmGMGZfw92aeNixvRmCKIN5pQlXyUa/77apavngskhTdiWgny7Hqld4zkS9GOC6CsFi0JAYVk4zXcCQZ0GK5QqBXAHl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s61Mcdnq; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s61Mcdnq"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82f45e46ac6so614960b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 09:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776099302; x=1776704102; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5j4sXGBcxPPwUarrcuWs3/BHde3gD/Q8o6gGTTOXhQ=;
        b=s61McdnqABcqIZ3+ApPsjvBBT7V/80B+oufXbKw+9A+3F3Fc7BeFg4HUdFoL1ui5rs
         AjziauiAhTz6OgVJP/2F2vQfpWmfTXa6P+U7dHc3llaDePo950mIYZNVgBSmX7THY2sp
         CngAiqNeBDrzRF9YDXAd0Tg/tCUcdwzVynPk5YQkeuPQrmZmSA1V0lhkopFROLGzvYR3
         LWL/zm3dUyjO3ZdJL4+hH9gbXXLg6v7G6TDyXnmx4o7otueFOkUsuVoAPraaBZ9yPwui
         emHZGRxlKUzNbHnA3LzczAP6jdfJSLItEYtIU4cktpSxvlMyBxZ133QimPCdoMTjQ6JO
         s17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776099302; x=1776704102;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j5j4sXGBcxPPwUarrcuWs3/BHde3gD/Q8o6gGTTOXhQ=;
        b=k5uAv/j/j+rac9XRCJye47bCKwPIVoDcFhz9bO1+0L0MYmsQipF/yC7KqI51qK49BC
         nJNMsN4Fd86/u8CUziYzmi7/Er8rS3mFL74INcrnLvBfyqIPDcQ0kyrOaoyjyIaETMaP
         6BomkxF7aghUVKmIOX5gydUCIN8nGGa8n8/kvAGpsT34Zna+Juj0hmfQl41y5/k0+Efh
         GJci2nk8ZNgkwCkPL+A2C8/WBHPIDvE2uUD3TE5uENfdJorsRfJlg7LE61sSGo25HEzR
         kms0024bmQ0WiXL18tm8GewrUiT5iZWQFYkwl48EQWyYBwXKXh/DEuyCJOGDg2GGzdYd
         qEWw==
X-Forwarded-Encrypted: i=1; AFNElJ/gYvF7ANgB9dC2PzfVxH+4EeBWoOgAf8MC+rztBbAETBXWYUxfXMeMASXkbrCK0hGd+EUgANhHH/KZAZgb@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2G43YtgiuiEJ8vBUhpOn7Fm9/LqDn/ihRV1au+ZknkTuQrH9c
	TLk59o8H08wqGuLQhDjOlQzPIrtOQTtwuKZfUXs35dzRApRmjoZYK3gYQWVZ2LIYnqjhyTwyDYo
	SSknXKg==
X-Received: from pfgu29.prod.google.com ([2002:a05:6a00:99d:b0:82f:4d28:b8c5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:aa09:b0:829:88e7:c88b
 with SMTP id d2e1a72fcca58-82f0c2ad4a8mr14168457b3a.19.1776099302146; Mon, 13
 Apr 2026 09:55:02 -0700 (PDT)
Date: Mon, 13 Apr 2026 09:55:00 -0700
In-Reply-To: <CABgObfbv1VwPYB3N5P+bxkxBgvPTU5cUN5eF3jCQHMe+vA0qVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202604131813.Sp3bcsFp-lkp@intel.com> <ad0c8lNL5ZoSRZI6@google.com>
 <CABgObfbv1VwPYB3N5P+bxkxBgvPTU5cUN5eF3jCQHMe+vA0qVA@mail.gmail.com>
Message-ID: <ad0f5AH-KotxXeYD@google.com>
Subject: Re: [kvm:queue 12/12] arch/x86/kvm/svm/avic.c:240:39: error: passing
 argument 1 of 'is_sev_es_guest' from incompatible pointer type
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org, 
	Farrah Chen <farrah.chen@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026, Paolo Bonzini wrote:
> On Mon, Apr 13, 2026 at 6:42=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Mon, Apr 13, 2026, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> > > head:   8f65c76d62f1f07d68b8a14829a59049311547b1
> > > commit: 8f65c76d62f1f07d68b8a14829a59049311547b1 [12/12] Merge tag 'k=
vm-x86-svm-7.1' of https://github.com/kvm-x86/linux into HEAD
> > > config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/=
20260413/202604131813.Sp3bcsFp-lkp@intel.com/config)
> > > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20260413/202604131813.Sp3bcsFp-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202604131813.Sp3bcsFp=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    arch/x86/kvm/svm/avic.c: In function 'avic_deactivate_vmcb':
> > > >> arch/x86/kvm/svm/avic.c:240:39: error: passing argument 1 of 'is_s=
ev_es_guest' from incompatible pointer type [-Wincompatible-pointer-types]
> > >      240 |         if (!is_sev_es_guest(svm->vcpu.kvm))
> > >          |                              ~~~~~~~~~^~~~
> > >          |                                       |
> > >          |                                       struct kvm *
> > >    In file included from arch/x86/kvm/svm/avic.c:31:
> > >    arch/x86/kvm/svm/svm.h:415:62: note: expected 'struct kvm_vcpu *' =
but argument is of type 'struct kvm *'
> > >      415 | static __always_inline bool is_sev_es_guest(struct kvm_vcp=
u *vcpu)
> > >          |                                             ~~~~~~~~~~~~~~=
~~~^~~~
> > >
> > >
> > > vim +/is_sev_es_guest +240 arch/x86/kvm/svm/avic.c
> > >
> > >    232
> > >    233        static void avic_deactivate_vmcb(struct vcpu_svm *svm)
> > >    234        {
> > >    235                struct vmcb *vmcb =3D svm->vmcb01.ptr;
> > >    236
> > >    237                vmcb->control.int_ctl &=3D ~(AVIC_ENABLE_MASK |=
 X2APIC_MODE_MASK);
> > >    238                vmcb->control.avic_physical_id &=3D ~AVIC_PHYSI=
CAL_MAX_INDEX_MASK;
> > >    239
> > >  > 240                if (!is_sev_es_guest(svm->vcpu.kvm))
> > >    241                        svm_set_intercept(svm, INTERCEPT_CR8_WR=
ITE);
> >
> > Ha!  Not my fault :-)
>=20
> Yes, I have already pushed the right one.

Heh, nope :-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 56f38a851c1b..adf211860949 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -237,7 +237,7 @@ static void avic_deactivate_vmcb(struct vcpu_svm *svm)
        vmcb->control.int_ctl &=3D ~(AVIC_ENABLE_MASK | X2APIC_MODE_MASK);
        vmcb->control.avic_physical_id &=3D ~AVIC_PHYSICAL_MAX_INDEX_MASK;
=20
-       if (!is_sev_es_guest(svm->vcpu))
+       if (!is_sev_es_guest(&svm->vcpu))
                svm_set_intercept(svm, INTERCEPT_CR8_WRITE);
=20
        /*
