Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A485731A83
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 09:36:58 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d865db5b4c7so11435979276.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695893817; x=1696498617; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1H2jD/T72wNFGuODad3ytbvumv6Q48VnTWsSVBuRsw=;
        b=PBgRr8sinC8oSTkqsRYbh+qD9ILZ1fa/o6Tluk68puD18241Y7ZcSCyFxSscKtXXbT
         ODjp8Yk8FTV/drZwmfave5whnQvC4pQk/2RE1m/cYv6Q3TZddjm1VALPoppS+RhAcPPb
         jTX0T9Tasno2eMdeK0+p+1csbiu6vGlm3/P8hrwRbNqdVtzWPWYNMtu2jRK39Xr4dPr8
         1u/4nZZPigMttoc+z4UyZTOexJacbt5dlLkJbY6oLZZtZIJmVVUrA8cxiviFp4yOW/+l
         cTX6Y7vAvrS307t2sdl95fFUeJJyzKQ9gGdPyXK31WFKtMTO3VxFAkowi8+AmkfjTM44
         kp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695893817; x=1696498617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1H2jD/T72wNFGuODad3ytbvumv6Q48VnTWsSVBuRsw=;
        b=fdfYnT59ZujPeNhTzIAiDxPWKND7YaGQz3PIZxSf9H6YoRE411wIqoBG25L9TW+kVI
         X0uUsBmpEny/FPKG+ubGQQfxyh5g0Lnq4/utga9/8sJaAueFjdYRC1qiVOUS4EUterjh
         eL0CQLTYM8ObZIRCLMGZAZ1MNYWI4b0nZVtRPg6k7igPdsyJJh2Bu0QAcyzUYHxko2sG
         TVnNsshNuxPhYn3hu2BAyfgpIGUjfX4TOWEUH1ht3ZSTB8usrTM5d47owx7DvkKOqFsG
         TOA37E7sv7yFWIeivV6etpJ9Aog+MO00wV5oWeDEPrs4I5YRk4qUuyieNEm02Adh3/HA
         Pfyg==
X-Gm-Message-State: AOJu0YyGMCstOdmk3UIl69BFBoN4bWul72LJMJw/fHEx27n35EVS9aUe
	gIpmsxRKRejvi4J3c1FfaYHrvmvSKsm0haJpxIA=
X-Google-Smtp-Source: AGHT+IE1QbIcMneFxU/csXugdEE2/7Yvtg2RUsfDugJuKvIriVmVUPlbc8LG9Ij9deP6a16q7yf1L6TBu6imhUhtwkU=
X-Received: by 2002:a81:6c17:0:b0:59b:eb5b:fbbb with SMTP id
 h23-20020a816c17000000b0059beb5bfbbbmr671357ywc.12.1695893817456; Thu, 28 Sep
 2023 02:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309280610.sLGSPkOG-lkp@intel.com>
In-Reply-To: <202309280610.sLGSPkOG-lkp@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 Sep 2023 11:36:46 +0200
Message-ID: <CANiq72=J=bO-Q0=gMDyiRgvbF_Vre39iqbEnaEeDho4Vo2ox6A@mail.gmail.com>
Subject: Re: drivers/md/dm-cache-metadata.c:1705:9: warning: 'strncpy'
 specified bound 16 equals destination size
To: kernel test robot <lkp@intel.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 12:24=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
>    In function 'write_hints',
>        inlined from 'dm_cache_write_hints' at drivers/md/dm-cache-metadat=
a.c:1729:6:
> >> drivers/md/dm-cache-metadata.c:1705:9: warning: 'strncpy' specified bo=
und 16 equals destination size [-Wstringop-truncation]
>     1705 |         strncpy(cmd->policy_name, policy_name, sizeof(cmd->pol=
icy_name));
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~

This looks fine given the check above it. In any case, since it
appears the code wants to terminate the string, this should use
`strscpy*()`, right?

Cheers,
Miguel
