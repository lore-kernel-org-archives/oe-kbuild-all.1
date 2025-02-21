Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717CA242919
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 17:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157279; cv=none; b=tzyS2Y5iRiKearj9ywe94FmHUoQ0iWrPI1iC2HRufNzHxdjIzzEjWNjE6cSXr61c36XGiGwHGoLgX7Go/G1ldnmoXgWXBi4w4JEiOfDnHtWpZXv4xIa/uPlVcQgA3K+cUSPhBQ4p/mWzKxynuXjbl0I5Le3/aS6+hI4QPxmMOWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157279; c=relaxed/simple;
	bh=r2Mzq1GTZzAkkRBDNhOXQSWmErH72d0eZTBbZAWniP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SN6Tnxm+GSSzwMV4OxqO6K7gzVTrh8xZ48AxSL6oYlEtB7pbFPiHdLDqHguaYwOXNFVLoFdUWiqUnOi+TMFEj40+dqIZoXkIV4JuL5LylVS6FWCH7n4r8VhE2BBLKNtLmxvjve5pZuRBQt8XpnkeUb6x6qn4LjOBA++DN84NrhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghME5F+a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghME5F+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740157277; x=1771693277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r2Mzq1GTZzAkkRBDNhOXQSWmErH72d0eZTBbZAWniP8=;
  b=ghME5F+aEP2p0IbacpOidP/KpH7bUQwbzDyXPh4/pFiODqV21Veooz9t
   N3aAP0Vd2ld/in3JmsI+Ch+gvjN1Mi8Cgs2cpMo7bTuipo+4P+u/ErE8B
   EfYNlXTiftuQmY5t1rCC8hdGmgicKII+O/h9fh1GyrLU3D5CJO5g3+Q69
   BkIJTxTW1nt96p7mGhfvcEdl4H9LVBM6A+R0l7ZWBquOOoO9LaN2gNmcI
   bnEtYGuRXxMPU6ceoaxn7dkoUc8rsLL6uCallZsv+74FiXdIIg0zrCT5p
   onZQGNHaHfyf83/XizbRJMEFXu6vWNiFAnQOYiSGA0UB65Slc6cA3wQVT
   Q==;
X-CSE-ConnectionGUID: aDkMow+NSwWuZrVponjdvw==
X-CSE-MsgGUID: Oo7/DbpbRX+EiFfV9b8EgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41188010"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41188010"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 09:01:17 -0800
X-CSE-ConnectionGUID: wRW3eqBJRBGQbMyXAblGXQ==
X-CSE-MsgGUID: cGAoEmgQSlW3/HXT/eAgqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="120520305"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Feb 2025 09:01:15 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlWOl-0005mX-2z;
	Fri, 21 Feb 2025 17:01:12 +0000
Date: Sat, 22 Feb 2025 01:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2759/2759] ld.lld: error: version script
 assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed:
 symbol not defined
Message-ID: <202502220002.A1cz9IPm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4d88bf76198b8a462646f7be261586ebb2bbf5f3
commit: 5476cb89ef2297bd36f8b38e27b54617b6f63236 [2759/2759] x86/vdso: Implement a vDSO for Intel SGX enclave call
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250222/202502220002.A1cz9IPm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502220002.A1cz9IPm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220002.A1cz9IPm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed: symbol not defined
>> llvm-objdump: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory
--
>> llvm-objcopy: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
