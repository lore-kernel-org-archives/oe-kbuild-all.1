Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742F1374F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 11:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASiSWuWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702295885; x=1733831885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/iTA69K2isqeZFOJTD+u3DKh4J3tCKODiqRh/ooOHsQ=;
  b=ASiSWuWYPeJy3cOp0F5aiQ1Mr5FP61a25Zy/S0KTqcJxY9x/Gz7Erb1L
   LTW/FJGMsqsK9STIOZvZ7qmd3HQpwZ4+K1xJbPpnOt05EId2yAhqRfsj9
   c8e1xNkznHC2W1EcGHUM07MlTEuToMFbx64sF/G32WVpKRYAhNs2T3m0x
   0UN1Indwq7VdzDAkTZgIMduCnm2HimW2n+xzavI8eBSzzHuEIePgJ10t9
   3scCBJyXZGNcTJs9QzViCJtIhLtvjBJXbIqFpVkFbn1xj4LtQgV26ycL4
   IBBFc0i7aTtsIr7xsnizkutz/2lowH18FgP4nEhRI4CNdJ7mlpupFW4bR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="458947622"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="458947622"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 03:58:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="807279791"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="807279791"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 11 Dec 2023 03:58:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCevB-000I0A-0x;
	Mon, 11 Dec 2023 11:58:01 +0000
Date: Mon, 11 Dec 2023 19:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5967/6992] fs/bcachefs/chardev.c:54:9: warning:
 function 'run_thread_with_file' might be a candidate for 'gnu_printf' format
 attribute
Message-ID: <202312111931.SukjK6yt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bbd220ce4e29ed55ab079007cff0b550895258eb
commit: 48398ac2bfbc356521a3415c2ea0d0a99e95b7ca [5967/6992] bcachefs: thread_with_file
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20231211/202312111931.SukjK6yt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312111931.SukjK6yt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312111931.SukjK6yt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/chardev.c: In function 'run_thread_with_file':
>> fs/bcachefs/chardev.c:54:9: warning: function 'run_thread_with_file' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      54 |         prt_vprintf(&name, fmt, args);
         |         ^~~~~~~~~~~


vim +54 fs/bcachefs/chardev.c

    42	
    43	static int run_thread_with_file(struct thread_with_file *thr,
    44					const struct file_operations *fops,
    45					int (*fn)(void *), const char *fmt, ...)
    46	{
    47		va_list args;
    48		struct file *file = NULL;
    49		int ret, fd = -1;
    50		struct printbuf name = PRINTBUF;
    51		unsigned fd_flags = O_RDONLY|O_CLOEXEC|O_NONBLOCK;
    52	
    53		va_start(args, fmt);
  > 54		prt_vprintf(&name, fmt, args);
    55		va_end(args);
    56	
    57		thr->ret = 0;
    58		thr->task = kthread_create(fn, thr, name.buf);
    59		ret = PTR_ERR_OR_ZERO(thr->task);
    60		if (ret)
    61			goto err;
    62	
    63		ret = get_unused_fd_flags(fd_flags);
    64		if (ret < 0)
    65			goto err_stop_task;
    66		fd = ret;
    67	
    68		file = anon_inode_getfile(name.buf, fops, thr, fd_flags);
    69		ret = PTR_ERR_OR_ZERO(file);
    70		if (ret)
    71			goto err_put_fd;
    72	
    73		fd_install(fd, file);
    74		get_task_struct(thr->task);
    75		wake_up_process(thr->task);
    76		printbuf_exit(&name);
    77		return fd;
    78	err_put_fd:
    79		put_unused_fd(fd);
    80	err_stop_task:
    81		kthread_stop(thr->task);
    82	err:
    83		printbuf_exit(&name);
    84		return ret;
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
