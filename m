Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41AB44366
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 23:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717285280; cv=none; b=gok5LwKkme/RbAyVYxiC2Z1zylzlkYZMH5UcAYTno08JI25pymrpXuecZudS9lgrPZzL9qRx+InD+rtKpLwX7rdVM1dQpddwmVc/gVQ6Ib5Y6yKC6E0WyXsRplZi7XN4B1e+ZuWUgb6s3Fn3Btgt4/hRqINinsJ+jYEFxnrs4X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717285280; c=relaxed/simple;
	bh=FmvqevEnqgVG3f18m0kOVP2Uxy2zchTMI7AloT2hyhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNA1AzBhahryY9ZefvQrc1r8d5cImQsuGZg6j5GzhDkVPg/+Sq3Afrp71qcZOzBlUf2JWZ9SNFywABXovHLZ5sTSm1ldxMONACsuhs38cHhZpYXfkCj6FXpE8AjyNzvR2afNmCtvwTCvgexI5yABrGVXv4NrENb8lDRb47q1lFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PSuHrJOM; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PSuHrJOM"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-df481bf6680so3098120276.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 01 Jun 2024 16:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717285278; x=1717890078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4FOUlc5EDq/I7DD/WiBWLN5W19MKLu5xl8To+MXnS0=;
        b=PSuHrJOMMIgIabh0INCIwmF9ApZIY13HDndJfm2D19hDChW40mZlgPSaOUsK7S32sU
         mrKKi8It7U9o/hL340+8ZIf04fPFeQcx46tmzd57HL6Asg6xfxW9EudvrwD9CQry09O9
         679OYkWlSi7IOXhcdbqMsKtqjG8rWnRb6spj92I1pmeBTcPB6rZbugyGFNfw17q0+cEM
         jK4+6EQ8NsDhcgA7AQEzw1Gs53m5eWGijYjalGePLACwLI3MqzRKYogM3vpJcUZliIBB
         MGqfNd1e7U4YulT2W5ADBCdSV1WfkhnBd0dhaFaa+iLNkx2HQk2KsVI2tefhSyXykH0a
         M6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717285278; x=1717890078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4FOUlc5EDq/I7DD/WiBWLN5W19MKLu5xl8To+MXnS0=;
        b=Y23XenXBvzTutX5oB4KzJJzN53BYwFf/tj89jf8bfOUqv7b0m3dveOk4ORbgmk7mnf
         NdygKOR5w5WMcYDuGTDdyliRMsByJWfZZWUFIlJFWoH2kRA89Ol0FUnVnKv0iX6jjcF5
         1+S0doVY41m++KS81vCrsB8blwhXEaf2DgwC+E8taCrgAAuuqUuvYJMP09kTWUsIY86B
         WVVbHnMDZg8pnOJYP9qqks4E6+AsY1k8r0kGUhabX71mxrdVcUfukSzmID3Omrj3mJ3A
         xg5zRUH1n6hCRe6QH3t0VIr9UU79lcDcA/4a4odjuDqcH/NMhnKf//LW6BKauGGPTnuA
         xF+g==
X-Forwarded-Encrypted: i=1; AJvYcCX4g9v2vfGTwVlU/IqWEM5K2qk22xDWPRb0XSTTehnwF/Z0jUgn5t67ToXegWAJCyXMEdN5iSV+3b4v/zx/cpibJlzkwBBPR8EREYbh2w==
X-Gm-Message-State: AOJu0Ywt02Q73ONSkOBAM9Yqrci7Q2g+oePvpmauXHeTjXAFcUtJmDE4
	FpQdOF5NJQDzDxnjk1MjsOExHrotOCtJ7Q3iyEJpvHnsC7CVlfhGz9cyIUYY1CRoGwQEuoPPMbm
	3YvkipV1npPzc5mvmyEINcBzS5dDf9HS3As4r
X-Google-Smtp-Source: AGHT+IGoJGrV89s6wgpWQzLAiysiCfFoPAHgS9BdWTDh4qzRR4oPAXSK/QX/xarY7MY0WiL5wbkjQVluVFnWtAem6Lw=
X-Received: by 2002:a25:b1a4:0:b0:dfa:47cf:d293 with SMTP id
 3f1490d57ef6-dfa73dbc2e9mr5287912276.40.1717285277431; Sat, 01 Jun 2024
 16:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405280616.wcOGWJEj-lkp@intel.com>
In-Reply-To: <202405280616.wcOGWJEj-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 1 Jun 2024 16:41:05 -0700
Message-ID: <CAJuCfpF=55_2j8oECernpWq9GXV09RjHexLS7+k4YjaOeO1=Vg@mail.gmail.com>
Subject: Re: ld.lld: error: undefined symbol: proc_do_static_key
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 3:23=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   2bfcfd584ff5ccc8bb7acde19b42570414bf880b
> commit: 8d469d0bee74d3f2d02f0b232933a3f084d9cbf7 lib: introduce early boo=
t parameter to avoid page_ext memory overhead
> date:   5 weeks ago
> config: arm64-randconfig-002-20240528 (https://download.01.org/0day-ci/ar=
chive/20240528/202405280616.wcOGWJEj-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfd=
cc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240528/202405280616.wcOGWJEj-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405280616.wcOGWJEj-lkp=
@intel.com/

Fix is posted at
https://lore.kernel.org/all/20240601233831.617124-1-surenb@google.com/

>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: proc_do_static_key
>    >>> referenced by alloc_tag.c
>    >>>               lib/alloc_tag.o:(memory_allocation_profiling_sysctls=
) in archive vmlinux.a
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
