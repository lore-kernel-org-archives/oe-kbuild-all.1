Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8718D13AC4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIHqtwv2"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-66cfef11a25so3910226d6.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 02:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697794676; x=1698399476; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITDFO3+4Hzti60Emm0u+EtlFdmd7i43kiwJokkmeQPs=;
        b=OIHqtwv22kKT5MxRYD1oKfekom3cwUYwL/IFsLON1MYJ1zpXV4CoGzquVsKIiTwFQG
         GKBfAMOD0G+W8nLUNBmd5YTAffZWo+5R+QjdtxmroUeFAs20ze+m869QQupo1otXjOrg
         53azj9Uydizxpf84jhNpwkjIb29JmScII63G3s1jh7SlrnSjjvkxpwb6qGlWpIU28OYs
         hBLEqz5lzH98/lMJw3A2yTfoS1f1aA2ymQSdB36iX+e9op82B0TKEmOeeiIeJ1rvgSJL
         WGf4ltJYQPYh2rp4SeTfAEv8CgPrmx4JapGTDzG/tXlR/pjKpgTw6esiRbbhE/P85mZg
         7Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697794676; x=1698399476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITDFO3+4Hzti60Emm0u+EtlFdmd7i43kiwJokkmeQPs=;
        b=ZOsvlgMnR0+y1mfUrXCpy/NaqrPu2fYWRv1IBfLoVjKvaG1mU8/B/rAEZ+GDPcTmKW
         MSkqvq9dhgSG+MWpm5prluze6ut/wuSl6PTsmBjIUKBKDo4zR3jQBNvQdTRHGTF/tPQo
         c3CtLVSxdNdc3EGJWxFCb4O9+hZBeombPbzJ52YGl6/vg/MZSbMX9ZfXZoG+KyQuPWZf
         aSHzt2gWk8KuFIaeRRvN/pKXAkB5uSymf1A2fM/5lJyidzZI12qYkLzyhZYMk24HmMAh
         PKivirOYF6gvBeRFeKDWE8Ayc0cqKgpItMQcQocdAg9QzL2vBOci661q4vS/97lIluTl
         eVMA==
X-Gm-Message-State: AOJu0YwSZKqMzWZzxLGcIrHxqOPlXS3BANgdPOYd3jJMOc8jBqPb/TB+
	2OWq9s7GoDeYSlwLqsCiHlrnod049JCJZlJq5qE=
X-Google-Smtp-Source: AGHT+IF4GR/5YXFsW/zC+v9wvN1xwf1aCfO/HkZlZL3jk/ophR2Zwz6tALiMZO3QWYV7nO0MLJv+0cKO3xKjHA1c9fc=
X-Received: by 2002:a05:6214:250a:b0:65d:56c:5177 with SMTP id
 gf10-20020a056214250a00b0065d056c5177mr1476827qvb.57.1697794676209; Fri, 20
 Oct 2023 02:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231017124546.24608-2-laoar.shao@gmail.com> <202310201402.OTBQV3GJ-lkp@intel.com>
In-Reply-To: <202310201402.OTBQV3GJ-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 20 Oct 2023 17:37:20 +0800
Message-ID: <CALOAHbB_0Hpiwsdz+Cd+dq0LsNzM6g_EJetDnn3Ydni62RP+iQ@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v2 1/9] cgroup: Make operations on the cgroup
 root_list RCU safe
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 2:35=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yafang,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/cgroup=
-Make-operations-on-the-cgroup-root_list-RCU-safe/20231017-204729
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20231017124546.24608-2-laoar.sha=
o%40gmail.com
> patch subject: [RFC PATCH bpf-next v2 1/9] cgroup: Make operations on the=
 cgroup root_list RCU safe
> config: um-defconfig (https://download.01.org/0day-ci/archive/20231020/20=
2310201402.OTBQV3GJ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231020/202310201402.OTBQV3GJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310201402.OTBQV3GJ-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    /usr/bin/ld: kernel/cgroup/cgroup.o: in function `__cset_cgroup_from_r=
oot':
> >> kernel/cgroup/cgroup.c:1389: undefined reference to `lockdep_is_held'
> >> collect2: error: ld returned 1 exit status
>
>
> vim +1389 kernel/cgroup/cgroup.c
>
>   1362
>   1363  /*
>   1364   * Returned cgroup is without refcount but it's valid as long as =
cset pins it.
>   1365   */
>   1366  static inline struct cgroup *__cset_cgroup_from_root(struct css_s=
et *cset,
>   1367                                              struct cgroup_root *r=
oot)
>   1368  {
>   1369          struct cgroup *res_cgroup =3D NULL;
>   1370
>   1371          if (cset =3D=3D &init_css_set) {
>   1372                  res_cgroup =3D &root->cgrp;
>   1373          } else if (root =3D=3D &cgrp_dfl_root) {
>   1374                  res_cgroup =3D cset->dfl_cgrp;
>   1375          } else {
>   1376                  struct cgrp_cset_link *link;
>   1377                  lockdep_assert_held(&css_set_lock);
>   1378
>   1379                  list_for_each_entry(link, &cset->cgrp_links, cgrp=
_link) {
>   1380                          struct cgroup *c =3D link->cgrp;
>   1381
>   1382                          if (c->root =3D=3D root) {
>   1383                                  res_cgroup =3D c;
>   1384                                  break;
>   1385                          }
>   1386                  }
>   1387          }
>   1388
> > 1389          WARN_ON_ONCE(!res_cgroup && lockdep_is_held(&cgroup_mutex=
));
>   1390          return res_cgroup;
>   1391  }
>   1392
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks for your report.

--=20
Regards
Yafang
