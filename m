Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EB32E7361
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981777; cv=pass; b=FpMWM1QITjk/7AaRov4jRbJDgA0kRRi9LrX1BYyQRmtWB/d0aSJQNe2dsCCL/HRjcmqC2uzx5EjleLlr0xTyDkg1q2rdxCI89aSB7Ig/X/G38YmxblQVhJvCLIvL16YHMRr6Y9QM8+QK3YFjaFRSQAR6OcgTVYU7Q1z/dVFQwgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981777; c=relaxed/simple;
	bh=NYpTMA9h1F0NqemFNx9n3/xqpdEInS10MidnxwL/sIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2/5D4omSJf6/VcnrlAxpGbF0GzYMlNvWaPGtdSbbIguQ6wJnA/Rq9xa1xaA2R0B/HA2eAsTcjuzP8vSXBNRh7i5L9coh+klnP+OHHWYKaJv0S55oV/jG3RAH9OjvVdvkaY0dql47unWpVdQLOCLiZAj63hRB8vJp4gQbE38RlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=IjS9PvIE; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="IjS9PvIE"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304e6c6464dso5432eec.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 08:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779981776; cv=none;
        d=google.com; s=arc-20240605;
        b=judMJUWK7NiSwol00wMPrSjqYWf8G9o3LcvwYsb9q3G2AYNHvxl/dxPTchixiENRbu
         TxenRz8jvt+MzNBZIPZ5P2QF6M9G+sBzFnEhRZu5R6+uKzVCTxdpi02XbZjm5mWp9P5Q
         ljBIjLcraYh8/EW9AMSMkY302aR/MijnY3Ak1M2F3/LKej2lF6VZXVFXxLorwoDDk4fj
         4ZSeRC8U90OAvfTmaCerNoXk7BZ+cZgurWn2Q6QT/HRkkLaotvdqwiJ6ssfPBBqoMQUW
         9o0k4NTZDWLRCYhY1z09iFVmjL/kPI3bqNONhA1NarhMWFh6eoug6vLXwkgXMaul4brR
         mu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LB4Pxkb0vwkONKxlK5+9fBHUYaYfYIx2J/y/7G9R8CI=;
        fh=R89nQezZOc3pAABa0xq9eKT8ezatvjOJ1OIeEVlhRvo=;
        b=AJQ+GO7uZ1Jnf+/d8uE1zMO1RJFdJdezkrPZVBAEdVlIc8+pwK8HNM2i7E8kW8h1aw
         rPiyMC0C3YMUltEaf82rDahm39n9tFt7oS8O+QSi3FNoLhv6tqEMb71KnDpxoCl9AzjI
         ODIT5pde+T8Bg6w6FXvplvNX1yON8JI8MOoa9vmc9tp7zyaY9RC7CfA4s74qvIGx+Pxh
         zxrc5khrsWNBAy486qNSBS/ODDhgeWXnwcMOpg+xtwe3KSPLR2U0UdZnlDM5ACwnhr04
         2PlzkmqZ8wh5K4R1FR5meBqlfjh9MRPp7l0DGo5mmW5xu+ZWyimSTT3UPohcPsHisN6W
         r3IQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779981776; x=1780586576; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LB4Pxkb0vwkONKxlK5+9fBHUYaYfYIx2J/y/7G9R8CI=;
        b=IjS9PvIERrNzNCiOo626FvZ+w2itn3eWgL6qKEcbwfeCPzQD5mO7fCBk+mx7Ul0qd0
         qYfVe1rdl6sp/lf/6e+CtjUKwVGOo7FL4/Tt3Dgy+6Ro3xV7a5LiSMtTAT9Ev/q8uFOe
         EJUuuvHHKtwSKaWwlXenPNQtaZX41VCFFFbuN+MFuig1SfXoQhAjmxBZ/GL9hkxVDtsk
         K1FZ0hNvXfFy0a1E01X6Mm9IAklUsZDL/S/uPzqZqzI7FYDEgTcAvfgv3YyVEa/bepW2
         WSEpCPN9EWtBOwLb04I+pj6QBg2hPi13tNRmMJnFrLz8nHSnAjsRmZcPjb6mo36gyp9r
         8n7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981776; x=1780586576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LB4Pxkb0vwkONKxlK5+9fBHUYaYfYIx2J/y/7G9R8CI=;
        b=eJWXOEYv48cJTR6sj4c1pAJEPny0d28QyWCLI/wTkp7j+HR0QLC9S1uY9Pv8vScO2R
         yMTEGobTajbVJjwlYB/H4Pde9nKKYOX413pP9k+YgPDA1wI+Gimi/2UqmNcQmceVv457
         qSYjHimPUGkU4YNGjQ+x3mrEJLt1cIFqhlxvQdBzcGf+WKaxm3ptrpf9+i0ynm0B4Nrw
         UKx9e4RKIj+Tovgtm5MRoBP9ypWlVkgtVUVAUXRbDjQniSOBSpTto4Lo1dGoef8Hr9hZ
         ksAJ/eVkT1JB63guzdoWOFIIH94APQJUUEbl7incNq5dp/za/W8Se+9yWySksMy28U4T
         xdbA==
X-Forwarded-Encrypted: i=1; AFNElJ+IHhJFuJTeD3f4NNtar/UE8nXCTf5GsnIqxm08xo+49/bhN5zRcW8aU8FNxGhQ4JfNVvn2qrRS3dlfPi9l@lists.linux.dev
X-Gm-Message-State: AOJu0YxSKREQDm9WLGkp7k0Lg2lpYOIYpjwmuw+UQXUe4Jrvpqu8s2/f
	5PBPz6sHwF5sL55z19Uh1QEMXbHNC2xB6+0e2OJ2M0yOsnqsSc+Sl0ZicjpbN+tzHiSJyBSGFbs
	osgiXnwI55gHVaQjJaCWmhxqaYZF0awp50+gCD+SLsH2PC4HaCaZ5IupY
X-Gm-Gg: Acq92OGubpZ7uEQ0LF0FGgm3kE2lsFwudTaxKlOM+AtEtW58gNRSkrfkb+FLJUIxQag
	FB+CqARAU3imBuPsNn2BdYDYocfKuKnbQ8QmSnXpXAz4YGS5GTpYJ6rpY1ooLbwonIZOrmmsQBE
	JzL1Z3twYSwjr3kTzKX8KyminTewfxveMI6lHvsHG7jb7Qq9AIr2/MC8x3/k+Kvh2npZqbJ/jZa
	FtKOob0d0WH8HoccsI7qT8O3eoXcXhwKs5khroSsScXMmN6OmtzuWCsLbMGUwm11dW1Ecs7vz8j
	YDhR79wTB04wrlkZ/Q==
X-Received: by 2002:a17:903:198c:b0:2bd:2de3:519a with SMTP id
 d9443c01a7336-2beb06ea5e1mr309402655ad.7.1779981262347; Thu, 28 May 2026
 08:14:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605280456.3Hhpgxl0-lkp@intel.com>
In-Reply-To: <202605280456.3Hhpgxl0-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 28 May 2026 11:14:09 -0400
X-Gm-Features: AVHnY4IHC15nfKALsQzu5qfdGP5SkRncuGG7ifZ3-yv6ilc8YwipIRNFDvPhesc
Message-ID: <CAHC9VhQGykQf-nQmxgj2Mm1iRJmhLjL376Xz0Kw7aQgmUfCgzw@mail.gmail.com>
Subject: Re: [linux-next:master 8419/8766] kernel/auditfilter.c:592:85: error:
 macro 'audit_alloc_mark' passed 4 arguments, but takes just 3
To: kernel test robot <lkp@intel.com>
Cc: Ricardo Robaina <rrobaina@redhat.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 4:06=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   e7d700e14934e68f86338c5610cf2ae76798b663
> commit: 84470b80b7b0ded9a6b071a211a028fe5fec7e44 [8419/8766] audit: fix r=
ecursive locking deadlock in audit_dupe_exe()
> config: microblaze-defconfig (https://download.01.org/0day-ci/archive/202=
60528/202605280456.3Hhpgxl0-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260528/202605280456.3Hhpgxl0-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605280456.3Hhpgxl0-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    kernel/auditfilter.c: In function 'audit_data_to_entry':
> >> kernel/auditfilter.c:592:85: error: macro 'audit_alloc_mark' passed 4 =
arguments, but takes just 3
>      592 |                         audit_mark =3D audit_alloc_mark(&entry=
->rule, str, f_val, NULL);
>          |                                                               =
                      ^
>    In file included from kernel/auditfilter.c:23:
>    kernel/audit.h:327:9: note: macro 'audit_alloc_mark' defined here
>      327 | #define audit_alloc_mark(k, p, l) (ERR_PTR(-EINVAL))
>          |         ^~~~~~~~~~~~~~~~
> >> kernel/auditfilter.c:592:38: error: 'audit_alloc_mark' undeclared (fir=
st use in this function); did you mean 'audit_alloc'?
>      592 |                         audit_mark =3D audit_alloc_mark(&entry=
->rule, str, f_val, NULL);
>          |                                      ^~~~~~~~~~~~~~~~
>          |                                      audit_alloc
>    kernel/auditfilter.c:592:38: note: each undeclared identifier is repor=
ted only once for each function it appears in
>    kernel/auditfilter.c: In function 'audit_dupe_rule':
> >> kernel/auditfilter.c:879:59: error: macro 'audit_dupe_exe' passed 3 ar=
guments, but takes just 2
>      879 |                         err =3D audit_dupe_exe(new, old, ctx);
>          |                                                           ^
>    kernel/audit.h:333:9: note: macro 'audit_dupe_exe' defined here
>      333 | #define audit_dupe_exe(n, o) (-EINVAL)
>          |         ^~~~~~~~~~~~~~
> >> kernel/auditfilter.c:879:31: error: 'audit_dupe_exe' undeclared (first=
 use in this function); did you mean 'audit_dupe_rule'?
>      879 |                         err =3D audit_dupe_exe(new, old, ctx);
>          |                               ^~~~~~~~~~~~~~
>          |                               audit_dupe_rule

This should be fixed in the current audit tree.

--=20
paul-moore.com
