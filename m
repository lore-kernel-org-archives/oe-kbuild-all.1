Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3135D1D55E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 21:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cc61JmGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699134308; x=1730670308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrLfvV9DqUR0bthBgVLEuAx0NnhwVIf9xOkSjdKft1Q=;
  b=cc61JmGb+R9qPrQFHr1OUXpSI0ZK/LaesVSNiQHHedVMzt4RJYEMsU5w
   RWsZ6Enggjo/dgHgUrb5mOhUc1tjDBRaWOK4kVtNbau+vybhk945rzVb4
   ipbdr2HUFL1bi5ptDtJAr+p0T/ONLzwspW74hDIQ7adNf+DZx23X8wQtb
   IabNp+JzyPS9vZWVptdozJuso/z1Ti4RjRPnzBiek/IR3/rgfy2LwkdK3
   pv1xB9247URHzBglM1JpF6o3OUNkfO6g4S+VPB2cVq8FRhA2MvohOSzAd
   jCjpmkfdq0d9ERZO1NP9SihI11iw02VeaovG7W9GbP9bTGOhZkTzzz7uG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="391978040"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="391978040"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 14:45:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="3253946"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Nov 2023 14:45:05 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzORy-0004iU-3C;
	Sat, 04 Nov 2023 21:45:02 +0000
Date: Sun, 5 Nov 2023 05:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: Saravana Kannan <saravanak@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Chun-Hung Wu <chun-hung.wu@mediatek.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Orson Zhai <orson.zhai@unisoc.com>
Subject: [sudeep-holla:android13-5.15/ffa 2445/4062] timer-of.c:undefined
 reference to `of_iomap'
Message-ID: <202311050535.sHEb1YIK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: 3ff3c30b7d4f644fca0bbe42d2ba0a3f893cfa1e [2445/4062] FROMLIST: drivers/clocksource/timer-of: Remove __init markings
config: s390-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20231105/202311050535.sHEb1YIK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311050535.sHEb1YIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311050535.sHEb1YIK-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: warning: drivers/of/unittest-data/overlay_gpio_04b.dtb.o: missing .note.GNU-stack section implies executable stack
   s390-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   s390-linux-ld: warning: drivers/of/unittest-data/overlay_gpio_04b.dtb.o: missing .note.GNU-stack section implies executable stack
   s390-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   s390-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   s390-linux-ld: kernel/dma/coherent.o: in function `dma_init_coherent_memory':
   coherent.c:(.text+0xfa): undefined reference to `memremap'
   s390-linux-ld: coherent.c:(.text+0x210): undefined reference to `memunmap'
   s390-linux-ld: kernel/dma/coherent.o: in function `dma_declare_coherent_memory':
   coherent.c:(.text+0x5fc): undefined reference to `memunmap'
   s390-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt':
   irq-al-fic.c:(.init.text+0x56): undefined reference to `of_iomap'
   s390-linux-ld: irq-al-fic.c:(.init.text+0x39e): undefined reference to `iounmap'
   s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_init':
>> timer-of.c:(.text+0x70): undefined reference to `of_iomap'
>> s390-linux-ld: timer-of.c:(.text+0x502): undefined reference to `iounmap'
   s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_cleanup':
>> timer-of.c:(.text+0x664): undefined reference to `iounmap'
   s390-linux-ld: drivers/clocksource/timer-microchip-pit64b.o: in function `mchp_pit64b_dt_init_timer':
   timer-microchip-pit64b.c:(.init.text+0x436): undefined reference to `of_iomap'
   s390-linux-ld: timer-microchip-pit64b.c:(.init.text+0x8de): undefined reference to `iounmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
