Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC83839D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 16:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712421885; cv=none; b=ju+6+HLdwW3z+vdBlneoMVXH5Yu7I3mECzU+cLluz19T8ni3xZu/Lm4PNxm5xe19jVTRkv141oOWS51Uv6QYhLVZ+biPeIgsoMDsRC5+popZ/YcQFlwXYr1cviNIaH+dT9cmgh0y1XXDz3AX3MajGZ1s5k9rx7WUTEdXbgfza+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712421885; c=relaxed/simple;
	bh=RQAcKaQLX7PlsPSQOYJB9EX5VZP3cqoY5uXA3V+o3FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rzvnQDFSur+LAWMWDe+oCNOYpbKbcY8L7ezIgSFslVTbdKgq7Oab0wHP07X/NcKUm8jSXL4APnvNVvTZ7KV5gyvq4NJlxXRgVjYYOO/0HjkfZcB5gdCurNWkWmHt7br6/M4/Q0Umi3wCN1L0b+4UN0TY7pYVssyAUaactkXuJXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5zQ2gxm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5zQ2gxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712421884; x=1743957884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQAcKaQLX7PlsPSQOYJB9EX5VZP3cqoY5uXA3V+o3FQ=;
  b=K5zQ2gxmFBmRmPe5TBUbLp2z4WVr9gn84hj3vDlOMeO50AY+/59abNwF
   LV9G6h0P5BdLMvevyO9IduCyDCMGtuor5WqdBNcbJ4owDjRm/bHKyc+fD
   dJkmaer+r/njBu07Pq0z13cl7EyaxqnLNeETFbrrXgzFzNplx+3k0psep
   rexMiBA/WA4S0DDZpaaxTY8S9vWaVLxN1W8vSCiY7CcZD+ZyiWofLPvAx
   jm0r0SAYfCJmprLhu9agCEoSk55I+FofERzYu3eLYgYMFzj/1CZbWFETP
   2jpc5nwrChqqJ9JzkGtqPwMHRpf2fPxUm3PcS87eAM/9fQ0HtUfElrol4
   A==;
X-CSE-ConnectionGUID: rvX7tQdvRGaT3Gql/A8RJg==
X-CSE-MsgGUID: uRIewaIuR7uhynOJByYFBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7619301"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="7619301"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 09:44:43 -0700
X-CSE-ConnectionGUID: cZ6IYA82QY6/Kdv4lNhMgw==
X-CSE-MsgGUID: jYSCsDrQRlKUPIk6SG3Jgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="42626689"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2024 09:44:41 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rt99j-0003fs-0d;
	Sat, 06 Apr 2024 16:44:39 +0000
Date: Sun, 7 Apr 2024 00:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 105/105] drivers/rtc/rtc-m41t80.c:850:19:
 error: initialization of 'ssize_t (*)(struct file *, loff_t *, struct
 pipe_inode_info *, size_t,  unsigned int)' {aka 'int (*)(struct file *, long
 long int *, struct pipe_inode_info *, unsigned int,  unsigned int)'} from
 i...
Message-ID: <202404070038.I8Vomhr5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f5a71066e2fa8ca66dd137e17bac2e2090b3802d
commit: 941c541566a6784beff5ef54ed880c606e3a6225 [105/105] REMOVE ->read() and ->write()
config: i386-randconfig-063-20240406 (https://download.01.org/0day-ci/archive/20240407/202404070038.I8Vomhr5-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070038.I8Vomhr5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070038.I8Vomhr5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-m41t80.c:847:10: error: 'const struct file_operations' has no member named 'read'
     847 |         .read   = wdt_read,
         |          ^~~~
   drivers/rtc/rtc-m41t80.c:847:19: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     847 |         .read   = wdt_read,
         |                   ^~~~~~~~
   drivers/rtc/rtc-m41t80.c:847:19: note: (near initialization for 'wdt_fops')
   drivers/rtc/rtc-m41t80.c:847:19: error: initialization of 'int (*)(int,  struct file *, int)' from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, char *, unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/rtc/rtc-m41t80.c:847:19: note: (near initialization for 'wdt_fops.fasync')
   drivers/rtc/rtc-m41t80.c:850:10: error: 'const struct file_operations' has no member named 'write'
     850 |         .write  = wdt_write,
         |          ^~~~~
   drivers/rtc/rtc-m41t80.c:850:19: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     850 |         .write  = wdt_write,
         |                   ^~~~~~~~~
   drivers/rtc/rtc-m41t80.c:850:19: note: (near initialization for 'wdt_fops')
>> drivers/rtc/rtc-m41t80.c:850:19: error: initialization of 'ssize_t (*)(struct file *, loff_t *, struct pipe_inode_info *, size_t,  unsigned int)' {aka 'int (*)(struct file *, long long int *, struct pipe_inode_info *, unsigned int,  unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, const char *, unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/rtc/rtc-m41t80.c:850:19: note: (near initialization for 'wdt_fops.splice_read')
   cc1: some warnings being treated as errors


vim +850 drivers/rtc/rtc-m41t80.c

617780d290bd6e Atsushi Nemoto 2007-07-17  844  
617780d290bd6e Atsushi Nemoto 2007-07-17  845  static const struct file_operations wdt_fops = {
617780d290bd6e Atsushi Nemoto 2007-07-17  846  	.owner	= THIS_MODULE,
617780d290bd6e Atsushi Nemoto 2007-07-17  847  	.read	= wdt_read,
55929332c92e5d Arnd Bergmann  2010-04-27  848  	.unlocked_ioctl = wdt_unlocked_ioctl,
b6dfb2477fb0bf Arnd Bergmann  2019-06-03  849  	.compat_ioctl = compat_ptr_ioctl,
617780d290bd6e Atsushi Nemoto 2007-07-17 @850  	.write	= wdt_write,
617780d290bd6e Atsushi Nemoto 2007-07-17  851  	.open	= wdt_open,
617780d290bd6e Atsushi Nemoto 2007-07-17  852  	.release = wdt_release,
6038f373a3dc1f Arnd Bergmann  2010-08-15  853  	.llseek = no_llseek,
617780d290bd6e Atsushi Nemoto 2007-07-17  854  };
617780d290bd6e Atsushi Nemoto 2007-07-17  855  

:::::: The code at line 850 was first introduced by commit
:::::: 617780d290bd6eb2b260928c6acff5b7c6084154 rtc: watchdog support for rtc-m41t80 driver

:::::: TO: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
