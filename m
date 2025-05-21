Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1152B2B9A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 21:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747864431; cv=none; b=qa18nksTAKP6UmalyE5bDH4bb8r2tkzgubX4xNTgtHYoaddeOkkS5eoaLT5LLMU2PSKV7pNVkFKEX/kFc+IsV17AmCrpQOzq/UmxXhctJi9UtiaavAQLgBnnzgEP/gTjHb+wpFBERp8c9r4WaB3kZwVFB9Et/X9TJK2bjH8XNKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747864431; c=relaxed/simple;
	bh=3NzUByr1Q8xOrQLbQGk3EeMC/Qpu/vP1Ud86OxU8VRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TjHOIkXeE6epEI0Q70f+JN8PTL4wem6BPpBKMV/dv8p2PE7hNbg+SmAIHqVsSpJ0nI29UqR0hIPn+Hk0La1JKDKGkw5GPeUxavQi0J2AiFBiUZlGUdr9A95clb7A3IxEVtR/+2kj04WRAd7zblxNLnfE42utOLDu27WCpXeRIyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERcMEhMQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERcMEhMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747864430; x=1779400430;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3NzUByr1Q8xOrQLbQGk3EeMC/Qpu/vP1Ud86OxU8VRU=;
  b=ERcMEhMQPkoHUKXFugws88L6KWEqsZ0/j3n7TrbvxMN7C5hKgDuo0p31
   NBJoS/kMsUiIrmK6j88uNgh8sB//RceylozzZsInhyTaYCYykfv0Y2ybY
   1ZMs1K6mBPkovnb+uP/nje3JZ+BN4CB3sw52PjLw7aLBw/isb7xoXX3MZ
   rWXnIMtiImYXjY1r4yxgQTLQh3t85AVrZ2f2yYi3YAk3fJgz7Fsxdh1xS
   p0M9jNHdV8HZYyfcImpaEJCaxRo56T11e4LTKhEhGUhDAmrNyU4boP4Cz
   tp1ua7LoYyEHVL+c615ZesksPvq/74qETGt6bvYtrbdDgZo1ZgoG/m+Ab
   w==;
X-CSE-ConnectionGUID: mby7VBlMS1Gdz3Xb4LY10Q==
X-CSE-MsgGUID: LMH2Iue4TT+17rLnQlLJSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60502567"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="60502567"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 14:53:49 -0700
X-CSE-ConnectionGUID: jfwRj9ZhRfiKB8CYp/bCkA==
X-CSE-MsgGUID: t2z9TBZVR/KR7EHVTk1XjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140169608"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 May 2025 14:53:48 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHrNh-0001BX-30;
	Wed, 21 May 2025 21:53:45 +0000
Date: Thu, 22 May 2025 05:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_raid6_rvv_v5 65/68] include/linux/riscv_sse.h:11:10:
 fatal error: asm/sbi.h: No such file or directory
Message-ID: <202505220500.neuhfBvt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/avpatel/linux.git riscv_raid6_rvv_v5
head:   9b85cdf2ad159e2a8ee78d62c6b423942917119e
commit: d133a9e6c5f12d062db24a320a92a3d6aaacbc00 [65/68] riscv: Introduce HEST SSE notification handlers
config: i386-buildonly-randconfig-2002-20250521 (https://download.01.org/0day-ci/archive/20250522/202505220500.neuhfBvt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220500.neuhfBvt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220500.neuhfBvt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/apei/ghes.c:20:
>> include/linux/riscv_sse.h:11:10: fatal error: asm/sbi.h: No such file or directory
      11 | #include <asm/sbi.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +11 include/linux/riscv_sse.h

aa1594867bd2a5 Clément Léger 2024-12-06   8  
aa1594867bd2a5 Clément Léger 2024-12-06   9  #include <linux/types.h>
aa1594867bd2a5 Clément Léger 2024-12-06  10  #include <linux/linkage.h>
1cbb58375d3584 Andrew Jones  2025-03-19 @11  #include <asm/sbi.h>
aa1594867bd2a5 Clément Léger 2024-12-06  12  

:::::: The code at line 11 was first introduced by commit
:::::: 1cbb58375d3584633396096f9eded7943919f8cf riscv: Fix arch_sse_init_event

:::::: TO: Andrew Jones <ajones@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
