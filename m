Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F271381
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 04:35:35 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-496a775af2fso1260686e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 21:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695184534; x=1695789334; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azuj7xcq6eQ3UpWdDpWKUV4XGXp2CNoolDstHELC1/c=;
        b=Yl9iC2VJQhc9v93p0m6dsEBDvZGPNPHxw/emJrvWbq4U2cW/QZ0PbP/t1AF+svgyap
         AeXpGj6vID13NoAlDjYb/mDVAei0RhuoEgwBccL74RQBskXr18xpTBJqCnWfeAAskFqF
         9czVkoCJTFnOFjWjSAYhn8PBs8DMAokKPeBZlSxVesEhJ9NdsvDCsXAPU2zC0TWGeXpF
         uartGln3RFjtw+yyizfcP+WYfK0p8BcRovjfybc778n9RPK5RkvQSqkP8QNg9QrwEl13
         gSSU3N4qLaIlBX518498oFiHNnkOJ3K4m0LAVnR+LuIGisMlqEliCpZ9nXheLlBREzwY
         67kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695184534; x=1695789334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azuj7xcq6eQ3UpWdDpWKUV4XGXp2CNoolDstHELC1/c=;
        b=vkn+oT1IcLDK0/7EdTivDQx+9aJxShEL1Gz1QkUkodKb6lff+jhk5pwDhrDd9iuF5/
         YvqQxdBudthJgWbZrLUK4rA4Jd1a/DO6KZjHzv2vlhjVgtwNG5KbvCw0IknqODuj5ozH
         zIPu1QyC+9k0402BNy6+8FOEUyz9ROfc4QOpFM/eMIGJLez61w3G6tQJ/49dZZc6VNR6
         orvR2lDoemFzD2kfD4XY5gMVICpMYXLxSNM5ovUiMreJcXGcqVuRB3hrHfWOlsRa0LtV
         +1YT4nBmvzb0pn/bbjs5UK2JJ76AFZ6VaYA+KmZjZ5nVZsIwhCtmsZrIM39MtkjnGybD
         I4NQ==
X-Gm-Message-State: AOJu0YxiyFi14Fq44nrrgZDewKqa+okIdz1DZ9iOB4lT3z7yfLXGlgUD
	hVxRD7DY8W75gkXCQ0QeMTbVM1NOPHwvU+J/aMU=
X-Google-Smtp-Source: AGHT+IExHNh2WhAbEaA4SQ/mudAUGhUPe8vGstLIvuW9HiXr+96pF1eFwDgZY7qv8ThkhnTMX6WlmFj3D1AE863ju7k=
X-Received: by 2002:a1f:e6c3:0:b0:47e:8a9:478c with SMTP id
 d186-20020a1fe6c3000000b0047e08a9478cmr1678764vkh.16.1695184534162; Tue, 19
 Sep 2023 21:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309191848.cMwd2D4d-lkp@intel.com>
In-Reply-To: <202309191848.cMwd2D4d-lkp@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 20 Sep 2023 07:35:23 +0300
Message-ID: <CAOQ4uxjTv+5cB4z8TZQ02c5F3rags1HARoEQG9834A0+_+_twA@mail.gmail.com>
Subject: Re: arch/alpha/include/asm/rwonce.h:25:35: warning: array subscript 0
 is outside array bounds of 'struct inode[11885788707287082]'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Alexander Larsson <alexl@redhat.com>, Miklos Szeredi <mszeredi@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 1:43=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   2cf0f715623872823a72e451243bbf555d10d032
> commit: 0af950f57fefabab628f1963af881e6b9bfe7f38 ovl: move ovl_entry into=
 ovl_inode

Are you sure that this is the regressing commit?
I don't see anything that has changed wrt the ovl_dentry_upper()
call chain.

> date:   3 months ago
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230=
919/202309191848.cMwd2D4d-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230919/202309191848.cMwd2D4d-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309191848.cMwd2D4d-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/compiler.h:246,
>                     from include/linux/build_bug.h:5,
>                     from include/linux/container_of.h:5,
>                     from include/linux/list.h:5,
>                     from include/linux/wait.h:7,
>                     from include/linux/wait_bit.h:8,
>                     from include/linux/fs.h:6,
>                     from fs/overlayfs/util.c:7:
>    In function 'ovl_upperdentry_dereference',
>        inlined from 'ovl_dentry_upper' at fs/overlayfs/util.c:266:9,
>        inlined from 'ovl_path_type' at fs/overlayfs/util.c:184:6:
> >> arch/alpha/include/asm/rwonce.h:25:35: warning: array subscript 0 is o=
utside array bounds of 'struct inode[11885788707287082]' [-Warray-bounds=3D=
]
>       25 |         __unqual_scalar_typeof(x) __x =3D                     =
            \
>          |                                   ^~~
>    include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ=
_ONCE'
>       50 |         __READ_ONCE(x);                                       =
          \
>          |         ^~~~~~~~~~~
>    fs/overlayfs/ovl_entry.h:163:16: note: in expansion of macro 'READ_ONC=
E'
>      163 |         return READ_ONCE(oi->__upperdentry);
>          |                ^~~~~~~~~
>

Why would the type of oi->__upperdentry be considered to be
'struct inode[11885788707287082]'?
I don't understand this report.

Miklos, any clue?

Thanks,
Amir.

>
> vim +25 arch/alpha/include/asm/rwonce.h
>
> d6462858851549 Will Deacon 2019-10-30  11
> d6462858851549 Will Deacon 2019-10-30  12  /*
> d6462858851549 Will Deacon 2019-10-30  13   * Alpha is apparently daft en=
ough to reorder address-dependent loads
> d6462858851549 Will Deacon 2019-10-30  14   * on some CPU implementations=
. Knock some common sense into it with
> d6462858851549 Will Deacon 2019-10-30  15   * a memory barrier in READ_ON=
CE().
> d6462858851549 Will Deacon 2019-10-30  16   *
> d6462858851549 Will Deacon 2019-10-30  17   * For the curious, more infor=
mation about this unusual reordering is
> d6462858851549 Will Deacon 2019-10-30  18   * available in chapter 15 of =
the "perfbook":
> d6462858851549 Will Deacon 2019-10-30  19   *
> d6462858851549 Will Deacon 2019-10-30  20   *  https://kernel.org/pub/lin=
ux/kernel/people/paulmck/perfbook/perfbook.html
> d6462858851549 Will Deacon 2019-10-30  21   *
> d6462858851549 Will Deacon 2019-10-30  22   */
> d6462858851549 Will Deacon 2019-10-30  23  #define __READ_ONCE(x)        =
                                               \
> d6462858851549 Will Deacon 2019-10-30  24  ({                            =
                                       \
> d6462858851549 Will Deacon 2019-10-30 @25       __unqual_scalar_typeof(x)=
 __x =3D                                 \
> d6462858851549 Will Deacon 2019-10-30  26               (*(volatile typeo=
f(__x) *)(&(x)));                      \
> d6462858851549 Will Deacon 2019-10-30  27       mb();                    =
                                       \
> d6462858851549 Will Deacon 2019-10-30  28       (typeof(x))__x;          =
                                       \
> d6462858851549 Will Deacon 2019-10-30  29  })
> d6462858851549 Will Deacon 2019-10-30  30
>
> :::::: The code at line 25 was first introduced by commit
> :::::: d6462858851549c62d73eaa14b31132b0f32d6b6 alpha: Override READ_ONCE=
() with barriered implementation
>
> :::::: TO: Will Deacon <will@kernel.org>
> :::::: CC: Will Deacon <will@kernel.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
