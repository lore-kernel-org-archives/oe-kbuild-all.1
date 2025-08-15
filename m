Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3DA319874
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755253272; cv=none; b=JKtfKMiNvuspaLyxQIFRATvp3E0tu1gYn3G/3BII2dCPV17EE4vVTZi+Om8Vtu6gfTURLdsUvmB4UrUpdYDq64coa26sCCyEWzfLuh8fGuNYxKHR4bs0HKUrJ2+oyvryB77mSt60ZQucrwBXAVWvm/pVSAp6j+grc1eTUmj528Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755253272; c=relaxed/simple;
	bh=QOxMrsqqgh7L3NkQxl2jq2dwvw5GQ0dRLsQf7dLAYi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WAsLKtxKAqS56B+oMAOiujZe+zH2sLwVocm/x99NK7q1ckuUGzDUJsfCOwcx+tCGykXmzruLifQ8dvoiXW0TUdCSUBXgMEA5I6TLAk3kl158H8Ur7nyjjMQsh9X2o2goctDEPa2JlMy4xzRoJkHYlQFQhzVMXuxObqYDl4oDhGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjZ8xExs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjZ8xExs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755253268; x=1786789268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QOxMrsqqgh7L3NkQxl2jq2dwvw5GQ0dRLsQf7dLAYi0=;
  b=TjZ8xExsGwZ23PoVSCkBJ+XEQGVEBnMQRWoUnhbHfQnSKN0SUOr+WcE1
   6lPiJN+7qT+pkRhP9e6qSlXIjMKVYGY4WWOEOhQATJY5PBCan2qbdMolk
   T9UUKIEfG7CJUf9eUVSKbz9xxJ+kk9Imwh9qAL9cu8F8ACKCFt9lKiHt2
   Lnpjz+T2hTaVJxX5QhUugla+SC+C184dWjKK68Gn88RYNrVZ55x/NFgcu
   3S/P7FiknfZ3wlX3RbhQ7yNxxjE4Ix6f+ghivbUzPixkYf0zF9U7emUkz
   drBumcbe1Em2rEk/l0eQ/H4CcF/joyJyVddG7VR5X9PtILyUuovm/sP5K
   g==;
X-CSE-ConnectionGUID: z7D+SRoSRjueQEd5FWYdfA==
X-CSE-MsgGUID: GEUFurepRmG71Eyx2c5npQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57651976"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57651976"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 03:21:08 -0700
X-CSE-ConnectionGUID: 8+s1ht3wR9K5Sl5GzR7m/Q==
X-CSE-MsgGUID: e4Ho20kVQtGLvd6PpZb85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171232961"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Aug 2025 03:21:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umrXj-000Br6-2H;
	Fri, 15 Aug 2025 10:20:30 +0000
Date: Fri, 15 Aug 2025 18:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:ethos-v2 3/3] drivers/accel/ethos/ethos_drv.c:210:9: error:
 call to undeclared function 'FIELD_GET'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202508151832.GDjxlsFI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v2
head:   2146bfc43e891f1ee2c62e3be5d536b64cb66ae9
commit: 2146bfc43e891f1ee2c62e3be5d536b64cb66ae9 [3/3] accel: Add Arm Ethos-U NPU driver
config: mips-randconfig-r061-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151832.GDjxlsFI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151832.GDjxlsFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151832.GDjxlsFI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/ethos/ethos_drv.c:210:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     210 |         return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosdev->npu_info.id) == 1;
         |                ^
   drivers/accel/ethos/ethos_drv.c:222:7: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     222 |                                  !FIELD_GET(STATUS_RESET_STATUS, reg),
         |                                   ^
   drivers/accel/ethos/ethos_drv.c:222:7: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   drivers/accel/ethos/ethos_drv.c:227:7: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     227 |         if (!FIELD_GET(PROT_ACTIVE_CSL, readl_relaxed(ethosdev->regs + NPU_REG_PROT))) {
         |              ^
   drivers/accel/ethos/ethos_drv.c:329:3: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     329 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
         |                 ^
   drivers/accel/ethos/ethos_drv.c:329:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     328 |                 "Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                   ~~~
         |                                   %d
     329 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:330:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     328 |                 "Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                       ~~~
         |                                       %d
     329 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     330 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:331:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     328 |                 "Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                           ~~~
         |                                           %d
     329 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     330 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
     331 |                 FIELD_GET(ID_ARCH_PATCH_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:332:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     328 |                 "Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                                     ~~~
         |                                                     %d
     329 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     330 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
     331 |                 FIELD_GET(ID_ARCH_PATCH_MASK, id),
     332 |                 FIELD_GET(ID_VER_MAJOR_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:333:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     328 |                 "Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                                         ~~~
         |                                                         %d
     329 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     330 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
     331 |                 FIELD_GET(ID_ARCH_PATCH_MASK, id),
     332 |                 FIELD_GET(ID_VER_MAJOR_MASK, id),
     333 |                 FIELD_GET(ID_VER_MINOR_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:334:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     328 |                 "Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                                                            ~~~
         |                                                                            %d
     329 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     330 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
     331 |                 FIELD_GET(ID_ARCH_PATCH_MASK, id),
     332 |                 FIELD_GET(ID_VER_MAJOR_MASK, id),
     333 |                 FIELD_GET(ID_VER_MINOR_MASK, id),
     334 |                 FIELD_GET(CONFIG_CMD_STREAM_VER_MASK, config),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   6 warnings and 5 errors generated.


vim +/FIELD_GET +210 drivers/accel/ethos/ethos_drv.c

   207	
   208	static bool ethos_is_u65(const struct ethos_device *ethosdev)
   209	{
 > 210		return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosdev->npu_info.id) == 1;
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
