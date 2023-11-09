Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0E7341BC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiKFaZQc"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32fb1d757f7so698243f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Nov 2023 10:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699554204; x=1700159004; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BPQXHQI7/Rfc9RZRbQPwTxFbuzF5RhqmSjIsZvq5GE=;
        b=kiKFaZQcqyn/0wqOfH/je89ClOfKN4VoPYLzcHh9VHkTFG+4YIcaloWljTRS5wIwKu
         th5DAmt1m4JrVbhoNMn3oT/KWdSIIJFXbTv94l9si0iYm86peeFlJplXo5jqZqD8wsFW
         CMqPAov6kzH/8saXhUmaMZKd6FL/+YvPeQti87vZu3+wdFoTC3R/rQqtJ/wTr+Jk5ISw
         LyL9p2/AnrsoL3IKHoxh0VEsntkvw0o4C1vmxWnprgb1SOJ2FxemVW9PggqnCpvgiF1N
         n27c6O2deCRmRjOnGmUc77DyHr/xTrwF8GbTbwCPBjTCse5nERoQLMUYS6OG75tCZKC7
         AcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699554204; x=1700159004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BPQXHQI7/Rfc9RZRbQPwTxFbuzF5RhqmSjIsZvq5GE=;
        b=c9no95nP6yNEN3CJFLLDyp9eewFqagxo6O2fRXpA7nr2UJQNECvxueZC3D//fffSnA
         ajrhfCB8tcETewC0gI+XAgmg4/+rlIrmV1434lMcyTEDrsiEsgyvsBvqtR/ozctEzRjh
         M96VO7+GZbDq3D3q/getbuTXmWH3d08g+v1NdswcyedYN1Cdc66fQYQ/6HLSvO9VIr6C
         W8M3jZtoNZQEOG+81FW94cYEhlVRSkZ3HuXNdqfkSvzCtOUG6b5hWvJ4p+Dgs0dGO8D3
         u1NmXfZeRKx7oIpGNSeV3hngBcGv3YIScs21Y0vJIYjSD2TkbvHITPcZPpLE0wHa2ipO
         dLcg==
X-Gm-Message-State: AOJu0YyqleM7SiM8nnSPJ652h5gbLWzQ0Hj2trjwh09LJ6j89Aqvyzmy
	XgqZFflqJHqjpz4YszDFLjWEN++x841gx15Oh0A=
X-Google-Smtp-Source: AGHT+IEBqvPwO8v1AiU9zIjTCU0qLIf0TRpz/VucjkyThOBub813+sYMjLsV3t5K5c6jm+caQ2D5k4mgDRWugQ2PPWQ=
X-Received: by 2002:adf:ebc3:0:b0:32d:96dd:704d with SMTP id
 v3-20020adfebc3000000b0032d96dd704dmr4279394wrn.18.1699554203414; Thu, 09 Nov
 2023 10:23:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311031651.A7crZEur-lkp@intel.com> <20231106031802.4188-1-laoar.shao@gmail.com>
In-Reply-To: <20231106031802.4188-1-laoar.shao@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 9 Nov 2023 10:23:11 -0800
Message-ID: <CAADnVQLDOEPmDyipHOH0E6QSg4aJtcHcfghoAQmQtROAMd=imQ@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next] compiler-gcc: Suppress -Wmissing-prototypes
 warning for all supported GCC
To: Yafang Shao <laoar.shao@gmail.com>
Cc: kbuild test robot <lkp@intel.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Hao Luo <haoluo@google.com>, 
	John Fastabend <john.fastabend@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Waiman Long <longman@redhat.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <oliver.sang@intel.com>, 
	Stanislav Fomichev <sdf@google.com>, Kui-Feng Lee <sinquersw@gmail.com>, Song Liu <song@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Yosry Ahmed <yosryahmed@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 5, 2023 at 7:18=E2=80=AFPM Yafang Shao <laoar.shao@gmail.com> w=
rote:
>
> The kernel supports a minimum GCC version of 5.1.0 for building. However,
> the "__diag_ignore_all" directive only suppresses the
> "-Wmissing-prototypes" warning for GCC versions >=3D 8.0.0. As a result, =
when
> building the kernel with older GCC versions, warnings may be triggered. T=
he
> example below illustrates the warnings reported by the kernel test robot
> using GCC 7.5.0:
>
>   compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
>   All warnings (new ones prefixed by >>):
>
>    kernel/bpf/helpers.c:1893:19: warning: no previous prototype for 'bpf_=
obj_new_impl' [-Wmissing-prototypes]
>     __bpf_kfunc void *bpf_obj_new_impl(u64 local_type_id__k, void *meta__=
ign)
>                       ^~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:1907:19: warning: no previous prototype for 'bpf_=
percpu_obj_new_impl' [-Wmissing-prototypes]
>     __bpf_kfunc void *bpf_percpu_obj_new_impl(u64 local_type_id__k, void =
*meta__ign)
>    [...]
>
> To address this, we should also suppress the "-Wmissing-prototypes" warni=
ng
> for older GCC versions. "#pragma GCC diagnostic push" is supported as
> of GCC 4.6, and both "-Wmissing-prototypes" and "-Wmissing-declarations"
> are supported for all the GCC versions that we currently support.
> Therefore, it is reasonable to suppress these warnings for all supported
> GCC versions.
>
> With this adjustment, it's important to note that after implementing
> "__diag_ignore_all", it will effectively suppress warnings for all the
> supported GCC versions.
>
> In the future, if you wish to suppress warnings that are only supported o=
n
> higher GCC versions, it is advisable to explicitly use "__diag_ignore" to
> specify the GCC version you are targeting.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311031651.A7crZEur-lkp@i=
ntel.com/
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/linux/compiler-gcc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> index 7af9e34..80918bd 100644
> --- a/include/linux/compiler-gcc.h
> +++ b/include/linux/compiler-gcc.h
> @@ -138,7 +138,7 @@
>  #endif
>
>  #define __diag_ignore_all(option, comment) \
> -       __diag_GCC(8, ignore, option)
> +       __diag(__diag_GCC_ignore option)

Arnd,
does this look good to you?

If so, pls ack.
