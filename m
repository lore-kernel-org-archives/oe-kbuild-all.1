Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AB539E176
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 18:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780511641; cv=none; b=JU3N3A0cAGLXwwY+JPjwD9gLbwR8qpDvkHUSfrtSRe0lWExVdmVaP0d5F7LWmoVElBRTT5c3GWOAk6YyJAYiompuXGwbF3CjAptezjAtNnNHzEXk7IUjK9XDwy9CkjBT4t1+fYHXzvK3E98gZ/X7Y/O//47DJgH0DB9cI6bNG4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780511641; c=relaxed/simple;
	bh=ciJHwCDkfoMZJfvvqPCKKP4tntr89QSQvSUThfJvadQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b5Ii9w5RTzQZQ2Xb87p8LM1eQDqNoY13wPxBQxlfDCJj/AH2MjOreosoLjGcrnPwbypQOBRfyh4gRxVptpf+65N21HsUA78EvAKBMcZWWMbrM/MfJtUZgBbcTU+fQFDh9HxAwQyrsJxb6IwDCIfbP+Piiem7nScVNMnnKKDSpkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFOXMU5l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFOXMU5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780511637; x=1812047637;
  h=date:from:to:cc:subject:message-id;
  bh=ciJHwCDkfoMZJfvvqPCKKP4tntr89QSQvSUThfJvadQ=;
  b=CFOXMU5l99jnmcYf1h8YtnlrrUMDGnfH6fiOzDwuzqp4IzE1KVxzJMYs
   kTcZS0pKK6RMRco2x3H5Lyk574MKzwfwMt4vttA962HPGm7Wb1TJVucfO
   Tvl8vTxbilvdITMoulHWP4YqcyOg5JKMGPj0mLwFokS9WVw15yT5XUpJj
   w0rdHHK54U5fr8rf8z8bM4O7B57lKj0g1uvkmvpJEY2uxw1UDJBWB4zyq
   ncDt9CR/znjG1jjtDXFFq5e8xWv3hTqFLRgmhvsW2/CK7FE6pWZgyoRqw
   W3GiVT9yKI4L8gWJfL0N/1FCYIRwHZAE+pbN3HzllOopnVF3cIpkk02hz
   w==;
X-CSE-ConnectionGUID: WPitAl5ERheR7lnZkENaGg==
X-CSE-MsgGUID: 3nutoFZ8RIuybWPtbie3sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92816321"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="92816321"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 11:33:57 -0700
X-CSE-ConnectionGUID: 4+BitZkJTXuNNszvVpwtYg==
X-CSE-MsgGUID: ZKXgMdl5QCq4q/DdHGvlzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="267977147"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jun 2026 11:33:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUqPY-00000000Dle-2pfU;
	Wed, 03 Jun 2026 18:33:52 +0000
Date: Thu, 04 Jun 2026 02:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes.berg@intel.com>
Subject: drivers/iio/common/scmi_sensors/scmi_iio.c:247:1-7: WARNING:
 do_div() does a 64-by-32 division, please consider using div64_u64 instead.
Message-ID: <202606040245.XfmRpBhA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   1 year, 1 month ago
config: um-randconfig-r052-20260603 (https://download.01.org/0day-ci/archive/20260604/202606040245.XfmRpBhA-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a0e2cb6a9063 ("um: Add VFIO-based virtual PCI driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040245.XfmRpBhA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/common/scmi_sensors/scmi_iio.c:247:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
   drivers/iio/common/scmi_sensors/scmi_iio.c:507:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
   drivers/iio/common/scmi_sensors/scmi_iio.c:273:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
   drivers/iio/common/scmi_sensors/scmi_iio.c:166:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

vim +247 drivers/iio/common/scmi_sensors/scmi_iio.c

f774117c96f94c Jyoti Bhayana 2021-03-09  238  
f774117c96f94c Jyoti Bhayana 2021-03-09  239  static void convert_ns_to_freq(u64 interval_ns, u64 *hz, u64 *uhz)
f774117c96f94c Jyoti Bhayana 2021-03-09  240  {
f774117c96f94c Jyoti Bhayana 2021-03-09  241  	u64 rem, freq;
f774117c96f94c Jyoti Bhayana 2021-03-09  242  
f774117c96f94c Jyoti Bhayana 2021-03-09  243  	freq = NSEC_PER_SEC;
f774117c96f94c Jyoti Bhayana 2021-03-09  244  	rem = do_div(freq, interval_ns);
f774117c96f94c Jyoti Bhayana 2021-03-09  245  	*hz = freq;
f774117c96f94c Jyoti Bhayana 2021-03-09  246  	*uhz = rem * 1000000UL;
f774117c96f94c Jyoti Bhayana 2021-03-09 @247  	do_div(*uhz, interval_ns);
f774117c96f94c Jyoti Bhayana 2021-03-09  248  }
f774117c96f94c Jyoti Bhayana 2021-03-09  249  

:::::: The code at line 247 was first introduced by commit
:::::: f774117c96f94c7c4d2f076e4cacc80218b0df48 iio/scmi: Adding support for IIO SCMI Based Sensors

:::::: TO: Jyoti Bhayana <jbhayana@google.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
