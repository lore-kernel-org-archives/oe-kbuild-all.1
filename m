Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466927A12B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 12:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644449; cv=none; b=WIETwCpPvIa2rVTbhGrV61vBeKR2mHIotR35/+zlNvgDa7BABCmfgBW9m+7RZd06EScT0l1lNcKe4O3Si6bc35jLoMvqD/hyKzXfBwFljfGn7fV/AWn50KWM6hY+yEBKPshxcE03nod/KxQ4tcP7+m2dD3vMFTVjF4/J4pCMPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644449; c=relaxed/simple;
	bh=IHppgvzI4syY64UndWNyNk/lcgm8Qzoj/IK3X0IV+MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ogd9hLs9WIHrECdjcDY+YXBicax3nSMXPJP7dYBK/0iRBAw0GxiaAY+CrhOq24kje481nvptl+28SWe8V/lGnCIWecqCiBFVpFmGqo6VkIeimHvUEPpSSC5mAt8JyhOn9WQPWusbL28Nf269KhI7s+Aoj1NIqBQQNuWqYy0WuVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOzWo640; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOzWo640"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3ddf2993103so4101105ab.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749644447; x=1750249247; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBvjnZ90Dp0F8XMlzbkh5jxvl8CN8DeTIwQ3MbTjXNw=;
        b=AOzWo640hiS4agMDuFZcqYHgXesW1qE/SwhCYbLDIn2YkAcGvuRGqKjqOyLScBAenq
         wKqt4EKubOl2SdE95kC5v1zZG450FR7Yni2nvQS1EiCYhhMLi7lye6+tJ/TL0BhXbYl4
         NXZw6wuOwvhLrffhE0s26g56yBmLX8L+wa6En4JSaQESAhV9ujfOhePXKBOgdpli5U6W
         ltr9ITjXftx/yeKl8DPSjRz0pqxzhilCrNenDy4/PtvS/OTqUE/STDbAHFg58q/TT4H/
         xEohXpV7sFVZWH9F+O0nB5A+Og2mV5HR45Si7r/eDSRHDcJrHSfPwqISYSquSJ390pOJ
         YQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749644447; x=1750249247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBvjnZ90Dp0F8XMlzbkh5jxvl8CN8DeTIwQ3MbTjXNw=;
        b=Vy/Jny84F4IVwxudJM9fIvHjSloP6mbYd9X4qFEY4zAiY1lp59Lisp1HDj6WTvdwZu
         A9n3jL7zuNFbigb4IRIAfsv3hDoVmKV02JmQUzWj4VWJyn6qPhy7MKLiVf5RvyZhhYTO
         +hidFPVgno3oDjG2vuh2nGeVi1IflS22oJbYhKWFbdrlccvm9b7iPClvpaEgihY0kq+C
         m4YnqW9O4TLjY/1wSRytyBu5tm1DHGh41Zjg1eFrtU+XEditLk/nrOQi37nD2RGab01v
         sL4BXniAn+ShCQkOeL6F4BzVbMH4EqS+l1m3DtDpPV4R3uDIE+FKR0fxNUJaEExK0bD+
         ndCg==
X-Forwarded-Encrypted: i=1; AJvYcCXBUa21NRLb7xp6g2RLJAwzUr8iYYOtMpgg3jvOX2MNULnZMtO79QoQEYsfC+PA3tQm+RiKJSt4r8e2FCxe@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/4DZvZS86pxHtYGnIViFLLiCUE4jOwSYLhCo8tQavtWveufwh
	Ug1ltXCRTbmTEAUfAI40/AanrFl8+Ua6eBJn+EqZyOsm4Bw/XYMIhnuCmId0l9PgI7OmVXqlqRG
	dkmrzDz2vQo/PcoWnr62BVbVCd3T/tcE=
X-Gm-Gg: ASbGnctMujeqQM8SMls5SAhQKKLAS0XHR1wFtP5rv22/HeB0V3yX9QmRNIs45sxmzob
	YFKi8ao5nN212CH9XsVpT5ntAq9UQav8HFyiVzrl4HC9foHvPmKyt3UmgCBvuXQEef0BQDCplXh
	Fb/eoqMj7N16mvQY/6L8uAQoCLhkoMRglZyPmpAwfFMUY=
X-Google-Smtp-Source: AGHT+IE4k8M34kH1+0to98qZha6YDCpF10uoPuQmWlF7JjAoPYaJi/BRbveOdyY4jpVv3FoTiXKBp/TgaddM4ZbrpUk=
X-Received: by 2002:a05:6e02:1a6a:b0:3dd:f1bb:da0b with SMTP id
 e9e14a558f8ab-3ddf423ed49mr34966435ab.7.1749644446692; Wed, 11 Jun 2025
 05:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250610004844.66688-5-kerneljasonxing@gmail.com>
 <202506102340.uo7QDaVk-lkp@intel.com> <CAL+tcoARvQVgd68HGoXXiK=+RSH12WQ_rc47B4rgtt2Eb05c0w@mail.gmail.com>
 <20250611170845.8f88347e3cba51cf15a01b21@kernel.org>
In-Reply-To: <20250611170845.8f88347e3cba51cf15a01b21@kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Wed, 11 Jun 2025 20:20:10 +0800
X-Gm-Features: AX0GCFt9o6cS486F4_y9iaF71LRoSu0_FvAk5vs2fQpwxofQ65dX1xlkNYbdtGU
Message-ID: <CAL+tcoBDJty6o_-c4__P=BES_uP6emO3TcuUTrFCJ92j2wNWPg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] blktrace: use rbuf->stats.full as a drop indicator
 in relayfs
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: kernel test robot <lkp@intel.com>, axboe@kernel.dk, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Jason Xing <kernelxing@tencent.com>, Yushan Zhou <katrinzhou@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 4:08=E2=80=AFPM Masami Hiramatsu <mhiramat@kernel.o=
rg> wrote:
>
> On Wed, 11 Jun 2025 13:15:40 +0800
> Jason Xing <kerneljasonxing@gmail.com> wrote:
>
> > On Wed, Jun 11, 2025 at 9:42=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> > >
> > > Hi Jason,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > [auto build test WARNING on axboe-block/for-next]
> > > [also build test WARNING on drm-i915/for-linux-next drm-i915/for-linu=
x-next-fixes akpm-mm/mm-everything linus/master v6.16-rc1 next-20250610]
> > > [If your patch is applied to the wrong git tree, kindly drop us a not=
e.
> > > And when submitting patch, we suggest to use '--base' as documented i=
n
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/rel=
ayfs-abolish-prev_padding/20250610-085150
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-b=
lock.git for-next
> > > patch link:    https://lore.kernel.org/r/20250610004844.66688-5-kerne=
ljasonxing%40gmail.com
> > > patch subject: [PATCH v4 4/5] blktrace: use rbuf->stats.full as a dro=
p indicator in relayfs
> > > config: arc-randconfig-001-20250610
> > > compiler: arc-linux-gcc (GCC) 12.4.0
> > > reproduce (this is a W=3D1 build):
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202506102340.uo7QDaVk=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >    kernel/trace/blktrace.c: In function 'blk_dropped_read':
> > > >> kernel/trace/blktrace.c:421:39: warning: format '%lu' expects argu=
ment of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'un=
signed int'} [-Wformat=3D]
> > >      421 |         snprintf(buf, sizeof(buf), "%lu\n", dropped);
> > >          |                                     ~~^     ~~~~~~~
> > >          |                                       |     |
> > >          |                                       |     size_t {aka un=
signed int}
> > >          |                                       long unsigned int
> > >          |                                     %u
> >
> > Well, I suppose I will fix it in the re-spin after receiving more
> > comments so that I don't need to quickly respond to this minor issue.
>
> Please update the patch and send series with my reviewed-by on 1/5.

Sure, thanks for the review.

> BTW, size_t should use %zu.
> Please check Documentation/core-api/printk-formats.rst

Thanks for the pointer :)

Thanks,
Jason
>
> Thank you,
>
> >
> > Thanks,
> > Jason
> >
> > >
> > >
> > > vim +421 kernel/trace/blktrace.c
> > >
> > >    413
> > >    414  static ssize_t blk_dropped_read(struct file *filp, char __use=
r *buffer,
> > >    415                                  size_t count, loff_t *ppos)
> > >    416  {
> > >    417          struct blk_trace *bt =3D filp->private_data;
> > >    418          size_t dropped =3D relay_stats(bt->rchan, RELAY_STATS=
_BUF_FULL);
> > >    419          char buf[16];
> > >    420
> > >  > 421          snprintf(buf, sizeof(buf), "%lu\n", dropped);
> > >    422
> > >    423          return simple_read_from_buffer(buffer, count, ppos, b=
uf, strlen(buf));
> > >    424  }
> > >    425
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
>
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
