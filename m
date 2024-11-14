Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDAB1B2196
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 23:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731625988; cv=none; b=nEWz5jpkx+vRi0Avq1zNszKPZQGpGs1jzRg4xd6rqcETRe6HKBz7/I9xLeq8sDEwztr7ohs0hYvqzhHvLnzjcpN7DdqeZAACIrMkDCfx/2nh/wKwN8jP8TtR1FOjl1gQWwpjxm7Ut6YmO/k/lMQ+L+oSHNJoaBPC5fiPgo4ePWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731625988; c=relaxed/simple;
	bh=RQ5r0nxXpstzTmJIj/S5wC20wzHqLNLiiG/8t89Ut3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MhD6BMGOdfs+OcT/R0/EqKhahXFwv+jtXdteGIPuDscSm2KZ559LmiWGg0pfkB1ZrqQyxuxlVCoudfitNu3VkjLQuM6b1jN6rJ4GLHRPMQ5JVxBE4qUgxorZCET6MgocVAr7v0c/uLtX/d5edrTMVaf/f+SA45jlmYHf5jtlKZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7fxMJ/1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7fxMJ/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731625987; x=1763161987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQ5r0nxXpstzTmJIj/S5wC20wzHqLNLiiG/8t89Ut3A=;
  b=Z7fxMJ/1tdoD3F6uyJjKF2BxZGWGTAuymhXOUU7RaunB3y5Cm7unA/Uz
   EROMP8b2YO0/qqrwwZANaMsHSXlrxbzRdLYiIMbLxG9p3s4qJQn//GRPH
   TocqBb9DhvwYZvzP9NCAKsXn7Mu2skUNn/KqugdYZOx7JKwPsgUgmz15q
   +Pv4pUenrs1cw3tlxZIQLxzS/bdqBYr9FVaQCMSTzxWr0hzN+r/Qz29Kp
   3CLvKjZJ2yJjgYjWjc2uuEfrePkX2Ka/yAVEUWgVwqmrI8pErgSgdvSPw
   7AJk31J88tKh6CTJrf2PWAdIrRvGBpoO7yx1D26YAzuNRKEuP6A/rs3NG
   Q==;
X-CSE-ConnectionGUID: D/s8t1XCSL+aDNhUNOoVDA==
X-CSE-MsgGUID: yMM9177VSoWUyFQhvQCQCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31018002"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="31018002"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 15:13:06 -0800
X-CSE-ConnectionGUID: 5OGBpwurRdul2/X9AVx5rQ==
X-CSE-MsgGUID: 4tPIzOmPSHmHIrBLMzTwSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="119170189"
Received: from lkp-server02.sh.intel.com (HELO f5eddd9a323a) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Nov 2024 15:13:04 -0800
Received: from kbuild by f5eddd9a323a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBj1K-000067-13;
	Thu, 14 Nov 2024 23:13:02 +0000
Date: Fri, 15 Nov 2024 07:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "Jia, Yingbao" <yingbao.jia@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2435/2435] arch/x86/kernel/fpu/core.o: warning:
 objtool: can't decode instruction at .text:0x384b
Message-ID: <202411150711.HPFP7aM1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   3faacfa7d0e66f4dbc5da1dd4588c8f556e4414b
commit: e91bb0282220911c5f019e87a3516f292c5ea804 [2435/2435] x86/fpu: Add a helper to prepare AMX state for low-power CPU idle
config: x86_64-randconfig-001-20241115 (https://download.01.org/0day-ci/archive/20241115/202411150711.HPFP7aM1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411150711.HPFP7aM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411150711.HPFP7aM1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/fpu/core.o: warning: objtool: can't decode instruction at .text:0x384b

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
