Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA391382
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwTrkJVU"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-672096e0e89so23586496d6.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 05 Nov 2023 05:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699192265; x=1699797065; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6/SlWm7axAxg9ZQNzBZyojMAHL0SVLzNpVyeJWY+qE=;
        b=cwTrkJVUJtMdgvfc7ENwNn689BSgtqGX2h0xaYkS6d5PKfFgJcGQDUO1L9YAeOdQim
         NxmUGricG8NLqTxaNE+vzb0YFSVa/Qq6CaFPKPa/iy581KRbkRkW+K4K453/HSVPDg0g
         KIsDrpOzFE65YjCJ8k6I2+9vfEXiEhLQk83o5oDlltuG5eTQE6Gkw0+/YKw7f3BLkv1M
         3mlWUMJYMbGkS17+wtU3cto1nJo3nJ5rdB4FqdyizbYPy2/33MgEmeMPHeeIU462+LXk
         ++OO/6MvFuPvETszzZ5BdEMorBzfyj0t2Aa+B6zGTN+Q1gjUwTy5k2jqnyiqFT7DdoVL
         iN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699192265; x=1699797065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6/SlWm7axAxg9ZQNzBZyojMAHL0SVLzNpVyeJWY+qE=;
        b=GmO/5GtECKMQ2qM8EgjdPw28k+kVYOaoMlK21/ogJ8jJjfhb6y7qKs3ysdUi24hdIt
         FAD24T4J/DsQNlWtczpK7x/vFCcWoxgOJvXL0SANsuvaeYiUQlv2kq+yodnvKiJFvwuN
         y/27neWlCqMJojC73owhiLFQO/BDOL5F535hXRu3tJPeoxRIlCpWOcQ+5DN//vtvhK9A
         ZVho52dKgahDjwuKffsA3M9antO+mtR20w9RMolyQVtpNJNPxGNxoBCq05yTHPssFeWp
         e+BSM+1eNPP+ZjQCrlATLTEjrbND6RlRRYmEtx4mXfKWhgrYRhHqM+FRY0dtYTjaUuTZ
         dHQw==
X-Gm-Message-State: AOJu0YyorS24Yxa0G3ZuO+vyjBnkaR6JduFCqE1/V96F+Q/lr+GdPIuH
	4+acF8AUgCrg20S5/th+glDEVOxh1o+70xFkZMY=
X-Google-Smtp-Source: AGHT+IGNTz8xTtuXar5imrbM03au8p+fNcpA6jZPPcfNF8nKvBDi2FzQE8h3JhjoNWdYA54OLAo5n2bgxxVxFdil8tY=
X-Received: by 2002:ad4:5ca9:0:b0:658:23a5:e062 with SMTP id
 q9-20020ad45ca9000000b0065823a5e062mr36024400qvh.31.1699192265578; Sun, 05
 Nov 2023 05:51:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311031651.A7crZEur-lkp@intel.com> <20231105062227.4190-1-laoar.shao@gmail.com>
 <4f5a8c67-74be-41a1-8a0c-acac40da8902@app.fastmail.com> <CALOAHbCt4-kDGoW=4R0EarPNV2yNcwy3exkVrn6Tz5Ng8M8gvg@mail.gmail.com>
 <d178b5b5-4171-4e76-a486-c20d5f081448@app.fastmail.com>
In-Reply-To: <d178b5b5-4171-4e76-a486-c20d5f081448@app.fastmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 5 Nov 2023 21:50:29 +0800
Message-ID: <CALOAHbDHBbcgg-p4cN7czcLsAx7-aB4pAX6jGUo6TmetH+RhcA@mail.gmail.com>
Subject: Re: [PATCH bpf-next] compiler-gcc: Ignore -Wmissing-prototypes
 warning for older GCC
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org, cgroups@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, Johannes Weiner <hannes@cmpxchg.org>, Hao Luo <haoluo@google.com>, 
	John Fastabend <john.fastabend@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, lizefan.x@bytedance.com, 
	Waiman Long <longman@redhat.com>, Martin KaFai Lau <martin.lau@linux.dev>, mkoutny@suse.com, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <oliver.sang@intel.com>, 
	Stanislav Fomichev <sdf@google.com>, sinquersw@gmail.com, Song Liu <song@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, yosryahmed@google.com, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 5, 2023 at 9:01=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sun, Nov 5, 2023, at 12:54, Yafang Shao wrote:
> > On Sun, Nov 5, 2023 at 4:24=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> >> On Sun, Nov 5, 2023, at 07:22, Yafang Shao wrote:
> >> > To address this, we should also suppress the "-Wmissing-prototypes" =
warning
> >> > for older GCC versions. Since "#pragma GCC diagnostic push" is suppo=
rted as
> >> > of GCC 4.6, it is acceptable to ignore these warnings for GCC >=3D 5=
.1.0.
> >>
> >> Not sure why these need to be suppressed like this at all,
> >> can't you just add the prototype somewhere?
> >
> > BPF kfuncs are intended for use within BPF programs, and they should
> > not be called from other parts of the kernel. Consequently, it is not
> > appropriate to include their prototypes in a kernel header file.
>
> How does the caller in the BPF program get the prototype?

BPF programs will get the prototype directly from BTF, for example,
see also the prototypes declared using "__ksym"  in
tools/testing/selftests/bpf/progs/ for examples.

>
> >> > @@ -131,14 +131,14 @@
> >> >  #define __diag_str(s)                __diag_str1(s)
> >> >  #define __diag(s)            _Pragma(__diag_str(GCC diagnostic s))
> >> >
> >> > -#if GCC_VERSION >=3D 80000
> >> > -#define __diag_GCC_8(s)              __diag(s)
> >> > +#if GCC_VERSION >=3D 50100
> >> > +#define __diag_GCC_5(s)              __diag(s)
> >> >  #else
> >> > -#define __diag_GCC_8(s)
> >> > +#define __diag_GCC_5(s)
> >> >  #endif
> >> >
> >>
> >> This breaks all uses of __diag_ignore that specify
> >> version 8 directly. Just add the macros for each version
> >> from 5 to 14 here.
> >
> > It seems that __diag_GCC_8() or __diag_GCC() are not directly used
> > anywhere in the kernel, right?
>
> I see three instances:
>
> drivers/net/ethernet/renesas/sh_eth.c:__diag_ignore(GCC, 8, "-Woverride-i=
nit",
> include/linux/compat.h:     __diag_ignore(GCC, 8, "-Wattribute-alias",   =
                           include/linux/syscalls.h:   __diag_ignore(GCC, 8=
, "-Wattribute-alias",

Thanks for pointing them out.

>
> The override-init one should probably use version 5 as well,
> but I think the -Wattribute-alias ones require GCC 8 and otherwise
> cause a warning about an unknown warning option.

Right. -Wattribute-alias requires GCC 8.

>
> __diag_ignore_all() would also be wrong for the override-init
> because the option has a different name in clang
> (-Winitializer-overrides).
>
> > Therefore it won't break anything if we just replace __diag_GCC_8()
> > with __diag_GCC_5().
> > It may be cumbersome to add the macrocs for every GCC version if they
> > aren't actively used.
>
> For the _all variant, I would prefer to completely remove
> the version logic and just use __diag() directly. I think the
> entire point of this is that it is used on all supported
> versions.

Good suggestion.
will do it.

--=20
Regards
Yafang
