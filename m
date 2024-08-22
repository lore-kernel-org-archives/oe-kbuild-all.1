Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D495B1CDFD5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 20:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724359092; cv=none; b=GPLMWPEQxrAp1OcBAQgdJrUM/Gyi7upbjjiT7rE4P+ChSYaoYdiCxBUb8Kr5XueuFHzUYdKs2APZ1eG9LFpwLoCm/5jpG3s7efuiVApVN61Dk8Eml/ux8VnRtotl2IUyzMY7s/+xaZR8ic4ZuGOvs5JjDhVCZdgNh+7/S2F1xQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724359092; c=relaxed/simple;
	bh=Evri7naCroR9lahxFwcbrHStBQ6wov+kTkYnj+luTWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYBdeSUaNbURAGEXqyNDuxKsGeBUryKLTkbgRKM6w9I1k+4wDZ1HarBaYGIeRP96viSqmRshrv0s9TCcKRjlBqZDfg2urKJzC11E0iGmRdhXrqOjUd2QbrtJ8TpIWjqkKOD9rS194mcZfvjRSAJtQgLJAzBN5j7yfqs9oeF0ZkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L91BXaGt; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L91BXaGt"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4518d9fa2f4so93841cf.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 13:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724359089; x=1724963889; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qNu1bWRM+IYLjLL4EurjiUj14o65t8ZK24RLE6bujU=;
        b=L91BXaGtIDQghEnZV3rt46NYMEY0SOv7XHoWo+yLmSLoInqFp7Yoo59LtINFk9Dd/4
         mB7CaI0pFmzBhityQDZzSHIFrp1C7pS+oiJsjGEhNCDBzCctJwPH1JSkRYC20hTCpEXe
         K6x5v68KYDue7jAhHrK9LF7P0PsXkdLoelDAVBuFWBeuXi9LIY+heyJUPTk7LG002bZe
         rQ1n4IJ2/7oyPydVfdTR1HV0DwIHalqIVn9ulooG6FHI6NDe2U7JhLfT2IHELAqAmAGN
         OqMXwiPx2zOCbFIFraRPagCPUUMnb4mJxxYNzmX3Z1sVMNdOGzfC4/eQ8NQKaXuO6eiy
         escg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724359089; x=1724963889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qNu1bWRM+IYLjLL4EurjiUj14o65t8ZK24RLE6bujU=;
        b=oO3wuDNFxB9C4SOR5r9qhtcw9PgcT8m69ea3gGGPlxE42yyDMM0Ixv3QvfJ4fezvH3
         CkYgyx1LTCWcRsehhvvk2IgqOta3bXOijnYwUuMlcYNPJeP3WDwWZvVzerNFTpqJq+40
         BCHrQrlHl1MYJJZ3/3Tq7jGk8c31MMlDu+pMn8HxhHwiScL1ykoyyjx5ME+8Kao9XPIM
         XsO6pCi8VAFMEXm58bQAtepALIsjkVlD+p9mj5HAj1yYn5BROf+NjIj4G/yUlO5QCE4f
         ROoYSzbf3qsUNSlnx7bKweNFjfsxpjnJCnnqH1581XPE+YyDEbuJ7+31tQu8htg12L5U
         zySg==
X-Forwarded-Encrypted: i=1; AJvYcCXVmHGTGddEFbBs5F2LcSBhG65xXr1hm8jr+GhNVdKn4ODX3TDoYJSRooKF22rbMylq0HMNFbc67ElQ7yhO@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbamfr93o3v7LgI+DdD5Vv1cZtD9W5bRFrXUbGEVITg03KWVPW
	V+vdnu3an2mXT7Mry05H4xYItg+Wl38yjTb/bVO9OZA1jdyFWetIWi8QcxksSsbNJNy7jeHyGXL
	8KB0F7ry7nVrH5Z3EN3XJsPwihaUlD6xtcHls
X-Google-Smtp-Source: AGHT+IEaBarxroFXMGcX1lFxS9XBFBWzNav8ZNR1PfKAf4ThZZ7AlAAHwET6L8F83xkVQcUJZbqjIrDIEulx8dlMH8M=
X-Received: by 2002:a05:622a:24d:b0:441:5e6c:426c with SMTP id
 d75a77b69052e-45509e77c44mr29041cf.17.1724359088361; Thu, 22 Aug 2024
 13:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819151512.2363698-2-surenb@google.com> <202408230151.2tDiQgTC-lkp@intel.com>
In-Reply-To: <202408230151.2tDiQgTC-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 22 Aug 2024 13:37:53 -0700
Message-ID: <CAJuCfpHrb_LAojAFZS0qR=+qnMhswxSewJz7abLQuOceUDNwZA@mail.gmail.com>
Subject: Re: [PATCH 1/5] alloc_tag: load module tags into separate continuous memory
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, oe-kbuild-all@lists.linux.dev, 
	kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, mcgrof@kernel.org, 
	rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, tglx@linutronix.de, 
	bp@alien8.de, xiongwei.song@windriver.com, ardb@kernel.org, david@redhat.com, 
	vbabka@suse.cz, mhocko@suse.com, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	pasha.tatashin@soleen.com, souravpanda@google.com, keescook@chromium.org, 
	dennis@kernel.org, jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com, 
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 11:44=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Suren,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 651c8c1d735983040bec4f71d0e2e690f3c0fc2d]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/alloc_tag-load-module-tags-into-separate-continuous-memory/20240819-231747
> base:   651c8c1d735983040bec4f71d0e2e690f3c0fc2d
> patch link:    https://lore.kernel.org/r/20240819151512.2363698-2-surenb%=
40google.com
> patch subject: [PATCH 1/5] alloc_tag: load module tags into separate cont=
inuous memory
> config: sparc-randconfig-002-20240822 (https://download.01.org/0day-ci/ar=
chive/20240823/202408230151.2tDiQgTC-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240823/202408230151.2tDiQgTC-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408230151.2tDiQgTC-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> lib/alloc_tag.c:16:22: error: storage size of 'unloaded_mod' isn't kno=
wn
>       16 | static struct module unloaded_mod;
>          |                      ^~~~~~~~~~~~
> >> lib/alloc_tag.c:18:22: error: storage size of 'prepend_mod' isn't know=
n
>       18 | static struct module prepend_mod;
>          |                      ^~~~~~~~~~~

Ok, this issue happens when CONFIG_MODULES=3Dn. I'll fix this config in
the next revision. Thanks!

>
>
> vim +16 lib/alloc_tag.c
>
>     11
>     12  static struct codetag_type *alloc_tag_cttype;
>     13  static struct alloc_tag_module_section module_tags;
>     14  static struct maple_tree mod_area_mt =3D MTREE_INIT(mod_area_mt, =
MT_FLAGS_ALLOC_RANGE);
>     15  /* A dummy object used to indicate an unloaded module */
>   > 16  static struct module unloaded_mod;
>     17  /* A dummy object used to indicate a module prepended area */
>   > 18  static struct module prepend_mod;
>     19
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
