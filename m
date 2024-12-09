Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5167615884A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718253; cv=none; b=vGWGiRtChJPSj68M9ORwh20/VnO8voL2rgi9LBUzlXG/3hbyWNqIsdP+dWb+B+jL4QLAQ7ASZmZy1CKDXiUZPPLHCSnhkcc9HalSH4SZlehR4TnI6Gnkd3j68FdYHgcRQ+PoSSIkusza8XJNaEMrBRbdzZwa6vRgEBxKO+Jw0ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718253; c=relaxed/simple;
	bh=GvnAAMUkOE07UEITvdIajLLrhaKl6noGkS2LZXYwPIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZhfRj7AvQQj+LiM8og9vJpT30xM2TOiTXtRZBje/oDUu83TlkjCIukCKJt+/ovhaExa67LTZcR8B0BeVCnB3eFPHWRer8ThXtOpCWb2OMHhaTzTLu6p2WsW1vMGhCTuXRWN7K4d0NBLOs4gsB0/ynh7uDGthej0mVw9fJPo6qDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4O1HY3y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4O1HY3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718252; x=1765254252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GvnAAMUkOE07UEITvdIajLLrhaKl6noGkS2LZXYwPIo=;
  b=P4O1HY3ydgIbAklHUYobYJHSwpZYE/jCUYyHzCWZMU4ESE6aoUX/r4oZ
   yeiuRNndCODS83AE7pX11PZwY3QL8zIJkleA/HHe2xJZnOH949ETkNnrv
   jeEwEh4Bvs4juhqx0JDFnKbQaEEPUXreWN0i5boSnZdKmdKflFo+Yn2GC
   uC8VAPIYdw+68YZ0XgOFGcwWmhQDKLhXZLvhxmhOH7NNPwmqhec8nYpdh
   EnAKJm81EdjL68khkO8K05FVb2ufo5aiufCjAB7Beq1yFjJHqRHBp2ezD
   DUFIE415ZeFRf9ShNdLNHpOKX0gym+3+HVZ/eFWo0AKAspaB2n4FX1rGJ
   A==;
X-CSE-ConnectionGUID: QFeA0S4rTcezdYBwEytD7w==
X-CSE-MsgGUID: 6l/kfgsGRwaEJqZiXS3YYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33331425"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33331425"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:24:12 -0800
X-CSE-ConnectionGUID: zDcNve6TTDGqAsRfxyZxDA==
X-CSE-MsgGUID: R0/KkkMpQK6jVpFOPqgT4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="100006464"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Dec 2024 20:24:11 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVJX-0003qX-1B;
	Mon, 09 Dec 2024 04:24:07 +0000
Date: Mon, 9 Dec 2024 12:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2566/2566] drivers/tty/tty_buffer.c:177:9:
 error: implicit declaration of function 'printk_safe_exit'; did you mean
 'printk_nmi_exit'?
Message-ID: <202412072230.rN1VBME9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hongbo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c8dbb3a6e214ad66d5d6099bf76e1f1c6eefc06f
commit: 923efc4dc37c1a7cc91f0dd5dbdc87e0943ad1ae [2566/2566] tty: fix possible deadlock in console_unlock
config: x86_64-buildonly-randconfig-006-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072230.rN1VBME9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412072230.rN1VBME9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412072230.rN1VBME9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/tty_buffer.c: In function 'tty_buffer_alloc':
   drivers/tty/tty_buffer.c:175:9: error: implicit declaration of function 'printk_safe_enter'; did you mean 'printk_nmi_enter'? [-Werror=implicit-function-declaration]
     175 |         printk_safe_enter();
         |         ^~~~~~~~~~~~~~~~~
         |         printk_nmi_enter
>> drivers/tty/tty_buffer.c:177:9: error: implicit declaration of function 'printk_safe_exit'; did you mean 'printk_nmi_exit'? [-Werror=implicit-function-declaration]
     177 |         printk_safe_exit();
         |         ^~~~~~~~~~~~~~~~
         |         printk_nmi_exit
   cc1: some warnings being treated as errors


vim +177 drivers/tty/tty_buffer.c

   142	
   143	/**
   144	 *	tty_buffer_alloc	-	allocate a tty buffer
   145	 *	@port: tty port
   146	 *	@size: desired size (characters)
   147	 *
   148	 *	Allocate a new tty buffer to hold the desired number of characters.
   149	 *	We round our buffers off in 256 character chunks to get better
   150	 *	allocation behaviour.
   151	 *	Return NULL if out of memory or the allocation would exceed the
   152	 *	per device queue
   153	 */
   154	
   155	static struct tty_buffer *tty_buffer_alloc(struct tty_port *port, size_t size)
   156	{
   157		struct llist_node *free;
   158		struct tty_buffer *p;
   159	
   160		/* Round the buffer size out */
   161		size = __ALIGN_MASK(size, TTYB_ALIGN_MASK);
   162	
   163		if (size <= MIN_TTYB_SIZE) {
   164			free = llist_del_first(&port->buf.free);
   165			if (free) {
   166				p = llist_entry(free, struct tty_buffer, free);
   167				goto found;
   168			}
   169		}
   170	
   171		/* Should possibly check if this fails for the largest buffer we
   172		   have queued and recycle that ? */
   173		if (atomic_read(&port->buf.mem_used) > port->buf.mem_limit)
   174			return NULL;
   175		printk_safe_enter();
   176		p = kmalloc(sizeof(struct tty_buffer) + 2 * size, GFP_ATOMIC);
 > 177		printk_safe_exit();
   178		if (p == NULL)
   179			return NULL;
   180	
   181	found:
   182		tty_buffer_reset(p, size);
   183		atomic_add(size, &port->buf.mem_used);
   184		return p;
   185	}
   186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
