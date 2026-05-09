Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9684335AC2F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778333845; cv=none; b=SKAzaNxGwb6dgRdXGlVjg6BvCG2u40CB5OckvUD3+2LZ2hN24rUMb2VAsmSgWM4o7VP3wA7RSjnVSD3ihQVGa+czAd/h2n4OkmaRSgFCz+mozDWZEOOvWNq5Xkyg6AexBxF7P9D0V1wi8iOpUAuFhHO5+FVA6pcw1cmAi3H7iho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778333845; c=relaxed/simple;
	bh=OX92iFowgg0FF+w6+u2F9KbtP/NGPO0PE4kr+VGE/cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ/DeotPttFZT4BtTCtxjCnqO8DlvEWgk47at9CsuzIfF0bP12hA5v3iLR0Sd9Mj+Uf4h8vf18C1fGQT1MQM7Leh43fHQjgYJj+nScd92yKsuEQQuJrakLuvEoeLDRcs5QEjS95eHgnL4edBMXcvIsPRyhKrZpR5YCW3ejs6+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3QbfDZb; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3QbfDZb"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8ec37d52c0dso421209785a.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 09 May 2026 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778333843; x=1778938643; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVhGQd+1Hu3FoYgscNuPJ/UD58WW9Gt9dwsArDghjfQ=;
        b=p3QbfDZb+SdBPyenvyJDNo+bj6cJBbkAMUV9Tf6Rk9EGZrQfJdBEPQuBKiejJM6Xx2
         DeFigQgUvU3YJqrkbWnzxFyUIh4e4XIjNlQ4OKyAF9JBdqkH6v+PP58s8IA3kJOSLYKF
         bNAnEtyB0FoJtdIJWp6q7g+HJ4oAQp2ovBTWWf/R/Sq2MpgTPGy7RQkYyOu+19lmxTPT
         LVTBqNoxtOLl5PnspRCxNH5QRINBCMR84D818njtoRklkVkmFhpGnlq7wMnGHdHMq9My
         je11xCThFGcVG5TUfwOeCY58io0IWtoeNGtS8/Qnahvqr3OZHQ2laWuT2YGAVdVSGw06
         bS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778333843; x=1778938643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVhGQd+1Hu3FoYgscNuPJ/UD58WW9Gt9dwsArDghjfQ=;
        b=gYMXOYrjwDMnt+YnQUVqKIXzgg7huc357DXiSBHfuUjapNzLrzRSeRaUNxhiTSFwYk
         CWOeg9VOVhUYZT9YMF0xz/9NJW/8hSkawZEnkS4TwBe5jnK33c+/lq90LMnFi87KGB6j
         +VnCSGeijCE2TFFxkD4adDSK46jzbjSK4VeNlze2dFiZY4HML/+bGfx4bAE9Mv/oKYzm
         MRTq9X3NjcuJJXsfWfmIb+el9DOZYItnnpryOJbcMEPQxwCserZrCsk9Nv3IPPVE7a86
         KpQHF9j+zOQNakyTawryochFEnkNYWpsadjG9xzRCWvtE7qbjcEbUKADSV2Ggwryi0GE
         8DiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ECSvdyvlELSJvqR7TmNPom0LnHrDtrYZxvy+s229gy085ZETltY9ISb6g0q1grfVZIVl5ra4tYF1PZ3er@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp8i8bFS+vDe0BW9+Weh9BIiXC2W4RnsM7fSD20gfQaG7SKVkM
	HQuF7TPgG4ywrqHsqKlCMH++OqJICjjOX+lri7J5+MP0vy7ExOxV3Kuh
X-Gm-Gg: Acq92OFIs0QmwrI3cKBmFb34pQ+ocnZd5+4V6BScGpZznqUlVBGqxE3n2TkL3jd8Nde
	NuEH+927Whb4McMcSNiRKRQpIltZX3OlQ+noJlhdvJbKAHsWmhJq/C+ijejFI/bYeZAnFQeTvY7
	+3ujFodICuMoHiFKM1wt5avhVDg0lwkR7HgQeR5+VVxbvtdSGCugDPXphBUeuN6F81seBdAJeJ2
	MAB0HFvftMk5K6rGykIg+YnhM+HW+OU92OpUifjnzmx34YpzmZcVccNuPtfMpTcUN2UbQIfqAwd
	XiXGg1/OrLSjbJ0Yuz9W732qwDKpO1Zj4pd6KVgDBRI//Q608KOr9hO2/MqLSAxoe6iJ2zDHQWU
	9+wdPoDxjwC8gbaxf+cyUBAN9BWF+Z/mLb2P7sgPuDGWbx+iObLZNRPKjnl8oM1+duq4LlBdXt3
	o1vz9g3eRz6CPJTT/kW23V84TM5DMV
X-Received: by 2002:a05:620a:7017:b0:8cd:b44d:b1c0 with SMTP id af79cd13be357-904d70c350amr2457032185a.53.1778333843510;
        Sat, 09 May 2026 06:37:23 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b87c415fsm538354985a.28.2026.05.09.06.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 06:37:22 -0700 (PDT)
Date: Sat, 9 May 2026 16:37:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 4172/4394] drivers/block/loop.c:413
 lo_rw_aio() error: we previously assumed 'file' could be null (see line 400)
Message-ID: <af84jZRI5Z6-sMdG@stanley.mountain>
References: <202605092030.FAH71Jou-lkp@intel.com>
 <89472180-8c8e-4fd8-87bc-7122d93e6c2c@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89472180-8c8e-4fd8-87bc-7122d93e6c2c@I-love.SAKURA.ne.jp>

On Sat, May 09, 2026 at 10:32:06PM +0900, Tetsuo Handa wrote:
> On 2026/05/09 22:19, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
> > commit: 1a83d226268cfb9ea546febe6515f39584df8fd2 [4172/4394] loop: check refcount in __loop_clr_fd() and lo_rw_aio()
> > config: m68k-randconfig-r073-20260509 (https://download.01.org/0day-ci/archive/20260509/202605092030.FAH71Jou-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 12.5.0
> > smatch: v0.5.0-9065-ge9cc34fd
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202605092030.FAH71Jou-lkp@intel.com/
> > 
> > New smatch warnings:
> > drivers/block/loop.c:413 lo_rw_aio() error: we previously assumed 'file' could be null (see line 400)
> 
> Thanks, but this is intentional in order to get reported
> at https://syzkaller.appspot.com/bug?extid=cd8a9a308e879a4e2c28
> after printing debug information.

With these zero day bots, I just have access to the email which you see,
not the commit itself.  Maybe one idea is we add a comment when we're
adding linux-next only debug code?

On the other hand, reviewing and sending these emails is very fast and
costs me no time at all so I don't mind either way.

regards,
dan carpenter

