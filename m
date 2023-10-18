Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730554421
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 03:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNVkgaNu"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-66d36b2a247so25611486d6.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 20:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697600106; x=1698204906; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlRJJxSu1LGInmy2HPt56o1oSYVwjnM18gxy0xfZ/y0=;
        b=fNVkgaNu3eDzA1SLHHj3TQogOSudf7FUv78xGLIBKob9okUHTlv+zL+M0D2id5GIiG
         15UpTIHlE2VAAJEO2MiINgKm4OX3LwHZrWuDxqDIXy7JT8sULVOsN2dc9t5vJNXKK3K1
         Qa8cjCcfi3ZQHXGhXPcpRiTOBJb2/Dumq5L8uq/mikrYo/WNMAHywVu6xLSrce8dgAHz
         +xlvS+vY3Hb473s2tmMbow+fgvsPOuDtai5BunmY1q0rc5pDroV4/bt2fZQmPSTaIrpL
         OjJR0Nf3m2rCiqY8u7cU0TeTHCBvrl9AT2JIqJPH4Dq7fy61aXZ6nPVdvtop5aQ6u9AE
         mP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697600106; x=1698204906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlRJJxSu1LGInmy2HPt56o1oSYVwjnM18gxy0xfZ/y0=;
        b=GI0ao/suANvOXwp4B5LsdgI1NxbGdjnvtFiAT9PSPfISrb/TgOuxB1mMmqYRrPgxbM
         oGE6EU79QOT7uabMZibz6xKI1Z3HiR3eOXw/uTxRXZFTT+LEP5WWJwcmdmzXID9qwPiV
         dBihiWU9HKoFGq5U7xjDMDql9UZhbixLvVR7AmEQ1lPsjYBt+y3LqKi0Y1QIVTblChl+
         cygXcFheG5dGdyeZtymDWPoMD+CFhX9G9+o+86RCprpKPdKXbhbpn093q8tPcoqbjNCD
         IYDWncYk+F1pkiE1DV5Jg44iEo4EkqLb2eQz+gCQ1z4HJGfUanai5GCpgbiiJLNYuN7E
         5q2A==
X-Gm-Message-State: AOJu0Yx0bVsXDTXiG7vrUvtcDp7EBff5HxnB8UJd8XUD/7Odf0Didfyk
	HaLKV/0uFpKDc/w1E9O0l+CMNXe3925mDGhl2F5v2j9W7obZNg==
X-Google-Smtp-Source: AGHT+IEGVJYLpqD0BdQPOQdhz0Ar69zI2z4oaUteivzfcbdZ6KYP652fPp6JhJsDFmnTcaAS52liZYeY3BjyLD2a4QQ=
X-Received: by 2002:a05:6214:e85:b0:66d:626b:26ed with SMTP id
 hf5-20020a0562140e8500b0066d626b26edmr4409123qvb.21.1697600106324; Tue, 17
 Oct 2023 20:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231017124546.24608-5-laoar.shao@gmail.com> <202310180043.9mRP2HUf-lkp@intel.com>
In-Reply-To: <202310180043.9mRP2HUf-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 18 Oct 2023 11:34:30 +0800
Message-ID: <CALOAHbC=EfUYE+1wSw4sOv+avWWDcY=8jAOqov=NqnQT-FQe+g@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v2 4/9] bpf: Add a new kfunc for cgroup1 hierarchy
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 12:39=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Yafang,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/cgroup=
-Make-operations-on-the-cgroup-root_list-RCU-safe/20231017-204729
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20231017124546.24608-5-laoar.sha=
o%40gmail.com
> patch subject: [RFC PATCH bpf-next v2 4/9] bpf: Add a new kfunc for cgrou=
p1 hierarchy
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/202310=
18/202310180043.9mRP2HUf-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231018/202310180043.9mRP2HUf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310180043.9mRP2HUf-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/bpf/helpers.c:2232: warning: expecting prototype for bpf_task_g=
et_cgroup_within_hierarchy(). Prototype was for bpf_task_get_cgroup1_within=
_hierarchy() instead
>
>
> vim +2232 kernel/bpf/helpers.c
>
>   2220
>   2221  /**
>   2222   * bpf_task_get_cgroup_within_hierarchy - Acquires the associated=
 cgroup of
>   2223   * a task within a specific cgroup1 hierarchy. The cgroup1 hierar=
chy is
>   2224   * identified by its hierarchy ID.
>   2225   * @task: The target task
>   2226   * @hierarchy_id: The ID of a cgroup1 hierarchy
>   2227   *
>   2228   * On success, the cgroup is returen. On failure, NULL is returne=
d.
>   2229   */
>   2230  __bpf_kfunc struct cgroup *
>   2231  bpf_task_get_cgroup1_within_hierarchy(struct task_struct *task, i=
nt hierarchy_id)
> > 2232  {
>   2233          struct cgroup *cgrp =3D task_get_cgroup1_within_hierarchy=
(task, hierarchy_id);
>   2234
>   2235          if (IS_ERR(cgrp))
>   2236                  return NULL;
>   2237          return cgrp;
>   2238  }
>   2239  #endif /* CONFIG_CGROUPS */
>   2240
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks for your report.
will correct it.

--=20
Regards
Yafang
