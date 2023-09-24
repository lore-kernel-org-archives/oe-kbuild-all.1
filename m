Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142167FC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 06:48:16 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-65b051a28b3so3827016d6.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 23:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695538096; x=1696142896; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaBaRC6Ejtkpupl/KFvwg/rhByL4ZbGq6eOywagiD7w=;
        b=Befy1LmiItZuuSUq6KqFsUkkqLjLaUhEcpmBFSPdmYA/GxN4OsytIjsVDL1PqpGD5g
         uv0McHFf0G4MhUA2S/X8WlR6sXFXhtFf5+GPNsyCHPem/Hczs/hYs5LYlBNqlSs2QYrA
         RdmLUIfQOnn9/odhIS3m36xQNFUk+ulh/Q8d3eiY1PBp3KKzCQB2XZcX4Nqo+OmCIk/2
         bFx+o67q8e8lYl/yCYmtEoIHnD6tvJ1d1tB76V9GCCLFP91HJJFoarv2qcgLykvuFp01
         l5jHHqI33RsKgt1w9TbA36MjWVVFuPkXCOIe7IxoB/EFM10omOxHVklx/klmQRSHgAeN
         g1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695538096; x=1696142896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaBaRC6Ejtkpupl/KFvwg/rhByL4ZbGq6eOywagiD7w=;
        b=eaBSTj07IMA7P2ugWYN6RkF2BTLYw/w5aNk0QIuGxAicS1JPTpXif+XS7WqAT5KTvr
         fPff/Ad6jHR4eCF6XwbA+vkMl5jjx3J2gm237nENtaf350MqRUMPSOUB+CIS/v9zn25M
         goEeIjT3pTSa/WsqUXIN0st2g3ixECNzVUoBdPjDIUWdi1My5ID9BujK724+5/pX3E6U
         a9AcMbcuajkydU/JtyeS8Z4c8sPYPuKClvTn/6Pixz8B7dyLVCtLERvpAwNHo1NLlCar
         OHlnpc/NlHI2aJivf5cwm3wT0U3K2qyMmC+TbZ0dnZGPGUC35aN3K2GoIbxcrKh1QpPF
         943A==
X-Gm-Message-State: AOJu0YycDSItMsFOxPBwTZfRQkJJ92hWb4oPrm88BD8Fs5nlN8kn5UhE
	FvhvfzA6ftEtz7wXxYAUvjIqJQ4BGaO8VzKgqskNp4R/mXA=
X-Google-Smtp-Source: AGHT+IGZ5jpCCS98EXuBazVrznG140DjEfmpzITNh2eXCD2+1Y932a6Xi3cr4h2YlUvxBCsmpICIEjZGO2ytDZ5OsnE=
X-Received: by 2002:a05:6214:a6a:b0:656:28b1:16c6 with SMTP id
 ef10-20020a0562140a6a00b0065628b116c6mr3416996qvb.2.1695538095902; Sat, 23
 Sep 2023 23:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922112846.4265-5-laoar.shao@gmail.com> <202309222015.R8wLQyHs-lkp@intel.com>
In-Reply-To: <202309222015.R8wLQyHs-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 24 Sep 2023 14:47:39 +0800
Message-ID: <CALOAHbD6tz_OFtEzAGveXSmJFzQjhFmWedeep6JvO9z8yqkywg@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 4/8] bpf: Add new kfuncs support for cgroup controller
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 8:43=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yafang,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/bpf-Fi=
x-missed-rcu-read-lock-in-bpf_task_under_cgroup/20230922-193148
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20230922112846.4265-5-laoar.shao=
%40gmail.com
> patch subject: [RFC PATCH bpf-next 4/8] bpf: Add new kfuncs support for c=
group controller
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/202309=
22/202309222015.R8wLQyHs-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230922/202309222015.R8wLQyHs-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309222015.R8wLQyHs-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/bpf/helpers.c:2254: warning: expecting prototype for bpf_cgroup=
_id_from_task_within_controller(). Prototype was for bpf_cgroup_ancestor_id=
_from_task_within_controller() instead
>
>
> vim +2254 kernel/bpf/helpers.c
>
>   2244
>   2245  /**
>   2246   * bpf_cgroup_id_from_task_within_controller - To get the associa=
ted cgroup_id from
>   2247   * a task within a specific cgroup controller.
>   2248   * @task: The target task
>   2249   * @ssid: The id of cgroup subsystem, e.g. cpu_cgrp_id, memory_cg=
rp_id and etc.
>   2250   * @level: The level of ancestor to look up
>   2251   */
>   2252  __bpf_kfunc u64 bpf_cgroup_ancestor_id_from_task_within_controlle=
r(struct task_struct *task,
>   2253                                                                   =
  int ssid, int level)
> > 2254  {
>   2255          struct cgroup *cgrp, *ancestor;
>   2256          int id =3D 0;
>   2257
>   2258          rcu_read_lock();
>   2259          cgrp =3D task_cgroup(task, ssid);
>   2260          if (!cgrp)
>   2261                  goto out;
>   2262          ancestor =3D cgroup_ancestor(cgrp, level);
>   2263          if (ancestor)
>   2264                  id =3D cgroup_id(ancestor);
>   2265
>   2266  out:
>   2267          rcu_read_unlock();
>   2268          return id;
>   2269  }
>   2270
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Many thanks for your report. Will fix it.

--=20
Regards
Yafang
