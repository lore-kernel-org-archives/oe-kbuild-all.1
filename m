Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70C437C93E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 01:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790819856; cv=pass; b=nFodaHTt0tI8kYaK4Xri3bZQFfTx5m8Mgzdicuasfr+1LvSV0v6eATFr43PVrnSc3mOmVk9F7fczyPxwx5vbFj94+6V2uOColkoj0QVBqlF8bdHHBppzJm8qfFbyNcQqstcZkX5CqAgZEVKeXv/iY4tGaI/B+k0yUJ1rEikMWy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790819856; c=relaxed/simple;
	bh=/c9zl+54hwUOmTa4dg8v1MVpQXr+ZCCukq0n4KeatN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbDDNu6GCuCIPhYJ+6To7hefRsCUzJ+pWvbiW1L2nJsar+WxTbyBYHjpu8mU9YfbwTSN+9gh8+DK/O0F+eXyx82/sISiuhuGI6dGOIbECuJfvmeCjcRlV1DMAjO93PhU+jOtlv/tczycR+FfuzyydNniBOsdMH5n23bYf/XNFQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXaxfFWX; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXaxfFWX"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so9567432a12.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 18:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790819853; cv=none;
        d=google.com; s=arc-20260327;
        b=gwrCqJBKrpw0Xk5C+hXy52IXa7HoyArHhrzQ0rLoj8FF9ZkX8kbLIW+WQXyKNTSxt5
         pyqzsJsiZQJHsd4zmy29IdLKnsa0AONh8uwcF6hTeuvdExacRvXjv4ro9/GBSA7OS5tT
         urowvOjoMMcWUF/qKogirChyr0tsUm2G0pIhUC1SRDgvMXGdgAXLVPHKdNrmgHkidvA9
         BY0lidQ5ExIzxYao/cQmi+bv386pHP7Tvhxu9RSzCWMSTxkUx2RPBV1pEyp2Uc4UjeAx
         7j3IQjRwIppAyrbxxv7kZpwTwYBwdA5YpJ9I+W998o5V9TCxXmErVTXXkvoibJ/BzBw9
         nPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tBP3/s6NEAaT8tzfQC2+RcFOiREARtUaIJfcIZI+wy0=;
        fh=D+vymhvx4p7uPMIXMu98oDd43LWHy+2Ccl/nGCdKDV8=;
        b=JwBdwtE2yufw3SugeFhc4yV80z9rd8kyReT3GhukWJlrf+q/bzySUXf1ZyvllovMx6
         1zMlAg2duB/hUq6PpJX1yJy9mJgzT2uKFe2urlUMIyS57oDQIECEHHEUbN4Octuecfy0
         aDo3LUAB6Kqvv3bP/i2Zhlt23TZb7u5so6F/x2TlAwMjTB1YEcxg6R4r4yAzoBUjdkfV
         ZkPitG+IasZHuoNQYkf4G+JH81WM5nfHdymTG8XvkRUPJUsoCkzIhTDauK1Eg5oiej2U
         NqSu5D9hs/K7tLvYrm85mq1E5AFrXXPo/Jl/JQPKqaMgI2HtLwxbVFBg4x/ui1bUGj49
         xD5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790819853; x=1791424653; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tBP3/s6NEAaT8tzfQC2+RcFOiREARtUaIJfcIZI+wy0=;
        b=aXaxfFWX71QnZvJWHJgSsvcG0Qp0ND18lyYVxqy+BVxaxIxxRpo5uFviL9Fx2Gwlxu
         VaTegq2aE+lSMLJshkE3EC6Jgtz2vszw9pgTnqTPQ49QT7CtRWqmevsZJoa8zjfGrZun
         8Iuu0IoFSKp54ul1MhVvzz+9BMUnxUg//kAAJKU1LlWHaIFodBQRO97WIqQ+A9y3LBCj
         RoeV5D5DWpzMur5QaLn3QojwXttEJDqd1MuKaWKeQprqea3V2JlVMRqqSLiYwKEdAxiL
         T2nfae9LDQSprMmNi22gQEzFqYAd7w+l9/jLKgAaWC2FO99yGbquOuNosj33RDsnl4xY
         PXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790819853; x=1791424653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBP3/s6NEAaT8tzfQC2+RcFOiREARtUaIJfcIZI+wy0=;
        b=wbLakATxWHtLLeNwE2OEttuYEGV/7qoXOjgcEaWQHveLYLdaGJPZ9Sh0ivIVEmZZZs
         ZlkJDC9Y7G8wWX40jzUUWeqImMlQ9dW8havAD6aTG37Lx/kN7IW3wJDylSfyksjU/e+m
         FDrFL7WmmW+WzRy8yVTXw5hxD3+1N95COLgIwmAIe2ts54CLNkAYlazCK4UhDm4eb0dh
         kjGEiiEWF9cn+ORBNcARHmWWZ47GSl+Fap4ihasDdyfGeYkSl9bMdEu6gRfLsPTlsi90
         Q8NylB3JSPWcJXgiJYEyfVA+bQskYPrBGmw6PYLsTy2zTJuUCy33Bg3iOVKV10ShbzMg
         cZcQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2ffU19L8mYumk+Jdz24n34muWsExnpvq+ZYTvD/hRr3ktqK16kaQhSJuXVJk2oyyKbeLveS0SyI5wDLc3@lists.linux.dev
X-Gm-Message-State: AFq9FYJGUJcXyA7WdON/f2TMksY99goE4MtDAoYZGks9QyK7dZQhgFX/
	L6X7n9GbBoda1EQPFx/HVLlP2R+/9ovNodZnd4JjmB09qVCE1DGRmNxtMdHOK7oTXEHTQMBszjN
	sbCNLH+4j/q2Fmacwf1EdRnWPzNa0UD0=
X-Gm-Gg: AYBFou3dbCSUWOqUtpD5KlyhrWp0vD5Ifx4cdaD6SHZttJ9nRuEvJiR5iUCGLbEdU5y
	TUsox1uq2vJjkjXx6oJ5dwuFGmBlzpIcwx+YFnMRdn6a5vzeRrg3Awkz03JdCw22pzeql/zduse
	ndez84cm8a/R9ALYO7dzxQPrVaMDwyLZptl0DRnhwXO7lv4BdqHXPgsyflBe4hu3WPzZzQfTSsB
	ZPLUruwFLMn2PFmSqCsf8YU+DqUzamXFWsOW5qWtMbJPeHrisK0d0FBhF6TdvxQzyj3ysFrP4bW
	rfWAahrcMxWkecTQKbvN2vuaWEJvzopABv3ajiIKEknB9GSGwVq4QfxQTDi6EHmXldFiyrl1INA
	UaqkUKOnxb69+2wemYgsvOgR0xRNwUrvb9BJPS2AQM86GgN21fES3BWTNkJTe0xUKMuWl3xp9uo
	Fyaj7hgO85bgC97jfohP+flRgv0DdOOVogYw3ML75Iu24QjrgXG+oLT6Bi3zNJJmq9GerdnKEwi
	8bWzXfQhJTpXLoUEEs6iw==
X-Received: by 2002:a05:6402:190d:b0:6aa:b357:5e80 with SMTP id
 4fb4d7f45d1cf-6ae1985c8abmr2311568a12.1.1790819852698; Wed, 30 Sep 2026
 18:57:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202610010151.2W0MrmxE-lkp@intel.com> <ar2eD2s6pDLd73DR@redhat.com>
In-Reply-To: <ar2eD2s6pDLd73DR@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 30 Sep 2026 18:57:20 -0700
X-Gm-Features: AclHuK9mUOytzfDF8T7V1Y8eAyEnjeGtJ-OTaJDbudHGy_i-egQOpkQj2g3zCbI
Message-ID: <CAKxU2N9ooKG_Wj42iguY6RsHat-=vFGWTwOjmi85CG1yjBi_ww@mail.gmail.com>
Subject: Re: [linux-next:master 11187/12559] include/linux/stddef.h:8:14:
 error: called object is not a function or function pointer
To: Brian Masney <bmasney@redhat.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:41=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Rosen,
>
> On Thu, Oct 01, 2026 at 01:18:36AM +0200, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
> > commit: d0b72c88671b3c46342bbebc9b90280890436c98 [11187/12559] clk: mmp=
: allow COMPILE_TEST builds
> > config: m68k-randconfig-r2308-20260930 (https://download.01.org/0day-ci=
/archive/20261001/202610010151.2W0MrmxE-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 8.5.0
> > sparse: v0.6.5-rc1
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20261001/202610010151.2W0MrmxE-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202610010151.2W0MrmxE-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from include/uapi/linux/posix_types.h:5,
> >                     from include/uapi/linux/types.h:14,
> >                     from include/linux/types.h:5,
> >                     from include/linux/of.h:14,
> >                     from include/linux/clk-provider.h:10,
> >                     from drivers/clk/mmp/clk-audio.c:8:
> >    drivers/clk/mmp/clk-audio.c: In function 'mmp2_audio_clk_suspend':
> > >> include/linux/stddef.h:8:14: error: called object is not a function =
or function pointer
> >     #define NULL ((void *)0)
> >                  ^
> >    include/linux/pm_clock.h:77:24: note: in expansion of macro 'NULL'
> >     #define pm_clk_suspend NULL
> >                            ^~~~
> >    drivers/clk/mmp/clk-audio.c:405:2: note: in expansion of macro 'pm_c=
lk_suspend'
> >      pm_clk_suspend(dev);
> >      ^~~~~~~~~~~~~~
> >    drivers/clk/mmp/clk-audio.c: In function 'mmp2_audio_clk_resume':
> > >> include/linux/stddef.h:8:14: error: called object is not a function =
or function pointer
> >     #define NULL ((void *)0)
> >                  ^
> >    include/linux/pm_clock.h:78:23: note: in expansion of macro 'NULL'
> >     #define pm_clk_resume NULL
> >                           ^~~~
> >    drivers/clk/mmp/clk-audio.c:414:2: note: in expansion of macro 'pm_c=
lk_resume'
> >      pm_clk_resume(dev);
> >      ^~~~~~~~~~~~~
>
> This isn't directly a bug with your patch, however it is newly
> introduced now that the driver can be compiled with COMPILE_TEST. Would
> you have time to fix this up as well?
Yeah.
>
> Brian
>
