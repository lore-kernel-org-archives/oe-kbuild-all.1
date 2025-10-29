Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B0D345CBF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752477; cv=none; b=j5681eriU5dEvDBWaYAXS48GO5FxHBTkiz2v8+jlV8UVJsGjpSi7IOHUrMH33wl3mBHZQN5bWa+n0e24W5DoDIgsRShs+gW4oSRNFR4BNtkR/MaqWNhhpjlbfVHlKfY+2tXePX4VCb2jLxtERCfYiad6Fwe8y6Qvl9hUHM5ZoyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752477; c=relaxed/simple;
	bh=dFUcIX9zb3KURiW199Q0GpJb9BjadlmISefjY6TgESI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJ40MtoO8pCA4OsuCjg5kl3qDF9wAKI0VEM6xYWYyiiAYEdPhOZ3KTSdNxQwSiCIZHO/mCU36ZGI8f3RJA4qYoKlD/zjKyBz2U1K7nq22mo6R2PmkcUhArnHOTEBAYRyYVMxUURaZjIRVySfs4rx807w3SiUFFBLsC9x7ocISyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuQ8mnLO; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuQ8mnLO"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63c3c7d3d53so11674001a12.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761752470; x=1762357270; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVwPOX8Ubn5zI65J95QNH43znna4TlfYkWjHfNZ4ivc=;
        b=LuQ8mnLOnLSyFbCUlrfKfPzk9U2R09TlL837hnbaY51KFZ2gg7TbXSIviqfjM5sHJX
         9uN1PDKfqomwGLRyAKXmgxLjbMeLxjR5diHCAECq64HKOIaQC/6ESTjxdT4bxBIkzzF4
         aG0Kd0OrmWHtLIfc7kt6xiWivdP7LEx2jO0UyPiFn40oQzL8+qcG7Z1e00Gw3YDqMFIj
         OnPIIwZ8JtCrefAS5yG+ZnfvIpWoOYB2lQPXJW6qPfAuhnhoHAquMUd5Q/YZT9FJii5T
         cTh/4uDVPEZuUC4UY0xBX/2mLGhnjf8Znpg/jcIrJbMV1FXCGTd3DmF4L6rcXCILJXpb
         bc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752470; x=1762357270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVwPOX8Ubn5zI65J95QNH43znna4TlfYkWjHfNZ4ivc=;
        b=P0Fp2iS0Csqb+xvVOsFNAphGHCGg5rWZ1UJp2G/X5dCsqCR+zAzimG8UeBnZv3qZaV
         nc6oj9ZTJ9tEC/49YmH6E4T4zTHlUN8yyb5rFlhR0kGMDAH0Iqts+QgfkBu+7EhVNjZb
         OMit4s9sziLFld73JoSgn4tCJUh7LuxefCy1mjTRw3jcbWbt7NrqBxSpQtVFcbdc684b
         V9fBx3wq73U/8vJWXx+hJCDUoT01HZ4sQZw5nkHsw9hLWQSp4BIbJ0E1fSh2S/5g5kFl
         GrIDrDw6su3s0ryZeutrvtMnOve2HIXEhAI9LCo/XvrJ1NZlutp32K29SqZsSwTBJosu
         WBYQ==
X-Gm-Message-State: AOJu0YyxlDfBmh95W0Ow/haWXJQEFVnBSdti2TMmIHt7ibduTCA6VO51
	7xyd08O+hi15pzrDyXeQnjewHBDO1Ukdas5c6jSfIb7cVwDBC0SpaCYJLwvtoj7AzAIigtcKvjS
	y0l2rgRtavMFY8VF6Egvk1WfCvbjFxpk=
X-Gm-Gg: ASbGnct9CbpjDLXF2jaYyIDWvhh9jaxoXC3czdrBMvOp6KabQBtsX9OzMnr4wkVWdbW
	EBuv/VJcumR3ScmYEx+BTNsKL1zxGAXn7e4HMW6p7soGK/gBM0AVwwlPpySBwOOC7/Z7Ge6yzgN
	yTuyAREMn9PE1guV6Jv6pEjS+qsczLeNqUML9VxjCICHASmmTpZynk/L0TOSGphoqTQp6Pb8ckJ
	eCM8uHm5OMJaQJObXVmhoMI0Vuv0CPUfzBwP3Xbc9i/9Fcio8bRukW50fu5+Z7OMzLGqTYg1jfL
	P4pp5uytrac21GMXtZNO63XazA==
X-Google-Smtp-Source: AGHT+IGHoIOqgZYYe5RrOhv0kuMUh9WA6d+SZ8rB3oDa6MtRb3hvmBMshOTkiSUg88eTpeDbQA7sDMMCGaqBOg+C0us=
X-Received: by 2002:a05:6402:a0ce:b0:63e:155c:3ae with SMTP id
 4fb4d7f45d1cf-64044188b93mr2830728a12.6.1761752469439; Wed, 29 Oct 2025
 08:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510292317.UP4H55Pm-lkp@intel.com>
In-Reply-To: <202510292317.UP4H55Pm-lkp@intel.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 29 Oct 2025 16:40:57 +0100
X-Gm-Features: AWmQ_bkSUwhbFWYO87QQcGvoP64lsPpFYYi_XfQBlFOcWB9_ASoqLSBfaGoTYC8
Message-ID: <CAGudoHGbLT-i6UEsduX3rvobo4SYAZx2vH4CQ4JFRzz+B6zNBw@mail.gmail.com>
Subject: Re: [brauner-github:vfs-6.19.inode 6/6] Warning: fs/inode.c:1609
 function parameter 'isnew' not described in 'ilookup5_nowait'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 4:37=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://github.com/brauner/linux.git vfs-6.19.inode
> head:   f5608fff035ae2310a647984998060546c3ec6dd
> commit: f5608fff035ae2310a647984998060546c3ec6dd [6/6] fs: rework I_NEW h=
andling to operate without fences
> config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/202=
51029/202510292317.UP4H55Pm-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251029/202510292317.UP4H55Pm-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510292317.UP4H55Pm-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> Warning: fs/inode.c:1609 function parameter 'isnew' not described in '=
ilookup5_nowait'
>

How about this
diff --git a/fs/inode.c b/fs/inode.c
index faf99d916afc..c80ba58e9c10 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1596,6 +1596,7 @@ EXPORT_SYMBOL(igrab);
  * @hashval:   hash value (usually inode number) to search for
  * @test:      callback used for comparisons between inodes
  * @data:      opaque data pointer to pass to @test
+ * @isnew:     pointer to a bool which will indicate whether I_NEW is set
  *
  * Search for the inode specified by @hashval and @data in the inode cache=
.
  * If the inode is in the cache, the inode is returned with an incremented

I'm looking to whack this routine btw, it has only one user.

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
