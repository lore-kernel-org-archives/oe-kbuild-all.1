Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FB513A88A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 22:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713307577; cv=none; b=WkX0fJ5wG9gCndhxq4EHk2yUy6kUCgOhZjfMWXh4dHJsVPnhyeEGv7cwZXE/tVcBrtZWF/Ph2Yl9ar9kUB7ggEMOPx195vc/5aIMAv/wNbXK56wKDfaXoOT0gLdIvvAsQIKXdKKeTUNXFrMGZk3pVOu1LuLVj7WHs0JiAfXlNPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713307577; c=relaxed/simple;
	bh=LF3VeucQEICYx9+LE6/he+ejcp66D+u9SSUm3kZR86M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yh8xiWUKdXNV3/J80fHXpYctOg2G2DTIBxR1qx+ezaN87IMR6FNnPqTIuuWMIQ3v+xWWPDGTXki74SxWKF1XVmRXbYX9zAKYjCYmYIdqfSbp0SzOy9TdoC56+G/QbEQ6DbOWvl1crf8W6STjumTzQyNmFRd5fGkdyChRjHsD9fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0Rb/8bn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0Rb/8bn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713307575; x=1744843575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LF3VeucQEICYx9+LE6/he+ejcp66D+u9SSUm3kZR86M=;
  b=H0Rb/8bnuvIBprJo5XVWGkJEcpWdgcE6OflJ50qHDFjrVezmHW5u6zRu
   CECrhoaO+3WPxz6a0m6ocd7wBzY6gT84U2pYIqw5YTxB16VWEvfOV5GWh
   2myAlsgCULGcU5EdtcmEZ9YPaWYoQz97VtGHPdaIccI+eGUjroz5rLnuD
   1dWw7iawRuXVClng3flCKCwdW7VqyCYz0jiG8wyCTTVJ/534O6B1lCg7Y
   EFaMk1N8zezOh/+SaGzEMAvr/ekeMB/HkyH83GuJhOZAcCfJiwTntnkY0
   i6k2yyFukVdbJiALxCtunc7pZ0v5nd3bx4uh1vbaQbmF4lxqamYQp6La4
   w==;
X-CSE-ConnectionGUID: X/lkDlYrQyqSqz4BI58gbQ==
X-CSE-MsgGUID: FVqWXuYLT26wUndca6Wv+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19336452"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="19336452"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 15:46:14 -0700
X-CSE-ConnectionGUID: rJMhMRQtTk2aDKza+SxqfQ==
X-CSE-MsgGUID: zn49vrZPRZ6TCxu3P+AlYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="53381543"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Apr 2024 15:46:13 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwrZ5-0005ny-0H;
	Tue, 16 Apr 2024 22:46:11 +0000
Date: Wed, 17 Apr 2024 06:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring 461/472]
 lib/math/mean_and_variance.c:47: multiple definition of `u128_div';
 fs/bcachefs/mean_and_variance.o:fs/bcachefs/mean_and_variance.c:48: first
 defined here
Message-ID: <202404170641.XYdg43OK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   27b0da35e8bf546ce529aca482a974c106d344a0
commit: 6d0d9f2aeeda790e2024d2f47aaa6c3d4b5825ba [461/472] xfs: present wait time statistics
config: riscv-randconfig-001-20240416 (https://download.01.org/0day-ci/archive/20240417/202404170641.XYdg43OK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404170641.XYdg43OK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170641.XYdg43OK-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: lib/sort.o: in function `eytzinger0_sort_r':
   lib/sort.c:327: multiple definition of `eytzinger0_sort_r'; fs/bcachefs/eytzinger.o:fs/bcachefs/eytzinger.c:173: first defined here
   riscv64-linux-ld: lib/sort.o: in function `eytzinger0_sort':
   lib/sort.c:382: multiple definition of `eytzinger0_sort'; fs/bcachefs/eytzinger.o:fs/bcachefs/eytzinger.c:227: first defined here
   riscv64-linux-ld: lib/math/mean_and_variance.o: in function `u128_div':
>> lib/math/mean_and_variance.c:47: multiple definition of `u128_div'; fs/bcachefs/mean_and_variance.o:fs/bcachefs/mean_and_variance.c:48: first defined here
   riscv64-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_get_mean':
>> lib/math/mean_and_variance.c:67: multiple definition of `mean_and_variance_get_mean'; fs/bcachefs/mean_and_variance.o:fs/bcachefs/mean_and_variance.c:67: first defined here
   riscv64-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_get_variance':
>> lib/math/mean_and_variance.c:79: multiple definition of `mean_and_variance_get_variance'; fs/bcachefs/mean_and_variance.o:fs/bcachefs/mean_and_variance.c:78: first defined here
   riscv64-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_get_stddev':
>> lib/math/mean_and_variance.c:96: multiple definition of `mean_and_variance_get_stddev'; fs/bcachefs/mean_and_variance.o:fs/bcachefs/mean_and_variance.c:94: first defined here
   riscv64-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_update':
>> lib/math/mean_and_variance.c:113: multiple definition of `mean_and_variance_weighted_update'; fs/bcachefs/mean_and_variance.o:fs/bcachefs/mean_and_variance.c:110: first defined here
   riscv64-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_get_mean':
>> lib/math/mean_and_variance.c:141: multiple definition of `mean_and_variance_weighted_get_mean'; fs/bcachefs/mean_and_variance.o:fs/bcachefs/mean_and_variance.c:137: first defined here
   riscv64-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_get_variance':
>> lib/math/mean_and_variance.c:153: multiple definition of `mean_and_variance_weighted_get_variance'; fs/bcachefs/mean_and_variance.o:fs/bcachefs/mean_and_variance.c:148: first defined here
   riscv64-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_get_stddev':
>> lib/math/mean_and_variance.c:166: multiple definition of `mean_and_variance_weighted_get_stddev'; fs/bcachefs/mean_and_variance.o:fs/bcachefs/mean_and_variance.c:160: first defined here


vim +47 lib/math/mean_and_variance.c

3332108f6e75eb Kent Overstreet 2024-03-25   45  
3332108f6e75eb Kent Overstreet 2024-03-25   46  u128_u u128_div(u128_u n, u64 d)
3332108f6e75eb Kent Overstreet 2024-03-25  @47  {
3332108f6e75eb Kent Overstreet 2024-03-25   48  	u128_u r;
3332108f6e75eb Kent Overstreet 2024-03-25   49  	u64 rem;
3332108f6e75eb Kent Overstreet 2024-03-25   50  	u64 hi = u128_hi(n);
3332108f6e75eb Kent Overstreet 2024-03-25   51  	u64 lo = u128_lo(n);
3332108f6e75eb Kent Overstreet 2024-03-25   52  	u64  h =  hi & ((u64) U32_MAX  << 32);
3332108f6e75eb Kent Overstreet 2024-03-25   53  	u64  l = (hi &  (u64) U32_MAX) << 32;
3332108f6e75eb Kent Overstreet 2024-03-25   54  
3332108f6e75eb Kent Overstreet 2024-03-25   55  	r =             u128_shl(u64_to_u128(div64_u64_rem(h,                d, &rem)), 64);
3332108f6e75eb Kent Overstreet 2024-03-25   56  	r = u128_add(r, u128_shl(u64_to_u128(div64_u64_rem(l  + (rem << 32), d, &rem)), 32));
3332108f6e75eb Kent Overstreet 2024-03-25   57  	r = u128_add(r,          u64_to_u128(div64_u64_rem(lo + (rem << 32), d, &rem)));
3332108f6e75eb Kent Overstreet 2024-03-25   58  	return r;
3332108f6e75eb Kent Overstreet 2024-03-25   59  }
3332108f6e75eb Kent Overstreet 2024-03-25   60  EXPORT_SYMBOL_GPL(u128_div);
3332108f6e75eb Kent Overstreet 2024-03-25   61  
3332108f6e75eb Kent Overstreet 2024-03-25   62  /**
3332108f6e75eb Kent Overstreet 2024-03-25   63   * mean_and_variance_get_mean() - get mean from @s
3332108f6e75eb Kent Overstreet 2024-03-25   64   * @s: mean and variance number of samples and their sums
3332108f6e75eb Kent Overstreet 2024-03-25   65   */
3332108f6e75eb Kent Overstreet 2024-03-25   66  s64 mean_and_variance_get_mean(struct mean_and_variance s)
3332108f6e75eb Kent Overstreet 2024-03-25  @67  {
3332108f6e75eb Kent Overstreet 2024-03-25   68  	return s.n ? div64_u64(s.sum, s.n) : 0;
3332108f6e75eb Kent Overstreet 2024-03-25   69  }
3332108f6e75eb Kent Overstreet 2024-03-25   70  EXPORT_SYMBOL_GPL(mean_and_variance_get_mean);
3332108f6e75eb Kent Overstreet 2024-03-25   71  
3332108f6e75eb Kent Overstreet 2024-03-25   72  /**
3332108f6e75eb Kent Overstreet 2024-03-25   73   * mean_and_variance_get_variance() -  get variance from @s1
3332108f6e75eb Kent Overstreet 2024-03-25   74   * @s1: mean and variance number of samples and sums
3332108f6e75eb Kent Overstreet 2024-03-25   75   *
3332108f6e75eb Kent Overstreet 2024-03-25   76   * see linked pdf equation 12.
3332108f6e75eb Kent Overstreet 2024-03-25   77   */
3332108f6e75eb Kent Overstreet 2024-03-25   78  u64 mean_and_variance_get_variance(struct mean_and_variance s1)
3332108f6e75eb Kent Overstreet 2024-03-25  @79  {
3332108f6e75eb Kent Overstreet 2024-03-25   80  	if (s1.n) {
3332108f6e75eb Kent Overstreet 2024-03-25   81  		u128_u s2 = u128_div(s1.sum_squares, s1.n);
3332108f6e75eb Kent Overstreet 2024-03-25   82  		u64  s3 = abs(mean_and_variance_get_mean(s1));
3332108f6e75eb Kent Overstreet 2024-03-25   83  
3332108f6e75eb Kent Overstreet 2024-03-25   84  		return u128_lo(u128_sub(s2, u128_square(s3)));
3332108f6e75eb Kent Overstreet 2024-03-25   85  	} else {
3332108f6e75eb Kent Overstreet 2024-03-25   86  		return 0;
3332108f6e75eb Kent Overstreet 2024-03-25   87  	}
3332108f6e75eb Kent Overstreet 2024-03-25   88  }
3332108f6e75eb Kent Overstreet 2024-03-25   89  EXPORT_SYMBOL_GPL(mean_and_variance_get_variance);
3332108f6e75eb Kent Overstreet 2024-03-25   90  
3332108f6e75eb Kent Overstreet 2024-03-25   91  /**
3332108f6e75eb Kent Overstreet 2024-03-25   92   * mean_and_variance_get_stddev() - get standard deviation from @s
3332108f6e75eb Kent Overstreet 2024-03-25   93   * @s: mean and variance number of samples and their sums
3332108f6e75eb Kent Overstreet 2024-03-25   94   */
3332108f6e75eb Kent Overstreet 2024-03-25   95  u32 mean_and_variance_get_stddev(struct mean_and_variance s)
3332108f6e75eb Kent Overstreet 2024-03-25  @96  {
3332108f6e75eb Kent Overstreet 2024-03-25   97  	return int_sqrt64(mean_and_variance_get_variance(s));
3332108f6e75eb Kent Overstreet 2024-03-25   98  }
3332108f6e75eb Kent Overstreet 2024-03-25   99  EXPORT_SYMBOL_GPL(mean_and_variance_get_stddev);
3332108f6e75eb Kent Overstreet 2024-03-25  100  
3332108f6e75eb Kent Overstreet 2024-03-25  101  /**
3332108f6e75eb Kent Overstreet 2024-03-25  102   * mean_and_variance_weighted_update() - exponentially weighted variant of mean_and_variance_update()
3332108f6e75eb Kent Overstreet 2024-03-25  103   * @s: mean and variance number of samples and their sums
3332108f6e75eb Kent Overstreet 2024-03-25  104   * @x: new value to include in the &mean_and_variance_weighted
3332108f6e75eb Kent Overstreet 2024-03-25  105   * @initted: caller must track whether this is the first use or not
3332108f6e75eb Kent Overstreet 2024-03-25  106   * @weight: ewma weight
3332108f6e75eb Kent Overstreet 2024-03-25  107   *
3332108f6e75eb Kent Overstreet 2024-03-25  108   * see linked pdf: function derived from equations 140-143 where alpha = 2^w.
3332108f6e75eb Kent Overstreet 2024-03-25  109   * values are stored bitshifted for performance and added precision.
3332108f6e75eb Kent Overstreet 2024-03-25  110   */
3332108f6e75eb Kent Overstreet 2024-03-25  111  void mean_and_variance_weighted_update(struct mean_and_variance_weighted *s,
3332108f6e75eb Kent Overstreet 2024-03-25  112  		s64 x, bool initted, u8 weight)
3332108f6e75eb Kent Overstreet 2024-03-25 @113  {
3332108f6e75eb Kent Overstreet 2024-03-25  114  	// previous weighted variance.
3332108f6e75eb Kent Overstreet 2024-03-25  115  	u8 w		= weight;
3332108f6e75eb Kent Overstreet 2024-03-25  116  	u64 var_w0	= s->variance;
3332108f6e75eb Kent Overstreet 2024-03-25  117  	// new value weighted.
3332108f6e75eb Kent Overstreet 2024-03-25  118  	s64 x_w		= x << w;
3332108f6e75eb Kent Overstreet 2024-03-25  119  	s64 diff_w	= x_w - s->mean;
3332108f6e75eb Kent Overstreet 2024-03-25  120  	s64 diff	= fast_divpow2(diff_w, w);
3332108f6e75eb Kent Overstreet 2024-03-25  121  	// new mean weighted.
3332108f6e75eb Kent Overstreet 2024-03-25  122  	s64 u_w1	= s->mean + diff;
3332108f6e75eb Kent Overstreet 2024-03-25  123  
3332108f6e75eb Kent Overstreet 2024-03-25  124  	if (!initted) {
3332108f6e75eb Kent Overstreet 2024-03-25  125  		s->mean = x_w;
3332108f6e75eb Kent Overstreet 2024-03-25  126  		s->variance = 0;
3332108f6e75eb Kent Overstreet 2024-03-25  127  	} else {
3332108f6e75eb Kent Overstreet 2024-03-25  128  		s->mean = u_w1;
3332108f6e75eb Kent Overstreet 2024-03-25  129  		s->variance = ((var_w0 << w) - var_w0 + ((diff_w * (x_w - u_w1)) >> w)) >> w;
3332108f6e75eb Kent Overstreet 2024-03-25  130  	}
3332108f6e75eb Kent Overstreet 2024-03-25  131  }
3332108f6e75eb Kent Overstreet 2024-03-25  132  EXPORT_SYMBOL_GPL(mean_and_variance_weighted_update);
3332108f6e75eb Kent Overstreet 2024-03-25  133  
3332108f6e75eb Kent Overstreet 2024-03-25  134  /**
3332108f6e75eb Kent Overstreet 2024-03-25  135   * mean_and_variance_weighted_get_mean() - get mean from @s
3332108f6e75eb Kent Overstreet 2024-03-25  136   * @s: mean and variance number of samples and their sums
3332108f6e75eb Kent Overstreet 2024-03-25  137   * @weight: ewma weight
3332108f6e75eb Kent Overstreet 2024-03-25  138   */
3332108f6e75eb Kent Overstreet 2024-03-25  139  s64 mean_and_variance_weighted_get_mean(struct mean_and_variance_weighted s,
3332108f6e75eb Kent Overstreet 2024-03-25  140  		u8 weight)
3332108f6e75eb Kent Overstreet 2024-03-25 @141  {
3332108f6e75eb Kent Overstreet 2024-03-25  142  	return fast_divpow2(s.mean, weight);
3332108f6e75eb Kent Overstreet 2024-03-25  143  }
3332108f6e75eb Kent Overstreet 2024-03-25  144  EXPORT_SYMBOL_GPL(mean_and_variance_weighted_get_mean);
3332108f6e75eb Kent Overstreet 2024-03-25  145  
3332108f6e75eb Kent Overstreet 2024-03-25  146  /**
3332108f6e75eb Kent Overstreet 2024-03-25  147   * mean_and_variance_weighted_get_variance() -- get variance from @s
3332108f6e75eb Kent Overstreet 2024-03-25  148   * @s: mean and variance number of samples and their sums
3332108f6e75eb Kent Overstreet 2024-03-25  149   * @weight: ewma weight
3332108f6e75eb Kent Overstreet 2024-03-25  150   */
3332108f6e75eb Kent Overstreet 2024-03-25  151  u64 mean_and_variance_weighted_get_variance(struct mean_and_variance_weighted s,
3332108f6e75eb Kent Overstreet 2024-03-25  152  		u8 weight)
3332108f6e75eb Kent Overstreet 2024-03-25 @153  {
3332108f6e75eb Kent Overstreet 2024-03-25  154  	// always positive don't need fast divpow2
3332108f6e75eb Kent Overstreet 2024-03-25  155  	return s.variance >> weight;
3332108f6e75eb Kent Overstreet 2024-03-25  156  }
3332108f6e75eb Kent Overstreet 2024-03-25  157  EXPORT_SYMBOL_GPL(mean_and_variance_weighted_get_variance);
3332108f6e75eb Kent Overstreet 2024-03-25  158  
3332108f6e75eb Kent Overstreet 2024-03-25  159  /**
3332108f6e75eb Kent Overstreet 2024-03-25  160   * mean_and_variance_weighted_get_stddev() - get standard deviation from @s
3332108f6e75eb Kent Overstreet 2024-03-25  161   * @s: mean and variance number of samples and their sums
3332108f6e75eb Kent Overstreet 2024-03-25  162   * @weight: ewma weight
3332108f6e75eb Kent Overstreet 2024-03-25  163   */
3332108f6e75eb Kent Overstreet 2024-03-25  164  u32 mean_and_variance_weighted_get_stddev(struct mean_and_variance_weighted s,
3332108f6e75eb Kent Overstreet 2024-03-25  165  		u8 weight)
3332108f6e75eb Kent Overstreet 2024-03-25 @166  {
3332108f6e75eb Kent Overstreet 2024-03-25  167  	return int_sqrt64(mean_and_variance_weighted_get_variance(s, weight));
3332108f6e75eb Kent Overstreet 2024-03-25  168  }
3332108f6e75eb Kent Overstreet 2024-03-25  169  EXPORT_SYMBOL_GPL(mean_and_variance_weighted_get_stddev);
3332108f6e75eb Kent Overstreet 2024-03-25  170  

:::::: The code at line 47 was first introduced by commit
:::::: 3332108f6e75ebd618bd1088a45ecb417375195e mean and variance: Promote to lib/math

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
