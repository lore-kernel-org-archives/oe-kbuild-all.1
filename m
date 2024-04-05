Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA012171E5C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712344802; cv=none; b=epCLHUcLkWKcCiAAUkuBwsdf5yqX40Rp3K3TXet3e9VnUC6vM1La1XfsyDbLPxQmypMXgw/PDV6ajN5xkFwrc+d5YxnP5lRxhejamzpVXEvZu5IGvOakx9dvP+eARv5QleEVa5oq2ykw1TDIx233lwsmBXB6BXXCIO5G3s+4CQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712344802; c=relaxed/simple;
	bh=RlrtCTUY2PiGVS+tKTrcQrb3Vnq7IyDZ5wr+X4zU8DA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9xE3ncK0+j43rLTmGvLYcVab6O6fhAV6+Gx8tLWbr91mHLhb2Ar95ZztnokfekQRbCMT2JZaBiRZDVSnEbzeBoJCDBcLeQzmkwH9skhnPPOTDEevmgy2jLgVXcv5fTfIV7Ls3lJpbKLvVOROYB9gILMYihlCUOw7MMzqar1qxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hswr22uP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hswr22uP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712344800; x=1743880800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RlrtCTUY2PiGVS+tKTrcQrb3Vnq7IyDZ5wr+X4zU8DA=;
  b=hswr22uP/TnO7tg+tH38ZspRkpsOPQ6xhKXWGt4LRkLV+yyQzW0QFS5D
   NG8pWmIJ+33d42pgUL+ppZvgx4wku7vyShN1vxhFVp/yQLULQ+dCnbsG2
   FGbsMo3aPC5rlP0YRyoYj9FLIJ0ozb+vXutiE14s0uxFNHhnv9uCoSQy0
   4hzyPOyzp9iEEIKjJJR2kwbCaSvf/K2aX1R/oUhxv8WnGEa+FohBCldRA
   W1+eTf0C0fXCIgfBFt9XO4x9tP+p5Ax3vjtBJPYOz6yhpTJDmcOIzKnd5
   /90NYIjaQLrchdCFHjwc9V3WEn7H1V8ttA1jFXMdhJ/D1lKgIFpjl2ksM
   Q==;
X-CSE-ConnectionGUID: n68xHA2IRJCVwQ1slUuB1A==
X-CSE-MsgGUID: BB2l7QZnQ6aba2SLWhhZ8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="10664241"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="10664241"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 12:19:59 -0700
X-CSE-ConnectionGUID: roSui6TaRjikBevLbFjpGw==
X-CSE-MsgGUID: 3ALUr5MnT9ynOqNSU4QEuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19284658"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Apr 2024 12:19:58 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsp6S-0002cq-03;
	Fri, 05 Apr 2024 19:19:56 +0000
Date: Sat, 6 Apr 2024 03:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 16/40] net/bluetooth/hci_debugfs.c:284:36:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202404060323.iW8M0ieC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   a9cbf952fcac761bffbb44eab7d5ef86b310c71c
commit: 680367128b5e1961d8c56db7245b2a2d37feb910 [16/40] net: convert drivers to read/write iterators
config: i386-randconfig-061-20240405 (https://download.01.org/0day-ci/archive/20240406/202404060323.iW8M0ieC-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060323.iW8M0ieC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060323.iW8M0ieC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/bluetooth/hci_debugfs.c:284:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   net/bluetooth/hci_debugfs.c:284:36: sparse:     expected void const [noderef] __user *from
   net/bluetooth/hci_debugfs.c:284:36: sparse:     got char *
   net/bluetooth/hci_debugfs.c:301:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   net/bluetooth/hci_debugfs.c:301:36: sparse:     expected void const [noderef] __user *from
   net/bluetooth/hci_debugfs.c:301:36: sparse:     got char *
   net/bluetooth/hci_debugfs.c:436:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   net/bluetooth/hci_debugfs.c:436:36: sparse:     expected void const [noderef] __user *from
   net/bluetooth/hci_debugfs.c:436:36: sparse:     got char *
   net/bluetooth/hci_debugfs.c:507:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   net/bluetooth/hci_debugfs.c:507:36: sparse:     expected void const [noderef] __user *from
   net/bluetooth/hci_debugfs.c:507:36: sparse:     got char *
   net/bluetooth/hci_debugfs.c:747:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   net/bluetooth/hci_debugfs.c:747:36: sparse:     expected void const [noderef] __user *from
   net/bluetooth/hci_debugfs.c:747:36: sparse:     got char *
   net/bluetooth/hci_debugfs.c:1140:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   net/bluetooth/hci_debugfs.c:1140:36: sparse:     expected void const [noderef] __user *from
   net/bluetooth/hci_debugfs.c:1140:36: sparse:     got char *
   net/bluetooth/hci_debugfs.c:1265:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   net/bluetooth/hci_debugfs.c:1265:36: sparse:     expected void const [noderef] __user *from
   net/bluetooth/hci_debugfs.c:1265:36: sparse:     got char *
   net/bluetooth/hci_debugfs.c:1321:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   net/bluetooth/hci_debugfs.c:1321:36: sparse:     expected void const [noderef] __user *from
   net/bluetooth/hci_debugfs.c:1321:36: sparse:     got char *

vim +284 net/bluetooth/hci_debugfs.c

   272	
   273	DEFINE_DEBUGFS_ATTRIBUTE(conn_info_max_age_fops, conn_info_max_age_get,
   274				  conn_info_max_age_set, "%llu\n");
   275	
   276	static ssize_t use_debug_keys_read_iter(struct kiocb *iocb, struct iov_iter *to)
   277	{
   278		struct hci_dev *hdev = iocb->ki_filp->private_data;
   279		char buf[3];
   280	
   281		buf[0] = hci_dev_test_flag(hdev, HCI_USE_DEBUG_KEYS) ? 'Y' : 'N';
   282		buf[1] = '\n';
   283		buf[2] = '\0';
 > 284		return simple_copy_to_iter(buf, &iocb->ki_pos, 2, to);
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
