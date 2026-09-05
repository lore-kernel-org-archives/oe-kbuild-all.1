Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03812233956
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 19:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788635941; cv=none; b=F+0upJT2lPZT5+/hDQs5Tgosyo5IrdJ5PNsDG15P5OO0CCtOTbUCQNLO145oh36zte+9tLvsaJBBtFLMoScXpwYgCAHmeCr1gWou7lb8Cr/e/YFGeT+TK2YsEZqpLNmmb4s+wpKkfB6TU3a4AP1HYHmXf1FEfKXQvgeWZLmz4qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788635941; c=relaxed/simple;
	bh=D2qA72+S2FIC3US3PQdMeJoj1dPIHozGOj82bTbrQgk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=doMQYxdm9+8+V/2ZmglKvxpptlF3tsoyZJHke8LuOAL5BvAAL9iWK99fzwQsDu7p3P2m45w5xxTUNfbg/vYAIlb1A/pf1q7gC0Qt1tNK2iErLrwSftM8T4H55DYbJmUvskO5BF0jBv1mcOI4Uq1gtb2LG8HpWxREFt8ZClieomI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSIFMZts; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSIFMZts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788635939; x=1820171939;
  h=date:from:to:cc:subject:message-id;
  bh=D2qA72+S2FIC3US3PQdMeJoj1dPIHozGOj82bTbrQgk=;
  b=BSIFMZtsZxRLtQ+bO7SZl0pbG9kDnHQf6yOwKOlYVvttXQ/eSNVIgQ4h
   hwfP7iI5N8beOK/RoUSVNv0dq3BERvCUSOU5SLRtndURa4hBU+vUyGQ2D
   ojf3xN+pR96BSCmxPDwxoqNUO4sWqaWpWeeLjXV/IfNWZJjHfUndaIMcj
   b3PtGCI/anz7LXXHGAoNQoYSNL5PppE0Eiga4lA6QlU/oYEPVKcqX55Zf
   scUkuBNEEPPemEQRUXNUc+W3ZTorvUFd+cKnvILkNqVoSkLOpcu3l5Ohx
   ZuqrQPf/2UpY3fCEq8WlLUflicO+AEQC/2Yy9fZTAXhfHz1bZ+ZkHxNtT
   w==;
X-CSE-ConnectionGUID: TNrfAxbbTcm0UaXkpy5u+g==
X-CSE-MsgGUID: wJLP4CzBTqmE6E+5cPf6aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="89027870"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="89027870"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 12:18:58 -0700
X-CSE-ConnectionGUID: A7pLsmLmTgGQGRgrIgp/Tg==
X-CSE-MsgGUID: Ktlu80ILQk6skSyNXwy8+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="273870419"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Sep 2026 12:18:57 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2vug-0000000011z-46aO;
	Sat, 05 Sep 2026 19:18:54 +0000
Date: Sun, 06 Sep 2026 03:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 18/49]
 fs/netfs/buffered_read.c:245:26: error: 'NETFS_RREQ_USE_PGPRIV2' undeclared;
 did you mean 'NETFS_RREQ_USE_IO_ITER'?
Message-ID: <202609060337.1U1Zsxo0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   cd7c017395defe44d80f4fb480dfec5e3772ea53
commit: 4164c47a926f31a77a449c9e1d585ca69bc035fd [18/49] netfs: Make deprecated PG_private_2 support optional
config: sparc-randconfig-r071-20260905 (https://download.01.org/0day-ci/archive/20260906/202609060337.1U1Zsxo0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260906/202609060337.1U1Zsxo0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609060337.1U1Zsxo0-lkp@intel.com/

Note: the dhowells-fs/netfs-crypt HEAD cd7c017395defe44d80f4fb480dfec5e3772ea53 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from fs/netfs/buffered_read.c:8:
   fs/netfs/buffered_read.c: In function 'netfs_mark_copy_to_cache':
>> fs/netfs/buffered_read.c:245:26: error: 'NETFS_RREQ_USE_PGPRIV2' undeclared (first use in this function); did you mean 'NETFS_RREQ_USE_IO_ITER'?
       if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
                             ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/bitops.h:60:29: note: in expansion of macro 'bitop'
    #define test_bit(nr, addr)  bitop(_test_bit, nr, addr)
                                ^~~~~
   fs/netfs/buffered_read.c:245:17: note: in expansion of macro 'test_bit'
       if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
                    ^~~~~~~~
   fs/netfs/buffered_read.c:245:26: note: each undeclared identifier is reported only once for each function it appears in
       if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
                             ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/bitops.h:60:29: note: in expansion of macro 'bitop'
    #define test_bit(nr, addr)  bitop(_test_bit, nr, addr)
                                ^~~~~
   fs/netfs/buffered_read.c:245:17: note: in expansion of macro 'test_bit'
       if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
                    ^~~~~~~~


vim +245 fs/netfs/buffered_read.c

e2d46f2ec33253 David Howells 2024-12-16  213  
533203c4183123 David Howells 2026-08-27  214  /*
533203c4183123 David Howells 2026-08-27  215   * Mark folios that we want to copy to the cache.  For filesystems that use
533203c4183123 David Howells 2026-08-27  216   * netfslib fully, we set folio->private to NETFS_FOLIO_COPY_TO_CACHE;
533203c4183123 David Howells 2026-08-27  217   * otherwise we set the deprecated PG_private_2.
533203c4183123 David Howells 2026-08-27  218   */
533203c4183123 David Howells 2026-08-27  219  static void netfs_mark_copy_to_cache(struct netfs_io_request *rreq,
533203c4183123 David Howells 2026-08-27  220  				     struct folio_queue **fq,
533203c4183123 David Howells 2026-08-27  221  				     unsigned int *offset,
533203c4183123 David Howells 2026-08-27  222  				     int *slot,
533203c4183123 David Howells 2026-08-27  223  				     size_t len,
533203c4183123 David Howells 2026-08-27  224  				     bool copy)
533203c4183123 David Howells 2026-08-27  225  {
533203c4183123 David Howells 2026-08-27  226  	while (len > 0) {
533203c4183123 David Howells 2026-08-27  227  		struct folio *folio;
533203c4183123 David Howells 2026-08-27  228  		size_t fsize, overlap;
533203c4183123 David Howells 2026-08-27  229  
533203c4183123 David Howells 2026-08-27  230  		if (!*fq)
533203c4183123 David Howells 2026-08-27  231  			break;
533203c4183123 David Howells 2026-08-27  232  		if (*slot >= folioq_count(*fq)) {
533203c4183123 David Howells 2026-08-27  233  			*fq = (*fq)->next;
533203c4183123 David Howells 2026-08-27  234  			*slot = 0;
533203c4183123 David Howells 2026-08-27  235  			*offset = 0;
533203c4183123 David Howells 2026-08-27  236  			continue;
533203c4183123 David Howells 2026-08-27  237  		}
533203c4183123 David Howells 2026-08-27  238  
533203c4183123 David Howells 2026-08-27  239  		/* Determine how much the subreq overlaps the folio, if at all. */
533203c4183123 David Howells 2026-08-27  240  		fsize = folioq_folio_size(*fq, *slot);
533203c4183123 David Howells 2026-08-27  241  		overlap = min(len, fsize - *offset);
533203c4183123 David Howells 2026-08-27  242  
533203c4183123 David Howells 2026-08-27  243  		if (overlap > 0 && copy) {
533203c4183123 David Howells 2026-08-27  244  			folio = folioq_folio(*fq, *slot);
533203c4183123 David Howells 2026-08-27 @245  			if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
533203c4183123 David Howells 2026-08-27  246  				if (!folio_test_private_2(folio))
533203c4183123 David Howells 2026-08-27  247  					folio_start_private_2(folio);
533203c4183123 David Howells 2026-08-27  248  			} else {
533203c4183123 David Howells 2026-08-27  249  				if (!folio_get_private(folio))
533203c4183123 David Howells 2026-08-27  250  					folio_attach_private(folio, NETFS_FOLIO_COPY_TO_CACHE);
533203c4183123 David Howells 2026-08-27  251  			}
533203c4183123 David Howells 2026-08-27  252  			trace_netfs_folio(folio, netfs_folio_trace_mark_copy);
533203c4183123 David Howells 2026-08-27  253  		}
533203c4183123 David Howells 2026-08-27  254  
533203c4183123 David Howells 2026-08-27  255  		len -= overlap;
533203c4183123 David Howells 2026-08-27  256  		*offset += overlap;
533203c4183123 David Howells 2026-08-27  257  		if (*offset >= fsize) {
533203c4183123 David Howells 2026-08-27  258  			*slot += 1;
533203c4183123 David Howells 2026-08-27  259  			*offset = 0;
533203c4183123 David Howells 2026-08-27  260  		}
533203c4183123 David Howells 2026-08-27  261  	}
533203c4183123 David Howells 2026-08-27  262  }
533203c4183123 David Howells 2026-08-27  263  

:::::: The code at line 245 was first introduced by commit
:::::: 533203c4183123dad8ffecd694e7573a0ccd0da0 netfs: Mark folios with COPY_TO_CACHE whilst issuing subreqs

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
