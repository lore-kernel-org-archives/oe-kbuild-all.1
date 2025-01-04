Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B96208CA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 06:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735971489; cv=none; b=jBtK3OS82Zd4OnGR0n/qQlIDWmwwyvcceIiwYoyzWh/Lm7zVHYal/wG8+RyptAgmPaRf7cahDRkeW81yN3uH8YyPFT5Kf0dfJQlji1qO24ZlO1OUg6TDcAGe7rOpE08JwxWuH/u/5d0QWdN/UZPQykGJmRz/IPsD33hH2Tg94EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735971489; c=relaxed/simple;
	bh=FNS0ARyEe0Il5GViIdI8/6D5ge2falGsw64jEP5bdBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUS8F5rcbcj38DJUZxPWeARg44weqFEJagTLU/gaieSKTsM7XPC+2JptlZ3bfgqlEZ3K8OgMdS46X+Jp4vce8J4T2+ukMzKFwbJxH0E2LvZ3BbKrb382jIFvRaq12BCH6pFKcG5g1cgl4GfHnt5AQVLFMi16o7ZsZmJT2A4elR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f84Pp6p3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f84Pp6p3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735971488; x=1767507488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FNS0ARyEe0Il5GViIdI8/6D5ge2falGsw64jEP5bdBY=;
  b=f84Pp6p3iONYcJVN+vsbRFmA46w1WZSP0CItHnXXWRNqkxAZnbG6kYVh
   TocQrX2cLU+GE+KrqDRc5nqGtIjwpbxSM82lod01CMmf8wm7a1+rfd/VM
   3y4ssZujzvNAqVfxQ5gCBYF2gweFo2ZpyRJdgtC4NkeyBSVsDpA8YWqtJ
   f7AXakqPVlJNlK375sdMpOEHIGUa8m+uz3QFWUDGS0vgHxzvHrcl8hLs0
   RBk5i5n/SouD9W5QSyQS48tvFQiacaVvGApRP0h6tqp3N44gYS3kMp/vT
   8kWsgKphg2oH+Y1XP/lJa9t/qJrw5gr+aOr/2DFAUzMdisqECYe9rB2Hh
   g==;
X-CSE-ConnectionGUID: d3Uk/6hAQcy+McrtaHGf1A==
X-CSE-MsgGUID: WsoqAUN1TQSnipiUHQ8SJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="53620711"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="53620711"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 22:18:07 -0800
X-CSE-ConnectionGUID: O5Rch7+ESyOHRMJH3Jn1AA==
X-CSE-MsgGUID: tdyW+GGXQUyZxycxCDXv3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="102144364"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jan 2025 22:18:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTxU3-000AgF-1R;
	Sat, 04 Jan 2025 06:18:03 +0000
Date: Sat, 4 Jan 2025 14:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Uladzislau Rezki <uladzislau.rezki@sony.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>
Subject: drivers/android/binderfs.c:235: warning: Function parameter or
 struct member 'file' not described in 'binder_ctl_ioctl'
Message-ID: <202501041430.6u1qEegs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Uladzislau,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: 28b3ae426598e722cf5d5ab9cc7038791b955a56 rcu: Introduce CONFIG_RCU_EXP_CPU_STALL_TIMEOUT
date:   2 years, 8 months ago
config: csky-randconfig-r036-20230303 (https://download.01.org/0day-ci/archive/20250104/202501041430.6u1qEegs-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041430.6u1qEegs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041430.6u1qEegs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/android/binderfs.c:235: warning: Function parameter or struct member 'file' not described in 'binder_ctl_ioctl'
>> drivers/android/binderfs.c:235: warning: Function parameter or struct member 'cmd' not described in 'binder_ctl_ioctl'
>> drivers/android/binderfs.c:235: warning: Function parameter or struct member 'arg' not described in 'binder_ctl_ioctl'
   drivers/android/binderfs.c:235: warning: expecting prototype for binderfs_ctl_ioctl(). Prototype was for binder_ctl_ioctl() instead
--
   drivers/android/binder.c:233: warning: Function parameter or struct member '_proc' not described in 'binder_proc_unlock'
   drivers/android/binder.c:233: warning: Excess function parameter 'proc' description in 'binder_proc_unlock'
   drivers/android/binder.c:335: warning: expecting prototype for binder_node_unlock(). Prototype was for binder_node_inner_unlock() instead
   drivers/android/binder.c:1155: warning: expecting prototype for binder_dec_ref(). Prototype was for binder_dec_ref_olocked() instead
>> drivers/android/binder.c:1819: warning: Function parameter or struct member 'file' not described in 'binder_task_work_cb'
>> drivers/android/binder.c:1819: warning: Excess struct member 'fd' description in 'binder_task_work_cb'
>> drivers/android/binder.c:2254: warning: Function parameter or struct member 'offset' not described in 'binder_ptr_fixup'
>> drivers/android/binder.c:2254: warning: Function parameter or struct member 'skip_size' not described in 'binder_ptr_fixup'
>> drivers/android/binder.c:2254: warning: Function parameter or struct member 'fixup_data' not described in 'binder_ptr_fixup'
>> drivers/android/binder.c:2254: warning: Function parameter or struct member 'node' not described in 'binder_ptr_fixup'
>> drivers/android/binder.c:2274: warning: Function parameter or struct member 'offset' not described in 'binder_sg_copy'
>> drivers/android/binder.c:2274: warning: Function parameter or struct member 'sender_uaddr' not described in 'binder_sg_copy'
>> drivers/android/binder.c:2274: warning: Function parameter or struct member 'length' not described in 'binder_sg_copy'
>> drivers/android/binder.c:2274: warning: Function parameter or struct member 'node' not described in 'binder_sg_copy'
   drivers/android/binder.c:2683: warning: Function parameter or struct member 'procp' not described in 'binder_get_node_refs_for_txn'
   drivers/android/binder.c:2683: warning: Excess function parameter 'proc' description in 'binder_get_node_refs_for_txn'
>> drivers/android/binder.c:3510: warning: Function parameter or struct member 'thread' not described in 'binder_free_buf'


vim +235 drivers/android/binderfs.c

3ad20fe393b310 Christian Brauner 2018-12-14  222  
3ad20fe393b310 Christian Brauner 2018-12-14  223  /**
3ad20fe393b310 Christian Brauner 2018-12-14  224   * binderfs_ctl_ioctl - handle binder device node allocation requests
3ad20fe393b310 Christian Brauner 2018-12-14  225   *
3ad20fe393b310 Christian Brauner 2018-12-14  226   * The request handler for the binder-control device. All requests operate on
3ad20fe393b310 Christian Brauner 2018-12-14  227   * the binderfs mount the binder-control device resides in:
3ad20fe393b310 Christian Brauner 2018-12-14  228   * - BINDER_CTL_ADD
3ad20fe393b310 Christian Brauner 2018-12-14  229   *   Allocate a new binder device.
3ad20fe393b310 Christian Brauner 2018-12-14  230   *
3ad20fe393b310 Christian Brauner 2018-12-14  231   * Return: 0 on success, negative errno on failure
3ad20fe393b310 Christian Brauner 2018-12-14  232   */
3ad20fe393b310 Christian Brauner 2018-12-14  233  static long binder_ctl_ioctl(struct file *file, unsigned int cmd,
3ad20fe393b310 Christian Brauner 2018-12-14  234  			     unsigned long arg)
3ad20fe393b310 Christian Brauner 2018-12-14 @235  {
3ad20fe393b310 Christian Brauner 2018-12-14  236  	int ret = -EINVAL;
3ad20fe393b310 Christian Brauner 2018-12-14  237  	struct inode *inode = file_inode(file);
3ad20fe393b310 Christian Brauner 2018-12-14  238  	struct binderfs_device __user *device = (struct binderfs_device __user *)arg;
3ad20fe393b310 Christian Brauner 2018-12-14  239  	struct binderfs_device device_req;
3ad20fe393b310 Christian Brauner 2018-12-14  240  
3ad20fe393b310 Christian Brauner 2018-12-14  241  	switch (cmd) {
3ad20fe393b310 Christian Brauner 2018-12-14  242  	case BINDER_CTL_ADD:
3ad20fe393b310 Christian Brauner 2018-12-14  243  		ret = copy_from_user(&device_req, device, sizeof(device_req));
3ad20fe393b310 Christian Brauner 2018-12-14  244  		if (ret) {
3ad20fe393b310 Christian Brauner 2018-12-14  245  			ret = -EFAULT;
3ad20fe393b310 Christian Brauner 2018-12-14  246  			break;
3ad20fe393b310 Christian Brauner 2018-12-14  247  		}
3ad20fe393b310 Christian Brauner 2018-12-14  248  
3ad20fe393b310 Christian Brauner 2018-12-14  249  		ret = binderfs_binder_device_create(inode, device, &device_req);
3ad20fe393b310 Christian Brauner 2018-12-14  250  		break;
3ad20fe393b310 Christian Brauner 2018-12-14  251  	default:
3ad20fe393b310 Christian Brauner 2018-12-14  252  		break;
3ad20fe393b310 Christian Brauner 2018-12-14  253  	}
3ad20fe393b310 Christian Brauner 2018-12-14  254  
3ad20fe393b310 Christian Brauner 2018-12-14  255  	return ret;
3ad20fe393b310 Christian Brauner 2018-12-14  256  }
3ad20fe393b310 Christian Brauner 2018-12-14  257  

:::::: The code at line 235 was first introduced by commit
:::::: 3ad20fe393b31025bebfc2d76964561f65df48aa binder: implement binderfs

:::::: TO: Christian Brauner <christian@brauner.io>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
