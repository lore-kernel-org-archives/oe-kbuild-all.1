Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD91B56754
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 23:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712012598; cv=none; b=ZhvPvOUpQKlBioJspeMvnXbYBJdTwJSMmTyQF/mq6Mdnkl6aDEiTpNGJF6+Zhfxf1OsgaiDdGw3AeLzN5+1ItbIX9unUDEaTH/FonnpgVZoF9rYrRj0VwsRy0StRdLCk2WbuM9UC0+rQOi6WDzKK6oQFfmifJu0MeT9XdbvtXBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712012598; c=relaxed/simple;
	bh=bnE7mqpJKSqTFSxXPdGovsiK78dKQTqNnNX/l8w1EL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tKG9vHWhE4/W7+zJpB6n/sq3fxSKT8EUGe223rYc0JGUxWVAcydnJL2YuStvK2SCM+xp9a2B/6ej0t1UE5zI6Bva/K3me1O6PWVJhoqpzgJ2OTJ/cxmKoN271cJWG8+NARMQ/Qf6AjT6K3v2zO9D2WipjvXmF1OhkUrw9um14F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KrmZMYiM; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KrmZMYiM"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso4256042276.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Apr 2024 16:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1712012595; x=1712617395; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAzP4v8q6ZUrcIMKWV9ihMyx/mox5GX7NG3LvjArtJU=;
        b=KrmZMYiM7MDqbIEQGGn6KyVx2HJXVhmwhI2oQFl2wSIhdFTwXr+BBL7hZDwaxhhJmz
         089B3Fj0hKf3Inr0u4Pk6R5sMziyENwfFdA9o2PYBxbZVBI3GHxbN6BXFeIBhHh6lRdE
         jrw1iOG3frGNw/kOzaeHzJ11B1l4MKtn7XYEsHW4J1/XNQQdJob7+g4KQDkFFUFCwl+N
         S9z4WDh7BTTHiogPyPdTwGNcewp2oZWBUtArnaCRiEl3zfKOkOYDEwaMLRf0BQDb3E8T
         ixcY6yNk6aHHTA75Vu8VQFVMPsZws/nDSzb+vbXbSbn5p74F4+lbcEUhgLCRWCRloLWz
         /UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712012595; x=1712617395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAzP4v8q6ZUrcIMKWV9ihMyx/mox5GX7NG3LvjArtJU=;
        b=bAGEwj0U1as1kFfZae/VtR3XDw7DZ4J2QebDJPx3zav7UENQFG2Zqxsh8g7cAGk3zj
         Gi4C4iPSppapaXFMzdmaXdT8fSSJ/oh0mTV+9H7DjShJWI8verxhYpa7/DBMNnIN6ZGG
         4a+fmQ5HOL/VHxjsQZkVxj5EmmkXR/QRT6XpL72dYIJBduCAm4oxQ3nwwDxWXp0MomQ+
         XjgfCTMyG6CkkEMPkyy4VTHZEOlbAVEPg2qqPuRW99GiIYJCZPJdwCThU6JAQf154nqs
         6Psh7PjypkuDULziN1apjLVZxaZcPrEFyAPEBZDvk8dESU4GwlrUs4/HJRkUdlxLZH3l
         x9sA==
X-Forwarded-Encrypted: i=1; AJvYcCVfMEJGr87JVGVahD5j5JpcWHCFcTNkVu39K0bX6xp6Nb7O8Zjbab9+lXQbUfI47m/1HCNX10+XUQRj9JN5ziLd0AcsKPqr1xEd5aodKA==
X-Gm-Message-State: AOJu0Yx9hEFZVBBoD6STLsp3dHdQamrbDSWzjdS7nvJ88V9CXgbAgOUE
	lNB1MQobxyJifR1FSe21P0XO+Qew981WsYpKblT68FNJ4cpS8Lw60G8cLHkA4I+7yusTRyFDVlr
	PKbhO1T9wHfwEAf+/EO/TBU2RKcYs5DHMZxPxhw==
X-Google-Smtp-Source: AGHT+IHk+/3FWaZOGrd9QSOjD34cFN6VXLgdwa1vU1aw/TdKYme6QpFmevX9QOarkH38PBqDqpFMMw2iqggVDVwkyJo=
X-Received: by 2002:a25:603:0:b0:dc8:5e26:f501 with SMTP id
 3-20020a250603000000b00dc85e26f501mr7806700ybg.61.1712012595628; Mon, 01 Apr
 2024 16:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403311952.oxw8fSed-lkp@intel.com> <20240401112012.58634114b0e76e062fad7bc0@linux-foundation.org>
 <CAKPbEqqpXc7K11u087wYFux1ij5PnEhwNYk+EpMyUWFMUSKpCQ@mail.gmail.com>
In-Reply-To: <CAKPbEqqpXc7K11u087wYFux1ij5PnEhwNYk+EpMyUWFMUSKpCQ@mail.gmail.com>
From: "Ho-Ren (Jack) Chuang" <horenchuang@bytedance.com>
Date: Mon, 1 Apr 2024 16:03:04 -0700
Message-ID: <CAKPbEqrQ8bUKt1AmuWenxDGGn1Ht9xRfua_9BO5uquRC6=9Niw@mail.gmail.com>
Subject: Re: [External] Re: [akpm-mm:mm-unstable 262/270] vmscan.c:(.text+0x2c90):
 multiple definition of `mt_find_alloc_memory_type'; kernel/sched/fair.o:fair.c:(.text+0x1db4):
 first defined here
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, "Huang, Ying" <ying.huang@intel.com>, SeongJae Park <sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew and SeongJae,

These compilation errors can be solved by adding `static inline` to
the two complaining functions, the same solution as SeongJae mentioned
earlier.

I've tested on my end as listed below and I will send out a V10 soon
after I check a few more things:
```
$ ./tools/testing/kunit/kunit.py run --build_dir ../kunit.out/
[22:53:24] Configuring KUnit Kernel ...
[22:53:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=3Dum O=3D../kunit.out/ olddefconfig
Building with:
$ make ARCH=3Dum O=3D../kunit.out/ --jobs=3D8
[22:53:30] Starting KUnit Kernel (1/1)...
[...snip...]
[22:53:37] [FAILED] alloc_size_kmalloc_const_test
[...snip...]
[22:53:37] [FAILED] alloc_size_vmalloc_const_test
[...snip...]
[22:53:37] [FAILED] alloc_size_kvmalloc_const_test
[...snip...]
[22:53:37] [FAILED] alloc_size_devm_kmalloc_const_test
[...snip...]
[22:53:37] Testing complete. Ran 306 tests: passed: 260, failed: 4, skipped=
: 42
[22:53:37] Failures: fortify.alloc_size_kmalloc_const_test,
fortify.alloc_size_vmalloc_const_test,
fortify.alloc_size_kvmalloc_const_test,
fortify.alloc_size_devm_kmalloc_const_test
[22:53:37] Elapsed time: 13.331s total, 0.003s configuring, 5.837s
building, 7.482s running
```

Btw, I noticed there are 4 failed. Please feel free to let me know if
any caused by my code.

Thanks,

On Mon, Apr 1, 2024 at 11:23=E2=80=AFAM Ho-Ren (Jack) Chuang
<horenchuang@bytedance.com> wrote:
>
> Hi Andrew,
>
> Thank you. I'm trying to figure out the problem. Will send a V10 to fix t=
his.
>
> On Mon, Apr 1, 2024 at 11:20=E2=80=AFAM Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
> >
> > OK, thanks.  I'll drop
> >
> >         Patch series "Improved Memory Tier Creation for CPUless NUMA No=
des", v9.
> >
> > and shall await a v10.
> >
>
>
> --
> Best regards,
> Ho-Ren (Jack) Chuang
> =E8=8E=8A=E8=B3=80=E4=BB=BB



--=20
Best regards,
Ho-Ren (Jack) Chuang
=E8=8E=8A=E8=B3=80=E4=BB=BB
