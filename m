Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C291318EE1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 02:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779158024; cv=none; b=Nr0Y5j6WiMX3ghfxNHAVe1cK4dji2h3iRW+xwNRx6IY8Tb4A4xeMuj+6rVhDNoqp6BsLxlwk/X93bwRqrh/6NXgSXuDHFPHzwh7w27aier6Iw/d2z87X47MW/yIDZU3cLwmyLewzoC7Uv+uAP7xkDJApPyMNlsZuEs1LUFmCWso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779158024; c=relaxed/simple;
	bh=A3wTHCdmKom04j9nCNQtgnz5icq/NE0c6bus446GIwU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mah5zeR6/ZTRWznzJbraDNrED7ZHt2zetubYSAIk5o3X6L9UI73sbKr8S4JgyugcMwc2dYM3tumo129S/6//lcusYcCvgVTDCyHM0aqhGbF+4MzVpKGUV0q4r4s/JZS0PzadHiUSKSN1SYhNphZ5vat1wkTZ+LqM/vAVXcDCxpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlEqZrR5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlEqZrR5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779158022; x=1810694022;
  h=date:from:to:cc:subject:message-id;
  bh=A3wTHCdmKom04j9nCNQtgnz5icq/NE0c6bus446GIwU=;
  b=VlEqZrR5W4fI9HqQ2Z32GksTbMZ4qNPlkST2/Qru28pUTSSySgSLayvH
   H8fJSdUNTvyexBwDX2mcZXa1eHgcjh7N6un/xUc7HAz0O3RkuLPyd1dGr
   1v12SBA/q328sIi+WRIIlUhoO4p+mJCjZVqMOxKjXKqLdJVj5XgLBoZQQ
   SwfHAE12q0qIhGgtsNB7kNQzFSOfw+fFBQJls20uBcDJH5EgtNx9cOAJM
   k05LLF+Nkt84wrsbF7cHL7Xxr+/jy5Z6gJti/odVTomj8qBBapducVMhI
   9uFYhvUvJlqUTcT+OPGs/+lGzIcgSrRX317hUdL7M4O2xaFZCY5CWwRzH
   w==;
X-CSE-ConnectionGUID: Ly1IOF5WStqTgfhyDFD9Kw==
X-CSE-MsgGUID: wijUBdjlTNOGVLazNj+p7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="67555113"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="67555113"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:33:41 -0700
X-CSE-ConnectionGUID: 11H/3S4uSRWb37DwstSphQ==
X-CSE-MsgGUID: 2PrnYTpMTv64HjYHMmr4Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243922357"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 May 2026 19:33:40 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPAGu-000000000Fr-308u;
	Tue, 19 May 2026 02:33:30 +0000
Date: Tue, 19 May 2026 10:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 20/238]
 drivers/char/xillybus/xillyusb.c:402:18-22: WARNING: casting value returned
 by memory allocation function to (void *) is useless.
Message-ID: <202605191039.4lCmbac6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 75b6846cfcc17df3f3af6497491c289e0682ae37 [20/238] char: xillybus: replace __get_free_pages() with kmalloc()
config: microblaze-randconfig-r062-20260519 (https://download.01.org/0day-ci/archive/20260519/202605191039.4lCmbac6-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191039.4lCmbac6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/char/xillybus/xillyusb.c:402:18-22: WARNING: casting value returned by memory allocation function to (void *) is useless.

vim +402 drivers/char/xillybus/xillyusb.c

   368	
   369	static int fifo_init(struct xillyfifo *fifo,
   370			     unsigned int log2_size)
   371	{
   372		unsigned int log2_bufnum;
   373		unsigned int buf_order;
   374		int i;
   375	
   376		unsigned int log2_fifo_buf_size;
   377	
   378	retry:
   379		log2_fifo_buf_size = fifo_buf_order + PAGE_SHIFT;
   380	
   381		if (log2_size > log2_fifo_buf_size) {
   382			log2_bufnum = log2_size - log2_fifo_buf_size;
   383			buf_order = fifo_buf_order;
   384			fifo->bufsize = 1 << log2_fifo_buf_size;
   385		} else {
   386			log2_bufnum = 0;
   387			buf_order = (log2_size > PAGE_SHIFT) ?
   388				log2_size - PAGE_SHIFT : 0;
   389			fifo->bufsize = 1 << log2_size;
   390		}
   391	
   392		fifo->bufnum = 1 << log2_bufnum;
   393		fifo->size = fifo->bufnum * fifo->bufsize;
   394		fifo->buf_order = buf_order;
   395	
   396		fifo->mem = kmalloc_array(fifo->bufnum, sizeof(void *), GFP_KERNEL);
   397	
   398		if (!fifo->mem)
   399			return -ENOMEM;
   400	
   401		for (i = 0; i < fifo->bufnum; i++) {
 > 402			fifo->mem[i] = (void *)kmalloc(PAGE_SIZE << (buf_order), GFP_KERNEL);
   403	
   404			if (!fifo->mem[i])
   405				goto memfail;
   406		}
   407	
   408		fifo->fill = 0;
   409		fifo->readpos = 0;
   410		fifo->readbuf = 0;
   411		fifo->writepos = 0;
   412		fifo->writebuf = 0;
   413		spin_lock_init(&fifo->lock);
   414		init_waitqueue_head(&fifo->waitq);
   415		return 0;
   416	
   417	memfail:
   418		for (i--; i >= 0; i--)
   419			kfree((void *)(unsigned long)fifo->mem[i]);
   420	
   421		kfree(fifo->mem);
   422		fifo->mem = NULL;
   423	
   424		if (fifo_buf_order) {
   425			fifo_buf_order--;
   426			goto retry;
   427		} else {
   428			return -ENOMEM;
   429		}
   430	}
   431	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
