Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2032FCE2A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 22:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750890761; cv=none; b=U+Bw6h5mfCQyU75AXMpv+oEkl9h1ek2E7KFXBZaywOV45kdfsOSLNqWUPgDwlI5L2W7STKUXk1rjp297g5sb9LX+xBrLPZWM14v6mzhckzkNytMVUTDHb64tjRyuu3jDbTiHCzoih5Gv+9P7kUyN0U3DqyqTi6Bqc+jPG3HUUJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750890761; c=relaxed/simple;
	bh=NfVz8kgj02VIea7i6HbHULFAjBJeQHijmzt1hfOqdM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gwwoIe/NMDMDdcpyhPKAP0lowi8Hlb3HxZ42O3ibtdrBZJY/Iyp2TFb2AmBZouz7mYdTyAoJ/dfXdalE2v4zL/d+5qGkVMcJ3FKOSGj5nkJlL0SPuj+gshzsPBUtESuBr+9N0jNvnmnrNeZmqcsw1yC4no4vOKmLhBZYD2LXECc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJVAghuM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJVAghuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750890759; x=1782426759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NfVz8kgj02VIea7i6HbHULFAjBJeQHijmzt1hfOqdM8=;
  b=PJVAghuMtpsUDKfHlGMUAUz2S+xlYIsKmifcRUA51drPxSUgkfpsgNlb
   Osj30kIcEY0V7z0+Ks5VBi8V0aI5PGcnR3FelPmrV55au6/ZnYDFivvxa
   /ur4HfCx5q3Mm4fjxIQh630L1EhbqlZqKmICtDXpkyRDuPtiKp6YIxc0s
   8P9/y1il9MPyWCcVflbiN9HFRtkfIG+vleGWbCmITgZs2ZeWD5iOc8tYw
   iBTMBmWhgVX993k1Q11YGnt4xq17ypYW5fBZi7mm0ku8OZBG/rim17WEt
   W69dZidZ/eqqKYT3+b+RSo//azZ9scmhcp+8X088/iipbdlROm8gUBh1a
   g==;
X-CSE-ConnectionGUID: YfZp3uwUTs+PlanNM+galQ==
X-CSE-MsgGUID: 22Ev7+diQdGQuGuXJx58pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64531315"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="64531315"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 15:32:38 -0700
X-CSE-ConnectionGUID: c4VRpMBnTwSrVQCqHVESew==
X-CSE-MsgGUID: Ue/dLz80TL2sAhYiq3sTDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="151763709"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Jun 2025 15:32:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUYfS-000TUs-2J;
	Wed, 25 Jun 2025 22:32:34 +0000
Date: Thu, 26 Jun 2025 06:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1327/1327] mm/vmscan.c:3257:21: error:
 implicit declaration of function 'kernel_swap_enabled'
Message-ID: <202506260620.eD5Db5H9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liubo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   2095c984bc19c926a057ed0e96b9f795b4c504b4
commit: 44983705e56ab22fda801d66e2a6bd0d1be7ca0b [1327/1327] etmem: add original kernel swap enabled options
config: x86_64-buildonly-randconfig-005-20241216 (https://download.01.org/0day-ci/archive/20250626/202506260620.eD5Db5H9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260620.eD5Db5H9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260620.eD5Db5H9-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c:2734:17: warning: variable 'node_lru_pages' set but not used [-Wunused-but-set-variable]
    2734 |                 unsigned long node_lru_pages = 0;
         |                               ^
>> mm/vmscan.c:3257:21: error: implicit declaration of function 'kernel_swap_enabled' [-Werror,-Wimplicit-function-declaration]
    3257 |         if (sc != NULL && !kernel_swap_enabled())
         |                            ^
   mm/vmscan.c:3257:21: note: did you mean 'kernfs_ns_enabled'?
   include/linux/kernfs.h:309:20: note: 'kernfs_ns_enabled' declared here
     309 | static inline bool kernfs_ns_enabled(struct kernfs_node *kn)
         |                    ^
   1 warning and 1 error generated.


vim +/kernel_swap_enabled +3257 mm/vmscan.c

  3250	
  3251	/*
  3252	 * Check if original kernel swap is enabled
  3253	 * turn off kernel swap,but leave page cache reclaim on
  3254	 */
  3255	static inline void kernel_swap_check(struct scan_control *sc)
  3256	{
> 3257		if (sc != NULL && !kernel_swap_enabled())
  3258			sc->may_swap = 0;
  3259	}
  3260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
