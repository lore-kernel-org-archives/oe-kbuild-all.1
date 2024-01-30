Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AD77E571
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706627276; cv=none; b=eCq8nkm17N3mmLUUlAEaJX5wV5RVMuYNT/LYqo5+APWQQdFn0xCPYhBkD7cWhoafaShxqoqP38U917NZ6jC4RMqWyUxlI4j1TatwLMsOG9XoMMvb3lKQrCrTgmgcI+F0ONuXWzRMXgZcE+gI2q7bqf83L7AhvIqDaS8zNHN1ba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706627276; c=relaxed/simple;
	bh=JJiOo311RcdoYE7BrZ8It5HAuw0/p57fY/s0jBalNuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ViFbL91jfbugHOZgiNSzMgDE4R/qm6bHPDQOepXTVDgv8ksAlGJ2D1WGJuHpi/48lnkuvG/6tkixVg06VlGmK1fymEXbxd4bpzqdZhPs30P33BxjwKSYupMKzyOh0Mx/DTUMPtrZFST8rvF2AdTT68RMcs5cg9Ropu7kzlbiaSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSjT+R/n; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSjT+R/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706627274; x=1738163274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JJiOo311RcdoYE7BrZ8It5HAuw0/p57fY/s0jBalNuc=;
  b=PSjT+R/nzUXQsQeb2GDFVGbQPmWqNZKmQPLWj2AeuG7lLMbSEwKwVHPN
   N7MvLFDbAhDbqwyo9vBZTplVQvojYdQhQtF7a3aAIxVc6E7yeCu6zJOb5
   VOJKQFbZdkIDk0gr4mfxsFGipOox1z5ZXizLhSQpP6KKKekHWhJ2M0cmM
   qGn8ZGdEaoLWZ6aHtYRPxSbakG0IlMffFU15kC630Zj44hCEzwFN450Mp
   U8k0PMpntJ58s8ZnyzWrl0FytgFp7oezlIjpZM7RTwSQIVabC3bY6aDIF
   R947cgc8DTAVP7ZC1VzPh+1WyryVdIo3JcXBUmFCyPmalSakdLKwwqRjl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393736313"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="393736313"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 07:03:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3698787"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Jan 2024 07:03:51 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUpc3-0000Q8-0M;
	Tue, 30 Jan 2024 15:02:32 +0000
Date: Tue, 30 Jan 2024 23:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Aubrey Li <aubrey.li@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29933/30000] arch/x86/kernel/cpu/common.c:92:16:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202401302223.n5Bt3u0j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7b3b2702f031a1a8368468aef621f12b23241185
commit: f4128ae8e6ff03b4c805707fe75d0345797f7f53 [29933/30000] sched: Add cluster scheduler level for x86
config: x86_64-randconfig-123-20240130 (https://download.01.org/0day-ci/archive/20240130/202401302223.n5Bt3u0j-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401302223.n5Bt3u0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401302223.n5Bt3u0j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/common.c:92:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned short * @@
   arch/x86/kernel/cpu/common.c:92:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/cpu/common.c:92:16: sparse:     got unsigned short *
   arch/x86/kernel/cpu/common.c:144:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:145:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:146:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:147:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:148:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:149:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)

vim +92 arch/x86/kernel/cpu/common.c

f8b64d08dde271 Borislav Petkov 2018-04-27  89  
6f01df96c462b7 Kim Phillips    2021-08-17  90  u16 get_llc_id(unsigned int cpu)
6f01df96c462b7 Kim Phillips    2021-08-17  91  {
6f01df96c462b7 Kim Phillips    2021-08-17 @92  	return per_cpu(cpu_llc_id, cpu);
6f01df96c462b7 Kim Phillips    2021-08-17  93  }
6f01df96c462b7 Kim Phillips    2021-08-17  94  EXPORT_SYMBOL_GPL(get_llc_id);
6f01df96c462b7 Kim Phillips    2021-08-17  95  

:::::: The code at line 92 was first introduced by commit
:::::: 6f01df96c462b77915b27d404152c47e75e879cf x86/cpu: Add get_llc_id() helper function

:::::: TO: Kim Phillips <kim.phillips@amd.com>
:::::: CC: Xie Haocheng <haocheng.xie@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
