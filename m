Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E370F351C2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 08:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041674; cv=pass; b=ZkEv62B42VkmrX0aLfqIqFcZxCJlMXj6ZDDgVZAyjzPwSnnZQoKjRXJNI6l6A0sIwvq7v/U7/CQcmh3kRTYsJqt4wp851bsiLF5mm4wDyH0RhiaeIQ8dXW4L+nN3PJgtxOH1g+ZZSqnhwb7aIHqtG02RmX9MR/JDWjVffuMcmmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041674; c=relaxed/simple;
	bh=H7PKQ1V0ixvaX8oVe7cpQhD7iZmduazOfTs/hxY5WJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYsHz01TzCRyzlh0FmoJ3dhtrbVxe6FFRYyEY3ifdBf0rl77xjQqqXRT7eTsTVVx9UgJEjvTSArARjNWE7mARONOWgDN3Dz+H+kpHJbrKC6W0boDoq6OATlRFU5AFFpE4yCR/54qIPTv54l3WyAXBbWk96A6zAFji1XpkRbn3kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=By025H0K; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="By025H0K"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-132c338a537so9297031c88.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 01:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780041672; cv=none;
        d=google.com; s=arc-20240605;
        b=GNQssZ+PtHMwjB8sTiZRFzR8M91v9/FaiTT/Xud5x0JkR5ArJqvbap1DGqcKRb1xp0
         2UzdKFFraFsFRJdSxyKR9RI/JTI3Z7raMajCmtoV3wnpd+wER2vpCDRtmYN9Q0nan9P7
         AgJXBlJowWyFexrSlLm1neEgJC3cBSSlq9TMTqvwkzCL7HSwk9/q2Tg90cfDyrGR6v5W
         diisFSgHz7pv08+81kx2vC3jqfRe5leXUz1PJZt9mT9APEyLhZ4IV33ZuADTLJPFwRJ+
         NivEUmf94i28Fkrrbbf/fzs43gFS2gC9l7w9isiZPMw6G4nkoWzNNgbc60AqRMC6b8b6
         bNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h9IaWS9MuReoJAQbEMj+Jq8lZE97ObkkLWcHV/Hs4x8=;
        fh=Ck7iVARsuqPR9FlItHBr3TiFld/yR4pfCVZNjdeN+BA=;
        b=IVeVI/pyLDS1lgi13sN9NTTvbIBeP2iawV4Fm1cqwQaUreUOpiHw+0mGmzq1Y7tPev
         MAR+DUsDJczHI7+o4SZBZfiGjMvaQaxNKpHhZm5DWDzc+vxvAdMqfdDgsJimugv50STP
         WCiu0djLwM2auucEmwtibu1wAJBjJfikRlMt1+EQTIfse7dhXqDGRprPlb2zP7uNf27X
         7UQhUsJm3x4POGEW+Xb/bXwxu1PQFDwNU8Rn5iSzFa+H0Rujj5McLvWQiKLVg8AH3XIF
         5jKVuEzxSbeh2z8PVbRdp25GHJDatlFP8TEGRhgL1nWCd0WYpaNVYq/gyTqSo1jZ/lqd
         Iunw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780041672; x=1780646472; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9IaWS9MuReoJAQbEMj+Jq8lZE97ObkkLWcHV/Hs4x8=;
        b=By025H0KGyxllR+/TJUVpv7WRDa2uRi/ARpfhHrpPFr7RkC+2c4G5Vos31ZX75aggP
         MWj9zkZLFAbMFNWhp47i7GHyfxCvkJbaZErtQvY9mDSljFGGFhbU3Z66/u7P7po8w5Hv
         POQDvaVEzSdEHVX1ROu1ppneG+AatZrAEd+hnqO+SBM0cojdjrDbxXM01joR7dkfudya
         sjjJSKXHXFTYI0RHjqxB5P9UR4u6HSzv/ksbDKXBGrp5ILif/OD8inyOEF5jnuIJHfug
         SWFtrghi+l1ZboeuJrHcSzZFJ1SsC1IB2WkYFxUxUVq03LMkO5+crzkgXsQbtUWgAZk2
         LSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041672; x=1780646472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9IaWS9MuReoJAQbEMj+Jq8lZE97ObkkLWcHV/Hs4x8=;
        b=J5kPdTYPDf+KStRvltOFKauugWceT+8fCD7MxOftf0ZAdLfqnDaFtOlt1I84jSgblZ
         cME+UKC08su9IKkiVlh/jE/NyK2DTGdhWmC9dhiojSUIoHEG09zi2UcMZWHL46QU0wU4
         /BCi43O3wCG4MtOtWLthMJlCp+QJVc3gbPuj6ClNGEWD3Ju2Er7A2LIVzjalxTxWO4d9
         h/frRX1k5tUKrRIw0jj5rN95RsbyH2MBXYsfsXp5RfG3a90N/cKN+1KzG3UJHUaaArCA
         lLMpNPZBbR3Teq3ll3n7HKlNlmC+i9qqO7D61JMqL1yfD646DKDyxKaw1t5elbN/d0Kx
         RiCw==
X-Forwarded-Encrypted: i=1; AFNElJ800A4g3H5bBv88xXY53MyJRvSHHzSv1wPjlnxdU3pt2NgLuZrilOyGtQPRzNDHhUeo8xWTfth8gQiCkjJa@lists.linux.dev
X-Gm-Message-State: AOJu0YwIgbTxoc2nUmJOJRzQn0RL5z6A/2j4MNJR0l1asG7KLm350wwA
	tISRodvI37s1Wlbvt5RaZD1/bScVlxbx82Yz1C69sVRkQHB1OKfrBZWaOMsCun5+T+lJECEat5B
	PvxcaJnZ1L+88ASmD3oDJHh0sNLQbnf4+gRu2qpwa
X-Gm-Gg: Acq92OFy4g59a6P5eoYs2c9CsD/jpU4B4FGlJIpD5s8VqeWmBRgidpVQKpsL6U0BN7w
	s9v2A3gEsacV5+DoBkuL7Cgsy/+Qj/vJ0y7g1mQ9DWvIfDliR9XIxj2t4BI92J7mYR4QHAnzC2O
	5xjz2boE9c7JplFFdDbRQbfa54RJN//zoe7qT859ryJHweJMZQarO68uyMtA+VNrfPfs40ShxG0
	Wnd3EKUvHig8+CpiX5JNoL92+UMXnwNSO3+BMHbxYsESjwPfDFavgHKEwnljiAVFQrp9LGLGmKs
	Oo5YrcyQ+P8cn4tkCwGqP92mW/iMpNNo/cARJBvR0xtCC/I1wzyB2O7E73KGUKDoDDz9J+5BNvU
	JeGr2
X-Received: by 2002:a05:7022:2221:b0:136:4bbe:9524 with SMTP id
 a92af1059eb24-137ae61dbe5mr768951c88.10.1780041671463; Fri, 29 May 2026
 01:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605291041.seNEWvLQ-lkp@intel.com> <ahkzosbjO4NdSyD8@google.com>
 <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
In-Reply-To: <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 29 May 2026 10:00:51 +0200
X-Gm-Features: AVHnY4JLxRuhL58doZ06uRkm-dD6MUWwn2fk8nlzOdANNCE59i3vCeVtWZh7p04
Message-ID: <CAH5fLgiFo1rep3N5qGWGsTXT177hfSwW0=e1KsVCrrz2uRMoBw@mail.gmail.com>
Subject: Re: [linux-next:master 3728/9137] samples/rust/rust_driver_auxiliary.o:
 warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, Danilo Krummrich <dakr@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 9:54=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Fri May 29, 2026 at 3:35 PM JST, Alice Ryhl wrote:
> > On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git master
> >> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
> >> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust: aux=
iliary: add registration data to auxiliary devices
> >> config: x86_64-randconfig-004-20260529 (https://download.01.org/0day-c=
i/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 8=
7f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> >> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNEWvLQ-=
lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.module=
_ctor+0xd: call without frame pointer save/setup
> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.module=
_dtor+0x1: call without frame pointer save/setup
> >
> > This one looks like this bug:
> > https://github.com/rust-lang/rust/pull/156980
>
> Does [1] work around the problem by any chance?
>
> [1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556d55@n=
vidia.com/

The asan.module_ctor error? I don't see how it would work around that.

Alice
