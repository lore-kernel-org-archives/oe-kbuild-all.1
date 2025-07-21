Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5842C29C352
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753101464; cv=none; b=r8tQ1Vd4jNP4o5iOYjISWDIyyPE/RoAmlv9Hc4pyL3dMWAHJiXK7f1WgqAR6AhsHfsAIX/hy1oX73CB1nV11surIM+jwKgzd+m1rbQeIeMF8XNK3oPIzUzOju2npOEg923C6YmmXROLFI+bjFNRc9P8pzTiO7T1n6XlowQo7gH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753101464; c=relaxed/simple;
	bh=JfZSEW0GdBwty6ngOsqe/zuGD7kfdShIAtNDFTeJpoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYqHfDMMyR++NMAuGNexVVTRkiimihgiEDhokOSA5bVE2jYiJC+MOUA0W41ExM4KqFXLECDIMF106g2I9JLqi3Ngb8/QxuhgKvGc6wdpNPDfmwzuSbKIfcBuhq5fwo958ZUp0/x1pKOXMu/W4e7gsf2+8Nva+OUR9Vo5xWfMgZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eluUDnri; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eluUDnri"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso42839991fa.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 05:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753101460; x=1753706260; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoGb4YAMQ6FyHi6JLW6yFVm+/wwMhQK+/vnKjJj89zo=;
        b=eluUDnri9F8GNsSN/2oux25sfTTAa+ZV8kcsA+ATl4hPyqq6rwSRM8HzUfr6XnSkKh
         9jSQRx9teMtlZvFhDXrC36ByTJJna/FK+7qnrJnf68ylgWdU21W/aqWKkOc6hqAJRQY4
         Z23a0Aiv1OxUyvU4b2PjKdJB+stoaebKJi68PraTM8hjytyoLSL3W9YqH6A7CS+J0q1H
         4Qg6nZdwGAuouQc+gRu/dtMOVmudb8aClCzvk0mnzsw5wcIKQVQLaQOrmkUyRQIpASnq
         N56A0y3qk/JqFdP8ZEGrMzFuUSjqIX/jtOdXBcoyNmKkKUpIjmz4Beycz85124FiO9kM
         Tkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753101460; x=1753706260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoGb4YAMQ6FyHi6JLW6yFVm+/wwMhQK+/vnKjJj89zo=;
        b=PBodA/wSTgpudEffkYfbc1vNCii/BCBPXEkmE+S+uf0z7oREsJxCFZ5zxBv7msbyPK
         pHzUt2oWECBhv9eY9v6ADHSgi355CBIBw09BRz8ZwuImCZW6HKuASWnFUH7yOd559WDS
         RPW9FR6J2Pe7Z2krmgAsmSt8vaYcLeN2Z8Uo+2lGK2+nPU81vRO53cDTRH541fQ5B3ve
         LB1S/kZH5nYpre+SdFt5QVsytTxRbeWRS87rVZKBmz3DyVgGGGzLrojxgkYik8oc0k1z
         H0zkA4mK1Uhnd1mfA709GvsbmXz3vDKJBkeJZyh4mqaZiavQF9DTnHS1UCBpVTpP2s06
         QC5w==
X-Gm-Message-State: AOJu0YxbQlem8cI9VgsgOfduRD74qexmFtS9+TZTORjmp2dt59lRFqMA
	4jajIWn/QMVEz8bY0KIWk+NHHuABhjRm8PY2ZNyEZYc7NeSbCs1+XRXhDn0ZEZsTvN/FctlKM8k
	o3gpoKmG7FQjDnaAcuqZHw7kOWCH8PSM=
X-Gm-Gg: ASbGncsS2PAZXLvZWtMP7zvvRmL/RueaBQUFkAaUfnoGkKjmyc0l/iXRaViQ84/IFFD
	RnlrtvEKkbi18aXZTXRYLPIDTwJEpO+Henb+AuaEtH+bergMoD6gslcBHg4keWqsg+KaOp34uOF
	NlCyLr8a0SiKFhLZhex8HN0MvaJ1rhm7YEXw2pIWUUscqgueQYTg6Vriu8ir8lrnw5vgL5WPcbO
	LnS7mw=
X-Google-Smtp-Source: AGHT+IFbofx31oj1C5GJZvVqOKdzyl+BTzX6KFaJvKAxdmFWxpZEfQUo9zbxwWWFibek489wMWAH1dFxJSzHpbXa4jU=
X-Received: by 2002:a2e:b88f:0:b0:30b:c980:c5b5 with SMTP id
 38308e7fff4ca-3309a466631mr40337371fa.5.1753101459980; Mon, 21 Jul 2025
 05:37:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202507211807.ZEFVLJ7e-lkp@intel.com>
In-Reply-To: <202507211807.ZEFVLJ7e-lkp@intel.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Mon, 21 Jul 2025 17:37:21 +0500
X-Gm-Features: Ac12FXwsLRoAqQ5xNYPN6yPQbHHqhjMMEW4TOYTa9_e5dtD636U50woPeE7Buoc
Message-ID: <CACzwLxicmky4CRdmABtN8m2cr2EpuMxLPqeF5Hk375cN2Kvu-Q@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 111/126] WARNING: modpost: vmlinux: section
 mismatch in reference: kasan_init+0x3b (section: .ltext) ->
 kasan_init_generic (section: .init.text)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 3:51=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ne=
w
> head:   1b0686bd18c1aa9d7f01943829faa5befe6ab3d1
> commit: 27a653bc6bbf595a1ed3817ecf37239cbb768ba7 [111/126] kasan/um: sele=
ct ARCH_DEFER_KASAN and call kasan_init_generic
> config: um-randconfig-r132-20250721 (https://download.01.org/0day-ci/arch=
ive/20250721/202507211807.ZEFVLJ7e-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd70=
8029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250721/202507211807.ZEFVLJ7e-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507211807.ZEFVLJ7e-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> >> WARNING: modpost: vmlinux: section mismatch in reference: kasan_init+0=
x3b (section: .ltext) -> kasan_init_generic (section: .init.text)

I've mentioned about this in [1] cover letter,
it's due to the code in arch/um/kernel/mem.c, where kasan_init()
is placed in own section ".kasan_init", which calls kasan_init_generic()
which is marked with "__init".

[1] https://lore.kernel.org/all/20250717142732.292822-1-snovitoll@gmail.com=
/

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
