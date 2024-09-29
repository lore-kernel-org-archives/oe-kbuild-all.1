Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E1418EB0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727653102; cv=none; b=BoBr1QVlKoAfuPsPzHa0jdcu+2J1a6OUA0Xf6WVRqaZgf5wqGDsORHgAwahbg9l7pzg/QCncboDrocJJMyTrgcZ15YUGCSvT7EqcCefJJzorvNa6Z4IzWMbsP7jMpRuwMq9oxOxER5saj7LZPpsjHsaUk1h7+IcVHIGld8TeYPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727653102; c=relaxed/simple;
	bh=ISBJfhPgT/6455Q8/i+HWYUFE5dhsK4YNVDyJikBOiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lb9hnzFFd7N6Lv7QWVNmRplSCfTztcuUnlAODfuWsCXuLa7brNoLoNOETgp2QQcnejdDu4kDGLzLj96YE9QGHWkunW3SUf9W+BQyg9QkP6wRId5cUAXEIiBurTRx2Xj//gg1rNAoe0fmPNbJRq2XhZG72L3JXUw2TfiFxMgOoEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EImpNOp8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EImpNOp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727653100; x=1759189100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ISBJfhPgT/6455Q8/i+HWYUFE5dhsK4YNVDyJikBOiU=;
  b=EImpNOp8GtWkB/ZY9GABmrA5/n6Ypraun9jgq07V/oC0wXw4RG5cpkbk
   h9SkXO/xubz/XJb3jwFlY93gJHr44GN7cfBlhcKY614tBEBnj3sEenH4M
   MPsSZQGk6S79zgkv8zHQKrXyj6vsCi7mQEQN+qsez/9eC7/FFWaYf8V8Y
   ztve7mnz6qnx7EGFVYY+gDu4MtoahHmf5SDfbvOMTH48D7RReRVauWRBZ
   rzMV2ObaT+7tX8z21N93n47MC8zsQl24O7PYtsuhBCMguv7/qAl+nwyuY
   XvUj3IYQe2h8hhIQb9CnqVL2dqDjARIMsoo3MVF2HHepNNTd7ZfInMeik
   w==;
X-CSE-ConnectionGUID: xE3QAsZVTk2XqADVjPLslg==
X-CSE-MsgGUID: IYrXXjQPRU+O1BUgrfSyXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26857991"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26857991"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 16:38:19 -0700
X-CSE-ConnectionGUID: GqiSrSpCQdiDl/OghWQAZw==
X-CSE-MsgGUID: paoDaWdlTuW0qoSlelAwJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="77194148"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Sep 2024 16:38:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv3UW-000OoL-0v;
	Sun, 29 Sep 2024 23:38:16 +0000
Date: Mon, 30 Sep 2024 07:37:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 447/447]
 arch/mips/sibyte/common/sb_tbprof.c:531:10: error: 'const struct
 file_operations' has no member named 'read'
Message-ID: <202409300711.DoScKh1J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2a160886dc6861c50df03e043f2b5e6379fba22a
commit: 2a160886dc6861c50df03e043f2b5e6379fba22a [447/447] fs: finally remove ->read() and ->write() from file_operations
config: mips-randconfig-r054-20240929 (https://download.01.org/0day-ci/archive/20240930/202409300711.DoScKh1J-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300711.DoScKh1J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300711.DoScKh1J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/sibyte/common/sb_tbprof.c:531:10: error: 'const struct file_operations' has no member named 'read'
     531 |         .read           = sbprof_tb_read,
         |          ^~~~
>> arch/mips/sibyte/common/sb_tbprof.c:531:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     531 |         .read           = sbprof_tb_read,
         |                           ^~~~~~~~~~~~~~
   arch/mips/sibyte/common/sb_tbprof.c:531:27: note: (near initialization for 'sbprof_tb_fops')
>> arch/mips/sibyte/common/sb_tbprof.c:531:27: error: initialization of 'int (*)(struct file *, loff_t,  loff_t,  int)' {aka 'int (*)(struct file *, long long int,  long long int,  int)'} from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, char *, unsigned int,  long long int *)'} [-Wincompatible-pointer-types]
   arch/mips/sibyte/common/sb_tbprof.c:531:27: note: (near initialization for 'sbprof_tb_fops.fsync')
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +531 arch/mips/sibyte/common/sb_tbprof.c

^1da177e4c3f41 arch/mips/sibyte/sb1250/bcm1250_tbprof.c Linus Torvalds   2005-04-16  526  
5dfe4c964a0dd7 arch/mips/sibyte/sb1250/bcm1250_tbprof.c Arjan van de Ven 2007-02-12  527  static const struct file_operations sbprof_tb_fops = {
^1da177e4c3f41 arch/mips/sibyte/sb1250/bcm1250_tbprof.c Linus Torvalds   2005-04-16  528  	.owner		= THIS_MODULE,
^1da177e4c3f41 arch/mips/sibyte/sb1250/bcm1250_tbprof.c Linus Torvalds   2005-04-16  529  	.open		= sbprof_tb_open,
^1da177e4c3f41 arch/mips/sibyte/sb1250/bcm1250_tbprof.c Linus Torvalds   2005-04-16  530  	.release	= sbprof_tb_release,
^1da177e4c3f41 arch/mips/sibyte/sb1250/bcm1250_tbprof.c Linus Torvalds   2005-04-16 @531  	.read		= sbprof_tb_read,
b288f135872b65 arch/mips/sibyte/sb1250/bcm1250_tbprof.c Ralf Baechle     2005-09-30  532  	.unlocked_ioctl = sbprof_tb_ioctl,
b288f135872b65 arch/mips/sibyte/sb1250/bcm1250_tbprof.c Ralf Baechle     2005-09-30  533  	.compat_ioctl	= sbprof_tb_ioctl,
^1da177e4c3f41 arch/mips/sibyte/sb1250/bcm1250_tbprof.c Linus Torvalds   2005-04-16  534  	.mmap		= NULL,
6038f373a3dc1f arch/mips/sibyte/common/sb_tbprof.c      Arnd Bergmann    2010-08-15  535  	.llseek		= default_llseek,
^1da177e4c3f41 arch/mips/sibyte/sb1250/bcm1250_tbprof.c Linus Torvalds   2005-04-16  536  };
^1da177e4c3f41 arch/mips/sibyte/sb1250/bcm1250_tbprof.c Linus Torvalds   2005-04-16  537  

:::::: The code at line 531 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
