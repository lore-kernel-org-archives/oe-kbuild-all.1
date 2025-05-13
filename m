Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA271A304A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157639; cv=none; b=Yf7JUpLktZGO+VYicO6sIL4GbVNJWoUwyyP/oHZOs1ChaL3W+/vCHxU6AezCz54S9XZbRrQ7OL93bO9SP998Wrx6XZEyrYk2XzhqJxBH8L9ZRSOtIgVCyWYA7tK/7hQo9dUX6OoJBbOuCWYqc60+7UEV5/xcl/t4M8V1Ps4L+Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157639; c=relaxed/simple;
	bh=WiJK3c9zkXuiOXWSx+YJehk78mTgdznH2Z+RncA9zkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMuIzhGAICv0+emodlMDJy86wBIu87gu73yyAQDHTzfk8tBxa2adzANv9gp1YFnOfJ5ZiHXgfCAXQtX2RnlpSTw+YbxyERK9b/c9CNu+BNk3yW0RnIeohUTkOPiFvBa7DKmSFajHlBf9sP29oBLeQZZzcV9dvFipmIT5ABvSt7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b6AQ3ena; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b6AQ3ena"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-48b7747f881so24411cf.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 10:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747157636; x=1747762436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGZhE1s2JEZR2aghl+eaXgLkZsMZTnt2KxW/7xIZ5zM=;
        b=b6AQ3ena0KACi5KIkZR3xFlgwNXflgp/dq85mZAkrURUt4ZGZOEteU12EPqEmfwt3r
         EAGCKy81ju19JCi7y0N2bMIh9Tp44IKriWFyp5R4AyNfzR58D/3gKuTJIheD2NBs1lIU
         mIicc7pYJ97hUGsMi3r54I4Lx4M0+dYoOT9ZXOJPpPmYI2ZGsKrMyzXQ4bB3n+k9hbvg
         0ipoGVI/06h13lM+LIQplZ6iBeBPk1aiQ0nE6ZIAonWuVdq4JEkJThLr2SX6jgxsDd28
         NlhuS69bRQxkuvHOUk2XE1HKz63jDbqLN6+U0ILPUvza5GK7XypMoU6RPVWVAYtzNU9s
         Nupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747157636; x=1747762436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGZhE1s2JEZR2aghl+eaXgLkZsMZTnt2KxW/7xIZ5zM=;
        b=LvQL6ZlzjNHiOLGh5TuEuUEWqOSmhGjIv0DiN8U849FbOfZsiN7KNw7skgd3pgwI/6
         FMso+iyxF/sqIaszYAv0OoOJMizNy3+qSGq1P0fJUQuk634ONwuiywXmSAoRYRvg0lwr
         AVZC0tvhSdnPsqa6RXjTAx5QMAMDPU4ABjxYPyoSc3TW0QHKVJ7+j1xhXn36b1hNBbuK
         qr78hd+laQDZoSwWpChWJmW+OERkyac1R8hvllkmSD8tUUykfuNFR91MP2tLst45LoCA
         rN2M7VFdpMAej/NDjgONLn2uauOPsYmS4c86fnhxBS25BgS5bF4/fsOLxVHTogkxBCZm
         zWoA==
X-Forwarded-Encrypted: i=1; AJvYcCW6hstF42aZtX5UBjXYNUYGJjK7SY3qkVnk6vt03x2jRRGcEv7ExX7WItqqa2pGgNZymT2EwWDkbCryqANb@lists.linux.dev
X-Gm-Message-State: AOJu0YyMKTiZnR2OGzWzibnD7XcW64z/4IWllJbxLMhG2qslOGfOXUUe
	WizpRPfcCCFzgDZBg7ZPoFdKdnscB9TBQtSJqIsQIL/nlfgv1eQyfPfNFNqsLH+oXjFKgpBd/EM
	gmPdbyBcfzsIWDwIUuPvWHc3TTwfZzuDT4EoUFVJn
X-Gm-Gg: ASbGnctHgbNCg7lMuFsjDHvYN5K22MhuS1R5SJY1O7mDBX5IV3U8MglA3ysTG3MKTX0
	9jQ0/wkN2mY8d5m6COlAenKNU6lxpPfM7VZHjDacqZvSSjh6bFf0VaEHgUs1TVSCb1cTfWZQeFH
	7TGPTFkY0F622KvxSPgfnVPDxX46Go+K7nbQ==
X-Google-Smtp-Source: AGHT+IGR+aRkPDQu30C21Yg15jM/Rvta9kt+tqUIrVd3aCPyFeFOfxhT65b2G1ZByAMG9Pqd6bcFcqMCzMjko1MYtA0=
X-Received: by 2002:ac8:598d:0:b0:466:8c23:823a with SMTP id
 d75a77b69052e-494898efdb9mr4013011cf.17.1747157635413; Tue, 13 May 2025
 10:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250510010338.3978696-1-jyescas@google.com> <202505110035.wtOWnL8o-lkp@intel.com>
 <A3E9017A-7282-4BF9-AC60-E2C74EB68980@nvidia.com> <CAJDx_rj2QpiQkLoJM0x-WOD5nJQVLDbsFNm4-xZ9SfAq_f1SBw@mail.gmail.com>
 <2513BE19-5527-45A4-8BE8-A447B53654C0@nvidia.com> <9A5BA016-179F-4BFF-AB1E-61F39CA0C1C2@nvidia.com>
In-Reply-To: <9A5BA016-179F-4BFF-AB1E-61F39CA0C1C2@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 13 May 2025 10:33:43 -0700
X-Gm-Features: AX0GCFssEtVKMlvc2w89Raz7x1SKnlM6TwuuCt_fA0gC2KTM19wyfhtp99168uo
Message-ID: <CAJDx_rjE5mzxcXHF5beL-9w-S0EaqEEehPNkLgyWHSp91LuS-A@mail.gmail.com>
Subject: Re: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, tjmercier@google.com, isaacmanjarres@google.com, 
	surenb@google.com, kaleshsingh@google.com, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 9:52=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 13 May 2025, at 12:47, Zi Yan wrote:
>
> > On 13 May 2025, at 12:41, Juan Yescas wrote:
> >
> >> On Tue, May 13, 2025 at 8:08=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
> >>>
> >>> On 10 May 2025, at 13:16, kernel test robot wrote:
> >>>
> >>>> Hi Juan,
> >>>>
> >>>> kernel test robot noticed the following build errors:
> >>>>
> >>>> [auto build test ERROR on linus/master]
> >>>> [also build test ERROR on v6.15-rc5]
> >>>> [cannot apply to akpm-mm/mm-everything next-20250509]
> >>>> [If your patch is applied to the wrong git tree, kindly drop us a no=
te.
> >>>> And when submitting patch, we suggest to use '--base' as documented =
in
> >>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >>>>
> >>>> url:    https://github.com/intel-lab-lkp/linux/commits/Juan-Yescas/m=
m-Add-CONFIG_PAGE_BLOCK_ORDER-to-select-page-block-order/20250510-090501
> >>>> base:   linus/master
> >>>> patch link:    https://lore.kernel.org/r/20250510010338.3978696-1-jy=
escas%40google.com
> >>>> patch subject: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select =
page block order
> >>>> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archiv=
e/20250511/202505110035.wtOWnL8o-lkp@intel.com/config)
> >>>> compiler: powerpc64-linux-gcc (GCC) 14.2.0
> >>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/=
archive/20250511/202505110035.wtOWnL8o-lkp@intel.com/reproduce)
> >>>>
> >>>> If you fix the issue in a separate patch/commit (i.e. not just a new=
 version of
> >>>> the same patch/commit), kindly add following tags
> >>>> | Reported-by: kernel test robot <lkp@intel.com>
> >>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505110035.wtOWnL8=
o-lkp@intel.com/
> >>>>
> >>>> All errors (new ones prefixed by >>):
> >>>>
> >>>>    In file included from include/linux/gfp.h:7,
> >>>>                     from include/linux/xarray.h:16,
> >>>>                     from include/linux/list_lru.h:14,
> >>>>                     from include/linux/fs.h:14,
> >>>>                     from include/linux/compat.h:17,
> >>>>                     from arch/powerpc/kernel/asm-offsets.c:12:
> >>>>>> include/linux/mmzone.h:53:2: error: #error MAX_PAGE_ORDER must be =
>=3D PAGE_BLOCK_ORDER
> >>>>       53 | #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
> >>>>          |  ^~~~~
> >>>>    make[3]: *** [scripts/Makefile.build:98: arch/powerpc/kernel/asm-=
offsets.s] Error 1
> >>>
> >>> In this config, CONFIG_ARCH_FORCE_MAX_ORDER is set to 8, lower than
> >>> the default PAGE_BLOCK_ORDER value, 10. I wonder if the error should
> >>> be changed to ignore CONFIG_PAGE_BLOCK_ORDER when MAX_PAGE_ORDER is
> >>> set by CONFIG_ARCH_FORCE_MAX_ORDER and give a warning instead.
> >>
> >> In ARMv8, MAX_PAGE_ORDER is set up by CONFIG_ARCH_FORCE_MAX_ORDER
> >> and CONFIG_PAGE_BLOCK_ORDER is also set up, so we need to take into ac=
count
> >> CONFIG_PAGE_BLOCK_ORDER. For other architectures, the default will be:
> >> CONFIG_ARCH_FORCE_MAX_ORDER =3D CONFIG_PAGE_BLOCK_ORDER.
> >
> > It seems that the Kconfig =E2=80=9Crange 1 ARCH_FORCE_MAX_ORDER if ARCH=
_FORCE_MAX_ORDER=E2=80=9D
> > is not working. The above powerpc-allmodconfig has CONFIG_ARCH_FORCE_MA=
X_ORDER
> > set to 8 and CONFIG_PAGE_BLOCK_ORDER is set to 10, leading to the compi=
lation
> > error.
>
> You can get the same config by running =E2=80=9CARCH=3Dpowerpc make allmo=
dconfig=E2=80=9D.
>

Thanks, that works!

> >
> >>
> >> Is there any valid case where the MAX_PAGE_ORDER needs to be smaller t=
han
> >> the page block order?
> >
> > I am not aware of any.
> >
> >>
> >> Thanks
> >> Juan
> >>>
> >>>>    make[3]: Target 'prepare' not remade because of errors.
> >>>>    make[2]: *** [Makefile:1275: prepare0] Error 2
> >>>>    make[2]: Target 'prepare' not remade because of errors.
> >>>>    make[1]: *** [Makefile:248: __sub-make] Error 2
> >>>>    make[1]: Target 'prepare' not remade because of errors.
> >>>>    make: *** [Makefile:248: __sub-make] Error 2
> >>>>    make: Target 'prepare' not remade because of errors.
> >>>>
> >>>>
> >>>> vim +53 include/linux/mmzone.h
> >>>>
> >>>>     46
> >>>>     47        /*
> >>>>     48         * The MAX_PAGE_ORDER, which defines the max order of =
pages to be allocated
> >>>>     49         * by the buddy allocator, has to be larger or equal t=
o the PAGE_BLOCK_ORDER,
> >>>>     50         * which defines the order for the number of pages tha=
t can have a migrate type
> >>>>     51         */
> >>>>     52        #if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
> >>>>   > 53        #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
> >>>>     54        #endif
> >>>>     55
> >>>>
> >>>> --
> >>>> 0-DAY CI Kernel Test Service
> >>>> https://github.com/intel/lkp-tests/wiki
> >>>
> >>>
> >>> Best Regards,
> >>> Yan, Zi
> >
> >
> > Best Regards,
> > Yan, Zi
>
>
> Best Regards,
> Yan, Zi
