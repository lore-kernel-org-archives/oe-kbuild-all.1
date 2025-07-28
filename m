Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134FA19E97A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 07:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753688644; cv=none; b=NbD80hs8UHCb7wRRppXp7Zl5G0J3yRVmJ5BH17aDBZEhOjkKv2uwCZPZcLbIUpvzEH2oYge6kIQK3Ul2JJzpxC+8D1YyXJCbIgMQ14tq3XWtiIUKzpBzCkchCbZhBk32cX0Qnow2V7ZLx2cwb5rAh3813uR2I507Q0NfSOkDY4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753688644; c=relaxed/simple;
	bh=Ma2qnTvqkv8HRbjF0qw7ZL6z2Zqk6oMT7eE/zi/Vj4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A8r+PDBkh41JvpVUAXDUCZWD1FzY1HmxzxNU7B0ncxVWb+LjCmM2LwxpzgYw/L2YfjR1+9Yk8EHIEspQ4msMjtEX7E/b/avcOFbSpOmVRDSOHRHDKwvJGNCAXo5LHNxH6M5IqkzE10/JQVuE9vfnNAvmTqqNXhweSp0hQgpAAA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJUnBQRM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJUnBQRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753688643; x=1785224643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ma2qnTvqkv8HRbjF0qw7ZL6z2Zqk6oMT7eE/zi/Vj4U=;
  b=OJUnBQRMD3kLqOIhhd6lEVuVF4RcWU8YDoS0PeL3wG7H67ltGYpYdHIB
   o+UyE48a/DAC+FDpwooKqlsPBe7dRKvEYYFqBe8fppIzk4ol1MVAmEwxl
   I5kN3N0RwGLjx8cZjXDnIeRiNDA6PvqtDCMM9K8Bmv0atHD9hd4r6RxeA
   qUAIQ/lPWxXqLiIloXEnZpHtUOqeWsw2lAiuzUENii5w2PqWqSfeJYJAW
   5bs4wbavnT5fzeeXTQUHA8ngLCj5EKUzXlrSq4Aqiic0Os9WA0EXj5JAV
   hbHhG1D/z46LSXfiXrDwiV8Eyi2NP+M0QNjKHdHveQfu811cj0xgg75bk
   Q==;
X-CSE-ConnectionGUID: 1j0L+1DOR7qcwHrqotS7Mw==
X-CSE-MsgGUID: Ur6GhU/1RJWa1Z8eT4Fx+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59747602"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="59747602"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 00:44:02 -0700
X-CSE-ConnectionGUID: nsm4mGDBS16AEDLv+sSMPA==
X-CSE-MsgGUID: dn8G3WlwR96mftnd9clULA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166824790"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 28 Jul 2025 00:44:02 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugIWd-0000Up-0g;
	Mon, 28 Jul 2025 07:43:59 +0000
Date: Mon, 28 Jul 2025 09:43:07 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 92/92] lib/random32.c:579:9: error: implicit
 declaration of function 'kmalloc'
Message-ID: <202507280943.CXF1zMk9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: 7fd72e0ffe7119a2c76785aa88ca99a3e9557ceb [92/92] mm: don't include <linux/blk-cgroup.h> in <linux/writeback.h>
config: arm64-randconfig-2005-20250719 (https://download.01.org/0day-ci/archive/20250728/202507280943.CXF1zMk9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507280943.CXF1zMk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507280943.CXF1zMk9-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/random32.c: In function 'prandom32_state_selftest':
>> lib/random32.c:579:9: error: implicit declaration of function 'kmalloc' [-Werror=implicit-function-declaration]
     579 |  data = kmalloc(sizeof(*data) * TEST_SIZE, GFP_KERNEL);
         |         ^~~~~~~
>> lib/random32.c:579:44: error: 'GFP_KERNEL' undeclared (first use in this function); did you mean 'SI_KERNEL'?
     579 |  data = kmalloc(sizeof(*data) * TEST_SIZE, GFP_KERNEL);
         |                                            ^~~~~~~~~~
         |                                            SI_KERNEL
   lib/random32.c:579:44: note: each undeclared identifier is reported only once for each function it appears in
>> lib/random32.c:610:2: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     610 |  kfree(data);
         |  ^~~~~
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
