Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9094524F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 12:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677241191; x=1708777191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9UgZghCnlAQPX5zFilRaoP8yixxNulPnE2DIvlmg9rg=;
  b=UTp0ObQaJCXN3u4rfov7YT6rIAT0uPqEIiyhb2jfY3ZqU5uUHY+V/zxd
   H3d1+gVisFsZpFokS4RHQvLQy1W6c+uCO0QL7flnDg4yrFBW+xDexgEMf
   L3imON1RiOt8rRC9kzFa45gX6zYoA9VbzOD+PNDrqFDoP+ctofOrMIn71
   XWfrVbexlLyVGY0xrWOqCsSTezT5m3gfDASplJiVBjWJfjHjzvIT86TXf
   iYuYXwppyMNsoyUzB2LDKN1ZV/vcy6shnOkUNpi1NtY9jR+NtbRiBl+fp
   338eSnlcjkinymHk2R3GSiAF0N4ICIWtHVCnhDHmYncSiYtyUnBXBcmCv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="321663263"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="321663263"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 04:19:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="622697813"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="622697813"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Feb 2023 04:19:50 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVX3F-0002Ob-1V;
	Fri, 24 Feb 2023 12:19:49 +0000
Date: Fri, 24 Feb 2023 20:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:dcp-better-timeline /30]
 drivers/gpu/drm/apple/audio.c:138:30: warning: format '%x' expects argument
 of type 'unsigned int', but argument 4 has type 'u64' {aka 'long long
 unsigned int'}
Message-ID: <202302242015.K6KSjBxC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux dcp-better-timeline
head:   f56212a7e1a2aad0697c5fcb8a35d259142bdb6a
commit: 5d8dd7370cfb016c9504095a141d54d0d07f72fa [/30] WIP: gpu: drm: apple: Add audio bits to DCP
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230224/202302242015.K6KSjBxC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/povik/linux/commit/5d8dd7370cfb016c9504095a141d54d0d07f72fa
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik dcp-better-timeline
        git checkout 5d8dd7370cfb016c9504095a141d54d0d07f72fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302242015.K6KSjBxC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from drivers/gpu/drm/apple/audio.c:14:
   drivers/gpu/drm/apple/audio.c: In function 'dcpaud_consult_elements':
>> drivers/gpu/drm/apple/audio.c:138:30: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
     138 |         dev_dbg(dcpaud->dev, "elements in: %x %x %x\n", sieve.formats, sieve.nchans, sieve.rates);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/gpu/drm/apple/audio.c:138:9: note: in expansion of macro 'dev_dbg'
     138 |         dev_dbg(dcpaud->dev, "elements in: %x %x %x\n", sieve.formats, sieve.nchans, sieve.rates);
         |         ^~~~~~~
   drivers/gpu/drm/apple/audio.c:138:45: note: format string is defined here
     138 |         dev_dbg(dcpaud->dev, "elements in: %x %x %x\n", sieve.formats, sieve.nchans, sieve.rates);
         |                                            ~^
         |                                             |
         |                                             unsigned int
         |                                            %llx
   drivers/gpu/drm/apple/audio.c:140:30: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
     140 |         dev_dbg(dcpaud->dev, "elements out: %x %x %x\n", hits->formats, hits->nchans, hits->rates);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/gpu/drm/apple/audio.c:140:9: note: in expansion of macro 'dev_dbg'
     140 |         dev_dbg(dcpaud->dev, "elements out: %x %x %x\n", hits->formats, hits->nchans, hits->rates);
         |         ^~~~~~~
   drivers/gpu/drm/apple/audio.c:140:46: note: format string is defined here
     140 |         dev_dbg(dcpaud->dev, "elements out: %x %x %x\n", hits->formats, hits->nchans, hits->rates);
         |                                             ~^
         |                                              |
         |                                              unsigned int
         |                                             %llx
   drivers/gpu/drm/apple/audio.c: In function 'dcpaud_create_chmap_ctl':
>> drivers/gpu/drm/apple/audio.c:413:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     413 |         int ret;
         |             ^~~
   drivers/gpu/drm/apple/audio.c: At top level:
>> drivers/gpu/drm/apple/audio.c:513:5: warning: no previous prototype for 'dcpaud_probe' [-Wmissing-prototypes]
     513 | int dcpaud_probe(struct platform_device *pdev)
         |     ^~~~~~~~~~~~
>> drivers/gpu/drm/apple/audio.c:577:5: warning: no previous prototype for 'dcpaud_remove' [-Wmissing-prototypes]
     577 | int dcpaud_remove(struct platform_device *dev)
         |     ^~~~~~~~~~~~~


vim +138 drivers/gpu/drm/apple/audio.c

   124	
   125	static void dcpaud_consult_elements(struct dcp_audio *dcpaud,
   126					    struct snd_pcm_hw_params *params,
   127					    struct dcp_sound_format_mask *hits)
   128	{
   129		struct dcp_sound_format_mask sieve;
   130		struct dcp_parse_ctx elements = {
   131			.dcp = dev_get_drvdata(dcpaud->pdata->dcp_dev),
   132			.blob = dcpaud->elements + 4,
   133			.len = DCPAUD_ELEMENTS_MAXSIZE - 4,
   134			.pos = 0,
   135		};
   136	
   137		dcpaud_fill_fmt_sieve(params, &sieve);
 > 138		dev_dbg(dcpaud->dev, "elements in: %x %x %x\n", sieve.formats, sieve.nchans, sieve.rates);
   139		parse_sound_constraints(&elements, &sieve, hits);
   140		dev_dbg(dcpaud->dev, "elements out: %x %x %x\n", hits->formats, hits->nchans, hits->rates);
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
