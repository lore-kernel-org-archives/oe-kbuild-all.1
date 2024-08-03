Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92BD23CB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722679308; cv=none; b=sczQ+7Is0j58dGAmFp0mlL7EeoXt+zsY8pr8hF1skgcQw3PpThPE6MQfRIohttNYQIzmPjQo7sc5aEmJ59KTX0/fpYeCa+qPkxHWfi4vlfH2BltCgwqwOfNMNOxM03ABlbsjNpWWcrKvGrhW7JC8WVh0QxUKAgQuZyxIRgHmiLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722679308; c=relaxed/simple;
	bh=/A+IBVhb690Htlj0E2Lmq1Jr/UByXPuTcpbtZVYGeG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qBx5tFoJwGV4COncNWjgkNlA8vUpGilW68fbnFLk3B0+S1V1hoy0kEZowyxrscwHLKWsPePXAgzJc3cj6SynCMocQm/TrT3tJrssdgFdCCRaDvwg2SwZg6OPuCiFeEAvUlah2x0+AdhtW3DBpSPJGWrJ6Pf543Hk9kzGbS1p+qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8C1t6mJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8C1t6mJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722679306; x=1754215306;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/A+IBVhb690Htlj0E2Lmq1Jr/UByXPuTcpbtZVYGeG0=;
  b=D8C1t6mJkTLldrXAvPhCMrMJWe8l8XlQJJdUf3tZyVubu9iPDHc+Iec8
   /am5geFhsTbJBuR/gohljHUMq1F7hFu/im4pCgO//9cEuc0XUzU5ngUKH
   sO9KC7NjPYR8XE91VlFwHRrybu4Yzwrmc28fqWG1aGRYStFqAAojEJVZZ
   /HxnQKnRa/+UKI4UizjVU3GClqCVxDYj8kwG9Z5ql6W8eFztx/3M7/gLF
   xltZXjqMmITGvATmEbMreGvYU0YM+uELb0xfKN7WJNMo2vX1rHqRjMroV
   NcJl9xVkK07aZTOOqGlIF8SrnUEVNRJk8Qu5iuizUaWiRYfHOpZk+WgQs
   w==;
X-CSE-ConnectionGUID: 9HC2gAZhTnih3a67ApL60w==
X-CSE-MsgGUID: koWcE6KWTkqGXYkDi0Y7ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20645702"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20645702"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 03:01:45 -0700
X-CSE-ConnectionGUID: 7qF+JCAqSXimoubeZA/43Q==
X-CSE-MsgGUID: s3CsDGi0RDidWtSbmTGcOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="59817492"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2024 03:01:43 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saBa1-0000ME-1E;
	Sat, 03 Aug 2024 10:01:41 +0000
Date: Sat, 3 Aug 2024 18:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 440/440] crypto/jitterentropy-testing.c:275:17:
 error: initialization of 'unsigned int' from 'ssize_t (*)(struct file *,
 char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, char *, unsigned
 int,  long long int *)'} makes integer from pointer without a cast
Message-ID: <202408031740.YLtJa0T0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   b9521a4573f2ff4bd91ee66d23e4c41e8e4fab6b
commit: b9521a4573f2ff4bd91ee66d23e4c41e8e4fab6b [440/440] fs: finally remove ->read() and ->write() from file_operations
config: arm-randconfig-002-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031740.YLtJa0T0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031740.YLtJa0T0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031740.YLtJa0T0-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/jitterentropy-testing.c:275:10: error: 'const struct file_operations' has no member named 'read'
     275 |         .read = jent_raw_hires_read,
         |          ^~~~
   crypto/jitterentropy-testing.c:275:17: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     275 |         .read = jent_raw_hires_read,
         |                 ^~~~~~~~~~~~~~~~~~~
   crypto/jitterentropy-testing.c:275:17: note: (near initialization for 'jent_raw_hires_fops')
>> crypto/jitterentropy-testing.c:275:17: error: initialization of 'unsigned int' from 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, char *, unsigned int,  long long int *)'} makes integer from pointer without a cast [-Wint-conversion]
   crypto/jitterentropy-testing.c:275:17: note: (near initialization for 'jent_raw_hires_fops.fop_flags')
   cc1: some warnings being treated as errors


vim +275 crypto/jitterentropy-testing.c

69f1c387ba700f Stephan Müller 2023-04-21  272  
69f1c387ba700f Stephan Müller 2023-04-21  273  static const struct file_operations jent_raw_hires_fops = {
69f1c387ba700f Stephan Müller 2023-04-21  274  	.owner = THIS_MODULE,
69f1c387ba700f Stephan Müller 2023-04-21 @275  	.read = jent_raw_hires_read,
69f1c387ba700f Stephan Müller 2023-04-21  276  };
69f1c387ba700f Stephan Müller 2023-04-21  277  

:::::: The code at line 275 was first introduced by commit
:::::: 69f1c387ba700f69e9fdad6d6ce44a3bb774dbff crypto: jitter - add interface for gathering of raw entropy

:::::: TO: Stephan Müller <smueller@chronox.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
