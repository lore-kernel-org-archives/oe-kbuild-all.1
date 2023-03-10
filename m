Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ADE23B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 10:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678443795; x=1709979795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XmQUlMs+uhSlS8xppb1Ls0JCdBZKtDGmAMBTPXZMv9A=;
  b=cmIt5etCQiOI09gu6FWRC5FH0C2zjb+N0E4FRZBgJVGgA1xqdNMKWlia
   al57s4B/FjEmdXwQ/ZgnLm566y84QKFdsPeybUjeNFZGiqhiVTnZIwIrS
   y0xWfd7STpfszKCvZTwBne/mzhSsBA0I1NyMKZXWTd+D7d3mMBUDTt+/k
   50zjG7JAyWgwA+R9if4JXFLw7zsbqcoG3eCB8Ty+2vZ8CG6hv1TcYyPBH
   4DR/7AnjU1jZ17ssLikITXJqZTH7yk+M0oYc+j+N4yPON9NwLUfKGsnjc
   zrHPSSjCq4iHCQHGw0k422DfSoFpJ7LMCb60mgBTZb3T/2OTUIII4QPu8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="399296651"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="399296651"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 02:23:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="923612773"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="923612773"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2023 02:23:14 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paZu5-0003kl-0i;
	Fri, 10 Mar 2023 10:23:13 +0000
Date: Fri, 10 Mar 2023 18:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 78/139] sound/soc/sof/ops.h:309:75: error:
 macro "writeb" passed 3 arguments, but takes just 2
Message-ID: <202303101841.KI42hf5d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   4cd026feae55d8b7668c7eb88f20ba1c6cae54d2
commit: 5bc24d37bc08926706da8cf17906364face06b8d [78/139] UPSTREAM: ASoC: SOF: ops: add readb/writeb helpers
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230310/202303101841.KI42hf5d-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 5bc24d37bc08926706da8cf17906364face06b8d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101841.KI42hf5d-lkp@intel.com/

Note: the chrome-os/chromeos-6.1 HEAD 4cd026feae55d8b7668c7eb88f20ba1c6cae54d2 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from sound/soc/sof/core.c:16:
   sound/soc/sof/ops.h: In function 'snd_sof_dsp_writeb':
>> sound/soc/sof/ops.h:309:75: error: macro "writeb" passed 3 arguments, but takes just 2
     309 |                 sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
         |                                                                           ^
   In file included from arch/riscv/include/asm/io.h:23,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/riscv/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/sound/soc.h:18,
                    from sound/soc/sof/core.c:13:
   arch/riscv/include/asm/mmio.h:142: note: macro "writeb" defined here
     142 | #define writeb(v, c)    ({ __io_bw(); writeb_cpu((v), (c)); __io_aw(); })
         | 
   sound/soc/sof/ops.h:309:30: warning: statement with no effect [-Wunused-value]
     309 |                 sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
         |                              ^
   sound/soc/sof/ops.h: In function 'snd_sof_dsp_readb':
>> sound/soc/sof/ops.h:336:74: error: macro "readb" passed 2 arguments, but takes just 1
     336 |                 return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
         |                                                                          ^
   arch/riscv/include/asm/mmio.h:138: note: macro "readb" defined here
     138 | #define readb(c)        ({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
         | 
>> sound/soc/sof/ops.h:336:37: warning: returning 'u8 (*)(struct snd_sof_dev *, void *)' {aka 'unsigned char (*)(struct snd_sof_dev *, void *)'} from a function with return type 'u8' {aka 'unsigned char'} makes integer from pointer without a cast [-Wint-conversion]
     336 |                 return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
         |                                     ^
--
   In file included from sound/soc/sof/intel/atom.c:21:
   sound/soc/sof/intel/../ops.h: In function 'snd_sof_dsp_writeb':
>> sound/soc/sof/intel/../ops.h:309:75: error: macro "writeb" passed 3 arguments, but takes just 2
     309 |                 sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
         |                                                                           ^
   In file included from arch/riscv/include/asm/io.h:23,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/riscv/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/pci.h:38,
                    from include/sound/sof.h:14,
                    from sound/soc/sof/intel/atom.c:16:
   arch/riscv/include/asm/mmio.h:142: note: macro "writeb" defined here
     142 | #define writeb(v, c)    ({ __io_bw(); writeb_cpu((v), (c)); __io_aw(); })
         | 
   sound/soc/sof/intel/../ops.h:309:30: warning: statement with no effect [-Wunused-value]
     309 |                 sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
         |                              ^
   sound/soc/sof/intel/../ops.h: In function 'snd_sof_dsp_readb':
>> sound/soc/sof/intel/../ops.h:336:74: error: macro "readb" passed 2 arguments, but takes just 1
     336 |                 return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
         |                                                                          ^
   arch/riscv/include/asm/mmio.h:138: note: macro "readb" defined here
     138 | #define readb(c)        ({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
         | 
>> sound/soc/sof/intel/../ops.h:336:37: warning: returning 'u8 (*)(struct snd_sof_dev *, void *)' {aka 'unsigned char (*)(struct snd_sof_dev *, void *)'} from a function with return type 'u8' {aka 'unsigned char'} makes integer from pointer without a cast [-Wint-conversion]
     336 |                 return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
         |                                     ^


vim +/writeb +309 sound/soc/sof/ops.h

   303	
   304	/* register IO */
   305	static inline void snd_sof_dsp_writeb(struct snd_sof_dev *sdev, u32 bar,
   306					      u32 offset, u8 value)
   307	{
   308		if (sof_ops(sdev)->writeb)
 > 309			sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
   310		else
   311			writeb(value,  sdev->bar[bar] + offset);
   312	}
   313	
   314	static inline void snd_sof_dsp_write(struct snd_sof_dev *sdev, u32 bar,
   315					     u32 offset, u32 value)
   316	{
   317		if (sof_ops(sdev)->write)
   318			sof_ops(sdev)->write(sdev, sdev->bar[bar] + offset, value);
   319		else
   320			writel(value,  sdev->bar[bar] + offset);
   321	}
   322	
   323	static inline void snd_sof_dsp_write64(struct snd_sof_dev *sdev, u32 bar,
   324					       u32 offset, u64 value)
   325	{
   326		if (sof_ops(sdev)->write64)
   327			sof_ops(sdev)->write64(sdev, sdev->bar[bar] + offset, value);
   328		else
   329			writeq(value, sdev->bar[bar] + offset);
   330	}
   331	
   332	static inline u8 snd_sof_dsp_readb(struct snd_sof_dev *sdev, u32 bar,
   333					   u32 offset)
   334	{
   335		if (sof_ops(sdev)->readb)
 > 336			return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
   337		else
   338			return readb(sdev->bar[bar] + offset);
   339	}
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
