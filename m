Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E2E30FC3D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760695942; cv=none; b=H45X2cys5fHLFLQ/ohSkZpFDkdEc4aYVbsCSYZt40P79PvMTGNp/Sl7nX/UZ1ZJEeKR2fIyefBRUhI2hAubMYdB1MAx2fv18/wsYq/rsffswvB4qwhFX5Vq7HVXiG4qyf7x8/BT66dhtODk07Uu9XWH/dhxCypLB3uW9cotbyUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760695942; c=relaxed/simple;
	bh=LxfKf1rMuw5rL6S+6Rg17frkQTovaCXaZTfO70TM6oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vExcAVsMqd9PKNU1W9nGZo57Q9beBaNOgPJfjbQDVvp3huOtprm7mMotfnXYsnymCjyk334pR6tT65qmo39Mwo89EEQQj28MGdnZX3CkZb7fkCB5qmCH7Cn+WI5WLNIiq0w3pMpo4Vwg12itmFLbvDMnQLqYGvDP6ZPZYPGCdyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=abK1j6dB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="abK1j6dB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-471193a9d9eso7562885e9.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 03:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760695938; x=1761300738; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IcAE9gTZ+/oZemSW/gjSvTAcO1JCiHDPx7fInOY/f2o=;
        b=abK1j6dBgh7c15j/nQudG4rZmewWTGqkhsTdra0hj/1HP/XcrwVcmmDcheNuydIGrV
         3eqo8cyA8AThz3S5rwkG2jzdheETPnENmb0difrI5oMuvFOcb6zwXUBplcCkBhQAX8uI
         EY7XcbTbMINYrtzQpQoqUKppsRxwFpzyYFVeWP4KOk6H5pCbVH8FqyXXDEGg0ZwOW/Hn
         1zy1ljzIsXW6v9YTOuoWVGXkm+FxVQtJyJ+GqbV6VDVxLgioHYiGmKXn2S+aqsZT+xVn
         T5RPh29m69Fz3hDq5x9GpksJm9nWbqJB5Wen+Dbe3n52EVS8uoz/DrbGneC37rXrrnXl
         Ak3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760695938; x=1761300738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcAE9gTZ+/oZemSW/gjSvTAcO1JCiHDPx7fInOY/f2o=;
        b=sRj4UvXWmTBC1bR2MQiPFSd753rrBMQAUOUb2V/iciTACqzglDF2al65oqb2P5+Z8W
         iT7zayF68RQMkDv6GgshlxegoqfmSFHoqT+/cYKkZOkTNhjon833kLDYKUmTY/rnJ5R4
         /LOTat5iTtOsoIaSRbdoAJggm03tajOQzj1rPVwEIHETa95FrU2UowY73CunkdYs/vRI
         glOyv4vx8uesd7xbbPw2LPKZ3WuHudNf0EYxHANDPMw6OV5mn/jYWAYjlDVMnuG0jKF3
         G154pJAtz9IacXrIx48mOBBBgeCxKZmEuX2aUYC278ru46ub627CjM0uPllnsho1lkYL
         rf9w==
X-Forwarded-Encrypted: i=1; AJvYcCXKFMEF7gDT1RIM/EykVIgo4qfqxpalLMNbA7V7JHYOKKdG+m0uFJUdVPdKbCu8abIDsur7NNEmdgVliZrs@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ3eI9SK9iuCNdQwXwdNLsBlW0gO88ISwGd4w3rdJgsQczYFO6
	RYSh3akSwmVVFcAV5qEmn2jSs7Zto7OWqQhfcn9Zd2WuwZi8BAjQi0E8KzZi+fZ0nr8=
X-Gm-Gg: ASbGnctnYudxslJ239Xr9By4RsWXVdOGmea17qxe/1FP2dx3zaRGxwHGwYPWguuKtHU
	wRTy9/7unYD0+4zhRqVsCgDi/fDrMgI/AM9lW3v9+zO64Gu4MZkbaajev4B4OdoH/WeC7dUoXBz
	bqV7auBxb+qpOHVwJ5y5Q02wPPTZllHX8vg2IYOjY9RfZMH6yHDmGG/bZXhm2P6Ub5/B1LeLyuU
	8AYY2zyhNsNCyPXZeHUgb9lSJ1K6fSQuLmmbrsBHjqpRu7wmiP1Rw6YBRfwMhZ83w1MIFTPjBWF
	FhmOKC8uf+uPdrr9au1SgatXL7tShdCSoxYE36ZAgOvT9s+GuN/opHa8zeRIcyT/XYSY1Q5thOO
	B3KfmgaQbRMwexsgQnFug1bMJU3T0TwSvZ6AsD6aEW9Rlc/hazqCoWQWjrQDdZ6/M86CIxQMLpV
	F4SPkJa0m8eZkJ1w==
X-Google-Smtp-Source: AGHT+IFPljBKrOVB/66ijJCXVaRvUIH/JjXGzjIhcC63OF8E63IkVl0Uh+QOhjfWccM7pXPnZ0iuRA==
X-Received: by 2002:a05:600c:3145:b0:45d:e6b6:55fe with SMTP id 5b1f17b1804b1-4711791e7a4mr29591645e9.34.1760695937835;
        Fri, 17 Oct 2025 03:12:17 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4270665efaesm3215957f8f.27.2025.10.17.03.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:12:17 -0700 (PDT)
Date: Fri, 17 Oct 2025 12:12:14 +0200
From: Petr Mladek <pmladek@suse.com>
To: kernel test robot <lkp@intel.com>
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net
Subject: Re: [PATCH v6 5/5] kdb: Adapt kdb_msg_write to work with NBCON
 consoles
Message-ID: <aPIWfjBhFPjOmESL@pathway.suse.cz>
References: <20251016-nbcon-kgdboc-v6-5-866aac60a80e@suse.com>
 <202510171023.YREXxhMK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510171023.YREXxhMK-lkp@intel.com>

On Fri 2025-10-17 10:17:37, kernel test robot wrote:
> Hi Marcos,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/printk-nbcon-Export-console_is_usable/20251016-225503
> base:   3a8660878839faadb4f1a6dd72c3179c1df56787
> patch link:    https://lore.kernel.org/r/20251016-nbcon-kgdboc-v6-5-866aac60a80e%40suse.com
> patch subject: [PATCH v6 5/5] kdb: Adapt kdb_msg_write to work with NBCON consoles
> config: i386-buildonly-randconfig-006-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171023.YREXxhMK-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171023.YREXxhMK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510171023.YREXxhMK-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/debug/kdb/kdb_io.c:612:22: error: incompatible pointer types passing 'struct nbcon_write_context *' to parameter of type 'struct console *' [-Werror,-Wincompatible-pointer-types]
>      612 |                         nbcon_kdb_release(&wctxt);
>          |                                           ^~~~~~
>    include/linux/console.h:667:54: note: passing argument to parameter 'con' here
>      667 | static inline void nbcon_kdb_release(struct console *con) { }

This should be:

static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }

Again, no need for v7. I could fix this when committing the patch.

Best Regards,
Petr
