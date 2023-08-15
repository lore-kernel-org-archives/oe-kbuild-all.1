Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2242523CC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 08:43:05 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d645b95c7b8so4439301276.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 01:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692088985; x=1692693785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5aWldiQNtzOYXetAG489NlnzNlvR9LuEybPAIpO1l4=;
        b=kclgWZKFGR70PAS8bZ400T+cD0GFoAjb/IyKBKU3GL002j6pHPMIVos+W1OxLqgo9+
         RntWnzt3ZGbsojF7mxBOjJ+wKoUB7lp7GQOjeXSdhSHvppN2eCCdXl5+YBLTZfd6MCd/
         I84eUHeNRJfMtjC8mTbNlDKq8Txk8C7YE6TL/q8RbyOxpHYkl5KvgRUfI8c4wQMuhHPd
         x9vl7tUAj6+oImAW6zahG8AIG1YfybYTlTMbEIAhxgrgu0zcmJa6I9w9i9HEb2sm9A8f
         j+7vRbwqn79lmwAu4yCGyFY0qlu8VX3BpeVn8SrX4SVHCH0OX/T+sy2Gkg0wqk0byJFK
         Hk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692088985; x=1692693785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5aWldiQNtzOYXetAG489NlnzNlvR9LuEybPAIpO1l4=;
        b=FZHnkYIG/ixDa9udOrrHVIfl3UsSyd4d0UHs56Al0gJnuIgeEsdJalwy6Unv3BdPPq
         q4BH/A1NDRB4d3vk/l48Vv3f5H0NDNswKCu8XNEENfDGSSHbCwFt/2PjAh0lm/y46h7w
         J9nPNufeKWnRuB9hWUPm14qMwQxa48xnK0w8QLoZOIk0JFfXmp3zt4BWp3SywTgkb2wK
         fAHV1nIxJ8lgu6vCZRLLEfxc0WzKC4u9OYLn8k6rfISwVhguJmyE8rLqqypyDtAoL7To
         Rw4pOcpUFeZ13a6M3+B6ulfl39ui3BYUODmyeMdVxWeizADRPxaM8rNXaNCc6x+CmueR
         Yw3A==
X-Gm-Message-State: AOJu0YyjjqeNpRFjyjAWG4HialX71LxN5gOAuUpPsai56RkfV6BLAg1q
	4kzt5cAr5k+355iU0jGqIl4RxuW/Np0wN4DHt9o=
X-Google-Smtp-Source: AGHT+IGK9nD3C+DMw9EmTmNAQ/h7XWp0b6HT/+rn2i1gXv6HVIV7M3Qzt4hbYaaCrRc8iD8HY0q35XNxZbskGd4zFvw=
X-Received: by 2002:a05:6902:136d:b0:c39:50fe:79be with SMTP id
 bt13-20020a056902136d00b00c3950fe79bemr11258259ybb.61.1692088984920; Tue, 15
 Aug 2023 01:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308151409.tqK1jSIb-lkp@intel.com>
In-Reply-To: <202308151409.tqK1jSIb-lkp@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Aug 2023 10:42:53 +0200
Message-ID: <CANiq72kahMbFnJ+nX_P02hkhEAnHi7MnHonABm_Af6Bt+PbRQw@mail.gmail.com>
Subject: Re: [rust:rust-next 23/25] make[3]: *** No rule to make target 'rustdoc'.
To: kernel test robot <lkp@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2023 at 8:14=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://github.com/Rust-for-Linux/linux rust-next
> head:   08ab786556ff177086ce93b26daf2a58edd10968
> commit: 89eed1ab1161e7d60595917e3b982e03dfcc0f8d [23/25] rust: upgrade to=
 Rust 1.71.1
> config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/202=
30815/202308151409.tqK1jSIb-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151409=
.tqK1jSIb-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308151409.tqK1jSIb-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> make[3]: *** No rule to make target 'rustdoc'.

This probably means the CI does not support the new version and thus
Rust is not available in that case (i.e. in the `make rustavailable`
sense).

Cheers,
Miguel
