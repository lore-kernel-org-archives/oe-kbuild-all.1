Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3E22940F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 05:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730005814; cv=none; b=s5CGXFLZDoh3makEle0K2NyU3y+f1aV2shrn2xKIFoge612T6uPWp6NPJneoSA0EROrTL6c6keJ5ByPI39bw5mZIbSkimQYmiLXDZIElFsb3yNn+5fttwGHxR0j6RAv87Bgd+jWLssP5gHm7DKbc/iYbbXjq/YVQiSWuawGtY5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730005814; c=relaxed/simple;
	bh=UpcqT3r+klbGauYdnaAQB7U9vqNGir3vyiOgVJMlSkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WtBq9m8qMeoR046VPUxq5TbTn/Le7bKO9oGN0LA6ipC5KKpF4R+N0Kx84KJu9f7e0zFMvmo6DWsQm0vhN2bDR1S0HxXYNnbjAn81iJOszXIaUu2ApMUAX6nvFse7yLLptsTeuPnufWL1JY4IaLEYexMxYYt9ATOwTlInopqO668=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIvc6QcA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIvc6QcA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730005813; x=1761541813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UpcqT3r+klbGauYdnaAQB7U9vqNGir3vyiOgVJMlSkk=;
  b=NIvc6QcAxMHer+IS90gpHtOYbbIVgyCXEWd+3t/Z8RV36VV2L6V5jfoW
   iHrVf6UlA3cXymR1u9vQdDHJex5kSKNLMIQok6kLPWVbtME4cuKfV3gsx
   c747x+QTTa7ta7Fz9QQjA26sJCCLNtmzNTaeVN7J3xh06ZuA6MMf4yVXb
   KvIjHXP+AWoDDGZNE2xqUujaJNPrlJwq2lIrZkCOjv48E1QEuc8A8YJ7b
   lxESi90TTG5UvO+6ioOGRt7r0AjhGwS+ZuQv8jL5H+JxerDxJmi/+lv9t
   CIpCqXwX1ibemIDF6alan357BC1h0hqR4184+DppJdNOX9pxeu8Ry+RUa
   A==;
X-CSE-ConnectionGUID: ir8VVCIASFutcp06dYKbYQ==
X-CSE-MsgGUID: 97FgRWiTSY+IXMIh0Ux2gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47091808"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47091808"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 22:10:12 -0700
X-CSE-ConnectionGUID: Z6as8gH9ReiO6/6dCR+m8Q==
X-CSE-MsgGUID: iGxBiPyrSlKxHl0omI91xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="118766794"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Oct 2024 22:10:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4vXU-000aO6-0L;
	Sun, 27 Oct 2024 05:10:08 +0000
Date: Sun, 27 Oct 2024 13:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiongmengbiao <xiongmengbiao@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13447/15331] include/linux/psp-hygon.h:219:5:
 warning: no previous prototype for function 'psp_register_cmd_notifier'
Message-ID: <202410271346.39dehlHW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi niuyongwen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: 518c81d56c055affc71650b1ad1ba7f86e5ee867 [13447/15331] arch/x86/kvm: Support tkm virtualization
config: x86_64-randconfig-006-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271346.39dehlHW-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271346.39dehlHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271346.39dehlHW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/psp.c:12:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/x86/kvm/psp.c:15:
>> include/linux/psp-hygon.h:219:5: warning: no previous prototype for function 'psp_register_cmd_notifier' [-Wmissing-prototypes]
     219 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^
   include/linux/psp-hygon.h:219:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     219 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         | ^
         | static 
>> include/linux/psp-hygon.h:220:5: warning: no previous prototype for function 'psp_unregister_cmd_notifier' [-Wmissing-prototypes]
     220 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^
   include/linux/psp-hygon.h:220:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     220 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         | ^
         | static 
   arch/x86/kvm/psp.c:105:21: warning: no previous prototype for function 'map_tbl_dump' [-Wmissing-prototypes]
     105 | void __maybe_unused map_tbl_dump(const char *title, struct addr_map_tbls *tbls)
         |                     ^
   arch/x86/kvm/psp.c:105:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     105 | void __maybe_unused map_tbl_dump(const char *title, struct addr_map_tbls *tbls)
         | ^
         | static 
   arch/x86/kvm/psp.c:118:21: warning: no previous prototype for function 'g2h_tbl_dump' [-Wmissing-prototypes]
     118 | void __maybe_unused g2h_tbl_dump(const char *title, struct gpa2hva_tbls *tbls)
         |                     ^
   arch/x86/kvm/psp.c:118:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     118 | void __maybe_unused g2h_tbl_dump(const char *title, struct gpa2hva_tbls *tbls)
         | ^
         | static 
   5 warnings generated.


vim +/psp_register_cmd_notifier +219 include/linux/psp-hygon.h

d0b3a770d8e20d chench00 2024-08-01  218  
d0b3a770d8e20d chench00 2024-08-01 @219  int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
d0b3a770d8e20d chench00 2024-08-01 @220  int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
d0b3a770d8e20d chench00 2024-08-01  221  

:::::: The code at line 219 was first introduced by commit
:::::: d0b3a770d8e20d953fe2a74ea8c4b5f4767c4add crypto: command co-processor: Add another mailbox interrupt support for PSP sending command to X86

:::::: TO: chench00 <chench@hygon.cn>
:::::: CC: chench00 <chench@hygon.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
