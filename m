Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD0C13AA2D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713311836; cv=none; b=KTQl1nUNHZ/LM7OsPulUDeWXZ9zCFsRexdOuY79on2quo53kaCORh1jBR/kwqa99gkdyyXplUBbXFSJ6uDx4epCM0hka19VOYBHw94DKeI/1n8TGSRNV8KIiMon5Xsn9QAPdDmqspKh7+z/6KcFrQPzgCuPMuajFLEivrrhF12Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713311836; c=relaxed/simple;
	bh=WzRXIGLvs1tpmwfTdYiXqT+Xb63ATMlbvNwYZpgiob4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9XxbYtWEYyL+3F1hzkLopP4jH3zs6WBWO5Q7nzrMg2z1tw2Bo2XdNlJVXIhdnd+/4FxnK+eZsC10gs6smy0UcVQmnENn3Y1N8epbfYFa9yXQz7OyswNlSMRB7iPpbhKqIzhTt1a7EtvkgVEgPFgoypu9WOe8g6wU0FgludgBIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=idz2H9kQ; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="idz2H9kQ"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc73148611so5586190276.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 16:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713311834; x=1713916634; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IC8mWV6b6QzlZE6JFnyR9+zfyszn/P9cKrq9cHY85Yc=;
        b=idz2H9kQHNpTT/4bayHvvcv5Pp7pTxQPGQ+/bI7ybOr+4naIeYd/D+Ov0ceoDacb7X
         rwLrpvJuWYaaenakWQcsPj0Z6r/DSX2enPqndAs7EDsSaqVYO9ZXnJ4yor21tRjHnkgT
         wr4KCRFG1S1T6OzWkboNBaW3atoQX+Sn38eQkUDhDT7m7VgjVWfkTgE1ASHrX7jNZNzE
         IBoJfL90oJ9WFwNTKoTfXLxYCW+T7kRWuBjsWqk2TSl76Si8Ry88s+71msVgRs8TrZQU
         dGk7DfohdW0QfytVbj6kJ+oA6I8V782AiWjGcMObCkr03cg6hHZksBiUsbLITquvMVwi
         574A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713311834; x=1713916634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IC8mWV6b6QzlZE6JFnyR9+zfyszn/P9cKrq9cHY85Yc=;
        b=NCco/ttaYTP7vmH6VKL69ia3Cvua6fg08ah3X4em4tgvNxRsToUkU6azv+4jSl02Ub
         I2BjKoVvwy3K6Cvz+PSaOn7i6xo8UJMuC3HKGMpgfwrs5W2tpFulgRPUtUayNTidappp
         Eg6nWIXESyai8ubcVpTi/UMJJsSTQjLelP2lhFDt0YNpulBcGbFCvQoTzyfaEYLKmePf
         Z8iPMznK8n7+crIAv2RrQIY7y9m2DJJaTkBagOS79c/ZldX/hRWg/mGNTlCvzEVhQ9GF
         zdsBpu53cRQmBXTu90/kXTk/6/+0QOg5DxKPxkL+RoY+nW5SUnXFcYODrtchHEduHI48
         CrPw==
X-Forwarded-Encrypted: i=1; AJvYcCVeAwRLsuBVuiAgbVP7Cs+871JISABOIeq7ngJdI2vEO+ejBW7ffL8678/8xc/PlnZ1zNXOF+3+46CspYMbNQx+mG/iHLVmBHoJEXPe9g==
X-Gm-Message-State: AOJu0Yzo4pElep/ubbEG7ZL4T98I4cCVnL+GWHrQBoclLYoyQi6J1rVJ
	Ig3gZHiQ/KXlRZo0QaFKVCGF+YK0IEd7Kp0+Yq/p8tGtfxJDYqZqDDwuZBOjtwEqLze+FXuxV1Q
	8445FRl1vVbmLVtfcvRapEZAKavQDeBaGmUGb
X-Google-Smtp-Source: AGHT+IHMoPAxpjKDVaNQ+EXB0M8jdi1kEZvbp6UZM4KQDz6GqswGDJkg4CfM8mkE05Ermcc37rOU3hCGAd+Av5etk6Q=
X-Received: by 2002:a25:8b01:0:b0:de0:ed33:da8c with SMTP id
 i1-20020a258b01000000b00de0ed33da8cmr13045167ybl.59.1713311833463; Tue, 16
 Apr 2024 16:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6b5281d8-2998-4e66-b65e-45a0e68e5780@moroto.mountain>
In-Reply-To: <6b5281d8-2998-4e66-b65e-45a0e68e5780@moroto.mountain>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 16 Apr 2024 23:57:01 +0000
Message-ID: <CAJuCfpE-YoTONXC-SYPfcjiMbfN64s9XScO_v-SAo0brB=6i1A@mail.gmail.com>
Subject: Re: [linux-next:master 2720/3921] lib/alloc_tag.c:142
 alloc_tag_init() warn: passing zero to 'PTR_ERR'
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 6:51=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
> commit: 9e2dcefa791e9d14006b360fba3455510fd3325d [2720/3921] lib: add all=
ocation tagging support for memory allocation profiling
> config: microblaze-randconfig-r081-20240405 (https://download.01.org/0day=
-ci/archive/20240405/202404051340.7Wo7oiJ5-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 13.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202404051340.7Wo7oiJ5-lkp@intel.com/
>
> smatch warnings:
> lib/alloc_tag.c:142 alloc_tag_init() warn: passing zero to 'PTR_ERR'
>
> vim +/PTR_ERR +142 lib/alloc_tag.c
>
> 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  132  static int __init allo=
c_tag_init(void)
> 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  133  {
> 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  134       const struct code=
tag_type_desc desc =3D {
> 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  135               .section =
       =3D "alloc_tags",
> 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  136               .tag_size=
       =3D sizeof(struct alloc_tag),
> 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  137               .module_u=
nload  =3D alloc_tag_module_unload,
> 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  138       };
> 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  139
> 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  140       alloc_tag_cttype =
=3D codetag_register_type(&desc);
> 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  141       if (IS_ERR_OR_NUL=
L(alloc_tag_cttype))
>                                                             ^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^
> This should just be IS_ERR().  I have written a blog that has more
> details:
>
> https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and=
-null/

Sorry for the delay, I somehow missed this report. You are absolutely
right about the fix. codetag_register_type() never returns NULL, so
IS_ERR() should be used here. I'll post a fix shortly.
Thanks,
Suren.

>
> 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21 @142               return PT=
R_ERR(alloc_tag_cttype);
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
