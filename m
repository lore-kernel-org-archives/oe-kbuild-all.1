Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE27DBA34
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 01:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730683988; cv=none; b=hMII2H/4E+XRJgFG+Nd/V8Q5EdEreRUoQ1AJIFTkwJGtvs8G3s7oqHtOIvOBDMH2woFKaWJUKsXq9M8oWAm7LP7lgwfUcLqzKNrt9tOehBSFmW6eUgsPaiNwUmxM4d/VrY3/Tm1rFEKCesJ8+AdqTPHq7q0KoLq8F4tYDIe0FtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730683988; c=relaxed/simple;
	bh=JBAGixxzwQtytE5o5q2F0cVtHOi7j53QA485QZoFC1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L0b7z5/0/sMzttlRfK+cTZmUdDzg8FJ3s2dBuWuF2cH307jY4oFHLUh+gkrpw7/MhWnwjN2G2R4PLjq3B5v7JSCbBLA1czwKH0xkPUXqAs3TkfKDlT/umI0Ezp9hczRTL8VAhO+ERJ52v/LZ1GJEr66r53u3bGbMChF0jkJbj10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtNe5kqf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtNe5kqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730683987; x=1762219987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JBAGixxzwQtytE5o5q2F0cVtHOi7j53QA485QZoFC1A=;
  b=RtNe5kqfl4iG9zQm7wBar78OY9aJFhdzKw6AUxSno7zRLMj9eIAvsNyC
   mYQZckoOHZKgZQKYKUOBiTwmDKVM69iM54SyUg8gdc/1LmZ6zwOegv9Sl
   Oks1TcoIL3aRwciVHraq0hJgZ43ZrKIMegOqtW6wDmGtcNLKrg4jAhuaH
   lHDdkBroNWM8sZrHPHdITxLVBH2xvYEPMItUEFWl3tcmDX08KPJdvuASH
   cry3Abxpn/2cbIrlQIsMNNWAWEwubjuyR1oBh5CfTcYV+AijW2tY9xkGD
   OEhMmpy81fCknq2HH1rEWL0PjC/NcB5FMxv59HNzC6gD6LrYdyNgCgqHb
   w==;
X-CSE-ConnectionGUID: oRa0TksORGuxgd4dQJi7Qg==
X-CSE-MsgGUID: QbyBQEZJROqgYctYymjOkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="33205669"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="33205669"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 17:33:06 -0800
X-CSE-ConnectionGUID: EuGRuYvzQ2SC0WV9qzHwEQ==
X-CSE-MsgGUID: eHRrIZKrQvSNd0/rGAX/HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="120973430"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2024 17:33:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7lxm-000kM9-2j;
	Mon, 04 Nov 2024 01:33:02 +0000
Date: Mon, 4 Nov 2024 09:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1225/1225] drivers/fpga/dfl.o: warning:
 objtool: build_info_commit_dev()+0x75: unreachable instruction
Message-ID: <202411040906.Y94avIn6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Scott,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e833cceaa63f729c44be494d90d6ee3bfaf22faf
commit: 99e28159a079ea6af5a5b789e83b68240d67f9ff [1225/1225] fpga: dfl: Add lockdep classes for pdata->lock
config: x86_64-buildonly-randconfig-002-20241028 (https://download.01.org/0day-ci/archive/20241104/202411040906.Y94avIn6-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040906.Y94avIn6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040906.Y94avIn6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/fpga/dfl.c:57: warning: cannot understand function prototype: 'struct dfl_dev_info '
   drivers/fpga/dfl.c:77: warning: cannot understand function prototype: 'struct dfl_chardev_info '
>> drivers/fpga/dfl.o: warning: objtool: build_info_commit_dev()+0x75: unreachable instruction
   drivers/fpga/dfl.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
