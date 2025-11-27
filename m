Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7392729CB4C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 23:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764284507; cv=none; b=KI1KFN60ok5HQln72UFMjMAl7MKI2W7iZCbGKOaYEgJv1KSOC95omojs4jMwByyljrafA/jdlXKA//AF/mv16Q6Ehr4nUwi+mNKb4vSqc1Efb+z4QqkCdeHvAFnkvlFCDq2AODfh9gNWrYCGYFWctb3iPqYSiYyV4HZDGz7K4kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764284507; c=relaxed/simple;
	bh=+0Djts6Zab5nguHrL1YmwSIN9uJvL6HG2O6vUCiAadU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=emrAAjtydP+YajqFX1Wc6gi7HQn5cRchKGTcvRLUqpQQE0MkmCPKIdCtzoHfw83Ca78zmuloGdW22ufpIjeFFXAZ9JksajfmcsxuH8reV9y8Ujr4OTypNiGFNCyqupjwI3I7CFK9QYrfrqInISKmCjvHPzbGFit53fS8ljQZ4P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xqj54zRp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xqj54zRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764284506; x=1795820506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+0Djts6Zab5nguHrL1YmwSIN9uJvL6HG2O6vUCiAadU=;
  b=Xqj54zRpH9xBzJY6C+8sZ8nS3M6HFB7+2R2E90gXFhrKMtbwxhsQjx2P
   40q9+By98FL2gKd2+oodvnnmVpkJQZPiIFD3J4QSZec/jZGj0v18A8l32
   WIDBCkipJUygCFm/DT1GyApdXWGEJpFlydB7CnVqsQ1PonLs+BGojruKA
   3VGfO5MSvN31sYTqhnJf5lim2KuEH6+4UooXR3wFiDhEWSFGgpyu1P0Sa
   JpW23Jgh4mA27dJWv7QtMjaEPUYAFHxl3Y2MBfUtTTkzEzC6G5YdUzYDJ
   MK68ziAmGTng28bCe35VB7mOUNN1Ys69ev1Iy5mLdduvZ8g4CFRNIMxdQ
   w==;
X-CSE-ConnectionGUID: 4siVQ+GxRGi2xr0aBgD7sw==
X-CSE-MsgGUID: m7PwX8XdRnedW5Z0aH+70w==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="83936232"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="83936232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 15:01:45 -0800
X-CSE-ConnectionGUID: 6Deg3rq7St+8u/UglKhfuw==
X-CSE-MsgGUID: 9i6b1qJwQqeVApd2rG72xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="230605597"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2025 15:01:43 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOkzd-000000005oo-0JKm;
	Thu, 27 Nov 2025 23:01:41 +0000
Date: Fri, 28 Nov 2025 07:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1938/1938]
 block/blk-io-hierarchy/stats.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202511280607.8AfuGdNA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d495515f012a96ae472e8ee75c66680fbdabaddb
commit: 17e60c04404d52f58c2233ea5b72014f0d834e75 [1938/1938] block-io-hierarchy: core hierarchy stats implementation
config: x86_64-buildonly-randconfig-005-20251127 (https://download.01.org/0day-ci/archive/20251128/202511280607.8AfuGdNA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280607.8AfuGdNA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280607.8AfuGdNA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-io-hierarchy/stats.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
