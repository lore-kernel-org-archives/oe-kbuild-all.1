Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6C414373F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 17:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730567499; cv=none; b=KK6RB2V9CxuZ45/dFX/jcyNDcSy6BaRljf2ImINuFAS0Q87mM+S9liwFMRGMHW4kbtO0TkSLRVmVG0D/G6aC6w58tGxuWADYjTkyaGNyDdQ/hLNxnkkYkb/XS2QEMUMMYtSVubIA916BmRNUj9WsDj+/IHCEn91Fw03t/v+XJ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730567499; c=relaxed/simple;
	bh=792m5AnX64iIt4kzU+LaW0LxRihAWUcRor1g1cPfKwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJ9ysfiiGZM/L58orC8DSQBTPEPZG+SnMKGJm8lKAkAOt1U+W5vA0PXWiQ1prInpTUs38wRrmmKLWR0lO3q0K5XIQifdbgAFydQ3WM3Vt1Mb4U8kaX0pWmdqRINlTF10aIhDU2go/im84+PEPj8YDKGw6+npZdpo8hgs6wQ2xrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsyLaZ8L; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsyLaZ8L"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cec93719ccso996877a12.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 02 Nov 2024 10:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730567496; x=1731172296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/Efg1i4uD0MIAfGRhN5VXeuZafI1yHL+3rrlJmsAgw=;
        b=IsyLaZ8Llh4KOIg+w/GYTTg0mLjm5qIGCJKJC6woDNTZc2tsin8p4aGVOHMx55jK+B
         SKiJY4wp2r04O/QcJBdSYOUNv1q+hX2wa4zxISrwD7YxcaQuBoSwGOKzel0FjLu+M+Pt
         21YrLEpT+PWI9ABaVn+rqmby7hiVl66MVBcXyFyg+iJw++ZVzSE2PFi+vdDR3OBApJx3
         vfSBFA7tLJawHBoIEy9P0ZpCbHzJvieblJVZDBwP6BU4qb8pZ5Kqzdv4oHRaI4y0Cs3U
         d5Sdorc7HdY7Nz6l3mqH/30l+qU3KdIUK1uWgzeY5rPzaSC28upQGH+8FNUnrV4gX3M+
         yHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730567496; x=1731172296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/Efg1i4uD0MIAfGRhN5VXeuZafI1yHL+3rrlJmsAgw=;
        b=VI3jYSSQXg6NfqhsAkotybakOIFwK3qVujo8Kn13hygZziYMKXZaq0YodK6r0Oyo5O
         WewUHv30OVEsDuhGGYE1yjHTGlVP9HhJYzvF7onLY1mUVXqwfzx7NV819167rWG+YiHu
         Mz7S+rOckoXNZhN13waHLib08ngglnLwQuWbQHnm/8Rq6Pkij7AMGU6tvWhCBOb+x4N2
         AnXty9oZhIYQe3BIx774y+XUtATVE89EnjMcaKaxBTH8Re5i/5pMdUUXGI6F116F5onX
         uM0CWDWjDT2eX8WWFhUR2kkP+4/UcDYOb1hTbSxBDOL4KY4GW/ckhDyRvyFmYAvDpEgh
         TTMA==
X-Gm-Message-State: AOJu0YxB4xLWEvxOrGASmz2AeRod1Ev4u2thUg6RUkNe3FNL0BU04e4q
	tH3LFIGrwovdAhxz9YiFgbTkFOOlpH/vdK6BwLWYyn/Ct56zV4IOmysbBffONCXyRLA+7/zvJaT
	NmOujMj9SScoXHOo82E1uJ7Hzw78KOiDUaxQVxQ==
X-Google-Smtp-Source: AGHT+IFEAoKVFWlPHZEdTS7HG3nlMissEr/z8AuZiyKmQYEwNFdR+CJ+nyjPF88OWytnOEBeGHDpvKwCrx5GteCCnWk=
X-Received: by 2002:a05:6402:26c5:b0:5c9:3f2:6ea7 with SMTP id
 4fb4d7f45d1cf-5cd54af1140mr12069969a12.27.1730567495958; Sat, 02 Nov 2024
 10:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101184011.3369247-2-snovitoll@gmail.com> <202411021938.t9ib5DAw-lkp@intel.com>
 <CACzwLxiVuScO2gWbV0by+U3zRTDD0V=bgcJT0CrqivFPMgkCzQ@mail.gmail.com>
In-Reply-To: <CACzwLxiVuScO2gWbV0by+U3zRTDD0V=bgcJT0CrqivFPMgkCzQ@mail.gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sat, 2 Nov 2024 22:11:23 +0500
Message-ID: <CACzwLxhdts4ZEwe-z-5KJvnJo9pTrKC6fy9+V5gDFodE7ibcEw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kasan: use EXPORT_SYMBOL_IF_KUNIT to export symbols
To: kernel test robot <lkp@intel.com>, Andrey Konovalov <andreyknvl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 2, 2024 at 7:21=E2=80=AFPM Sabyrzhan Tasbolatov <snovitoll@gmai=
l.com> wrote:
>
> Sabyrzhan
>
> On Sat, Nov 2, 2024 at 4:18=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
> >
> > Hi Sabyrzhan,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on v6.12-rc5]
> > [also build test ERROR on linus/master]
> > [cannot apply to akpm-mm/mm-everything]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Sabyrzhan-Tasbol=
atov/kasan-use-EXPORT_SYMBOL_IF_KUNIT-to-export-symbols/20241102-024138
> > base:   v6.12-rc5
> > patch link:    https://lore.kernel.org/r/20241101184011.3369247-2-snovi=
toll%40gmail.com
> > patch subject: [PATCH 1/2] kasan: use EXPORT_SYMBOL_IF_KUNIT to export =
symbols
> > config: x86_64-randconfig-102-20241102 (https://download.01.org/0day-ci=
/archive/20241102/202411021938.t9ib5DAw-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20241102/202411021938.t9ib5DAw-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202411021938.t9ib5DAw-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):

+ Andrey, please advise.

> >
> > WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
> > WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_m=
odule.o
> > WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
>
> I will make a v2 to add MODULE_DESCRIPTION().

I don't quite understand this as there is no mm/kasan/kasan_test.c,
but kasan_test_c.c.
Also kasan_test_module.c is going to be removed in linux-next (patch
is already there).

Should I create another patch or v2 of [1] my prev. patch with
MODULE_DESCRIPTION()?
[1] https://lore.kernel.org/linux-mm/20241101184011.3369247-2-snovitoll@gma=
il.com/

>
> > >> ERROR: modpost: module kasan_test_module uses symbol kasan_save_enab=
le_multi_shot from namespace EXPORTED_FOR_KUNIT_TESTING, but does not impor=
t it.
> > >> ERROR: modpost: module kasan_test_module uses symbol kasan_restore_m=
ulti_shot from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it=
.
>
> kernel_test_module.c has been deleted in commit 906917f951ea("kasan:
> migrate copy_user_test to kunit"), in linux-next tree.
> So I'm not sure if I should include the header in this file.

Ditto here as well. Should I add  #include <kunit/visibility.h> to
kasan_test_module.c
which is deleted in linux-next tree?

>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
