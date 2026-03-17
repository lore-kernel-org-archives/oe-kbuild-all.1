Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161E2390C82
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 22:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773787454; cv=pass; b=Bqtwg1cjvfrE9kIDxktwC7rt7w8gF+EK/wzUXnKmHZQ2UYQLIa9Gb88uoyxe5hbXj7dZlbuigrvYE+RqIViPz7WlGHoV79RWYvSCsN6IUhDKPoQb2dZ74Bc5IHfK6QIcAGU2FbI6Wo/Azm/pE6IMdsIihliOeomFM9+dHmSCDOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773787454; c=relaxed/simple;
	bh=7v7hqDnUyjoqqeM8aoVeuNA+fQG2sgoZPVAkWwqa6h0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdhZB5+RjwB1Yjq5yI+D7vv8qwbMamk0Xn2SyfXtDCXPdb4BgOppiBT4aIEXAPn7OVhrbhPtDsfiJp/wLO6id4P0jrkY5pZPH/ZgcM11Qt9YsvPxN/8UxXHTfPO6AE0gw9dpmtqMoQFoCoD0VcXKbszT4cywtapSZg5d2yUK2uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=c7lDwdi+; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="c7lDwdi+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35b97ed057cso1783762a91.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 15:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773787452; cv=none;
        d=google.com; s=arc-20240605;
        b=X+g6JQqltsSAuBHR2wv6zgFyYirdzEsnAJsnQPcs2lmwAvqZ5WB3VNrWk3l1OwkUg/
         d8G/GTjWyuF281xkEG/6UOtc4nMepOF5f4HM6P7u/YA17NSmuWURYyfAA/0mp1564uch
         8JRgpijfJ26RVvJihSWcoL1Yk1BY1nQBeicJ5Vs2Y1fCpjksZQHQeaqphFwl8owpy7nT
         e/RGRHgqELNCFC90WYEI32WTUw1u0DZgisgnR6pzjlOlk2255pQlvSD53HqCQOKxTWNN
         8VXjr8Q/uOfkUGQHglwE/fQY9Mj+GhB8Rwcqzwgd/AouZjIKCyEQ80rq48T/Wa8f718m
         tYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhlXR0bjoLoJqmPjrCcZS3+IaxORI2oC6Rf/az3A7jk=;
        fh=j/6p8dI/kNHpMrHZv1SKVVa21/qCjvPaU12dKA7btTY=;
        b=QlSBKOruzFkQEVPT9eFi60SvTY1tEj//kXUtSNd61m5pW5gXBG4aYrvVsVl15CzJ/4
         zaj7iDJgmx5+64vNBFBGOQu2DqVu/Xhz0hE9p0n4xrAPJ7x/cE0Yczj+p4+JY0V9dds+
         RA0t096/KF5d3gBRBU5rAs3Q6faBwarldFyXfB4JkN3zjH+rfFWgfbTTrR/A60On4RQJ
         no0d+FBFvAUd9pfD9nTDXH2k4VVjDDZUiKo39zHpA9HSjOJJ/gvQnXd/RCQ6yekiiKwu
         4g2/xdZMzeIHLp0a7KJVBlYAxrXVkfwivCzqt4BK+yMplZp3K6ooGm5zwBgQGsWxDOKF
         GtXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1773787452; x=1774392252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhlXR0bjoLoJqmPjrCcZS3+IaxORI2oC6Rf/az3A7jk=;
        b=c7lDwdi+e6cTaQnxrHdvUxThsedFwAGe/n26HbTjiaILuVtX++8W1/DesnOiVS2XwZ
         PUvG6XC0kwGI3iq51rqgMiKF9vfTRPrgkgPDSc/0zg4CThY+6IjltaAh8P1Wf6IZ11Dg
         bZL+rpSMpnn74DU4szkDVrmL4By2IT8X6KS+CNbpMKLm9LHhNcOTTR73WQdMCU7c4SGc
         OJq8Frouwfvtmr2NLQUzVFRugaD670Rv07zAhPzHY56D2jPjLCby1uLbHdJjsuhaTywc
         WCvWy/ctY0OkK/XzZwJvvURbhr6cOTNVT4qOMyfOxsSH95UajmWpCCtg0zDDW977Uq73
         T+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773787452; x=1774392252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QhlXR0bjoLoJqmPjrCcZS3+IaxORI2oC6Rf/az3A7jk=;
        b=N8yVAbVHMRfsXhMDezHYEZ6xZAOG8HM9bC70EHo1GkJftYQACxLNTMuhhWB0Xo5Iyh
         juf6B6kuEyhNcI4cUBrKt3AyNqDGIlIzkfJ8fs1UCdXFe5zmFcAerOl7EMXdAtxYAwGo
         M32e5iPeh0853oLxplwGVB+hzJS9pnUY3eb4UW0mCc55I/hpYmmUpWmn2WDgzn9Oi+oJ
         qPQCmhjFWc3GL1j6BKTS2ybsZVpUjsUFRDNWZ4/ddbQe+0fQghwjLPXwxaccdFX/5ORG
         W4nGV3+W939F3s8w1ufNr1QFTUR/WAC2VNckS9kdoLwvmOp5nvuKStCa7GPWZTQfQMsU
         qjkQ==
X-Gm-Message-State: AOJu0YyCbTvh1j5LhjCXVLEr5UYiIPZVYOs2LVw0qj1DnNWUk5hioIiP
	7/xQDfaZGyyZz+Tp69ZZ++vuUwTUNEW/hoAjtpfTVVnKj2q6bhttyHLIfWpju+mEJTnDOO7itqk
	s6E27ENrpcMkh7beVe1UCWwshkXtVJllL8l12z4RM5zvEHSBAg5IOFWMk
X-Gm-Gg: ATEYQzx3WdnbcJQrZFCPQf3UhcroV2R3zx0lFrby0S9KwMIDfvp+XPdyMQfY4ZmSOpn
	vbO117cJAJ9PPXrJzx/bN3DsEhLgV2L03HGgxEJfa3G/h7JdFa8n4GV94vUWfMtxIcflzC98hui
	QJ0dxB05qPQtiC2EsEwnNmV8I0jbjNWaUCG1IETT2emgt2oLseLWf36qhFg3N+ZwTaP0pPJEk31
	qNtwMxvRSgw2TI0mwsIpf25ahWl1lZKUoZ8/1PxWgXqmF2RbRydVj00IVnv9S6wCSQ+Hv32v948
	QkirnDxGVNemm+e+jA==
X-Received: by 2002:a17:903:a86:b0:2ae:6887:5c26 with SMTP id
 d9443c01a7336-2b06e3fffa1mr9324115ad.48.1773787452393; Tue, 17 Mar 2026
 15:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603180630.HWujluGX-lkp@intel.com>
In-Reply-To: <202603180630.HWujluGX-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 17 Mar 2026 18:44:01 -0400
X-Gm-Features: AaiRm52Qj5ouy4jlz5vEjTHTE70npuSIvBFoAd8vEdMmyEnbMCEKS-HuXrl7EWE
Message-ID: <CAHC9VhSDvtSUgbOOKbN6O4S8u1sQ3HJyyo6WugWYcSkgpucUAg@mail.gmail.com>
Subject: Re: [linux-next:master 6300/6828] fs/erofs/ishare.c:157:15: error:
 implicit declaration of function 'security_mmap_backing_file'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 6:29=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
> commit: 0e2baaf8fed0eba6ae83949b8bd317d808efd220 [6300/6828] lsm: add the=
 security_mmap_backing_file() hook
> config: i386-randconfig-003-20260317 (https://download.01.org/0day-ci/arc=
hive/20260318/202603180630.HWujluGX-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260318/202603180630.HWujluGX-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603180630.HWujluGX-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    fs/erofs/ishare.c: In function 'erofs_ishare_mmap':
> >> fs/erofs/ishare.c:157:15: error: implicit declaration of function 'sec=
urity_mmap_backing_file' [-Wimplicit-function-declaration]
>      157 |         err =3D security_mmap_backing_file(vma, realfile, file=
);
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +/security_mmap_backing_file +157 fs/erofs/ishare.c
>
>    149
>    150  static int erofs_ishare_mmap(struct file *file, struct vm_area_st=
ruct *vma)
>    151  {
>    152          struct file *realfile =3D file->private_data;
>    153          int err;
>    154
>    155          vma_set_file(vma, realfile);
>    156
>  > 157          err =3D security_mmap_backing_file(vma, realfile, file);
>    158          if (err)
>    159                  return err;
>    160
>    161          return generic_file_readonly_mmap(file, vma);
>    162  }
>    163
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Fixed, thanks robot.

https://lore.kernel.org/linux-security-module/CAHC9VhTiB73F9fB1o3K4NfJ-Fa50=
MsVA_=3D79kn6X34L62J_TwA@mail.gmail.com

--=20
paul-moore.com
