Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1B13D638
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 22:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720045063; cv=none; b=Q2ZZwgy0CAg7jn9r6BUljP5GJOruFKccgbh6MqjqRws++oMnm+6ZAFfmiK1xgI26ulxzCzT1SXnGLT22ZKfWKODdf11hHpMfIFV4etbEQ526JhSvXrUCFsOft93Zyr7TscL7KtSkU7p4kgpK+YnM7tF8lDwpoYgafmDy7ncASxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720045063; c=relaxed/simple;
	bh=DaQtQUezy9Cd6dPj/vQJgAG0+5hzPIdQv4yBLL7Tw+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kz6H8N+rbzZibpFhbin7jgSIV+VCHLAEctMtx2Y13E5NnpXk50yP3D0hwQdyCFnfjBmKd1KzmIXBRL8WVOdv8nWZWtmk2j6aSGhyalYtECB4IqD4tC8WpBKkytw67IhmlU0BCEF+JDcwaM1Qr+zknLUDzy9ePu7m3mBvRuXbKLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SLh4FMa2; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SLh4FMa2"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e03a63ec15eso6132276.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 03 Jul 2024 15:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720045060; x=1720649860; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBFY0AezQv8pUC4Zn75QewV+jmxCpy323lgmyp3n110=;
        b=SLh4FMa25+IVnKw4Ap9+smSGWLnm55ZcPhGzl/pvBdrS89CIn4JwDqciAXGokJ0LZG
         C8VQPEOw2PVPUKvow0/WfBUHyWh+0DjOV1TZo+AfvxY7Ojp3+Z6lNSXhFjNxug40/yud
         jc2TnEMxliwyD1n3ugp/q0GCUIeRs+A47T5HY/kzFK9FXnJnWIEl4j1uNVet2Dtt0Fq/
         tUUC8cIda2DgpwU423OMubzXZopIbC8tNCy6B/YUW3jVDiMbgreCdLsCFjt/IiaJ1md9
         GXblmW7dUpGGLyove0qKp0E8o+GoUx/fjq4ZZNnX1gvIfzk7PawzZExPZTwVwM9rDwAV
         QAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720045060; x=1720649860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBFY0AezQv8pUC4Zn75QewV+jmxCpy323lgmyp3n110=;
        b=aM/FyBc91+yYi2P+HnnIVDfO+nk9BVfsM/jGcaS5jzwJHfFuv7KvvC1s0H1H2Nm36n
         iKankikAan1powFXRuzie16Icf5ipYg8xeZcQbA9+R71fJLUyz1ssADsINRF7Q5wKe3n
         AnCzwuqsNs8IJemYZnf/GlOhUVu5MvRu56h1QBfha4r/SN3E5q4wca34DtlaVQPw7LWH
         71aJztijHPgy4iuVkPwvIGdtLr3D0/69k0+fkvIh1WGtbTdWiJmgAYyIjArNJZNcr/7g
         Ki/RNOMfxpRCXlJ5xTXX6WHzjoj1GZLRkoQxCXtEnyiMOG43CYbiBZDCTNEoNTJqdCgd
         UUiA==
X-Gm-Message-State: AOJu0YwmawSBcKcPm38x4nLtajDOmY0nuTDfZ8+GfKTRd96PFc/SuBEV
	TD6LrMv0G1/HWg+W7m8O1HsMP3PDIrOOdmuLYfkLuC5/GQOKC0dvT9LU2areYl+I/dRSxiIQgy/
	Wsn1tznbVyx3WmqR0erqiOGz7tvUi1aFpaGt4
X-Google-Smtp-Source: AGHT+IF+YHjIjtyJP3TQiVa5IYtgSjacB1lIHVSnp746reC92x+NB1avh2v9/xG67hBD7Y6DlOQnEo7BO3UvXnbsAwM=
X-Received: by 2002:a05:690c:650f:b0:64a:3d6c:476d with SMTP id
 00721157ae682-64c71803990mr143734497b3.25.1720045060293; Wed, 03 Jul 2024
 15:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407032306.gi9nZsBi-lkp@intel.com>
In-Reply-To: <202407032306.gi9nZsBi-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Jul 2024 15:17:27 -0700
Message-ID: <CAJuCfpEtRLSiAmv_5+bo-oW_Lnx+=v=rasgVerdVJyoaFQ-R5w@mail.gmail.com>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 alloc_tag_restore+0x3c (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 8:42=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   e9d22f7a6655941fc8b2b942ed354ec780936b3e
> commit: b951aaff503502a7fe066eeed2744ba8a6413c89 mm: enable page allocati=
on tagging
> date:   10 weeks ago
> config: xtensa-randconfig-r051-20240703 (https://download.01.org/0day-ci/=
archive/20240703/202407032306.gi9nZsBi-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240703/202407032306.gi9nZsBi-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407032306.gi9nZsBi-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> >> WARNING: modpost: vmlinux: section mismatch in reference: alloc_tag_re=
store+0x3c (section: .text.unlikely) -> initcall_level_names (section: .ini=
t.data)

Fix posted at: https://lore.kernel.org/all/20240703221520.4108464-1-surenb@=
google.com/

> WARNING: modpost: vmlinux: section mismatch in reference: bitmap_copy_cle=
ar_tail+0x44 (section: .text.unlikely) -> __setup_str_initcall_blacklist (s=
ection: .init.rodata)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
