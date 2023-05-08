Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285FB20F9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 16:46:08 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7577ef2fa31so365271785a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 08 May 2023 09:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683564368; x=1686156368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1sdyuNtBl6CAufIrv7TH3DRaVHKWDkDa227vEOVtN8=;
        b=NBPuYtttHq9TksMMxaa+Mhne+k5QBA7WKcIz1FImH8Vi7JJOM99UQR74q2CmEfkPqN
         UE7JObZBCdA2/Dl1kWWAXin+/CR7SaQoLq4Al4bQlVGhnbUwrM5zcVCPgdfy9VkD7/WV
         hKTx6a8XmotNZyZhVU1npcgrtqbu1MyCFHgIQLm1zMkYr+j1CvMIKsrIPXWQgYLDF9xa
         8nsl+dMZ00bHrg9mp5UGZvNWfEabXOHFlmEbcQ+NndJui2sYmXHfxo0IlYBkg5+ZpBgw
         butRCe6p6CvCVtlBEEFs0XSSL72/EumJeUEEzPWxESxbxfZ+bOzlPc0xejl7BbwgqRuk
         NbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683564368; x=1686156368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1sdyuNtBl6CAufIrv7TH3DRaVHKWDkDa227vEOVtN8=;
        b=EAgBiDyvJNOaVlpoi7PuP2F1d+a3kVGZVXgYs9gQ/8x8UK/yJPnL5j1q4hmEk7MWH8
         0wuPBt1Z9vAdl+UNpnoxaFnAWPw+s65J06QhCXQcZXN/fOU7VS5KFORRzqUgnfn5HQi8
         s4TISKS+19i4mP1Ar1lhQMPzO4P5cB+tyn3WMy1/I0ZxBt1sCngU3CkDIGnBHRJLLN1Q
         T6FVLMpItXAqytKx0xmdHnFkgMVUJ7khYWjrVaUqaEhm2AB6cidPDwmiXrVvdvEOEODT
         QBN2IbPDXpRuhO+ujXy8JoaLPNEAsfE8Fc31m43hKEvY7shq2UcyaZcAPcTHuHx0RY81
         K7gQ==
X-Gm-Message-State: AC+VfDyKtNoq2oDOwH9uu6WpYDQJiakIksAdpmwLQCpvf3EUZyRIRylr
	8z0gculOQdJ3sCi+xlZ5/tHHYSAAERQJq7Ca6Vw=
X-Google-Smtp-Source: ACHHUZ4iNut6fLGXaeFvdUDTjhFNvw3uLW7t98QkqrzWvXRG5QUGZHPc+taOEsXV1Ma4V4gzFwddoxniFVS1p9y/f98=
X-Received: by 2002:a05:6214:4018:b0:5ef:48c7:3f62 with SMTP id
 kd24-20020a056214401800b005ef48c73f62mr13901794qvb.15.1683564367638; Mon, 08
 May 2023 09:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305070840.X0G3ofjl-lkp@intel.com>
In-Reply-To: <202305070840.X0G3ofjl-lkp@intel.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 8 May 2023 09:45:56 -0700
Message-ID: <CAKEwX=MrPCPKF7Yxfjc-uOR2P-+Ee8+RV_B_u1f7iqC0L=_yew@mail.gmail.com>
Subject: Re: [linux-next:master 14680/14811] mm/filemap.c:4250:1: sparse:
 sparse: Using plain integer as NULL pointer
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 6, 2023 at 5:28=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   83e5775d7afda68f6d7576d21f7a080fbfeecc4f
> commit: d39c65bc7fcb1dad22dc1585fc669b5bfe5d3108 [14680/14811] cachestat:=
 implement cachestat syscall
> config: s390-randconfig-s041-20230507 (https://download.01.org/0day-ci/ar=
chive/20230507/202305070840.X0G3ofjl-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.1.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3Dd39c65bc7fcb1dad22dc1585fc669b5bfe5d3108
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout d39c65bc7fcb1dad22dc1585fc669b5bfe5d3108
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=
=3Ds390 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=
=3Ds390 SHELL=3D/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202305070840.X0G3ofjl-lkp@i=
ntel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    mm/filemap.c:1416:17: sparse: sparse: context imbalance in 'migration_=
entry_wait_on_locked' - unexpected unlock
> >> mm/filemap.c:4250:1: sparse: sparse: Using plain integer as NULL point=
er
> >> mm/filemap.c:4250:1: sparse: sparse: Using plain integer as NULL point=
er
> >> mm/filemap.c:4250:1: sparse: sparse: Using plain integer as NULL point=
er
> >> mm/filemap.c:4250:1: sparse: sparse: Using plain integer as NULL point=
er
>
> vim +4250 mm/filemap.c
>
>   4215
>   4216  /*
>   4217   * The cachestat(2) system call.
>   4218   *
>   4219   * cachestat() returns the page cache statistics of a file in the
>   4220   * bytes range specified by `off` and `len`: number of cached pag=
es,
>   4221   * number of dirty pages, number of pages marked for writeback,
>   4222   * number of evicted pages, and number of recently evicted pages.
>   4223   *
>   4224   * An evicted page is a page that is previously in the page cache
>   4225   * but has been evicted since. A page is recently evicted if its =
last
>   4226   * eviction was recent enough that its reentry to the cache would
>   4227   * indicate that it is actively being used by the system, and tha=
t
>   4228   * there is memory pressure on the system.
>   4229   *
>   4230   * `off` and `len` must be non-negative integers. If `len` > 0,
>   4231   * the queried range is [`off`, `off` + `len`]. If `len` =3D=3D 0=
,
>   4232   * we will query in the range from `off` to the end of the file.
>   4233   *
>   4234   * The `flags` argument is unused for now, but is included for fu=
ture
>   4235   * extensibility. User should pass 0 (i.e no flag specified).
>   4236   *
>   4237   * Currently, hugetlbfs is not supported.
>   4238   *
>   4239   * Because the status of a page can change after cachestat() chec=
ks it
>   4240   * but before it returns to the application, the returned values =
may
>   4241   * contain stale information.
>   4242   *
>   4243   * return values:
>   4244   *  zero        - success
>   4245   *  -EFAULT     - cstat or cstat_range points to an illegal addre=
ss
>   4246   *  -EINVAL     - invalid flags
>   4247   *  -EBADF      - invalid file descriptor
>   4248   *  -EOPNOTSUPP - file descriptor is of a hugetlbfs file
>   4249   */
> > 4250  SYSCALL_DEFINE4(cachestat, unsigned int, fd,
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

Hmm I couldn't see where I used 0 as the null pointer. Maybe
this is a false positive or a result of not wiring up the syscall
for s390? Especially since this is pointed toward the macro
line (SYSCALL_DEFINE).

cc-ing this to s390 maintainers and the s390 mailing list...
Could you help me debug this? Thanks!
