Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E050F40313F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 15:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981247; cv=pass; b=Wyn60ZJdDsmUeyxqEy9uP/kfyYQDC2/X+JzxjAr9Zp5B1H3lHlQ8OaCTrL1uIuOd4fvov1XsYqDnjUPASBNxtBJZZY6+BmAdM8SdA89yvBELIJX6gPoWvsTW8ppOmJfM8VsGm4JJYux0Vw9jP0pzjdx3ymxaRz06GVqnw02WEXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981247; c=relaxed/simple;
	bh=Y1hkq8MSxHw3VdJ8eSo2oQ2NvWvlL9pcU93sRMFE598=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xq8JYRGtvC3skXTElcbcVrw2NgCQBg9s2FKCoppQpuHZH6FgARIusP0/Wbp6X47t71+jEGeVplHXelC+htJHAXEZmBOol2o0yVG8qmKtBBjnyCVJy5CQ6IkVzqDlpzmYp8fvOWXpxoL8AUGt8crHDQscd76/Z6Fehg7iOA9o3KI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JPv+v7gZ; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JPv+v7gZ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8354461da74so6081067b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 08:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779981234; cv=none;
        d=google.com; s=arc-20240605;
        b=DfbsZOu7RKy44BC3jfAJ3P9NgTUnNOgUjLCS02l21AzYosJyZx1Maf/yzZQc4GPZcu
         JxZu/Ts5AO4SIdfAq+4ADwYmgEd10kVEDazLt4mMsGlOnrl6cNh7G5s5sbTGa32z+isN
         /zuHY67YnSxjyDSw3DREDrSq7KPmzjx/wntQtLzvEGapYoa+g5qOyLnzwnpnpXmK0S7N
         2NVPQT7oAU55vwNC0f2ipEgWUbVyTNMicjEIgI/I4HfcKNWkAfG67bL1X9p7wptq2SfA
         ZENh38OPBZBUGpN8Lm/X1A1Zj48YLH0xBlWpxUGgfFr6SJCi4qB2nUdOH3nqSm0nRRlh
         FxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v25zfOayGfkaGbNqyJnQf+7cpwvfvY7ktaJ8S8eLFmY=;
        fh=747OGH/XFYpzdaPdsI0jXXN51fN5HEiuPNbj0KHrtzA=;
        b=i50nqNdm8/+zAnhDO6UNNpt9czHEW/wSwFKLawhOalAXy5uJJHF8TruEhCex58hDlP
         ujGHNX+yBPFjSV9nV5GWOuPUb4NYUbK2e5RVXYmJivua7J40+2ISYzKyaCNinCk2nK7g
         UI+mh6p2dGM/3Lt4Z8opkqgJi1j79En6X1FO5P1z4X0KgpDeRyYETo4qSQdhnCpEOkn7
         2Kl91eyG+79vZu/Cq7B9QUULnEoogEy0jzMWvc2QMyo+x3vgu1A0FWzr53Kg3M8XlUzF
         OFpTgX0Y50RZ28JEttfDZKHMj76EgJWBreU1KDhps98gJEnAeWAX0UsB66BV8Q7xTZr4
         M8zA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779981234; x=1780586034; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v25zfOayGfkaGbNqyJnQf+7cpwvfvY7ktaJ8S8eLFmY=;
        b=JPv+v7gZ3Za6DhUP4QdfzPkkyjHey3RuMUfyklH6skS2fqmYbePK/BYaJewJ9c9jNI
         wJniLyky19cKZFIgHj6J5hn84mu/JtGfKzKRZcy47kgbur+BBO905OqIk1c8XeW5bbBi
         y5GoaAj0SlrfHAgNaFDUeoXp+bl+MFLKPXrq1xHwYGLMgHbJlCRPULfZwgGU378cgbjV
         r0d6kptZMbWYUa1ykyNl8hMf5DtryGTCMGk5Ut8b0ZCwsJgO8v/I8W/NiELwKK0wn+67
         uUeAZV7l0oqmeWH3a8jeaj89wbXie99MFFn8IV7ssdjQ6t9FszncHT4vt5DByI+DnZWw
         Zeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981234; x=1780586034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v25zfOayGfkaGbNqyJnQf+7cpwvfvY7ktaJ8S8eLFmY=;
        b=VPEsDkO4M9Cvm6TiUFG5clk0l89uc+Ecc8Ui08s24fvk5ANWFb3FVdh4BS6A8oMaJm
         LeziyDN6RmvoIjbKzvsjmohpGgmeu0X3f4Q0T+6IGGfJ3fKEtf11AhS9T+mP1eTnWxLM
         tJUULceKPxjs4oSSOlEsWKBF6zUuJRAKoZhOg1dIHG0k+yu6CFTgtirIvwVwZOq8C7Cn
         8cDOH/cAmrR6CuKwdRjCZXzxyWzAHJ0IvA60fnwca1Hnjo5JrfBbfhieON/yYPbtulVO
         SSoLEZ4uioS8WiV5fQ1EitJjxyAUuLWgWD/Rbwmf0rG6ISBlbOEVfiQzzczaZOp6kOPC
         oEwA==
X-Forwarded-Encrypted: i=1; AFNElJ9nGHJmcUdfO+JIP8YgwxqJYCI/BPdsFvPlx3bxbPV8R/AgdM/m+WV2r20Eo5cJBQIzUep6iMlTiT8DlYId@lists.linux.dev
X-Gm-Message-State: AOJu0YyG3gmU0TR2lqFHpeR3IS8W2ZHkuMI5vU1KT2o82bF4C2VnlarS
	kd/vmdpy7uVPKgro/H7bkx5BSDZ+vwJy9aOEnibdPoG+KuynLOwpm2e+JfQ9lsQn6B/JeVKJ+9N
	mBkFwZT5F/x/IRkN2K2Ty93zGcuSl+3zYCxJniyiWTfTq+NmzhSQCfQ==
X-Gm-Gg: Acq92OGwwOk2Cfe465cbf/TLCzFXqOPrChQOQKfsNuvl0TyfOsAFXIJX9we2d7bjPzG
	4vX4uckEnh+D+AN5xD+vtj0DLRuMpZmB1Pthzpikp0rURTe7FKCOkYhDj6ar5wnkm27/ZbQ4+pz
	yjLRI288Rh4+vkn+DLbGSY2rRzeA5k2bdkSOHMbnP1U3e3F5Ml7UVxY8zSGgn5JXezWdxnES7W5
	ePyYemdARQ/cTR1wdZHjNh4/sUMhk8+dz1Jwf1644N429EWh4EC0zAEa+a+3jqMEnspP0NJ+WnU
	WkRsnBNPskPOLVMKIQ==
X-Received: by 2002:a05:6a00:1888:b0:838:20b7:40ed with SMTP id
 d2e1a72fcca58-8415f6141a7mr29664848b3a.42.1779981234399; Thu, 28 May 2026
 08:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605280441.YSawqHBc-lkp@intel.com>
In-Reply-To: <202605280441.YSawqHBc-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 28 May 2026 11:13:41 -0400
X-Gm-Features: AVHnY4JyLcHMYBzw4uwDifZ6-3gkVNrPiSY-64S1IqdO0LgnLH-fdcS4TkOKQhM
Message-ID: <CAHC9VhRtOFUQXUUg7E=WMpAwzVYaR1NeuSF+40ZnkWUguZ2dVg@mail.gmail.com>
Subject: Re: [linux-next:master 8419/8766] kernel/auditfilter.c:592:60: error:
 too many arguments provided to function-like macro invocation
To: kernel test robot <lkp@intel.com>
Cc: Ricardo Robaina <rrobaina@redhat.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 4:27=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   e7d700e14934e68f86338c5610cf2ae76798b663
> commit: 84470b80b7b0ded9a6b071a211a028fe5fec7e44 [8419/8766] audit: fix r=
ecursive locking deadlock in audit_dupe_exe()
> config: arm-randconfig-003-20260528 (https://download.01.org/0day-ci/arch=
ive/20260528/202605280441.YSawqHBc-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 8=
53d532794be83adc97d51c9ff8c9095ce32631b)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260528/202605280441.YSawqHBc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605280441.YSawqHBc-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> kernel/auditfilter.c:592:60: error: too many arguments provided to fun=
ction-like macro invocation
>      592 |                         audit_mark =3D audit_alloc_mark(&entry=
->rule, str, f_val, NULL);
>          |                                                               =
                  ^
>    kernel/audit.h:327:9: note: macro 'audit_alloc_mark' defined here
>      327 | #define audit_alloc_mark(k, p, l) (ERR_PTR(-EINVAL))
>          |         ^
> >> kernel/auditfilter.c:592:17: error: use of undeclared identifier 'audi=
t_alloc_mark'; did you mean 'audit_alloc'?
>      592 |                         audit_mark =3D audit_alloc_mark(&entry=
->rule, str, f_val, NULL);
>          |                                      ^~~~~~~~~~~~~~~~
>          |                                      audit_alloc
>    include/linux/audit.h:604:19: note: 'audit_alloc' declared here
>      604 | static inline int audit_alloc(struct task_struct *task)
>          |                   ^
> >> kernel/auditfilter.c:592:15: error: incompatible pointer types assigni=
ng to 'struct audit_fsnotify_mark *' from 'int (struct task_struct *)' [-Wi=
ncompatible-pointer-types]
>      592 |                         audit_mark =3D audit_alloc_mark(&entry=
->rule, str, f_val, NULL);
>          |                                    ^ ~~~~~~~~~~~~~~~~
>    kernel/auditfilter.c:879:35: error: too many arguments provided to fun=
ction-like macro invocation
>      879 |                         err =3D audit_dupe_exe(new, old, ctx);
>          |                                                        ^
>    kernel/audit.h:333:9: note: macro 'audit_dupe_exe' defined here
>      333 | #define audit_dupe_exe(n, o) (-EINVAL)
>          |         ^
> >> kernel/auditfilter.c:879:10: error: use of undeclared identifier 'audi=
t_dupe_exe'; did you mean 'audit_dupe_rule'?
>      879 |                         err =3D audit_dupe_exe(new, old, ctx);
>          |                               ^~~~~~~~~~~~~~
>          |                               audit_dupe_rule
>    kernel/auditfilter.c:819:21: note: 'audit_dupe_rule' declared here
>      819 | struct audit_entry *audit_dupe_rule(struct audit_krule *old,
>          |                     ^
> >> kernel/auditfilter.c:879:8: error: incompatible pointer to integer con=
version assigning to 'int' from 'struct audit_entry *(struct audit_krule *,=
 struct audit_watch_ctx *)' [-Wint-conversion]
>      879 |                         err =3D audit_dupe_exe(new, old, ctx);
>          |                             ^ ~~~~~~~~~~~~~~
>    6 errors generated.

This should be fixed in the current audit tree.

--=20
paul-moore.com
