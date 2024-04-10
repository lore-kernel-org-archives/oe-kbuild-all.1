Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEC820EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 03:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712718814; cv=none; b=IFmcNk/j5LVaVV9wmHctT0o/s+z+kXjaZDwf5A1IrPGkqFUBodKghULG06LHaB+m1gAJV+2MynGzwPqKRqHcG8+3o33FW/O5ExC+DscLnP+5WT4AI1xVGqQbhv9EOeHWRSooFlqRU3arT0vYSKqf29YIrTU2AueoSyuZDa+i7ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712718814; c=relaxed/simple;
	bh=9RA6W1Gw39D2vy5jO2uCadvE5ng6Huw74ixhK0HzUSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fqAQBiDw2KHJd3TYM5OxxHRlGibZ+FHR7/mUTUYn7bni4Cm4NTWagkXhkqtjlXESFI+16ZmFBGO/T7iORBGLK6vNlSeFgnpHix3WEx26FNaYz+KeB/ilHx9nZMskRRPIrMje4UrbDP9h9I+1iTvx3XFclzFIlNWHuxAETLN4nSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKqTfczg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKqTfczg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712718812; x=1744254812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9RA6W1Gw39D2vy5jO2uCadvE5ng6Huw74ixhK0HzUSw=;
  b=GKqTfczg4YX7cZKqSjsQPd87YvSbpt/B4uMAdN/1QFt2tamFKMuB8tEM
   e3kKc0O/kpVTRcpzvCla5Pyortazs/sOCL567/Xg8pTq9VkHOBEzvdEZM
   x2rMdRw48Ozhm/4hP+ZG0Nqjn0OmXKFKzhA52iZCXoATPTt0TTNayzNMx
   0XVCkT1DQgVX905D5/9uCLgDzPC1CCNaKOp3B8bRfpyYiat3XdkPeud+C
   uG3vw2/woRUrbMZC85D85wpPls0I9j/8lxulO/m/QibLYnYOV9LOor0fY
   NKlhlsj7UH71SQFGfNU5cZyWH9CswtDRIFrPOUofXKVqf6dTEzqbcJ6a/
   Q==;
X-CSE-ConnectionGUID: JvWO1zgeRJKYLI79hg2OqA==
X-CSE-MsgGUID: 3P1RoTzmS4SOMChV2UP1SA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33468226"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="33468226"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 20:13:32 -0700
X-CSE-ConnectionGUID: 0oxekGfWT8u7o6MhXIHJ/Q==
X-CSE-MsgGUID: gwHg+FsQTOusfAtDKcEJOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="51390891"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Apr 2024 20:13:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruOOu-0006k6-1N;
	Wed, 10 Apr 2024 03:13:28 +0000
Date: Wed, 10 Apr 2024 11:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 452/457] fs/bcachefs/eytzinger.c:144:12:
 warning: 'do_cmp' defined but not used
Message-ID: <202404101134.r0fgg3vU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   ed4cedcef505729c94212031f8ed784a5fd81ac5
commit: 4cbcf78d9a94eeb22f6ff6a2bae43395edcef509 [452/457] eytzinger: Promote to include/linux/
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240410/202404101134.r0fgg3vU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101134.r0fgg3vU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101134.r0fgg3vU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/eytzinger.c:144:12: warning: 'do_cmp' defined but not used [-Wunused-function]
     144 | static int do_cmp(const void *a, const void *b, cmp_r_func_t cmp, const void *priv)
         |            ^~~~~~
>> fs/bcachefs/eytzinger.c:125:13: warning: 'do_swap' defined but not used [-Wunused-function]
     125 | static void do_swap(void *a, void *b, size_t size, swap_r_func_t swap_func, const void *priv)
         |             ^~~~~~~


vim +/do_cmp +144 fs/bcachefs/eytzinger.c

ca1e02f7e9a1352 Kent Overstreet 2024-03-22  120  
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  121  /*
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  122   * The function pointer is last to make tail calls most efficient if the
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  123   * compiler decides not to inline this function.
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  124   */
ca1e02f7e9a1352 Kent Overstreet 2024-03-22 @125  static void do_swap(void *a, void *b, size_t size, swap_r_func_t swap_func, const void *priv)
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  126  {
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  127  	if (swap_func == SWAP_WRAPPER) {
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  128  		((const struct wrapper *)priv)->swap(a, b, (int)size);
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  129  		return;
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  130  	}
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  131  
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  132  	if (swap_func == SWAP_WORDS_64)
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  133  		swap_words_64(a, b, size);
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  134  	else if (swap_func == SWAP_WORDS_32)
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  135  		swap_words_32(a, b, size);
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  136  	else if (swap_func == SWAP_BYTES)
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  137  		swap_bytes(a, b, size);
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  138  	else
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  139  		swap_func(a, b, (int)size, priv);
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  140  }
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  141  
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  142  #define _CMP_WRAPPER ((cmp_r_func_t)0L)
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  143  
ca1e02f7e9a1352 Kent Overstreet 2024-03-22 @144  static int do_cmp(const void *a, const void *b, cmp_r_func_t cmp, const void *priv)
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  145  {
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  146  	if (cmp == _CMP_WRAPPER)
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  147  		return ((const struct wrapper *)priv)->cmp(a, b);
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  148  	return cmp(a, b, priv);
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  149  }
ca1e02f7e9a1352 Kent Overstreet 2024-03-22  150  

:::::: The code at line 144 was first introduced by commit
:::::: ca1e02f7e9a1352b3f7b04de821ae74c9e07df74 bcachefs: Etyzinger cleanups

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
