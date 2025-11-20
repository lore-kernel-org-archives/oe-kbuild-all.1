Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2E31E7C34
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 20:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763669039; cv=none; b=IbqF1CAuX440uHUtsByOzwJXFXv4Ib0Y9+5Dj4twvJIqUcFduUcRE466CzcgdZkuYalaGBfzUrS6u342teFSa5NtDCzzwg8P3HzA2qS7Y0nW/5lo0r7kvjpDnBzzCnBNKBPFhcaPo0Yh8Kl5lBZBGwt7/yhqE5YTBkIEMLAT/0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763669039; c=relaxed/simple;
	bh=anmOgdP+qUWRG0ZLlX3B9qZBd68Ldt6CETuJGucqfQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LyXU/FEUl+Q8JA4CNqUlW5fadYzpdAtWBfnyja9vH9PAkKmKpjJSdqZ36zqnHRbSDaiIMIvde4KUKebBEsJTbdSH8tRgsEd1TqQ1uiJzMbDQjfZcs/ZX9MUMsf72O3s3y7LSvL/R0OJauXcwwBFmz5ASxXAchjdGrjLL4xTWbr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaaEoJp2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaaEoJp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763669038; x=1795205038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=anmOgdP+qUWRG0ZLlX3B9qZBd68Ldt6CETuJGucqfQU=;
  b=ZaaEoJp2S3RE4IyB0ipza9wOndLTnGv3RVdqJLF7uRZqziRAdCQGRbh0
   E2SjvZImqlJlL2Ymn5Bl5VgT1NZizVkasJWPDhHA8Wbdoy4REp6A7YYS2
   Nx84o5BumZ32HfyddrRkV3OE4qWjGcZE9SKJbwkCbLhTlesUsm4EW662K
   AAfdLPU3TEsYAxz2mhVpRTgxjk+NOGHuDpaKY+2Rh0OuOcC7Tnh48Wb1n
   4I4fv0ry+nwAGgXze23MCEbdaGJ/Ukw/8mgqA8FKMhCMC6TER2mwfO2b8
   71J5CjjAQVxpGRajHWK/VttOALzjJE5NTRpzVQjIaYO2F8ywRbNcdljtW
   g==;
X-CSE-ConnectionGUID: rOzH9so8Rcy6Rhhkk8pcAQ==
X-CSE-MsgGUID: EBQ933FgTU6V9fAR++jPhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69612633"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="69612633"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 12:03:57 -0800
X-CSE-ConnectionGUID: oM7gNF/OQSKVS1vfnbfE4Q==
X-CSE-MsgGUID: LnBSbC5eTEyVzHmcn+KuXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="196610887"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 20 Nov 2025 12:03:57 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMAsk-000000001X5-0OeY;
	Thu, 20 Nov 2025 20:03:54 +0000
Date: Thu, 20 Nov 2025 21:03:20 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 0/1] htmldocs: Warning:
 lib/Kconfig.debug references a file that doesn't exist:
 Documentation/dev-tools/kunit/
Message-ID: <202511202110.JjslQUUr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Iurii,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   0a4bf073fa3fffa4289af31c9bed4311b7e20589
commit: 03c4d42e3c14cca45ce64c85cd1eee0227048b85 [0/1] kernel/sysctl-test: Add null pointer test for sysctl.c:proc_dointvec()
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511202110.JjslQUUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511202110.JjslQUUr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/misc-devices/xilinx_sdfec.rst
   Warning: drivers/media/v4l2-core/v4l2-fwnode.c references a file that doesn't exist: Documentation/acpi/dsd
   Warning: drivers/net/ethernet/faraday/ftgmac100.c references a file that doesn't exist: Documentation/networking/phy.txt
   Warning: drivers/net/ethernet/pensando/ionic/ionic_if.h references a file that doesn't exist: Documentation/networking/checksum-
   Warning: fs/cifs/cifsfs.c references a file that doesn't exist: Documentation/workqueue.txt
>> Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/kunit/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
