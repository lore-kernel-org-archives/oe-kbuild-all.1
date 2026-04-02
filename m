Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D99433A717
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Apr 2026 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775158812; cv=pass; b=YbYwOZ94lJIyL7816vS+VzBW5apC1FvJYjF3Y8ofQEL6cXbzq/q4WOhtdX5yGeAJ4S0KFCNqSAKhXe8p8sxotdbmrn0TqdrmM2sumplQI80lkj4fa1S0qoTh2oJYegXGY32EhbtSY2dbaHqbjh7FM7j0lhVAV7DmZMuILMiCakg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775158812; c=relaxed/simple;
	bh=US2V7kzwHw+XpVhDyUggsFAHRpyi5Z5kvJJ43HbFkRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RGaXWuGBy+UftvS+Jy0DFE4sb7R6Cn0Qyia40mCwy9+5/unqJezuqe9ST3HaCvk5/RLuTXkZoG7wxuLm8s7yPxdSxaPw8qaE4Rrdk9hPpimAuS/Qw+2akzhMXP0tytpzdGsrOdDwLQjV6PiRnNzrXY60gA3RfKWiJxmce3uV0fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vO0V0PYP; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vO0V0PYP"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66bb7118c96so2987a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Apr 2026 12:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775158809; cv=none;
        d=google.com; s=arc-20240605;
        b=JBwzeJFOgnFpP+WK5LWlygn4Db/3iM4DCo5SbTB1EbGP7Ac3iua1pFsMUtCHvanrUb
         MFbbIhoSqd+1FLKEKB3UosswjO0AQkPMSKdOriJbVtDtrzEnWzU1RfufTm/pz3m8K4Hc
         H7LFkhUfyVB4J9YwIIeq+cnujh41pSk11V1uHduN3qMyigmCBHW1364GjnUXMTTVgdvA
         TfxdCSA8RZB2HkNX/k3NWuTWJiVgArjPXmw/nHzUTo55PGDb60d5cMRxt55IqpS80ch/
         WzB3HFE38tovbBxnxg+URgi6rQs9xVDnusGIBOUHIH15sD8+fexsZRrOLPuGObTsm5T4
         o5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J0DvflLdp3i7a17ynT3a78GmDFDn7qbQSpDZ8abq9cA=;
        fh=v+maNifcVo+3pA4nEuetO0ASFyjQO9ZXF1UCiG3mq7o=;
        b=BlPEZVIg0wdm8gq/PDuwEdUsgSOvUCLYFkM8+YUSo+Jl0s9cUv0XBurgDmAGksDVx9
         PHjI/4jZkFUFYW9UI07No6ReC6Vdz3WR8ZSNXCDSroenefB8a19nJ+vx9DYEYCDn9kAG
         DATJY7u2R3oPMMn6EkLYDMKlSY/Leg4WWS7UPTNqOLqiHoCB3wmua2BttBhfwZbvs0CS
         7MaYrW8vxUXVDbNSdqY9ev6uCu7nGN8OdTHZ46c8urEGaHrqONWs1QhGAUJTeDrKk+t7
         sXsqI/V6vcxh4wcSSKY06wz3jwFT3ueoDNmgTG+CSk8pOc7DzbdIVh8pW3D30+OZ5oKj
         Z4iQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775158809; x=1775763609; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0DvflLdp3i7a17ynT3a78GmDFDn7qbQSpDZ8abq9cA=;
        b=vO0V0PYP6pu0+q1Y7o7QjOk+U/DK9H/fFbwhbOE4FG3pzxKIqSfYMhbwFSehrfugqQ
         gm79ngsbjxqJqBpONVmPIh11FXu3qQBfBMYnJ0aTvYAUGrVF5TzHp4m9pjUSGvCZ7i5v
         tTkME5frWYPdvApcQ2otq0i2X75Sa0tNn52i5gmaFWvNUgF811wSk+Lr5wv53PAj6TWF
         oCHfWeDWoSstlCBEAoVCXILrKYVi4S6sOtAy2FTdJe8OJVmyZb+54iEi0sTKkYMR+/HR
         fhadhjwzSViuqMtbWI05YUjitDHzakR53Bpir0IDXAMRpopUV3jp0bOKlE9DgcvcGsBs
         TVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775158809; x=1775763609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J0DvflLdp3i7a17ynT3a78GmDFDn7qbQSpDZ8abq9cA=;
        b=ksGt2CVg9Hets7ORRKgWyMUuzm9GCU/SaIW5Ev2j/4ttimgE9xXFedu/uPVtgap/WO
         aqEGqcAkTaQ02kSREORf3sCzC/8e0r9EhEty2tJO9CUjwuOPN3Na95R4JIZeF9xnMiVm
         UggGjtmKCf/z0OZP6QKrRe04WnQ+MmcieRPBQHqf3WUU1oPBzv1R1rPrcQoM0jTwaCpW
         oFA2gVohIrOIFIASeG8BOO+sSE7cWQCvBN5kw5xS0JjdqtjqBT6EWlY/RA6ILSr8NBPg
         48IYrvd+diwwcFFm2uKSaYINF+bprWzjyIVuZySVtQUznJ8JXcOdREmTj7TFLN81PL6y
         sLmg==
X-Forwarded-Encrypted: i=1; AJvYcCWwZr55EW1ka9dVf/i3nli9jRRYlo/9gJnkHzgrflvFcfNli8RblXLPyR3PNDMvzBVELh2X3GjOxmT0T/cQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0JH+jPeKLYTMEj/CPTFQpMKPmm8ocOjOm8MiZQ/mg3ayYf740
	acXO03B3RibR5mcNoLC97YOaH8HUtbEuBbU0dYDH38x0EnfgroXb443GAmOQRk9vJ37/TRSdgTT
	iIVjR4r040MWYZ8cctXhFvIAnjklhQFr8X7prH2fj
X-Gm-Gg: AeBDieveGnavTH7SV39IC2uKgvgenLIvulEjSw0gPADvJ0B9D1X7U4uwV1RVGLM1gZq
	M3QvabOLNSEeUUMbfh0rPKmqh8w/SK9nJCuCh1thjLb39T3t3/OxLrUJjzLQn2a3mGMW/dE/vAB
	IOxYECleVUsFUPZPyIyTooKJHfs9FupTF1MrTmi1eScu2tgU95c5Nge4lXjuK2Wy2Q8Ss4/1P81
	kr1kDkAGP+viBkmyHYGylfjlLlILu5ywkJ78FcDn/hFx7Y9//vXzq4jG5LD3gsuG209Oc7Gnf4i
	Z/q2KzQ=
X-Received: by 2002:a05:6402:4588:b0:66b:9469:a0f1 with SMTP id
 4fb4d7f45d1cf-66e41481095mr1730a12.14.1775158808171; Thu, 02 Apr 2026
 12:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327234023.2659476-2-jmattson@google.com> <202603301501.N2sdlIQ9-lkp@intel.com>
In-Reply-To: <202603301501.N2sdlIQ9-lkp@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 2 Apr 2026 12:39:54 -0700
X-Gm-Features: AQROBzAy_EbHuWlN5wT5_Opuw5NUyxR9m0jIc3ZzushJ6pVsut7GdsF_uvQSOn8
Message-ID: <CALMp9eSO6gz4R0f1S=E-sA3YE8KE0uJ30otcGsMV1NS3ujUcNA@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] KVM: x86: Define KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT
To: kernel test robot <lkp@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 12:50=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Jim,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 3d6cdcc8883b5726513d245eef0e91cabfc397f7]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jim-Mattson/KVM-x8=
6-Define-KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT/20260328-110805
> base:   3d6cdcc8883b5726513d245eef0e91cabfc397f7
> patch link:    https://lore.kernel.org/r/20260327234023.2659476-2-jmattso=
n%40google.com
> patch subject: [PATCH v7 1/9] KVM: x86: Define KVM_X86_QUIRK_NESTED_SVM_S=
HARED_PAT
> config: x86_64-randconfig-016-20260330 (https://download.01.org/0day-ci/a=
rchive/20260330/202603301501.N2sdlIQ9-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260330/202603301501.N2sdlIQ9-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603301501.N2sdlIQ9-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/x86/kvm/svm/svm_onhyperv.c:11:
>    arch/x86/kvm/svm/svm.h: In function 'l2_has_separate_pat':
> >> arch/x86/kvm/svm/svm.h:626:18: error: implicit declaration of function=
 'kvm_check_has_quirk'; did you mean 'kvm_check_request'? [-Wimplicit-funct=
ion-declaration]
>      626 |                 !kvm_check_has_quirk(svm->vcpu.kvm,
>          |                  ^~~~~~~~~~~~~~~~~~~
>          |                  kvm_check_request
>    In file included from arch/x86/kvm/svm/svm_ops.h:7,
>                     from arch/x86/kvm/svm/svm_onhyperv.c:12:
>    arch/x86/kvm/x86.h: At top level:
> >> arch/x86/kvm/x86.h:429:20: error: conflicting types for 'kvm_check_has=
_quirk'; have 'bool(struct kvm *, u64)' {aka '_Bool(struct kvm *, long long=
 unsigned int)'}
>      429 | static inline bool kvm_check_has_quirk(struct kvm *kvm, u64 qu=
irk)
>          |                    ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kvm/svm/svm.h:626:18: note: previous implicit declaration of =
'kvm_check_has_quirk' with type 'int()'
>      626 |                 !kvm_check_has_quirk(svm->vcpu.kvm,
>          |                  ^~~~~~~~~~~~~~~~~~~
> --

It looks like svm.h should include x86.h.

Sean: Do you want me to send a new series?
