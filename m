Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2225B1426C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 20:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USmjEayG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93962C433C9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 20:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700945860;
	bh=s+qnZklBGeT9VCm9MJs9Q+c7IfNN7xWSaLeqJM6SF/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=USmjEayGlqLpla/6QxWFNKr2fAV/HSZYHKgi1Zs3jhRmLKN1S0b2WFvVfNCdirV9W
	 n54gTeuNogyd0p+kfDTlLaq07vGnU0Teworo5IzieZJmOCVDrATPbZa6cTa+B+k/7f
	 GYNjCIeKLJqEyR8i/msQSs6jfGIzYRK3irDETsS8/+js4l93smfN9noGsJaXFyhKfb
	 9LLbw4B+y36GpqUk6CFwAKAoNmBZgOXjYm35IukCRQahhZfNhyqkR+iZI5Lq2PwOnk
	 TentAVfH8jfdSmNL14buzR3gxf0wibXStxoHtnT9+3q2gaCoGBHJ1Iqi6DdVFKsbjy
	 fIUP3I+GMV15g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507ad511315so4197954e87.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 12:57:40 -0800 (PST)
X-Gm-Message-State: AOJu0YwiWUHKBfRG+A58JWeSDfAwhuwkljnov1Caczxx3q1imDF7H+kP
	aVmhA0NjyeWvoealZJb70QBcjTfUtQCU3gIblFE=
X-Google-Smtp-Source: AGHT+IF1rpkJd7U2JeXNRXi+biVamnrX0pSXbQXr+A5sQV0LaphEYc4jMdt9xh5zh8oTjgCNgNbT+qug3v6y5cENlko=
X-Received: by 2002:ac2:5390:0:b0:509:4405:d5a8 with SMTP id
 g16-20020ac25390000000b005094405d5a8mr4076274lfh.68.1700945858781; Sat, 25
 Nov 2023 12:57:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231123233936.3079687-6-song@kernel.org> <202311242013.8tAOSgat-lkp@intel.com>
In-Reply-To: <202311242013.8tAOSgat-lkp@intel.com>
From: Song Liu <song@kernel.org>
Date: Sat, 25 Nov 2023 12:57:26 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6NhihzM5h50yvU9pKtQ6PkWegFqG167rzWvhPa-cGdxA@mail.gmail.com>
Message-ID: <CAPhsuW6NhihzM5h50yvU9pKtQ6PkWegFqG167rzWvhPa-cGdxA@mail.gmail.com>
Subject: Re: [PATCH v13 bpf-next 5/6] selftests/bpf: Add tests for filesystem kfuncs
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 7:42=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Song,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/bpf-Add-k=
func-bpf_get_file_xattr/20231124-074239
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20231123233936.3079687-6-song%40=
kernel.org
> patch subject: [PATCH v13 bpf-next 5/6] selftests/bpf: Add tests for file=
system kfuncs
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231124/202311242013.8tAOSgat-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311242013.8tAOSgat-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> progs/test_fsverity.c:16:22: error: invalid application of 'sizeof' to=
 an incomplete type 'struct fsverity_digest'
>       16 | char expected_digest[sizeof(struct fsverity_digest) + SHA256_D=
IGEST_SIZE];
>          |                      ^     ~~~~~~~~~~~~~~~~~~~~~~~~
>    progs/test_fsverity.c:16:36: note: forward declaration of 'struct fsve=
rity_digest'
>       16 | char expected_digest[sizeof(struct fsverity_digest) + SHA256_D=
IGEST_SIZE];
>          |                                    ^
>    progs/test_fsverity.c:17:13: error: invalid application of 'sizeof' to=
 an incomplete type 'struct fsverity_digest'
>       17 | char digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZ=
E];
>          |             ^     ~~~~~~~~~~~~~~~~~~~~~~~~
>    progs/test_fsverity.c:16:36: note: forward declaration of 'struct fsve=
rity_digest'
>       16 | char expected_digest[sizeof(struct fsverity_digest) + SHA256_D=
IGEST_SIZE];
>          |                                    ^
>    2 errors generated.

In the patch, I added CONFIG_FS_VERITY to the config
(tools/testing/selftests/bpf/config). I guess the test robot didn't update
the config accordingly?

Thanks,
Song
