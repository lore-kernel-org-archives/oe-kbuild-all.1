Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C91367295
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808561; cv=none; b=nylGr10kAtsV3PDOeeRk4phjve/IOicgw+hFR0M68RUE6iobvv22iS27IkLUWXAph9axaIv7LSaoKQJ/4d5u4JNzmN8mR2IOe1OI5XGoitwNI5k9LgAougr59kzL3I0xcA7EurKMsfm5UlN6oPmj2z+qi8oKnjphFAgw2tfvKJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808561; c=relaxed/simple;
	bh=sa5fUX5abvv8tImtY4qlDs9B+7F0gSNx8AQEZ/3r5C8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GF5pDrhM5v44Z+XENqqVW/8y7LitW+O5l6haquYFz3yBMkuu1L8dH5o72b8TL/JQXK91Ud6YcQSNOTK/ulY84NORJAmUnOytFyNDeubGd0J3YPmmX0+oq5gxsv7Mm8s1oOk/wM8QvPFYr0sg6SyVS1ByFjpYfTgArzgEo0R/3xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaRzH1+O; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaRzH1+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788808560; x=1820344560;
  h=date:from:to:cc:subject:message-id;
  bh=sa5fUX5abvv8tImtY4qlDs9B+7F0gSNx8AQEZ/3r5C8=;
  b=RaRzH1+OfhHj0LQhyJ6SYi7QVVtWDNR6BIL+ueSG2al5gGXdb+rzEQxR
   gK2dy2jgCHVKdKXLiyyF9gAXJvp3X/46m6GreZBH05KbM0rvjc/FygEOS
   1vMmx0UwhIr/UveS039nekHnIufINeM/PbWgN0cEE27Z4gLlx1uK/sLwG
   QHiJ4v/UCP0ob7WJngOp8Ew2NwSCxuefyQfYrELVSRPB7QXQz3UHSWFUa
   gJMDlx3D4EMdqU8/HqRfzc0coMK1yGNwgufsS4ehapJVtairvsN4jU6lN
   L20x9UNZEj9Ae1IXEIu43yMAvHsYuDkrDjyQ1YuB6DwHrz5bus3yLjTK6
   w==;
X-CSE-ConnectionGUID: SIVAJcntR5mqsXkqYOUI+w==
X-CSE-MsgGUID: uxMP9SkaRK+0I7wnpZObDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89337241"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89337241"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 12:15:59 -0700
X-CSE-ConnectionGUID: hXv5yosBRLWRPjsU7gbadw==
X-CSE-MsgGUID: krt1Pnx4Qy2jpSFGkPHoIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="295673996"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Sep 2026 12:15:58 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3eot-000000001H1-2dJt;
	Mon, 07 Sep 2026 19:15:55 +0000
Date: Tue, 08 Sep 2026 03:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 7/39]
 fs/netfs/buffered_read.c:245:26: error: use of undeclared identifier
 'NETFS_RREQ_USE_PGPRIV2'
Message-ID: <202609080335.vRMq1hN5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   269568d526a993d695379e3c37d599f758d032e6
commit: b9dd5c588eac28f57bdaf97310537791e362174a [7/39] netfs: Make deprecated PG_private_2 support optional
config: loongarch-randconfig-r121-20260907 (https://download.01.org/0day-ci/archive/20260908/202609080335.vRMq1hN5-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2362eeb5f75560740146975e9eabe84c6bd25a0d)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080335.vRMq1hN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080335.vRMq1hN5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/buffered_read.c:245:26: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
     245 |                         if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
         |                                               ^~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/buffered_read.c:245:26: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
     245 |                         if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
         |                                               ^~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/buffered_read.c:245:26: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
     245 |                         if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
         |                                               ^~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/NETFS_RREQ_USE_PGPRIV2 +245 fs/netfs/buffered_read.c

e2d46f2ec332533 David Howells 2024-12-16  213  
533203c4183123d David Howells 2026-08-27  214  /*
533203c4183123d David Howells 2026-08-27  215   * Mark folios that we want to copy to the cache.  For filesystems that use
533203c4183123d David Howells 2026-08-27  216   * netfslib fully, we set folio->private to NETFS_FOLIO_COPY_TO_CACHE;
533203c4183123d David Howells 2026-08-27  217   * otherwise we set the deprecated PG_private_2.
533203c4183123d David Howells 2026-08-27  218   */
533203c4183123d David Howells 2026-08-27  219  static void netfs_mark_copy_to_cache(struct netfs_io_request *rreq,
533203c4183123d David Howells 2026-08-27  220  				     struct folio_queue **fq,
533203c4183123d David Howells 2026-08-27  221  				     unsigned int *offset,
533203c4183123d David Howells 2026-08-27  222  				     int *slot,
533203c4183123d David Howells 2026-08-27  223  				     size_t len,
533203c4183123d David Howells 2026-08-27  224  				     bool copy)
533203c4183123d David Howells 2026-08-27  225  {
533203c4183123d David Howells 2026-08-27  226  	while (len > 0) {
533203c4183123d David Howells 2026-08-27  227  		struct folio *folio;
533203c4183123d David Howells 2026-08-27  228  		size_t fsize, overlap;
533203c4183123d David Howells 2026-08-27  229  
533203c4183123d David Howells 2026-08-27  230  		if (!*fq)
533203c4183123d David Howells 2026-08-27  231  			break;
533203c4183123d David Howells 2026-08-27  232  		if (*slot >= folioq_count(*fq)) {
533203c4183123d David Howells 2026-08-27  233  			*fq = (*fq)->next;
533203c4183123d David Howells 2026-08-27  234  			*slot = 0;
533203c4183123d David Howells 2026-08-27  235  			*offset = 0;
533203c4183123d David Howells 2026-08-27  236  			continue;
533203c4183123d David Howells 2026-08-27  237  		}
533203c4183123d David Howells 2026-08-27  238  
533203c4183123d David Howells 2026-08-27  239  		/* Determine how much the subreq overlaps the folio, if at all. */
533203c4183123d David Howells 2026-08-27  240  		fsize = folioq_folio_size(*fq, *slot);
533203c4183123d David Howells 2026-08-27  241  		overlap = min(len, fsize - *offset);
533203c4183123d David Howells 2026-08-27  242  
533203c4183123d David Howells 2026-08-27  243  		if (overlap > 0 && copy) {
533203c4183123d David Howells 2026-08-27  244  			folio = folioq_folio(*fq, *slot);
533203c4183123d David Howells 2026-08-27 @245  			if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
533203c4183123d David Howells 2026-08-27  246  				if (!folio_test_private_2(folio))
533203c4183123d David Howells 2026-08-27  247  					folio_start_private_2(folio);
533203c4183123d David Howells 2026-08-27  248  			} else {
533203c4183123d David Howells 2026-08-27  249  				if (!folio_get_private(folio))
533203c4183123d David Howells 2026-08-27  250  					folio_attach_private(folio, NETFS_FOLIO_COPY_TO_CACHE);
533203c4183123d David Howells 2026-08-27  251  			}
533203c4183123d David Howells 2026-08-27  252  			trace_netfs_folio(folio, netfs_folio_trace_mark_copy);
533203c4183123d David Howells 2026-08-27  253  		}
533203c4183123d David Howells 2026-08-27  254  
533203c4183123d David Howells 2026-08-27  255  		len -= overlap;
533203c4183123d David Howells 2026-08-27  256  		*offset += overlap;
533203c4183123d David Howells 2026-08-27  257  		if (*offset >= fsize) {
533203c4183123d David Howells 2026-08-27  258  			*slot += 1;
533203c4183123d David Howells 2026-08-27  259  			*offset = 0;
533203c4183123d David Howells 2026-08-27  260  		}
533203c4183123d David Howells 2026-08-27  261  	}
533203c4183123d David Howells 2026-08-27  262  }
533203c4183123d David Howells 2026-08-27  263  

:::::: The code at line 245 was first introduced by commit
:::::: 533203c4183123dad8ffecd694e7573a0ccd0da0 netfs: Mark folios with COPY_TO_CACHE whilst issuing subreqs

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
