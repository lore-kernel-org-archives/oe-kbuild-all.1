Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEF02C027B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304623; cv=pass; b=b4n+/tFJ/Im5T/XKQkqbONTtHTlAzERprLCZAIynyiPQxlWQ05+xK4L6wIJK3COZelBQto0eIyWHcM8y9cGIaDAVvpQT8RttgPBpKFVB94qpw4v/GT0F1IOB/2h/3xvhFxerjn6PlWgK5HuGCMeTAfnzpPHJnR/Nz7LHt5tW0jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304623; c=relaxed/simple;
	bh=/JDdW6RRjFjf98A5PteWvM+vJpoBOD096RNqLSgDmdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNCik5c5unMQqeawT7aBbCT0EQuCq6cwFgnq7huuLOpJ2YonwWuDucAhTnbOXCi9Mxvwln8xWUbXKoNBb1ZLpDFUaIrfUSDcQaM0yDF/UGEjDjm55h6vXscsWINn/CZs8yjpsKIaN3sMnvmMEk4zmmVSZwcPh+dIfvG//IHSyU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTg+s0MA; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTg+s0MA"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e93d1dd156so467666a34.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 05:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782304622; cv=none;
        d=google.com; s=arc-20240605;
        b=PmuieLQzkHXFPm338Pa/mvDDUpmtA/pRwAWxkVyQlp8GTWQ3JxORqILhHNxPgT04Xc
         ToUTalk+j7iAzF8FPvPHo3TC4587JHfMOfm5j8atEtW6rTm7QEdvSnB8v9gxGNOYxERu
         HjZvFdf6yjm6piT5fd15JLpjvQzbYkTlckq4gMxmKjCRH7RSSamk1NY22kdsgfaMJZpH
         c30FhGQx1pCuyAnxW5w3LGxT2BJzSISCNnktDk/iJQtyGZF33wNV8vKbDOjUl0TY9n2h
         Q2Zipxg+Lq2S7NJ3gFnzLdZO+9Np6QMWyXTZ6m2UTGiRT30jqAGw79th0YOvmE5FihPP
         Vz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/JDdW6RRjFjf98A5PteWvM+vJpoBOD096RNqLSgDmdE=;
        fh=wi1GsU7zeby+BDJlr3+PKUIj/UtPnZNckY9o5fJQTYk=;
        b=L5pEpb2DRxYHQ90Jq1Ea/ykLDGPgoyVgyEmCKbbyk6HiTIrOntSeDXqjxrxsjfrlgI
         kcvfS70oY0st/CuTJk8zWFEkGnFZRbPp3/wAyc6PX9TnVmUmrlBEupqTwJdjykQVpy3J
         J/483d5ajpEhp3S6q3VNtDbWIFAhFK91swfuY9PrETO+qwXKTREYWOfQGHlIksUTKFG2
         3d16g/H+IGJklPseRdE6o2QPm1gSToYhyOflk4k2/ls7OiuHthBiK4wLJiMq9ZUP8mD+
         W5V1ddTbqemoat8m0sBF403adfSMt+kJUSGTCVcDcpvbCP6Dg31NFI6ZKV8TObT+ey06
         biXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304622; x=1782909422; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JDdW6RRjFjf98A5PteWvM+vJpoBOD096RNqLSgDmdE=;
        b=KTg+s0MAf9TGnpjgfrCN4iHuDMKRQ1M7Fg7Zsy9k8CEeHGNZedA/+80y4i3u9cySdR
         9w4/b635kwZ4mfuuaKsIO+wh6Aqqqf3br4vdoIZp9+eMRTndPFrbd05/3KQW5KofGCO4
         mqtCRyOe0lOrS1Mas69bFBCzhNYxQWAAGRfimeIVudM3Khw34Rwmwu/iY993kSgBfA2M
         Fsm9c9LeoCRYJ5BZH6XMmpE9oRufvLcwUHTn8KCMXrsKXgQUT53ds2v0ceYPbnveJXJF
         MbrjgJPAbLEykWqRRUp3nIDjSFgl4yfjIbyfjssx1PnZXrGSCiCA+ocj6hZ1xpaZbukn
         0J0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304622; x=1782909422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JDdW6RRjFjf98A5PteWvM+vJpoBOD096RNqLSgDmdE=;
        b=dA7pr62jcWenqTUh0C88bB2a/TjI+og3vg6Rgu0WV/rAexhKXOJvpHU0DQkxV0xN6x
         pFP6ltg2S3c/2c+ZiYNquAHMbDQgcTCTQfiUBiPHPmne5J66lehn3GBwyQr7fLcojEfA
         JMMRFXBPXvKpJeU48JAxOwhyiOX6MYlLOjtrg9U8ST+rfM6EE2+635TqIoskjFcLi13j
         AFfVTx5OW6ZF5dBDFR8jjF15/+iV0GQidHL2cyZUu3IXRKdpJHa0gE03lpwrhFNWgDTE
         6NWRoyVHXtHAiCNbxoZ+h/Ne/9ahX7XutI4ptCpD0lCalNdhcn7d2ttXr1FhsbbJd3MU
         m3yQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Am4jJg4hdPKqjHUS7LbD/92xkWZcYpeKRobHXuptD5uATDt2OzBqUMCxZtRdvoJRwQxwAgbBmrEcWzu8B@lists.linux.dev
X-Gm-Message-State: AOJu0YxMjYZABZnP740TsJvSN34hYyrAy6xaMjJzTIdTb8AizN2dgub0
	rX8kUTX/Kufyz/fKnXbsGLTzWVS7bCLdZkbekTCmj6AsEBjHNk3Rb3WFFKXTrbPm6B8PbwVZFIc
	KrM0Dp/cBc+UFkkzKUwo8tAw+7T9TMK8=
X-Gm-Gg: AfdE7cnEVcsGkv50mOW/7SaH/auwjld3wDN+xJAlwmskQfuL/sQWtst/Olhurp0onoz
	y0w95q4xjpr3Dm5rBkoqDd6J4xVjijKlq1HBdMzShb2jZAyfdKm/mRHRC1RhYjvzQvh3CbiMT06
	KuenM12GcyMkTZfIcDVo5UOm8OtThzuLlkqQ7ATumKvraUx875wfNrzSqUNR0jlhLDqkEw+KMRf
	5MRU5A01nkei3MgnRlM/dBA92tIdpDSP4XB3X5Qrby1NGxLjVb2nEL0V/3WwS66i6/WWwLTQ+Q=
X-Received: by 2002:a05:6830:2685:b0:7e4:10:c994 with SMTP id
 46e09a7af769-7e98685fdaemr2799041a34.11.1782304621633; Wed, 24 Jun 2026
 05:37:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606232356.gwHMAJAW-lkp@intel.com> <CABXGCsMFOo-X_JeZ6qiwN8L=_4wOcf9xeS_RcDAb8XfzA6+WBA@mail.gmail.com>
 <20260624092806.GX48970@noisy.programming.kicks-ass.net>
In-Reply-To: <20260624092806.GX48970@noisy.programming.kicks-ass.net>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 24 Jun 2026 17:36:49 +0500
X-Gm-Features: AVVi8CdiPQWCvq67NV5i22vU8s3Ws8DNcesb0onvNShgbiPkzx1FB5aJsSX0Pto
Message-ID: <CABXGCsOw+hXwp3OshzuSxTBLwMzrC=4wpofChFyuOsT7nj1MTQ@mail.gmail.com>
Subject: Re: [linux-next:master 14191/14955] vmlinux.o: error: objtool:
 amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with
 modified stack frame
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, jpoimboe@kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 2:28=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> I do think this is very much a compiler issue, clang should never emit
> an indirect call for this. Doing that is just aweful.

Filed upstream as https://github.com/llvm/llvm-project/issues/205544
with a standalone reproducer (the drm_exec computed-goto pattern reduced
to one .c file; plain -O2, no LTO and no KASAN needed). clang lowers the
single-target computed goto to jmp *%reg; gcc folds the same source to a
direct jmp. So the missed fold is tracked on the LLVM side regardless of
the drm_exec.h rework happening here.

I have the KASAN + ThinLTO + clang config that triggered the original
objtool warning, so I can give a Tested-by once the drm_exec.h change
settles.

--=20
Thanks,
Mikhail.
