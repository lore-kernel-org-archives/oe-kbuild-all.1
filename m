Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2E122F0E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 22:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712356328; cv=none; b=H9IlZnFDeW2WI4si0cpDu1eRHoQrP0Oow2cfuwdJlhahW8E1ycgFrPv7N4E4ZBpVGPt8XsH56Q//li4a1hiIvL4zKAUxtw6mR7aFaU6z688UGzbH6d9hF88bG5klZMsotAksSJmND+0/N7RFeosBYgOcpqOdE1/BfsmjVRPzxvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712356328; c=relaxed/simple;
	bh=r9LQckR4JSjxFEODPHmjkQv04MQJuMO6NG3Mg0T5Mr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FbGWTZpzFLmM48/iL05OjmdRg/BFDilEb6vi4XHZxbY1V40/zCLLYIMm/3fBrGDkzCDBB8BQFXsFvyscEqQU9/DCL5NJPsmE259nhjZHe0JFlpYmihhUtSxgcEyLZlfYRgqh6GlC8spPnL2eD9ejQEyAKYaFHzlnIVQPA4EQs90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYm64uWS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYm64uWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712356327; x=1743892327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r9LQckR4JSjxFEODPHmjkQv04MQJuMO6NG3Mg0T5Mr0=;
  b=bYm64uWSf4lrqgjQNslGr2MhOaS9oxakL7N1bCAAoPzv9+rpDCTrRsGc
   +dmVA5kxKMA3DycHvy7JKKpeTNJ1n1y88+qnGkjIK+HW45akEXI4lUbws
   ovfyAxqAfyWXYrOMw9IOdiOQ5raRpdJ1VBI9DJOBOYbEsOuFHzgqplaxK
   +XtXpqokELQornAlCHz747oy6+YbK1ZnpGd9zmGFX5c3s3jcXkXuPL2L/
   HnLHZu0jeik2tgiRJ7Ja1PEHhZ+lmXp5upCmn1+ZdroS5vDaS0CCc1wXE
   hnjdfRfZdsF4qfJApxQsIz/eWDq2JmM6TIG7hHwBhqhI9Om7VO8nD8IS2
   g==;
X-CSE-ConnectionGUID: 0ymcC57hT42tcEC1+e+o0w==
X-CSE-MsgGUID: 0xuVP6ZnRXGXiqvA68SyZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11498574"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="11498574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 15:32:06 -0700
X-CSE-ConnectionGUID: x2nz7G+MQKGgxkXRryYSzA==
X-CSE-MsgGUID: TDqd+zJbT2asIAl2yT6m5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="23786232"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Apr 2024 15:32:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rss6M-0002ms-26;
	Fri, 05 Apr 2024 22:32:02 +0000
Date: Sat, 6 Apr 2024 06:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 93/93]
 drivers/gpu/drm/i915/i915_gpu_error.c:2439:17: error: initialization of 'int
 (*)(struct file *, void *)' from incompatible pointer type 'ssize_t
 (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct
 file *, char *, long unsigned int,  l...
Message-ID: <202404060654.YXVrfqR8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   025d6230e73400e8c46ec29a297b9bca08f36f6f
commit: 025d6230e73400e8c46ec29a297b9bca08f36f6f [93/93] REMOVE ->read() and ->write()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060654.YXVrfqR8-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060654.YXVrfqR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060654.YXVrfqR8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915_gpu_error.c:2439:10: error: 'const struct file_operations' has no member named 'read'
    2439 |         .read = gpu_state_read,
         |          ^~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:2439:17: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    2439 |         .read = gpu_state_read,
         |                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:2439:17: note: (near initialization for 'i915_gpu_info_fops')
>> drivers/gpu/drm/i915/i915_gpu_error.c:2439:17: error: initialization of 'int (*)(struct file *, void *)' from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/gpu/drm/i915/i915_gpu_error.c:2439:17: note: (near initialization for 'i915_gpu_info_fops.flush')
   drivers/gpu/drm/i915/i915_gpu_error.c:2476:10: error: 'const struct file_operations' has no member named 'read'
    2476 |         .read = gpu_state_read,
         |          ^~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:2476:17: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    2476 |         .read = gpu_state_read,
         |                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:2476:17: note: (near initialization for 'i915_error_state_fops')
   drivers/gpu/drm/i915/i915_gpu_error.c:2476:17: error: initialization of 'int (*)(struct file *, void *)' from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/gpu/drm/i915/i915_gpu_error.c:2476:17: note: (near initialization for 'i915_error_state_fops.flush')
   drivers/gpu/drm/i915/i915_gpu_error.c:2477:10: error: 'const struct file_operations' has no member named 'write'
    2477 |         .write = i915_error_state_write,
         |          ^~~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:2477:18: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    2477 |         .write = i915_error_state_write,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:2477:18: note: (near initialization for 'i915_error_state_fops')
>> drivers/gpu/drm/i915/i915_gpu_error.c:2477:18: error: initialization of 'int (*)(struct inode *, struct file *)' from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, const char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/gpu/drm/i915/i915_gpu_error.c:2477:18: note: (near initialization for 'i915_error_state_fops.release')
   drivers/gpu/drm/i915/i915_gpu_error.c:2479:20: warning: initialized field overwritten [-Woverride-init]
    2479 |         .release = gpu_state_release,
         |                    ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:2479:20: note: (near initialization for 'i915_error_state_fops.release')
   cc1: some warnings being treated as errors


vim +2439 drivers/gpu/drm/i915/i915_gpu_error.c

4fca51984371d9 Jani Nikula 2023-10-31  2435  
4fca51984371d9 Jani Nikula 2023-10-31  2436  static const struct file_operations i915_gpu_info_fops = {
4fca51984371d9 Jani Nikula 2023-10-31  2437  	.owner = THIS_MODULE,
4fca51984371d9 Jani Nikula 2023-10-31  2438  	.open = i915_gpu_info_open,
4fca51984371d9 Jani Nikula 2023-10-31 @2439  	.read = gpu_state_read,
4fca51984371d9 Jani Nikula 2023-10-31  2440  	.llseek = default_llseek,
4fca51984371d9 Jani Nikula 2023-10-31  2441  	.release = gpu_state_release,
4fca51984371d9 Jani Nikula 2023-10-31  2442  };
4fca51984371d9 Jani Nikula 2023-10-31  2443  
4fca51984371d9 Jani Nikula 2023-10-31  2444  static ssize_t
4fca51984371d9 Jani Nikula 2023-10-31  2445  i915_error_state_write(struct file *filp,
4fca51984371d9 Jani Nikula 2023-10-31  2446  		       const char __user *ubuf,
4fca51984371d9 Jani Nikula 2023-10-31  2447  		       size_t cnt,
4fca51984371d9 Jani Nikula 2023-10-31  2448  		       loff_t *ppos)
4fca51984371d9 Jani Nikula 2023-10-31  2449  {
4fca51984371d9 Jani Nikula 2023-10-31  2450  	struct i915_gpu_coredump *error = filp->private_data;
4fca51984371d9 Jani Nikula 2023-10-31  2451  
4fca51984371d9 Jani Nikula 2023-10-31  2452  	if (!error)
4fca51984371d9 Jani Nikula 2023-10-31  2453  		return 0;
4fca51984371d9 Jani Nikula 2023-10-31  2454  
4fca51984371d9 Jani Nikula 2023-10-31  2455  	drm_dbg(&error->i915->drm, "Resetting error state\n");
4fca51984371d9 Jani Nikula 2023-10-31  2456  	i915_reset_error_state(error->i915);
4fca51984371d9 Jani Nikula 2023-10-31  2457  
4fca51984371d9 Jani Nikula 2023-10-31  2458  	return cnt;
4fca51984371d9 Jani Nikula 2023-10-31  2459  }
4fca51984371d9 Jani Nikula 2023-10-31  2460  
4fca51984371d9 Jani Nikula 2023-10-31  2461  static int i915_error_state_open(struct inode *inode, struct file *file)
4fca51984371d9 Jani Nikula 2023-10-31  2462  {
4fca51984371d9 Jani Nikula 2023-10-31  2463  	struct i915_gpu_coredump *error;
4fca51984371d9 Jani Nikula 2023-10-31  2464  
4fca51984371d9 Jani Nikula 2023-10-31  2465  	error = i915_first_error_state(inode->i_private);
4fca51984371d9 Jani Nikula 2023-10-31  2466  	if (IS_ERR(error))
4fca51984371d9 Jani Nikula 2023-10-31  2467  		return PTR_ERR(error);
4fca51984371d9 Jani Nikula 2023-10-31  2468  
4fca51984371d9 Jani Nikula 2023-10-31  2469  	file->private_data  = error;
4fca51984371d9 Jani Nikula 2023-10-31  2470  	return 0;
4fca51984371d9 Jani Nikula 2023-10-31  2471  }
4fca51984371d9 Jani Nikula 2023-10-31  2472  
4fca51984371d9 Jani Nikula 2023-10-31  2473  static const struct file_operations i915_error_state_fops = {
4fca51984371d9 Jani Nikula 2023-10-31  2474  	.owner = THIS_MODULE,
4fca51984371d9 Jani Nikula 2023-10-31  2475  	.open = i915_error_state_open,
4fca51984371d9 Jani Nikula 2023-10-31  2476  	.read = gpu_state_read,
4fca51984371d9 Jani Nikula 2023-10-31 @2477  	.write = i915_error_state_write,
4fca51984371d9 Jani Nikula 2023-10-31  2478  	.llseek = default_llseek,
4fca51984371d9 Jani Nikula 2023-10-31  2479  	.release = gpu_state_release,
4fca51984371d9 Jani Nikula 2023-10-31  2480  };
4fca51984371d9 Jani Nikula 2023-10-31  2481  

:::::: The code at line 2439 was first introduced by commit
:::::: 4fca51984371d930a5d9d5a8b0848b892dbfdecc drm/i915: move gpu error debugfs to i915_gpu_error.c

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
