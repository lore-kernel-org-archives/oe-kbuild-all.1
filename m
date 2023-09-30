Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF5B361
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 01:08:47 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5335725cf84so17871114a12.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 18:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696036126; x=1696640926; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZup8TW2zGO5Dc5hYWwOfReZg/1sYcAfov7pXVHZroU=;
        b=cRvkTN7Hv/+7EhQH4xVvS5v2+MVd3NLvsWIEAcwbd070YcSmx8hAESeDdiLFX/328U
         LtgUzozBfOX1MGCxc1HzZ9Q7XVTPIo0MHCH14OH6/FB9MKHPxQZGZ4XvNaVblER9XU9+
         /XpAwSJPEzzX5gAQIIWNIvG3V0ZcIaw6YjFEfa61CM1WiMhGrcAQ3CwxrI3eGZKXrCJ/
         mQjeMzvZoYwEHjV2U9Y2eJW04FhC2PZWUSIiqU45CC4ESAu7YHUUtAl9wtr0uvCca24z
         6v/17mLOqYDxbmydEmnmMedmzF8kxBhiSMaNclrVFP4H4ZyjLWbFJh3q3O/fRIbh8qJu
         UwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696036126; x=1696640926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZup8TW2zGO5Dc5hYWwOfReZg/1sYcAfov7pXVHZroU=;
        b=BspcSOda21TUehsUx1sdchzxKPTrM/Isy78H0rb8SpoSBzfxFCZiT2zfJd9A8hyz6R
         ouIo2+wM3pPj09zbTHF9u0D53NryVm1mPVaXAi7IMfMtbFX2IFzlpSYMM2KqW4N4frfA
         rtFd/dTFMw58JAKV1bbMiYqTnyfuMgLuEf+FP4xk58TB3y2Bb6fevunvUZ5n9Thy3d0v
         2atM26TUQAvnHjDzXDRZ+ohRPeJfiISBQQJR6OIO/xwkBSBE9gICHa6aEtEwTiNM0Hgm
         +twhReCLimboi67TCF0rdHkZVnh67p1uys/5Dijov6vGKOgh47mNfUZORw3GxH0xDxsd
         DyAQ==
X-Gm-Message-State: AOJu0YyvlBwKPHy5qVvM4/ntrIsDpPmqlS9fdtVEaTZznwD3lt869abw
	IbVmLpVLRtObnN/DHP46ypUgHuP7ClscsS4IWLZeKA==
X-Google-Smtp-Source: AGHT+IF8h2UUty/K7RH6GZtDTwRCYxVzrE9X1TPlLmDUaz4Tz1s/zGJimg+5mXKWp3nVXXh21oSaPyBUEm8UvkF4CaE=
X-Received: by 2002:aa7:d489:0:b0:534:8bdf:a256 with SMTP id
 b9-20020aa7d489000000b005348bdfa256mr5227701edr.31.1696036125906; Fri, 29 Sep
 2023 18:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309280610.sLGSPkOG-lkp@intel.com> <CANiq72=J=bO-Q0=gMDyiRgvbF_Vre39iqbEnaEeDho4Vo2ox6A@mail.gmail.com>
 <202309291040.F201590997@keescook>
In-Reply-To: <202309291040.F201590997@keescook>
From: Justin Stitt <justinstitt@google.com>
Date: Sat, 30 Sep 2023 10:08:34 +0900
Message-ID: <CAFhGd8oLmKA7L_YDps+aYLVJTPxWNaKKTgCX3Ji=ZLoGMv7a6g@mail.gmail.com>
Subject: Re: drivers/md/dm-cache-metadata.c:1705:9: warning: 'strncpy'
 specified bound 16 equals destination size
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, kernel test robot <lkp@intel.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 2:49=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Thu, Sep 28, 2023 at 11:36:46AM +0200, Miguel Ojeda wrote:
> > On Thu, Sep 28, 2023 at 12:24=E2=80=AFAM kernel test robot <lkp@intel.c=
om> wrote:
> > >
> > >    In function 'write_hints',
> > >        inlined from 'dm_cache_write_hints' at drivers/md/dm-cache-met=
adata.c:1729:6:
> > > >> drivers/md/dm-cache-metadata.c:1705:9: warning: 'strncpy' specifie=
d bound 16 equals destination size [-Wstringop-truncation]
> > >     1705 |         strncpy(cmd->policy_name, policy_name, sizeof(cmd-=
>policy_name));
> > >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
> >
> > This looks fine given the check above it. In any case, since it
> > appears the code wants to terminate the string, this should use
> > `strscpy*()`, right?
>
> I agree. I can't tell if _pad is needed though. I think struct
> dm_cache_metadata is only used internally? And I see at least the
> initial allocation is zeroed:
>
>         cmd =3D kzalloc(sizeof(*cmd), GFP_KERNEL);
>
> Regardless, for background,
>
> struct has:
>         char policy_name[CACHE_POLICY_NAME_SIZE];
>
> code does:
>         const char *policy_name =3D dm_cache_policy_get_name(policy);
>
>         if (!policy_name[0] ||
>             (strlen(policy_name) > sizeof(cmd->policy_name) - 1))
>                 return -EINVAL;
>
>         strncpy(cmd->policy_name, policy_name, sizeof(cmd->policy_name));
>
>
> Justin, can you add this to your queue (if it's not already there)?

I sent a patch out earlier this week [1].

The line # on the diff v.s the warning is off though. I suspect I may
need a rebase if it doesn't apply clean.

>
> -Kees
>
> --
> Kees Cook

[1]: https://lore.kernel.org/all/20230925-strncpy-drivers-md-dm-cache-metad=
ata-c-v1-1-4b75c7db0cfe@google.com/
