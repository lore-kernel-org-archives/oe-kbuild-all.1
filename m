Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E636B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 16:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713198837; cv=none; b=aFfc/eeFfYNIlagymdXQS3HMQqSf9eXPQUdbWjNsrGsJytPHBuKlPSayIuKrEqlAOnMw/yq2aS48IrtdyGM9cEIaX/3tbUeWwfOAoH8XNkekP3bAl0MTIypIylzQ8WL1zscK0xMaMjfL2ePZrZta1a/fqjWsfsuzEE+hqjYhNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713198837; c=relaxed/simple;
	bh=jcvlH2tIMBNK9aWfB+n+mVVRgDKGBLeu36n3YcMZ/IY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hc9xs/SaNaTlZ+UUc3+s/AchA4NkpYq7rXriD5aZk3UnssE0mmttuFA2B2c/WbZvRGjAsX0Uce+/UbyOTGEUnx/VrIY4RUyY3HNtZxLRgequy5zsJia8pBTG+pFDo1YjvIrKIfw03ZQTf3PqAwupM3dp3IoLz9Q5ltKtiSva+k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7kay2nm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7kay2nm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713198834; x=1744734834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jcvlH2tIMBNK9aWfB+n+mVVRgDKGBLeu36n3YcMZ/IY=;
  b=E7kay2nml9bxpUc4q4/epywAkYaglF8IKw+vow+wJSHjE9E1DM7pM4P+
   A43krIC0fR3271RRKZn4utCLFQlKa222wPxM55Z+QCnPCvjiLYRDZ5Ovh
   BESD4jZOjLpTiof2PTn9LOhW9gBr8ZAIOkUVqMfvfqMCEVe8rWzPkdfXS
   KrbGighC+EyE64aPn5aDJNN/tb/27uV4xbVLAQBTbfT3xQDBpK3e2w2+y
   tzZjgJUSJ39+oti+5hexM0vefoP+vahPkO9c1e9iP66uNWYrHXXtAEGtV
   6XuCCxa1oam6h9qfPK2KzB2EJJ0D4WjQZ/JTnFrW914m/DkA+U36gVaoQ
   A==;
X-CSE-ConnectionGUID: Pa6sj+GgSbieLlw4fsvHMQ==
X-CSE-MsgGUID: T1lERVfGR+Cffopx7oDR9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="26114656"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26114656"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 09:33:53 -0700
X-CSE-ConnectionGUID: 29KOSfGaQc6rdDJzl8ctGA==
X-CSE-MsgGUID: 6uHupXXGQI+RQdQ727C/Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26748934"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Apr 2024 09:33:53 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwPHB-0004P8-2g;
	Mon, 15 Apr 2024 16:33:49 +0000
Date: Tue, 16 Apr 2024 00:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6106/6266] powerpc-linux-ld: warning: orphan
 section `.bss..Lubsan_data530' from `drivers/cxl/core/port.o' being placed
 in section `.bss..Lubsan_data530'
Message-ID: <202404160020.38y5RIbw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6bd343537461b57f3efe5dfc5fc193a232dfef1e
commit: bd72c7e1d4304c9e24ec1d67d2cf44ba38d1d35f [6106/6266] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
config: powerpc-randconfig-r033-20230101 (https://download.01.org/0day-ci/archive/20240416/202404160020.38y5RIbw-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160020.38y5RIbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160020.38y5RIbw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data531' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data531'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data530' from `drivers/cxl/core/port.o' being placed in section `.bss..Lubsan_data530'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data531' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data531'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data530' from `drivers/cxl/core/port.o' being placed in section `.bss..Lubsan_data530'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data531' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data531'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data530' from `drivers/cxl/core/port.o' being placed in section `.bss..Lubsan_data530'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
