Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C547D1DA3C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 22:02:57 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59b4ec8d9c1so3548607b3.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 15:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1694642576; x=1695247376; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4SsNeA7U0usJeRe6/MvYC8slcbYiO1urihjwDxXGIg=;
        b=FQDNWZzXHP2K9KahocAckesKfL+mSu1FGPalaGlIs7Rd8OzMmtN1+8G/SfSITJArsE
         65WPL1zj5i1nK2rDdVLZZfqIBUp5vs1/8xGF5GhDJRmltNqKHEdho+DQOQXvBLl5gnBY
         JuqXHKcClojCKA/KiWLy5ivjcvEiJaDVZ/lCoXnu//uG/DYjig/rSI/h/t4WnA8s9+ms
         WnxZJ5FXwt75hBzShVinPWcw/R/hOToIYnEFrtG+30kAkEaXQvuLlMp1PXCVjcKzDGhR
         iN5o46kzTL5zZC4feQ6SAY16RnzZWtdCIJkMzch40DhWeVgqBkvyrdebqTtwy4Iu7gZo
         WH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694642576; x=1695247376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4SsNeA7U0usJeRe6/MvYC8slcbYiO1urihjwDxXGIg=;
        b=jPNgodVXSkFE6lQfQnX1F0KltQFOwj/0dVS+Z3OzTQcwZxmcM9wh4tJS3viYFZi1ng
         ZoUS9sXG9MN79f2gUlLwLnM7rTzyx2qkLaW1w5BykEuBfP03NARYu/EtCMRyncefVkWu
         OLSJF8jajUt3I1YjIS5ZTZrKqfbvjA6nvLAzGeevM78NvYyYWXflJGkVQLplxsFsgo0P
         zcuEeT6AIzaIxTBQT+0k2poOtiork7GGaCLc6zbqG1/4Qz6ic9bLUiNBIZnZ9Yvi+7oq
         D+ClJ46jhkNIonzzhawRlciblfQEDLryegdi+hq8unMB1OkYe41avtzw9wlRPVfEbD6F
         eoAQ==
X-Gm-Message-State: AOJu0YxqXV2XWmR2xSLPbB8LRFYLY3/dxgcBROJ6nU9KZlOMkBC16LB0
	6AnhrTx1eWghKYgGiJrS+rvGncBobxusgxoe9fBF
X-Google-Smtp-Source: AGHT+IEWoV5AQmrQ+WZDEiLviSL6/m45o/xQQJ5rA2gxQNy6tVzjhvfWH1S1L3H9j4tZAE0UGwJ0pkSfgQONBfyaGzQ=
X-Received: by 2002:a0d:e406:0:b0:586:9ce4:14e8 with SMTP id
 n6-20020a0de406000000b005869ce414e8mr3142470ywe.52.1694642576622; Wed, 13 Sep
 2023 15:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZOWtBTKkfcc8sKkY@gmail.com> <202308242024.q4KF0YIN-lkp@intel.com>
In-Reply-To: <202308242024.q4KF0YIN-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 13 Sep 2023 18:02:45 -0400
Message-ID: <CAHC9VhRWL6VDLGVU_L=v_T7KzAf911YJvy8_V2NVUE+Bp-i0Og@mail.gmail.com>
Subject: Re: [PATCH] lsm: constify the 'mm' parameter in security_vm_enough_memory_mm()
To: kernel test robot <lkp@intel.com>
Cc: Khadija Kamran <kamrankhadijadj@gmail.com>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Serge Hallyn <serge@hallyn.com>, 
	James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, 
	selinux@vger.kernel.org, ztarkhani@microsoft.com, alison.schofield@intel.com, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 9:04=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Khadija,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on pcmoore-selinux/next pcmoore-audit/next linus/m=
aster v6.5-rc7 next-20230824]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Khadija-Kamran/lsm=
-constify-the-mm-parameter-in-security_vm_enough_memory_mm/20230823-145455
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ev=
erything
> patch link:    https://lore.kernel.org/r/ZOWtBTKkfcc8sKkY%40gmail.com
> patch subject: [PATCH] lsm: constify the 'mm' parameter in security_vm_en=
ough_memory_mm()
> config: arc-randconfig-001-20230824 (https://download.01.org/0day-ci/arch=
ive/20230824/202308242024.q4KF0YIN-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230824/202308242024=
.q4KF0YIN-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308242024.q4KF0YIN-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/util.c:928:5: error: conflicting types for '__vm_enough_memory'; ha=
ve 'int(struct mm_struct *, long int,  int)'
>      928 | int __vm_enough_memory(struct mm_struct *mm, long pages, int c=
ap_sys_admin)
>          |     ^~~~~~~~~~~~~~~~~~
>    In file included from mm/util.c:2:
>    include/linux/mm.h:3199:12: note: previous declaration of '__vm_enough=
_memory' with type 'int(const struct mm_struct *, long int,  int)'
>     3199 | extern int __vm_enough_memory(const struct mm_struct *mm, long=
 pages, int cap_sys_admin);
>          |            ^~~~~~~~~~~~~~~~~~

It looks like you will also need to update the __vm_enough_memory()
definition to take a const mm_struct parameter.  I looked quickly at
the function just now and I don't think that will be a problem.

--=20
paul-moore.com
