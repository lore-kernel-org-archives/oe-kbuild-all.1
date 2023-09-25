Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10687F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 02:31:42 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-65b08bbd8b1so9208906d6.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 19:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695609102; x=1696213902; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyKa0/1Ct3yommQr3DKRbCBLZcOYeb3ZBBJ//hFLPm8=;
        b=T7x4y9OUwFD1Ugvrq0vbfq8bANDDHFemQUhoFjl3jHks7dk2T5VS4cttQ1jtOjl0WB
         WEndp/nFbNuCUbfd8KbwWRMDbGYTA4yOw7opUKOZPqWiG4fDN7KbqiiOHnKX+6TwdsEr
         PNTHjcRZsdhO0GvXXklEcKxBMD4j1WFYLJ36P4cHSlNDzTCzMTpBlhip26R3ihaUrdtL
         LiPK72kq7DGBy8RHGoAbAy8l7YKRXd2ggTpzviKPMvsEMeYNKGRKfbgAq1HKXqyD43vL
         SbUtMUExGMlEX46+FxzmwT8n69KI/RAi9ID8W1YqywM3E1RzVgO2ELQbirdjfRJJ0EUw
         6f6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695609102; x=1696213902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyKa0/1Ct3yommQr3DKRbCBLZcOYeb3ZBBJ//hFLPm8=;
        b=trwQ9syVYQdxwCkjA7Xmi9H025MxGFU1z6rsLjNhIHkPdUKdT/At8jsqj+NUKBHALA
         Ecmfp9FRMd2QMCpYQDnRqhGBsrNXUG0mOYjUzCyegfcwNItEj9XTQTXzly2e6N2trzJq
         FcGNmIornsu1stXO/LzJXbzHlmxfO8LH/Wfjhu0/V2KnNXcnM3Z1mhXU4yUYbsra1U/S
         tLl7kjvf3wyK6RRhXescSt9KUZzX/cyukoXCUa89j57vvcM3vF2lqO79fNxpj2a0eSV4
         CIidEaYirHCFXmWTKmN85+OiF7hqWXHlbTK8G7zskNoVmFuRevBluNMiNQ9pKcSwfayJ
         Dojw==
X-Gm-Message-State: AOJu0YyWyf98vJgPvH9/ApwUtLxtIiWeBtDufBFOkMs1JP8Q7J7vybOl
	px0a6tnDsIPCHjFMiaTjRpt7FI3NKF8Ewl2YZ7A=
X-Google-Smtp-Source: AGHT+IFKCc3R6KTLxKN5VAqC5I76eFzSh6621OY3MOw5MdlKd2bp1pPwEkxi91Nv+TKtE1jY7YGiY1dxoAY0lQWj2oQ=
X-Received: by 2002:a0c:f34d:0:b0:65b:8a2:6b86 with SMTP id
 e13-20020a0cf34d000000b0065b08a26b86mr2303090qvm.59.1695609101873; Sun, 24
 Sep 2023 19:31:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922112846.4265-4-laoar.shao@gmail.com> <202309250253.tLz2qzge-lkp@intel.com>
In-Reply-To: <202309250253.tLz2qzge-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 25 Sep 2023 10:31:06 +0800
Message-ID: <CALOAHbAS+2gaRP0SFodOYa5ji=F-50vzenyUUypcfkAHXLDQ-g@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 3/8] cgroup: Add cgroup_get_from_id_within_subsys()
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 2:16=E2=80=AFAM kernel test robot <lkp@intel.com> w=
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
> patch link:    https://lore.kernel.org/r/20230922112846.4265-4-laoar.shao=
%40gmail.com
> patch subject: [RFC PATCH bpf-next 3/8] cgroup: Add cgroup_get_from_id_wi=
thin_subsys()
> config: x86_64-randconfig-016-20230925 (https://download.01.org/0day-ci/a=
rchive/20230925/202309250253.tLz2qzge-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230925/202309250253.tLz2qzge-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309250253.tLz2qzge-lkp=
@intel.com/
>
> Note: it may well be a FALSE warning. FWIW you are at least aware of it n=
ow.
>
> All warnings (new ones prefixed by >>):
>
>    kernel/cgroup/cgroup.c: In function 'cgroup_get_from_id_within_subsys'=
:
>    kernel/cgroup/cgroup.c:6216:23: warning: array subscript is above arra=
y bounds [-Warray-bounds]
>       root =3D cgroup_subsys[ssid]->root;
>              ~~~~~~~~~~~~~^~~~~~
> >> kernel/cgroup/cgroup.c:6216:23: warning: array subscript is below arra=
y bounds [-Warray-bounds]
>
>
> vim +6216 kernel/cgroup/cgroup.c
>
>   6196
>   6197  /*
>   6198   * cgroup_get_from_id_within_subsys - get the cgroup associated w=
ith cgroup id
>   6199   *                                    within specific subsystem
>   6200   * @cgid: cgroup id
>   6201   * @ssid: cgroup subsystem id, -1 for cgroup default tree
>   6202   * On success return the cgrp or ERR_PTR on failure
>   6203   * Only cgroups within current task's cgroup NS are valid.
>   6204   */
>   6205  struct cgroup *cgroup_get_from_id_within_subsys(u64 cgid, int ssi=
d)
>   6206  {
>   6207          struct cgroup_root *root;
>   6208          struct kernfs_node *kn;
>   6209          struct cgroup *cgrp;
>   6210
>   6211          if (ssid =3D=3D -1) {
>   6212                  root =3D &cgrp_dfl_root;
>   6213          } else {
>   6214                  if (ssid >=3D CGROUP_SUBSYS_COUNT)
>   6215                          return ERR_PTR(-EINVAL);
> > 6216                  root =3D cgroup_subsys[ssid]->root;
>   6217          }
>   6218
>   6219          kn =3D kernfs_find_and_get_node_by_id(root->kf_root, cgid=
);
>   6220          if (!kn)
>   6221                  return ERR_PTR(-ENOENT);
>   6222
>   6223          if (kernfs_type(kn) !=3D KERNFS_DIR) {
>   6224                  kernfs_put(kn);
>   6225                  return ERR_PTR(-ENOENT);
>   6226          }
>   6227
>   6228          rcu_read_lock();
>   6229
>   6230          cgrp =3D rcu_dereference(*(void __rcu __force **)&kn->pri=
v);
>   6231          if (cgrp && !cgroup_tryget(cgrp))
>   6232                  cgrp =3D NULL;
>   6233
>   6234          rcu_read_unlock();
>   6235          kernfs_put(kn);
>   6236
>   6237          if (!cgrp)
>   6238                  return ERR_PTR(-ENOENT);
>   6239
>   6240          return cgrp;
>   6241  }
>   6242
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks for your report. Will fix it.


--=20
Regards
Yafang
