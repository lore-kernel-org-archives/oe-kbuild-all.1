Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBD24611D0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 04:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769057623; cv=none; b=dn5uc1HKor8ger5QS8OYX94jQD+HeFpH6n1bGADT0XOdjqnX5GbVz2gXOr+y5L6K82+/9IV1SpqfE2YgfhxDzNkyhxDWMi76MsUKDsxp4KE3szheyhfNPVbiyXcXbp7eXfqOZm+kuvht2p2V4MvyRpHqt+HAkZsKhtDOrvXZO/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769057623; c=relaxed/simple;
	bh=E9U3wex+kNh/PDWNeg7hVfSYB487ardX1/bE/VZs0hY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CXc+7Zu/fiAUiXrE5ZoKCbF8kiiKF8Kw6YBmfWb2uFgVK1io/jPGci3f7gT6tnEGdH4L6Cq/YNUHSFnbFtTZMnFjVE39EtY3s2x6ZFPk32DtRuZwB9zdb/wMCE7IYXop5r5XBgk+figFQE+JPFOiZ9tBQ5FbWIGg++GQGkmxF+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieN8E4Jd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieN8E4Jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769057621; x=1800593621;
  h=date:from:to:cc:subject:message-id;
  bh=E9U3wex+kNh/PDWNeg7hVfSYB487ardX1/bE/VZs0hY=;
  b=ieN8E4Jdv9Sf2Yp68d4Qio0DouBL2nHCCJb2WSSzUm2V6CPY2Z4tr9lx
   J6Lbdn3mONB8WDNPkzdXo9tMFHded9uEqieT003a/O6rRhG41q8MPAnnT
   aAhh4F+tQhg8p6eKQ+/rOlqJOWc0PYahhGMb6/nOzSz4hMb3kyZyLSPFv
   5QG4hpgki1ZYGYyE57xiwrsFqeHBB6smBqeApv8sfCgUNFqU4OZJRyemC
   T4Co5b5ZkFs5PqRNbuieNDAhwb9hGUTmEYujDdFeWT0ytY2yMAta17Rw8
   NoMQbSIe0FIBOqmN6AfAkT5zNbnkzHqnXTGwHe2B+4PQskdmIpiMNt90z
   g==;
X-CSE-ConnectionGUID: +QniBPH0QQS/er/H08846A==
X-CSE-MsgGUID: ZNdr+u32R5C7G9EV++On5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80596702"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="80596702"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:53:39 -0800
X-CSE-ConnectionGUID: BzGNF22ET7OoGRwxL+9W/A==
X-CSE-MsgGUID: TUgTVdbUTuSVI0q7C47V2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="237897972"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jan 2026 20:53:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vimhJ-00000000SRb-3eou;
	Thu, 22 Jan 2026 04:53:33 +0000
Date: Thu, 22 Jan 2026 12:52:45 +0800
From: kernel test robot <lkp@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [linux-next:master 4577/8780]
 drivers/staging/fbtft/fbtft-core.c:368:14: error: 'struct fb_info' has no
 member named 'dev'
Message-ID: <202601221259.2tPZX8j2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
commit: bc9f9cb85a7d49e8d58ab326cb56616166201940 [4577/8780] staging: fbtft: Make FB_DEVICE dependency optional
config: nios2-randconfig-002-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221259.2tPZX8j2-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221259.2tPZX8j2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221259.2tPZX8j2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/nios2/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/staging/fbtft/fbtft-core.c:10:
   drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_fb_setcolreg':
>> drivers/staging/fbtft/fbtft-core.c:368:14: error: 'struct fb_info' has no member named 'dev'
     dev_dbg(info->dev,
                 ^~
   include/linux/dynamic_debug.h:231:15: note: in definition of macro '__dynamic_func_call_cls'
      func(&id, ##__VA_ARGS__);   \
                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:2: note: in expansion of macro '_dynamic_func_call_cls'
     _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:2: note: in expansion of macro '_dynamic_func_call'
     _dynamic_func_call(fmt, __dynamic_dev_dbg,   \
     ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:2: note: in expansion of macro 'dynamic_dev_dbg'
     dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft-core.c:368:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(info->dev,
     ^~~~~~~
   drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_fb_blank':
   drivers/staging/fbtft/fbtft-core.c:394:14: error: 'struct fb_info' has no member named 'dev'
     dev_dbg(info->dev, "%s(blank=%d)\n",
                 ^~
   include/linux/dynamic_debug.h:231:15: note: in definition of macro '__dynamic_func_call_cls'
      func(&id, ##__VA_ARGS__);   \
                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:2: note: in expansion of macro '_dynamic_func_call_cls'
     _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:2: note: in expansion of macro '_dynamic_func_call'
     _dynamic_func_call(fmt, __dynamic_dev_dbg,   \
     ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:2: note: in expansion of macro 'dynamic_dev_dbg'
     dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft-core.c:394:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(info->dev, "%s(blank=%d)\n",
     ^~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from include/uapi/linux/fb.h:6,
                    from include/linux/fb.h:5,
                    from drivers/staging/fbtft/fbtft-core.c:18:
   drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_register_framebuffer':
   drivers/staging/fbtft/fbtft-core.c:796:18: error: 'struct fb_info' has no member named 'dev'
     dev_info(fb_info->dev,
                     ^~
   include/linux/dev_printk.h:110:11: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
              ^~~
   drivers/staging/fbtft/fbtft-core.c:796:2: note: in expansion of macro 'dev_info'
     dev_info(fb_info->dev,
     ^~~~~~~~


vim +368 drivers/staging/fbtft/fbtft-core.c

c296d5f9957c03 Thomas Petazzoni        2014-12-31  360  
1ba539d53b2de2 Bhanusree Pola          2019-02-25  361  static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
1ba539d53b2de2 Bhanusree Pola          2019-02-25  362  			      unsigned int green, unsigned int blue,
1ba539d53b2de2 Bhanusree Pola          2019-02-25  363  			      unsigned int transp, struct fb_info *info)
c296d5f9957c03 Thomas Petazzoni        2014-12-31  364  {
1c41494adf7aa6 Ming Yang               2016-07-17  365  	unsigned int val;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  366  	int ret = 1;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  367  
b38c760ab0e1d7 Madhusudhanan Ravindran 2015-06-01 @368  	dev_dbg(info->dev,
c296d5f9957c03 Thomas Petazzoni        2014-12-31  369  		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
c296d5f9957c03 Thomas Petazzoni        2014-12-31  370  		__func__, regno, red, green, blue, transp);
c296d5f9957c03 Thomas Petazzoni        2014-12-31  371  
c296d5f9957c03 Thomas Petazzoni        2014-12-31  372  	switch (info->fix.visual) {
c296d5f9957c03 Thomas Petazzoni        2014-12-31  373  	case FB_VISUAL_TRUECOLOR:
c296d5f9957c03 Thomas Petazzoni        2014-12-31  374  		if (regno < 16) {
c296d5f9957c03 Thomas Petazzoni        2014-12-31  375  			u32 *pal = info->pseudo_palette;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  376  
c296d5f9957c03 Thomas Petazzoni        2014-12-31  377  			val  = chan_to_field(red,   &info->var.red);
c296d5f9957c03 Thomas Petazzoni        2014-12-31  378  			val |= chan_to_field(green, &info->var.green);
c296d5f9957c03 Thomas Petazzoni        2014-12-31  379  			val |= chan_to_field(blue,  &info->var.blue);
c296d5f9957c03 Thomas Petazzoni        2014-12-31  380  
c296d5f9957c03 Thomas Petazzoni        2014-12-31  381  			pal[regno] = val;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  382  			ret = 0;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  383  		}
c296d5f9957c03 Thomas Petazzoni        2014-12-31  384  		break;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  385  	}
c296d5f9957c03 Thomas Petazzoni        2014-12-31  386  	return ret;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  387  }
c296d5f9957c03 Thomas Petazzoni        2014-12-31  388  

:::::: The code at line 368 was first introduced by commit
:::::: b38c760ab0e1d7e051f13e31771514b5809de222 staging: fbtft: replace fbtft_dev_dbg with standard dev_dbg call

:::::: TO: Madhusudhanan Ravindran <mravindr@visteon.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
