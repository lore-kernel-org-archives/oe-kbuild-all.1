Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D507334692
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053786; cv=pass; b=C9fAWebaJWH96BH6jQf6JfD6OGtyle/YaafErKNXZCh31yLS+1b/z9kVlhg24afGekkHGOs4+3B2ACg71p/QQPl17/65bE0FTn3w+wH29SgfK9HUvRePcFwMTAPMvQTl0WFOFIew/bAnQSL4wb6z8NAk3Eo1jtsh3pbd26D7cdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053786; c=relaxed/simple;
	bh=3LIsNSPlEFTHIQ/gX7BnyzjivlVIdxXWfdHId7CEHpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpufrVX3GT6KaAIXMa6c07m+v28TBFkIToc0h7CCcBt75BpvULqBf6IRzV9udBXfIY/0mqGD+u2B1Aes2KuLF8KMz6DuL8YLffBq9+mN7GAXmkn70yCUim+K8fRcwlmWJh9cGy9Ha+fyq5KzG4mxphMqiJzlv0CkV/orYE/kZOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UK3MWKCs; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UK3MWKCs"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so301141cf.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 08:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789053781; cv=none;
        d=google.com; s=arc-20260327;
        b=FJ7/icPL/3oseBn2zDp+ydlS2wl6nSr5yHVSQVRxAth73WG+10m2mWIp0SlEtTpVxp
         hCB0qx2ONm5OuKLPQelOmeznfmD/EOnsKj9d2H5FmZld559BiOzqmqWs195Bj/l7OOqt
         XmCIW+3urnDoab79lvTqt4zJLcEiDZYpW9IQThJd23QQ0qpuBPyzuJ5T0pYxFFoUVR/D
         4VeseAa36N+f2LGwtKJdXPT33lQ9IQ0XHjFHElJAm8RM+AxpAAgdZJj+ZwuTM/JJhyW2
         COJTosHooQZk30U7hzudZWsm5lJros/xi44K3dFnxb/yJOgluwnZ1PGYwIB1+UfPYVBh
         E2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=foiDQ6diynQrcBaahnIV4yufuKYFC6bgEE9f3Z6k/+4=;
        fh=5dwCjUZTz///Se0/aiftvcuu7FIMv3VfSoJPRquc9Ek=;
        b=HgA4nW2b95O7lXPwHJkRU2N2xnMUCsn/uDq11mt7Thacg4FeW5ZFiUIa1eSWbPDRwn
         NFujTZIQqoAIEIm+rlZEazx634wWJgVBqqIzdbYaX5WvINsyZjDPHqO3t3eWq8u4+Iqd
         IUhKA1h6F6/RT56DBWfu3zYeGQG52VKWjjrZaCiUSzK5sukmcX5Jh+B/uf5ZlMw6Cng4
         L5eJOghAfsKAmRCWaoBbJG3xuN6si9KQhxF4moqIea/nzlHtSkAT17xSGyKvjhLa9Wwi
         QfWYj7G2dVhUhQ4+9PwqkLAJwi2H9ub5SoB5GZ8Y5MczUNAFHJwk3DTozKGay2lSlQV1
         JJ0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789053781; x=1789658581; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=foiDQ6diynQrcBaahnIV4yufuKYFC6bgEE9f3Z6k/+4=;
        b=UK3MWKCsVGBNsT8WU+usRSepwZXcmvDz0Fkv9lzxSI5QWefgNpQf8Zky4fg3deh3oC
         TFat3zP9BEUzYi2qHQ+cXWxDompa311xo+PxKFdwkhwVsJKTKJ94xI5U6mV2T3AgfAGB
         rov3oVACi5Rtutu11X9ZMMjHALYYQKzpX1FPbtlC9lSUTqZECCVCFeGZRB28Wxi/4JVK
         AL4PRoZsyki7cmj/AfNdI0Z7bcQ0prTyqMldABcijVIJiHXebmI1A5fVFyx/I5fVLQSv
         h+b1FQlUX2OY1li1hkBoimUboE7en9wXRySyB+OCoZGydGUpPUO31DYJBRxCQG5j7Q9Q
         NVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053781; x=1789658581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=foiDQ6diynQrcBaahnIV4yufuKYFC6bgEE9f3Z6k/+4=;
        b=jLK3jgF1p1Xz4GFwx/qVT7+olGIC0qrr3Xt8dYQOL2ymr1dH1NotFeMHBeYKHqJnyk
         Rwd90CgfLw3uTIqUY8Dk+KO38QSk+g/iuecfN0ugkYaCaCO7qZ48E160yBmlZnmeQQBD
         3+N2LTjvw5abYdSVt1OuLha+lBJ5bMQxleFK0NtwqOfHvnmPWyYoiQeyXw2oUUa7gFMK
         Y61twiJJolMrVuC+N6BJqVCsHphtVR1UIfYbd8DuWJRQLwSL6cEz/fvguP86LBddjxOp
         bZSsGxDT5cgEs4QOBw2HDxaFcPJwppNx/KjTjOUFiIQw9eQ+NQqQNYsy+dOvL33WgsXZ
         nZbw==
X-Forwarded-Encrypted: i=1; AKwUvBzyNY/wwNXayDYhxGPqPsdFu7U/wMu7d69yJEi0iI2KYVqWEYBAZeGVUPqv8M/kS7CwrHejb0YWqRPycIaH@lists.linux.dev
X-Gm-Message-State: AFuF++nEwOrRWKXLGKbU+Qrk7Sc2PYDTkuQtIviUAzO6sFSz4aRF01OO
	1wR/rqkG/fFrx3w1kPSWwzx0w67Pl2ZmKfWkdVAt7h/aqln8RXD0F/7wpRMC5g5paoqWFE44e8y
	MUZ/1bLxhPSmIuiyt/9veQLFjHi72PRJd62GyZ09U
X-Gm-Gg: AYBFou1LpiACNckYklb8USIMfHh5PlNajVQW5ajaptg9BLLn9zwdM8PbE3UfYPKok1E
	oCp3mg1Jn4ks7CBAa6mAjc+csdlcW8RLNP6oKsEczIp5c7xmdfmaHZHL35Gf0yQJqDY3Nzw8t86
	SLhzJRzjwPixj+EAnypPbb9/+KvnwZ+LGWHBZcaHSlnjCvXijAw2FlTcmxZ+gxRLE6jEjgGsEx9
	jUE5q90Sr+AnUQ/8a3/y1sXRiK/PcM6W8aeS4eczoEjlFP3u7oe6F1H3TfL89ib61vBKijppQqn
	WEdZKs24PpK3U6LK6IgU7nWfoFQSiW3lx3TBZxNsso94u9sLXq8LSYTtGheJCtkJ0IR2l4qLpps
	vHtgUobyVtA==
X-Received: by 2002:a05:622a:229e:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-530b493ec9amr21800701cf.12.1789053780219; Thu, 10 Sep 2026
 08:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609102250.lIycVv3n-lkp@intel.com> <CAJuCfpGzZjvC49EJb8KwjzsEKi2HZbrKs=P+06GNLDSFoTedMA@mail.gmail.com>
In-Reply-To: <CAJuCfpGzZjvC49EJb8KwjzsEKi2HZbrKs=P+06GNLDSFoTedMA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 10 Sep 2026 08:22:49 -0700
X-Gm-Features: AcwNN1Vpd9Nn3bXuKcyUSWjUYWc9CR-onv1HPhUAjO_3tU0VLTHMUNIuNLQxO5s
Message-ID: <CAJuCfpEz8=emKgxjQ3_Sv7knJZW1+kN7b6Y31uoMh2TQ6C0EuA@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 358/388] mm/sparse-vmemmap.c:507:48: error:
 implicit declaration of function 'device_zone'; did you mean 'device_move'?
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, oe-kbuild-all@lists.linux.dev, 
	David Hildenbrand <david@kernel.org>, Linux Memory Management List <linux-mm@kvack.org>, mm-commits@vger.kernel.org, 
	Muchun Song <songmuchun@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 8:16=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Sep 10, 2026 at 7:41=E2=80=AFAM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
new
> > head:   cf558a250cf4475a8936902b8978fbb6c61016f8
> > commit: dd35ca2f2cac9d6439a2ba2f523b98b5a9a9f8f5 [358/388] mm-sparse-vm=
emmap-switch-device-dax-to-shared-tail-vmemmap-pages-fix
> > config: s390-randconfig-r121-20260910 (https://download.01.org/0day-ci/=
archive/20260910/202609102250.lIycVv3n-lkp@intel.com/config)
> > compiler: s390-linux-gcc (GCC) 13.4.0
> > sparse: v0.6.5-rc1
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260910/202609102250.lIycVv3n-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202609102250.lIycVv3n-l=
kp@intel.com/
> >
> > All error/warnings (new ones prefixed by >>):
> >
> >    mm/sparse-vmemmap.c: In function 'vmemmap_populate_compound_pages':
> > >> mm/sparse-vmemmap.c:507:48: error: implicit declaration of function =
'device_zone'; did you mean 'device_move'? [-Werror=3Dimplicit-function-dec=
laration]
> >      507 |         page =3D vmemmap_shared_tail_page(order, device_zone=
(node));
> >          |                                                ^~~~~~~~~~~
> >          |                                                device_move
> > >> mm/sparse-vmemmap.c:507:48: warning: passing argument 2 of 'vmemmap_=
shared_tail_page' makes pointer from integer without a cast [-Wint-conversi=
on]
> >      507 |         page =3D vmemmap_shared_tail_page(order, device_zone=
(node));
> >          |                                                ^~~~~~~~~~~~~=
~~~~
> >          |                                                |
> >          |                                                int
> >    mm/sparse-vmemmap.c:172:78: note: expected 'struct zone *' but argum=
ent is of type 'int'
> >      172 | struct page __ref *vmemmap_shared_tail_page(unsigned int ord=
er, struct zone *zone)
> >          |                                                             =
    ~~~~~~~~~~~~~^~~~
> >    cc1: some warnings being treated as errors
>
> I think this breakage happens if CONFIG_ZONE_DEVICE=3Dn.

Sorry, it's the combination of CONFIG_ZONE_DEVICE=3Dn && CONFIG_NUMA=3Dy.
This seems to fix it:

---
 include/linux/mmzone.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 136235b6975d..0e4c09f4ad3b 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1700,7 +1700,7 @@ static inline bool zone_is_zone_device(const
struct zone *zone)
 }
 #endif

-#if !defined(CONFIG_ZONE_DEVICE) && !defined(CONFIG_NUMA)
+#if !defined(CONFIG_ZONE_DEVICE)
 static inline struct zone *device_zone(int nid)
 {
  return NULL;
--=20

> The mm-new branch build breakage can be easily reproduced with defconfig =
on x86.
>
> >
> >
> > vim +507 mm/sparse-vmemmap.c
> >
> > 4917f55b4ef963 Joao Martins    2022-04-28  494
> > 4917f55b4ef963 Joao Martins    2022-04-28  495  static int __meminit vm=
emmap_populate_compound_pages(unsigned long start_pfn,
> > 4917f55b4ef963 Joao Martins    2022-04-28  496                         =
                              unsigned long start,
> > 4917f55b4ef963 Joao Martins    2022-04-28  497                         =
                              unsigned long end, int node,
> > 4917f55b4ef963 Joao Martins    2022-04-28  498                         =
                              struct dev_pagemap *pgmap)
> > 4917f55b4ef963 Joao Martins    2022-04-28  499  {
> > 4917f55b4ef963 Joao Martins    2022-04-28  500          unsigned long s=
ize, addr;
> > 4917f55b4ef963 Joao Martins    2022-04-28  501          pte_t *pte;
> > 4917f55b4ef963 Joao Martins    2022-04-28  502          int rc;
> > d1d11861d8a018 Muchun Song     2026-09-08  503          unsigned long f=
lags =3D VMEMMAP_POPULATE_DAX;
> > 8fbaacc4a64bd1 Muchun Song     2026-09-08  504          struct page *pa=
ge;
> > 8fbaacc4a64bd1 Muchun Song     2026-09-08  505          unsigned int or=
der =3D pfn_to_section_order(start_pfn);
> > 4917f55b4ef963 Joao Martins    2022-04-28  506
> > 8fbaacc4a64bd1 Muchun Song     2026-09-08 @507          page =3D vmemma=
p_shared_tail_page(order, device_zone(node));
> > 8fbaacc4a64bd1 Muchun Song     2026-09-08  508          if (!page)
> > 4917f55b4ef963 Joao Martins    2022-04-28  509                  return =
-ENOMEM;
> > 4917f55b4ef963 Joao Martins    2022-04-28  510
> > 8fbaacc4a64bd1 Muchun Song     2026-09-08  511          if (reuse_compo=
und_section(start_pfn, pgmap))
> > 4917f55b4ef963 Joao Martins    2022-04-28  512                  return =
vmemmap_populate_range(start, end, node, NULL,
> > 8fbaacc4a64bd1 Muchun Song     2026-09-08  513                         =
                       page_to_pfn(page), flags);
> > 4917f55b4ef963 Joao Martins    2022-04-28  514
> > 8fbaacc4a64bd1 Muchun Song     2026-09-08  515          size =3D min(en=
d - start, (1UL << order) * sizeof(struct page));
> > 4917f55b4ef963 Joao Martins    2022-04-28  516          for (addr =3D s=
tart; addr < end; addr +=3D size) {
> > 55896f935a60b9 Gautam Menghani 2022-06-12  517                  unsigne=
d long next, last =3D addr + size;
> > 4917f55b4ef963 Joao Martins    2022-04-28  518
> > 4917f55b4ef963 Joao Martins    2022-04-28  519                  /* Popu=
late the head page vmemmap page */
> > d1d11861d8a018 Muchun Song     2026-09-08  520                  pte =3D=
 vmemmap_populate_address(addr, node, NULL, -1, flags);
> > 4917f55b4ef963 Joao Martins    2022-04-28  521                  if (!pt=
e)
> > 4917f55b4ef963 Joao Martins    2022-04-28  522                         =
 return -ENOMEM;
> > 4917f55b4ef963 Joao Martins    2022-04-28  523
> > 4917f55b4ef963 Joao Martins    2022-04-28  524                  /* Popu=
late the tail pages vmemmap page */
> > 4917f55b4ef963 Joao Martins    2022-04-28  525                  next =
=3D addr + PAGE_SIZE;
> > d1d11861d8a018 Muchun Song     2026-09-08  526                  pte =3D=
 vmemmap_populate_address(next, node, NULL, -1, flags);
> > 4917f55b4ef963 Joao Martins    2022-04-28  527                  if (!pt=
e)
> > 4917f55b4ef963 Joao Martins    2022-04-28  528                         =
 return -ENOMEM;
> > 4917f55b4ef963 Joao Martins    2022-04-28  529
> > 4917f55b4ef963 Joao Martins    2022-04-28  530                  /*
> > 8fbaacc4a64bd1 Muchun Song     2026-09-08  531                   * Reus=
e the shared page for the rest of tail pages
> > ee65728e103bb7 Mike Rapoport   2022-06-27  532                   * See =
layout diagram in Documentation/mm/vmemmap_dedup.rst
> > 4917f55b4ef963 Joao Martins    2022-04-28  533                   */
> > 4917f55b4ef963 Joao Martins    2022-04-28  534                  next +=
=3D PAGE_SIZE;
> > 4917f55b4ef963 Joao Martins    2022-04-28  535                  rc =3D =
vmemmap_populate_range(next, last, node, NULL,
> > 8fbaacc4a64bd1 Muchun Song     2026-09-08  536                         =
                     page_to_pfn(page), flags);
> > 4917f55b4ef963 Joao Martins    2022-04-28  537                  if (rc)
> > 4917f55b4ef963 Joao Martins    2022-04-28  538                         =
 return -ENOMEM;
> > 4917f55b4ef963 Joao Martins    2022-04-28  539          }
> > 4917f55b4ef963 Joao Martins    2022-04-28  540
> > 4917f55b4ef963 Joao Martins    2022-04-28  541          return 0;
> > 2beea70a3edc03 Joao Martins    2022-04-28  542  }
> > 2beea70a3edc03 Joao Martins    2022-04-28  543
> >
> > :::::: The code at line 507 was first introduced by commit
> > :::::: 8fbaacc4a64bd1bfbfb11bfb48b5db3f4943cbd7 mm/sparse-vmemmap: swit=
ch device DAX to shared tail vmemmap pages
> >
> > :::::: TO: Muchun Song <songmuchun@bytedance.com>
> > :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
