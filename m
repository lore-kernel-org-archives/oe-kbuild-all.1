Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7095F1803E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725789367; cv=none; b=Z126rcgAI2+UthLs8ovwDCvbELiM5R2Rp4FtB1vW6y1/UOGB2LryQycfu2oNVq0ZeMqn9zd1HcSGj7pgU2PJ26lHhmXoU6QYRVKeBdA206GFVDW4lRrHgrj0EOr/SLvlyvsOXPTeE9s8Mqhe6bB5S/WFpLh0RCU4dbTQ2jNsJgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725789367; c=relaxed/simple;
	bh=JG49ozXgx+jtYoVTdofF40zigbusUVUvTJ0Obqs0ErE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HmVGoc+bKnwJvKgeGLk/EFsi7+zEMKGzpmxvJy6/ZByi20hewDh2Ex7Or+ZIUrXycywPfLooLAwgkR4D7pwDuDlOUzNLpk0TUhEY/FT+9Bc/YhS1GkbpJY/cZQDE4aAP65AMliXnEKMy8qbkAYqCCbBt/asOO4XNan0wpLgx8rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtzGTS4X; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtzGTS4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725789365; x=1757325365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JG49ozXgx+jtYoVTdofF40zigbusUVUvTJ0Obqs0ErE=;
  b=AtzGTS4Xmn+bgoWSPHhhVfBqVBNpOCxstca0rEec7bOALayMuL423y+M
   t8LT4W0cMHJ/8ioC3fj1mvy9MXEiNPsZRX2NxWz+PZPxOKQ+AA1Oi0fTJ
   +IZV0JchwX/vrI1HJA1rSkBtiVXvEd9ZnJtJE84CRaVkeH7NBUKLcM22+
   Vl76XE8mVHsH0xRp91R4sTvMWMwNZF3dopOizmEopt+zUjfkrNu8OKtf2
   r5Tc6Q0K6WCQFG6UBn64YJoUq9QgA9bAZzFqN6DanploWXxQEWJloW/nu
   tb3ij79FNd3axXwXwPvmy6MFZbFT9Da32M3Mo7ouTvwl8s04mptQLfo+n
   g==;
X-CSE-ConnectionGUID: iBqTzPF/RGu33PYuw90fuA==
X-CSE-MsgGUID: BcZfpMepSL+Pwcj8j6LHgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="27415354"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="27415354"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 02:56:04 -0700
X-CSE-ConnectionGUID: o+T8O+h7Q0iCJv0uTVlggA==
X-CSE-MsgGUID: le6rwNnRQbyNzXhhGwuVxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="70502518"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Sep 2024 02:56:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snEeH-000DQJ-2c;
	Sun, 08 Sep 2024 09:56:01 +0000
Date: Sun, 8 Sep 2024 17:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 211/258] fs/fs_context.c:438:
 warning: Function parameter or struct member 'vaf' not described in 'vlogfc'
Message-ID: <202409081756.Ju1GPIq1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 803cec9683bb42b5957c5dd5f1943679214d37b9 [211/258] bcachefs: log messages during mount to fs_context WIP
config: x86_64-sof-customedconfig-atom-defconfig (https://download.01.org/0day-ci/archive/20240908/202409081756.Ju1GPIq1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409081756.Ju1GPIq1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409081756.Ju1GPIq1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fs_context.c:438: warning: Function parameter or struct member 'vaf' not described in 'vlogfc'
>> fs/fs_context.c:438: warning: Excess function parameter 'fmt' description in 'vlogfc'
>> fs/fs_context.c:438: warning: Excess function parameter 'args' description in 'vlogfc'


vim +438 fs/fs_context.c

0b52075ee62301 Al Viro                 2018-12-23  428  
e7582e16a170db David Howells           2018-11-01  429  /**
803cec9683bb42 Kent Overstreet         2024-05-29  430   * vlogfc - Log a message to a filesystem context
35931eb3945b8d Matthew Wilcox (Oracle  2023-08-18  431)  * @log: The filesystem context to log to, or NULL to use printk.
35931eb3945b8d Matthew Wilcox (Oracle  2023-08-18  432)  * @prefix: A string to prefix the output with, or NULL.
35931eb3945b8d Matthew Wilcox (Oracle  2023-08-18  433)  * @level: 'w' for a warning, 'e' for an error.  Anything else is a notice.
e7582e16a170db David Howells           2018-11-01  434   * @fmt: The format of the buffer.
803cec9683bb42 Kent Overstreet         2024-05-29  435   * @args: va_list
e7582e16a170db David Howells           2018-11-01  436   */
803cec9683bb42 Kent Overstreet         2024-05-29  437  void vlogfc(struct fc_log *log, const char *prefix, char level, struct va_format vaf)
e7582e16a170db David Howells           2018-11-01 @438  {
007ec26cdc9fef David Howells           2018-11-01  439  	if (!log) {
9f09f649ca3350 Al Viro                 2019-12-20  440  		switch (level) {
e7582e16a170db David Howells           2018-11-01  441  		case 'w':
9f09f649ca3350 Al Viro                 2019-12-20  442  			printk(KERN_WARNING "%s%s%pV\n", prefix ? prefix : "",
9f09f649ca3350 Al Viro                 2019-12-20  443  						prefix ? ": " : "", &vaf);
e7582e16a170db David Howells           2018-11-01  444  			break;
e7582e16a170db David Howells           2018-11-01  445  		case 'e':
9f09f649ca3350 Al Viro                 2019-12-20  446  			printk(KERN_ERR "%s%s%pV\n", prefix ? prefix : "",
9f09f649ca3350 Al Viro                 2019-12-20  447  						prefix ? ": " : "", &vaf);
e7582e16a170db David Howells           2018-11-01  448  			break;
e7582e16a170db David Howells           2018-11-01  449  		default:
9f09f649ca3350 Al Viro                 2019-12-20  450  			printk(KERN_NOTICE "%s%s%pV\n", prefix ? prefix : "",
9f09f649ca3350 Al Viro                 2019-12-20  451  						prefix ? ": " : "", &vaf);
e7582e16a170db David Howells           2018-11-01  452  			break;
e7582e16a170db David Howells           2018-11-01  453  		}
007ec26cdc9fef David Howells           2018-11-01  454  	} else {
007ec26cdc9fef David Howells           2018-11-01  455  		unsigned int logsize = ARRAY_SIZE(log->buffer);
007ec26cdc9fef David Howells           2018-11-01  456  		u8 index;
9f09f649ca3350 Al Viro                 2019-12-20  457  		char *q = kasprintf(GFP_KERNEL, "%c %s%s%pV\n", level,
9f09f649ca3350 Al Viro                 2019-12-20  458  						prefix ? prefix : "",
9f09f649ca3350 Al Viro                 2019-12-20  459  						prefix ? ": " : "", &vaf);
007ec26cdc9fef David Howells           2018-11-01  460  
007ec26cdc9fef David Howells           2018-11-01  461  		index = log->head & (logsize - 1);
007ec26cdc9fef David Howells           2018-11-01  462  		BUILD_BUG_ON(sizeof(log->head) != sizeof(u8) ||
007ec26cdc9fef David Howells           2018-11-01  463  			     sizeof(log->tail) != sizeof(u8));
007ec26cdc9fef David Howells           2018-11-01  464  		if ((u8)(log->head - log->tail) == logsize) {
007ec26cdc9fef David Howells           2018-11-01  465  			/* The buffer is full, discard the oldest message */
007ec26cdc9fef David Howells           2018-11-01  466  			if (log->need_free & (1 << index))
007ec26cdc9fef David Howells           2018-11-01  467  				kfree(log->buffer[index]);
007ec26cdc9fef David Howells           2018-11-01  468  			log->tail++;
007ec26cdc9fef David Howells           2018-11-01  469  		}
e7582e16a170db David Howells           2018-11-01  470  
9f09f649ca3350 Al Viro                 2019-12-20  471  		log->buffer[index] = q ? q : "OOM: Can't store error string";
9f09f649ca3350 Al Viro                 2019-12-20  472  		if (q)
9f09f649ca3350 Al Viro                 2019-12-20  473  			log->need_free |= 1 << index;
9f09f649ca3350 Al Viro                 2019-12-20  474  		else
007ec26cdc9fef David Howells           2018-11-01  475  			log->need_free &= ~(1 << index);
007ec26cdc9fef David Howells           2018-11-01  476  		log->head++;
007ec26cdc9fef David Howells           2018-11-01  477  	}
803cec9683bb42 Kent Overstreet         2024-05-29  478  }
803cec9683bb42 Kent Overstreet         2024-05-29  479  EXPORT_SYMBOL(vlogfc);
803cec9683bb42 Kent Overstreet         2024-05-29  480  

:::::: The code at line 438 was first introduced by commit
:::::: e7582e16a170db4c85995c1c03d194ea1ea621fc vfs: Implement logging through fs_context

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
