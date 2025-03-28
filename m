Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8220F21ABB7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156477; cv=none; b=stPqV4fopHlUD6S1YLnTDjK8AoukqxdjA/57+GDXTegbP1qbIfyMiGJFlKulTeG9KVHsgaHHlwTBLZBf4WGWM4VLuAqOIfrvwjd5sN1ADkKxCYz8ZZX1tCaAO0ZNNK+XWv5xyf/ghFupBtrIa0lUDOZH8C3UzIDnaQg+0+zlwmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156477; c=relaxed/simple;
	bh=nCd9KgJpZ+5hKOLV1zpot083qcdKbrKVDqBAWSnBwtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X7GZfnPV2MBIe4Dg2JtJqBiwPtqFztVFlTe6+yxGj83rvP+/axPcSmmZdDmomTPpYAcxwdT5UiNdQEOIba2XJMS/fDK10J+Fwvba7QMVVL4745rw1nq2lONODZaKPOS/RK2k2QW6IcD90lrV0PZW41vXWk3c651VBFBYkj8oU7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8o/4MLh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8o/4MLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743156475; x=1774692475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nCd9KgJpZ+5hKOLV1zpot083qcdKbrKVDqBAWSnBwtE=;
  b=a8o/4MLhmjsYjKCuxkmsali/IiwLzQOKczbgTu3WA9n995nNy4VGHt1r
   zdPSuYVs8T7iTZOX9Z9z2nCnTCNzZscuUE+IfXCZ2YJhLerSPrA7z6wOD
   o+Y68BPXZxUQYT8mJZjCBISDCp4jJv1aCWSbD6tuDWXLt5DoBenABGksD
   HtsCM8+jTfwdexLmjpPuDACqqYHZapwkIAB4yh3thXoqVHHi6Yc67WZ4J
   y3ka+bpbGThk8riCXW/HOWY5ES5qwRmKykIvINX0E+7n8m4dVBmk5cW5U
   m+IWJvmk0KpeXetekfj+A+nWdLJWFh6G5rApVBAJos2rUbEp2Zk3DNCtk
   Q==;
X-CSE-ConnectionGUID: h/1ySzP1QT62ZYqVXZ70hw==
X-CSE-MsgGUID: 3vwS1r6PSQSGE7odABmpQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44395810"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44395810"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 03:07:55 -0700
X-CSE-ConnectionGUID: FVEiHmrRSNOIX56C8NuHmw==
X-CSE-MsgGUID: SRL8OA+NQz+746R3PXSSxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125863208"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Mar 2025 03:07:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty6cp-0007LI-3B;
	Fri, 28 Mar 2025 10:07:47 +0000
Date: Fri, 28 Mar 2025 18:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [linux-next:master 12126/14010] fs/dcache.c:145: Error: unrecognized
 opcode `add.uw s1,s1,a5'
Message-ID: <202503281836.8pntHm6I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e21edb1638e82460f126a6e49bcdd958d452929c
commit: a44fb5722199de8338d991db5ad3d509192179bb [12126/14010] riscv: Add runtime constant support
config: riscv-randconfig-001-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281836.8pntHm6I-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281836.8pntHm6I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281836.8pntHm6I-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/dcache.c: Assembler messages:
>> fs/dcache.c:143: Warning: Unrecognized .option directive: arch,+zba
--
>> fs/dcache.c:145: Error: unrecognized opcode `add.uw s1,s1,a5'
>> fs/dcache.c:143: Warning: Unrecognized .option directive: arch,+zba
--
>> fs/dcache.c:145: Error: unrecognized opcode `add.uw a4,a4,a5'
>> fs/dcache.c:143: Warning: Unrecognized .option directive: arch,+zba
--
>> fs/dcache.c:145: Error: unrecognized opcode `add.uw s4,s4,a5'
>> fs/dcache.c:143: Warning: Unrecognized .option directive: arch,+zba
--
>> fs/dcache.c:145: Error: unrecognized opcode `add.uw s1,s1,a5'
>> fs/dcache.c:152: Error: attempt to move .org backwards
>> fs/dcache.c:152: Error: attempt to move .org backwards
>> fs/dcache.c:152: Error: attempt to move .org backwards
>> fs/dcache.c:152: Error: attempt to move .org backwards


vim +145 fs/dcache.c

312d3ca856d369 Christoph Hellwig 2010-10-10  139  
312d3ca856d369 Christoph Hellwig 2010-10-10  140  #if defined(CONFIG_SYSCTL) && defined(CONFIG_PROC_FS)
c8c0c239d5ab1e Luis Chamberlain  2022-01-21  141  /* Statistics gathering. */
c8c0c239d5ab1e Luis Chamberlain  2022-01-21  142  static struct dentry_stat_t dentry_stat = {
c8c0c239d5ab1e Luis Chamberlain  2022-01-21 @143  	.age_limit = 45,
c8c0c239d5ab1e Luis Chamberlain  2022-01-21  144  };
62d36c77035219 Dave Chinner      2013-08-28 @145  
62d36c77035219 Dave Chinner      2013-08-28  146  /*
62d36c77035219 Dave Chinner      2013-08-28  147   * Here we resort to our own counters instead of using generic per-cpu counters
62d36c77035219 Dave Chinner      2013-08-28  148   * for consistency with what the vfs inode code does. We are expected to harvest
62d36c77035219 Dave Chinner      2013-08-28  149   * better code and performance by having our own specialized counters.
62d36c77035219 Dave Chinner      2013-08-28  150   *
62d36c77035219 Dave Chinner      2013-08-28  151   * Please note that the loop is done over all possible CPUs, not over all online
62d36c77035219 Dave Chinner      2013-08-28 @152   * CPUs. The reason for this is that we don't want to play games with CPUs going
62d36c77035219 Dave Chinner      2013-08-28  153   * on and off. If one of them goes off, we will just keep their counters.
62d36c77035219 Dave Chinner      2013-08-28  154   *
62d36c77035219 Dave Chinner      2013-08-28  155   * glommer: See cffbc8a for details, and if you ever intend to change this,
62d36c77035219 Dave Chinner      2013-08-28  156   * please update all vfs counters to match.
62d36c77035219 Dave Chinner      2013-08-28  157   */
3942c07ccf98e6 Glauber Costa     2013-08-28  158  static long get_nr_dentry(void)
3e880fb5e4bb6a Nicholas Piggin   2011-01-07  159  {
3e880fb5e4bb6a Nicholas Piggin   2011-01-07  160  	int i;
3942c07ccf98e6 Glauber Costa     2013-08-28  161  	long sum = 0;
3e880fb5e4bb6a Nicholas Piggin   2011-01-07  162  	for_each_possible_cpu(i)
3e880fb5e4bb6a Nicholas Piggin   2011-01-07  163  		sum += per_cpu(nr_dentry, i);
3e880fb5e4bb6a Nicholas Piggin   2011-01-07  164  	return sum < 0 ? 0 : sum;
3e880fb5e4bb6a Nicholas Piggin   2011-01-07  165  }
3e880fb5e4bb6a Nicholas Piggin   2011-01-07  166  

:::::: The code at line 145 was first introduced by commit
:::::: 62d36c77035219ac776d1882ed3a662f2b75f258 dcache: convert dentry_stat.nr_unused to per-cpu counters

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
