Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333A7173347
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 19:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712346721; cv=none; b=etTigHhyESG0YDNmnE5zpMg9iI0beMpfKQ1CfnKnMcRD78AF/8UPGRj2jaB0DBtvF/C5M1zvmYDXY4032Z84Zmb0IkHduCqJCMNOm41LhUtbaMtRJn8LlzfHqmbOX8XhNygSF2WiVEBc8ZChcX+od6boHQtLiwSyjdR0qa5idSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712346721; c=relaxed/simple;
	bh=X7cVKiwP/6c6Y618VhwTpflawKWyMDZgwL6remS4wW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hON7Ai5BCnJbkVCu9JcrURY+QQUVp2qDYi7RlbxV9RDERQUF0k7RgytA9DkG7C/5SqkBl8KMpowEREDG0qAzznzHiSeW2gIFrmO0oyMAJWUI9JFeYEWmWFWFL1sY28jls7fqEK832auB5RuYhZIFtAbp74pajVcSASUf9XHL/4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZM0gsnQM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZM0gsnQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712346721; x=1743882721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X7cVKiwP/6c6Y618VhwTpflawKWyMDZgwL6remS4wW8=;
  b=ZM0gsnQMHYaBzAt2511hCjoAFczDN0rmPi+iUkZAnlGKAvjJqmTZA2BO
   iMRUjgddCwO2PkP/am/KN9rHzLaP90ELHCPKNrublZ5vX7GV7qJOcnDgU
   0HHhhLzdsFP3i8JbDNnI9TZmmiEL+2I8bKTM+uVvIpS1P/5u/6GSuHMWi
   yWI5ZCmjES8MSQP1LDSrFxeQ4fTWd64zPEW8phnXSDi1Ti5sEaR6q1T7C
   6TgEWHsc1b9mwbQdDnC/th83FBBC+71OiJBGmFUV+M8Swa3P9KDqyXlvb
   0xyRPIyQwU0/XWyuQ8tirpF7crksJ6YtPespjshJ4AZRkKLcQiRyDJuub
   Q==;
X-CSE-ConnectionGUID: XulLluk1TTej+2ACj2G6nA==
X-CSE-MsgGUID: Ay1j3rI8SAiJbwsza8doMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11513535"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="11513535"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 12:52:00 -0700
X-CSE-ConnectionGUID: z2pssliFQSmYrxhszDgd+g==
X-CSE-MsgGUID: 5WMc1pNJRdaU5oXiwpJvGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19109637"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Apr 2024 12:51:59 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rspbQ-0002eL-2d;
	Fri, 05 Apr 2024 19:51:56 +0000
Date: Sat, 6 Apr 2024 03:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 30/40] drivers/usb/host/ohci-dbg.c:719:38:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202404060355.ZLteKhPM-lkp@intel.com>
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
commit: 32cd57aa11bcff56cc617bd01c4e00fbcf4a5ee7 [30/40] drivers/usb: convert to ->read_iter and ->write_iter
config: i386-randconfig-062-20240405 (https://download.01.org/0day-ci/archive/20240406/202404060355.ZLteKhPM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060355.ZLteKhPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060355.ZLteKhPM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/host/ohci-hcd.c: note: in included file:
>> drivers/usb/host/ohci-dbg.c:719:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *page @@
   drivers/usb/host/ohci-dbg.c:719:38: sparse:     expected void const [noderef] __user *from
   drivers/usb/host/ohci-dbg.c:719:38: sparse:     got char *page
   drivers/usb/host/ohci-hcd.c: note: in included file:
   drivers/usb/host/ohci-hub.c:269:9: sparse: sparse: context imbalance in 'ohci_rh_resume' - different lock contexts for basic block
--
>> drivers/usb/misc/idmouse.c:305:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char *bulk_in_buffer @@
   drivers/usb/misc/idmouse.c:305:41: sparse:     expected void const [noderef] __user *from
   drivers/usb/misc/idmouse.c:305:41: sparse:     got unsigned char *bulk_in_buffer
--
>> drivers/usb/mon/mon_stat.c:50:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   drivers/usb/mon/mon_stat.c:50:36: sparse:     expected void const [noderef] __user *from
   drivers/usb/mon/mon_stat.c:50:36: sparse:     got char *

vim +719 drivers/usb/host/ohci-dbg.c

   703	
   704	static ssize_t debug_output(struct kiocb *iocb, struct iov_iter *to)
   705	{
   706		struct debug_buffer *buf = iocb->ki_filp->private_data;
   707		int ret;
   708	
   709		mutex_lock(&buf->mutex);
   710		if (buf->count == 0) {
   711			ret = fill_buffer(buf);
   712			if (ret != 0) {
   713				mutex_unlock(&buf->mutex);
   714				goto out;
   715			}
   716		}
   717		mutex_unlock(&buf->mutex);
   718	
 > 719		ret = simple_copy_to_iter(buf->page, &iocb->ki_pos, buf->count, to);
   720	out:
   721		return ret;
   722	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
