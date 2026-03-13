Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B720468E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 01:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773365291; cv=pass; b=pan4tTFKCcj9GFmEnISpTLq6kUhqy56ghiN9WFGAJN5ZPDRARfkkscjkzr5byRAa3Uje/bbG1sOTjeQ1g5Z+7Fpx8KPBPN0oARdyp5V3fimDK/ZK0Maz32grIii56I2g59rJH0gJNyW6KVz9n4Zk4S4EtAukvmeQtY/ZnLe0SLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773365291; c=relaxed/simple;
	bh=VtHWvwO/oN4aXUGqbz3E/U5WSlrRx50F+FHZCSlge3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TdSgQ3vALoTUwOALmTCXVjkY5KBaD6MbuOajEeu3ZAUn5Rw7gn6eKZbSIfhggSzZWJ3lAAiXu+kjl9J12rsd9tBDk5JM/yGKAdkS+y5nJ0d3+ve7AisaavsZr5i3Z57EiGL7cpUm33pRtVar9vSki1vYW0sQzP7PD4zvhgeI7H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Eww+86Or; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Eww+86Or"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-485344bbf1fso34265e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 18:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773365289; cv=none;
        d=google.com; s=arc-20240605;
        b=RvV6+lV9srpoYAENHFwv786vrNvch/jID5zK4Lo9dHr69lFg49jUceJoHVourLKsqE
         xUOp/oUvCmu5ayJK5OJC/wgvWwRIiCBmuhwBY2ZEVzNh+blfOrkOpKqzKWg2aTMknuu+
         /4O2czpkyw8qsnx0sP9xnXRnP0EZT+pMRquaMH4VopdcLm55Y6l1CiiHEoe1hyglW1df
         B/6Cc1wowqPKoMHiO8LCXino8Jsjf3Xmc6Ow3hcEqXRAFwEe9TGOMBHAea67nUdb/ERE
         nDGrdDRsCcgADx0PTyJ3R+BfzeRfeJGlEa+4c68ECRNcI+ffYHk5r2dwblbWtpp1pAcR
         c/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEobTUWzV72x3QN0OyxLx+2qJJC4Ut4A452RWli3N10=;
        fh=lsON3ZboJaaDK0LnNgYVSxatWU2S6EEibpwBUNqEwCY=;
        b=bksdAL/Tl16hiHrIxWz4czl17vthwftjXDjZMP6r4vWJ0UKfuN4qsUy7xYpkSbx4ut
         NkDqozYS5G+G6oVJIb2BUtZL/Uq2Gk3mtXbAG3RAa5BZvY9lV/9VRbgk/Ua6fhD6W53Y
         /cmJ2p3pmFAq5YhUGR5+bLBEtMXwuMCRx3Y0yasFq1xXc+Ao7p7g0akr2R8CLPmnmIuo
         eHXZL2J1orQuNmea6Yz12fmFHhVGl3Dwb0fJhTS4JBORe8xREenjJm3poDisR0zkSG7i
         CnbmOajsy4LHY2Q/MaEWtD9iGK3Ig3Jb5UUcaYG/rA2EZ6cAkA1ewFK0yl5ZTcxYkb+y
         P4Pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773365289; x=1773970089; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEobTUWzV72x3QN0OyxLx+2qJJC4Ut4A452RWli3N10=;
        b=Eww+86OrtqdeqhRlsEYMebhGjXuhVsQ2cXYY4+PxXvQXLaJrDk4J/tYETEteO0aHQZ
         a5P7HDDHuIF48OxTGqnpxgSEp0JnvDMvP9799BnNIYudFdYvlQxtDCYCiEX+lgwsUHVb
         WWGtpiJ4UHsJpGTdMZJ8lHCaqhteqnA2+TLAIN4lM8bUjLcLQqzjbSovWfYbMxJnsjuM
         IcnJMCOVQ/s3Q5HJFBowsIxEODDgOwBBdp8IqNQQ2ogVbyBHUGOk7nPktaelA1tpUE4j
         feFxNre2gXXpS0cVVuH69csjT+EJpkXKDGefnjt4Ojj4qWlF9Eqq5Pcuxp5JjUsfGlv1
         fQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773365289; x=1773970089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZEobTUWzV72x3QN0OyxLx+2qJJC4Ut4A452RWli3N10=;
        b=YuZP53piKrqY9gdqgrP4HUOVCFmDQ0q+6wz7CZympnJWKPfb6LuoidT7eIb0crAe0h
         doZ+9l9idmBZ4wFgYX4LKq4WV2pwk0dndTwWlUr+BfsYOVygpAqOC7NgFiA6Ocmtj1BY
         FmCw9jQ2wnRmfOSpNktMr4JDsNIaled7CG6KiWtsQUDvwioXfmCUV7ZnHK7mu/XUfLWV
         cok9YdY5JMGfHNIomCVYOF8I3/8icrZbpXU6RUeHzLelzt/wdWEnZ1xf13PVMOG40TKw
         KH6iVhwt2iJPrhRkMDTB/+D0Mc295keoJtiwEf1sUSfiTVB8YQski0IRzjfCrZ719B9X
         YnWw==
X-Forwarded-Encrypted: i=1; AJvYcCXtxtT014aXwA8sccl6k7JJZ1jT2cmra8OG/xVbEFkmXUHQqb3fHRd/FWv8xbugtVqvazDTT0R8ms3Atoh0@lists.linux.dev
X-Gm-Message-State: AOJu0YwEto7YsuWHuT3npsKxB6zma0SwA1rwJUfxfVzgLjPxu2Q+e1w1
	qdj9ncyLFArVPF/iQDwhvvm7wKcKAyLHRKASquwklzIVUyUt+hQlWIm69ENkP+HS27XS8QPhoMe
	Pinnw8yyIGTeurhVINr+wqNm6zXYeuty9LOzvM4bj
X-Gm-Gg: ATEYQzwmZ6atT4Wl40rMA3rodpYgodmryXq9l6Nh/f5MRhvCCYGWP3maut8rDOgUNEE
	TeTbXlVFODnH6Rd2ljB0KwaYffUFnvL/jpQROD8xPG1w4S6VTc4TOZKfabY7SIWORmy+qV0mmpj
	NXizwaXUuIrJpo/psjf/5AK1V0EVSZ0tYVHJfTCf6EMDdx2jShiDy07GfNGghwKkPXbV1JTLH1S
	VCHIqy4ZG10WHKEixZXAnkZkkrW5QzrdDcfQuCIgM259p6lkauezmZFoiZ/XGYwJh8WRhO3n023
	BYkUKdieypkTtTJXnTo7FyfdHEErG27nbxZYYA==
X-Received: by 2002:a05:600c:c04b:10b0:485:2ab4:c1f9 with SMTP id
 5b1f17b1804b1-485566dda57mr433185e9.4.1773365288441; Thu, 12 Mar 2026
 18:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603130112.2FcCzv1g-lkp@intel.com>
In-Reply-To: <202603130112.2FcCzv1g-lkp@intel.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 12 Mar 2026 18:27:56 -0700
X-Gm-Features: AaiRm53g-8e0oyPHvXegj0peU0NciplRf_c68Z8P5NPMptU5ZE2b2R-E8zmaE18
Message-ID: <CABdmKX3PLUQmm6cHJqhst=ifK8dvKgKbfgMyR28YLF23zHhZKw@mail.gmail.com>
Subject: Re: [driver-core:driver-core-testing 3/16] Warning:
 fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in 'kernfs_drain'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 5:46=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/drive=
r-core.git driver-core-testing
> head:   e7ccc9e054beb4c366228d24786f67c738206605
> commit: eea5d2bb34ba11dccd9c53f392dc50cf060150a9 [3/16] kernfs: Send IN_D=
ELETE_SELF and IN_IGNORED
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260313/20=
2603130112.2FcCzv1g-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260313/202603130112.2FcCzv1g-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603130112.2FcCzv1g-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> Warning: fs/kernfs/dir.c:491 function parameter 'drop_supers' not desc=
ribed in 'kernfs_drain'
> >> Warning: fs/kernfs/dir.c:491 function parameter 'drop_supers' not desc=
ribed in 'kernfs_drain'
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Ah, yes. This will fix it. Greg should I resend the patches?

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 715b651e35a0..7f355316704c 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -481,6 +481,8 @@ void kernfs_put_active(struct kernfs_node *kn)
 /**
  * kernfs_drain - drain kernfs_node
  * @kn: kernfs_node to drain
+ * @drop_supers: Set to true if this function is called with the
+ *               kernfs_supers_rwsem locked.
