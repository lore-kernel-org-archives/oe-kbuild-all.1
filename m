Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1605153BCC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714751381; cv=none; b=lp6ZpjQJCj+3P/djnB4ZbDhelfnJL4JSkaUp/gGjpq77oj3Su9lkV/NRCjTGxr8GTRqjplsth3b3cveFnbBcuf4rvb0LZskHczHtjsja+wT41FGtG7tCbLeRR81cmXcB1L5HPBIOazdNMNPM89PYS6Qi5tKHBO+ThJFvo6PmcR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714751381; c=relaxed/simple;
	bh=AnWLyFCyalFvYmJeUSHiTwYh7K9ZxjtJV3lO+DxbBIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cNCGU4JNaJ/aZFYlY8CVJgoBqFDpBdxgwM3k11PHeQUtD3vogv+XhiZcSkF88WGJ8k5/Wp6d/YMKt/mzKEhjvxtZ7OEYuTdEDLwv2gc4wDPoffsFAE9bXudB4ViJ6zwjjy4OndvJxuLEU73T0+zUfNWWx6extof+r3yUYvUpWUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ln8gFd+W; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ln8gFd+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714751380; x=1746287380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AnWLyFCyalFvYmJeUSHiTwYh7K9ZxjtJV3lO+DxbBIA=;
  b=ln8gFd+WgM5iQQueisbLG6F5tg0IEweZcnqQGEzQbDN5Ptv4tv1riL2n
   LIz8WBOZzeqzBiiDJ4J9XebKyYsXVPW4oxLQ9wGzbyJi8Ca8H9UlwLU99
   ZtPi7TyUdSuALkSmi1EMZzS9I/TII1YxAdzs99R/ir4YUEwVkxXexw4LZ
   s0jTiBMEOZ+DXo7sD54Fsc7uBYWmwRsinEnWGINV4gSATECtRBCYnfRXu
   0FEbme3zzOSySu8Y7H2uOdFsdMSiQceuUF5nEXEMuVkFy1jM0uXOSs+zs
   mJoMfQzBXOkUW1KWFlTfdpA0zm3GxB5JVJGGZ3s8Uc1kZGPh2v/4vVtwY
   g==;
X-CSE-ConnectionGUID: uq5IaGmYTw2XlZ1caRYFpg==
X-CSE-MsgGUID: V1Bp12bmROm3hLWLaz0lPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10439721"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10439721"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 08:49:39 -0700
X-CSE-ConnectionGUID: 7BP/W1AnR0aANeogMnwolA==
X-CSE-MsgGUID: diwHaoGdRdWPpQZ6KZyVNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27505254"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 May 2024 08:49:38 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2vAG-000BpA-0C;
	Fri, 03 May 2024 15:49:36 +0000
Date: Fri, 3 May 2024 23:48:42 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 95/1143]
 drivers/soc/aspeed/aspeed-lpc-mbox.c:203:22: sparse: sparse: invalid
 assignment: |=
Message-ID: <202405032320.qOVpwjm5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 01efbc9e4d00ebc024a23fa31b0f097a6328d67c [95/1143] soc: aspeed: Add LPC mailbox support
config: arm-randconfig-r121-20240503 (https://download.01.org/0day-ci/archive/20240503/202405032320.qOVpwjm5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240503/202405032320.qOVpwjm5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032320.qOVpwjm5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/aspeed/aspeed-lpc-mbox.c:203:22: sparse: sparse: invalid assignment: |=
   drivers/soc/aspeed/aspeed-lpc-mbox.c:203:22: sparse:    left side has type restricted __poll_t
   drivers/soc/aspeed/aspeed-lpc-mbox.c:203:22: sparse:    right side has type int
   drivers/soc/aspeed/aspeed-lpc-mbox.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +203 drivers/soc/aspeed/aspeed-lpc-mbox.c

   193	
   194	static __poll_t aspeed_mbox_poll(struct file *file, poll_table *wait)
   195	{
   196		struct aspeed_mbox *mbox = file_mbox(file);
   197		const struct aspeed_mbox_model *model = mbox->model;
   198		__poll_t mask = 0;
   199	
   200		poll_wait(file, &mbox->queue, wait);
   201	
   202		if (aspeed_mbox_inb(mbox, model->bcr) & ASPEED_MBOX_BCR_RECV)
 > 203			mask |= POLLIN;
   204	
   205		return mask;
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
