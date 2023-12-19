Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8F23B182
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 20:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x1iwdH/9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33670b90013so41225f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 12:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703019523; x=1703624323; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSoJF2brXrDvmeNy4sAlYal40Hfmd/JEFr/Ur8rVqdk=;
        b=x1iwdH/9Han1BSCy/I73fea1xFbnme0CUTl3HIv7yt9+Ltf+TORRVOSJILebHWd7rU
         9FZPY8xCUwG9yBqjC3EfnclDIcslZ1GoOcoC7n6RJON5tBCdgStYQvzhaLq1tYBzlbDc
         Zp3yjuP1Yuvw44mYvJZckLYxhuY9L/799YAMFusHn0RL0OTd24M3/BsQN8vWcI66ajeX
         11qOjeOlfUEOLTnymTdPWpW7GaJ7tc57uh04oMAaqy6oKrK6A790Zv3JYyLBNpbulitf
         VLrgv0b6Gj4W5tjHM3CNhszmpznXp4bW+JS+cbZqdUD1vsxIb6XQh/p2rIGwUOzzoLJ0
         okHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703019523; x=1703624323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSoJF2brXrDvmeNy4sAlYal40Hfmd/JEFr/Ur8rVqdk=;
        b=QLNYIXi25mGxXi+P3Wf2mSQlwb91RxgabRPO+7p3qrThro4HnztKeG3biyYQeGH5bs
         Onow/Ra7i5U5L6orzSCm1r0GjMPx59A+7dG3b1jndeN6bIkG66O0VCcHznFm/OqCTfWQ
         pxwigIPh9LJt/+WVn/CebROyUDYpMQ3imv4iKI6diJWb/+JXG7SzAPpNuKjY4NA7lgC8
         RlR7scca/52dmfHNkM2gbuVzsaqm6u9jTgOv2B5RDIOihfabuTzmncZ1MscSQ0jwC13N
         /Yh+b82YMAIUJHk8CidqawKppnXUC+m2VA36TNV23VBaIHlzHanMiW5GMrUcQG5+xajY
         4hrw==
X-Gm-Message-State: AOJu0YxHEHGrF14reiS0+tyX3xC0+veYdxaQobnpyia+vXcQHCEO/qqi
	z2vJMn7e4bZ799A1DhFFgHwLpIqtzEBd/CbzoFY0PGRRAXJ/3xe806yRDbvJmA==
X-Google-Smtp-Source: AGHT+IFFYyxiRUi+myfmspax1WSelMy/wc1DSYPtwg52WQ5obSoGXg0nD/r6TxR11U5FmF0ma/kuavLI2DbrOktMo3I=
X-Received: by 2002:adf:e881:0:b0:336:751c:9b99 with SMTP id
 d1-20020adfe881000000b00336751c9b99mr973413wrm.21.1703019522724; Tue, 19 Dec
 2023 12:58:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312192107.wMIKiZWw-lkp@intel.com> <20231219205348.wvvxyicaatmljxm2@moria.home.lan>
In-Reply-To: <20231219205348.wvvxyicaatmljxm2@moria.home.lan>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 19 Dec 2023 12:58:28 -0800
Message-ID: <CAKwvOdmrvwdbFrtzsOjoLJJZ1pDZOBWBiEb=Mx5bCHuKU2wPzQ@mail.gmail.com>
Subject: Re: [bcachefs:header_cleanup 21/51] /bin/bash: line 1: 19420
 Segmentation fault LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j
 --lang_exclude=rust --skip_encoding_btf_inconsistent_proto
 --btf_gen_optimized --btf_base vmlinux drivers/misc/eeprom/at24.ko
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Brian Cain <bcain@quicinc.com>, linux-hexagon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 12:54=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Tue, Dec 19, 2023 at 09:40:09PM +0800, kernel test robot wrote:
> > tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
> > head:   89188fceb7a49e3c4b0578d86f6f6e647f202821
> > commit: 1db61740aeb7d6b1c7bfb2a98708a65a6679d068 [21/51] locking/seqloc=
k: Split out seqlock_types.h
> > config: hexagon-randconfig-r005-20220913 (https://download.01.org/0day-=
ci/archive/20231219/202312192107.wMIKiZWw-lkp@intel.com/config)
> > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.gi=
t ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20231219/202312192107.wMIKiZWw-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202312192107.wMIKiZWw-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    die__process_unit: DW_TAG_member (0xd) @ <0xc689> not handled!
> >    die__process_unit: tag not supported 0xd (member)!
> >    die__process_function: DW_TAG_compile_unit (0x11) @ <0xc697> not han=
dled!
> >    die__process_function: tag not supported 0x11 (compile_unit)!
> >    die__process_function: DW_TAG_member (0xd) @ <0xc6db> not handled!
> >    die__process_function: DW_TAG_compile_unit (0x11) @ <0xc6e5> not han=
dled!
> >    die__process_class: DW_TAG_compile_unit (0x11) @ <0xc778> not handle=
d!
> >    namespace__recode_dwarf_types: couldn't find 0xc689 type for 0xc66b =
(member)!
> >    namespace__recode_dwarf_types: couldn't find 0xc638 type for 0xc674 =
(member)!
> >    namespace__recode_dwarf_types: couldn't find 0xc638 type for 0xc67e =
(member)!
> > >> /bin/bash: line 1: 19420 Segmentation fault      LLVM_OBJCOPY=3D"llv=
m-objcopy" pahole -J --btf_gen_floats -j --lang_exclude=3Drust --skip_encod=
ing_btf_inconsistent_proto --btf_gen_optimized --btf_base vmlinux drivers/m=
isc/eeprom/at24.ko
>
> Not sure how likely a header cleanup is to cause a segfault in
> llvm-objcopy and I don't have the toolchain to repro this - could
> hexagon people take a look?
>

Is it a segfault in llvm-objcopy, or pahole?
--=20
Thanks,
~Nick Desaulniers
