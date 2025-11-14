Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8AB2F5308
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102884; cv=none; b=fiHNNaAk1UKyvHkf6TeE4UeUDL/PbwFOKmxCyTSp4VXRWoyExWDk0orlmGKrLrL2XvvHbE/6mgRppeYcurOjtATrbF1nBT4SMyJ8vAZaXerUkjJMmr56T9WWxBNyCnofWeGp2cHYQ2wcSMr7ZLRKxQT2krSX0i8gVJ6PeXDoCrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102884; c=relaxed/simple;
	bh=LjmWHIcpp2w6c1zeiU4VL7nSzeSWq8TEifKEAAQyD7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mWifLnWkq2ebLc//zy6pI3gya7Nyn93SPz/9ikgPbe0JuAcoasFIKHh6bHB+3RA5sGlv+4FVqRsL+7SHPiZGDopzIacLZfrhFgxU7wRvuciokGAHzxZCwp6HNIRaApl1lzWQkDKQBh61cTsSY2w+MnPHv48x9jfZ1PpHunVYJjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxAVBnt8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxAVBnt8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102883; x=1794638883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LjmWHIcpp2w6c1zeiU4VL7nSzeSWq8TEifKEAAQyD7E=;
  b=AxAVBnt89cK5erKYl7iRUUXx44DT6+4u54K3MC1y6IMHST2rpxLEtz5T
   1SktAk0IrkR+xM+OVO8ojHukrQfRissOxC7VC7Vv5CZBLuH/nhdrVtMYJ
   uLSvijZRFBr+VlSSaGzHEMtXQV/3tDwmEUs7hraN73N3xQil8b0wg+hOW
   YlWD+Me5g1W1TJ69muaXKh3SVuK3XgjeCMmPJ1E9VYkmdCxvVfk8QQ6hN
   AGncAP6fn6L1dT0hfh/pEqQjz60Uc3NPZ/q8eE8pb2PZm8k6ZpIvJjiKJ
   mRga2DT+MwfgopV9M13gpmrX38Z7m7z3k55jK1XvMegSc/c15lSn/DPTa
   w==;
X-CSE-ConnectionGUID: UAWeFH5YTbuUj8DaI8QRXQ==
X-CSE-MsgGUID: TlsK810ZTqe2P8kbnRn69Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82829292"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="82829292"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:48:01 -0800
X-CSE-ConnectionGUID: P/1YW50ySY2y/7zftTssyw==
X-CSE-MsgGUID: V8rcsZRMTbq/fwJiNhgc3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="190485398"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2025 22:48:00 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnbB-0006G6-2D;
	Fri, 14 Nov 2025 06:47:57 +0000
Date: Fri, 14 Nov 2025 14:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-ioerr-reporting 92/104]
 fs/fuse/./fuse_trace.h:101:12: error: 'const struct fuse_inode' has no
 member named 'i_disk_size'
Message-ID: <202511141246.hTO5eWng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-ioerr-reporting
head:   fcfa2d1ca43ca32450cc8f8577771778de9a4da3
commit: a4807f31ce423b62a3a49487b5dced5dab433a9d [92/104] fuse: track on-disk file size for iomap files
config: arm64-randconfig-004-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141246.hTO5eWng-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141246.hTO5eWng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141246.hTO5eWng-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from fs/fuse/fuse_trace.h:1637,
                    from fs/fuse/trace.c:15:
   fs/fuse/./fuse_trace.h: In function 'do_trace_event_raw_event_fuse_fileattr_class':
>> fs/fuse/./fuse_trace.h:101:12: error: 'const struct fuse_inode' has no member named 'i_disk_size'
     101 |        (fi)->i_disk_size : 0
         |            ^~
   include/trace/trace_events.h:427:4: note: in definition of macro '__DECLARE_EVENT_CLASS'
     427 |  { assign; }       \
         |    ^~~~~~
   include/trace/trace_events.h:435:9: note: in expansion of macro 'PARAMS'
     435 |         PARAMS(assign), PARAMS(print))   \
         |         ^~~~~~
   fs/fuse/./fuse_trace.h:183:1: note: in expansion of macro 'DECLARE_EVENT_CLASS'
     183 | DECLARE_EVENT_CLASS(fuse_fileattr_class,
         | ^~~~~~~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h:194:2: note: in expansion of macro 'TP_fast_assign'
     194 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h:195:3: note: in expansion of macro 'FUSE_INODE_ASSIGN'
     195 |   FUSE_INODE_ASSIGN(inode, fi, fm);
         |   ^~~~~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h: In function 'do_trace_event_raw_event_fuse_setattr_fill':
>> fs/fuse/./fuse_trace.h:101:12: error: 'const struct fuse_inode' has no member named 'i_disk_size'
     101 |        (fi)->i_disk_size : 0
         |            ^~
   include/trace/trace_events.h:427:4: note: in definition of macro '__DECLARE_EVENT_CLASS'
     427 |  { assign; }       \
         |    ^~~~~~
   include/trace/trace_events.h:435:9: note: in expansion of macro 'PARAMS'
     435 |         PARAMS(assign), PARAMS(print))   \
         |         ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:9: note: in expansion of macro 'PARAMS'
      44 |         PARAMS(assign),         \
         |         ^~~~~~
   fs/fuse/./fuse_trace.h:212:1: note: in expansion of macro 'TRACE_EVENT'
     212 | TRACE_EVENT(fuse_setattr_fill,
         | ^~~~~~~~~~~
   fs/fuse/./fuse_trace.h:225:2: note: in expansion of macro 'TP_fast_assign'
     225 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h:226:3: note: in expansion of macro 'FUSE_INODE_ASSIGN'
     226 |   FUSE_INODE_ASSIGN(inode, fi, fm);
         |   ^~~~~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h: In function 'do_trace_event_raw_event_fuse_setattr':
>> fs/fuse/./fuse_trace.h:101:12: error: 'const struct fuse_inode' has no member named 'i_disk_size'
     101 |        (fi)->i_disk_size : 0
         |            ^~
   include/trace/trace_events.h:427:4: note: in definition of macro '__DECLARE_EVENT_CLASS'
     427 |  { assign; }       \
         |    ^~~~~~
   include/trace/trace_events.h:435:9: note: in expansion of macro 'PARAMS'
     435 |         PARAMS(assign), PARAMS(print))   \
         |         ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:9: note: in expansion of macro 'PARAMS'
      44 |         PARAMS(assign),         \
         |         ^~~~~~
   fs/fuse/./fuse_trace.h:241:1: note: in expansion of macro 'TRACE_EVENT'
     241 | TRACE_EVENT(fuse_setattr,
         | ^~~~~~~~~~~
   fs/fuse/./fuse_trace.h:254:2: note: in expansion of macro 'TP_fast_assign'
     254 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h:255:3: note: in expansion of macro 'FUSE_INODE_ASSIGN'
     255 |   FUSE_INODE_ASSIGN(inode, fi, fm);
         |   ^~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:133,
                    from fs/fuse/fuse_trace.h:1637,
                    from fs/fuse/trace.c:15:
   fs/fuse/./fuse_trace.h: In function 'do_perf_trace_fuse_fileattr_class':
>> fs/fuse/./fuse_trace.h:101:12: error: 'const struct fuse_inode' has no member named 'i_disk_size'
     101 |        (fi)->i_disk_size : 0
         |            ^~
   include/trace/perf.h:51:4: note: in definition of macro '__DECLARE_EVENT_CLASS'
      51 |  { assign; }       \
         |    ^~~~~~
   include/trace/perf.h:67:9: note: in expansion of macro 'PARAMS'
      67 |         PARAMS(assign), PARAMS(print))   \
         |         ^~~~~~
   fs/fuse/./fuse_trace.h:183:1: note: in expansion of macro 'DECLARE_EVENT_CLASS'
     183 | DECLARE_EVENT_CLASS(fuse_fileattr_class,
         | ^~~~~~~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h:194:2: note: in expansion of macro 'TP_fast_assign'
     194 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h:195:3: note: in expansion of macro 'FUSE_INODE_ASSIGN'
     195 |   FUSE_INODE_ASSIGN(inode, fi, fm);
         |   ^~~~~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h: In function 'do_perf_trace_fuse_setattr_fill':
>> fs/fuse/./fuse_trace.h:101:12: error: 'const struct fuse_inode' has no member named 'i_disk_size'
     101 |        (fi)->i_disk_size : 0
         |            ^~
   include/trace/perf.h:51:4: note: in definition of macro '__DECLARE_EVENT_CLASS'
      51 |  { assign; }       \
         |    ^~~~~~
   include/trace/perf.h:67:9: note: in expansion of macro 'PARAMS'
      67 |         PARAMS(assign), PARAMS(print))   \
         |         ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:9: note: in expansion of macro 'PARAMS'
      44 |         PARAMS(assign),         \
         |         ^~~~~~
   fs/fuse/./fuse_trace.h:212:1: note: in expansion of macro 'TRACE_EVENT'
     212 | TRACE_EVENT(fuse_setattr_fill,
         | ^~~~~~~~~~~
   fs/fuse/./fuse_trace.h:225:2: note: in expansion of macro 'TP_fast_assign'
     225 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h:226:3: note: in expansion of macro 'FUSE_INODE_ASSIGN'
     226 |   FUSE_INODE_ASSIGN(inode, fi, fm);
         |   ^~~~~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h: In function 'do_perf_trace_fuse_setattr':
>> fs/fuse/./fuse_trace.h:101:12: error: 'const struct fuse_inode' has no member named 'i_disk_size'
     101 |        (fi)->i_disk_size : 0
         |            ^~
   include/trace/perf.h:51:4: note: in definition of macro '__DECLARE_EVENT_CLASS'
      51 |  { assign; }       \
         |    ^~~~~~
   include/trace/perf.h:67:9: note: in expansion of macro 'PARAMS'
      67 |         PARAMS(assign), PARAMS(print))   \
         |         ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:9: note: in expansion of macro 'PARAMS'
      44 |         PARAMS(assign),         \
         |         ^~~~~~
   fs/fuse/./fuse_trace.h:241:1: note: in expansion of macro 'TRACE_EVENT'
     241 | TRACE_EVENT(fuse_setattr,
         | ^~~~~~~~~~~
   fs/fuse/./fuse_trace.h:254:2: note: in expansion of macro 'TP_fast_assign'
     254 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h:255:3: note: in expansion of macro 'FUSE_INODE_ASSIGN'
     255 |   FUSE_INODE_ASSIGN(inode, fi, fm);
         |   ^~~~~~~~~~~~~~~~~


vim +101 fs/fuse/./fuse_trace.h

    83	
    84	/* tracepoint boilerplate so we don't have to keep doing this */
    85	#define FUSE_INODE_FIELDS \
    86			__field(dev_t,			connection) \
    87			__field(uint64_t,		ino) \
    88			__field(uint64_t,		nodeid) \
    89			__field(loff_t,			isize) \
    90			__field(loff_t,			idisksize)
    91	
    92	#define FUSE_INODE_ASSIGN(inode, fi, fm) \
    93			const struct fuse_inode *fi = get_fuse_inode(inode); \
    94			const struct fuse_mount *fm = get_fuse_mount(inode); \
    95	\
    96			__entry->connection	=	(fm)->fc->dev; \
    97			__entry->ino		=	(fi)->orig_ino; \
    98			__entry->nodeid		=	(fi)->nodeid; \
    99			__entry->isize		=	i_size_read(inode); \
   100			__entry->idisksize	=	fuse_inode_has_iomap(inode) ? \
 > 101								(fi)->i_disk_size : 0
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
