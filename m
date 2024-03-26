Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A8F4CB2E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711439276; cv=none; b=bm1gb1aQ/PFACXiH6ZEKVbE7czBnfub3UBltVPN7ooKHspt6KtAoIBeOl5FYktOHl9so87CCP2itMpx5vVfa0C1j30AHFs3+hT6GsbTCvNR+Rse0Yg0QdZhv4IKFJWXRAiJbx0wYwiLh+Eda35O+8FNiwP3iWtkzCKe4Vqi607Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711439276; c=relaxed/simple;
	bh=0q3mBCnf+EdkSwnN6o2oQBP2kwt52cqmwZ3LduFyQH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shpzRUZXDQbwOwHVmDlLJ1ZmSUjXeA+nVVb7aF6QHUuan0QNH1z4dLxBYtYbxjpdYyyaHO3G8ooVww0eNvF5KwakzYvBpCOm/nItDLKkupkI/ASKP6J+KB3/vFAtraT5EhzeJ/yxyY49sMjmKFpLeqhjPyuCgsq+DlmCMTrHib4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PRjZ0W1r; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PRjZ0W1r"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-609ff069a40so58142437b3.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 00:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711439274; x=1712044074; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YBJ2xQ8MK7yXEQRyH4d1UZ7bB4MJxNeLe7OD+5nY3g=;
        b=PRjZ0W1ruEo5amNyyfqvXc/eEe3r9Q3clQdqzUPOOAZBX2jZTjU8yQ2VzdgTWPYJ2T
         XTjDxEDf35nNae+ohEbSC9syUtUN894alO3PBL2bOOc4XAfB2D5+BGGb4RwKYt4k6h3X
         bzAKozWC4Xh5Y/XQZCyuDjf9CiraXGf4dV1RKmnQKYpKfMWslVKVHKnLvySa+nmUeoPJ
         +rhNJxTqx+y3q2zBmNMw/D9sFQisuZHd4gPGVj/sKUhwckPqnkfCanCkr0g3h2opykJD
         zgq5sPcfVYleqSOtiBrYMZHAv9Y2CiGVHTncYxR1rK+9qCRy/KZuBgpVtIgZ4geOJ5UY
         ej9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711439274; x=1712044074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YBJ2xQ8MK7yXEQRyH4d1UZ7bB4MJxNeLe7OD+5nY3g=;
        b=QSw2DF/bEtIxHiOjS8KAdQcvNwbnD3pw++XfmqMzVfpHvgeeVjq2ISTHESnseXThup
         njM1Q83sOWnHfnwJGjU48pW5CGi//C/rB+rrBCC3eW4a2g97Nj4zt9byCcFuCIs1kFCb
         7iRwY236RppJ2ytPiPc4XQ9al9+/8b/Wm+ULNeJSu4EV6dngNqXMz1dO19TlykiNdyMy
         7PuVnjVv0AYB/t5LiVIOpd755dA//rrwJEcxc+UWdoXYuEBfeUrUoSC+XPi2LLAc+W1S
         jxrJJ3hE28Ds6QlU+XUI/1XzZoCl3+R/vM/ZxszOdf2V6Ai5zGBB4y7hUBgDLk/2LXnj
         zI4A==
X-Forwarded-Encrypted: i=1; AJvYcCXlNrBKgXRvi4U1pbO9rA8Ct5RH/MoYTSq/J4z6cSDBHeicHLds+EXiPw9+nhQuu3C+EhtIfcHzN2SdUMixxmUOlwjcBLy5Q7lP860P3Q==
X-Gm-Message-State: AOJu0YxxolGlhHPtlJUYfCX/2zxeBIWcFXWH/IbjpVbCXf3Ak+NqorJ0
	ErQlaZkIRNypwkcv3XC1rxgwYhXX5SRmr0llLY5rLqMTnaKJrNfTZiY5bs74Gx+DIO4Ps45IkRd
	FR9z7FIGhANn+wa/f8UfrUYhahh2HgaagksCq
X-Google-Smtp-Source: AGHT+IHzIZVywGJTbgb7bPyiQTrVbJ0l3fVLX650PCysA0jxq80trs14N9M6WelzZ1P/3CgDIKTV23h3xlg9CpOaMa0=
X-Received: by 2002:a25:ba90:0:b0:dc7:46b7:b7f6 with SMTP id
 s16-20020a25ba90000000b00dc746b7b7f6mr6339246ybg.28.1711439273902; Tue, 26
 Mar 2024 00:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403230731.fved39RH-lkp@intel.com>
In-Reply-To: <202403230731.fved39RH-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 26 Mar 2024 00:47:43 -0700
Message-ID: <CAJuCfpFckAn7HycWma7KTn-MzzMxwcT5s-_SoOz7wFKLs9HLCA@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 55/141] ERROR: modpost: "memcpy"
 [fs/nfs/nfs.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Pasha Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 4:48=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   af520f81c51001f7ccdf0579fc73df282b26292d
> commit: fa5bfe65d50ae7006d711f490bba3cb4d437bcad [55/141] fix missing vma=
lloc.h includes
> config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240323=
/202403230731.fved39RH-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240323/202403230731.fved39RH-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403230731.fved39RH-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs_common/grace.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv2.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv3.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/loop.o
> ERROR: modpost: "memcpy" [fs/reiserfs/reiserfs.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/nfs/nfs.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/nfs/nfsv3.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/nfsd/nfsd.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/lockd/lockd.ko] undefined!
> >> ERROR: modpost: "memcpy" [crypto/seqiv.ko] undefined!
> >> ERROR: modpost: "memcpy" [crypto/crypto_null.ko] undefined!
> >> ERROR: modpost: "memcpy" [crypto/sha512_generic.ko] undefined!
> >> ERROR: modpost: "memcpy" [crypto/sha3_generic.ko] undefined!
> >> ERROR: modpost: "memcpy" [crypto/cbc.ko] undefined!
> WARNING: modpost: suppressed 16 unresolved symbol warnings because there =
were too many)

This and the error reported at
https://lore.kernel.org/all/202403252127.967BczRr-lkp@intel.com/ are
the same. I have a fix but I'm still trying to figure out why this
issue is happening (see
https://lore.kernel.org/all/CAJuCfpH6N_p-w2DxJ530txgTha6dTxQb3ANtkU-6h9pCps=
tTOA@mail.gmail.com/).

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
