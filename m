Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44FB1BC41
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 06:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719468258; cv=none; b=N8l93ri2AlwRYx8IlY9m08P2pBEffxvwrnIkVtn+SUf9YRMfBdYEaI/b8pSzvRODAxem0j4EmTnHy6iRz3UC+Ub1hxV8GcuDODWMJPtGKUXmVaE0OuUi2QBrlU5vjfdWg4ktu0nuB1Y+auYjYKjuJlz0UvvqAfpMwh26e+X/1Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719468258; c=relaxed/simple;
	bh=v5pCreOvdIqh3QFEViJ2F+3YW8l+oc+HAnL+2XoCHCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uxatNhCFrafFjNZh7tOKFOU0tlL2vufhCdPI5MOI6D4xO1esIUXAxqhNM/pdMlOxOtpiyxvPDg4EG4y02N2OxoV8T7cTxg4+4s27EAVTC6Y3EygT7cqjFC4hGLZe4BLPCcSnhOHU8T/uIJnMdOYxauAkJhja02aO/dScXWYxACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alun+jCi; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alun+jCi"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111b0so673048a12.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 23:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719468255; x=1720073055; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmCeSR9NMyE+e7XDrDt2L5uekJY6QB3GzYy57BiFvwA=;
        b=alun+jCihK3I0ULYVVtDqOsMsr/fuA0IAu326tnokVz6YgHmBsM3cAcMXQih5NnzWM
         e0mDOOypTmu78kn01qgLvjUYrjsd5OeiqbTaJ5/O24EPd3KK8FYxOUhNqt9YtR+5YIYJ
         tBMJjKpZ4Q8Fmdl6SA7Osj7k2NECVc5oOQ7QWWBrk24R/yFj21ywOZRwg0tKx0iFMDs1
         5pZ+jHyMU4t39W+B/A7ujP/OWpACqdd3eSkdXbW9chljOTBGIm8mfCt6ghW0Fsv55RvU
         tWroA5AfBFr24mUfCxO7HW0JxyxJ32oLrDvD3yDPmvSyOAH6NPY2Jkx6HXfHGAUb7g/1
         oq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719468255; x=1720073055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmCeSR9NMyE+e7XDrDt2L5uekJY6QB3GzYy57BiFvwA=;
        b=nwHO6sxbBzFndmiUZUwDppc2qla18WsYo2AbTawXFaaUhLxAUeIemWX+Z78lls2V+n
         tRxDkximVisc9s/z6LSGrWtM3Gm6bcgwJ1RRo2vQFeFTnQpk1Ncpcf+XwfK+/CDRi87T
         F5RAqo5/yKHXdMl76BS+lBZt7slpYIp7mFsCXMXnXkvkcPbfCNqV9RbMNa9TIWLGNXOp
         26z2qeg0EGuNrWcq4ibFzNiX8KH3ljbJEak3dFwz/COWTUpsjaj6CR6Jb+VeN3bHii39
         VX3vB7Q1rod0ayE9rTVwNDE2y65hPUuq8bCB2KQk3MLLVgEhZqpoeFdJWXONX0+x9Abf
         NoGA==
X-Gm-Message-State: AOJu0YxNmDiuu9+K7XG71sahTk6NGtPGHX58Dr1NForon3yflYJ1FATN
	6nyAZVAPPXAJNL9ANzi4CEnHtO5rhdPpsSYQbuPuKP4+hnZJJwZ68+1RP2KdM1sfoKjmZNLgsLR
	cn6vPS54p4LHGXNcL/Iu12IJQRHnWpwcpHes=
X-Google-Smtp-Source: AGHT+IGiK3cqdiwJJNS3L5Ut4uoMjBl72jKzBd8iEuSPSJ8fCiAH/hKt6YTpa5gX0P0uhpc1pEwij6SuVHQ/TQQaMH4=
X-Received: by 2002:a50:d55b:0:b0:57d:669:caf2 with SMTP id
 4fb4d7f45d1cf-57d4bd9705amr10605623a12.25.1719468254501; Wed, 26 Jun 2024
 23:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240625110029.606032-3-mjguzik@gmail.com> <202406271204.0A1VPc0v-lkp@intel.com>
In-Reply-To: <202406271204.0A1VPc0v-lkp@intel.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 27 Jun 2024 08:04:01 +0200
Message-ID: <CAGudoHHUe28J7RWRCk4CKpdVWYiDK_k0TaNva0t2E9RZpxDFVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This submission assumes another patch was already applied, it's all
fine on the maintainer branch:
https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=3Dvfs.mi=
sc

On Thu, Jun 27, 2024 at 6:10=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Mateusz,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on viro-vfs/for-next]
> [cannot apply to brauner-vfs/vfs.all linus/master v6.10-rc5 next-20240626=
]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Guzik/vfs-=
add-CLASS-fd_raw/20240625-233347
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-=
next
> patch link:    https://lore.kernel.org/r/20240625110029.606032-3-mjguzik%=
40gmail.com
> patch subject: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, .=
..)
> config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/202=
40627/202406271204.0A1VPc0v-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240627/202406271204.0A1VPc0v-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406271204.0A1VPc0v-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    fs/stat.c: In function '__do_sys_statx':
> >> fs/stat.c:744:39: error: implicit declaration of function 'vfs_empty_p=
ath'; did you mean 'vfs_statx_path'? [-Werror=3Dimplicit-function-declarati=
on]
>      744 |         if (flags =3D=3D AT_EMPTY_PATH && vfs_empty_path(dfd, =
filename))
>          |                                       ^~~~~~~~~~~~~~
>          |                                       vfs_statx_path
>    cc1: some warnings being treated as errors
> --
>    io_uring/statx.c: In function 'io_statx_prep':
> >> io_uring/statx.c:41:45: error: implicit declaration of function 'vfs_e=
mpty_path' [-Werror=3Dimplicit-function-declaration]
>       41 |         if (!(sx->flags =3D=3D AT_EMPTY_PATH && vfs_empty_path=
(sx->dfd, path))) {
>          |                                             ^~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
>
>
> vim +744 fs/stat.c
>
>    724
>    725  /**
>    726   * sys_statx - System call to get enhanced stats
>    727   * @dfd: Base directory to pathwalk from *or* fd to stat.
>    728   * @filename: File to stat or "" with AT_EMPTY_PATH
>    729   * @flags: AT_* flags to control pathwalk.
>    730   * @mask: Parts of statx struct actually required.
>    731   * @buffer: Result buffer.
>    732   *
>    733   * Note that fstat() can be emulated by setting dfd to the fd of =
interest,
>    734   * supplying "" as the filename and setting AT_EMPTY_PATH in the =
flags.
>    735   */
>    736  SYSCALL_DEFINE5(statx,
>    737                  int, dfd, const char __user *, filename, unsigned=
, flags,
>    738                  unsigned int, mask,
>    739                  struct statx __user *, buffer)
>    740  {
>    741          int ret;
>    742          struct filename *name;
>    743
>  > 744          if (flags =3D=3D AT_EMPTY_PATH && vfs_empty_path(dfd, fil=
ename))
>    745                  return do_statx_fd(dfd, flags, mask, buffer);
>    746
>    747          name =3D getname_flags(filename, getname_statx_lookup_fla=
gs(flags), NULL);
>    748          ret =3D do_statx(dfd, name, flags, mask, buffer);
>    749          putname(name);
>    750
>    751          return ret;
>    752  }
>    753
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Mateusz Guzik <mjguzik gmail.com>
