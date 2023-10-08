Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7CF188
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Oct 2023 02:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYVo6IU1"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-77574dec71bso228502985a.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 07 Oct 2023 19:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696732662; x=1697337462; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaSDJJ5nBPmfHRKSx77Yd7RZhMHWv7/rwayJkG4rOlA=;
        b=PYVo6IU1HeH0j3UMsHDZWr0lcskW4Rk9qL0wM42a2tNFgjhXpZpkcfDxBwAoVD2Xbo
         5h69KlYFKPKwouKlZHREI6Y6sUyz1ADnu9YhaxIAltOZiA0mXii+aNkrRSOFa9wQ2HI0
         z1VRrIEvAIqTP9p2Wc2RbPTRppyRAgOueyV+arYBBPlJ0r9Ue2hH5MKoyiYfDpoOxWwH
         uo4Wz+U4b1pqh8e6EiTYAy0gnubJB0pLyxIZmxFQIbaSqd8nevnOKyYUtBOyN4ENECT3
         Spps+cnfJRo70X5QwDZDyz8LZSWoUporkS8CXc9JSbvVlahvnlgJSRX6Jr2PXSHAPas3
         nBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696732662; x=1697337462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaSDJJ5nBPmfHRKSx77Yd7RZhMHWv7/rwayJkG4rOlA=;
        b=sKmIa8aqjaR1i5RHu2z+LotQrcHLvzRtHIQUXyHXOrd/zj8WROUYzanmkXD3totOnu
         trWYtBUMYZg5yydqBszbY2JtVMljYFe4hEfKt0lT+sv7Mut/7lJf+OIuajw8UrT5h/VX
         GObSVLTngAnJByceUSopyTZ8QoWxSy9pQDMR4TyxnY2eb+oqL6Q6EO8OYej0XinTdw7B
         z04hg8w/It3BhdHAA1JeLt2rQIEP6iD9+vjrIZwacBRI6Peqys4GdYNYE0+P/3IMvnvz
         RJ+thfxTiIhJBbKUeg350LkKuVp621wzx+LsYZk8ZvaHJroY8H3bie9QNTo04wt8tvrP
         RqNA==
X-Gm-Message-State: AOJu0Yz6lsC1Q/ADviuXKqA2wHd97zrTMgTZ6p+fJhxEeordn7c6gD1u
	L2KVkJ4zITyyrpN8lPNBE1iJdvmwO0JDYTa0yTQ=
X-Google-Smtp-Source: AGHT+IGm8jw/fIKhjX0PXzsTdfMoGtTi17JCwwB9VzV4a73OFPLo9gid1iHSUAMPxAjQqjGZNoQRUz+Gb5t3ESnlJqA=
X-Received: by 2002:a05:620a:2490:b0:774:2bbe:3a4f with SMTP id
 i16-20020a05620a249000b007742bbe3a4fmr15368175qkn.53.1696732661846; Sat, 07
 Oct 2023 19:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231007140304.4390-3-laoar.shao@gmail.com> <202310080147.tCzExe9f-lkp@intel.com>
In-Reply-To: <202310080147.tCzExe9f-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 8 Oct 2023 10:37:05 +0800
Message-ID: <CALOAHbBH48Hf7fkUXv54P2iKGCzg6e0vObNUcqMAOg5-piqLsA@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 2/8] cgroup: Add new helpers for cgroup1 hierarchy
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 8, 2023 at 1:19=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Yafang,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/cgroup=
-Don-t-have-to-hold-cgroup_mutex-in-task_cgroup_from_root/20231007-220510
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20231007140304.4390-3-laoar.shao=
%40gmail.com
> patch subject: [RFC PATCH bpf-next 2/8] cgroup: Add new helpers for cgrou=
p1 hierarchy
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/202310=
08/202310080147.tCzExe9f-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231008/202310080147.tCzExe9f-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310080147.tCzExe9f-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/cgroup/cgroup-v1.c:1275: warning: Function parameter or member =
'tsk' not described in 'task_cgroup1_id_within_hierarchy'
> >> kernel/cgroup/cgroup-v1.c:1275: warning: expecting prototype for task_=
cgroup_id_within_hierarchy(). Prototype was for task_cgroup1_id_within_hier=
archy() instead
> >> kernel/cgroup/cgroup-v1.c:1307: warning: Function parameter or member =
'tsk' not described in 'task_ancestor_cgroup1_id_within_hierarchy'
> >> kernel/cgroup/cgroup-v1.c:1307: warning: expecting prototype for task_=
ancestor_cgroup_id_within_hierarchy(). Prototype was for task_ancestor_cgro=
up1_id_within_hierarchy() instead
>
>
> vim +1275 kernel/cgroup/cgroup-v1.c
>
>   1265
>   1266  /**
>   1267   * task_cgroup_id_within_hierarchy - Retrieves the associated cgr=
oup ID from
>   1268   * a task within a specific cgroup1 hierarchy.
>   1269   * @task: The task to be tested
>   1270   * @hierarchy_id: The hierarchy ID of a cgroup1
>   1271   *
>   1272   * We limit it to cgroup1 only.
>   1273   */
>   1274  u64 task_cgroup1_id_within_hierarchy(struct task_struct *tsk, int=
 hierarchy_id)
> > 1275  {
>   1276          struct cgroup_root *root;
>   1277          struct cgroup *cgrp;
>   1278          u64 cgid =3D 0;
>   1279
>   1280          spin_lock_irq(&css_set_lock);
>   1281          list_for_each_entry(root, &cgroup_roots, root_list) {
>   1282                  /* cgroup1 only*/
>   1283                  if (root =3D=3D &cgrp_dfl_root)
>   1284                          continue;
>   1285                  if (root->hierarchy_id !=3D hierarchy_id)
>   1286                          continue;
>   1287                  cgrp =3D task_cgroup_from_root(tsk, root);
>   1288                  WARN_ON_ONCE(!cgrp);
>   1289                  cgid =3D cgroup_id(cgrp);
>   1290                  break;
>   1291          }
>   1292          spin_unlock_irq(&css_set_lock);
>   1293          return cgid;
>   1294  }
>   1295
>   1296  /**
>   1297   * task_ancestor_cgroup_id_within_hierarchy - Retrieves the assoc=
iated ancestor
>   1298   * cgroup ID from a task within a specific cgroup1 hierarchy.
>   1299   * @task: The task to be tested
>   1300   * @hierarchy_id: The hierarchy ID of a cgroup1
>   1301   * @ancestor_level: level of ancestor to find starting from root
>   1302   *
>   1303   * We limit it to cgroup1 only.
>   1304   */
>   1305  u64 task_ancestor_cgroup1_id_within_hierarchy(struct task_struct =
*tsk, int hierarchy_id,
>   1306                                                int ancestor_level)
> > 1307  {
>   1308          struct cgroup *cgrp, *ancestor;
>   1309          struct cgroup_root *root;
>   1310          u64 cgid =3D 0;
>   1311
>   1312          spin_lock_irq(&css_set_lock);
>   1313          list_for_each_entry(root, &cgroup_roots, root_list) {
>   1314                  /* cgroup1 only*/
>   1315                  if (root =3D=3D &cgrp_dfl_root)
>   1316                          continue;
>   1317                  if (root->hierarchy_id !=3D hierarchy_id)
>   1318                          continue;
>   1319
>   1320                  cgrp =3D task_cgroup_from_root(tsk, root);
>   1321                  WARN_ON_ONCE(!cgrp);
>   1322                  ancestor =3D cgroup_ancestor(cgrp, ancestor_level=
);
>   1323                  if (!ancestor)
>   1324                          break;
>   1325
>   1326                  cgid =3D cgroup_id(ancestor);
>   1327                  break;
>   1328          }
>   1329          spin_unlock_irq(&css_set_lock);
>   1330          return cgid;
>   1331  }
>   1332
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks for your report. will fix it.

--=20
Regards
Yafang
