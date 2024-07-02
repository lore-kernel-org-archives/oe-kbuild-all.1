Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560EB1B583E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719929833; cv=none; b=sgv1eItCyGssYeehiRRR7VZAEIdM4thwmQb/fbB0w5vXUo8j+Q/CA4zngNTw5KNM4XenJhqa/+H114Dqk8qYu0B9yPbVGsLlbRtplt9cs0hibd9acwqvJj9jpFuF7xYZ+UJvAIsiMVx0harRRsjes87g9kt7tO1ch6DkHyy6jUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719929833; c=relaxed/simple;
	bh=VTKkZn2MnZ37SX5NyYAXKxqA2kRCWpEP+BODcIS8OvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Az78vtw2LCXwk2dEraq5akaCvnS2a3R7zsbspfcWJtaPSQ74LH6IbEBUhDcCf3J2onuXLBc7/zPqSTrVmbkl473QLmwwDzyThVMXwsgWSgHMpp+0nPxILuS7dR0GqP3Nj2cveQXvsxd0K1NlB2ZUTrMFWamOxX/duwbyTIBvbjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJP6kzX8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJP6kzX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719929831; x=1751465831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VTKkZn2MnZ37SX5NyYAXKxqA2kRCWpEP+BODcIS8OvU=;
  b=JJP6kzX87nGrhf5kmQ05QhtfGk7TLUqWWfiLtCEIs654y68iNW9hSnc7
   mHigQQOq0QYzs/OKp0tFdFictwe3JSTbMDQXonrg6JsZpvJlVkM5fljCD
   rvdh42h/jH0DbeUjt3poGrTCHwJbY0cKhr2yixmTO7bHQL3ByqiyK+DZC
   mH2B2hHiZWnnJKR/euTO+pmrl3OnmttLUjm+et0DXHw3eL4UyLSEEzXak
   //qBJiIXaIjAig5ap0GpOlwtVxUuF2nzqcyFZ7Z6RYsv/qAx0wXYvARTJ
   fWSQMpFadgBWNiL7g+nDoC4GeFEOo5Av8wvXWIbODgmAfck9JUyWgZEEo
   A==;
X-CSE-ConnectionGUID: CSJe4/fTRhKzi1vJuOa8NQ==
X-CSE-MsgGUID: wDPdAR36QRWRS2sbS07jOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17319639"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="17319639"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 07:17:10 -0700
X-CSE-ConnectionGUID: 1d3hA5Q/QNiuQYzxZgPeGg==
X-CSE-MsgGUID: iE4y2iOTQReX+qdKqSoG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="45699340"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2024 07:17:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOeJf-000OH5-2U;
	Tue, 02 Jul 2024 14:17:07 +0000
Date: Tue, 2 Jul 2024 22:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10035/10049] riscv32-linux-ld: section .data LMA
 [0007d000,004ed977] overlaps section .exit.text LMA [0007ccec,00085cff]
Message-ID: <202407022220.FK3vNexE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82e4255305c554b0bb18b7ccf2db86041b4c8b6e
commit: 146199ecf450a5d50517986a74901b0f8de61866 [10035/10049] Merge branch 'zstd-next' of https://github.com/terrelln/linux.git
config: riscv-randconfig-r002-20230330 (https://download.01.org/0day-ci/archive/20240702/202407022220.FK3vNexE-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240702/202407022220.FK3vNexE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407022220.FK3vNexE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> riscv32-linux-ld: section .data LMA [0007d000,004ed977] overlaps section .exit.text LMA [0007ccec,00085cff]
>> riscv32-linux-ld: section .text LMA [00085d00,01a7253b] overlaps section .data LMA [0007d000,004ed977]
   riscv32-linux-ld: section __bug_table LMA [004ed978,0050e617] overlaps section .text LMA [00085d00,01a7253b]
   riscv32-linux-ld: section .pci_fixup VMA [c201b0c0,c201dcef] overlaps section .data VMA [c2000000,c2470977]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
