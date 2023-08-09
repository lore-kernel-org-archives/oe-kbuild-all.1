Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B21AA83
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 16:01:12 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fe4cdb727cso49187165e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 09 Aug 2023 09:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691596870; x=1692201670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLtoCkJZFd7DlMmlmj2DSsmBdq1DArEFkmtRS9xaJ3s=;
        b=WskBAI/bHePTX2RjFcr20HcqlznV11JPxkl9ox2zSfMBXBhbLlefzJsrPVi6qfrEAh
         7vGeWEUeqSM10JAN/j88XBkZ1Uvf1YfIVjh/nVuOjMhOhJxbkt0UhhiCTDELEYuYL4/E
         nvAqom0R+FPymQP2q1LeO1XJxCleiF2kPh4t/gYz9BglMUoHG8V3xF4x98XTkndOaTEq
         mbWvm/7TcWmoTAE2L4Ww51vi1vm41TBxjHjk6+3ozvvD1pMAR7l5RT+R6pwlfnr7jLYa
         DPgsLVj7iL5B+MsrTbD2r4Sn+SwGNoDtBxrA+CxbahuNSGDrhyHiglhEKUOFroYWBKtY
         x+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691596870; x=1692201670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLtoCkJZFd7DlMmlmj2DSsmBdq1DArEFkmtRS9xaJ3s=;
        b=CKdEtmZtWTgSitV5Idn3PXxyNEn4fsAW5QHwG9FMm8qIPe0wUvRYEPC9W/sSh7BlUM
         PudyJRRzUFBt4diCpHQeulxWfq3YP+RKKPKymcuYfkLaC1Tr7/Kze6X0aYhCLEsull56
         lyRPFhe3+JPaF2IvBA7bAqpGgleTLuXIi4oFt0H4N8DCBl4G91yeeCdUaVzpYppmxslO
         CNHS2faRxSpIrD372loxvjsAYmQzrmoLnnPDrTh7js1M63R5+pZtwGSjBvkV4OrTcrMJ
         I5aG8IgEM4aFYazKDAOo+pQ6ojwzdWuoa2K1YdQBCkmEQ5HtX6iVKTDT6Mn/DyI1ah5G
         Xf5Q==
X-Gm-Message-State: AOJu0Yzvye9HbogZJ78oleBuGltw/E8NmWrE5BU9WzoeiLol0FoCIIGV
	cxPpVTJ7mTJWYIJs3wGEf0UUaaYoip3q487zD98/NQ==
X-Google-Smtp-Source: AGHT+IH4iIom5mh7Wwh1u0OlKwjKYcjxeh6YgAy0mkwT/O25V+qbI0rcBuuhzYU5ocUTIJm8XgJZdXXIllmS3veX1M0=
X-Received: by 2002:a1c:740e:0:b0:3fe:ad4:27b4 with SMTP id
 p14-20020a1c740e000000b003fe0ad427b4mr2583212wmc.27.1691596869851; Wed, 09
 Aug 2023 09:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308091820.0dPY7D6f-lkp@intel.com> <ZNN1WdZ5J/e5OPAt@elver.google.com>
 <CAKwvOd=hgqas-kMxvOgviff43XBmwgERrfGi-ZO45DOcEuG_yw@mail.gmail.com>
In-Reply-To: <CAKwvOd=hgqas-kMxvOgviff43XBmwgERrfGi-ZO45DOcEuG_yw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 9 Aug 2023 18:00:32 +0200
Message-ID: <CANpmjNNjzeKyB7V7r73qW9zzqYeMEEK27pfFV9aBm6yfLjJeng@mail.gmail.com>
Subject: Re: [linux-next:master 8173/8441] include/linux/list.h:53:13:
 warning: '__preserve_most__' calling convention is not supported for this target
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Aug 2023 at 17:53, Nick Desaulniers <ndesaulniers@google.com> wro=
te:
>
> On Wed, Aug 9, 2023 at 4:15=E2=80=AFAM Marco Elver <elver@google.com> wro=
te:
> >
> > On Wed, Aug 09, 2023 at 06:27PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git master
> > > head:   21ef7b1e17d039053edaeaf41142423810572741
> > > commit: fee8feb67f0b2954eb7a2a259122e43a15cf3a52 [8173/8441] list_deb=
ug: introduce CONFIG_DEBUG_LIST_MINIMAL
> > > config: hexagon-randconfig-r041-20230808 (https://download.01.org/0da=
y-ci/archive/20230809/202308091820.0dPY7D6f-lkp@intel.com/config)
> > > compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.=
git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> > > reproduce: (https://download.01.org/0day-ci/archive/20230809/20230809=
1820.0dPY7D6f-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202308091820.0dPY7D6f=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >    In file included from arch/hexagon/kernel/asm-offsets.c:12:
> > >    In file included from include/linux/compat.h:14:
> > >    In file included from include/linux/sem.h:5:
> > >    In file included from include/uapi/linux/sem.h:5:
> > >    In file included from include/linux/ipc.h:5:
> > >    In file included from include/linux/spinlock.h:56:
> > >    In file included from include/linux/preempt.h:12:
> > > >> include/linux/list.h:53:13: warning: '__preserve_most__' calling c=
onvention is not supported for this target [-Wignored-attributes]
> > >    extern bool __list_valid_slowpath __list_add_valid_or_report(struc=
t list_head *new,
> > >                ^
> > >    include/linux/list.h:44:39: note: expanded from macro '__list_vali=
d_slowpath'
> > >    # define __list_valid_slowpath __cold __preserve_most
> > >                                          ^
> > >    include/linux/compiler_types.h:132:49: note: expanded from macro '=
__preserve_most'
> > >    # define __preserve_most notrace __attribute__((__preserve_most__)=
)
> >
> > To silence this warning, we can just guard it based on known-supported =
architectures:
>
> As a band-aid, sure.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Long term, perhaps we can fix in clang what __has_attribute evaluates
> to for this attribute depending on the target.  Filed:
> https://github.com/ClangBuiltLinux/linux/issues/1908
> ^ Consider adding a comment linking to that in the sources.

I will fold it into patch 1/3 of the original series. May I apply your
Reviewed-by there?
I think there needs to be a v4, also because of some other change requests,=
 too.

Andrew, please shout if you'd rather have them as fix patches.

Thanks!
