Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D06383C78
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776111479; cv=none; b=lBw/Dw8esx420CUAj+tWbJQ3V9RKN4+98duaKfQXmlE2T5QHWJ6PKp+zNPJmNgX2J7hyN56bK31ooY1qN+4qnXbrOEl9/CnCUo4OLyKORICzFNqKhWQ0xwEVCjnPtVOQfPCdXRc7p3x5NST8wSeIxHP1WvCX9IVMkQ8TNjzMyME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776111479; c=relaxed/simple;
	bh=wP4z9P4uZmwRAO8DvMsuP8Hd8F9gBkWn4g+KT+IeUYw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tGVnKmilACpNCQJGzcF45cO7jULAEfDQoOVur0UlbSmLVkOQ0B5P10ebXSeaxK6TNX5Mw2l/6A23CjN0u6PSfR7kz/X/RRuQc9iJzFrFu4lftD3Dw7UvGB5h/V2KQ2ZxVXsUK5evAAgOr0MHWvpgJ+/kdNa8dzXK0Yijb9tfDf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLsTqNM3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLsTqNM3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfd96354aso2767426f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776111477; x=1776716277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QonialaOeRsx+GeBfarh1r5oZZLkjbGCk56wYsSk4i0=;
        b=LLsTqNM3LJq1gHqoDa37MP55+6LBEf88pvcycca/Vi4e4XoSqml2bdeznh369rVXV8
         DD3Z0Ai375DIZGToXUs3wsP7OxvyQk3eEUIURoOB/qn6QP08wny//SJRfQ/MHYCJmSpw
         uhueU6zPAFjEkLk1wVpnRBdCmKV59XmFHTWe7JYlfHV6KWB3EY2LIO6SSINUO6WJvZsb
         1dIgPDDHmjoMNOumbp5HMQ+4/U26rmvuemxGcTwreO4YBKlQ+4AHKAjSTNxZpP6FkQCb
         6yP96035qqFuNqcGAyDx4olfkzGlhKu3LyS23wf6nn5ejee0JY/ylEK/82rwPD+p/EKf
         4aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776111477; x=1776716277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QonialaOeRsx+GeBfarh1r5oZZLkjbGCk56wYsSk4i0=;
        b=fyUqa+Il3JvIC0UJsAGRJPHZoAg4QJ3yT9sySJqzU91BWVH2R1iwRPDxDJCnm0ZJgQ
         snQarmw83IM2DpYg+EvhueG8x7GipOdx6tOGYG8LTP55yeY3OZKI+EI0l2piP1Kns+DT
         lB1JD1b46VPncjgVdBf3H6U7bS/h5bAy4FdBpxZaslPGTFICFdoNXQ5BpC3yDE2ulvLo
         qOgrHK74dOXA4SWTcRF4juNbO2acRklQi/V6IExMDu3/GK1FYrI32DqMjkR6V+h/gG+/
         C7kH0U4Ex5bMj+jt07ilWWIY0XBSeKo94d9ZgGMYTf9373KQNysq+pVlCkICB2NV97dm
         S57Q==
X-Forwarded-Encrypted: i=1; AFNElJ/4LARQHOPSVnk/huQfmFPRwM/EzS+tiC8YeyUDEzrYU56EalE1gITkUUMN+0k9DZbo1IcK7enmAOe3Yb2v@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2BDYJ4SLIT8c4Jq3XG9uZWf1wXaR1HobU0iUONP8yXubj3A7s
	qSFfYudDWESiz0dmEg81bJIcTPkJlVxazcUssWjijZAGBgF9jEnqZBxU
X-Gm-Gg: AeBDies9sU0GXLH1TZYR/hSkNAbETueON8W/6GNCe0FN/0ivdFHw0gr53XXDEv9W4iL
	BAPnKLquj1zB62jTOjnlNGCQ5+w1CMY/A84aLLXYqFmMORqta63/PVmYH+mkjdYDv64AhbwSvXv
	s4UANzCdC3zsN7tTEyXwyQQbOcNg63wfGp+ZTAR7p0U1khuyyI1fdLW5tnOmR7nE6dPLXAYXDxM
	f+UEVqoW4LonbmjV90wwpesPYy/rU/ukC8Di8aXx24emewByk+UVefjc4v36lhkecBhaXf+ZFKo
	iO8V85rJDRf5zGb7clC0kmbAOaa/LTxEtbftfxoSwVvFZgT4d7mXETVDc8As/IMIttDHrAHB/rQ
	AFe1UCSwrIZV/7N9XbwwJus2kyzq0kteayusEu2bqksxdirTjHjISuqdvUo09EMexsmML0riewt
	oq71P9e6QkKn2maX15VmkoMVjVJgLcGURqyGHmq5ZU4tOUzOyTcF9p5etJawus9ng7BXNBsFkJe
	CQ=
X-Received: by 2002:a05:6000:c4f:b0:43d:68b2:a0ec with SMTP id ffacd0b85a97d-43d68b2a2b5mr12724663f8f.1.1776111476618;
        Mon, 13 Apr 2026 13:17:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec295sm34973689f8f.14.2026.04.13.13.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 13:17:56 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:17:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: kernel test robot <lkp@intel.com>, "pmladek@suse.com"
 <pmladek@suse.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "john.ogness@linutronix.de" <john.ogness@linutronix.de>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 "francesco@valla.it" <francesco@valla.it>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, "tglx@kernel.org" <tglx@kernel.org>,
 "shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
Message-ID: <20260413211754.643f6113@pumpkin>
In-Reply-To: <MW5PR13MB563241C9F7C8BCAF0D5F3D21FD242@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20260410203741.997410-2-tim.bird@sony.com>
	<202604121822.OvOLcTnO-lkp@intel.com>
	<MW5PR13MB563241C9F7C8BCAF0D5F3D21FD242@MW5PR13MB5632.namprd13.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Apr 2026 17:58:34 +0000
"Bird, Tim" <Tim.Bird@sony.com> wrote:

> Hmmm,
> 
> This is a false positive warning from the compiler (see below).
> 
> I apologize for not catching it.   I did test with CONFIG_EARLY_CYCLES=0
> and I'm not sure why I didn't see the warning.
> 
> I'll see if I can silence this warning.
> 
> > -----Original Message-----
> > From: kernel test robot <lkp@intel.com>
> > Sent: Sunday, April 12, 2026 4:11 AM
> > Hi Tim,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on linus/master]
> > [also build test WARNING on v7.0-rc7 next-20260410]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Bird/printk-fix-zero-valued-printk-timestamps-in-early-boot/20260412-134726
> > base:   linus/master
> > patch link:    https://lore.kernel.org/r/20260410203741.997410-2-tim.bird%40sony.com
> > patch subject: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
> > config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260412/202604121822.OvOLcTnO-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 15.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121822.OvOLcTnO-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202604121822.OvOLcTnO-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from kernel/printk/printk.c:49:
> >    include/linux/early_times.h: In function 'early_times_ns':  
> > >> include/linux/early_times.h:45:61: warning: division by zero [-Wdiv-by-zero]  
> >       45 |                 return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;
> >          |                                                             ^
> > 
> > 
> > vim +45 include/linux/early_times.h
> > 
> >     34
> >     35	/* returns a nanosecond value based on early cycles */
> >     36	static inline u64 early_times_ns(void)
> >     37	{
> >     38		if (CONFIG_EARLY_CYCLES_KHZ)
> >     39			/*
> >     40			 * Note: the multiply must precede the division to avoid
> >     41			 * truncation and loss of resolution
> >     42			 * Don't use fancier MULT/SHIFT math here.  Since this is
> >     43			 * static, the compiler can optimize the math operations.
> >     44			 */  
> >   > 45			return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;  
> Based on this conditional, it's not possible for CONFIG_EARLY_CYCLES_KHZ to be zero
> on this line of code.  Does GCC not catch this?
> if (0)
>    x = <some expression>/0;
> 
> So this is a false positive.

I suspect the warning is being generated before the optimiser throws
the code away as unreachable.
You might have to do:
	return (early_unsafe_cycles() * NS_PER_KHZ) / (CONFIG_EARLY_CYCLES_KHZ ?: 1);

David

> 
> >     46		return 0;
> >     47	}
> >     48	#else
> >     49	static inline u64 early_times_ns(void)
> >     50	{
> >     51		return 0;
> >     52	}
> >     53	#endif
> >     54
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki  

