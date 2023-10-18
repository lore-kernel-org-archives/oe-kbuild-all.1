Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4095E4421
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 03:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eW5AFQXU"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-66d0ceba445so36622296d6.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 20:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697600077; x=1698204877; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/s99dRmEkXItCh+Koy2QP6BRT09ftvt7c4bW5g6ZI6E=;
        b=eW5AFQXU2oPzD7y0G3aX1I9gQwHzAdqfWRgTgOANorxgUPQg895s1nmrmP2QdZW8Q5
         I7Rvk9CBAPb42f1OTzur7uoolOVKNvm89KdVfCHric1rThIOs6maNIIFyXmsW/sT7Phg
         wc9aniEIONylK/z/nZY3792X6/wL214fSiqQ1Peban60DouNmA33az+lio1UYWhFblox
         ksrV4Q0+m+FNDetYsAgIsUch8O0MjaTupn/KT9Ywa2Y9xCRx80dvlmA4tJqfyRK07WkP
         9WaCiILYJ2xcDovxqBCRJ/B7OMD6axWwhKUBNyNQ8aUABLuFNXUQOXfYSj5T3aLwLp/D
         Kwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697600077; x=1698204877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/s99dRmEkXItCh+Koy2QP6BRT09ftvt7c4bW5g6ZI6E=;
        b=Db81xUAYiUF4b+vA9J/IG6pFZdeUuFZ8G/5iTwEaz/leyc/TgfMhBbFfTu89FqLMYh
         0rpKvpL7IrI2om40r7jwNgeNLhOyuo3kuKBysoM27K0xWEoYBCVqNLkmCWcq0jjDJvID
         Sq7S7diSD6neLpA04aLlLUfGpSAJDldZaVsbR8BgqUbNKaymsnr13FxyjPIDbaxUDECw
         rJZRwPw4wA+rvgc/df+G4v9cztfHwmpd8X0D2xmqkES3VifRUTTCNII7TBx+EzkIAxx3
         WuCsswuc+DdbO19VSm55UnnKXbwI0MV7UUQqPbBvb2N6aJw1VgLdbICVB6M3+K2AZP8S
         R81g==
X-Gm-Message-State: AOJu0YxeoF1FH2o5JZCK/6aZ7s/pu0jK53lgDzEnJO2WoQrp28Cu5+rb
	qvSkSkXQxrlfcDYVHVHfdnqmweGHH3ZBE6TOcFo=
X-Google-Smtp-Source: AGHT+IForvT30WJved7eGm71SxTF6TSYNHgTuUW0Us/GTGMVdWeFR0Xj65VA8s/HDbSF+vOkNJ3kMr40J8r/DcqyiTk=
X-Received: by 2002:ad4:5dc6:0:b0:66d:3e2b:bf0a with SMTP id
 m6-20020ad45dc6000000b0066d3e2bbf0amr4620985qvh.20.1697600077015; Tue, 17 Oct
 2023 20:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231017124546.24608-4-laoar.shao@gmail.com> <202310172347.Jp1j3Umf-lkp@intel.com>
In-Reply-To: <202310172347.Jp1j3Umf-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 18 Oct 2023 11:34:01 +0800
Message-ID: <CALOAHbCeQREHPpt5oNa1RgNOK+LEO_c2A4JYAo8+op_j_=TjUQ@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v2 3/9] cgroup: Add a new helper for cgroup1 hierarchy
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 11:55=E2=80=AFPM kernel test robot <lkp@intel.com> =
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
> patch link:    https://lore.kernel.org/r/20231017124546.24608-4-laoar.sha=
o%40gmail.com
> patch subject: [RFC PATCH bpf-next v2 3/9] cgroup: Add a new helper for c=
group1 hierarchy
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/202310=
17/202310172347.Jp1j3Umf-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231017/202310172347.Jp1j3Umf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310172347.Jp1j3Umf-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/cgroup/cgroup-v1.c:1277: warning: expecting prototype for task_=
cgroup_id_within_hierarchy(). Prototype was for task_get_cgroup1_within_hie=
rarchy() instead
>
>
> vim +1277 kernel/cgroup/cgroup-v1.c
>
>   1265
>   1266  /**
>   1267   * task_cgroup_id_within_hierarchy - Acquires the associated cgro=
up of a task
>   1268   * within a specific cgroup1 hierarchy. The cgroup1 hierarchy is =
identified by
>   1269   * its hierarchy ID.
>   1270   * @tsk: The target task
>   1271   * @hierarchy_id: The ID of a cgroup1 hierarchy
>   1272   *
>   1273   * On success, the cgroup is returned. On failure, ERR_PTR is ret=
urned.
>   1274   * We limit it to cgroup1 only.
>   1275   */
>   1276  struct cgroup *task_get_cgroup1_within_hierarchy(struct task_stru=
ct *tsk, int hierarchy_id)
> > 1277  {
>   1278          struct cgroup *cgrp =3D ERR_PTR(-ENOENT);
>   1279          struct cgroup_root *root;
>   1280
>   1281          rcu_read_lock();
>   1282          list_for_each_entry(root, &cgroup_roots, root_list) {
>   1283                  /* cgroup1 only*/
>   1284                  if (root =3D=3D &cgrp_dfl_root)
>   1285                          continue;
>   1286                  if (root->hierarchy_id !=3D hierarchy_id)
>   1287                          continue;
>   1288                  spin_lock_irq(&css_set_lock);
>   1289                  cgrp =3D task_cgroup_from_root(tsk, root);
>   1290                  if (!cgrp || !cgroup_tryget(cgrp))
>   1291                          cgrp =3D ERR_PTR(-ENOENT);
>   1292                  spin_unlock_irq(&css_set_lock);
>   1293                  break;
>   1294          }
>   1295          rcu_read_unlock();
>   1296          return cgrp;
>   1297  }
>   1298
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks for your report.
will correct it.


--=20
Regards
Yafang
