Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E6C1386BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 21:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706218070; cv=none; b=pO0Dmsanaa9bawz2Sb7sx1BhyRSJtrOpSvr5VvKJmigwBmIm/2bSjRrbxX1EZxAO6agpUIrIqBQoErIavGB1d7FP56zq7y0bVK9fU9r2bsxS6TdF1GaF0j1OY6zfrg+PH2y3u95qwhDDvIMXCkRLJ+WmasfOwj1CpDnxKh5nRdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706218070; c=relaxed/simple;
	bh=qif+74dsRh8x1JmdOZHmI+Er/cQeMYAPnSDAnmdk9+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBCJ3vjFpFR55z39gcXeOeTlGZpuvYyltXtcdcrm5Ja43XUlO0/7fReQy2agQMKEZqKibxqbiXR3IXWKylh8N/FFG6Q3+dfs9LWM5uGMquL+Zoku1cTl1fidY6uTeosRA7mky0OPjKhjQQDPL3C7i0Gn2dCDLlj12Ww7iZkYMNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rAAfXPo/; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rAAfXPo/"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5ff84214fc7so70626217b3.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 13:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706218068; x=1706822868; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZctJ95roOKUuWfU+NSbWQYCqifmeEOmcfFL1+Y6gjI=;
        b=rAAfXPo/S+pUCj4DOK3nsMci2x/fXAYmfemkvFUzL8ZWFaL4aDH4l11LBUy/2UUa1N
         61ihtKaXDb8adDtFbfCCJXKqEckjjqM1KuqOUklo9l2ti8cPedqbDBZSlUsiHuLNQdRK
         5rfVGA/7Qop/KvWlfogPbAFU1+y5p8TsnSOW3xzLKawrT39WuGXOKft4WqxWGI9ilkkU
         rAALY5sSfqXDAdtI6SNEkm9UXPXsCsW+XWZ6epy6wLypn6WKw8K8olPQTZmtpCmP4hWp
         AkTMgIvlEftfyfc9ASnWKUHUcCeVl2wvTn0k0mAu003ZlP1yBmOuzXiTBhYQaQ3S9xL9
         8z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706218068; x=1706822868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZctJ95roOKUuWfU+NSbWQYCqifmeEOmcfFL1+Y6gjI=;
        b=vnT4CL211mUQStH4OJwY4oABkfmZaAcLUI+Ds5P2BbG8qlBLjkA3OVOcKtI/sCCACi
         fqvGJw6yGfOEKHLSYxsxUVOWQlAhLMk5rbUThuVZigSiD3TraWJUvdSGpBTIPW42tIkN
         Vpd9oYcvkDNiIfiXZ3PGv9mxFmMp5V8tCx9BqbFPH6maQx9hp6U4WvFqQ+0mR9RMLDEx
         CJHJKVD7KwZt5OzRoqLrrorJIcst1bV2s7e1tqkTpzD54g5b+4TjMT0hbR03cy4ooPJp
         uj8iSAzRvRgbWK4kwLALsD3hlcQGgVt1djBI7IaaV4drDaoDI0Dy4Z5zqcLix1Ovaaa2
         lYyQ==
X-Gm-Message-State: AOJu0YyIczMXJb7JE+QDQ+BCrV/46TAG4DTA9ymT4IH+OLRcl/j1/by4
	qlG+L9pLjP77Yh7bRgChlmepQvU+uc5P8rvDELlRoOF9jv6RWSGINxDGT7dCg0A4elrBEL4FFnt
	YuE5IPOQV1ljvCiJ/SnsaaPi83XR/IAwjYQb59q9RM2z1wr4ek2BS
X-Google-Smtp-Source: AGHT+IEmXticjPa3FlG2Dh2lBl+AYHgKS+ho3uKdSCnB1DWm+1E3AGTlt0wqECyf2xPiOu8a/A8HBbfQHTi7c+RZpTg=
X-Received: by 2002:a81:af19:0:b0:5d7:1941:2c29 with SMTP id
 n25-20020a81af19000000b005d719412c29mr448275ywh.86.1706218067540; Thu, 25 Jan
 2024 13:27:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401251829.0m6Eo4LI-lkp@intel.com>
In-Reply-To: <202401251829.0m6Eo4LI-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 25 Jan 2024 13:27:34 -0800
Message-ID: <CAJuCfpHW2=Zu+CHXL+5fjWxGk=CVix=C66ra+DmXgn6r3+fsXg@mail.gmail.com>
Subject: Re: [linux-next:master 1589/1892] fs/proc/task_mmu.c:143:45: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
To: kernel test robot <lkp@intel.com>, Matthew Wilcox <willy@infradead.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 2:23=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
> commit: 0c30c4cd953025979b7689e49844837f762303ec [1589/1892] mm/maps: rea=
d proc/pid/maps under RCU
> config: x86_64-randconfig-121-20240125 (https://download.01.org/0day-ci/a=
rchive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240125/202401251829.0m6Eo4LI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401251829.0m6Eo4LI-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> fs/proc/task_mmu.c:143:45: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct file [noderef] __rcu **=
f @@     got struct file ** @@

Uh, this is a problem.
I missed that get_file_rcu() is used only with mm->exe_file and
vma->vm_file is not really RCU-safe. It's freed via a call to fput()
which schedules its freeing using schedule_delayed_work(..., 1) but I
don't think that constitutes RCU grace period. Paul, Matthew, could
you please confirm? In the meantime I'm going to ask Andrew to remove
my patchset from mm-unstable to be safe.


>    fs/proc/task_mmu.c:143:45: sparse:     expected struct file [noderef] =
__rcu **f
>    fs/proc/task_mmu.c:143:45: sparse:     got struct file **
>    fs/proc/task_mmu.c: note: in included file (through include/linux/rbtr=
ee.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
>    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in '=
get_vma_snapshot' - unexpected unlock
>    fs/proc/task_mmu.c:264:22: sparse: sparse: context imbalance in 'm_sta=
rt' - different lock contexts for basic block
>    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in '=
m_stop' - unexpected unlock
>    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in '=
smaps_pte_range' - unexpected unlock
>    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in '=
clear_refs_pte_range' - unexpected unlock
>    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in '=
pagemap_pmd_range' - unexpected unlock
>    include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in '=
pagemap_scan_pmd_entry' - unexpected unlock
>    fs/proc/task_mmu.c: note: in included file (through arch/x86/include/a=
sm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
>    arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes =
address space '__user' of expression
>    arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes =
address space '__user' of expression
>
> vim +143 fs/proc/task_mmu.c
>
>    132
>    133  /*
>    134   * Take VMA snapshot and pin vm_file and anon_name as they are us=
ed by
>    135   * show_map_vma.
>    136   */
>    137  static int get_vma_snapshot(struct proc_maps_private *priv, struc=
t vm_area_struct *vma)
>    138  {
>    139          struct vm_area_struct *copy =3D &priv->vma_copy;
>    140          int ret =3D -EAGAIN;
>    141
>    142          memcpy(copy, vma, sizeof(*vma));
>  > 143          if (copy->vm_file && !get_file_rcu(&copy->vm_file))
>    144                  goto out;
>    145
>    146          if (!anon_vma_name_get_if_valid(copy))
>    147                  goto put_file;
>    148
>    149          if (priv->mm_wr_seq =3D=3D mmap_write_seq_read(priv->mm))
>    150                  return 0;
>    151
>    152          /* Address space got modified, vma might be stale. Wait a=
nd retry. */
>    153          rcu_read_unlock();
>    154          ret =3D mmap_read_lock_killable(priv->mm);
>    155          mmap_write_seq_record(priv->mm, &priv->mm_wr_seq);
>    156          mmap_read_unlock(priv->mm);
>    157          rcu_read_lock();
>    158
>    159          if (!ret)
>    160                  ret =3D -EAGAIN; /* no other errors, ok to retry =
*/
>    161
>    162          anon_vma_name_put_if_valid(copy);
>    163  put_file:
>    164          if (copy->vm_file)
>    165                  fput(copy->vm_file);
>    166  out:
>    167          return ret;
>    168  }
>    169
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
