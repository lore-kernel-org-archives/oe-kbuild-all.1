Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA7A357CFB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 12:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180369; cv=none; b=CQOuPZW/GFL6eBQFWYBve/CVKRpnf6GtzPhwqICiLNomfnO80FlSNtOJ1zwy4nR2c0CiGMKHrijIqnMeCl3+uOtuurCtCMkTcipB+kCK3kNhxjTstMlWZQijTLkHKxU3toLQyjWEdZYhojG2dk3WIuuFC1DRiZ3HBo1n9OptlmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180369; c=relaxed/simple;
	bh=WLF98JJuUu4H3o6MHlxzJANwnj16o20AvW78Py/B2SE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IdoWWuvSkvwFzFaobjUYju4FYltSyUi5Pf4EeJGPE828QmIhJ+oIfEMBxVXCb50HVDEpvGdx/6XH1JFGfJbMBe73M6eeOs9xfHbQ+WXSlEZnLQ2N6mgkoK0IHrsbf+DJDj0XJF2779rjjbvUjeBqGgYKPPclKUzCwwW7DlXcYVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCf7CFKq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCf7CFKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781180362; x=1812716362;
  h=date:from:to:cc:subject:message-id;
  bh=WLF98JJuUu4H3o6MHlxzJANwnj16o20AvW78Py/B2SE=;
  b=eCf7CFKq7t7UlelMedxA6eXx7233il1wbaKSF1c9rLYS+TJLiT0r3cNO
   mJjfn/91NdFNPBtJlNLldMqAiFAGuclK4MtQrPor67KwLDhuX2IT5zqr4
   YZgn1yq5pO9FgGB3+niQtiG3YxV36UEKFqvd7UA3gza3CyB05cKyCW3/G
   ghJsqBCDyop6av+ol9fTHB3daFhTfbk1zvR4kFWMWp062mpGRJhcOy6HG
   5d8QrdaaLXpdglmTpDuUfI5ilJOl2HekQQRH/0vj+Yc++paQEPj0egVEm
   ULb7HwluejnXYMi9HULMb4N1XYKwxHID4ZfRNBIK0qdOFHrxDIFlxGpqE
   w==;
X-CSE-ConnectionGUID: q8C1/GLjQwWKdbH/IphV0g==
X-CSE-MsgGUID: I0pWmpUxQn6K3dI4lNwEjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93097764"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="93097764"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:19:22 -0700
X-CSE-ConnectionGUID: sLkk7bGUS8KJQ24RLc6h7A==
X-CSE-MsgGUID: kXHIgiJXSp6l8Ua4WuFOhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="250754067"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 05:19:20 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXeNQ-00000000MwG-3bBr;
	Thu, 11 Jun 2026 12:19:16 +0000
Date: Thu, 11 Jun 2026 20:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Hu <ivan.hu@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Subject: drivers/firmware/efi/test/efi_test.c:364:38: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202606112036.v7rQrC9p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 3dcb524d785373fd43b129f01f32bd394fe167e0 efi/efi_test: Fix missing pending status update in getwakeuptime
date:   1 year, 1 month ago
config: loongarch-randconfig-r121-20260611 (https://download.01.org/0day-ci/archive/20260611/202606112036.v7rQrC9p-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112036.v7rQrC9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3dcb524d7853 ("efi/efi_test: Fix missing pending status update in getwakeuptime")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112036.v7rQrC9p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/efi/test/efi_test.c:157:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__p @@     got unsigned long *[addressable] data_size @@
   drivers/firmware/efi/test/efi_test.c:157:13: sparse:     expected unsigned long const [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:157:13: sparse:     got unsigned long *[addressable] data_size
   drivers/firmware/efi/test/efi_test.c:160:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct guid_t [usertype] *[addressable] vendor_guid @@
   drivers/firmware/efi/test/efi_test.c:160:61: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:160:61: sparse:     got struct guid_t [usertype] *[addressable] vendor_guid
   drivers/firmware/efi/test/efi_test.c:167:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned short [noderef] [usertype] __user *src @@     got unsigned short [usertype] *[addressable] variable_name @@
   drivers/firmware/efi/test/efi_test.c:167:60: sparse:     expected unsigned short [noderef] [usertype] __user *src
   drivers/firmware/efi/test/efi_test.c:167:60: sparse:     got unsigned short [usertype] *[addressable] variable_name
   drivers/firmware/efi/test/efi_test.c:187:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:187:13: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:187:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:194:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long *[addressable] data_size @@
   drivers/firmware/efi/test/efi_test.c:194:35: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:194:35: sparse:     got unsigned long *[addressable] data_size
   drivers/firmware/efi/test/efi_test.c:209:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *[addressable] data @@
   drivers/firmware/efi/test/efi_test.c:209:45: sparse:     expected void [noderef] __user *to
   drivers/firmware/efi/test/efi_test.c:209:45: sparse:     got void *[addressable] data
   drivers/firmware/efi/test/efi_test.c:215:19: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] *[addressable] attributes @@
   drivers/firmware/efi/test/efi_test.c:215:19: sparse:     expected unsigned int [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:215:19: sparse:     got unsigned int [usertype] *[addressable] attributes
   drivers/firmware/efi/test/efi_test.c:220:19: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long *[addressable] data_size @@
   drivers/firmware/efi/test/efi_test.c:220:19: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:220:19: sparse:     got unsigned long *[addressable] data_size
   drivers/firmware/efi/test/efi_test.c:243:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct guid_t [usertype] *[addressable] vendor_guid @@
   drivers/firmware/efi/test/efi_test.c:243:53: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:243:53: sparse:     got struct guid_t [usertype] *[addressable] vendor_guid
   drivers/firmware/efi/test/efi_test.c:248:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned short [noderef] [usertype] __user *src @@     got unsigned short [usertype] *[addressable] variable_name @@
   drivers/firmware/efi/test/efi_test.c:248:60: sparse:     expected unsigned short [noderef] [usertype] __user *src
   drivers/firmware/efi/test/efi_test.c:248:60: sparse:     got unsigned short [usertype] *[addressable] variable_name
   drivers/firmware/efi/test/efi_test.c:253:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user * @@     got void *[addressable] data @@
   drivers/firmware/efi/test/efi_test.c:253:39: sparse:     expected void const [noderef] __user *
   drivers/firmware/efi/test/efi_test.c:253:39: sparse:     got void *[addressable] data
   drivers/firmware/efi/test/efi_test.c:263:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:263:13: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:263:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:292:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:292:13: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:292:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:301:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct efi_time_cap_t [noderef] [usertype] __user *cap_local @@     got struct efi_time_cap_t [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:301:27: sparse:     expected struct efi_time_cap_t [noderef] [usertype] __user *cap_local
   drivers/firmware/efi/test/efi_test.c:301:27: sparse:     got struct efi_time_cap_t [usertype] *
   drivers/firmware/efi/test/efi_test.c:308:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct efi_time_t [usertype] *[addressable] time @@
   drivers/firmware/efi/test/efi_test.c:308:41: sparse:     expected void [noderef] __user *to
   drivers/firmware/efi/test/efi_test.c:308:41: sparse:     got struct efi_time_t [usertype] *[addressable] time
   drivers/firmware/efi/test/efi_test.c:325:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct efi_time_t [usertype] *[addressable] time @@
   drivers/firmware/efi/test/efi_test.c:325:46: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:325:46: sparse:     got struct efi_time_t [usertype] *[addressable] time
   drivers/firmware/efi/test/efi_test.c:330:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:330:13: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:330:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:354:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:354:13: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:354:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:360:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [noderef] __user *__p @@     got unsigned char [usertype] *[addressable] enabled @@
   drivers/firmware/efi/test/efi_test.c:360:38: sparse:     expected unsigned char [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:360:38: sparse:     got unsigned char [usertype] *[addressable] enabled
>> drivers/firmware/efi/test/efi_test.c:364:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [noderef] __user *__p @@     got unsigned char [usertype] *[addressable] pending @@
   drivers/firmware/efi/test/efi_test.c:364:38: sparse:     expected unsigned char [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:364:38: sparse:     got unsigned char [usertype] *[addressable] pending
   drivers/firmware/efi/test/efi_test.c:369:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct efi_time_t [usertype] *[addressable] time @@
   drivers/firmware/efi/test/efi_test.c:369:47: sparse:     expected void [noderef] __user *to
   drivers/firmware/efi/test/efi_test.c:369:47: sparse:     got struct efi_time_t [usertype] *[addressable] time
   drivers/firmware/efi/test/efi_test.c:393:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct efi_time_t [usertype] *[addressable] time @@
   drivers/firmware/efi/test/efi_test.c:393:60: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:393:60: sparse:     got struct efi_time_t [usertype] *[addressable] time
   drivers/firmware/efi/test/efi_test.c:401:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:401:13: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:401:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:425:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__p @@     got unsigned long *[addressable] variable_name_size @@
   drivers/firmware/efi/test/efi_test.c:425:21: sparse:     expected unsigned long const [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:425:21: sparse:     got unsigned long *[addressable] variable_name_size
   drivers/firmware/efi/test/efi_test.c:433:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct guid_t [usertype] *[addressable] vendor_guid @@
   drivers/firmware/efi/test/efi_test.c:433:52: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:433:52: sparse:     got struct guid_t [usertype] *[addressable] vendor_guid
   drivers/firmware/efi/test/efi_test.c:443:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [noderef] [usertype] __user *src @@     got unsigned short [usertype] *[addressable] variable_name @@
   drivers/firmware/efi/test/efi_test.c:443:52: sparse:     expected unsigned short [noderef] [usertype] __user *src
   drivers/firmware/efi/test/efi_test.c:443:52: sparse:     got unsigned short [usertype] *[addressable] variable_name
   drivers/firmware/efi/test/efi_test.c:456:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned short [noderef] [usertype] __user *src @@     got unsigned short [usertype] *[addressable] variable_name @@
   drivers/firmware/efi/test/efi_test.c:456:52: sparse:     expected unsigned short [noderef] [usertype] __user *src
   drivers/firmware/efi/test/efi_test.c:456:52: sparse:     got unsigned short [usertype] *[addressable] variable_name
   drivers/firmware/efi/test/efi_test.c:465:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:465:13: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:465:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:472:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long *[addressable] variable_name_size @@
   drivers/firmware/efi/test/efi_test.c:472:35: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:472:35: sparse:     got unsigned long *[addressable] variable_name_size
   drivers/firmware/efi/test/efi_test.c:483:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [noderef] [usertype] __user *dst @@     got unsigned short [usertype] *[addressable] variable_name @@
   drivers/firmware/efi/test/efi_test.c:483:62: sparse:     expected unsigned short [noderef] [usertype] __user *dst
   drivers/firmware/efi/test/efi_test.c:483:62: sparse:     got unsigned short [usertype] *[addressable] variable_name
   drivers/firmware/efi/test/efi_test.c:491:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long *[addressable] variable_name_size @@
   drivers/firmware/efi/test/efi_test.c:491:21: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:491:21: sparse:     got unsigned long *[addressable] variable_name_size
   drivers/firmware/efi/test/efi_test.c:498:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct guid_t [usertype] *[addressable] vendor_guid @@
   drivers/firmware/efi/test/efi_test.c:498:53: sparse:     expected void [noderef] __user *to
   drivers/firmware/efi/test/efi_test.c:498:53: sparse:     got struct guid_t [usertype] *[addressable] vendor_guid
   drivers/firmware/efi/test/efi_test.c:526:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:526:13: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:526:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:533:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] *[addressable] high_count @@
   drivers/firmware/efi/test/efi_test.c:533:13: sparse:     expected unsigned int [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:533:13: sparse:     got unsigned int [usertype] *[addressable] high_count
   drivers/firmware/efi/test/efi_test.c:550:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user * @@     got void * @@
   drivers/firmware/efi/test/efi_test.c:550:37: sparse:     expected void const [noderef] __user *
   drivers/firmware/efi/test/efi_test.c:550:37: sparse:     got void *
   drivers/firmware/efi/test/efi_test.c:579:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:579:13: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:579:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:585:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] __user *__p @@     got unsigned long long [usertype] *[addressable] maximum_variable_storage_size @@
   drivers/firmware/efi/test/efi_test.c:585:13: sparse:     expected unsigned long long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:585:13: sparse:     got unsigned long long [usertype] *[addressable] maximum_variable_storage_size
   drivers/firmware/efi/test/efi_test.c:589:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] __user *__p @@     got unsigned long long [usertype] *[addressable] remaining_variable_storage_size @@
   drivers/firmware/efi/test/efi_test.c:589:13: sparse:     expected unsigned long long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:589:13: sparse:     got unsigned long long [usertype] *[addressable] remaining_variable_storage_size
   drivers/firmware/efi/test/efi_test.c:593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] __user *__p @@     got unsigned long long [usertype] *[addressable] maximum_variable_size @@
   drivers/firmware/efi/test/efi_test.c:593:13: sparse:     expected unsigned long long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:593:13: sparse:     got unsigned long long [usertype] *[addressable] maximum_variable_size
   drivers/firmware/efi/test/efi_test.c:629:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct efi_capsule_header_t [usertype] *const [noderef] __user *__p @@     got struct efi_capsule_header_t [usertype] ** @@
   drivers/firmware/efi/test/efi_test.c:629:21: sparse:     expected struct efi_capsule_header_t [usertype] *const [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:629:21: sparse:     got struct efi_capsule_header_t [usertype] **
   drivers/firmware/efi/test/efi_test.c:629:21: sparse: sparse: Using plain integer as NULL pointer
   drivers/firmware/efi/test/efi_test.c:633:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct efi_capsule_header_t [usertype] *[assigned] c @@
   drivers/firmware/efi/test/efi_test.c:633:50: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:633:50: sparse:     got struct efi_capsule_header_t [usertype] *[assigned] c
   drivers/firmware/efi/test/efi_test.c:647:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *__p @@     got unsigned long [usertype] *[addressable] [assigned] status @@
   drivers/firmware/efi/test/efi_test.c:647:13: sparse:     expected unsigned long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:647:13: sparse:     got unsigned long [usertype] *[addressable] [assigned] status
   drivers/firmware/efi/test/efi_test.c:657:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] __user *__p @@     got unsigned long long [usertype] *[addressable] [assigned] maximum_capsule_size @@
   drivers/firmware/efi/test/efi_test.c:657:13: sparse:     expected unsigned long long [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:657:13: sparse:     got unsigned long long [usertype] *[addressable] [assigned] maximum_capsule_size
   drivers/firmware/efi/test/efi_test.c:662:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] __user *__p @@     got int *[addressable] [assigned] reset_type @@
   drivers/firmware/efi/test/efi_test.c:662:13: sparse:     expected int [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:662:13: sparse:     got int *[addressable] [assigned] reset_type
   drivers/firmware/efi/test/efi_test.c:675:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *supported_mask @@     got unsigned int * @@
   drivers/firmware/efi/test/efi_test.c:675:24: sparse:     expected unsigned int [noderef] __user *supported_mask
   drivers/firmware/efi/test/efi_test.c:675:24: sparse:     got unsigned int *
   drivers/firmware/efi/test/efi_test.c:35:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [usertype] *s @@     got unsigned short [noderef] [usertype] __user *str @@
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     expected unsigned short [usertype] *s
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     got unsigned short [noderef] [usertype] __user *str
   drivers/firmware/efi/test/efi_test.c:44:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short const [noderef] __user *__p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     expected unsigned short const [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     got unsigned short [usertype] *
   drivers/firmware/efi/test/efi_test.c:50:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short const [noderef] __user *__p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:50:21: sparse:     expected unsigned short const [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:50:21: sparse:     got unsigned short [usertype] *
   drivers/firmware/efi/test/efi_test.c:35:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [usertype] *[assigned] s @@     got unsigned short [noderef] [usertype] __user *str @@
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     expected unsigned short [usertype] *[assigned] s
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     got unsigned short [noderef] [usertype] __user *str
   drivers/firmware/efi/test/efi_test.c:44:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short const [noderef] __user *__p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     expected unsigned short const [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     got unsigned short [usertype] *
   drivers/firmware/efi/test/efi_test.c:50:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short const [noderef] __user *__p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:50:21: sparse:     expected unsigned short const [noderef] __user *__p
   drivers/firmware/efi/test/efi_test.c:50:21: sparse:     got unsigned short [usertype] *
   drivers/firmware/efi/test/efi_test.c:35:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [usertype] *[assigned] s @@     got unsigned short [noderef] [usertype] __user *str @@
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     expected unsigned short [usertype] *[assigned] s
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     got unsigned short [noderef] [usertype] __user *str
   drivers/firmware/efi/test/efi_test.c:44:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short const [noderef] __user *__p @@     got unsigned short [usertype] * @@

vim +364 drivers/firmware/efi/test/efi_test.c

   335	
   336	static long efi_runtime_get_waketime(unsigned long arg)
   337	{
   338		struct efi_getwakeuptime __user *getwakeuptime_user;
   339		struct efi_getwakeuptime getwakeuptime;
   340		efi_bool_t enabled, pending;
   341		efi_status_t status;
   342		efi_time_t efi_time;
   343	
   344		getwakeuptime_user = (struct efi_getwakeuptime __user *)arg;
   345		if (copy_from_user(&getwakeuptime, getwakeuptime_user,
   346					sizeof(getwakeuptime)))
   347			return -EFAULT;
   348	
   349		status = efi.get_wakeup_time(
   350			getwakeuptime.enabled ? (efi_bool_t *)&enabled : NULL,
   351			getwakeuptime.pending ? (efi_bool_t *)&pending : NULL,
   352			getwakeuptime.time ? &efi_time : NULL);
   353	
   354		if (put_user(status, getwakeuptime.status))
   355			return -EFAULT;
   356	
   357		if (status != EFI_SUCCESS)
   358			return -EINVAL;
   359	
   360		if (getwakeuptime.enabled && put_user(enabled,
   361							getwakeuptime.enabled))
   362			return -EFAULT;
   363	
 > 364		if (getwakeuptime.pending && put_user(pending,
   365							getwakeuptime.pending))
   366			return -EFAULT;
   367	
   368		if (getwakeuptime.time) {
   369			if (copy_to_user(getwakeuptime.time, &efi_time,
   370					sizeof(efi_time_t)))
   371				return -EFAULT;
   372		}
   373	
   374		return 0;
   375	}
   376	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
