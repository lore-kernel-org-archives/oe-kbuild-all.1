Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C031E3CBE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 12:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723035356; cv=none; b=iO5gI36+E272sFLR2Jf1aRaYBCtcDkmCQJblKTHgXduYLVcdQt0+L0EdE1+eCPycTPW/xyfq+iQBP10w004hid+n6QboqDXUXgijQrlLv1T3MtvibTuUE47CLbFZhUWh1Xbx3OnoyFdITQyUFW4/92H7A7DKPJjpyt5jEP+21IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723035356; c=relaxed/simple;
	bh=6r8soXi5s7Esb+0q+9qcgQca7a72rfZuDT/lTQSc4f8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=af/TiASjmInoBkT+VAmw1W/ClgbiN9fsY93o1UWEAepZYDEqIGNQzGUN/Zyp1M05NNnVS+Ykuv6vNwYH+vgZ30p0EYT34jjOSnCTRvkgu29lOssGqoiAaHyZZRu5FbKORPFG3vd7XoKCpq+sI9aKYOX81jdNS3A96cZPwfPnUio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYCtAV/B; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYCtAV/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723035355; x=1754571355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6r8soXi5s7Esb+0q+9qcgQca7a72rfZuDT/lTQSc4f8=;
  b=LYCtAV/BXUtk8gE0T1BGgyB1EZmA0PJRrYCPluF8nvp+yN3Z399gxoK5
   foZgaNYLBdgQkBS4kBJuKii/LMMxFPfbgPwG+yTWCbmHRWxmnyXcufQBr
   8Skt4zizOxpTbP4ct4coEsaKlNm94s01ELbvlDn2JuYWEarj0JeicX7UC
   HCA3RNzdFf/+r1uLqf6l46GyxoJ9Q4u2ZvkfF5mYNqCxCdkx23LMc5rBr
   bzMqWYA5n63mpOcG6idfKp6hCeHQpMYbbhPmzsN9uOO1nH7OioxCRScCl
   rcuypLEUMSWaGAWi5/hdBDAQPzjevfvlSVQjJFxuWVeMmLLMaNsfNkazi
   Q==;
X-CSE-ConnectionGUID: XuQqAs+WSiuGOTdkihDNbQ==
X-CSE-MsgGUID: QGT9R1TkRh6ZvGlTl19mAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21222054"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="21222054"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 05:55:54 -0700
X-CSE-ConnectionGUID: RFNo8hxCSDCNHjNJMRRdPg==
X-CSE-MsgGUID: Y68lOg7mRAm8NnIYaZiqZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="57537897"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 07 Aug 2024 05:55:53 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbgCk-0005Nw-1q;
	Wed, 07 Aug 2024 12:55:50 +0000
Date: Wed, 7 Aug 2024 20:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 12646/12694] ld.lld: error: undefined
 symbol: topology_apply_cmdline_limits_early
Message-ID: <202408072010.WeCy5D1X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   3572a71554cfe7fb3b2c281151802081033d71df
commit: 2dadf9dacb879b15222e21211cadb9dfadb16d9e [12646/12694] UPSTREAM: x86/cpu/topology: Rework possible CPU management
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240807/202408072010.WeCy5D1X-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408072010.WeCy5D1X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408072010.WeCy5D1X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: topology_apply_cmdline_limits_early
   >>> referenced by setup.c
   >>>               arch/x86/kernel/setup.o:(setup_arch) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: topology_init_possible_cpus
   >>> referenced by setup.c
   >>>               arch/x86/kernel/setup.o:(setup_arch) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
