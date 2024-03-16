Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE09184D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 01:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710554077; cv=none; b=nDNj2QwfEHQQirBFYl6REYcgmKVfpbHqlraYOJY5aZCwor6Nc22jTD39bWaY7lYoOkSUB857Fs1OV5s1uP4cvRvBsN9aIgMu3l5A0t5vSEoJAz0TNoJHMSb2HqI3o0cmWhnpYouMxjtIihHietJCg5aLgPEhrNA/AXJiUTVQKjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710554077; c=relaxed/simple;
	bh=ieKQuy8Sff4H44iZYZI8f7o8bWSet5K0usJXdfm5Axg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fcof3uiQ5Jfc6KOXWjCGIMPP2xrqPht4FL0FE2yb2eppouTyxkR9vI/rkDuKb3GBzAHMxUtjaUqnyLS2HNPMnbfYpwpWtvahcqXnM8EH20V3mTypxRkzYbvy3ubQKMwotpvmH9a6PZg4z0JcXEEmoOhKwOm9aiSij0MFBSwwHvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKzgWCzR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKzgWCzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710554075; x=1742090075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ieKQuy8Sff4H44iZYZI8f7o8bWSet5K0usJXdfm5Axg=;
  b=YKzgWCzR8pENCEJcZGdk9MrLXkHhcz+XruztRtnEBVEpwheqfSM7ONba
   hm+7+VSKlcqnZLhen0WX3W99YzzVKw+bjpFKexkh2yAv93omMihJ/q7xc
   AfgOBlk3XzgxZk3ISWlecunAhMrCKs7+L2XFWs6Fj6crx+DID8nAAWYdT
   KZt8Sg4yceXY/rmOpMwdHqjPcZE7+D1+WXu5hu+Jh2dEytGl1dh0A/mV5
   mt9ZXaM63whSNsrLi8Q2zzN+7Gko2KfX/v0/sc2ziFEW39gzZVTOrv7MA
   tC1Zt3yhCpEDhWCVK9ysG8h6qx2mrbdlIFWkVoLU7maPoKm3Wz2wwTVhw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5573373"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5573373"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 18:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="17457795"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2024 18:54:31 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlJFl-000EyR-0L;
	Sat, 16 Mar 2024 01:54:29 +0000
Date: Sat, 16 Mar 2024 09:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 27070/27507] hook_frame.c:undefined
 reference to `sock_info_flag'
Message-ID: <202403160904.pJOletVp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: ba1503e9ed8f70dee78545c9b49425be956deea8 [27070/27507] security: add security hook point
config: x86_64-buildonly-randconfig-003-20240310 (https://download.01.org/0day-ci/archive/20240316/202403160904.pJOletVp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160904.pJOletVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160904.pJOletVp-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/mm/fault.o: in function `do_user_addr_fault':
   fault.c:(.text+0x11e9): undefined reference to `sysctl_gpu_qos'
   ld: kernel/rue.o: in function `rue_io_enabled':
   rue.c:(.text+0x7): undefined reference to `sysctl_io_qos_enabled'
   ld: kernel/tkernel/hook_frame.o: in function `sock_hook_check':
>> hook_frame.c:(.text+0x28): undefined reference to `sock_info_flag'
   ld: kernel/tkernel/hook_frame.o: in function `execve_hook_check':
>> hook_frame.c:(.text+0x68): undefined reference to `execve_info_flag'
   ld: kernel/tkernel/hook_frame.o: in function `accept_hook_check':
>> hook_frame.c:(.text+0xa8): undefined reference to `accept_info_flag'
   ld: kernel/tkernel/hook_frame.o: in function `connect_hook_check':
>> hook_frame.c:(.text+0xe8): undefined reference to `connect_info_flag'
   ld: kernel/tkernel/hook_frame.o: in function `sendto_hook_check':
>> hook_frame.c:(.text+0x128): undefined reference to `sendto_info_flag'
   ld: kernel/tkernel/hook_frame.o: in function `recvfrom_hook_check':
>> hook_frame.c:(.text+0x178): undefined reference to `recvfrom_info_flag'
   ld: kernel/tkernel/hook_frame.o: in function `fork_hook_check':
>> hook_frame.c:(.text+0x1c8): undefined reference to `fork_info_flag'
   ld: kernel/tkernel/hook_frame.o: in function `exit_hook_check':
>> hook_frame.c:(.text+0x208): undefined reference to `exit_info_flag'
   ld: mm/page_alloc.o: in function `proc_pagecacache_system_usage':
   page_alloc.c:(.text+0x6e47): undefined reference to `vm_pagecacache_system_usage'
   ld: drivers/acpi/acpi_processor.o: in function `acpi_processor_evaluate_cst':
   acpi_processor.c:(.text+0x348): undefined reference to `acpi_processor_ffh_cstate_probe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
