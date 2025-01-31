Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E044838DF9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343134; cv=none; b=O8FysyOQP0c3bCN+oINVDlBRg/332RzuEgFErduc+0ljwOwcDppyBJ7NDFk0/cOY6wjDpVjJMlrrjG65K90YxHbm6uNLkaaEgOqPva6SWnpqK2KsE43kFRZP82TjZFEv5XFNvq7piB8uchRIpuJ04PQkpfeoLgaC9sfyyoO8mtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343134; c=relaxed/simple;
	bh=8b5K4eTs7j4HTKuwvqDLICjjEywPxBait7ULGqVJgoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VktgLOLs2bfIpsYd7RwZGbkU+AP51e6ls//p0r9d1sjbPLj36t6uI7iBy3w7WKeMf06Vm5Md1xE7TOs96SjG6/Y7EismSN0H0al5MePREgHHvxURyHQG75nZ9hvKtD3jMyizl2vEfTvWHdjWjll9jLNcC7KRpx3Sb15tSpvtDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pDOuYMh1; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pDOuYMh1"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4678c9310afso215211cf.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 09:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738343131; x=1738947931; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKtUhrlHsP08/pXZgxAid4Bxl0yRQ5OF0auAQ8mVsBQ=;
        b=pDOuYMh12E353bDTIpR9gc6fx+lQohHA7FmKs9rbcomQjda0styIO41MK1IoWpmmwV
         O0EjIRi79O/t7oLr15K+y/emVMkbQRqWKadrFSlYvMtk6v4A8Jz7fftuQjzCOstoXCKZ
         5J7d6HUFQmMr+E9zDBbtHmyxvNS6OCa1wecOLf4rUhq76JKp3CGRMN6Op4eUU5oSg9xR
         1KJuMvT2fQcKvBeOveul/J9Q7gbwTR6vP2rATJHwb+KK7mFAAvZsHL+dn6DbwJNS2b0+
         wK864D6DwJCJaQOLK1fLwt5SsBSXofXukUR0z9NIxfaaqehUpeQLsAY4n+VJYCnc+mRf
         s7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738343131; x=1738947931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKtUhrlHsP08/pXZgxAid4Bxl0yRQ5OF0auAQ8mVsBQ=;
        b=Kmh76pJwpkrqoLsFoOcx1l6LjmYb78S0M+YkcrGS7NINht37DKQHqYo4IDZLUauJ0u
         Q5oo7xYwNgU/PgxzKyBce/kCGzKcZeJMPgCIRrY++Ap+qyRUF3MJ7lVVyxo1R+8gYiHC
         KT1uSOT0nK8sGVB3LD1dL5vc9ftdHBKGDYhYmc6VSIn/a7RBIrVlnSt4UNz3h20USsVl
         uccIh704XmhR9MWTZ6IqWqTaPO6Vx5+1Wim/nT+z6kHIG3xrvlR2ZSlByBXc2mzYDROv
         0IKKi4uttjKLeQ1QA7eKfo6iRqZIIipZMvqmvBRy4Lbtc4ZYImljAaNTg+DykBwyR+73
         IQhA==
X-Gm-Message-State: AOJu0YzgFQwbrR+1xETZUw/a48LSptBxmaVLDcEvjRKwwsb94lg8z1ih
	cT+DoKyzugFVr6/jIYvH20AeGH2ZjKRHR6K8e7Zn06kMFREvdx17u2hKfez7cgxJXSmJInAyry/
	BTJELRWG+UWZudyBsZseG0RjaLlioe1EIgaYW
X-Gm-Gg: ASbGncumIz6hQe68AOo+9g5nbu1UE+Zx2iyQDBvHCn5NOCZj9N+WEemWpGadj2HXYyC
	XGTtdiVHMcz2ljLAtQG1E8vL/YCHgIZojTKV7l3AdD52ceiBNdraUN1hhFn4zFSuRKFO/dg==
X-Google-Smtp-Source: AGHT+IG5kD3mTUC0qq4vRxdf0ZP3lrbaHu+twtomlZ3Rf/aIGFqPb5UtkV0SoC+CLSYIW3Tq6bHSc/JE2uuuz8eeSPE=
X-Received: by 2002:ac8:574e:0:b0:467:7f81:ade0 with SMTP id
 d75a77b69052e-46feaf58398mr3934631cf.24.1738343130559; Fri, 31 Jan 2025
 09:05:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501311125.wbG1DN2B-lkp@intel.com>
In-Reply-To: <202501311125.wbG1DN2B-lkp@intel.com>
From: Frank van der Linden <fvdl@google.com>
Date: Fri, 31 Jan 2025 09:05:19 -0800
X-Gm-Features: AWEUYZmnevuUjA2W55NNqdxwGVSB8wdVdNZqJzjfOWpX3BQwh7VTEbRczrOkPXQ
Message-ID: <CAPTztWb6kO_OkoNz6xHKa-F0VFawCOPc2BO34cRzidnVYCj1ow@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 61/88] mm/cma_debug.c:189:55: warning: '%d'
 directive output may be truncated writing between 1 and 11 bytes into a
 region of size 3
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 7:13=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   495206a68b359eb6117d0860861578113bbb94e7
> commit: 77cbd63e91fa6c5f6157a30e61a380b6c47c1443 [61/88] mm, cma: support=
 multiple contiguous ranges, if requested
> config: x86_64-buildonly-randconfig-003-20250131 (https://download.01.org=
/0day-ci/archive/20250131/202501311125.wbG1DN2B-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250131/202501311125.wbG1DN2B-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501311125.wbG1DN2B-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    mm/cma_debug.c: In function 'cma_debugfs_add_one':
> >> mm/cma_debug.c:189:55: warning: '%d' directive output may be truncated=
 writing between 1 and 11 bytes into a region of size 3 [-Wformat-truncatio=
n=3D]
>      189 |                 snprintf(rdirname, sizeof(rdirname), "%d", r);
>          |                                                       ^~
>    mm/cma_debug.c:189:54: note: directive argument in the range [-2147483=
644, 2147483646]
>      189 |                 snprintf(rdirname, sizeof(rdirname), "%d", r);
>          |                                                      ^~~~
>    mm/cma_debug.c:189:17: note: 'snprintf' output between 2 and 12 bytes =
into a destination of size 3
>      189 |                 snprintf(rdirname, sizeof(rdirname), "%d", r);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +189 mm/cma_debug.c
>
>    168
>    169  static void cma_debugfs_add_one(struct cma *cma, struct dentry *r=
oot_dentry)
>    170  {
>    171          struct dentry *tmp, *dir, *rangedir;
>    172          int r;
>    173          char rdirname[3];
>    174          struct cma_memrange *cmr;
>    175
>    176          tmp =3D debugfs_create_dir(cma->name, root_dentry);
>    177
>    178          debugfs_create_file("alloc", 0200, tmp, cma, &cma_alloc_f=
ops);
>    179          debugfs_create_file("free", 0200, tmp, cma, &cma_free_fop=
s);
>    180          debugfs_create_file("count", 0444, tmp, &cma->count, &cma=
_debugfs_fops);
>    181          debugfs_create_file("order_per_bit", 0444, tmp,
>    182                              &cma->order_per_bit, &cma_debugfs_fop=
s);
>    183          debugfs_create_file("used", 0444, tmp, cma, &cma_used_fop=
s);
>    184          debugfs_create_file("maxchunk", 0444, tmp, cma, &cma_maxc=
hunk_fops);
>    185
>    186          rangedir =3D debugfs_create_dir("ranges", tmp);
>    187          for (r =3D 0; r < cma->nranges; r++) {
>    188                  cmr =3D &cma->ranges[r];
>  > 189                  snprintf(rdirname, sizeof(rdirname), "%d", r);
>    190                  dir =3D debugfs_create_dir(rdirname, rangedir);
>    191                  debugfs_create_file("base_pfn", 0444, dir,
>    192                              &cmr->base_pfn, &cma_debugfs_fops);
>    193                  cmr->dfs_bitmap.array =3D (u32 *)cmr->bitmap;
>    194                  cmr->dfs_bitmap.n_elements =3D
>    195                          DIV_ROUND_UP(cma_bitmap_maxno(cma, cmr),
>    196                                          BITS_PER_BYTE * sizeof(u3=
2));
>    197                  debugfs_create_u32_array("bitmap", 0444, dir,
>    198                                  &cmr->dfs_bitmap);
>    199          }
>    200
>    201          /*
>    202           * Backward compatible symlinks to range 0 for base_pfn a=
nd bitmap.
>    203           */
>    204          debugfs_create_symlink("base_pfn", tmp, "ranges/0/base_pf=
n");
>    205          debugfs_create_symlink("bitmap", tmp, "ranges/0/bitmap");
>    206  }
>    207
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

CMA_MAX_RANGES is 8, and it's an snprintf, so no, it will never use
more than 1 digit. But, I can bump up the size of the buffer is that
makes the compiler happier in this case. I'll do that.


- Frank
