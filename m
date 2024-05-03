Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380C4D9FD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714753245; cv=none; b=mw6eQuLKcR4YgEu8JrLxhIsIZbvsfTnEbSJCjYj61FYW2oLflMrvPoUgs38YdKGdIipXsESW9ZWRUPA0KnMa2Dhm5Ig6dSkQzK2NN75T5hc7LnI7v28KbLfZ0tHSHOH/gpvEgejfSE5puNggOp3O5ydoYI5SzgDRkeUwKcqosy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714753245; c=relaxed/simple;
	bh=GO6zs0rssdqZvqhgg54pu5ZUhvFjquWqLOPKNHlxVaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NC4XMs7HLEqQ4cKYI5+34/6BlmRiBFud6IGUH851tAZ658/6J0HFZxayBoUGxBikn/oh1+YgInoemKvpGfc55e501qPwXB/80FFjXtT9dMzWr6/iGehbKkhFb7nAoy5qZ4jyIz0pFYBhRgTnLUhrgWymeZpIB8/OMX4cM2XboiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAfvrN04; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAfvrN04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714753243; x=1746289243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GO6zs0rssdqZvqhgg54pu5ZUhvFjquWqLOPKNHlxVaU=;
  b=lAfvrN04Np3MXnnkjAbyPXKFKZef/kVSGG5qqoAQE2esN8R0q8QgAxRc
   gvLgBt4kzDKj0Jsq34VMhSKKdX0NKa3/tV/EUjQHlRAM2igTBnm58AUUp
   o+xDQvEegZ/SNqvyLwUMaB22aSXkp+CgDdjL02ZlEoL4Zif5k0lvS3mYW
   qJCY9ML+SDy3rod3U0i6QSd50a1wE6kR9gySCBbixK1QcsbJpN/QtqFNF
   xUrsi8JtBHNCddFQu8fQW4cS11aqDgENpPVLE1BPav4AA/aoe7jyQKEWc
   K8lw3HLccdWeuEhI9sr2+4bgvw2FmjvgbV4Opk5d1hhiQdoG8d2y/nEG0
   A==;
X-CSE-ConnectionGUID: vGW21VJPT9GqDAyOV2YDFg==
X-CSE-MsgGUID: y9Z+C44FQbeU/xU4wh901g==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10397891"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10397891"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 09:20:42 -0700
X-CSE-ConnectionGUID: n4YSIXOiQB2uoOM4MGGmiA==
X-CSE-MsgGUID: jdGf0ya3Se+7sUYQkeGEZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="64935484"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 May 2024 09:20:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2veI-000Bs0-39;
	Fri, 03 May 2024 16:20:38 +0000
Date: Sat, 4 May 2024 00:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 1043/1143]
 drivers/soc/aspeed/rvas/video_engine.c:479:29: warning: cast to pointer from
 integer of different size
Message-ID: <202405040015.WnJ2EJln-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 867a6cd8ea2c0514739e75bc2701687f294c2578 [1043/1143] RVAS engine: video engine
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405040015.WnJ2EJln-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040015.WnJ2EJln-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040015.WnJ2EJln-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/aspeed/rvas/video_engine.c:291:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     291 |         VIDEO_ENG_DBG("%x\n", status);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:295:17: note: in expansion of macro 'VIDEO_ENG_DBG'
     295 |                 VIDEO_ENG_DBG("compress complete swap\n");
         |                 ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:305:17: note: in expansion of macro 'VIDEO_ENG_DBG'
     305 |                 VIDEO_ENG_DBG("capture complete\n");
         |                 ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'free_video_engine_memory':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:357:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     357 |         VIDEO_ENG_DBG("After dma_free_coherent\n");
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'video_set_Window':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:367:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     367 |         VIDEO_ENG_DBG("\n");
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:371:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     371 |         VIDEO_ENG_DBG("reg offset[%#x]: %#x\n", AST_VIDEO_COMPRESS_WIN, video_read(pAstRVAS, AST_VIDEO_COMPRESS_WIN));
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:378:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     378 |         VIDEO_ENG_DBG("reg offset[%#x]: %#x\n", AST_VIDEO_CAPTURE_WIN, video_read(pAstRVAS, AST_VIDEO_CAPTURE_WIN));
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:389:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     389 |         VIDEO_ENG_DBG("reg offset[%#x]: %#x\n", AST_VIDEO_SOURCE_SCAN_LINE, video_read(pAstRVAS, AST_VIDEO_SOURCE_SCAN_LINE));
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'set_direct_mode':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:398:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     398 |         VIDEO_ENG_DBG("\n");
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:427:17: note: in expansion of macro 'VIDEO_ENG_DBG'
     427 |                 VIDEO_ENG_DBG("Direct Mode\n");
         |                 ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:432:17: note: in expansion of macro 'VIDEO_ENG_DBG'
     432 |                 VIDEO_ENG_DBG("Sync None Direct Mode\n");
         |                 ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c:396:39: warning: variable 'VGA_Scratch_Register_354' set but not used [-Wunused-but-set-variable]
     396 |         u32 VGA_Scratch_Register_350, VGA_Scratch_Register_354, VGA_Scratch_Register_34C, Color_Depth;
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'video_capture_trigger':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:442:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     442 |         VIDEO_ENG_DBG("\n");
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'get_vga_mem_base':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:469:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     469 |         VIDEO_ENG_DBG("VGA Info : MEM Size %dMB, VGA Mem Size %dMB\n", mem_size / 1024 / 1024, vga_mem_size / 1024 / 1024);
         |         ^~~~~~~~~~~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/arc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arc/include/asm/bitops.h:192,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/jiffies.h:7,
                    from include/linux/ktime.h:25,
                    from include/linux/poll.h:7,
                    from drivers/soc/aspeed/rvas/video_engine.c:13:
   drivers/soc/aspeed/rvas/video_engine.c: In function 'dump_buffer':
>> drivers/soc/aspeed/rvas/video_engine.c:479:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     479 |                 val = readl((void *)(dwPhyStreamAddress + iC));
         |                             ^
   include/uapi/linux/swab.h:118:38: note: in definition of macro '__swab32'
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:201:46: note: in expansion of macro 'readl_relaxed'
     201 | #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
         |                                              ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c:479:23: note: in expansion of macro 'readl'
     479 |                 val = readl((void *)(dwPhyStreamAddress + iC));
         |                       ^~~~~
>> drivers/soc/aspeed/rvas/video_engine.c:479:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     479 |                 val = readl((void *)(dwPhyStreamAddress + iC));
         |                             ^
   include/uapi/linux/swab.h:19:19: note: in definition of macro '___constant_swab32'
      19 |         (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:201:46: note: in expansion of macro 'readl_relaxed'
     201 | #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
         |                                              ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c:479:23: note: in expansion of macro 'readl'
     479 |                 val = readl((void *)(dwPhyStreamAddress + iC));
         |                       ^~~~~
>> drivers/soc/aspeed/rvas/video_engine.c:479:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     479 |                 val = readl((void *)(dwPhyStreamAddress + iC));
         |                             ^
   include/uapi/linux/swab.h:20:19: note: in definition of macro '___constant_swab32'
      20 |         (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:201:46: note: in expansion of macro 'readl_relaxed'
     201 | #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
         |                                              ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c:479:23: note: in expansion of macro 'readl'
     479 |                 val = readl((void *)(dwPhyStreamAddress + iC));
         |                       ^~~~~
>> drivers/soc/aspeed/rvas/video_engine.c:479:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     479 |                 val = readl((void *)(dwPhyStreamAddress + iC));
         |                             ^
   include/uapi/linux/swab.h:21:19: note: in definition of macro '___constant_swab32'
      21 |         (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:201:46: note: in expansion of macro 'readl_relaxed'
     201 | #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
         |                                              ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c:479:23: note: in expansion of macro 'readl'
     479 |                 val = readl((void *)(dwPhyStreamAddress + iC));
         |                       ^~~~~
>> drivers/soc/aspeed/rvas/video_engine.c:479:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     479 |                 val = readl((void *)(dwPhyStreamAddress + iC));
         |                             ^
   include/uapi/linux/swab.h:22:19: note: in definition of macro '___constant_swab32'
      22 |         (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:201:46: note: in expansion of macro 'readl_relaxed'
     201 | #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
         |                                              ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c:479:23: note: in expansion of macro 'readl'
     479 |                 val = readl((void *)(dwPhyStreamAddress + iC));
         |                       ^~~~~
>> drivers/soc/aspeed/rvas/video_engine.c:479:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     479 |                 val = readl((void *)(dwPhyStreamAddress + iC));
         |                             ^
   include/uapi/linux/swab.h:120:19: note: in definition of macro '__swab32'
     120 |         __fswab32(x))
         |                   ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:201:46: note: in expansion of macro 'readl_relaxed'
     201 | #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
         |                                              ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c:479:23: note: in expansion of macro 'readl'
     479 |                 val = readl((void *)(dwPhyStreamAddress + iC));
         |                       ^~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:480:17: note: in expansion of macro 'VIDEO_ENG_DBG'
     480 |                 VIDEO_ENG_DBG("%#x, ", val);
         |                 ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c:476:13: warning: variable 'val' set but not used [-Wunused-but-set-variable]
     476 |         u32 val = 0;
         |             ^~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'video_set_scaling':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:491:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     491 |         VIDEO_ENG_DBG("Scaling Disable\n");
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'video_ctrl_init':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:505:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     505 |         VIDEO_ENG_DBG("\n");
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:506:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     506 |         VIDEO_ENG_DBG("reg address: %p\n", pAstRVAS->video_reg_base);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:518:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     518 |         VIDEO_ENG_DBG("JpegTable in Memory:%#x\n", vem.jpegTable.pVirt);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'reserve_video_engine_memory':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:553:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     553 |         VIDEO_ENG_DBG("Allocating memory size: 0x%x\n", size);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:570:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     570 |         VIDEO_ENG_DBG("Allocated: phys: 0x%llx\n", phys_add);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:571:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     571 |         VIDEO_ENG_DBG("Phy: Buf0:0x%llx; Buf1:0x%llx; jpegT:0x%llx\n", vem.captureBuf0.phy, vem.captureBuf1.phy, vem.jpegTable.phy);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:572:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     572 |         VIDEO_ENG_DBG("Virt: Buf0:%p; Buf1:%p; JpegT:%p\n", vem.captureBuf0.pVirt, vem.captureBuf1.pVirt, vem.jpegTable.pVirt);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'video_write':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:1163:9: note: in expansion of macro 'VIDEO_ENG_DBG'
    1163 |         VIDEO_ENG_DBG("write offset: %x, val: %x\n", reg, val);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'video_read':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:1176:9: note: in expansion of macro 'VIDEO_ENG_DBG'
    1176 |         VIDEO_ENG_DBG("read offset: %x, val: %x\n", reg, val);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: At top level:
   drivers/soc/aspeed/rvas/video_engine.c:473:13: warning: 'dump_buffer' defined but not used [-Wunused-function]
     473 | static void dump_buffer(phys_addr_t dwPhyStreamAddress, u32 size)
         |             ^~~~~~~~~~~


vim +479 drivers/soc/aspeed/rvas/video_engine.c

f778d27331abc16 hailin wu 2024-01-20  472  
867a6cd8ea2c051 hailin wu 2024-01-31  473  static void dump_buffer(phys_addr_t dwPhyStreamAddress, u32 size)
f778d27331abc16 hailin wu 2024-01-20  474  {
f778d27331abc16 hailin wu 2024-01-20  475  	u32 iC;
f778d27331abc16 hailin wu 2024-01-20  476  	u32 val = 0;
f778d27331abc16 hailin wu 2024-01-20  477  
f778d27331abc16 hailin wu 2024-01-20  478  	for (iC = 0; iC < size; iC += 4) {
f778d27331abc16 hailin wu 2024-01-20 @479  		val = readl((void *)(dwPhyStreamAddress + iC));
f778d27331abc16 hailin wu 2024-01-20  480  		VIDEO_ENG_DBG("%#x, ", val);
f778d27331abc16 hailin wu 2024-01-20  481  	}
e3f6657267bf717 hailin wu 2024-01-27  482  

:::::: The code at line 479 was first introduced by commit
:::::: f778d27331abc1655c4425fcdee0086a7b81464e RVAS: add rvas driver

:::::: TO: hailin wu <hailin.wu@aspeedtech.com>
:::::: CC: Joel Stanley <joel@jms.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
