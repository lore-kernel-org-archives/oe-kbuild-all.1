Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335C7F9DF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 00:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730768167; cv=none; b=ORHzp0Q7hwuDspMFdZm9p7D1WU/y4Y9D8n7HC7j2tGLv9ii2v9H6xOAReAxl1lE/J58PHobLvY08EqMcQuCj8MVd00A++Di4PaO62Aor9GbXB7SBc4sK3l6cdhyyC2fx53gVwTFlAm/keya9LtLVO8OUlGghnrHrWqLoceJ5ELw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730768167; c=relaxed/simple;
	bh=KCbImm4WajOkHITw0NYb9YqbyWAEUk43kWU1FCfHaz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SkBG4B/cRpbQtm8vE8NyvXfuilwzbGCd7oUc9BZPFqMuNuhn3+mAL1Af0bVO+IOqSXlrgkch3viZbOdW24lOLyd0B/iLSGKQ5NUVEbpTGWAK5hTWo0gX9ygtSqRwJC/ATl45Bn6I/zgbPDvSlOc/jhXrSuZxlcT/SX2DMQinais=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhRGo9w7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhRGo9w7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4319399a411so41839485e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 04 Nov 2024 16:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730768164; x=1731372964; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1k/O+30e/8OOeNqj2au+0AWr90teFrVucoF2eup7XM=;
        b=PhRGo9w7JCO1YUKrbiCQgRdWKGGTOVNr6lezff8JP1gICYelkH36ENnkCIi9J3dXcK
         e6Zr/2WZtiiqttCC/zR1SDHUuuanNbJeD1ySntt2Fg/rwQ/7Q06+Fu/Q/szh78dpJ171
         vAW1AW54td0Zbdqyl7NGeonlkdKo86vokLioTfpstAhC83z7Np6mV1W3AkfC9cr0wY2N
         n7nVIsMw+xMyMDW6c19ItD8o+mNn4+twv1ElpUzHJoshYpM9om9jWk/XbprRf5ea93Lu
         j+urL2rFyU8TJOjOG9iGQ+tEaRaL7+cYI/nlmN5zrLoYJssA9RCnBrscpP6tlpUCCfFK
         RKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730768164; x=1731372964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1k/O+30e/8OOeNqj2au+0AWr90teFrVucoF2eup7XM=;
        b=SKCNFfM5W+MqXTQwRlXEkyFsWbJuTaMeMho5274hWvmCujy7ULISQaLKkDxLoD6mGg
         BNSe0kPeKgcGAB82oOwXR5WD8H+FcJ8/cPXxAqbt7ut0lM56ngpJcaGZtpgz6Gi1dAlF
         x4UWqErzKPFi8Y/MmIIqUH9+sRNbQ/YvxNCVyAfcHMvs6wCCVQwf+9cpjqOIKP/S8XoZ
         zyuM0Owo24i18Vzn8NPYxZDvlw6RSAlr1CFSCavVavLFNvJAZdwWgDSgFe6+g7yN4Wed
         ou1ZawLmKJJBMvz/MJe48m79n0CXRYDdOqyf2EO700W30NhQ03j+7XwJguU0hdqozsnp
         upFw==
X-Forwarded-Encrypted: i=1; AJvYcCVkAxjMmVmU+uzi0XPZ0mm2eF9HG1vdGTKJcFX35bvwDDLKXhJo4nom4+pmZOeZ0qfi4pWQX91Y1q6uK7RU@lists.linux.dev
X-Gm-Message-State: AOJu0YyWEaz0y6B8Ax7kUjya5/oxD2RAfX2/mhkQcltZroY8DMoR8T0P
	LV3cpfsYYFJGDBfpbelngH/C1e7jjc72q5IGKuw4lEWqVP3SD+QrInQd4k9BNiXsDYQarvBm7Zv
	gSqAscu01PQdfmBsHU+bCxzf7+x8=
X-Google-Smtp-Source: AGHT+IHu+lIkAZ6lrv7ET3SZjByc675hKh5Zq5ePMybzQ49TFOSacsJ/bFQ96XAuEUHjILomwb28OP7WG38/29XeJHI=
X-Received: by 2002:a05:600c:1d99:b0:431:1868:417f with SMTP id
 5b1f17b1804b1-4319acadccdmr348186555e9.17.1730768164185; Mon, 04 Nov 2024
 16:56:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101184011.3369247-2-snovitoll@gmail.com> <202411021938.t9ib5DAw-lkp@intel.com>
 <CACzwLxiVuScO2gWbV0by+U3zRTDD0V=bgcJT0CrqivFPMgkCzQ@mail.gmail.com> <CACzwLxhdts4ZEwe-z-5KJvnJo9pTrKC6fy9+V5gDFodE7ibcEw@mail.gmail.com>
In-Reply-To: <CACzwLxhdts4ZEwe-z-5KJvnJo9pTrKC6fy9+V5gDFodE7ibcEw@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 5 Nov 2024 01:55:53 +0100
Message-ID: <CA+fCnZeJZS2VLidozkfoeo+gr4VOau-pYUuYhu7X6vfp0xoW7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] kasan: use EXPORT_SYMBOL_IF_KUNIT to export symbols
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 2, 2024 at 6:11=E2=80=AFPM Sabyrzhan Tasbolatov <snovitoll@gmai=
l.com> wrote:
>
> > >
> > > WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test=
.o
> > > WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test=
_module.o
> > > WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
> >
> > I will make a v2 to add MODULE_DESCRIPTION().
>
> I don't quite understand this as there is no mm/kasan/kasan_test.c,
> but kasan_test_c.c.
> Also kasan_test_module.c is going to be removed in linux-next (patch
> is already there).
>
> Should I create another patch or v2 of [1] my prev. patch with
> MODULE_DESCRIPTION()?
> [1] https://lore.kernel.org/linux-mm/20241101184011.3369247-2-snovitoll@g=
mail.com/

Adding MODULE_DESCRIPTION is unrelated to your patches, so it makes
sense to send a separate patch to fix this report.

> >
> > > >> ERROR: modpost: module kasan_test_module uses symbol kasan_save_en=
able_multi_shot from namespace EXPORTED_FOR_KUNIT_TESTING, but does not imp=
ort it.
> > > >> ERROR: modpost: module kasan_test_module uses symbol kasan_restore=
_multi_shot from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import =
it.
> >
> > kernel_test_module.c has been deleted in commit 906917f951ea("kasan:
> > migrate copy_user_test to kunit"), in linux-next tree.
> > So I'm not sure if I should include the header in this file.
>
> Ditto here as well. Should I add  #include <kunit/visibility.h> to
> kasan_test_module.c
> which is deleted in linux-next tree?

No, if the file is to be deleted by a queued patch, no need to fix
anything in it. Just need to make sure that the same issue doesn't
affect the queued patch.

Thanks!
