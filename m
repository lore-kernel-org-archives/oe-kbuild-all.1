Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F9747779
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706882083; cv=none; b=Y1X8HOXc6iNHriEXhJX9eHgCXJN9nC/QQgxWRMlMQ0LYybMDjmqOMIXS2D/51OoZwMX85HEIJgcTKmszPqWhvd92ZteKMqyjfK0MChVysxr39XeRfuJ4h6Pq17tFAVg1BYqvkM95eLfd4i/pqIn5pb8R1uVLTRvqX1nMMLP8MTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706882083; c=relaxed/simple;
	bh=F1JJ7r3imBogD1QiMjr4N1hMv1K9beIKmYkQLtj6t4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a/2dHVs0G0/DleHY2vhoGxPxi7x8zlbwctA7AVHMTFij1t53kxe4rgIvJdoPFRPVOGZM1DdXl/7MTu/XiADQYOOGphELX3daGhzH9Prw9/g3XWohBpcqMjRRe7rWuhC3WlGfz/ci35qtrSXtFAD/ABBGaRM0VdN2aj86cY0hfwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5Mf022+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5Mf022+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706882081; x=1738418081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F1JJ7r3imBogD1QiMjr4N1hMv1K9beIKmYkQLtj6t4Y=;
  b=h5Mf022+STY8ddFYuMn1YOtpfeG1QK8PGzKxUT3O2qRNk6sSpeswamTb
   s9+bGatKPaOyhsR70J9uDVEzJTp3KlRLgm/3uNRip1+P0nKR8GwAyP1VW
   5XT0rS7s3CQv9f7lZhM0bwnMtH0hwfWaYPXzl7qKkLQv883EHH9ss/YwG
   Zo/If8YvMijtaPmvzTXM29wt+G1gZo/0+b2Krl/RF0M+4ZenPAk4JVD6w
   4LOlO6bVW5MfcDbVj8UA/1o9wbCz17H+SRZXnUD6LBvPUSSeqB7DQp334
   g9qNRZxV/h+AusQ8N94TA3XQ4udnh3aLSFcS8DZhRWMFm9ptbzRohlbMH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="341168"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="341168"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 05:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4678462"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Feb 2024 05:54:36 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVu04-0003u2-07;
	Fri, 02 Feb 2024 13:54:36 +0000
Date: Fri, 2 Feb 2024 21:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuntao Liu <liuyuntao12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2421/2924] vmlinux.o: warning: objtool:
 .text+0x0: unreachable instruction
Message-ID: <202402022109.ZQQhTRgz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   29efdd23201fcc75d8db64c09ae38acc1f41c201
commit: f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b [2421/2924] make OPTIMIZE_INLINING config editable
config: x86_64-buildonly-randconfig-001-20240202 (https://download.01.org/0day-ci/archive/20240202/202402022109.ZQQhTRgz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240202/202402022109.ZQQhTRgz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402022109.ZQQhTRgz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .text+0x0: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x4: unreachable instruction
   vmlinux.o: warning: objtool: .text+0xb: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x12: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x17: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x1e: unreachable instruction


objdump-func vmlinux.o .text:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
