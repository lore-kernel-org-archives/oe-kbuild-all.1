Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CF41991BF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730557331; cv=none; b=o7IMAP9MohLuku39UCqPum6fvCcHhEMCRpLTmuOjHmFsAn/gFI7P95mf72mPofC+AhxP2LY2vIKred4+Fumy8FKoV2dPf4j6v1lYHhZ1AHsJYc4eVc3yVx9ruRWzhFOhXa9yuHdqvGN/aTXbIZS6IoPvU1Ks/Fu9dhu6YDToVoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730557331; c=relaxed/simple;
	bh=O0ByfEPYfKUF/aOooEO7tom3LWddvgDyaY78cHYV+uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ET4ZgX2DeCuHze5IXS48Sz97++4KeVyzDH9PzTRElaVii14ClH9SM/G0D8nlhVxtD0aRJArZwH1otUsYh/l3Pm/cWtWkV2btb9isqQtcfEXFVL7VGgzoFLil79BtCig/gHhxTktIoEtk3bGnOCQQq3oBUALMsx2OD5CvA7dMy2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHz4biW5; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHz4biW5"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c9404c0d50so3262836a12.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 02 Nov 2024 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730557328; x=1731162128; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDagFHxr5LQ7A9Wr8K+r1XRdDK2QMYfBZ8U+Hq3KKcE=;
        b=RHz4biW52OWSQPfBonkV1Y93LrftcdyVc8ibkr0SmeBNKs7leuQohEDO9hPaYG4QfP
         klk3H/5/ci2capgYQF/4ss/n1j7c8TXwy9VNUx/tk6qOIwAfZ1MIgXY9E5w9SFeSj9QT
         KyRWWLboYQF4SzuJb0aoPjkC/A6XXwmOCZIaX9c0686iLn7GgK6+ZiNw2EHjNzN3xu8y
         fo/DlvUz40K8W+L99COSkfFioRtJCxjjNq5ozNSAmMtYzKTzEHJESjpBYdYmYYWfqaON
         YdCQGqkfehta8jRnuq7iXYZ95xLTyslM4SJ2ZfLOnl2D36CnA7ntwkb8tIG9Z3M2RK6B
         psJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730557328; x=1731162128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDagFHxr5LQ7A9Wr8K+r1XRdDK2QMYfBZ8U+Hq3KKcE=;
        b=Ae3FAVN6slF/g9ExNf4vvB1RCsdXaERD6tONiqlserildORkxc7WWVDZ2kX4Yiic5K
         dDuA0/PX0PhEZ1bVyt//A590SLAdgdnN3aJY38B/g90vwg3JjdDMpwfKDkfKbvv0ZCiQ
         ZEd5D9JglSH6A/wZRXjXtrHeTIzaYqQNwBV5dwjyKR0dLq8+LCl110FPXYlMo9TNZOC4
         3WQ64oz0x32J/U1M/J63VFnWyvQR7El7ux1HjKzztPF/E8bYBECGYFPb/Hl78r2yeTzL
         ltnv2ASjugBKgdocck3h7nXPG2hoaKzd5j4LPhCIAM2g/fxztWd6PXL6NGy09rR+G4Zk
         zggQ==
X-Gm-Message-State: AOJu0YzsspefJF/DuHbmhM/PvqcmV9SvDOamrDcckCH7rY8ARcUKW5JT
	3s9uJDvw2Sz8zQIY0aFya7TEgwvNJ8btImJb6kSnHnDm11lT8ShA/n921boO1k9SUWQIU6SJU4L
	K9XISH5+6wJGfRborXjqjWO7Ib5w=
X-Google-Smtp-Source: AGHT+IHcA1HNdFZ7QfXqRz0hTckXZX2gAI3taxMuzEOk8bVwutcXATIRbM7Rm+b+bPQ0fLNb4izEGNH9+XI1SjvuuJs=
X-Received: by 2002:a05:6402:42c1:b0:5cb:acfa:6225 with SMTP id
 4fb4d7f45d1cf-5cbbf947321mr18916818a12.25.1730557328089; Sat, 02 Nov 2024
 07:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101184011.3369247-2-snovitoll@gmail.com> <202411021938.t9ib5DAw-lkp@intel.com>
In-Reply-To: <202411021938.t9ib5DAw-lkp@intel.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sat, 2 Nov 2024 19:21:56 +0500
Message-ID: <CACzwLxiVuScO2gWbV0by+U3zRTDD0V=bgcJT0CrqivFPMgkCzQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kasan: use EXPORT_SYMBOL_IF_KUNIT to export symbols
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sabyrzhan

On Sat, Nov 2, 2024 at 4:18=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Sabyrzhan,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on v6.12-rc5]
> [also build test ERROR on linus/master]
> [cannot apply to akpm-mm/mm-everything]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sabyrzhan-Tasbolat=
ov/kasan-use-EXPORT_SYMBOL_IF_KUNIT-to-export-symbols/20241102-024138
> base:   v6.12-rc5
> patch link:    https://lore.kernel.org/r/20241101184011.3369247-2-snovito=
ll%40gmail.com
> patch subject: [PATCH 1/2] kasan: use EXPORT_SYMBOL_IF_KUNIT to export sy=
mbols
> config: x86_64-randconfig-102-20241102 (https://download.01.org/0day-ci/a=
rchive/20241102/202411021938.t9ib5DAw-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241102/202411021938.t9ib5DAw-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411021938.t9ib5DAw-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_mod=
ule.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o

I will make a v2 to add MODULE_DESCRIPTION().

> >> ERROR: modpost: module kasan_test_module uses symbol kasan_save_enable=
_multi_shot from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import =
it.
> >> ERROR: modpost: module kasan_test_module uses symbol kasan_restore_mul=
ti_shot from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

kernel_test_module.c has been deleted in commit 906917f951ea("kasan:
migrate copy_user_test to kunit"), in linux-next tree.
So I'm not sure if I should include the header in this file.

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
