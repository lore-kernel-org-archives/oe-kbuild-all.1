Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD9117BA6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 01:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740620082; cv=none; b=pgX53BerNPYF16Uz2QMgEDoWX2dffzPhUPEwHrP4oevlj4lHjeRC0dkB3hC285SGHJ4/5fpw0e5Q3ngWZgDdFud77lbro1goKY0Gu9pFPmSKnRA0FchfTuHdBY4rQjUvR87atiN4OWBMDKtfwVxq3DjG3JZGB1/bY2FVhpRFYwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740620082; c=relaxed/simple;
	bh=ZZLw4WJb0uHBaJK5B9GNUMOmrv2dN9vmVgMaKbMHrx0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l52bD5BrS26ydoDCOVCY5l8kWlqYHKE62+MSii2UizrtXQ0dK3tRDE+t/vLmF2kINTwjvHcnR8tX9AeqPGxlKKETdZ+aSZT2FhJHRgfV3b1og87JOjWIWSMqit1BFV+iyJeXXFPOtVGIHJQUNVu/4xHLBUyXuj2cy/FVS0kD+WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVrqpOS4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVrqpOS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740620080; x=1772156080;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZZLw4WJb0uHBaJK5B9GNUMOmrv2dN9vmVgMaKbMHrx0=;
  b=kVrqpOS4dW2Im16iAQL7H9y8FFYIkLzSGsa3dqq02kqo8bd0KlAM42Nb
   xdDtLD96H6QRNfO/hCVr/mw9Z0TdNH4qXW26PlNRlrwjOP3SI24i9Kqq/
   NFx7fBtVWYDzPCgjVUstJzlwbw5XWbxo/fQC8OblP7yN9ddlJWj4AZ0rw
   UZXFQ+f8eTKJEDgn6/s7IzUowXLzo19aYz7m6logancdSe8jCRN1ghF+q
   7d6cbdybMjD9kUd6nhtO6ipe5KDmLEkreoEss53tknJBBDuPBou21R/Yf
   1PCU6c68R4vb+Q2FDU6bHSfjtojLsZnvs4pGxwNwdXWEi20rXRUzwKOxP
   g==;
X-CSE-ConnectionGUID: gsHz6ROUQf6FoBU4ovNihA==
X-CSE-MsgGUID: HrDUDsFjT3aoTRzIbUPBnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="63960621"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="63960621"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 17:34:39 -0800
X-CSE-ConnectionGUID: V1YxMbNHRa+OIZ0cIKRvGQ==
X-CSE-MsgGUID: /Po/52TqQzKZOpyLAasDMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="116677147"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2025 17:34:38 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnSnM-000Ch4-1e
	for oe-kbuild-all@lists.linux.dev;
	Thu, 27 Feb 2025 01:34:36 +0000
Date: Thu, 27 Feb 2025 09:34:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/auxdisplay/panel.c:1093: Error:
 unrecognized opcode `csrs sstatus,s7', extension `zicsr' required
Message-ID: <202502270930.ra0zuEFZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 24c764abfd0d4b6e8e33c3818b668edbb4936d6f [1/1] auxdisplay: deconfuse configuration
config: riscv-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250227/202502270930.ra0zuEFZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270930.ra0zuEFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270930.ra0zuEFZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/auxdisplay/panel.c: Assembler messages:
>> drivers/auxdisplay/panel.c:1093: Error: unrecognized opcode `csrs sstatus,s7', extension `zicsr' required
>> drivers/auxdisplay/panel.c:1093: Error: unrecognized opcode `csrc sstatus,s7', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required


vim +1093 drivers/auxdisplay/panel.c

7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1071  
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1072  /*
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1073   * These are the file operation function for user access to /dev/keypad
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1074   */
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1075  
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1076  static ssize_t keypad_read(struct file *file,
cce75f412fa39c drivers/staging/panel/panel.c Bastien Armand 2014-04-18  1077  			   char __user *buf, size_t count, loff_t *ppos)
698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau  2008-11-22  1078  {
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1079  	unsigned i = *ppos;
cce75f412fa39c drivers/staging/panel/panel.c Bastien Armand 2014-04-18  1080  	char __user *tmp = buf;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1081  
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1082  	if (keypad_buflen == 0) {
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1083  		if (file->f_flags & O_NONBLOCK)
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1084  			return -EAGAIN;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1085  
310df69c26f93c drivers/staging/panel/panel.c Arnd Bergmann  2014-01-02  1086  		if (wait_event_interruptible(keypad_read_wait,
310df69c26f93c drivers/staging/panel/panel.c Arnd Bergmann  2014-01-02  1087  					     keypad_buflen != 0))
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1088  			return -EINTR;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1089  	}
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1090  
429ccf058bc201 drivers/staging/panel/panel.c Henri Häkkinen 2010-06-12  1091  	for (; count-- > 0 && (keypad_buflen > 0);
429ccf058bc201 drivers/staging/panel/panel.c Henri Häkkinen 2010-06-12  1092  	     ++i, ++tmp, --keypad_buflen) {
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13 @1093  		put_user(keypad_buffer[keypad_start], tmp);
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1094  		keypad_start = (keypad_start + 1) % KEYPAD_BUFFER;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1095  	}
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1096  	*ppos = i;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1097  
698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau  2008-11-22  1098  	return tmp - buf;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1099  }
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau  2008-11-13  1100  

:::::: The code at line 1093 was first introduced by commit
:::::: 7005b58458e4beecaf5efacb872c456bc7d3541a Staging: add lcd-panel driver

:::::: TO: Willy Tarreau <w@1wt.eu>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
