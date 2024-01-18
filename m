Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF93A41
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 04:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705552321; cv=none; b=pAQagFE0Oc11CpjVw37R3T0i+/WUxN35yfkQylL9bsxMGDh0/Y2eOvA8V/YbjZJV08z4JzMnz2uQBeGpbgyylerzseOlUhqQWrUeVt2KZG30Ii4yyVUeXVDhgGtSSqqS1jKhRTI+KZSnw25Rjn2kabKbJFDLCzPIkE5ZHq8Yo4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705552321; c=relaxed/simple;
	bh=sc6KXNrpAWJHdEdXL2cthXJe7zaoLU/IZoJyx6ku9OI=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=gv7S+2tObM50Ike4CuRaix/PEcxVZ9O5YbjipetIClZxahWmiYK4g4ruD1M4VhL8m9tnBJ4qEzY/6BGS6viF4Y08O/FZ1qom0Z89tIbQrmJKbT8lME1gwdBADzZD9xjpulDwGns1eXfOpEa++LMO3fq8H7CQtV9Q6fPZISck8HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuzGf3/C; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuzGf3/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705552319; x=1737088319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sc6KXNrpAWJHdEdXL2cthXJe7zaoLU/IZoJyx6ku9OI=;
  b=fuzGf3/CbTKLGMR7a/0m2AgyRV4sPkJZvl83ZLO70+yPkU3aSzOVobxt
   ZHoRAXGKgKdNfXSWICCA88oRkTT3/3ORmV8NVnLN6O1sJDV2dV3kcLv6t
   aNCjR+hT7ucegrDvK4npAIER8+BtbILaprbjebxP7ag+6qphxzUxRl6i3
   +WBcVA29vGJ/Po1h0tVP16RHwL1tkI4jVYb2nNbCbbBN8/9Ef/AAqvJ0U
   SQ6FraKQ/r1IJXNYQWE2JNhexv1nFq8dH1kZIDelvEA12572J7Zt9+0qG
   On05DMdak/Yn4ZYL478bpIj2jxGm1Lxs5B0pxXbpGW0VJV62taLurf/uG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7055806"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7055806"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 20:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="854881485"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="854881485"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jan 2024 20:31:56 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQK4I-0002dm-2L;
	Thu, 18 Jan 2024 04:31:54 +0000
Date: Thu, 18 Jan 2024 12:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 105/105] fs/ceph/file.c:1629:13: warning:
 'ceph_write_terminated' defined but not used
Message-ID: <202401181217.pHGo5DQG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   2cf82c6e7baf6d3a2adc0692707028da395f1553
commit: 2cf82c6e7baf6d3a2adc0692707028da395f1553 [105/105] ceph: Use netfslib
config: i386-randconfig-141-20240117 (https://download.01.org/0day-ci/archive/20240118/202401181217.pHGo5DQG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401181217.pHGo5DQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401181217.pHGo5DQG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ceph/file.c: In function 'ceph_write_terminated':
   fs/ceph/file.c:1664:41: error: 'len' undeclared (first use in this function)
    1664 |         netfs_subreq_terminated(subreq, len, err);
         |                                         ^~~
   fs/ceph/file.c:1664:41: note: each undeclared identifier is reported only once for each function it appears in
   fs/ceph/file.c: In function 'ceph_create_write_requests':
   fs/ceph/file.c:1761:39: error: passing argument 1 of 'ceph_upload_to_server' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1761 |                 ceph_upload_to_server(req);
         |                                       ^~~
         |                                       |
         |                                       struct ceph_osd_request *
   fs/ceph/file.c:1667:63: note: expected 'struct netfs_io_subrequest *' but argument is of type 'struct ceph_osd_request *'
    1667 | static void ceph_upload_to_server(struct netfs_io_subrequest *subreq)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   fs/ceph/file.c: At top level:
>> fs/ceph/file.c:1629:13: warning: 'ceph_write_terminated' defined but not used [-Wunused-function]
    1629 | static void ceph_write_terminated(struct netfs_io_subrequest *subreq, int err)
         |             ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/ceph/addr.c: In function 'get_oldest_context':
>> fs/ceph/addr.c:547:1: warning: label 'out' defined but not used [-Wunused-label]
     547 | out:
         | ^~~
   fs/ceph/addr.c: In function 'ceph_page_mkwrite':
   fs/ceph/addr.c:901:44: error: 'struct ceph_inode_info' has no member named 'head_snapc'; did you mean 'i_head_snapc'?
     901 |         return netfs_page_mkwrite(vmf, ci->head_snapc);
         |                                            ^~~~~~~~~~
         |                                            i_head_snapc
>> fs/ceph/addr.c:897:35: warning: unused variable 'snapc' [-Wunused-variable]
     897 |         struct ceph_snap_context *snapc;
         |                                   ^~~~~
   fs/ceph/addr.c: At top level:
>> fs/ceph/addr.c:66:12: warning: 'ceph_netfs_check_write_begin' used but never defined
      66 | static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned int len,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c: In function 'ceph_page_mkwrite':
>> fs/ceph/addr.c:902:1: warning: control reaches end of non-void function [-Wreturn-type]
     902 | }
         | ^
   fs/ceph/addr.c: At top level:
>> fs/ceph/addr.c:69:34: warning: 'folio_snap_context' defined but not used [-Wunused-function]
      69 | static struct ceph_snap_context *folio_snap_context(struct folio *folio)
         |                                  ^~~~~~~~~~~~~~~~~~
--
   fs/ceph/crypto.c:545:5: warning: no previous prototype for 'ceph_fscrypt_decrypt_pages' [-Wmissing-prototypes]
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c:591:5: error: conflicting types for 'ceph_fscrypt_decrypt_extents'; have 'int(struct inode *, struct page **, u64,  struct ceph_sparse_extent *, u32)' {aka 'int(struct inode *, struct page **, long long unsigned int,  struct ceph_sparse_extent *, unsigned int)'}
     591 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/ceph/super.h:25,
                    from fs/ceph/crypto.c:14:
   fs/ceph/crypto.h:160:5: note: previous declaration of 'ceph_fscrypt_decrypt_extents' with type 'int(struct inode *, struct ceph_databuf *, u64,  struct ceph_sparse_extent *, u32)' {aka 'int(struct inode *, struct ceph_databuf *, long long unsigned int,  struct ceph_sparse_extent *, unsigned int)'}
     160 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct ceph_databuf *dbuf, u64 off,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c: In function 'ceph_fscrypt_decrypt_extents':
   fs/ceph/crypto.c:625:58: error: passing argument 2 of 'ceph_fscrypt_decrypt_pages' from incompatible pointer type [-Werror=incompatible-pointer-types]
     625 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                          ^~~~~~~~~~~~
         |                                                          |
         |                                                          struct page **
   fs/ceph/crypto.c:545:74: note: expected 'struct ceph_databuf *' but argument is of type 'struct page **'
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |                                                     ~~~~~~~~~~~~~~~~~~~~~^~~~
   fs/ceph/crypto.c: At top level:
>> fs/ceph/crypto.c:640:5: warning: no previous prototype for 'ceph_decrypt_block' [-Wmissing-prototypes]
     640 | int ceph_decrypt_block(struct netfs_io_request *rreq, loff_t pos, size_t len,
         |     ^~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c: In function 'ceph_decrypt_block':
   fs/ceph/crypto.c:644:42: error: 'op' undeclared (first use in this function); did you mean 'up'?
     644 |         struct ceph_sparse_extent *map = op->extent.sparse_ext;
         |                                          ^~
         |                                          up
   fs/ceph/crypto.c:644:42: note: each undeclared identifier is reported only once for each function it appears in
   fs/ceph/crypto.c:645:49: error: 'inode' undeclared (first use in this function)
     645 |         struct ceph_inode_info *ci = ceph_inode(inode);
         |                                                 ^~~~~
   fs/ceph/crypto.c:671:59: error: 'page' undeclared (first use in this function)
     671 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                           ^~~~
   fs/ceph/crypto.c:672:50: error: 'off' undeclared (first use in this function)
     672 |                                                  off + pgsoff, ext->len);
         |                                                  ^~~
>> fs/ceph/crypto.c:663:21: warning: variable 'pgidx' set but not used [-Wunused-but-set-variable]
     663 |                 int pgidx = pgsoff >> PAGE_SHIFT;
         |                     ^~~~~
   fs/ceph/crypto.c: At top level:
>> fs/ceph/crypto.c:686:5: warning: no previous prototype for 'ceph_encrypt_block' [-Wmissing-prototypes]
     686 | int ceph_encrypt_block(struct netfs_io_request *wreq, loff_t pos, size_t len,
         |     ^~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c: In function 'ceph_encrypt_block':
>> fs/ceph/crypto.c:690:1: warning: control reaches end of non-void function [-Wreturn-type]
     690 | }
         | ^
   cc1: some warnings being treated as errors


vim +/ceph_write_terminated +1629 fs/ceph/file.c

  1625	
  1626	/*
  1627	 * Handle the termination of a write to the server.
  1628	 */
> 1629	static void ceph_write_terminated(struct netfs_io_subrequest *subreq, int err)
  1630	{
  1631		struct ceph_io_subrequest *csub =
  1632			container_of(subreq, struct ceph_io_subrequest, sreq);
  1633		struct ceph_io_request *creq = csub->creq;
  1634		struct ceph_osd_request *req = csub->req;
  1635		struct inode *inode = creq->rreq.inode;
  1636		struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
  1637		struct ceph_client *cl = ceph_inode_to_client(inode);
  1638		struct ceph_inode_info *ci = ceph_inode(inode);
  1639	
  1640		ceph_update_write_metrics(&fsc->mdsc->metric, req->r_start_latency,
  1641					  req->r_end_latency, subreq->len, err);
  1642	
  1643		if (err != 0) {
  1644			doutc(cl, "sync_write osd write returned %d\n", err);
  1645			/* Version changed! Must re-do the rmw cycle */
  1646			if ((creq->rmw_assert_version && (err == -ERANGE || err == -EOVERFLOW)) ||
  1647			    (!creq->rmw_assert_version && err == -EEXIST)) {
  1648				/* We should only ever see this on a rmw */
  1649				WARN_ON_ONCE(!test_bit(NETFS_RREQ_RMW, &ci->netfs.flags));
  1650	
  1651				/* The version should never go backward */
  1652				WARN_ON_ONCE(err == -EOVERFLOW);
  1653	
  1654				/* FIXME: limit number of times we loop? */
  1655				set_bit(NETFS_RREQ_REPEAT_RMW, &ci->netfs.flags);
  1656			}
  1657			ceph_set_error_write(ci);
  1658		} else {
  1659			ceph_clear_error_write(ci);
  1660		}
  1661	
  1662		csub->req = NULL;
  1663		ceph_osdc_put_request(req);
  1664		netfs_subreq_terminated(subreq, len, err);
  1665	}
  1666	
  1667	static void ceph_upload_to_server(struct netfs_io_subrequest *subreq)
  1668	{
  1669		struct ceph_io_subrequest *csub =
  1670			container_of(subreq, struct ceph_io_subrequest, sreq);
  1671		struct ceph_osd_request *req = csub->req;
  1672		struct ceph_fs_client *fsc = ceph_inode_to_fs_client(subreq->rreq->inode);
  1673		struct ceph_osd_client *osdc = &fsc->client->osdc;
  1674	
  1675		trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
  1676		ceph_osdc_start_request(osdc, req);
  1677	}
  1678	
  1679	/*
  1680	 * Set up write requests for a writeback slice.  We need to add a write request
  1681	 * for each write we want to make.
  1682	 */
  1683	void ceph_create_write_requests(struct netfs_io_request *wreq, loff_t start, size_t remain)
  1684	{
  1685		struct netfs_io_subrequest *subreq;
  1686		struct ceph_io_subrequest *csub;
  1687		struct ceph_snap_context *snapc =
  1688			container_of(wreq->group, struct ceph_snap_context, group);
  1689		struct inode *inode = wreq->inode;
  1690		struct ceph_inode_info *ci = ceph_inode(inode);
  1691		struct ceph_fs_client *fsc =
  1692			ceph_inode_to_fs_client(inode);
  1693		struct ceph_client *cl = ceph_inode_to_client(inode);
  1694		struct ceph_osd_client *osdc = &fsc->client->osdc;
  1695		struct ceph_osd_request *req;
  1696		struct timespec64 mtime = current_time(inode);
  1697		bool rmw = test_bit(NETFS_RREQ_RMW, &ci->netfs.flags);
  1698	
  1699		doutc(cl, "create_write_reqs on inode %p %lld~%zu snapc %p seq %lld\n",
  1700		      inode, start, remain, snapc, snapc->seq);
  1701	
  1702		do {
  1703			unsigned long long llpart;
  1704			size_t part = remain;
  1705			u64 assert_ver = 0;
  1706			u64 objnum, objoff;
  1707	
  1708			subreq = netfs_create_write_request(wreq, NETFS_UPLOAD_TO_SERVER,
  1709							    start, remain, NULL);
  1710			if (!subreq) {
  1711				wreq->error = -ENOMEM;
  1712				break;
  1713			}
  1714	
  1715			csub = container_of(subreq, struct ceph_io_subrequest, sreq);
  1716	
  1717			/* clamp the length to the end of first object */
  1718			ceph_calc_file_object_mapping(&ci->i_layout, start, remain,
  1719						      &objnum, &objoff, &part);
  1720	
  1721			llpart = part;
  1722			doutc(cl, "create_write_reqs ino %llx %lld~%zu part %lld~%llu -- %srmw\n",
  1723			      ci->i_vino.ino, start, remain, start, llpart, rmw ? "" : "no ");
  1724	
  1725			req = ceph_osdc_new_request(osdc, &ci->i_layout,
  1726						    ci->i_vino, start, &llpart,
  1727						    rmw ? 1 : 0, rmw ? 2 : 1,
  1728						    CEPH_OSD_OP_WRITE,
  1729						    CEPH_OSD_FLAG_WRITE,
  1730						    snapc, ci->i_truncate_seq,
  1731						    ci->i_truncate_size, false);
  1732			if (IS_ERR(req)) {
  1733				wreq->error = PTR_ERR(req);
  1734				break;
  1735			}
  1736	
  1737			part = llpart;
  1738			doutc(cl, "write op %lld~%zu\n", start, part);
  1739			osd_req_op_extent_osd_iter(req, 0, &subreq->io_iter);
  1740			req->r_inode = inode;
  1741			req->r_mtime = mtime;
  1742			req->subreq = subreq;
  1743			csub->req = req;
  1744	
  1745			/*
  1746			 * If we're doing an RMW cycle, set up an assertion that the
  1747			 * remote data hasn't changed.  If we don't have a version
  1748			 * number, then the object doesn't exist yet.  Use an exclusive
  1749			 * create instead of a version assertion in that case.
  1750			 */
  1751			if (rmw) {
  1752				if (assert_ver) {
  1753					osd_req_op_init(req, 0, CEPH_OSD_OP_ASSERT_VER, 0);
  1754					req->r_ops[0].assert_ver.ver = assert_ver;
  1755				} else {
  1756					osd_req_op_init(req, 0, CEPH_OSD_OP_CREATE,
  1757							CEPH_OSD_OP_FLAG_EXCL);
  1758				}
  1759			}
  1760	
> 1761			ceph_upload_to_server(req);
  1762	
  1763			start += part;
  1764			remain -= part;
  1765		} while (remain > 0 && !wreq->error);
  1766	
  1767		dout("create_write_reqs returning %d\n", wreq->error);
  1768	}
  1769	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
