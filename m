Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CDC211290
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 01:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771290302; cv=none; b=QRssSxGSk+a0yQ5fZG19na0p2kxMzxCwqLS41PX8Ts6074uDUgSfotrA77/nLR0AbtoYcX/65rcv9v9ZPCQNR67YdWkfOBCL7tiZQuZl9ylMTofOweF/PWJWQlN91na2dAqKuOSCQQXwCFudCCB66ITZafUBAKrJMs/HaHGI8jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771290302; c=relaxed/simple;
	bh=ztFN8MOqry16USMovF1HIDHVfnwrGbKAy0WIzpbnxaI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YT+W+APatwS3ZR7JgO2I0gT+RdXs9O0W/qopTEUzeKN34FGg2ENyW047N0S6YmcNGVUopMXtRAldsIdpGycHxIipj1S5FUB+U08W/+XL88DS65Re9e5rWkPXA6HgVM7sgl4R+uMMlpobJWEDSiEiOe72TXkpgnSZvCYBGzKXd0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFw8l0X/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFw8l0X/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771290301; x=1802826301;
  h=date:from:to:cc:subject:message-id;
  bh=ztFN8MOqry16USMovF1HIDHVfnwrGbKAy0WIzpbnxaI=;
  b=QFw8l0X/m2XpHLP8jo18h6gv1/3H05rAzNqtBWoqUTFtu8Z+9+MWE1oT
   pqiJvVEZ+AiDPBYRuqceKoiQyVvCKDP6TLSJfItpAKWkYZNOGnOYssNlN
   HRlsqPJ0XbzH09CKextiKc0PL5K9qKo6i/paSjtk8lCg/t/2pKueE4L4I
   iFdW3+Tme6QIc+OjqiYqeaxdOlpAp8tF4hyOKqndrN4r+U7s648Ex8F5s
   9sLpb4oE+4jALeQXYPgCAflsI8dZ93GuLSTI9paJ/tGs0HtKp5MazwzR9
   iTneUCIgztCFo3Pgh4NaNxSs0xq3Q++PWNbAFOd8eQFhBbiI10OPucU6c
   w==;
X-CSE-ConnectionGUID: AuuRHl+nRPC5bbZ6JFjAgg==
X-CSE-MsgGUID: 8V+txPT3Q5ykB8PB/FVfVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72457566"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="72457566"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 17:04:59 -0800
X-CSE-ConnectionGUID: rdM5vFqKSvyi7NPeegINwQ==
X-CSE-MsgGUID: IarGoCiIRIa4+jqo1HRmaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="244329824"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Feb 2026 17:04:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs9WH-000000010Rw-3Ihy;
	Tue, 17 Feb 2026 01:04:53 +0000
Date: Tue, 17 Feb 2026 09:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@oracle.com>,
 Benjamin Coddington <bcodding@redhat.com>
Subject: fs/nfs/./nfstrace.h:1483:1: sparse: sparse: dereference of
 noderef expression
Message-ID: <202602170807.6sL9tkvg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9702969978695d9a699a1f34771580cdbb153b33
commit: b6ef079fd984930dcc42f4b247777f296528507e nfs: more in-depth tracing of writepage events
date:   5 months ago
config: i386-randconfig-061-20260215 (https://download.01.org/0day-ci/archive/20260217/202602170807.6sL9tkvg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170807.6sL9tkvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170807.6sL9tkvg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs/nfstrace.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, fs/nfs/nfstrace.h):
>> fs/nfs/./nfstrace.h:1483:1: sparse: sparse: dereference of noderef expression
   fs/nfs/nfstrace.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, fs/nfs/nfstrace.h):
>> fs/nfs/./nfstrace.h:1483:1: sparse: sparse: dereference of noderef expression
   fs/nfs/nfstrace.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, fs/nfs/nfstrace.h):
>> fs/nfs/./nfstrace.h:1483:1: sparse: sparse: dereference of noderef expression

vim +1483 fs/nfs/./nfstrace.h

  1482	
> 1483	DECLARE_EVENT_CLASS(nfs_page_class,
  1484			TP_PROTO(
  1485				const struct nfs_page *req
  1486			),
  1487	
  1488			TP_ARGS(req),
  1489	
  1490			TP_STRUCT__entry(
  1491				__field(dev_t, dev)
  1492				__field(u32, fhandle)
  1493				__field(u64, fileid)
  1494				__field(const struct nfs_page *__private, req)
  1495				__field(loff_t, offset)
  1496				__field(unsigned int, count)
  1497				__field(unsigned long, flags)
  1498			),
  1499	
  1500			TP_fast_assign(
  1501				const struct inode *inode = folio_inode(req->wb_folio);
  1502				const struct nfs_inode *nfsi = NFS_I(inode);
  1503	
  1504				__entry->dev = inode->i_sb->s_dev;
  1505				__entry->fileid = nfsi->fileid;
  1506				__entry->fhandle = nfs_fhandle_hash(&nfsi->fh);
  1507				__entry->req = req;
  1508				__entry->offset = req_offset(req);
  1509				__entry->count = req->wb_bytes;
  1510				__entry->flags = req->wb_flags;
  1511			),
  1512	
  1513			TP_printk(
  1514				"fileid=%02x:%02x:%llu fhandle=0x%08x req=%p offset=%lld count=%u flags=%s",
  1515				MAJOR(__entry->dev), MINOR(__entry->dev),
  1516				(unsigned long long)__entry->fileid, __entry->fhandle,
  1517				__entry->req, __entry->offset, __entry->count,
  1518				nfs_show_wb_flags(__entry->flags)
  1519			)
  1520	);
  1521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
