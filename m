Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402004A35
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 01:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748135156; cv=none; b=kbfmGRdJcwKx+QsgJ+vdGMh3jM2drqhGEPR2o8nCaD/zlci/JvO3+0z8aMieA+d90N1daBZ/EVxDT4izn6pttM51Yl1UllGPS+QDur1zpuZJYqtGQVULh1sXqdRBJnls0cp4jNLEzOE7rHmJKvenEqkK2zmrbUeyvBeYRBJSFOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748135156; c=relaxed/simple;
	bh=1g84G6SANwlr3TISO83au05E0tFn/SQNHIoyUbg6+v4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8uAe4KsIA1Qy59TeiWCD0BYmVzLjHZYtaRJW5eqPJxR95ln3I0hlWRm5mz17Skq8bOdPiqOTL7vJs3DsF7TEe8ZsMf5S3yRW9cfC4pGKqCyatJVK+7XqsZYimX06YcCHGJIZDae5kFIpaPhkJTaR2Y6/Po9LzgNPgqUq5ipu3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQLd4CD4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQLd4CD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748135154; x=1779671154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1g84G6SANwlr3TISO83au05E0tFn/SQNHIoyUbg6+v4=;
  b=OQLd4CD4xjFbLpV9fEpr1BU/HDgebMUUHk3a1qQX+oceksMhI/Wfo+uA
   AGQCjPw4uCDwGw0SBjEUub21RdIoCYFRkrAx/YStr9Ro7MM9cXHyBuAj/
   VwKDyRa/Ke/n1Ow8FInueeZKm8PxT8Og5XKKU3IFVveHAz4M6SjA6J9fb
   0p32J65Xt2FYMZMcWB3HJNeFn13B6FLhO1rR0EjEo6QR/4/seT17e/3TX
   6Etf8C/YVX+RAJLrl5NYUwyq0Zu3ejJ8jAcYQLVDunDLxc6tJq6ZD+u2n
   uOkVoBxLN7JAVupyQrKB8nw2COtMMfwAojn5mIje/ssWLaMThxtMAsFv6
   w==;
X-CSE-ConnectionGUID: CE5nQA6WQH+qPHoYs7Zh1Q==
X-CSE-MsgGUID: XJmTwiZmTra5l2Ov2OPN2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="67558878"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="67558878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 18:05:53 -0700
X-CSE-ConnectionGUID: +/r6hBmLTpiAu5qtJTc/1g==
X-CSE-MsgGUID: kq9/lXkeTZ2xW28NImnlaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="146469394"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 May 2025 18:05:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIzoE-000RXy-0w;
	Sun, 25 May 2025 01:05:50 +0000
Date: Sun, 25 May 2025 09:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 288/288]
 fs/bcachefs/thread_with_file.c:363:1: warning: control reaches end of
 non-void function
Message-ID: <202505250911.E5r0rvFK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   8d1f7c458d82ff70eff7b2bcf24d93fb9babe73b
commit: 8d1f7c458d82ff70eff7b2bcf24d93fb9babe73b [288/288] bcachefs: Replace spin_lock() with guards
config: s390-randconfig-002-20250525 (https://download.01.org/0day-ci/archive/20250525/202505250911.E5r0rvFK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250911.E5r0rvFK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505250911.E5r0rvFK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/thread_with_file.c: In function 'bch2_stdio_redirect_read':
   fs/bcachefs/thread_with_file.c:362:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     return ret;
            ^~~
            net
   fs/bcachefs/thread_with_file.c:362:9: note: each undeclared identifier is reported only once for each function it appears in
>> fs/bcachefs/thread_with_file.c:363:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
--
   fs/bcachefs/journal.c: In function 'bch2_journal_noflush_seq':
   fs/bcachefs/journal.c:954:4: error: label 'out' used but not defined
       goto out;
       ^~~~
>> fs/bcachefs/journal.c:934:7: warning: unused variable 'ret' [-Wunused-variable]
     bool ret = false;
          ^~~


vim +363 fs/bcachefs/thread_with_file.c

fcb1620edd4d59 Darrick J. Wong 2024-02-07  335  
60e1baa872a155 Kent Overstreet 2024-02-04  336  int bch2_stdio_redirect_read(struct stdio_redirect *stdio, char *ubuf, size_t len)
96f37eabe7a5cb Kent Overstreet 2023-12-31  337  {
60e1baa872a155 Kent Overstreet 2024-02-04  338  	struct stdio_buf *buf = &stdio->input;
96f37eabe7a5cb Kent Overstreet 2023-12-31  339  
a5a650d6472f23 Kent Overstreet 2024-02-08  340  	/*
a5a650d6472f23 Kent Overstreet 2024-02-08  341  	 * we're waiting on user input (or for the file descriptor to be
a5a650d6472f23 Kent Overstreet 2024-02-08  342  	 * closed), don't want a hung task warning:
a5a650d6472f23 Kent Overstreet 2024-02-08  343  	 */
a5a650d6472f23 Kent Overstreet 2024-02-08  344  	do {
a5a650d6472f23 Kent Overstreet 2024-02-08  345  		wait_event_timeout(buf->wait, stdio_redirect_has_input(stdio),
a5a650d6472f23 Kent Overstreet 2024-02-08  346  				   sysctl_hung_task_timeout_secs * HZ / 2);
a5a650d6472f23 Kent Overstreet 2024-02-08  347  	} while (!stdio_redirect_has_input(stdio));
a5a650d6472f23 Kent Overstreet 2024-02-08  348  
96f37eabe7a5cb Kent Overstreet 2023-12-31  349  	if (stdio->done)
96f37eabe7a5cb Kent Overstreet 2023-12-31  350  		return -1;
96f37eabe7a5cb Kent Overstreet 2023-12-31  351  
8d1f7c458d82ff Kent Overstreet 2025-05-24  352  	scoped_guard(spinlock, &buf->lock) {
60e1baa872a155 Kent Overstreet 2024-02-04  353  		int ret = min(len, buf->buf.nr);
60e1baa872a155 Kent Overstreet 2024-02-04  354  		buf->buf.nr -= ret;
60e1baa872a155 Kent Overstreet 2024-02-04  355  		memcpy(ubuf, buf->buf.data, ret);
60e1baa872a155 Kent Overstreet 2024-02-04  356  		memmove(buf->buf.data,
60e1baa872a155 Kent Overstreet 2024-02-04  357  			buf->buf.data + ret,
60e1baa872a155 Kent Overstreet 2024-02-04  358  			buf->buf.nr);
8d1f7c458d82ff Kent Overstreet 2025-05-24  359  	}
96f37eabe7a5cb Kent Overstreet 2023-12-31  360  
60e1baa872a155 Kent Overstreet 2024-02-04  361  	wake_up(&buf->wait);
96f37eabe7a5cb Kent Overstreet 2023-12-31  362  	return ret;
96f37eabe7a5cb Kent Overstreet 2023-12-31 @363  }
96f37eabe7a5cb Kent Overstreet 2023-12-31  364  

:::::: The code at line 363 was first introduced by commit
:::::: 96f37eabe7a5cb4746f369e959f935be464950be bcachefs: factor out thread_with_file, thread_with_stdio

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
