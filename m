Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE2199236
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736289103; cv=none; b=LXZAnujLSCcqgkbuOarMxtovd6GYh7f/bl4zZHkQQGVQg0vIETKP10fs8+UYIq2Wpm+uYKTehA4RRxih7hoKxM54z19ULnklJTWq081At/dfXOqVK2sDnIuruipXWffxaOK9myyqsCMUqzhVEQLomgb+gMi5PDfNx/cw+5cvmtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736289103; c=relaxed/simple;
	bh=V7nc0aVPbamCttUbdY5n7u40K4BQOF/3V/j+CmZQjYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pcms/BK7YtN/RkNN/4DtE98XpWyBk/qhTNXXlJAID3MbOHFYTUaq1LFxYdVWkYptQpq/guOcq+zU4Iq0uIYpgxW7Qn83M7IT5dwNJa4EFO/SzC1UG3B4BZ7YiZP/UVtK0K2Pb1A6nsNmbv+DO/OFrnEDhVVzi848kui3mJsYTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FglwO8eG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FglwO8eG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736289101; x=1767825101;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=V7nc0aVPbamCttUbdY5n7u40K4BQOF/3V/j+CmZQjYc=;
  b=FglwO8eGB6RREOyz/azQ076Mt69OSMiMgrIi8WAe7e2KqlY8Rs3YJa+I
   Amr5k0fym0UxdKgIP2Qzvc/kXwoaHcMx61qgXbphkAc+WAtvO0wdhFhT8
   PLfTT54YLyoFdm5NaTrvcFmOlaQ47hxwkp0Qr8U+WMntrS83/2rjrx/F4
   blsFY+aic9pDTO74HaoHuzVmdrjjH3nYtj+WIeDt1q2OxgRM+Eq4Ex3lO
   0lRrU4L8IUXCGGMNuFiGSdoe354ySfCEIeG5Xlnah47MceleiyO2468w9
   NN1dSfvYskpvEmcxmiRaUpN/DAxOuPAaqsRdDuf+woeohTOyZe0HRl3AS
   Q==;
X-CSE-ConnectionGUID: Ah2rnkjsQCixZbWOPw3gpA==
X-CSE-MsgGUID: rNaOJz7FTyaS5jLFXiU78Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36713418"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36713418"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 14:31:41 -0800
X-CSE-ConnectionGUID: TrnlpHRJRpCSXkz9MB93wg==
X-CSE-MsgGUID: VqQa1VOtRFK4WWNSJRE6Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="133754546"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jan 2025 14:31:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVI6r-000FIR-2V;
	Tue, 07 Jan 2025 22:31:37 +0000
Date: Wed, 8 Jan 2025 06:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 63/64]
 include/linux/sysfs.h:387:34: error: initialization of 'ssize_t (*)(struct
 file *, struct kobject *, const struct bin_attribute *, char *, loff_t,
  size_t)' {aka 'int (*)(struct file *, struct kobject *, const struct
 bin_attribute *, char *, long long int...
Message-ID: <202501080655.PRQU9F6E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   1c76e0940bd2d02a30ddaf76ef5bcb648c3fffb1
commit: da56a14a657e9763156eeac71d74f3d73bcb11f5 [63/64] read/write
config: i386-buildonly-randconfig-002-20250108 (https://download.01.org/0day-ci/archive/20250108/202501080655.PRQU9F6E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080655.PRQU9F6E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080655.PRQU9F6E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from kernel/ksysfs.c:10:
>> include/linux/sysfs.h:387:34: error: initialization of 'ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long int,  unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long int,  unsigned int)'} [-Werror=incompatible-pointer-types]
     387 |         __BIN_ATTR(_name, _mode, sysfs_bin_attr_simple_read, NULL, 0)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:338:17: note: in definition of macro '__BIN_ATTR'
     338 |         .read = _read,                                                  \
         |                 ^~~~~
   include/linux/sysfs.h:390:41: note: in expansion of macro '__BIN_ATTR_SIMPLE_RO'
     390 | struct bin_attribute bin_attr_##_name = __BIN_ATTR_SIMPLE_RO(_name, 0444)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   kernel/ksysfs.c:242:24: note: in expansion of macro 'BIN_ATTR_SIMPLE_RO'
     242 | static __ro_after_init BIN_ATTR_SIMPLE_RO(notes);
         |                        ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:387:34: note: (near initialization for 'bin_attr_notes.read')
     387 |         __BIN_ATTR(_name, _mode, sysfs_bin_attr_simple_read, NULL, 0)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:338:17: note: in definition of macro '__BIN_ATTR'
     338 |         .read = _read,                                                  \
         |                 ^~~~~
   include/linux/sysfs.h:390:41: note: in expansion of macro '__BIN_ATTR_SIMPLE_RO'
     390 | struct bin_attribute bin_attr_##_name = __BIN_ATTR_SIMPLE_RO(_name, 0444)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   kernel/ksysfs.c:242:24: note: in expansion of macro 'BIN_ATTR_SIMPLE_RO'
     242 | static __ro_after_init BIN_ATTR_SIMPLE_RO(notes);
         |                        ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/kobject.h:20,
                    from include/linux/module.h:21,
                    from kernel/kheaders.c:10:
>> include/linux/sysfs.h:387:34: error: initialization of 'ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long int,  unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long int,  unsigned int)'} [-Werror=incompatible-pointer-types]
     387 |         __BIN_ATTR(_name, _mode, sysfs_bin_attr_simple_read, NULL, 0)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:338:17: note: in definition of macro '__BIN_ATTR'
     338 |         .read = _read,                                                  \
         |                 ^~~~~
   kernel/kheaders.c:33:9: note: in expansion of macro '__BIN_ATTR_SIMPLE_RO'
      33 |         __BIN_ATTR_SIMPLE_RO(kheaders.tar.xz, 0444);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:387:34: note: (near initialization for 'kheaders_attr.read')
     387 |         __BIN_ATTR(_name, _mode, sysfs_bin_attr_simple_read, NULL, 0)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:338:17: note: in definition of macro '__BIN_ATTR'
     338 |         .read = _read,                                                  \
         |                 ^~~~~
   kernel/kheaders.c:33:9: note: in expansion of macro '__BIN_ATTR_SIMPLE_RO'
      33 |         __BIN_ATTR_SIMPLE_RO(kheaders.tar.xz, 0444);
         |         ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   kernel/module/sysfs.c: In function 'add_notes_attrs':
>> kernel/module/sysfs.c:193:37: error: assignment to 'ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long int,  unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long int,  unsigned int)'} [-Werror=incompatible-pointer-types]
     193 |                         nattr->read = sysfs_bin_attr_simple_read;
         |                                     ^
   cc1: some warnings being treated as errors


vim +387 include/linux/sysfs.h

9d6794feeb9090 Ira Weiny        2022-07-19  385  
ae587a509903cc Thomas Weiﬂschuh 2024-11-03  386  #define __BIN_ATTR_SIMPLE_RO(_name, _mode)				\
ae587a509903cc Thomas Weiﬂschuh 2024-11-03 @387  	__BIN_ATTR(_name, _mode, sysfs_bin_attr_simple_read, NULL, 0)
d48c03198a92ed Lukas Wunner     2024-04-06  388  

:::::: The code at line 387 was first introduced by commit
:::::: ae587a509903cca138e910445d8c21fe73b45c80 sysfs: implement all BIN_ATTR_* macros in terms of __BIN_ATTR()

:::::: TO: Thomas Weiﬂschuh <linux@weissschuh.net>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
