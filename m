Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72E234D3A9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 20:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778357730; cv=none; b=u4M+xtye+kLC0Y8OsMx10g1ZXYdJ2T85Nbx1j0rv9SkLBUCQKpHESzQZjQD4olcpdiK8tviapOoAAlB2oL7chtz0Q8Bi6Nd4tGwcEhVPpFydJ/ijM5F2LO6L+A/DgNXw7PMv8feZZzPFKnDM/xupuXp3yaNA9PUPuH2IbjoxUos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778357730; c=relaxed/simple;
	bh=C0OZzHAEytqPZbGfRHS48WIGJJBoDDCAs9JAyoVoRi8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sT3ZmLwpflZtTO1j1kCUhqfFTquehl67UWVFNFlOpNdgSJqc6UizfSzp/QikRMohKc+IYiKA3wlpbYC89pRa8dsJnx5icMDj8f/CNIg7uZ2CWW+WCPpmTt6fD457QdRA4bGWadBusAXKNo+5nCJYKIR645nPIKmudpNCs3MpAPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cb8ZuA4c; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cb8ZuA4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778357728; x=1809893728;
  h=date:from:to:cc:subject:message-id;
  bh=C0OZzHAEytqPZbGfRHS48WIGJJBoDDCAs9JAyoVoRi8=;
  b=cb8ZuA4cRoXcCdRFIPC3TEQEwcW4sTFBvDdFiACA8iDYVfZU+eqd/d8Z
   FO5QZjooxDaul/u/ufI0S9i/tYlmvORzUVShVWUKXHG2Mv7iAROp3fzaH
   oOwoYyHl0TkfYxjj1k0pepkIZ4alFUu5lHFQfK/n9YRaFSLn0nATf8Vzn
   Oizq3oPGhtEMaSx3TBaEeRxIbPUEMWBC57pJNryhebv7kUTxxnFkwW1oA
   SfEiopXKHqCjucoGq9sxpFUPaYpNknnkG267Mjc4INfHRhT+LHETIk+nF
   hJ4hPm/2HShIPvMwzlG0TUOPFUrQjC7Ej6z6w8tu8cGs4LfwEyIBaiiad
   g==;
X-CSE-ConnectionGUID: tJ1spMQMT2e97JrB3uzMFw==
X-CSE-MsgGUID: k+JVIdWjTiui6wiJt+tvWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="66832912"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="66832912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 13:15:27 -0700
X-CSE-ConnectionGUID: 6UV1K+fKR8idc2b9+rLgmg==
X-CSE-MsgGUID: c93bdjHzQ6GiMWjKwvUhbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="260532628"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 May 2026 13:15:25 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLo54-000000001Nl-48Pe;
	Sat, 09 May 2026 20:15:22 +0000
Date: Sun, 10 May 2026 04:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Hu <ivan.hu@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Subject: drivers/firmware/efi/test/efi_test.c:364:38: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202605100434.jLnIktJ4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ec89572766744e844df24c27d31c97b4c00f4e07
commit: 3dcb524d785373fd43b129f01f32bd394fe167e0 efi/efi_test: Fix missing pending status update in getwakeuptime
date:   12 months ago
config: arm-randconfig-r112-20260509 (https://download.01.org/0day-ci/archive/20260510/202605100434.jLnIktJ4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100434.jLnIktJ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3dcb524d7853 ("efi/efi_test: Fix missing pending status update in getwakeuptime")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100434.jLnIktJ4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/efi/test/efi_test.c:157:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *register __p @@     got unsigned long *[addressable] data_size @@
   drivers/firmware/efi/test/efi_test.c:157:13: sparse:     expected unsigned long [noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:157:13: sparse:     got unsigned long *[addressable] data_size
   drivers/firmware/efi/test/efi_test.c:160:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct guid_t [usertype] *[addressable] vendor_guid @@
   drivers/firmware/efi/test/efi_test.c:160:61: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:160:61: sparse:     got struct guid_t [usertype] *[addressable] vendor_guid
   drivers/firmware/efi/test/efi_test.c:167:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned short [noderef] [usertype] __user *src @@     got unsigned short [usertype] *[addressable] variable_name @@
   drivers/firmware/efi/test/efi_test.c:167:60: sparse:     expected unsigned short [noderef] [usertype] __user *src
   drivers/firmware/efi/test/efi_test.c:167:60: sparse:     got unsigned short [usertype] *[addressable] variable_name
   drivers/firmware/efi/test/efi_test.c:187:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:187:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:187:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:194:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long *[addressable] data_size @@
   drivers/firmware/efi/test/efi_test.c:194:35: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:194:35: sparse:     got unsigned long *[addressable] data_size
   drivers/firmware/efi/test/efi_test.c:209:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *[addressable] data @@
   drivers/firmware/efi/test/efi_test.c:209:45: sparse:     expected void [noderef] __user *to
   drivers/firmware/efi/test/efi_test.c:209:45: sparse:     got void *[addressable] data
   drivers/firmware/efi/test/efi_test.c:215:19: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__pu_ptr @@     got unsigned int [usertype] *[addressable] attributes @@
   drivers/firmware/efi/test/efi_test.c:215:19: sparse:     expected unsigned int const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:215:19: sparse:     got unsigned int [usertype] *[addressable] attributes
   drivers/firmware/efi/test/efi_test.c:220:19: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long *[addressable] data_size @@
   drivers/firmware/efi/test/efi_test.c:220:19: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
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
   drivers/firmware/efi/test/efi_test.c:263:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:263:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:263:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:292:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:292:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
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
   drivers/firmware/efi/test/efi_test.c:330:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:330:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:330:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:354:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:354:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:354:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:360:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char const [noderef] __user *__pu_ptr @@     got unsigned char [usertype] *[addressable] enabled @@
   drivers/firmware/efi/test/efi_test.c:360:38: sparse:     expected unsigned char const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:360:38: sparse:     got unsigned char [usertype] *[addressable] enabled
>> drivers/firmware/efi/test/efi_test.c:364:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char const [noderef] __user *__pu_ptr @@     got unsigned char [usertype] *[addressable] pending @@
   drivers/firmware/efi/test/efi_test.c:364:38: sparse:     expected unsigned char const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:364:38: sparse:     got unsigned char [usertype] *[addressable] pending
   drivers/firmware/efi/test/efi_test.c:369:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct efi_time_t [usertype] *[addressable] time @@
   drivers/firmware/efi/test/efi_test.c:369:47: sparse:     expected void [noderef] __user *to
   drivers/firmware/efi/test/efi_test.c:369:47: sparse:     got struct efi_time_t [usertype] *[addressable] time
   drivers/firmware/efi/test/efi_test.c:393:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct efi_time_t [usertype] *[addressable] time @@
   drivers/firmware/efi/test/efi_test.c:393:60: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:393:60: sparse:     got struct efi_time_t [usertype] *[addressable] time
   drivers/firmware/efi/test/efi_test.c:401:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:401:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:401:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:425:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *register __p @@     got unsigned long *[addressable] variable_name_size @@
   drivers/firmware/efi/test/efi_test.c:425:21: sparse:     expected unsigned long [noderef] __user *register __p
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
   drivers/firmware/efi/test/efi_test.c:465:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:465:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:465:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:472:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long *[addressable] variable_name_size @@
   drivers/firmware/efi/test/efi_test.c:472:35: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:472:35: sparse:     got unsigned long *[addressable] variable_name_size
   drivers/firmware/efi/test/efi_test.c:483:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [noderef] [usertype] __user *dst @@     got unsigned short [usertype] *[addressable] variable_name @@
   drivers/firmware/efi/test/efi_test.c:483:62: sparse:     expected unsigned short [noderef] [usertype] __user *dst
   drivers/firmware/efi/test/efi_test.c:483:62: sparse:     got unsigned short [usertype] *[addressable] variable_name
   drivers/firmware/efi/test/efi_test.c:491:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long *[addressable] variable_name_size @@
   drivers/firmware/efi/test/efi_test.c:491:21: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:491:21: sparse:     got unsigned long *[addressable] variable_name_size
   drivers/firmware/efi/test/efi_test.c:498:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct guid_t [usertype] *[addressable] vendor_guid @@
   drivers/firmware/efi/test/efi_test.c:498:53: sparse:     expected void [noderef] __user *to
   drivers/firmware/efi/test/efi_test.c:498:53: sparse:     got struct guid_t [usertype] *[addressable] vendor_guid
   drivers/firmware/efi/test/efi_test.c:526:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:526:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:526:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:533:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__pu_ptr @@     got unsigned int [usertype] *[addressable] high_count @@
   drivers/firmware/efi/test/efi_test.c:533:13: sparse:     expected unsigned int const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:533:13: sparse:     got unsigned int [usertype] *[addressable] high_count
   drivers/firmware/efi/test/efi_test.c:550:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user * @@     got void * @@
   drivers/firmware/efi/test/efi_test.c:550:37: sparse:     expected void const [noderef] __user *
   drivers/firmware/efi/test/efi_test.c:550:37: sparse:     got void *
   drivers/firmware/efi/test/efi_test.c:579:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:579:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:579:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:585:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long const [noderef] __user *__pu_ptr @@     got unsigned long long [usertype] *[addressable] maximum_variable_storage_size @@
   drivers/firmware/efi/test/efi_test.c:585:13: sparse:     expected unsigned long long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:585:13: sparse:     got unsigned long long [usertype] *[addressable] maximum_variable_storage_size
   drivers/firmware/efi/test/efi_test.c:589:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long const [noderef] __user *__pu_ptr @@     got unsigned long long [usertype] *[addressable] remaining_variable_storage_size @@
   drivers/firmware/efi/test/efi_test.c:589:13: sparse:     expected unsigned long long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:589:13: sparse:     got unsigned long long [usertype] *[addressable] remaining_variable_storage_size
   drivers/firmware/efi/test/efi_test.c:593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long const [noderef] __user *__pu_ptr @@     got unsigned long long [usertype] *[addressable] maximum_variable_size @@
   drivers/firmware/efi/test/efi_test.c:593:13: sparse:     expected unsigned long long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:593:13: sparse:     got unsigned long long [usertype] *[addressable] maximum_variable_size
   drivers/firmware/efi/test/efi_test.c:629:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct efi_capsule_header_t [usertype] *[noderef] __user *register __p @@     got struct efi_capsule_header_t [usertype] ** @@
   drivers/firmware/efi/test/efi_test.c:629:21: sparse:     expected struct efi_capsule_header_t [usertype] *[noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:629:21: sparse:     got struct efi_capsule_header_t [usertype] **
   drivers/firmware/efi/test/efi_test.c:633:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct efi_capsule_header_t [usertype] *[assigned] c @@
   drivers/firmware/efi/test/efi_test.c:633:50: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:633:50: sparse:     got struct efi_capsule_header_t [usertype] *[assigned] c
   drivers/firmware/efi/test/efi_test.c:647:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] [assigned] status @@
   drivers/firmware/efi/test/efi_test.c:647:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:647:13: sparse:     got unsigned long [usertype] *[addressable] [assigned] status
   drivers/firmware/efi/test/efi_test.c:657:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long const [noderef] __user *__pu_ptr @@     got unsigned long long [usertype] *[addressable] [assigned] maximum_capsule_size @@
   drivers/firmware/efi/test/efi_test.c:657:13: sparse:     expected unsigned long long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:657:13: sparse:     got unsigned long long [usertype] *[addressable] [assigned] maximum_capsule_size
   drivers/firmware/efi/test/efi_test.c:662:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int const [noderef] __user *__pu_ptr @@     got int *[addressable] [assigned] reset_type @@
   drivers/firmware/efi/test/efi_test.c:662:13: sparse:     expected int const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:662:13: sparse:     got int *[addressable] [assigned] reset_type
   drivers/firmware/efi/test/efi_test.c:675:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *supported_mask @@     got unsigned int * @@
   drivers/firmware/efi/test/efi_test.c:675:24: sparse:     expected unsigned int [noderef] __user *supported_mask
   drivers/firmware/efi/test/efi_test.c:675:24: sparse:     got unsigned int *
   drivers/firmware/efi/test/efi_test.c:35:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [usertype] *s @@     got unsigned short [noderef] [usertype] __user *str @@
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     expected unsigned short [usertype] *s
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     got unsigned short [noderef] [usertype] __user *str
   drivers/firmware/efi/test/efi_test.c:44:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [noderef] __user *register __p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     expected unsigned short [noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     got unsigned short [usertype] *
   drivers/firmware/efi/test/efi_test.c:50:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [noderef] __user *register __p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:50:21: sparse:     expected unsigned short [noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:50:21: sparse:     got unsigned short [usertype] *
   drivers/firmware/efi/test/efi_test.c:35:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [usertype] *[assigned] s @@     got unsigned short [noderef] [usertype] __user *str @@
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     expected unsigned short [usertype] *[assigned] s
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     got unsigned short [noderef] [usertype] __user *str
   drivers/firmware/efi/test/efi_test.c:44:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [noderef] __user *register __p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     expected unsigned short [noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     got unsigned short [usertype] *
   drivers/firmware/efi/test/efi_test.c:50:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [noderef] __user *register __p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:50:21: sparse:     expected unsigned short [noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:50:21: sparse:     got unsigned short [usertype] *
   drivers/firmware/efi/test/efi_test.c:35:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [usertype] *[assigned] s @@     got unsigned short [noderef] [usertype] __user *str @@
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     expected unsigned short [usertype] *[assigned] s
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     got unsigned short [noderef] [usertype] __user *str
   drivers/firmware/efi/test/efi_test.c:44:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [noderef] __user *register __p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     expected unsigned short [noderef] __user *register __p

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
