Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B6F2264A3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 22:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765405203; cv=none; b=CfsGnMqMAlNBzPEkWEwNDf5BWCGDgoSKzoSXiP1fsXQ89Ot8l420LPpPwO+OoUGlvOUTHoPr7uU0U9hWIU2JW9e6sFHn5FBQM5gMlJnpqgHyoAt4Hqybr8Pfa3dIXuMqIE1lSGXlBfErBhrG/M20QyCzUWbK1J9rfXC0/Vkgqsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765405203; c=relaxed/simple;
	bh=lg2KrBJrwoUE1PmSs56Vg47gEndahLtVqRRBhIcg0/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lnUEmiTTHoU2Tqx1C8eRXC1ILWyNWR+11QphhnyMaJJqqtrUqA/vh8cja7bBjiNN0ztXwGkdGUm7j6QL8lhqDVBlDAMTvxvovZ1KjPN+yk1j8/QwSKv5sYvSIT9dUt4GwUzHhI/hH0RChRZSQqa1IdNaAU1QJsNHaDKOLTGNnGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4gC0Rok; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4gC0Rok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765405201; x=1796941201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lg2KrBJrwoUE1PmSs56Vg47gEndahLtVqRRBhIcg0/E=;
  b=S4gC0RokhlTq1SJCHg+EaW/Y5SXtKjG/bPei2XROIzK+/Wc0o44OI6zc
   Up1WeCxXRZrXUhxqqf2bk7kPBJDdk8Gw8H1FL5Geyu92dn6Y46sWV2gj/
   um/kG5e16fCsINNkeM6jvz0WLor3tYn1sLnIZAMCPFkjaeZACkUyFbokD
   WWa8ikms1z7/p3qUGn6T3Xl8qCgunVGhycWFvX7baO4ipy/7vwiI6tbr+
   4jaZwgwipiP3Oe8lY3Qoverq7t3joVEG6wmmY9rhVQL/r3Wte+La4qDQP
   J4LvhU/QOeVG9lfPmmwY0TfTOBSMYz0We6QoSJBT052JKfsAidg0CGU2j
   Q==;
X-CSE-ConnectionGUID: enkd3xzFTjW472FaqCaysQ==
X-CSE-MsgGUID: Ix9wMDMpSMK4Q0TE2mDPlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="69969991"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="69969991"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 14:20:01 -0800
X-CSE-ConnectionGUID: UcURjdu1SkeAEjpN8v+Nlw==
X-CSE-MsgGUID: dwm2ecbRTg6gcuDjtQwpkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="197120133"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Dec 2025 14:19:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTSXM-000000003pR-3WuR;
	Wed, 10 Dec 2025 22:19:56 +0000
Date: Thu, 11 Dec 2025 06:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@oracle.com>,
	Benjamin Coddington <bcodding@redhat.com>
Subject: fs/nfs/./nfstrace.h:1483:1: sparse: sparse: dereference of noderef
 expression
Message-ID: <202512110613.PQnFrrXt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0048fbb4011ec55c32d3148b2cda56433f273375
commit: b6ef079fd984930dcc42f4b247777f296528507e nfs: more in-depth tracing of writepage events
date:   3 months ago
config: i386-randconfig-r113-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110613.PQnFrrXt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110613.PQnFrrXt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110613.PQnFrrXt-lkp@intel.com/

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
