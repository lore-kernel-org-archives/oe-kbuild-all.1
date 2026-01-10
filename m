Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F5D4A0C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 23:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768087293; cv=none; b=RsB8JBolzNmmOGeOpm23NKJ2U9lzJll8TUE2jcG0hCgsGhj/KjznJGXaydxzkh+GIj4jB+UlRkFI1vlu4EOseaSYP7TgHqUJ+2Li2tYSf8bYslP+a2bwVkUp0cNVaYCVRs3bdwTPfhR+FYIQ+RBjbdi8eDLRdstuacVBWzgz7Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768087293; c=relaxed/simple;
	bh=Zwy4/Zd8T6NgCgYoV6HufvMP9r1/IDTU1feljK+iDSs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r24ryifCXq2nWpMpJrQJo7SBgLDvu7PEfQ1zI2i4A1E4e/ij5OFG5SAvH574t/mRRfaYD027c+PKE47HN7A5bO2sPvDBnPiUH/baWOI4NtBi2/jLhofcSFQ0jDY1Swx1TlXHHWKLLGiyBe/TnSqyAgpj+RFpeR9SliuTTtfK9Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xs90JIhk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xs90JIhk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768087292; x=1799623292;
  h=date:from:to:cc:subject:message-id;
  bh=Zwy4/Zd8T6NgCgYoV6HufvMP9r1/IDTU1feljK+iDSs=;
  b=Xs90JIhkV2oJJlhl5o3tzsNd6gJgSRmlaSFDXjn0edkjEX5Kab1hqVjF
   I/PBiiLpnjy37BspAYYxDW+5cIwDKAE97f0Cw+eu38jQng8H4fBgZ/Szk
   Qe/dTdM+lh6XDOILYuyvsBV2GrFEDqa1ALh06R5wm8BjfOLcRLNz4T3EX
   9aesc34V0HAjBmdQv/rzPzRzG8Hw28dFwVVts5gKCU1uJP8bI0bkCs2bd
   MsXtctWhT450K61GIFHpUAV9h5I3Pj2wwbLjlQD0Ue1mrcFJpGlsx4v1o
   zIBzVmZaWPs/aGI1/xRUq3rBhzY3W4Bp9R1ug7aKgnd5otRNSUKnaCxVx
   g==;
X-CSE-ConnectionGUID: MlCFBtiYTHKTu5xHYBwklQ==
X-CSE-MsgGUID: HoGpUNnsS4ahnjS4MOdlTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="94893760"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="94893760"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 15:21:31 -0800
X-CSE-ConnectionGUID: 3CxUbGMSRcGySRykZBmufw==
X-CSE-MsgGUID: 3VkNjHhrSuObQHapK3LyiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="203383270"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2026 15:21:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veiGt-000000009JA-3j2v;
	Sat, 10 Jan 2026 23:21:27 +0000
Date: Sun, 11 Jan 2026 07:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: [linux-next:master 2640/5095]
 drivers/staging/fbtft/fbtft-core.c:368:14: error: 'struct fb_info' has no
 member named 'dev'
Message-ID: <202601110740.Y9XK5HtN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Chintan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: a06d03f9f23820a3cae381f2e82302e7e618190a [2640/5095] staging: fbtft: Make FB_DEVICE dependency optional
config: s390-randconfig-001-20260111 (https://download.01.org/0day-ci/archive/20260111/202601110740.Y9XK5HtN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601110740.Y9XK5HtN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from include/uapi/linux/fb.h:6,
                    from include/linux/fb.h:5,
                    from drivers/staging/fbtft/fbtft-core.c:18:
   drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_fb_setcolreg':
>> drivers/staging/fbtft/fbtft-core.c:368:14: error: 'struct fb_info' has no member named 'dev'
     dev_dbg(info->dev,
                 ^~
   include/linux/dev_printk.h:139:23: note: in definition of macro 'dev_no_printk'
       _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
                          ^~~
   drivers/staging/fbtft/fbtft-core.c:368:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(info->dev,
     ^~~~~~~
   drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_fb_blank':
   drivers/staging/fbtft/fbtft-core.c:394:14: error: 'struct fb_info' has no member named 'dev'
     dev_dbg(info->dev, "%s(blank=%d)\n",
                 ^~
   include/linux/dev_printk.h:139:23: note: in definition of macro 'dev_no_printk'
       _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
                          ^~~
   drivers/staging/fbtft/fbtft-core.c:394:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(info->dev, "%s(blank=%d)\n",
     ^~~~~~~
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
