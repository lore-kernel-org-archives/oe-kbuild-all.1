Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3422309AC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 21:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731533663; cv=none; b=lf5REP7/dk9bxh9lArvvQVMDKU7oWD83pEPq3ByM6VCrYhekieAXq2jIPp5YbZjHuy9VBqtKOfgoRE+EyxiwW6cxXU8LRk2HjC9yUv5i3tZoABsHqq84Snsvv/07kVn/kuldKKfSa3qHiUH5tjHFJPAmstBacJaqSg5FnGs+MII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731533663; c=relaxed/simple;
	bh=YQUGDO3Cta2CcEkmesoEKTiVe3nWFN/7LLbF1A3X258=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHnHe+s+HVgCjDPa/4nRbPeDCmZRy9goqjFyW97os3YXaL15JV/PAgqrVj++IQiNWlnbUZmkPwwswYQlkX5EELOXx9B3uP5UabxMoil8J/BD8n174rCC+FGFKbewjmRAWEA/YSmTMvkM32oqjWI52eiPx+9jRQc1wPexwnYiuHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dK0c60yR; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dK0c60yR"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-288acc703c8so333769fac.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 13:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731533661; x=1732138461; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h//6f6yRnsv+Kcuje0jdigABLyMDMKttVZvN8rP9+9U=;
        b=dK0c60yRsrp/UfY0HjK+X5YUQm9nepVU2pGcnsTLrIUcNSMQB34C4UWDlpzg0Stbeq
         SyBjVLalapeRBG7UPpVL+1eokmXJkZdHFf6MHiyN0ZO1cjrSQyEjK7jAvmvpTOAxx3J/
         zJUEVYpWBJeL+sj+f5eYubbM6rgkabmnjOINE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731533661; x=1732138461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h//6f6yRnsv+Kcuje0jdigABLyMDMKttVZvN8rP9+9U=;
        b=Cj10BA7NrAw7WvJc+JenTiN4mjBcbu1Q7kpbqQyNdsxCvnCePgVKVQzM6v+zClLYKW
         zdsiIS/hVhbbQ79ygI05fWFaXRb63xO1Zvzgyk6PVGhGJTExFgE2MxACQJ57MKA5fCVa
         xVu5DZRQKj5FnNu4FqzyQfLUG1H5rcxdp/1HRdbCHUrgPdvDlKkaglqgPtZ+X41ywgp3
         a8FWpbBQZlo/Yv4oftoBB+pbfb8LgelvxbjNwrDMbkgxyqe5XQKVQEze8O6h2SlfLO1S
         q/AQmXzqVzMkW+ultLI8JItHdNXu1Wo4NC0Qbp71GXOVP3vFSTsQalT9MYgyq7/wtopr
         E3HA==
X-Gm-Message-State: AOJu0Yylq8lgRhyRL4tgNBBCjbq9SLcT14jjWJokZd+l8ZkWNNlk+mjO
	qUOd/3BE27NvaLwFREpGxHebxfj7wiyqHUcBOJGpToi6jswDxG/2dmwu02kNXG6fFSpxfd3Orae
	4I3k1XP17TCnuT0MHbNk6AQKE3PHbnjqpFOwDRo0j4dfib28=
X-Gm-Gg: ASbGncuOHL+nwef4C6LZ4TKHSlRfQXEM+0wX8WmTNPhhke2+9lNjoT0snhA/xYllhvA
	xCT3F4KbeNyx7KL4E2AQbvKYdtLnFSfHO
X-Google-Smtp-Source: AGHT+IFcP1sPXt8B0fq2a59ffiTmxjVRbfc/n+s0Ve6q/MxIM2ZSLrBRUM64VoyjvMMvU0ZrE+pbmmGawsDTAbRR4vU=
X-Received: by 2002:a05:6870:ad93:b0:277:db1c:7c6a with SMTP id
 586e51a60fabf-295601cec47mr3991647fac.7.1731533661090; Wed, 13 Nov 2024
 13:34:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014215022.68530-2-jeffxu@google.com> <202410181124.TWvcRfi7-lkp@intel.com>
In-Reply-To: <202410181124.TWvcRfi7-lkp@intel.com>
From: Jeff Xu <jeffxu@chromium.org>
Date: Wed, 13 Nov 2024 13:34:10 -0800
Message-ID: <CABi2SkXrFrF_LUGZ-b8oT+5056w9mpaf3Y9fAW9E6z7m2fyupw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] exec: seal system mappings
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 8:44=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on brauner-vfs/vfs.all perf-tools-next/perf-tools-=
next tip/perf/core perf-tools/perf-tools linus/master v6.12-rc3 next-202410=
17]
> [cannot apply to kees/for-next/execve kees/for-next/pstore kees/for-next/=
kspp tip/x86/asm acme/perf/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/jeffxu-chromium-or=
g/exec-seal-system-mappings/20241015-055145
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ev=
erything
> patch link:    https://lore.kernel.org/r/20241014215022.68530-2-jeffxu%40=
google.com
> patch subject: [RFC PATCH v2 1/1] exec: seal system mappings
> config: i386-allyesconfig (https://download.01.org/0day-ci/archive/202410=
18/202410181124.TWvcRfi7-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241018/202410181124.TWvcRfi7-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410181124.TWvcRfi7-lkp=
@intel.com/
>
This is fixed in V3.

> All errors (new ones prefixed by >>):
>
>    kernel/events/uprobes.c: In function 'xol_add_vma':
> >> kernel/events/uprobes.c:1507:70: error: 'VM_SEALED' undeclared (first =
use in this function); did you mean 'VM_SHARED'?
>     1507 |                                 VM_EXEC|VM_MAYEXEC|VM_DONTCOPY=
|VM_IO|VM_SEALED,
>          |                                                               =
       ^~~~~~~~~
>          |                                                               =
       VM_SHARED
>    kernel/events/uprobes.c:1507:70: note: each undeclared identifier is r=
eported only once for each function it appears in
>
V3 revert to V1's behavior for uprobes, so no longer have changes in uprobe=
s.c
