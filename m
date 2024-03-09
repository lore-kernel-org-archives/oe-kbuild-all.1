Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934C41F614
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 17:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710006398; cv=none; b=AKlavcnSbXygWba/KlkJPDXF0b51SkTGkR18VFOsWQlv1PmV76x2SwE6Llcq9w34HncL+du5M5bt2n/+YCvDEnGik8c3Qu8fakKDEf4zjK1QGY39GaTIGU90D4PIOq8oUlwhRUI5kVcqXGYbw1YQ30TAfl8UbuaRHD/pQNAOwHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710006398; c=relaxed/simple;
	bh=Y1opAK+f+xdj6OKv2Cx1YpPuaayuSo727/Othxg4N/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iy4MNLKJK1vxqym7YFbBIYu5j/0QlFEkTPUyFje9xtgF6CmCLk2jv+5z/s5cQ+V6DkL552KMjqtp+NBRnU0nelq1EBGqC2cPzQqYliPrIRRCZZuEDtRj5FOSE/NhfpSz22XJkzhuXKT431eBcvXnzekhBSIg42prnf7cxqtLooo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExSbnc4/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExSbnc4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710006396; x=1741542396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y1opAK+f+xdj6OKv2Cx1YpPuaayuSo727/Othxg4N/Y=;
  b=ExSbnc4/JMiSljrvQf5c5pZBtyrk3W0iSMqkwYhKZUFFu8q0XFEFcNEO
   lPHm/t5gW1snaUXIHYIUgW/fcf7frGufEV00rUtpyHzAsnXJoQMn6tCQk
   QuGmgQI5ZDAwMvC8EqB4F1tEGveoOAtAjt0q01jSmX/cqlchY/cbFjbbF
   n6sryWB9sH32xRflO98/+4TlPleUeCtWMwUhfQyKfZJjOL5X1YKtnmG1v
   gUQmlVeReAR7MSRyn94uAEMQmmLvci+oHagvLJei1yc6lrSyrvFY+/EyO
   HTSIKY2GE9g25dBeGvc+rH0bKgXLommeD1A0tS+AVptxbJyblFvrQHQFB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="8534411"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="8534411"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 09:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="15335345"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Mar 2024 09:46:35 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj0mG-0007Y0-0i;
	Sat, 09 Mar 2024 17:46:32 +0000
Date: Sun, 10 Mar 2024 01:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 21/21] fs/netfs/write_issue.c:236:16:
 warning: format '%lx' expects argument of type 'long unsigned int', but
 argument 2 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202403100102.cHRJ7tCa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   4b19245d19affeb7108cfd195f1523e575ca62ce
commit: 4b19245d19affeb7108cfd195f1523e575ca62ce [21/21] netfs: Use writeback_iter() and improve the writeback algorithm
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240310/202403100102.cHRJ7tCa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100102.cHRJ7tCa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100102.cHRJ7tCa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/netfs/write_issue.c:34:
   fs/netfs/write_issue.c: In function 'netfs_advance_write':
>> fs/netfs/write_issue.c:236:16: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |                ^~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~
         |                                              |
         |                                              size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   fs/netfs/internal.h:396:26: note: in expansion of macro 'no_printk'
     396 | #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/write_issue.c:236:9: note: in expansion of macro '_debug'
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |         ^~~~~~
   fs/netfs/write_issue.c:236:24: note: format string is defined here
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |                      ~~^
         |                        |
         |                        long unsigned int
         |                      %x
   fs/netfs/write_issue.c:236:16: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |                ^~~~~~~~~~~~~~~~~~~~~~               ~~~~~~~~~~~~~~~
         |                                                           |
         |                                                           size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   fs/netfs/internal.h:396:26: note: in expansion of macro 'no_printk'
     396 | #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/write_issue.c:236:9: note: in expansion of macro '_debug'
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |         ^~~~~~
   fs/netfs/write_issue.c:236:28: note: format string is defined here
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |                          ~~^
         |                            |
         |                            long unsigned int
         |                          %x
   fs/netfs/write_issue.c:236:16: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |                ^~~~~~~~~~~~~~~~~~~~~~                                ~~~~
         |                                                                      |
         |                                                                      size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   fs/netfs/internal.h:396:26: note: in expansion of macro 'no_printk'
     396 | #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/write_issue.c:236:9: note: in expansion of macro '_debug'
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |         ^~~~~~
   fs/netfs/write_issue.c:236:32: note: format string is defined here
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |                              ~~^
         |                                |
         |                                long unsigned int
         |                              %x
   fs/netfs/write_issue.c:236:16: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |                ^~~~~~~~~~~~~~~~~~~~~~                                      ~~~
         |                                                                            |
         |                                                                            size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   fs/netfs/internal.h:396:26: note: in expansion of macro 'no_printk'
     396 | #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/write_issue.c:236:9: note: in expansion of macro '_debug'
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |         ^~~~~~
   fs/netfs/write_issue.c:236:36: note: format string is defined here
     236 |         _debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
         |                                  ~~^
         |                                    |
         |                                    long unsigned int
         |                                  %x
   fs/netfs/write_issue.c: In function 'netfs_unbuffered_write':
   fs/netfs/internal.h:394:36: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     394 | #define _enter(FMT, ...) no_printk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                                    ^~~~~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \


vim +236 fs/netfs/write_issue.c

   205	
   206	/*
   207	 * Add data to the write subrequest, dispatching each as we fill it up or if it
   208	 * is discontiguous with the previous.  We only fill one part at a time so that
   209	 * we can avoid overrunning the credits obtained (cifs) and try to parallelise
   210	 * content-crypto preparation with network writes.
   211	 */
   212	int netfs_advance_write(struct netfs_io_request *wreq,
   213				struct netfs_io_stream *stream,
   214				loff_t start, size_t len, bool to_eof)
   215	{
   216		struct netfs_io_subrequest *subreq = stream->construct;
   217		size_t part;
   218	
   219		if (!stream->avail) {
   220			_leave("no write");
   221			return len;
   222		}
   223	
   224		_enter("R=%x[%x]", wreq->debug_id, subreq ? subreq->debug_index : 0x99);
   225	
   226		if (subreq && start != subreq->start + subreq->len) {
   227			netfs_issue_write(wreq, stream);
   228			subreq = NULL;
   229		}
   230	
   231		if (!stream->construct)
   232			netfs_prepare_write(wreq, stream, start);
   233		subreq = stream->construct;
   234	
   235		part = min(subreq->max_len - subreq->len, len);
 > 236		_debug("part %lx/%lx %lx/%lx", subreq->len, subreq->max_len, part, len);
   237		subreq->len += part;
   238		subreq->nr_segs++;
   239	
   240		if (subreq->len >= subreq->max_len ||
   241		    subreq->nr_segs >= subreq->max_nr_segs ||
   242		    to_eof) {
   243			netfs_issue_write(wreq, stream);
   244			subreq = NULL;
   245		}
   246	
   247		return part;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
