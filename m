Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87993154AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 04:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9l/PaJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701316990; x=1732852990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YcxqQIxgim9z7X9nKgPqvaYPDXeEsqxkjFk8GvvpdEc=;
  b=Z9l/PaJ78r2k1cyeZa22K4GVzIWcG54H/Xcy73VWupLGbzOTScJpBaTO
   UK1Cq51K0He7UNW3H2RJavGfABQ9OmH7TuFMYCMxsN0wvcUvFZ7jryEdm
   rVZurtGH3kjcjij65LDATr+quQDTlZXODElfn3xOQbu0GzmMgCFnNqk0+
   uMdY/G1zf0kcjrMcSctebBk/HotGCzEnU1uNZzFT2XuW52wg2Qmoakt33
   +5swpiOr/7KYr87ujaNBZW+ilGxUS2KKAMcJhXnMjqNAwyEs+cB1L64WP
   34PsML/bzCcXXuG3LCUGy57zlgYftWOtiq1WSpF5JwVCmTN5JF4FfbEWZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="393009064"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="393009064"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 20:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="913063275"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="913063275"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2023 20:03:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8YGW-0001KB-1l;
	Thu, 30 Nov 2023 04:03:04 +0000
Date: Thu, 30 Nov 2023 12:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 14581/30000]
 arch/m68k/include/asm/string.h:72:25: warning: '__builtin_memcpy' reading
 360 bytes from a region of size 120
Message-ID: <202311301022.TMwQvf65-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Adrian,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: a452c44357d9c68c27c39327e50b41e4b6cffe8d [14581/30000] MLK-25015: sound: soc: codecs: pcm512x: set input sclk
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231130/202311301022.TMwQvf65-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301022.TMwQvf65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301022.TMwQvf65-lkp@intel.com/

All warnings (new ones prefixed by >>):

      86 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:448:17: note: in expansion of macro 'rom_out_be16'
     448 |                 rom_out_be16(port, *buf++);
         |                 ^~~~~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw_swapw':
   arch/m68k/include/asm/raw_io.h:90:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      90 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:466:17: note: in expansion of macro 'rom_out_le16'
     466 |                 rom_out_le16(port, *buf++);
         |                 ^~~~~~~~~~~~
   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from sound/soc/fsl/imx-pcm512x.c:13:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   In file included from sound/soc/fsl/imx-pcm512x.c:21:
   sound/soc/fsl/imx-pcm512x.c: At top level:
   sound/soc/fsl/imx-pcm512x.c:357:37: warning: initialized field overwritten [-Woverride-init]
     357 |                 SND_SOC_DAILINK_REG(hifi),
         |                                     ^~~~
   include/sound/soc.h:919:27: note: in definition of macro 'SND_SOC_DAILINK_REG3'
     919 |         .codecs         = codec,                        \
         |                           ^~~~~
   include/sound/soc.h:924:53: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
     924 | #define SND_SOC_DAILINK_REGx(_1, _2, _3, func, ...) func
         |                                                     ^~~~
   sound/soc/fsl/imx-pcm512x.c:357:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     357 |                 SND_SOC_DAILINK_REG(hifi),
         |                 ^~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/imx-pcm512x.c:357:37: note: (near initialization for 'imx_pcm512x_dai[0].codecs')
     357 |                 SND_SOC_DAILINK_REG(hifi),
         |                                     ^~~~
   include/sound/soc.h:919:27: note: in definition of macro 'SND_SOC_DAILINK_REG3'
     919 |         .codecs         = codec,                        \
         |                           ^~~~~
   include/sound/soc.h:924:53: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
     924 | #define SND_SOC_DAILINK_REGx(_1, _2, _3, func, ...) func
         |                                                     ^~~~
   sound/soc/fsl/imx-pcm512x.c:357:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     357 |                 SND_SOC_DAILINK_REG(hifi),
         |                 ^~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:47:25: warning: initialized field overwritten [-Woverride-init]
      47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^
   include/sound/soc.h:920:27: note: in expansion of macro 'ARRAY_SIZE'
     920 |         .num_codecs     = ARRAY_SIZE(codec),            \
         |                           ^~~~~~~~~~
   include/sound/soc.h:914:42: note: in expansion of macro 'SND_SOC_DAILINK_REG3'
     914 | #define SND_SOC_DAILINK_REG1(name)       SND_SOC_DAILINK_REG3(name##_cpus, name##_codecs, name##_platforms)
         |                                          ^~~~~~~~~~~~~~~~~~~~
   include/sound/soc.h:924:53: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
     924 | #define SND_SOC_DAILINK_REGx(_1, _2, _3, func, ...) func
         |                                                     ^~~~
   include/sound/soc.h:926:9: note: in expansion of macro 'SND_SOC_DAILINK_REGx'
     926 |         SND_SOC_DAILINK_REGx(__VA_ARGS__,               \
         |         ^~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/imx-pcm512x.c:357:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     357 |                 SND_SOC_DAILINK_REG(hifi),
         |                 ^~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:47:25: note: (near initialization for 'imx_pcm512x_dai[0].num_codecs')
      47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^
   include/sound/soc.h:920:27: note: in expansion of macro 'ARRAY_SIZE'
     920 |         .num_codecs     = ARRAY_SIZE(codec),            \
         |                           ^~~~~~~~~~
   include/sound/soc.h:914:42: note: in expansion of macro 'SND_SOC_DAILINK_REG3'
     914 | #define SND_SOC_DAILINK_REG1(name)       SND_SOC_DAILINK_REG3(name##_cpus, name##_codecs, name##_platforms)
         |                                          ^~~~~~~~~~~~~~~~~~~~
   include/sound/soc.h:924:53: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
     924 | #define SND_SOC_DAILINK_REGx(_1, _2, _3, func, ...) func
         |                                                     ^~~~
   include/sound/soc.h:926:9: note: in expansion of macro 'SND_SOC_DAILINK_REGx'
     926 |         SND_SOC_DAILINK_REGx(__VA_ARGS__,               \
         |         ^~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/imx-pcm512x.c:357:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     357 |                 SND_SOC_DAILINK_REG(hifi),
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:9,
                    from include/linux/nodemask.h:95,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:13:
   sound/soc/fsl/imx-pcm512x.c: In function 'imx_pcm512x_probe':
>> arch/m68k/include/asm/string.h:72:25: warning: '__builtin_memcpy' reading 360 bytes from a region of size 120 [-Wstringop-overread]
      72 | #define memcpy(d, s, n) __builtin_memcpy(d, s, n)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/imx-pcm512x.c:429:9: note: in expansion of macro 'memcpy'
     429 |         memcpy(data->dai_link, imx_pcm512x_dai,
         |         ^~~~~~
   sound/soc/fsl/imx-pcm512x.c:348:32: note: source object 'imx_pcm512x_dai' of size 120
     348 | static struct snd_soc_dai_link imx_pcm512x_dai[] = {
         |                                ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]


vim +/__builtin_memcpy +72 arch/m68k/include/asm/string.h

ea61bc461d09e8 Greg Ungerer 2010-09-07  69  
ea61bc461d09e8 Greg Ungerer 2010-09-07  70  #define __HAVE_ARCH_MEMCPY
ea61bc461d09e8 Greg Ungerer 2010-09-07  71  extern void *memcpy(void *, const void *, __kernel_size_t);
ea61bc461d09e8 Greg Ungerer 2010-09-07 @72  #define memcpy(d, s, n) __builtin_memcpy(d, s, n)
ea61bc461d09e8 Greg Ungerer 2010-09-07  73  

:::::: The code at line 72 was first introduced by commit
:::::: ea61bc461d09e8d331a307916530aaae808c72a2 m68k/m68knommu: merge MMU and non-MMU string.h

:::::: TO: Greg Ungerer <gerg@snapgear.com>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
