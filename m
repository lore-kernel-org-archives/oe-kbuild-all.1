Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E743913A257
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736176641; cv=none; b=maPYE89nF2hKKkIjEzyq0u8+SpAABVyLIVLqkX1/Mt5L7mnVB156Zmit/tK0LDBPja3D3UTuK+6ac3nrz6mvPfosJvgglblBcnnCfXgm0IvoX8wS0xvGmMjf+9CfUwwCw7ohC73BIW/NxTitNBYRFLQn0ostRyhxPA0QJSJ3kxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736176641; c=relaxed/simple;
	bh=oArqFN5CnUhm4NXwUlpr8peKwGSRfUNCUsFFeIVfJhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rTRS3QVa+oZOCPvGbaTd/DhnLQwqv3LvX+RN4ncKg5damAWHJalsMHlnunW9tkxuSF2WLGo56XiH9M1F8Y1Q/isg0T59nAQS1tW/IbL/evKIt5o4X/iMRGtYT3F40fe8h8JiFgGmICahjGkFeOVS3usYnFX7n7qz8O36EELuETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUCzOXCN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUCzOXCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736176638; x=1767712638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oArqFN5CnUhm4NXwUlpr8peKwGSRfUNCUsFFeIVfJhc=;
  b=RUCzOXCNQkK2Cnbko4qvzB59e1S2XV1BTEHWyq5ZYxYdQiS8tJ84eMvX
   1Kiz75Rrlha8Vj5aByIhaqU8+2a2+nbNo3ra9dRikDnxhXyet1C2qDx1x
   NAKz5mmI3SuwyP6ZEVnroyeRRbpKyd9OSrAB/4dpEtXzTuNnid0I+A0Qb
   9R9CMeDL4yVpyM0ytX7ifYVot8P1Sod1osdfmHcpawN4n4nOXFbp4m9EN
   Z5sxsuYWkpDvoXW21BsuGzY9H9d1+NBgTdEPPnEX/f2nbsQvh6J1qn9PS
   sX4J+2b93CylZvDKbVBr6dKtwp4CMPCjMtki2g/reU+JJ5EuM6RmCXamW
   w==;
X-CSE-ConnectionGUID: x/L2A039R1GHDhYODUeUww==
X-CSE-MsgGUID: 7N6vGw48T1OLuP/hbt6WIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36487631"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="36487631"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 07:17:14 -0800
X-CSE-ConnectionGUID: 5UhE6zz8Q6uvj8TyxtIFmg==
X-CSE-MsgGUID: +d/tw5UPQfmxGBqX9/9VAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102321679"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jan 2025 07:17:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUoqs-000CjX-0O;
	Mon, 06 Jan 2025 15:17:10 +0000
Date: Mon, 6 Jan 2025 23:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 23372/25291] lib/random32.c:579:16: error:
 implicit declaration of function 'kmalloc'
Message-ID: <202501062315.jcVRRarN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 7fd72e0ffe7119a2c76785aa88ca99a3e9557ceb [23372/25291] mm: don't include <linux/blk-cgroup.h> in <linux/writeback.h>
config: x86_64-buildonly-randconfig-004-20250106 (https://download.01.org/0day-ci/archive/20250106/202501062315.jcVRRarN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062315.jcVRRarN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062315.jcVRRarN-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/random32.c: In function 'prandom32_state_selftest':
>> lib/random32.c:579:16: error: implicit declaration of function 'kmalloc' [-Werror=implicit-function-declaration]
     579 |         data = kmalloc(sizeof(*data) * TEST_SIZE, GFP_KERNEL);
         |                ^~~~~~~
>> lib/random32.c:579:51: error: 'GFP_KERNEL' undeclared (first use in this function); did you mean 'SI_KERNEL'?
     579 |         data = kmalloc(sizeof(*data) * TEST_SIZE, GFP_KERNEL);
         |                                                   ^~~~~~~~~~
         |                                                   SI_KERNEL
   lib/random32.c:579:51: note: each undeclared identifier is reported only once for each function it appears in
>> lib/random32.c:610:9: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
     610 |         kfree(data);
         |         ^~~~~
         |         kvfree
   cc1: some warnings being treated as errors


vim +/kmalloc +579 lib/random32.c

c51f8f88d705e0 George Spelvin 2020-08-09  560  
c6e169bc146a76 Willy Tarreau  2020-10-24  561  #ifdef CONFIG_RANDOM32_SELFTEST
c6e169bc146a76 Willy Tarreau  2020-10-24  562  /* Principle: True 32-bit random numbers will all have 16 differing bits on
c6e169bc146a76 Willy Tarreau  2020-10-24  563   * average. For each 32-bit number, there are 601M numbers differing by 16
c6e169bc146a76 Willy Tarreau  2020-10-24  564   * bits, and 89% of the numbers differ by at least 12 bits. Note that more
c6e169bc146a76 Willy Tarreau  2020-10-24  565   * than 16 differing bits also implies a correlation with inverted bits. Thus
c6e169bc146a76 Willy Tarreau  2020-10-24  566   * we take 1024 random numbers and compare each of them to the other ones,
c6e169bc146a76 Willy Tarreau  2020-10-24  567   * counting the deviation of correlated bits to 16. Constants report 32,
c6e169bc146a76 Willy Tarreau  2020-10-24  568   * counters 32-log2(TEST_SIZE), and pure randoms, around 6 or lower. With the
c6e169bc146a76 Willy Tarreau  2020-10-24  569   * u32 total, TEST_SIZE may be as large as 4096 samples.
c6e169bc146a76 Willy Tarreau  2020-10-24  570   */
c6e169bc146a76 Willy Tarreau  2020-10-24  571  #define TEST_SIZE 1024
c6e169bc146a76 Willy Tarreau  2020-10-24  572  static int __init prandom32_state_selftest(void)
c6e169bc146a76 Willy Tarreau  2020-10-24  573  {
c6e169bc146a76 Willy Tarreau  2020-10-24  574  	unsigned int x, y, bits, samples;
c6e169bc146a76 Willy Tarreau  2020-10-24  575  	u32 xor, flip;
c6e169bc146a76 Willy Tarreau  2020-10-24  576  	u32 total;
c6e169bc146a76 Willy Tarreau  2020-10-24  577  	u32 *data;
c6e169bc146a76 Willy Tarreau  2020-10-24  578  
c6e169bc146a76 Willy Tarreau  2020-10-24 @579  	data = kmalloc(sizeof(*data) * TEST_SIZE, GFP_KERNEL);
c6e169bc146a76 Willy Tarreau  2020-10-24  580  	if (!data)
c6e169bc146a76 Willy Tarreau  2020-10-24  581  		return 0;
c6e169bc146a76 Willy Tarreau  2020-10-24  582  
c6e169bc146a76 Willy Tarreau  2020-10-24  583  	for (samples = 0; samples < TEST_SIZE; samples++)
c6e169bc146a76 Willy Tarreau  2020-10-24  584  		data[samples] = prandom_u32();
c6e169bc146a76 Willy Tarreau  2020-10-24  585  
c6e169bc146a76 Willy Tarreau  2020-10-24  586  	flip = total = 0;
c6e169bc146a76 Willy Tarreau  2020-10-24  587  	for (x = 0; x < samples; x++) {
c6e169bc146a76 Willy Tarreau  2020-10-24  588  		for (y = 0; y < samples; y++) {
c6e169bc146a76 Willy Tarreau  2020-10-24  589  			if (x == y)
c6e169bc146a76 Willy Tarreau  2020-10-24  590  				continue;
c6e169bc146a76 Willy Tarreau  2020-10-24  591  			xor = data[x] ^ data[y];
c6e169bc146a76 Willy Tarreau  2020-10-24  592  			flip |= xor;
c6e169bc146a76 Willy Tarreau  2020-10-24  593  			bits = hweight32(xor);
c6e169bc146a76 Willy Tarreau  2020-10-24  594  			total += (bits - 16) * (bits - 16);
c6e169bc146a76 Willy Tarreau  2020-10-24  595  		}
c6e169bc146a76 Willy Tarreau  2020-10-24  596  	}
c6e169bc146a76 Willy Tarreau  2020-10-24  597  
c6e169bc146a76 Willy Tarreau  2020-10-24  598  	/* We'll return the average deviation as 2*sqrt(corr/samples), which
c6e169bc146a76 Willy Tarreau  2020-10-24  599  	 * is also sqrt(4*corr/samples) which provides a better resolution.
c6e169bc146a76 Willy Tarreau  2020-10-24  600  	 */
c6e169bc146a76 Willy Tarreau  2020-10-24  601  	bits = int_sqrt(total / (samples * (samples - 1)) * 4);
c6e169bc146a76 Willy Tarreau  2020-10-24  602  	if (bits > 6)
c6e169bc146a76 Willy Tarreau  2020-10-24  603  		pr_warn("prandom32: self test failed (at least %u bits"
c6e169bc146a76 Willy Tarreau  2020-10-24  604  			" correlated, fixed_mask=%#x fixed_value=%#x\n",
c6e169bc146a76 Willy Tarreau  2020-10-24  605  			bits, ~flip, data[0] & ~flip);
c6e169bc146a76 Willy Tarreau  2020-10-24  606  	else
c6e169bc146a76 Willy Tarreau  2020-10-24  607  		pr_info("prandom32: self test passed (less than %u bits"
c6e169bc146a76 Willy Tarreau  2020-10-24  608  			" correlated)\n",
c6e169bc146a76 Willy Tarreau  2020-10-24  609  			bits+1);
c6e169bc146a76 Willy Tarreau  2020-10-24 @610  	kfree(data);
c6e169bc146a76 Willy Tarreau  2020-10-24  611  	return 0;
c6e169bc146a76 Willy Tarreau  2020-10-24  612  }
c6e169bc146a76 Willy Tarreau  2020-10-24  613  core_initcall(prandom32_state_selftest);
c6e169bc146a76 Willy Tarreau  2020-10-24  614  #endif /*  CONFIG_RANDOM32_SELFTEST */
c6e169bc146a76 Willy Tarreau  2020-10-24  615  

:::::: The code at line 579 was first introduced by commit
:::::: c6e169bc146a76d5ccbf4d3825f705414352bd03 random32: add a selftest for the prandom32 code

:::::: TO: Willy Tarreau <w@1wt.eu>
:::::: CC: Willy Tarreau <w@1wt.eu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
