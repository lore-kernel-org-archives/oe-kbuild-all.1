Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCC729A1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 12:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680785572; x=1712321572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1MX/SJizjQlIPyorYJr8UAbUV/oU9H3PDuRD75zvVr0=;
  b=nDEsEaPN/kCpHkkfhI1O5B5yJMwNTx0/TpLUMVaRZhKi5/j2wHhg6hZO
   6csodVIg7nfJMLxqMTT+9rTvTDd474FcPryA43FThgnVvI51MmdMP0mcQ
   e2U39bARYhtBIrrjz2F5qRYGLYLawV0880OuC5jFVz+TftI57mCkXcwqo
   Fq1DdgQiP6HIHOlNQCGoifbAHjm0H9XwFwtHp3tR7rxtUHz6TURFuz3sn
   e5zAtH8HxLioANIv7bkmeX4x4kKYmgY2a/vFzSZpuzSsD+kzX5ZAuP237
   T6wOJ1S650Pf2soAdWtWVe6wrQbhJPGmOaAZa7LVezY3s2vV6++gsyDi5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="340214955"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="340214955"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 05:52:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751637312"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="751637312"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Apr 2023 05:52:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkP6g-000RNW-2o;
	Thu, 06 Apr 2023 12:52:50 +0000
Date: Thu, 6 Apr 2023 20:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:lam-old 5/18] drivers/input/serio/serport.c:216:21: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202304062022.uKXl6VYa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git lam-old
head:   e64abde4d7ab69eee2b4d11651d989c451930292
commit: a94e74d3666c7519881ae8b80afb7bbf34d9a9c7 [5/18] x86/uaccess: Provide untagged_addr() and remove tags before address check
config: x86_64-randconfig-s053-20230403 (https://download.01.org/0day-ci/archive/20230406/202304062022.uKXl6VYa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git/commit/?id=a94e74d3666c7519881ae8b80afb7bbf34d9a9c7
        git remote add kas https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git
        git fetch --no-tags kas lam-old
        git checkout a94e74d3666c7519881ae8b80afb7bbf34d9a9c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/acpi/ drivers/input/serio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304062022.uKXl6VYa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/serio/serport.c:216:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   drivers/input/serio/serport.c:216:21: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   drivers/input/serio/serport.c:216:21: sparse:     got unsigned long *

vim +216 drivers/input/serio/serport.c

a80d8b02751060 John Sung      2014-09-09  205  
^1da177e4c3f41 Linus Torvalds 2005-04-16  206  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  207   * serport_ldisc_ioctl() allows to set the port protocol, and device ID
^1da177e4c3f41 Linus Torvalds 2005-04-16  208   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  209  
d78328bcc4d0e6 Jiri Slaby     2021-11-22  210  static int serport_ldisc_ioctl(struct tty_struct *tty, unsigned int cmd,
d78328bcc4d0e6 Jiri Slaby     2021-11-22  211  			       unsigned long arg)
^1da177e4c3f41 Linus Torvalds 2005-04-16  212  {
a80d8b02751060 John Sung      2014-09-09  213  	if (cmd == SPIOCSTYPE) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  214  		unsigned long type;
^1da177e4c3f41 Linus Torvalds 2005-04-16  215  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @216  		if (get_user(type, (unsigned long __user *) arg))
^1da177e4c3f41 Linus Torvalds 2005-04-16  217  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  218  
a80d8b02751060 John Sung      2014-09-09  219  		serport_set_type(tty, type);
a80d8b02751060 John Sung      2014-09-09  220  		return 0;
a80d8b02751060 John Sung      2014-09-09  221  	}
a80d8b02751060 John Sung      2014-09-09  222  
a80d8b02751060 John Sung      2014-09-09  223  	return -EINVAL;
a80d8b02751060 John Sung      2014-09-09  224  }
a80d8b02751060 John Sung      2014-09-09  225  

:::::: The code at line 216 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
