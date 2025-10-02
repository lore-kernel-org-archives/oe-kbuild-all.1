Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E61253B42
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759446998; cv=none; b=NSeYZ4WsIVJwlhX1paVmw/f9ufNRR7KNEhKZezJQHwNekwdGY7pasPhrbq5/r7rdEuYAePG6SL6zihCrkQ9dyecRdI1pip+fPgKtn3rNLDqtTMJUdpmNUuO/XE7v97JhbbL8ziu+p5NtI1L2dScQci9Ip/pPYAyMDXX8mdSl8Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759446998; c=relaxed/simple;
	bh=6ce+k7Xq/4AJMLhlBBhOEuJaox3vRmQx5u9antQuDgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blzeEaPemybYP4LyOUmGW6MuCwo1cGNYtuocKvcPj75lfc4fdCEsOY0E9uFxszd8uSWM9rHt2VXeaxQpGoFa6532SOov1/3cszKxNl4hEiZx8SOrhcYCqRnuKaVPZFe0KenS3UXMQskyN8NdkrIoLiizSGByA3HiZXG/oVrOxP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OibUZaL5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OibUZaL5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-269640c2d4bso2280565ad.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Oct 2025 16:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759446996; x=1760051796; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ja9Bn6P2KMK2i3cPP4zfsONf+zHduNfLue2PhQDsu4M=;
        b=OibUZaL5TT2D0YQ2mW+Sg1HefG8Y35+SvysYA5HJqJGglqKqeMwNJ6LogRZQYd5r+o
         tpoSUDbKxVRQTC7VWRQvXOXPmIk7OMOaO4L1lAzQzrV8UXJFrZtFxA32JMyX4NDNxZRv
         ApSnjgSkVSDoGGjTDZBLFyp6bL59Yzjcbwvw8TaXf5c6ZdHxr0B2nKkpmDmWEDnO9c4U
         T2dW+PiOGn9L5QoxEYFQKkXxerN4gD3ZGOOP9ifu/5VTYNroGGlWjMuVIsaKTXl4Ra3p
         ksQLvH10Gd5sEMDtes5jX7SxPUFzbn6tZKGxExRHWfNJj4NBTxIj7fD0bmkq3OmkrzVZ
         /WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759446996; x=1760051796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ja9Bn6P2KMK2i3cPP4zfsONf+zHduNfLue2PhQDsu4M=;
        b=UoazHkMZre0gkDDhfuyZwFwjxpmqWc6jsz4k8ncHrNbbVOjwFJI7jXQ9AFalmi7n+/
         MvmBy4pGPb9XIPNUsoQpW+4IhKg1XMa5lM7BvxrUQN7YNin/I5l9pl8nhrC3ojZbuEkl
         8EiYhc9AYlIJLc3bvo0TtP4qBN7KOky7zwkiMG99J8CjGgArUFGeBw3mcOtL0Kd9E7Kh
         /wuXD3EMsRT9B9HIqdYwimSwZNkvrJNaTijLuXgV/sdUDTO3XVkHfF49B+/gpjHtJIk3
         Y4RFJxFTt1i35ILysUCBu+I15VdcrL559bmgiSwPucrZlz7uLQg38FFUDopjtZwppDRq
         t4VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXYuDd1Yekb0oXAX9RzKMnIkrwK90R9C2N4mDOwgVZXq/bNSuv057epkqfDvNT4rfOmPBVy8yShidWQNLe@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr2HOKdjdwOD2h6uGPTOdyMabjmTVGil0mKEnIK3owYNlEYWZ5
	aDYl3yIP9UqUZgwBIJVDwH5gCNX09CBVGmW7baQZw4Z98pnx9xpOcYBZR5YnPNfjYT79wtKSVjl
	FsISl4PySi0+xmDf2og8HGaLawyMHJFU=
X-Gm-Gg: ASbGncszKel0sm0eEGIZkbI3TQBUbZSThAzu5/Wlv8DqE8KaJXMqjHNl5RHZRPRsI/A
	Nwm/KJaz3YAur0R3nzmxZobVPmo7Mqkzsyc3PbQz0rsoVh8qINay1t3eemr7jynRDzwhTKMcBpV
	aaoFmqswyRrzwCnKQFAjJ2IjUiPxXJZQ3T9w9ZscEHwZ5GnCC2q8UZluM4wxHZhjWsRtm7VUKK4
	ClYGw6H0rotsk++vNZOmeybxm44iLA4L9qMRncKxesLDXffQC3X6wNZgWmssywwk3QmvPW1gg6J
	HWvesb1zTEyhxDOMlRAtC90o171oxlyJCv/hlEqHr+jfGKSeAA==
X-Google-Smtp-Source: AGHT+IG1jLZozgPgBjz8il0nnl06KAhRwEmfM28KR42HSA5o1aegNp29hlxSwQoCLtlUe5qlKk2pHpNiYMz9bK5H3V4=
X-Received: by 2002:a17:902:e743:b0:274:944f:9d84 with SMTP id
 d9443c01a7336-28e9a7b381fmr5957375ad.11.1759446996485; Thu, 02 Oct 2025
 16:16:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
 <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
 <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com> <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
In-Reply-To: <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Oct 2025 01:16:24 +0200
X-Gm-Features: AS18NWDlCUFdClL2tm6c6Fg5XnZ_OVsyL104Y971QPgVO4IBNtdGQLs-NKBaHY8
Message-ID: <CANiq72=u2Zm+MtArPML9EhQyjB1u-OLKe_NRf-dHv25EKA+qEQ@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 12:43=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> Thanks.  As mentioned, today's linux-next is where the problem is being
> observed.

You're welcome -- yeah, I see it in my one of my CIs (the
rust.docs.kernel.org that runs more often), but really, I think we
should help you enable the Rust build -- you take patches for many
things across the tree, so that would be very useful...

Nowadays it should be fairly easy to enable, i.e. even the packages
from some distros work.

I have build-tested the patch on top of mm-hotfixes-unstable now too
(since I don't see it applied yet), so please feel free to pick tags
like:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Or even:

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

I test every day -next, so I will see this in my 20251002 run and will
notice if it doesn't go away.

Cheers,
Miguel
