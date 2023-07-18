Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3D8FBF2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689675347; x=1721211347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s0SA40sGLqVponnbYhMKQm3FcY/vH3MusfqRcSMZHiQ=;
  b=iZYvcK8ZehXhdSqslZ/RMhuZId/F1Harn7B2b1Q+BqKSx8f5XDAOb5pz
   A0jUqM+BBTikQjxOAiyJmMyXvfaQCFFeAhunO5o3oJy1a2rwAp924SG0Q
   /7b8u2nLsy3M6P8o1CMczFg1wbXxuFTy8hXirxlVTMCm7rA4v3T80K2hz
   UEUXVVBsxEzLg+Wypg6fow/DBhO2AF1sFdMlkV2+ic5mO9xJvcVFTqNHR
   elHXqrLD8WOfaflLaQVXi7kE7Z5IkZ0Xx+zuJaWmeQg6T2AznRYpRrj4Y
   sGdhaDUFDhU4xAUrx8q+70G2zirEbUUzIfMMqVno0raazjbYUsHnQsAdR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="363632552"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="363632552"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 03:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="1054243680"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="1054243680"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jul 2023 03:15:41 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLhk4-0000Uc-17;
	Tue, 18 Jul 2023 10:15:40 +0000
Date: Tue, 18 Jul 2023 18:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Shahidan, Muhammad Shahmil" <muhammad.shahmil.shahidan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jianfeng Gao <jianfeng.gao@intel.com>
Subject: [intel-lts:6.1/linux 1/1] drivers/media/i2c/ar0234.c:2246:13:
 warning: no previous prototype for function 'ar0234_threaded_irq_fn'
Message-ID: <202307181849.DcntlzXE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   11e606448ad35e3c3041a363f4231d3676c5a226
commit: 23e0720a5491760942dbc3361d5f436a6cf3fc51 [1/1] Modify AR0234 driver for 6.1 kernel.
config: hexagon-randconfig-r034-20230718 (https://download.01.org/0day-ci/archive/20230718/202307181849.DcntlzXE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307181849.DcntlzXE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307181849.DcntlzXE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/ar0234.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/i2c/ar0234.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/i2c/ar0234.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/media/i2c/ar0234.c:2246:13: warning: no previous prototype for function 'ar0234_threaded_irq_fn' [-Wmissing-prototypes]
    2246 | irqreturn_t ar0234_threaded_irq_fn(int irq, void *dev_id)
         |             ^
   drivers/media/i2c/ar0234.c:2246:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2246 | irqreturn_t ar0234_threaded_irq_fn(int irq, void *dev_id)
         | ^
         | static 
   7 warnings generated.


vim +/ar0234_threaded_irq_fn +2246 drivers/media/i2c/ar0234.c

f4f573909f4273 zouxiaoh 2023-05-05  2245  
f4f573909f4273 zouxiaoh 2023-05-05 @2246  irqreturn_t ar0234_threaded_irq_fn(int irq, void *dev_id)
f4f573909f4273 zouxiaoh 2023-05-05  2247  {
f4f573909f4273 zouxiaoh 2023-05-05  2248  	struct ar0234 *ar0234 = dev_id;
f4f573909f4273 zouxiaoh 2023-05-05  2249  
f4f573909f4273 zouxiaoh 2023-05-05  2250  	if ((ar0234->platform_data->gpios[0] != -1) && (ar0234->platform_data->irq_pin != -1)) {
f4f573909f4273 zouxiaoh 2023-05-05  2251  		mutex_lock(&ar0234->mutex);
f4f573909f4273 zouxiaoh 2023-05-05  2252  		if (ar0234->streaming == false) {
f4f573909f4273 zouxiaoh 2023-05-05  2253  			gpio_set_value(ar0234->platform_data->gpios[0], 0);
f4f573909f4273 zouxiaoh 2023-05-05  2254  			goto ar0234_irq_handled;
f4f573909f4273 zouxiaoh 2023-05-05  2255  		}
f4f573909f4273 zouxiaoh 2023-05-05  2256  
f4f573909f4273 zouxiaoh 2023-05-05  2257  		if (ar0234->strobe_source->val == V4L2_FLASH_STROBE_SOURCE_EXTERNAL) {
f4f573909f4273 zouxiaoh 2023-05-05  2258  			gpio_set_value(ar0234->platform_data->gpios[0],
f4f573909f4273 zouxiaoh 2023-05-05  2259  					gpio_get_value(ar0234->platform_data->irq_pin));
f4f573909f4273 zouxiaoh 2023-05-05  2260  		}
f4f573909f4273 zouxiaoh 2023-05-05  2261  
f4f573909f4273 zouxiaoh 2023-05-05  2262  ar0234_irq_handled:
f4f573909f4273 zouxiaoh 2023-05-05  2263  		mutex_unlock(&ar0234->mutex);
f4f573909f4273 zouxiaoh 2023-05-05  2264  	}
f4f573909f4273 zouxiaoh 2023-05-05  2265  
f4f573909f4273 zouxiaoh 2023-05-05  2266  	return IRQ_HANDLED;
f4f573909f4273 zouxiaoh 2023-05-05  2267  }
f4f573909f4273 zouxiaoh 2023-05-05  2268  

:::::: The code at line 2246 was first introduced by commit
:::::: f4f573909f4273e27e507e2cd7a6e8913a2c8fc8 add ipu driver for LTS 6.1

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: Pan, Kris <kris.pan@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
