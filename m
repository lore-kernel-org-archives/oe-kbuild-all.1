Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CAA3FE4A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726473154; cv=none; b=GoAVbj4ZcigE1Nie4F7V9JpFNj6iAd+f5I0akZGnkQ/H9BkMJIy1x72D9tkPUaKyLMjclVZIku/3CoKKfRNv6ZU9IkGA4q9dMjYBG1AlU3pmGlQSTOgXFHdMB9YFNqzgfvj25MDnKG4pzJoS8UcIjC6XaRknEspKwX1bEMdumHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726473154; c=relaxed/simple;
	bh=EjYQJGAMGDlItHOfp4HtjeGBtf4hKCQ/fVxar+n3Zt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEg19lXyVw0NUUS7QSEdQUVMhihLkpVtL7vlVH1e8KLe9RgzwrdSqzzb1i8Q4XF5baTAGAVEj+JYqSIPtveM4rARe3/mdZ2bidAXmMG/Pv5WLZsKhAttBf/zTTwZuuJedtPFZb8YUGtHLrJWdfQzbGo2vHDaW9oYoaRbMXdAsOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=X7TM9VoA; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="X7TM9VoA"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6dbb24ee2ebso35201037b3.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1726473150; x=1727077950; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmWPob5EI48YO42hx1Wkp4dHihtizsde4mRrqudf8UA=;
        b=X7TM9VoAow3tynzq3kYz2onngi4WDVyYLCxy7noBX2demunFvJ2K1IXKCcaLXxdbdH
         vcbPoRVDKaMQObkBd41QcOsfP9JY373N8ckhjF8C7pf7zFnbYFfITs6NdLV7dvvZ1XvI
         8CnJCeHPxq2sD8sV4dm4J3fzVoc9DPovhS3aG48jbtL5PodiP7EiCWw3IUjSyIFu9ski
         FQ9scqHxExNhsChfGKdRk3d3PuPhLHvnTjAkcwE425VueujEwZDUsUUmo+cSukb2q7P7
         lwSsXoz+rj3Wm9GjWFmcYKSGC9izS1Wbl0QLqaVEFiDzQuHXH4Z2SE0Vu+3PljPZGzrB
         gYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726473150; x=1727077950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmWPob5EI48YO42hx1Wkp4dHihtizsde4mRrqudf8UA=;
        b=UObsXKbQVjFfoqeWrduBufheWUkUC0LXb8w2/ISKgRc7suvyeUU6CkuAeYGo9ymg2r
         bOELv8pyX7onbiRgG4LnvbQDJQZ/Es0EupYOjuHHPN9MScnRNnQ1TZT2EJyXD0DON7Ax
         2s/u6AgJXObirJdIRxGLyphA+1SbPE4U4UZ9Qc93Ew8k5aczTeSCkalNJvXDXzpwOqZ+
         MqtHXBrNugLI5ID6KOD5bVXDAWv44bkaBskHpwOF3l5OpLqWngX5fMYn3PMj51shYS/G
         AwTQoLMiKeNVDhxK5KFRTjBdcWXbeqnBTHLVdmmqQHEuZkg0EigrARACz+550gXLjBMR
         I7tA==
X-Gm-Message-State: AOJu0YyP6CSbxmGisfwFLrpNcawDY/PxT37poUwbh5Vl+JGdOK7XuNTd
	5AUwij5W18V524WDYNqPnMbbrTtmW3OCXO6JfOoZT4Z0s4JGdHLVvbtEx01r9SZwm3yEVXxJiQA
	8TkNbTtCpze4UCS+MMBpopGCgnnC7m+HqHCH24hgeZLrmidjFAQ==
X-Google-Smtp-Source: AGHT+IFEviVWsfeqsx7W1wqCtOADLAIeUCrC1lZpT6l9Dxa7oCuIQp3pSOkejDewrOz+4to59Md4s5GrJ2k28DnUaHg=
X-Received: by 2002:a05:690c:93:b0:64b:5cc7:bcbc with SMTP id
 00721157ae682-6dbb6b8f713mr131456257b3.32.1726473150305; Mon, 16 Sep 2024
 00:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202409160044.ogHHPKFy-lkp@intel.com>
In-Reply-To: <202409160044.ogHHPKFy-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Sep 2024 03:52:19 -0400
Message-ID: <CAHC9VhS=ofgVy3Aq8C4r+M_wm9ihjjLab-W+DOUUM4_qNV7GZQ@mail.gmail.com>
Subject: Re: [linux-next:master 11886/11962] main.c:(.init.text+0xef4):
 relocation truncated to fit: R_ARC_S25W_PCREL against `no symbol'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 12:43=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   5acd9952f95fb4b7da6d09a3be39195a80845eb6
> commit: 9b3e805e7dc536b172a9c2512b0e66212100747f [11886/11962] Merge bran=
ch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
> config: arc-randconfig-r121-20240828 (https://download.01.org/0day-ci/arc=
hive/20240916/202409160044.ogHHPKFy-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240916/202409160044.ogHHPKFy-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409160044.ogHHPKFy-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    init/main.o: in function `start_kernel':
> >> main.c:(.init.text+0xef4): relocation truncated to fit: R_ARC_S25W_PCR=
EL against `no symbol'
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for GET_FREE_REGION
>    Depends on [n]: SPARSEMEM [=3Dn]
>    Selected by [y]:
>    - RESOURCE_KUNIT_TEST [=3Dy] && RUNTIME_TESTING_MENU [=3Dy] && KUNIT [=
=3Dy]

I'm not sure why this was sent to me, is this an attribution bug in
kernel test robot?

--=20
paul-moore.com
