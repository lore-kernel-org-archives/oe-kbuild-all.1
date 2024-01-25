Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D20482DC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706186441; cv=none; b=gcYmVhCTWqdygIGmR/mpvrzanY926QVSaYU0tdqQWWiHOgh6cjhLDU8a02zWc9UgdiCRLtpjg8hwcgEKqHaAv6BPkzLZLIBjJiB+cJ8Da5xzuhtHq8vaSK/wFi1tRCWIbwlLnkzRFXJ2wjfK8D+SciEigQnsbx57yuSQ3i6QQbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706186441; c=relaxed/simple;
	bh=UspqgvkjphABBTh9CfxECwXPCIObhwpNJ/S8FMzFYwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7Gb6ml2GO5kC+BsSEEJcjIP+OEBsP9E2GXxj1cLOzDvRxAj7djhY00RmZwa06jW82JKCHg9uDV2d7dNqTbe9KEUMqiRoEaDiOOsbl7r+ca9PiSiygX9S+y9pYT1C26hE/RuxxNCt2Z9iu9m9oZ7/BW9D6KljKD8gbFzPWPUigc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9o0wTe0; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9o0wTe0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706186439; x=1737722439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UspqgvkjphABBTh9CfxECwXPCIObhwpNJ/S8FMzFYwE=;
  b=U9o0wTe0tfgKfKKJVF2ZkjSlV2WshtmLaLLl8HjaLqtQHGPNIdKxdzbm
   dUEX6sqdK7zSS8jGjsuY4R0Lpqa3zCvu7k3wCkLLQe8kuly0Gh1GOzKTp
   N82VeXJrmXGmcSe00HSNEdkiauOiXvetnBLFaD7wcRx7dlm4aNmW76gDZ
   RvsZHVTK1SUx3hMI5iRKj0EY9qklniNm+BeF8m891NINXhcZvxcZY78GJ
   8qEVn9X0eeMSOJyKSoZlLgBzjhCwTOSJX2/+tBy4y0DxuRkQL2yUEYAOG
   MVPhMG5zG+DY+m0WHHql5/gNpQeAzxgG7zS8ReXoqnbx0vmnihDQk7kRp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="399311767"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="399311767"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 04:40:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2402507"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jan 2024 04:40:36 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSz20-0008yf-24;
	Thu, 25 Jan 2024 12:40:32 +0000
Date: Thu, 25 Jan 2024 20:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 691/2767] binfmt_elf32.c:undefined reference to
 `arch_elf_adjust_prot'
Message-ID: <202401252015.eYqQYSXZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6188d51075eac8cf7cf6909fec1e73fbc51aa29b
commit: 7de3ab4c3dd938fae3626a6344830b018eb7ba4f [691/2767] arm64: introduce binfmt_elf32.c
config: arm64-randconfig-004-20240125 (https://download.01.org/0day-ci/archive/20240125/202401252015.eYqQYSXZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401252015.eYqQYSXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401252015.eYqQYSXZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kernel/binfmt_elf32.o: in function `load_elf_interp':
>> binfmt_elf32.c:(.text+0xa70): undefined reference to `arch_elf_adjust_prot'
   aarch64-linux-ld: arch/arm64/kernel/binfmt_elf32.o: in function `load_elf_binary':
   binfmt_elf32.c:(.text+0x1d88): undefined reference to `arch_elf_adjust_prot'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
