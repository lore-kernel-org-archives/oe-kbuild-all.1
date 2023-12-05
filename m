Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC7567E8D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTZ0VpSW"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50be03cc8a3so5592717e87.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 Dec 2023 10:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701802656; x=1702407456; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FsjS2AfVun50o7CR/HMHck5tbwkgS3QiimVWvhSYh0=;
        b=cTZ0VpSWn0WSy0foQ3UQLSm+YbZB8bQKhlKaZ1NNxg6WVi3lv4ls0Jkgm7ZyPFWqwH
         erKPm/Pv51HvcxaOumKI2djGGPTZYqnK6filCRDd/DxZHQpAL9IfZ8tRLCq/jZGi+3rk
         8/h/u17+WepMk48EmMAch53xlcLdwkZr4kMiWixWScTDiOvi8uZv7agpl8xKeL1jTi/t
         thfeWIIIoM3BLPXA6XXt2pIcklX+AS31oLVscw0ehZlCHTb3/iNEZDshIkHA67tPf4Af
         KJudJ25SNdYY1msi3c5+ipX/piYfvUwJ9P0W2jrmpIVrrtL3R8yB3h+StwwbjezQp4+/
         Ys1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701802656; x=1702407456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FsjS2AfVun50o7CR/HMHck5tbwkgS3QiimVWvhSYh0=;
        b=GJtqITkd1Yp3bUa/BJTDZvZD47uwIVb0ryERtZpIQ00LfascRt4rszZUR6qo0u7CYn
         0I9iPF/xdUBIvtA9cNQK5/6ih35y+OdMg7VPA64jN08k9RR+H/L6yQiED6C19YjNfsV1
         9k8qsWYzDQl9jxw9Ezi1sr+khVeBVDTsyYZNTpipxTLF6y2D3RUWIN0Py7dNx5iMN3oo
         uAMsSYuddUhqUThWBu8AeC7rmCjcwE8wfnxYG74ZEnQu85QSu+zgx13bC20m5ASMAdsp
         9s5FJB8zrsn98Fp0AdBUB2MdoYayINjy089bFEQIEX+3Eu58hRvzWKRRSFw1KwKSm2PM
         FmgQ==
X-Gm-Message-State: AOJu0YwtpJPC5ypBTtvI4JF5eZeNmXMNJwRJHz8pMYmDT0Fy/VdfOGPS
	fQru9I+lG5SaxH939clqhD3zZEx66V9q5DoMykg=
X-Google-Smtp-Source: AGHT+IGtouz8IGF0IEtn0I2iWFxs9gbGn/Kw92doHz6aZAYVURgyaQQoL4RtND+xZXjGAe+wShZEPuS9GuJh6VwRaD8=
X-Received: by 2002:ac2:55bb:0:b0:50b:ffb9:7a4e with SMTP id
 y27-20020ac255bb000000b0050bffb97a4emr1340536lfg.46.1701802656165; Tue, 05
 Dec 2023 10:57:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231204233931.49758-9-andrii@kernel.org> <202312051530.hEAmx5zj-lkp@intel.com>
In-Reply-To: <202312051530.hEAmx5zj-lkp@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 5 Dec 2023 10:57:23 -0800
Message-ID: <CAEf4BzZfkWisHcJaTodoCK58GPZOfgMRXDUEqc1rY9aATM2hWw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 08/13] bpf: move subprog call logic back to verifier.c
To: kernel test robot <lkp@intel.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, martin.lau@kernel.org, oe-kbuild-all@lists.linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 12:02=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Andrii,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bp=
f-log-PTR_TO_MEM-memory-size-in-verifier-log/20231205-074451
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20231204233931.49758-9-andrii%40=
kernel.org
> patch subject: [PATCH bpf-next 08/13] bpf: move subprog call logic back t=
o verifier.c
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231=
205/202312051530.hEAmx5zj-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231205/202312051530.hEAmx5zj-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312051530.hEAmx5zj-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/bpf/verifier.c:5083:5: warning: no previous prototype for 'chec=
k_ptr_off_reg' [-Wmissing-prototypes]
>     5083 | int check_ptr_off_reg(struct bpf_verifier_env *env,
>          |     ^~~~~~~~~~~~~~~~~
> >> kernel/bpf/verifier.c:7268:5: warning: no previous prototype for 'chec=
k_mem_reg' [-Wmissing-prototypes]
>     7268 | int check_mem_reg(struct bpf_verifier_env *env, struct bpf_reg=
_state *reg,
>          |     ^~~~~~~~~~~~~
> >> kernel/bpf/verifier.c:8254:5: warning: no previous prototype for 'chec=
k_func_arg_reg_off' [-Wmissing-prototypes]
>     8254 | int check_func_arg_reg_off(struct bpf_verifier_env *env,
>          |     ^~~~~~~~~~~~~~~~~~~~~~
>

doh, they now should be marked back as static, of course

>
> vim +/check_ptr_off_reg +5083 kernel/bpf/verifier.c
>
> e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  5082
> e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15 @5083  int check_ptr_of=
f_reg(struct bpf_verifier_env *env,
> e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  5084                  =
     const struct bpf_reg_state *reg, int regno)
> e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  5085  {
> e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  5086         return __=
check_ptr_off_reg(env, reg, regno, false);
> e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  5087  }
> e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  5088
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
