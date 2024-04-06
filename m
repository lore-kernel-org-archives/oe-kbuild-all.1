Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A79381A4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 22:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712442834; cv=none; b=mR7Oo4CkPGHLpznFszYZgr+Q8oEFBlUgebJtj1kFyfL/Ttag7LxWAB2cF33hmiFRlAU/WUzS35GtTYfKQWfQch0b4PgYiQ5iH0tckI/YNgauRvTiiN/8YegksuoeFhYHZsPL/wCx89nFxOtT4NeGoaNrQMj1Q4aLPcC3hP3G09s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712442834; c=relaxed/simple;
	bh=h4bDTk6JvxXlX4XeJAlYClkJjbpqfMWdT0ZNxVCLxZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sdLp04ItpXj+k//6pD+ZC0HNVIM+CU/EoQfTUXV+CjT55dOFHFd6uMFE9yMYaboMdlHkLdpapQCA3f3K/8On1mWb7IOLdK00KyrQ95lpZzHIHYIpI1eTQcqCjua5EW7qkGt5fXXnOmIkiMJpMl1cZc1XJoEj0zOFsuXfgW1MP3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQLPAOmY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQLPAOmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712442833; x=1743978833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h4bDTk6JvxXlX4XeJAlYClkJjbpqfMWdT0ZNxVCLxZc=;
  b=dQLPAOmYKaX8gyX+e64auB/6FFfCX87RlBqqNZZfSXAsKiqO8L3S/Ree
   6oGQ/QfW12EugDmpKJF33lFH2V4T6FXzbGOacrLEBajKfMUKd80uNU7v4
   DtnNP16curPYntghy+DHNpoUB1WAoq64df6TtficA9SxAowKydpmdZxRu
   K2OKZyAQPumsJ8pGiWTPKuX7ueiC65n+dmL82jK2DGKerVCbgPiK2VCv8
   u0SFSrpWA6eHk8AdaTwHAT/NmIO3vM7k53tDOLMjTgn4y0z/NqL7UXUVw
   BPEMkBuI8WxCdTz2v8x3kMrYgzjDPueWByHTIc9DCXG7QwwXnhLFWZVy5
   A==;
X-CSE-ConnectionGUID: FulBjTT3QD2s3lvHhXxQhg==
X-CSE-MsgGUID: vuZw0XImRXyj7OVoTdDfsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7607956"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="7607956"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 15:33:52 -0700
X-CSE-ConnectionGUID: LZexf2BCTqSKHQ4eRUdCeQ==
X-CSE-MsgGUID: MDcmo+X+R9KB5PeSH/FpfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="20044771"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2024 15:33:51 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtEbd-0003uI-04;
	Sat, 06 Apr 2024 22:33:49 +0000
Date: Sun, 7 Apr 2024 06:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 9/133] arch/powerpc/kernel/dawr.c:73:38: error:
 passing argument 1 of 'debugfs_write_file_bool' from incompatible pointer
 type
Message-ID: <202404070610.RCab7C38-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100
commit: d96e5fb1de409722fee4d4943e5e068935321ff7 [9/133] debugfs: convert to ->read_iter()
config: powerpc-microwatt_defconfig (https://download.01.org/0day-ci/archive/20240407/202404070610.RCab7C38-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070610.RCab7C38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070610.RCab7C38-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/dawr.c: In function 'dawr_write_file_bool':
>> arch/powerpc/kernel/dawr.c:73:38: error: passing argument 1 of 'debugfs_write_file_bool' from incompatible pointer type [-Werror=incompatible-pointer-types]
      73 |         rc = debugfs_write_file_bool(iocb, from);
         |                                      ^~~~
         |                                      |
         |                                      struct kiocb *
   In file included from arch/powerpc/kernel/dawr.c:11:
   include/linux/debugfs.h:383:60: note: expected 'struct file *' but argument is of type 'struct kiocb *'
     383 | static inline ssize_t debugfs_write_file_bool(struct file *file,
         |                                               ~~~~~~~~~~~~~^~~~
   arch/powerpc/kernel/dawr.c:73:44: error: passing argument 2 of 'debugfs_write_file_bool' from incompatible pointer type [-Werror=incompatible-pointer-types]
      73 |         rc = debugfs_write_file_bool(iocb, from);
         |                                            ^~~~
         |                                            |
         |                                            struct iov_iter *
   include/linux/debugfs.h:384:66: note: expected 'const char *' but argument is of type 'struct iov_iter *'
     384 |                                               const char __user *user_buf,
         |                                               ~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> arch/powerpc/kernel/dawr.c:73:14: error: too few arguments to function 'debugfs_write_file_bool'
      73 |         rc = debugfs_write_file_bool(iocb, from);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:383:23: note: declared here
     383 | static inline ssize_t debugfs_write_file_bool(struct file *file,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/dawr.c: At top level:
>> arch/powerpc/kernel/dawr.c:85:25: error: initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka 'long int (*)(struct kiocb *, struct iov_iter *)'} from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
      85 |         .read_iter =    debugfs_read_file_bool,
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/dawr.c:85:25: note: (near initialization for 'dawr_enable_fops.read_iter')
   cc1: some warnings being treated as errors


vim +/debugfs_write_file_bool +73 arch/powerpc/kernel/dawr.c

    61	
    62	static ssize_t dawr_write_file_bool(struct kiocb *iocb, struct iov_iter *from)
    63	{
    64		struct arch_hw_breakpoint null_brk = {0};
    65		size_t rc;
    66	
    67		/* Send error to user if they hypervisor won't allow us to write DAWR */
    68		if (!dawr_force_enable &&
    69		    firmware_has_feature(FW_FEATURE_LPAR) &&
    70		    set_dawr(0, &null_brk) != H_SUCCESS)
    71			return -ENODEV;
    72	
  > 73		rc = debugfs_write_file_bool(iocb, from);
    74		if (rc)
    75			return rc;
    76	
    77		/* If we are clearing, make sure all CPUs have the DAWR cleared */
    78		if (!dawr_force_enable)
    79			smp_call_function(disable_dawrs_cb, NULL, 0);
    80	
    81		return rc;
    82	}
    83	
    84	static const struct file_operations dawr_enable_fops = {
  > 85		.read_iter =	debugfs_read_file_bool,
    86		.write_iter =	dawr_write_file_bool,
    87		.open =		simple_open,
    88		.llseek =	default_llseek,
    89	};
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
