Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E98A2EAE3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 05:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749618979; cv=none; b=fcrAOLx9xuRiRkBQfk9a8146TKEEq2DcruLveBIxej3YtflxkgAoftdB4dPxfbUIoOvNKro3wh8zf4UWDn1mD5VUTU3K6IgAR8ZyBjl4R6BW7/LJE0eZCDmtGhEz0wGd4zRfNINNl3Glvpt5W+F8dtS8vsfgEa7/MJb6Q2FRB0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749618979; c=relaxed/simple;
	bh=wlCPxC6nysb+Pxhesmb97fuUGPr/QfECgPqmZ3FlWjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwIQwDJWug/8SzqK871jTkH20Ep8nq7FgLpjOlot10/3W/+rp8Pn4x9xfDGKLp5NgysDxgVz+WPJpwgWu0MxNikID0faTWd/Ww6EL1Ygms3J26VUTBM+Ao7rHUMtKTFUx/HDKZDy4aY5P85JgRGpRcZAwpa+u5iYQZ3Lr+k/Nw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXV+rK+t; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXV+rK+t"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ddda14b56cso12094555ab.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 22:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749618977; x=1750223777; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZesgBl46zE6tXS+j7KyjhCxsxKgNitfmh/eZ0BBEw4=;
        b=mXV+rK+t6icuFXJ+d60llTr6M3fXXi+pZLvqfjTUos522mCY88OJOEdK4/pMIbT3aa
         eahA3btIp9fi6JQphNSvGDTylydoT1/81BOJ3j6MgGFMnlHBkWxrTkwr1hzbA2G8s3Vo
         98wLSBNahwmtdeJW1EQ+h9ITCPAjf72EXFgCT+q3AGHEK9UKTvY8w3RGpZhMRnzCzYA1
         uSnnqHjUyfXNrpPUDPia26X6AlpNUqWOkvUTJInQ7pxJ06ccwsDdUwef9lXgrkQqcH03
         5Fal2L2MzmudkqiQy8HedAlb32P92u4Rw2qwqhLOjhNalVVwGyfyBgzlUM6HlL4jZ6e/
         JyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749618977; x=1750223777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZesgBl46zE6tXS+j7KyjhCxsxKgNitfmh/eZ0BBEw4=;
        b=g95mdQwj3Jv1mEbr9sf6nEe2Kads/4iiM3N7CdlaKK5TxgY0snxWsUbxxYzMpiywDZ
         aOngXPBPMkzv2cpffneR0MdXpx80RpwFHHsrQp/bjrpJEIfSVvueSwjoYl+VtnOUEAV/
         q4NID2D0TIR9DUmKftxkYQg1fo6m/31JOfEwPasHsHyprfimzHjrmmJOuGBrfVoHi8G3
         z8UwAa+Oz1+yCA0SeOOWexfpn8KfNylBgNCvllr1luj8Dqz7cTBDSQCzUzA7WY28eYE7
         NQaSa2uanLzptAFN7VMn7VWELEVMic9Y4VkQlnzmFS+ThJ0dqV5D0ffhbAA6RRs0E7/H
         6urA==
X-Forwarded-Encrypted: i=1; AJvYcCU5LZRdjdfrRc8zNcjdbHQsALX18HwllubJbg5S0yjvcGmOVdY+CUwQjDVtxzj5jyFt8uWS4hYEZck7Gifm@lists.linux.dev
X-Gm-Message-State: AOJu0YyY7x+/dnQG3ks4bAGFtZhxdGyr+XVuyMAXtsdz3y8QTKGwKM4a
	wnwgByRt9eu3XAAl//FhBlItepJyByNdMh3tK876DFJcgrw0oOGBmWHzyC553VXIE0GCkRsJ9uO
	rIrTeN+7uWwVs57tgL1S1sgTa2xjZT2s=
X-Gm-Gg: ASbGncs94kh+AWC4JutWK4UT7qKuGibsdkSDn3/dDbcvAC5lqrwfM9S9AT9AfMwFcUI
	mEL71S1fOJ5oeL2rMPWM5VQtRKiPLdhaKx07oOEunGK9+YNtag1FLhQIw5XUE6P1JNNcss2ryr3
	77uvseudLqs1dBJ8iWG576dSBEnT9MpXTzX6cdT2Kj6qA=
X-Google-Smtp-Source: AGHT+IHQ182d3wwKSf9DtAyyoa6zoQyiigAylXfIEGJY0yChHhYFf6EZGcBQKjg3qJXH0CODyAvyDT8qQD7k3JAMoRA=
X-Received: by 2002:a05:6e02:3b07:b0:3db:86fc:d328 with SMTP id
 e9e14a558f8ab-3ddf4224b37mr23369385ab.5.1749618977137; Tue, 10 Jun 2025
 22:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250610004844.66688-5-kerneljasonxing@gmail.com> <202506102340.uo7QDaVk-lkp@intel.com>
In-Reply-To: <202506102340.uo7QDaVk-lkp@intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Wed, 11 Jun 2025 13:15:40 +0800
X-Gm-Features: AX0GCFvLGUUBleBgjthzU8tNmG3C8w7G2enscnE2vmODxHCKzCz7BeEkbxQED_o
Message-ID: <CAL+tcoARvQVgd68HGoXXiK=+RSH12WQ_rc47B4rgtt2Eb05c0w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] blktrace: use rbuf->stats.full as a drop indicator
 in relayfs
To: kernel test robot <lkp@intel.com>
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Jason Xing <kernelxing@tencent.com>, Yushan Zhou <katrinzhou@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 9:42=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Jason,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on axboe-block/for-next]
> [also build test WARNING on drm-i915/for-linux-next drm-i915/for-linux-ne=
xt-fixes akpm-mm/mm-everything linus/master v6.16-rc1 next-20250610]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/relayfs=
-abolish-prev_padding/20250610-085150
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block=
.git for-next
> patch link:    https://lore.kernel.org/r/20250610004844.66688-5-kerneljas=
onxing%40gmail.com
> patch subject: [PATCH v4 4/5] blktrace: use rbuf->stats.full as a drop in=
dicator in relayfs
> config: arc-randconfig-001-20250610
> compiler: arc-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=3D1 build):
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506102340.uo7QDaVk-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    kernel/trace/blktrace.c: In function 'blk_dropped_read':
> >> kernel/trace/blktrace.c:421:39: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsign=
ed int'} [-Wformat=3D]
>      421 |         snprintf(buf, sizeof(buf), "%lu\n", dropped);
>          |                                     ~~^     ~~~~~~~
>          |                                       |     |
>          |                                       |     size_t {aka unsign=
ed int}
>          |                                       long unsigned int
>          |                                     %u

Well, I suppose I will fix it in the re-spin after receiving more
comments so that I don't need to quickly respond to this minor issue.

Thanks,
Jason

>
>
> vim +421 kernel/trace/blktrace.c
>
>    413
>    414  static ssize_t blk_dropped_read(struct file *filp, char __user *b=
uffer,
>    415                                  size_t count, loff_t *ppos)
>    416  {
>    417          struct blk_trace *bt =3D filp->private_data;
>    418          size_t dropped =3D relay_stats(bt->rchan, RELAY_STATS_BUF=
_FULL);
>    419          char buf[16];
>    420
>  > 421          snprintf(buf, sizeof(buf), "%lu\n", dropped);
>    422
>    423          return simple_read_from_buffer(buffer, count, ppos, buf, =
strlen(buf));
>    424  }
>    425
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
