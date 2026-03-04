Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8938C30CDAB;
	Wed,  4 Mar 2026 18:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772648615; cv=none; b=ZXIxUujq5vNOYAc/E5OyQEwWxC45IJTPYNPh1PRkGQ+uOYeKjZjWtxXLVU/ulmxnZdlgwMEvFEqmwevmATao1Zp5f2sYszqS68hLRL1+EaMZD9E3pSnpa7/wUslqiutFJaZdPSFKFDrmMhHR9bRAOk1p5HEsBLqj8J6MKU3HK5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772648615; c=relaxed/simple;
	bh=GF82rY69EZoYhLKwEV+s9QJHeXK+3qHOsFHUSN0chLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMohDgC5uVKjFfJ0yXqmD1x8ZI3JkQ/CzoI3IbDw4JIXYLuZm1hyW0Z8q30gMlrJKub5n/kbvBWhCm3h8j60pR4Jil6+Xt9MbP5eytmuVFoevxfZJAWmB+9G5Ym+H5bGXkDcHBFt+1VNNv2TuaC9qjjFPUG9mTQNZ7I16NiVwXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U80h/UrI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U80h/UrI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E94C4CEF7;
	Wed,  4 Mar 2026 18:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772648615;
	bh=GF82rY69EZoYhLKwEV+s9QJHeXK+3qHOsFHUSN0chLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U80h/UrIkPUbqCM4mS6EL4r6BtCRUDkk8L/euDvskEkC8RqpW/W7Kto26yOPGXeZF
	 PhCXILX7AYLkG1NRy9RWasM1YkBPgD1xM4/ocypPQa4IZEDTqgom88baiHW6CqCVR3
	 xULiOWic9pZFUGxU9H3y3mNz6Be1P4HzMZqjObSgrhjUZvQRKpyLt/nrjqHB8/vHHB
	 BAL+/vyHNbkvBGt1TKq8j9R+Ggn/A3VAnV3du5b4aLzv1R5/6ZI6L5y5H/WlzotHi0
	 UesJIIQIog3krnIOVnua8uRbvKRv+gmjhSs3r646Ho53+5FeKPMYubRhXKPdExJWfh
	 P3kpM7gYX38Lw==
Date: Wed, 4 Mar 2026 19:23:30 +0100
From: Helge Deller <deller@kernel.org>
To: kernel test robot <lkp@intel.com>,
	Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/video/fbdev/au1100fb.c:448:46: error: implicit
 declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'?
Message-ID: <aah4opTMZeDDfWFG@carbonx1>
References: <202603042127.PT6LuKqi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202603042127.PT6LuKqi-lkp@intel.com>

* kernel test robot <lkp@intel.com>:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0031c06807cfa8aa51a759ff8aa09e1aa48149af
> commit: 6f366e86481a7503a821de82930df517dddd4047 fbdev: au1100fb: Make driver compilable on non-mips platforms
> date:   13 days ago
> config: mips-randconfig-r052-20260304 (https://download.01.org/0day-ci/archive/20260304/202603042127.PT6LuKqi-lkp@intel.com/config)
> compiler: mips64-linux-gcc (GCC) 14.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603042127.PT6LuKqi-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603042127.PT6LuKqi-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    drivers/video/fbdev/au1100fb.c: In function 'au1100fb_drv_probe':
> >> drivers/video/fbdev/au1100fb.c:448:46: error: implicit declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Wimplicit-function-declaration]
>      448 |         fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);
>          |                                              ^~~~~~~~~
>          |                                              CKSEG1ADDR
> >> drivers/video/fbdev/au1100fb.c:448:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>      448 |         fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);
>          |                       ^

I've pushed the patch below into the fbdev git tree.
It should (hopefully) fix the issue.

Helge


From: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: au1100fb: Fix build on MIPS64

Fix an error reported by the kernel test robot:
 au1100fb.c: error: implicit declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'?

The header asm/mach-au1x00/au1000.h is unused apart from pulling in
<linux/delay.h> (for mdelay()) and <linux/io.h> (for KSEG1ADDR()). Then
the only platform specific part in the driver is the usage of the KSEG1ADDR
macro, which for the non-mips case can be stubbed.

Fixes: 6f366e86481a ("fbdev: au1100fb: Make driver compilable on non-mips platforms")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603042127.PT6LuKqi-lkp@intel.com/
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 1a04154bc535..3b104d377d28 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -380,7 +380,7 @@ static struct au1100fb_panel known_lcd_panels[] =
 #define panel_is_color(panel) (panel->control_base & LCD_CONTROL_PC)
 #define panel_swap_rgb(panel) (panel->control_base & LCD_CONTROL_CCO)
 
-#if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
+#if defined(CONFIG_COMPILE_TEST) && !(defined(CONFIG_MIPS) && !defined(CONFIG_64BIT))
 /* This is only defined to be able to compile this driver on non-mips platforms */
 #define KSEG1ADDR(x) (x)
 #endif


