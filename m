Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362883D7D6A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398124; cv=pass; b=tz4KNNal1LRkOn8KuX/d1KDu6nabxZ4r/zCAhDHWiLzawbzd1phB6e53kks/PEJ/B9PbgbdfCzh4zpIZINcqxeSwDChQA3Cq5d9XmOP3gezD59cljQesJWMiBl6UYGxehCaE2U1PSmKR/UXIm8QipoFopiaYZERUySo2I3CQpjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398124; c=relaxed/simple;
	bh=1EYDlemeLWv0WTFuJozt+j/0ztk4MscH/Q48xCi+/tU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btBehMk1dzco7HU2kX6lY1GOHPGGRUzl1oMEg8yGy2FGCHiUx7U53MftgwGfGfL2NBeR8G8Ulvj9vz/b3896Dn/FLHsnywJqvTsEhcLz3RSvEutX9bfOfJp1ZPh3WTbAakVscXcuxzvPRGgsJrf5g+htMLdYtUOjw0EfV9prAHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NHHXB51b; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NHHXB51b"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530d5fc2cd8so326851cf.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 08:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789398120; cv=none;
        d=google.com; s=arc-20260327;
        b=DLEXPAwY/TiBvGrKgzgVXCtVUnxb3+NmODhwL6q8UmJaYrIpZ9SCP1rX18I3QqRAjl
         c+nh7osf4ugDy4d3sHHl6LDRtqZ+eZZA3rTjCJFRLgRByKZa8+UnMERBO+VA3eRCGHxd
         yVrC0WQHQgfvKM1CevKwbMRem41CxVyIh66NOltXHX8WZftBcG+Rz+UGsTXCktG6ocvA
         rhFWVIZcNwoAmrFuCDIvp738/DbH3B1iXyXrHGKdrQ0BfYP4e8lNjEcoA0Nz/s4lhz/d
         LlHUtGOyiIc2r6p+Sm7w/WgWjRenGI3nf+GnLQl0wN+OXJgFiKGLNS3BLrIKIUcLResX
         dJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzUqKcWXaytoxZ9VR531dfCrQ208kTEYqL04RpaAkkA=;
        fh=zlmRssePOcGaapRFkfRHp9KQqClzrF4a2nIDMGJW33s=;
        b=WBIWF3mI+f3q2elYVOKwosTByi8rU2xheAaw1FLLXf9eFZ1H8Z5qyyrS3h/Fe88zVp
         ZWyrzWNOtwlsrqXfaCVTXiTYLmKMn0/3DxB4oY1KHshdHz9L7oenaeBSUx6n3JyuW3we
         WYsTXbTU9ItOHHC34x8MXR5MQ0pwst8iK1P/n6bHorCk2ucl8AZrumg1HGs/WpPSgCAY
         CGerL/FeQMGllWB8MIiMOk/p+3JREKjZezv64dhBygoIihkyr1alplnFfTzSEBqJ3n+e
         bgVXcB80d37ogwHVu52xThyIx1yvGx9IUTm05lL0L0wvVFHXyz9FAKbMIskeLjTvKPOe
         A2eQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789398120; x=1790002920; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzUqKcWXaytoxZ9VR531dfCrQ208kTEYqL04RpaAkkA=;
        b=NHHXB51b278xdCtkkxWxTRfij0q9cxSc3KjgmOtiCH6Q02vVK0Q+75k4yeD7GuYW7T
         mhUSn15TcvrGdV31UtuLivekgYC7QsMQFtGrY8KekmsVK9dy1vyTT1NNzqJRrkIuM09G
         ng2Et5VQGYU1oTYADA0Tbub3GEIgt/jOfnF6bAZIlSgHyvuS8VBOpsuvWeNoQht/Ys12
         rLqh+RJfeeYm4ima/IxcwY2YW1SVbvX4m117h0i3hF+hGxBR/Zcncui1/mIkj7DZyOZC
         jvd2dWYnNXzEymMRke2DvKd6z34x1r4bCL7gDTMWighJCubdWdSurwVG4HctuipRwlgH
         H8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398120; x=1790002920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzUqKcWXaytoxZ9VR531dfCrQ208kTEYqL04RpaAkkA=;
        b=Yshts/r7/T7frlZJKxyqfxNmVQdJH81ARSwv0qKtH7fenjSucAs+luQOn2LH02PVl+
         3U/mIOjvk1Yo3fr0cgoe1sVN8NRwG+Gw/z2+suTFWVOJqnI/4sojuegybG5tYmBtkONn
         eKL6N3DEhqriHcMH/h7gVdPatnXffAqIZ064VBFzzJhpuq3IbCdNb9rektXbQZiXOV58
         wZGQlcjLeRms8qgxkeR/n5fAecxoGWpywhOfeK8FLJkHiRG2HjGMqihI+Rdox02uVt04
         08+he6QPlvyEkmZmrT5HniPXiE/tlrXWASHCFftiLtKu8kc0ZMTyqZwu7gHS7AhWjcEx
         2epA==
X-Gm-Message-State: AFuF++mrd1UWjXA3PhEgKYxxzhwLajWl7nMA3H3p6UQCudCIjGlLrV4U
	QNMf7Itl+MYq/hM0e4WJIAxKOgvM1x/mqaNIkqsQlBz9eK/wc2e5qnAc6yfjqXwKviwTKHsN5is
	dh9epzAeOYTEOke2oBX0GWrBdl9uTx6b1Y+oz5f+0
X-Gm-Gg: AYBFou0xND1e8IX+gAPEEWOHzD4PEOegNQwP7IGw+508tUxpozVYj/FZftvAC7UjPHH
	UWCDI0ofRWNYk3MD9dK5sZIlJ33+G2VX/5HJtfSf4zkhf7P2SvfcWpheU7viNmbmha2PAqa9STX
	6IB3xmnW69dfNujj7AyTQ/h9PtLWN8UJBrMboT6EpG0AhpqNBw1Af935QQaB6Yxer+VEsadIYyG
	5LDJzH56OIHYZM12gALAqLpk7+KPR2KF+gNMrVLoKJTE5t9NfGkblX93McWEfY7lV/x33InJ0cc
	D12/+3xLyKn/2QhQSIkXT7M4mAz1TYRVt2RmkmgfboPAjIWuFNzZjg==
X-Received: by 2002:ac8:5a0f:0:b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-5310ee4bab2mr9559071cf.7.1789398118911; Mon, 14 Sep 2026
 08:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609121422.hkKWuy7K-lkp@intel.com>
In-Reply-To: <202609121422.hkKWuy7K-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 14 Sep 2026 08:01:45 -0700
X-Gm-Features: AcwNN1WLIuqFwJiP12OvUDtNJ_un5ijm7vW8SviOfyPSvZRrA42nxpsFR-V1QmA
Message-ID: <CAJuCfpGoZTELakrjKw1Up0eQnSTgXnuhADeRrQKPV+xPhtRy2Q@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 439/459] fs/proc/task_mmu.c:205:13: warning:
 'reacquire_rcu' defined but not used
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, mm-commits@vger.kernel.org, 
	"Liam R. Howlett (Oracle)" <liam@infradead.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 5:41=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ne=
w
> head:   383fc05d4650b021f3c17e36a145106dcc61a294
> commit: 2a61a4b80dc01581dc9f6935eedefbd596e77409 [439/459] proc/task_mmu:=
 remove unnecessary inlines in function definitions
> config: openrisc-randconfig-r053-20260912 (https://download.01.org/0day-c=
i/archive/20260912/202609121422.hkKWuy7K-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260912/202609121422.hkKWuy7K-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609121422.hkKWuy7K-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> fs/proc/task_mmu.c:205:13: warning: 'reacquire_rcu' defined but not us=
ed [-Wunused-function]
>      205 | static void reacquire_rcu(struct proc_maps_private *priv)
>          |             ^~~~~~~~~~~~~
> >> fs/proc/task_mmu.c:197:13: warning: 'drop_rcu' defined but not used [-=
Wunused-function]
>      197 | static void drop_rcu(struct proc_maps_private *priv)
>          |             ^~~~~~~~
>    fs/proc/task_mmu.c:133:12: warning: 'lock_ctx_mm' defined but not used=
 [-Wunused-function]
>      133 | static int lock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
>          |            ^~~~~~~~~~~
>
>
> vim +/reacquire_rcu +205 fs/proc/task_mmu.c

Looks like these functions are not used when
CONFIG_PROC_PAGE_MONITOR=3Dn. I'll post a fixup today.

>
>    196
>  > 197  static void drop_rcu(struct proc_maps_private *priv)
>    198  {
>    199          if (priv->lock_ctx.mmap_locked)
>    200                  return;
>    201
>    202          rcu_read_unlock();
>    203  }
>    204
>  > 205  static void reacquire_rcu(struct proc_maps_private *priv)
>    206  {
>    207          if (priv->lock_ctx.mmap_locked)
>    208                  return;
>    209
>    210          rcu_read_lock();
>    211          /* Reinitialize the iterator. */
>    212          vma_iter_set(&priv->iter, priv->lock_ctx.locked_vma->vm_e=
nd);
>    213  }
>    214
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
