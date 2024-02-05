Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B861CA85
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707138933; cv=none; b=tLSHPRlmPJcIXFog8/+YMHm6M6RH+T+Z+5865lMJhV7nV4zjgi2KS0RQPZBsqLDsYLxf+640T9o8Z6zYFL5+cvvC79m5auGgB6qcsosPs3cD8uMQ/h20KaVbZuTyN7N9XisbIXhQxyAzfFZ62DaLnPcGrLdwC8iGZ0K49xyKmtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707138933; c=relaxed/simple;
	bh=rmNjQomfQpoCnRaBN1vTPIo7AOHkslo9q8arq5KNEfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NhoP7Y5OntbH7+egKX+eF2Zb+CHjjpkE6wgVWkuiUiEpAqG6hHDAOwgwz6ODQXKgdrbWKhSH9nWky239ZLW+3RomPGP6CzAe6dchM2KrUM7wI3LtL4CLPiL+Fj7kiy0KxgxTyA7wAM5GpkKZnx6DbRreZK36xV5w/OWz1BwpDrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Otw2Jbg3; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Otw2Jbg3"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-204f50f305cso2927223fac.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Feb 2024 05:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707138931; x=1707743731; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYnrTyMuuQpsXk2cGIbD2TvHCAjk4pn8UcToxn41yoM=;
        b=Otw2Jbg3o7BsGo05yNznDderzTLSL+PUBKEqnsmcw17GwixwIQ9ljBcyJFdoV0ftj8
         hlhu8TwQ1qgDREAYfe7zvUKMBNRJsY6LuoPMYd2OtEgYJUVDJN6FUDqflBE4/gWO1d/4
         JY37i0i15Wn6pGXn78G8aKDYqC04VQdfonxAihLmvOSKQXYZYluIFvDMEXSrSmljXrbz
         T97AhJTxfI5TRpYCAdxhtQrE1WWjCgpIkktcXS7xeTBFpT5xRa+w0yhZBAaWf8ZwLIXO
         hOZs4/VbbHnCNBED/Tewq88Po2FBWM6OP/2JV1H3p8H4svQ1xy3e+Y+9mu+ylyC3HjqE
         k8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707138931; x=1707743731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYnrTyMuuQpsXk2cGIbD2TvHCAjk4pn8UcToxn41yoM=;
        b=Z7mz4VpoQZslL9BZ6E3QC74eQhGE58ea2Eq8I7atese4zHcjRwha+H79GIAoiiWDAa
         ucaiU7y1ObHUe2aSgoBk1aibMnRv97vqPnFiC8k5a92hZSoNLYr0k0Tkao8PvtEXDQRs
         noTFrwW6XFOYAIllXLoSjI2mW+S5g8R0E+i2FWZdD54fKneMIu9L5++SsJcTXterdija
         HAFzBnOR13TgfOsFtPySbEblx0gROHZuhzpD51jlKgkMWCfwFhk9uj4555BeiKRSj/Ac
         lO3c9fFIQ0y92ZkxhbFxglNMUbuue0ulfO8wG4U0XZRW8Wq3CVYvyZndQgUsDRsxn8Ju
         r8/g==
X-Gm-Message-State: AOJu0Yz+FFp5RsgEyhGyFpqcs0uudkVJsyDdG7OXUBqU33kUkEgAl7I4
	tbWZn67Froj8EWcwm1YieJ2cPlcF8Y1pH7Ko7CuDue3DdAov9uTCKv4fAU5duOtTaEoDB0uwdBw
	hILGZIqtR34EWXq48Hw3u7re8MOs=
X-Google-Smtp-Source: AGHT+IG5SEnnxJDcGqDuVFPAlJd22LuemSGISAYgm4cKDI9N3pS8CMMcQAuUhR5txWZtx5AelWcfQz76myw+ESMwJyM=
X-Received: by 2002:a05:6870:d389:b0:204:a85:2580 with SMTP id
 k9-20020a056870d38900b002040a852580mr8695329oag.34.1707138930993; Mon, 05 Feb
 2024 05:15:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240131145454.86990-5-laoar.shao@gmail.com> <202402051121.y4w06atm-lkp@intel.com>
In-Reply-To: <202402051121.y4w06atm-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 5 Feb 2024 21:14:54 +0800
Message-ID: <CALOAHbDiOO+=0ZbVQBc9FJB3v0Ta7WGJV2aQ4y=J9KqBVMy=gQ@mail.gmail.com>
Subject: Re: [PATCH v5 bpf-next 4/4] selftests/bpf: Add selftests for cpumask iter
To: kernel test robot <lkp@intel.com>
Cc: ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com, 
	andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, kpsingh@kernel.org, sdf@google.com, 
	haoluo@google.com, jolsa@kernel.org, tj@kernel.org, void@manifault.com, 
	oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 11:09=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yafang,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/bpf-Ad=
d-bpf_iter_cpumask-kfuncs/20240131-232406
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20240131145454.86990-5-laoar.sha=
o%40gmail.com
> patch subject: [PATCH v5 bpf-next 4/4] selftests/bpf: Add selftests for c=
pumask iter
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240205/202402051121.y4w06atm-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402051121.y4w06atm-lkp=
@intel.com/

Thanks for your report.
It seems that the issue is caused by missing CONFIG_PSI=3Dy.
The kernel config should align with tools/testing/selftests/bpf/config.

>
> All errors (new ones prefixed by >>):
>
> >> progs/cpumask_iter_success.c:61:2: error: incomplete definition of typ=
e 'struct psi_group_cpu'
>       61 |         READ_PERCPU_DATA(meta, cgrp, p->cpus_ptr);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    progs/cpumask_iter_success.c:39:27: note: expanded from macro 'READ_PE=
RCPU_DATA'
>       39 |                 psi_nr_running +=3D groupc->tasks[NR_RUNNING];=
                                    \
>          |                                   ~~~~~~^
>    progs/cpumask_iter_success.c:13:21: note: forward declaration of 'stru=
ct psi_group_cpu'
>       13 | extern const struct psi_group_cpu system_group_pcpu __ksym __w=
eak;
>          |                     ^
> >> progs/cpumask_iter_success.c:61:2: error: use of undeclared identifier=
 'NR_RUNNING'; did you mean 'T_RUNNING'?
>       61 |         READ_PERCPU_DATA(meta, cgrp, p->cpus_ptr);
>          |         ^
>    progs/cpumask_iter_success.c:39:35: note: expanded from macro 'READ_PE=
RCPU_DATA'
>       39 |                 psi_nr_running +=3D groupc->tasks[NR_RUNNING];=
                                    \
>          |                                                 ^
>    /tools/include/vmlinux.h:28263:3: note: 'T_RUNNING' declared here
>     28263 |                 T_RUNNING =3D 0,
>           |                 ^
>    progs/cpumask_iter_success.c:80:2: error: incomplete definition of typ=
e 'struct psi_group_cpu'
>       80 |         READ_PERCPU_DATA(meta, cgrp, p->cpus_ptr);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    progs/cpumask_iter_success.c:39:27: note: expanded from macro 'READ_PE=
RCPU_DATA'
>       39 |                 psi_nr_running +=3D groupc->tasks[NR_RUNNING];=
                                    \
>          |                                   ~~~~~~^
>    progs/cpumask_iter_success.c:13:21: note: forward declaration of 'stru=
ct psi_group_cpu'
>       13 | extern const struct psi_group_cpu system_group_pcpu __ksym __w=
eak;
>          |                     ^
>    progs/cpumask_iter_success.c:80:2: error: use of undeclared identifier=
 'NR_RUNNING'; did you mean 'T_RUNNING'?
>       80 |         READ_PERCPU_DATA(meta, cgrp, p->cpus_ptr);
>          |         ^
>    progs/cpumask_iter_success.c:39:35: note: expanded from macro 'READ_PE=
RCPU_DATA'
>       39 |                 psi_nr_running +=3D groupc->tasks[NR_RUNNING];=
                                    \
>          |                                                 ^
>    /tools/include/vmlinux.h:28263:3: note: 'T_RUNNING' declared here
>     28263 |                 T_RUNNING =3D 0,
>           |                 ^
>    4 errors generated.
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Regards
Yafang
