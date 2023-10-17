Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69E62D780
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 17:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzMBstsN"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so9965432a12.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 10:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697564804; x=1698169604; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTJcOzkVSYuq3kdfWyM6/478vxCOCOP6lLPkJ2SdCTM=;
        b=QzMBstsNT/LDcpYo5mVhGoB+jb2c87AsQ+Ev85UEP064CEaDplFZ7REruhyk4Yzywo
         U0msIoFE6fT4wOmaOP8lPDCytZ/frP1YSmnUHkAbXVMOK5iFwv5MeGeNDPG66JjWRirl
         xwiOBXqAfCCMhJVvdpW9iPYROMBuqju76I91vSQqkFdEvqv+zIQphLL8U2kcvB89UR05
         5U8nm8tvGYB1oT3N5FCWXZn1h4h6PmIZ39pHnjAUqiuzJY05Z7yFZantm1CoZZqZY8Pc
         qZ9K3nQCRKa63pi7thzWlFfGvu0dgQ1486DB2g6XhlinD0kHcaTHhiM5G36+2qE05oeV
         lGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697564804; x=1698169604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTJcOzkVSYuq3kdfWyM6/478vxCOCOP6lLPkJ2SdCTM=;
        b=P38vStJ4eh6fkZ8IsaYMLpWM+kJO7WTexjfwg+5G+cxWYpCld7PMyv+2r4qW8dPnIu
         MleR3W4/6m3pkWumxt0BiTvKmF6+ttOXOxN6EMuSsHt4OmkDclNfqu9t891ZHCzVu2Ot
         TQpqLAy/cq7uMQ4pDS0MnUK+29oLO19uatti3Y5bxDjrnbKzxGFulcib5DzfPKehn5WW
         t2XT6ARza7n3DflkydtlKJrj+WFtJMOK537bzNz4ZUCo9jzAUkuElx6FIGFBgW76M3+E
         kNr9QHX6YpkwvkPC3w2rgaIiollabvd27eMG6wwE/er4vgs0AstLjPwSNsnjGt7KtdPu
         0ccA==
X-Gm-Message-State: AOJu0Yyh6lRyQsNr0hN/elF7Eo4/oR0/X2bH/My5Wkdp9+HxRR4P3VJ+
	8l4n9HxNBDGgr+5H7HBmCgPQQhBmbVkxIR414r0=
X-Google-Smtp-Source: AGHT+IF5SdawNji0JQ5EenvvwzkSH87GiKHVfD8DHFgGHgtaMPq9u4MQVqu7f7GBxWz3XY3Y2YEWNPJNHJ+Djc05Tfg=
X-Received: by 2002:a05:6402:2314:b0:53d:b839:2045 with SMTP id
 l20-20020a056402231400b0053db8392045mr2345712eda.25.1697564803833; Tue, 17
 Oct 2023 10:46:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016180220.3866105-10-andrii@kernel.org> <202310172156.zcehiHbq-lkp@intel.com>
In-Reply-To: <202310172156.zcehiHbq-lkp@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 17 Oct 2023 10:46:32 -0700
Message-ID: <CAEf4BzbJBDkCTO9VOdBiMzrhwOXAd3UsguJqNA5oZAR7Q8Eo8A@mail.gmail.com>
Subject: Re: [PATCH v8 bpf-next 09/18] bpf,lsm: refactor bpf_prog_alloc/bpf_prog_free
 LSM hooks
To: kernel test robot <lkp@intel.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, keescook@chromium.org, 
	brauner@kernel.org, lennart@poettering.net, kernel-team@meta.com, 
	sargun@sargun.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 6:56=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Andrii,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bp=
f-align-CAP_NET_ADMIN-checks-with-bpf_capable-approach/20231017-152928
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20231016180220.3866105-10-andrii=
%40kernel.org
> patch subject: [PATCH v8 bpf-next 09/18] bpf,lsm: refactor bpf_prog_alloc=
/bpf_prog_free LSM hooks
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/202310=
17/202310172156.zcehiHbq-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231017/202310172156.zcehiHbq-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310172156.zcehiHbq-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> security/security.c:5196: warning: Function parameter or member 'prog'=
 not described in 'security_bpf_prog_load'
>
>
> vim +5196 security/security.c
>
> 55e853201a9e03 Paul Moore      2023-02-16  5181
> 55e853201a9e03 Paul Moore      2023-02-16  5182  /**
> 82c20ee03a7a4e Andrii Nakryiko 2023-10-16  5183   * security_bpf_prog_loa=
d() - Check if loading of BPF program is allowed
> 82c20ee03a7a4e Andrii Nakryiko 2023-10-16  5184   * @prog BPF program obj=
ect

missing colon after @prog, cute, will fix

> 82c20ee03a7a4e Andrii Nakryiko 2023-10-16  5185   * @attr: BPF syscall at=
tributes used to create BPF program
> 82c20ee03a7a4e Andrii Nakryiko 2023-10-16  5186   * @token: BPF token use=
d to grant user access to BPF subsystem
> 55e853201a9e03 Paul Moore      2023-02-16  5187   *
> 82c20ee03a7a4e Andrii Nakryiko 2023-10-16  5188   * Do a check when the k=
ernel allocates BPF program object and is about to
> 82c20ee03a7a4e Andrii Nakryiko 2023-10-16  5189   * pass it to BPF verifi=
er for additional correctness checks. This is also the
> 82c20ee03a7a4e Andrii Nakryiko 2023-10-16  5190   * point where LSM blob =
is allocated for LSMs that need them.
> 55e853201a9e03 Paul Moore      2023-02-16  5191   *
> 55e853201a9e03 Paul Moore      2023-02-16  5192   * Return: Returns 0 on =
success, error on failure.
> 55e853201a9e03 Paul Moore      2023-02-16  5193   */
> 82c20ee03a7a4e Andrii Nakryiko 2023-10-16  5194  int security_bpf_prog_lo=
ad(struct bpf_prog *prog, union bpf_attr *attr,
> 82c20ee03a7a4e Andrii Nakryiko 2023-10-16  5195                          =
  struct bpf_token *token)
> afdb09c720b62b Chenbo Feng     2017-10-18 @5196  {
> 82c20ee03a7a4e Andrii Nakryiko 2023-10-16  5197         return call_int_h=
ook(bpf_prog_load, 0, prog, attr, token);
> afdb09c720b62b Chenbo Feng     2017-10-18  5198  }
> 55e853201a9e03 Paul Moore      2023-02-16  5199
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
