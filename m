Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B397C3FD4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 01:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725760647; cv=none; b=nrSLV1R2CXEot4qlqtUnk3+3ZumC7A0z3oJ0h+3aNCFj/eVDDApDenfFM6n6U+5I1RFOi0VZiEV30ogAQDBt/ZS1oRpp8nk+b3H4yMGed8pJ8KKsoxeJbcB5odDy4qunfAXFPmPBRlvJjJsbZkolLerOOSMfZcZ/g+4SGPllWO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725760647; c=relaxed/simple;
	bh=zG0PJE3tQ+I9SWalwAehsbntrXCT0vNcgZKbMFF90wM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=digMVY4ywhSCdV7yD+2U8r7jLcm8BG8Umqo89yOgMgNKs4+4FOFKcc5LsOUGuR0MBgAGxQnSIv5gPztyL6f7QCRq6o/D4ZfjwngY/C3BDgAOzs3SXyWqDjDIxrVn9GMHUQNeiBmfwAkKGbPJbtiEEJTVVwXJnfHlA/dIwfEoPyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f186zeol; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f186zeol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725760646; x=1757296646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zG0PJE3tQ+I9SWalwAehsbntrXCT0vNcgZKbMFF90wM=;
  b=f186zeolw0MJzzwbS71pQQuUO8VHlkPZXf5KVevJl+8F41MpTTO3chVU
   XakeqVb7vAL/BUM0wONjXJr1S+9d2RdNvC3mWYLAB93k6wxqsH0toAPMd
   WEYACidhOasJqysDFIxP19e3BfhOKmsHh5cCCpkyfP+4Xhw8r9hEUizcz
   cZaJtNsqCCQ251dPKInw170yxPTs+Q/hhb+EfT5lfoSLNxq9ebV8gHbn3
   t39hoIAnxYjfvsNFUgmEFc2brTx30RJ3OVUv2kl06VJwJeud/5qp2a9pq
   d+7wib1fCg0Rrqw7qqP1xXvoggyU3PdwdHAcDy2cLyTPqgH5+tTKZHtUg
   g==;
X-CSE-ConnectionGUID: 1qNhmPp1Q92s6GBap2KZVg==
X-CSE-MsgGUID: L4UElGaHRxGPbKcTmX76OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35626538"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="35626538"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 18:57:25 -0700
X-CSE-ConnectionGUID: yniAT7+ER7qXAeoo0d2iVw==
X-CSE-MsgGUID: KJxBycBnT82p6ZK/2XSvIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="71105919"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Sep 2024 18:57:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn7B3-000DCg-2M;
	Sun, 08 Sep 2024 01:57:21 +0000
Date: Sun, 8 Sep 2024 09:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Martin <Dave.Martin@arm.com>
Subject: [morse:mpam/snapshot/v6.11-rc1 37/129]
 arch/x86/kernel/cpu/resctrl/internal.h: linux/resctrl.h is included more
 than once.
Message-ID: <202409080909.IRZWSCu6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.11-rc1
head:   a3cc1ee01f0d935f82db885e4ec4772dc6032efa
commit: aaec0afc98a28492ffc50486c124f2f1363a71cc [37/129] fs/resctrl: Add boiler plate for external resctrl code
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080909.IRZWSCu6-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/resctrl/internal.h: linux/resctrl.h is included more than once.

vim +5 arch/x86/kernel/cpu/resctrl/internal.h

     4	
   > 5	#include <linux/resctrl.h>
     6	#include <linux/sched.h>
     7	#include <linux/kernfs.h>
     8	#include <linux/fs_context.h>
     9	#include <linux/jump_label.h>
  > 10	#include <linux/resctrl.h>
    11	#include <linux/tick.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
