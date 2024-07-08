Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B6A14A96
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 05:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720418045; cv=none; b=p0CeRDCUFhUyZj9CgBXAqmYeWM+Pnxl3TUUR+7B9XMGqoOfYHu3i56NpWwdtrMm9vYrm+2zkuPAy3rZCmH5NWnXb+2qV4gAQkDI309pAwwUuNDvcJkHCPRvJ5Wnmmod7ZLmNDawd3kEf7RitoWpT8A7FxMe+TvnRisLYjlvMQwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720418045; c=relaxed/simple;
	bh=4wvYo9y0TdCmOTEH9j7P1x3uLQQ7twyOpRhrTRb7bKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LH1nfB6Ae3kMmqEpusjEjJLpqW+NLXNNlu+PoWI+xea3zJlGSZGH7EI8CJAZdbIEeJZytZz4wveOVysc83WBkK/Q++ylIFWjbHhnJv4nMn9Zp9O/mbhYCJUWzQtISyLBIftziKTLFGZ2B4nBvN3Svl6W9N8G8gQc2DGW6bzCekE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XS7CgcTC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XS7CgcTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720418043; x=1751954043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4wvYo9y0TdCmOTEH9j7P1x3uLQQ7twyOpRhrTRb7bKQ=;
  b=XS7CgcTCA5Qm7bal2cZ+wE5wFxV23q5Dr6D6smdyPzGKwrKdyYdPYbIv
   lvmZFBPz4eQ5jrHY5bDqf5yG26N1aLJ64Us5xS4o5aZhIJIBpVBKlPafe
   qUEJ1FjzSWZ0FotMYWOE5tri8P4PHLnWYkQ7pZKeTzdKgFx4Z0C7HiAJv
   +8hrg1CM2jEcIdAA403DX2n78WTC8Id01UTOea1YdlW8D2dPXrW4etkYd
   Ehv8AtLe8QUh6t2xBuf2gebjmiVfq0pV+Kg3LejDSh+OsF7yk9+43D1ma
   QoGuzZ1SdMFrjt/b0jG7HAa09Nt42TGx77aP6Sgc4Rfdj93zTy8KqUh8e
   A==;
X-CSE-ConnectionGUID: F0QU3jSRS5aaRsdapWKg1w==
X-CSE-MsgGUID: 1CWB5ItbQTOSzra/dBYgzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="35135370"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="35135370"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 22:54:03 -0700
X-CSE-ConnectionGUID: TFteQCkRRV+w4ido5ffJqg==
X-CSE-MsgGUID: FsQEu62+RlSDL44D5Rq23A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="51830800"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jul 2024 22:54:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQhK3-000VXI-2x;
	Mon, 08 Jul 2024 05:53:59 +0000
Date: Mon, 8 Jul 2024 13:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Gerhard Engleder <eg@keba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-testing 28/53] cp500.c:undefined reference to
 `auxiliary_device_init'
Message-ID: <202407081327.2DR4Ltu9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   1ebab783647a9e3bf357002d5c4ff060c8474a0a
commit: a1944676767e855869b6af8e1c7e185372feaf31 [28/53] misc: keba: Add basic KEBA CP500 system FPGA support
config: loongarch-randconfig-r132-20240708 (https://download.01.org/0day-ci/archive/20240708/202407081327.2DR4Ltu9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240708/202407081327.2DR4Ltu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407081327.2DR4Ltu9-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/misc/keba/cp500.o: in function `cp500_register_i2c':
>> cp500.c:(.text+0x7bc): undefined reference to `auxiliary_device_init'
>> loongarch64-linux-ld: cp500.c:(.text+0x7e8): undefined reference to `__auxiliary_device_add'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
