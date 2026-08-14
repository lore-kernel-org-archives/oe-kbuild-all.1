Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A122BEFE8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 19:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736350; cv=none; b=ZCurFd/sfPzdU6H9c38TYBz6OSjH2rqyod4HBpiJ556uNSMLUKW+B7Q8kIxd6ymFRMTV3qhwLwDVKpJ/44R3lqRdUQKp/cSBP+id1WpP39cqi5bcMqrvp7RMAQL2CXQ22YgVaeFcHdqxl7nE+8+uApy1BqmET23dobhYJCuIe6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736350; c=relaxed/simple;
	bh=wmMVoFMJvtDZxP37A6viGdkwFsv3KYEkYzcvLHFinzA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q5CuoZvsdkQOKD68IL8cC3p+LZcsKc4xABDWc6jh5Ax92p+WD8xqOis4SOtysPF94siZ3GfQ+1NrvSY7jllctJZsdn39HAbyrRtK+LmnHVIAkNjL7nxBS5vfIaTx+TBf//2uRuQmagPxBC8dWgxUca6vnPz7TbabEmZuhsdWrbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuI2SNg+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuI2SNg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786736347; x=1818272347;
  h=date:from:to:cc:subject:message-id;
  bh=wmMVoFMJvtDZxP37A6viGdkwFsv3KYEkYzcvLHFinzA=;
  b=OuI2SNg+ShPzEqiNJPwrTiYQmq88jjmRXcBozxWLIF5IPx5y2Ctu+Ldw
   ByqA5toMVfTWx192Ni4FtPQeU8viwOfhvXxvW9DksZaEHxdMUuVn1F5PI
   lgsm/10UflOiMdCLcN5F6cwWIMeWASRYYeAjeiYnjjFomSMNCXTmXmZA6
   F/lwkPWirK/evOtP5zpXEQNd1JPKbSA9UHcAk4M0qrfwUfCU6Zufch53/
   QH3s/dJCCa3mvS/DlXXC75qPACVUtC1+f6DcLZXS4Iu0yB0z8sHZe70CW
   LvoDAJriFzXypKD9Na6JxmW8pf17VtfARxpIb3KCBqnDx/coR7vpfhBCR
   Q==;
X-CSE-ConnectionGUID: V/t2oBU/Te++Ac6Y2jf/qQ==
X-CSE-MsgGUID: MgL+wIIlTvG/VW9Y1zEw0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="90993610"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="90993610"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 12:39:07 -0700
X-CSE-ConnectionGUID: eviEkjnQTWSw9fAO0+jX6g==
X-CSE-MsgGUID: mhnENxw2Sf2sjhsYB0emVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="263862983"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2026 12:39:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuxk6-00000000Zxu-3veg;
	Fri, 14 Aug 2026 19:39:02 +0000
Date: Sat, 15 Aug 2026 03:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 17/18] fs/nfs/./nfstrace.h:1506:53:
 warning: initialization of 'const struct inode *' from 'int' makes pointer
 from integer without a cast
Message-ID: <202608150352.0l44Aq1w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   33e73a1e8175a4735e962dec9465e64e85d0a63d
commit: 7191691f80efdfec4c2f8d87da800a18b7753e08 [17/18] nfs: Remove pagemap.h from includes
config: x86_64-randconfig-074-20260814 (https://download.01.org/0day-ci/archive/20260815/202608150352.0l44Aq1w-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150352.0l44Aq1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150352.0l44Aq1w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from fs/nfs/nfstrace.h:1986,
                    from fs/nfs/nfstrace.c:10:
   fs/nfs/./nfstrace.h: In function 'do_trace_event_raw_event_nfs_page_class':
   fs/nfs/./nfstrace.h:1506:53: error: implicit declaration of function 'folio_inode'; did you mean 'folio_zone'? [-Werror=implicit-function-declaration]
    1506 |                         const struct inode *inode = folio_inode(req->wb_folio);
         |                                                     ^~~~~~~~~~~
   include/trace/trace_events.h:448:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
     448 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:456:23: note: in expansion of macro 'PARAMS'
     456 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   fs/nfs/./nfstrace.h:1488:1: note: in expansion of macro 'DECLARE_EVENT_CLASS'
    1488 | DECLARE_EVENT_CLASS(nfs_page_class,
         | ^~~~~~~~~~~~~~~~~~~
   fs/nfs/./nfstrace.h:1505:17: note: in expansion of macro 'TP_fast_assign'
    1505 |                 TP_fast_assign(
         |                 ^~~~~~~~~~~~~~
>> fs/nfs/./nfstrace.h:1506:53: warning: initialization of 'const struct inode *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1506 |                         const struct inode *inode = folio_inode(req->wb_folio);
         |                                                     ^~~~~~~~~~~
   include/trace/trace_events.h:448:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
     448 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:456:23: note: in expansion of macro 'PARAMS'
     456 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   fs/nfs/./nfstrace.h:1488:1: note: in expansion of macro 'DECLARE_EVENT_CLASS'
    1488 | DECLARE_EVENT_CLASS(nfs_page_class,
         | ^~~~~~~~~~~~~~~~~~~
   fs/nfs/./nfstrace.h:1505:17: note: in expansion of macro 'TP_fast_assign'
    1505 |                 TP_fast_assign(
         |                 ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:133:
   fs/nfs/./nfstrace.h: In function 'do_perf_trace_nfs_page_class':
>> fs/nfs/./nfstrace.h:1506:53: warning: initialization of 'const struct inode *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1506 |                         const struct inode *inode = folio_inode(req->wb_folio);
         |                                                     ^~~~~~~~~~~
   include/trace/perf.h:51:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/perf.h:67:23: note: in expansion of macro 'PARAMS'
      67 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   fs/nfs/./nfstrace.h:1488:1: note: in expansion of macro 'DECLARE_EVENT_CLASS'
    1488 | DECLARE_EVENT_CLASS(nfs_page_class,
         | ^~~~~~~~~~~~~~~~~~~
   fs/nfs/./nfstrace.h:1505:17: note: in expansion of macro 'TP_fast_assign'
    1505 |                 TP_fast_assign(
         |                 ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1506 fs/nfs/./nfstrace.h

8224b2734ab1da Chuck Lever 2017-08-21  1487  
b6ef079fd98493 Jeff Layton 2025-08-08  1488  DECLARE_EVENT_CLASS(nfs_page_class,
b6ef079fd98493 Jeff Layton 2025-08-08  1489  		TP_PROTO(
b6ef079fd98493 Jeff Layton 2025-08-08  1490  			const struct nfs_page *req
b6ef079fd98493 Jeff Layton 2025-08-08  1491  		),
b6ef079fd98493 Jeff Layton 2025-08-08  1492  
b6ef079fd98493 Jeff Layton 2025-08-08  1493  		TP_ARGS(req),
b6ef079fd98493 Jeff Layton 2025-08-08  1494  
b6ef079fd98493 Jeff Layton 2025-08-08  1495  		TP_STRUCT__entry(
b6ef079fd98493 Jeff Layton 2025-08-08  1496  			__field(dev_t, dev)
b6ef079fd98493 Jeff Layton 2025-08-08  1497  			__field(u32, fhandle)
b6ef079fd98493 Jeff Layton 2025-08-08  1498  			__field(u64, fileid)
e8a44ae87b553b Sean Chang  2026-04-20  1499  			__field(const struct nfs_page *, req)
b6ef079fd98493 Jeff Layton 2025-08-08  1500  			__field(loff_t, offset)
b6ef079fd98493 Jeff Layton 2025-08-08  1501  			__field(unsigned int, count)
b6ef079fd98493 Jeff Layton 2025-08-08  1502  			__field(unsigned long, flags)
b6ef079fd98493 Jeff Layton 2025-08-08  1503  		),
b6ef079fd98493 Jeff Layton 2025-08-08  1504  
b6ef079fd98493 Jeff Layton 2025-08-08  1505  		TP_fast_assign(
b6ef079fd98493 Jeff Layton 2025-08-08 @1506  			const struct inode *inode = folio_inode(req->wb_folio);
b6ef079fd98493 Jeff Layton 2025-08-08  1507  			const struct nfs_inode *nfsi = NFS_I(inode);
b6ef079fd98493 Jeff Layton 2025-08-08  1508  
b6ef079fd98493 Jeff Layton 2025-08-08  1509  			__entry->dev = inode->i_sb->s_dev;
2026c8a96afe6e Jeff Layton 2026-05-12  1510  			__entry->fileid = inode->i_ino;
b6ef079fd98493 Jeff Layton 2025-08-08  1511  			__entry->fhandle = nfs_fhandle_hash(&nfsi->fh);
b6ef079fd98493 Jeff Layton 2025-08-08  1512  			__entry->req = req;
b6ef079fd98493 Jeff Layton 2025-08-08  1513  			__entry->offset = req_offset(req);
b6ef079fd98493 Jeff Layton 2025-08-08  1514  			__entry->count = req->wb_bytes;
b6ef079fd98493 Jeff Layton 2025-08-08  1515  			__entry->flags = req->wb_flags;
b6ef079fd98493 Jeff Layton 2025-08-08  1516  		),
b6ef079fd98493 Jeff Layton 2025-08-08  1517  
b6ef079fd98493 Jeff Layton 2025-08-08  1518  		TP_printk(
b6ef079fd98493 Jeff Layton 2025-08-08  1519  			"fileid=%02x:%02x:%llu fhandle=0x%08x req=%p offset=%lld count=%u flags=%s",
b6ef079fd98493 Jeff Layton 2025-08-08  1520  			MAJOR(__entry->dev), MINOR(__entry->dev),
b6ef079fd98493 Jeff Layton 2025-08-08  1521  			(unsigned long long)__entry->fileid, __entry->fhandle,
b6ef079fd98493 Jeff Layton 2025-08-08  1522  			__entry->req, __entry->offset, __entry->count,
b6ef079fd98493 Jeff Layton 2025-08-08  1523  			nfs_show_wb_flags(__entry->flags)
b6ef079fd98493 Jeff Layton 2025-08-08  1524  		)
b6ef079fd98493 Jeff Layton 2025-08-08  1525  );
b6ef079fd98493 Jeff Layton 2025-08-08  1526  

:::::: The code at line 1506 was first introduced by commit
:::::: b6ef079fd984930dcc42f4b247777f296528507e nfs: more in-depth tracing of writepage events

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Anna Schumaker <anna.schumaker@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
