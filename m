Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A9B12EBE6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 13:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712668689; cv=none; b=HuF3FSm4saxfCphUW2EDYvOIcc5I867NFCNdflAKrm9J32zcjShB34ZfiS9asWwPkZz3cbRapY5MMO5i/kdw+RMSIyqdfvvxHcqv1FRDfScsdbrTtXb07WRWGT9PD+p0+HZhHjzUyKaUmh3mRYAvUVyqd3gwjP0+jeekFKa8P2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712668689; c=relaxed/simple;
	bh=MhrD2x9WLW48yb7aw143VCAmkj65zimDvpKUhlQ3eUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ekS58ojQ3njepmyuQBUn2D4zQTwMD9GzKaScoNwl6HhcfhY00BuqMraDLhVkhqoANfvFk8rVgEdBJBuR7Ef5Puf127lH1W5+YXFVLABxnGhAeQczqEhTKyuEGAmTvJVHnxSnfhirUr//V+XVTmVNAdU0h5GKK3ofYm9XSjjiAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAy2RStL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAy2RStL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712668688; x=1744204688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MhrD2x9WLW48yb7aw143VCAmkj65zimDvpKUhlQ3eUs=;
  b=HAy2RStLgoZbEPJ7lOtRQo1q3IUyPzX6q7CAEdL8qL8PcX7YjQsu3gRj
   CsWNTUTVr6OvMtnuGIN0vH6AdWQXJ986H77OCOjzkjXJjhBhoHMUUIJrm
   2XA65OI3rTbQptZjEuRK6ONA8JaIX9PgWhCJC2t1aP5TsM4aKUdtuz7EG
   abCIJdzQ12/SzeRptN6bdwrBwaLREpOe0p0nbiAMHR3E73nzfxRX9FNX3
   PWKZBqhGsXd36/fETYfYSe26LVj7Qk3uEAlNEIvFXaIKMaPDcHdMkHJn4
   WB6eunGyD6VrnilIZCPR7VPb6gMzC17uw8By8OAh/4N4DcgZn6TEQXytK
   Q==;
X-CSE-ConnectionGUID: v1HkizKVSheIibJrgYp39Q==
X-CSE-MsgGUID: NdT2kM4uT+2fMXOUaH1y5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19363292"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="19363292"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 06:18:07 -0700
X-CSE-ConnectionGUID: ZUsLw0lfS2+U/YMp5zRaAA==
X-CSE-MsgGUID: 7SkHRfWpTKa5zrCWrvc0ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="24952071"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Apr 2024 06:18:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruBMR-00066Y-2x;
	Tue, 09 Apr 2024 13:18:03 +0000
Date: Tue, 9 Apr 2024 21:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 84/238]
 drivers/platform/x86/intel/pmc/core.c:539:35: error: 'userbuf' undeclared;
 did you mean 'user'?
Message-ID: <202404092158.O7XPtg0g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8d5e62882d13747268ce489ec43048c8eff31b7a
commit: a387b5fdb54ccafed9cba198daefd9ea6cedc8ac [84/238] drivers/platform: convert to ->read_iter and ->write_iter
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240409/202404092158.O7XPtg0g-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404092158.O7XPtg0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404092158.O7XPtg0g-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/intel/pmc/core.c: In function 'pmc_core_ltr_ignore_write':
>> drivers/platform/x86/intel/pmc/core.c:539:35: error: 'userbuf' undeclared (first use in this function); did you mean 'user'?
     539 |         err = kstrtou32_from_user(userbuf, buf_size, 10, &value);
         |                                   ^~~~~~~
         |                                   user
   drivers/platform/x86/intel/pmc/core.c:539:35: note: each undeclared identifier is reported only once for each function it appears in


vim +539 drivers/platform/x86/intel/pmc/core.c

36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  527  
a387b5fdb54cca drivers/platform/x86/intel/pmc/core.c Jens Axboe        2024-04-04  528  static ssize_t pmc_core_ltr_ignore_write(struct kiocb *iocb,
a387b5fdb54cca drivers/platform/x86/intel/pmc/core.c Jens Axboe        2024-04-04  529  					 struct iov_iter *from)
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  530  {
a387b5fdb54cca drivers/platform/x86/intel/pmc/core.c Jens Axboe        2024-04-04  531  	struct seq_file *s = iocb->ki_filp->private_data;
7dc4dc563dd40c drivers/platform/x86/intel_pmc_core.c David E. Box      2021-04-16  532  	struct pmc_dev *pmcdev = s->private;
a387b5fdb54cca drivers/platform/x86/intel/pmc/core.c Jens Axboe        2024-04-04  533  	size_t count = iov_iter_count(from);
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  534  	u32 buf_size, value;
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  535  	int err;
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  536  
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  537  	buf_size = min_t(u32, count, 64);
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  538  
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19 @539  	err = kstrtou32_from_user(userbuf, buf_size, 10, &value);
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  540  	if (err)
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  541  		return err;
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  542  
6f9cc5c1f94daa drivers/platform/x86/intel/pmc/core.c David E. Box      2023-12-22  543  	err = pmc_core_send_ltr_ignore(pmcdev, value, 1);
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  544  
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  545  	return err == 0 ? count : err;
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  546  }
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  547  

:::::: The code at line 539 was first introduced by commit
:::::: 36974daf53888e5eac986517b5ffac5bdd47b74d platform/x86: intel_pmc_core: Ignore GBE LTR on Tiger Lake platforms

:::::: TO: David E. Box <david.e.box@linux.intel.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
