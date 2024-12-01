Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E625015572C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733054951; cv=none; b=VIZj2l9i47Bbu8gFGhUJV/RocU3qyUdy52tfgunWpKvHhtAWMFv0RzKdnT+nKdMUwNoAq1Ft/XU4gfDsSvr/zW3BMTD0Sz40Au++kaXoc691JlGb3PMnt1we4WnquyRUtiEiDGLJYzfRD9s94ssM3/3E1Qt796riQnm03kA71hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733054951; c=relaxed/simple;
	bh=LKtFc9CBLIAIcElgZGoRFQI+J6Mv4dYAZTNUOTewxnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2EnTEJeGPJOOwqoG7yoiZWSIx0yNBqkJ8kyhKW/hPjTsBibOyJ2P2oy4kgQKWMXGsnC47C4EY+co4n54i5YraHp7zMjQ8daUqd4sGVBe8hCUPRHRzrPq1UEJQ76p7X/dCgOWmzQ795eKE0ly4zRlDDv0aG4cdy7ht1kCusQYHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRjU5G2L; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRjU5G2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733054949; x=1764590949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LKtFc9CBLIAIcElgZGoRFQI+J6Mv4dYAZTNUOTewxnk=;
  b=WRjU5G2LbxqNnRJRWUWYd/DmB373pe2oS2YQ4ymPpmEzf90l9Qtjmo76
   v5QfV0pz5OJsmgrdsyDxIjTpGusL1P9m2Nhk16AbCqFgAX+VyHFgXOxyP
   SddLWbWEu62vQqLAoj3FZmyWDZ+VEJ3HvSGci5j2unSzmz4rdxQQmnBK/
   mQSFHp5UYSxCs6P6SrwviGwkxiwSMpTPkeyOsEns7BvqvpHJ9EAa5Rr9h
   uSDUVHFa/ZwQVC8g3pjO2TQL1NutgVO1HIyh+//eJRu6VjX8Oe+m9wmxY
   hGMDdB+VMC/PcQhfzdniEPDpqOhew7gfhSwRkNBr1urnPV/E0uZO9lMZR
   A==;
X-CSE-ConnectionGUID: h75CB9s0QU6Hu54kvJir0g==
X-CSE-MsgGUID: zvr2M29CSb+69J6f7NZ/LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="43710008"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="43710008"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 04:09:08 -0800
X-CSE-ConnectionGUID: sSilOf/fSFGMgSm/EmhpAQ==
X-CSE-MsgGUID: X8FX+YWUSmuz+XPP4+a9TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="116123652"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Dec 2024 04:09:07 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHil6-0001Vt-2k;
	Sun, 01 Dec 2024 12:09:04 +0000
Date: Sun, 1 Dec 2024 20:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Stefan Schmidt <stefan@datenfreihafen.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1268/1268]
 drivers/net/ieee802154/.tmp_mac802154_hwsim.o: warning: objtool: missing
 symbol for section .exit.text
Message-ID: <202412011926.MpDNl2Le-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: f25da51fdc381ca2863248c7060b3662632f0872 [1268/1268] ieee802154: hwsim: add replacement for fakelb
config: x86_64-buildonly-randconfig-004-20241103 (https://download.01.org/0day-ci/archive/20241201/202412011926.MpDNl2Le-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011926.MpDNl2Le-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011926.MpDNl2Le-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ieee802154/mac802154_hwsim.c:22:
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'hwsim_init_module': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   drivers/net/ieee802154/mac802154_hwsim.c:918:1: note: in expansion of macro 'module_init'
     918 | module_init(hwsim_init_module);
         | ^~~~~~~~~~~
   drivers/net/ieee802154/mac802154_hwsim.c:883:19: note: 'init_module' target declared here
     883 | static __init int hwsim_init_module(void)
         |                   ^~~~~~~~~~~~~~~~~
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'hwsim_remove_module': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/net/ieee802154/mac802154_hwsim.c:919:1: note: in expansion of macro 'module_exit'
     919 | module_exit(hwsim_remove_module);
         | ^~~~~~~~~~~
   drivers/net/ieee802154/mac802154_hwsim.c:911:20: note: 'cleanup_module' target declared here
     911 | static __exit void hwsim_remove_module(void)
         |                    ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ieee802154/.tmp_mac802154_hwsim.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
