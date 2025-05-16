Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB631F956
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404172; cv=none; b=Jcy8I7lZsAp0JKbZq2cAB/C9yT5bhqRJdehcEurKZlMjq4KFLniUXqBcWVRooffHRxrmi9fVqsZf9hAY+B4zHzrbYNayo9s3i1JE9aag70xmss3x+CMdLQd8fIWDs3+SWfG3N+2J6AjmU/rS55dDbxLKpxWxEvDuiCWfZYVnMg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404172; c=relaxed/simple;
	bh=FqDSqAKwYjnCDRGvdvhq4H1tBKGCqewyzjcv64ZWuH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O13QpMTLEjhIUipQD8ppVsX3SZRhCBbKB713Fp2gPaDvavN5tSC1FHcBkPVre0Rsfx13ChtWRq9i/Jf/ZMqNkFzPc2dnm15GzSW3eA1WcYUBCGfbZHZy1UgjezOwlq00o3J/P4CIHIegq+txaVVXUIlgVO60BOzRD6gG47miobA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOuoW7VC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOuoW7VC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747404171; x=1778940171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FqDSqAKwYjnCDRGvdvhq4H1tBKGCqewyzjcv64ZWuH8=;
  b=MOuoW7VCUdLwazGREUzksL3l3tz6xnmirwQS/o8sN3qlvLM/BdeZU5K/
   mQSHifTVJNjNbcyTe5qJqHmp668NuEPKG7NV+xUaGc7FzymmOidMkUvdo
   kOss228G3zAczir3trvNs+v3N2vtD7B6LHBz7+ZI5kV3vSGo3posjUNDf
   NOiS+Pvhi8lKOoj5ajCM+yDdq7xtvpGPAsa8RElJPUPdtHbBZUcHBsEQZ
   BN2K3UtnjJkHDniZU3Ut8caD0sWbuutAJt1mvAHAVk5R7GWtyFSkEMv1H
   hZ61jQzWq13fqgdEjTYUrLMP6RPiODmeATM1e8c5rEu480NqQaqCQw3Co
   g==;
X-CSE-ConnectionGUID: snI1JmORSimd1M3yRxdswg==
X-CSE-MsgGUID: 9mgehTS7S66wXUY8nTmbaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53193309"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="53193309"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 07:02:50 -0700
X-CSE-ConnectionGUID: y38R4o8UTLKXLO6oJXW/wg==
X-CSE-MsgGUID: oSiXUY0YShCK3Lc8Wt9lVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="175830279"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 May 2025 07:02:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFveA-000JOt-1F;
	Fri, 16 May 2025 14:02:46 +0000
Date: Fri, 16 May 2025 22:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 44/46] fs/nfsd/nfs4state.c:9674:38: warning: format
 '%d' expects argument of type 'int', but argument 2 has type 'long int'
Message-ID: <202505162113.FB2qdw4h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   01011e1d4eb205e81a58129b235ab66dac3101c9
commit: 2a3d6b69be892ee2bce69fbd273ccb7749bd5f67 [44/46] SQUASH: more debugging
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250516/202505162113.FB2qdw4h-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505162113.FB2qdw4h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505162113.FB2qdw4h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from fs/nfsd/nfs4state.c:36:
   fs/nfsd/nfs4state.c: In function 'nfsd_handle_dir_event':
>> fs/nfsd/nfs4state.c:9674:38: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long int' [-Wformat=]
    9674 |                         trace_printk("encoded remove4 is %d bytes long\n", (u8 *)stream->p - p);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~~~~~
         |                                                                                            |
         |                                                                                            long int
   include/linux/kernel.h:238:47: note: in definition of macro '__trace_printk_check_format'
     238 |                 ____trace_printk_check_format(fmt, ##args);             \
         |                                               ^~~
   include/linux/kernel.h:275:17: note: in expansion of macro 'do_trace_printk'
     275 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                 ^~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:9674:25: note: in expansion of macro 'trace_printk'
    9674 |                         trace_printk("encoded remove4 is %d bytes long\n", (u8 *)stream->p - p);
         |                         ^~~~~~~~~~~~
   fs/nfsd/nfs4state.c:9674:59: note: format string is defined here
    9674 |                         trace_printk("encoded remove4 is %d bytes long\n", (u8 *)stream->p - p);
         |                                                          ~^
         |                                                           |
         |                                                           int
         |                                                          %ld
   fs/nfsd/nfs4state.c:9674:38: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long int' [-Wformat=]
    9674 |                         trace_printk("encoded remove4 is %d bytes long\n", (u8 *)stream->p - p);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~~~~~
         |                                                                                            |
         |                                                                                            long int
   include/linux/kernel.h:291:43: note: in definition of macro 'do_trace_printk'
     291 |                 __trace_printk(_THIS_IP_, fmt, ##args);                 \
         |                                           ^~~
   fs/nfsd/nfs4state.c:9674:25: note: in expansion of macro 'trace_printk'
    9674 |                         trace_printk("encoded remove4 is %d bytes long\n", (u8 *)stream->p - p);
         |                         ^~~~~~~~~~~~
   fs/nfsd/nfs4state.c:9674:59: note: format string is defined here
    9674 |                         trace_printk("encoded remove4 is %d bytes long\n", (u8 *)stream->p - p);
         |                                                          ~^
         |                                                           |
         |                                                           int
         |                                                          %ld


vim +9674 fs/nfsd/nfs4state.c

  9615	
  9616	int
  9617	nfsd_handle_dir_event(u32 mask, const struct inode *inode, const struct inode *dir,
  9618				  const struct qstr *name)
  9619	{
  9620		struct file_lock_context *ctx;
  9621		struct file_lock_core *flc;
  9622	
  9623		trace_nfsd_file_fsnotify_handle_dir_event(inode, dir, mask);
  9624	
  9625		ctx = locks_inode_context(dir);
  9626		if (!ctx || list_empty(&ctx->flc_lease)) {
  9627			trace_printk("no ctx or list_empty\n");
  9628			return 0;
  9629		}
  9630	
  9631		/*
  9632		 * Do getattr against @inode, and then generate an fattr4. Use that as the
  9633		 * ne_attrs in the notify_entry4's.
  9634		 */
  9635		spin_lock(&ctx->flc_lock);
  9636		list_for_each_entry(flc, &ctx->flc_lease, flc_list) {
  9637			struct file_lease *fl = container_of(flc, struct file_lease, c);
  9638			struct nfs4_delegation *dp = flc->flc_owner;
  9639			struct nfsd4_cb_notify *ncn = &dp->dl_cb_notify;
  9640			struct nfsd4_notify_spool *nns = ncn->ncn_gather;
  9641			struct xdr_stream *stream = &nns->nns_stream;
  9642	
  9643			trace_printk("considering fl=%p\n", fl);
  9644			if (fl->fl_lmops != &nfsd_dir_lease_mng_ops) {
  9645				trace_printk("fl_lmops doesn't match\n");
  9646				continue;
  9647			}
  9648	
  9649			/* If no buffer or slots are available, give up and break the deleg */
  9650			if (!nns || nns->nns_idx >= NFSD4_NOTIFY_SPOOL_SZ) {
  9651				trace_printk("no buffer");
  9652				nfsd_break_deleg_cb(fl);
  9653				continue;
  9654			}
  9655	
  9656			if (mask & FS_DELETE) {
  9657				static uint32_t notify_remove_bitmap = NOTIFY4_REMOVE_ENTRY;
  9658				struct notify4 *ent = &nns->nns_ent[nns->nns_idx];
  9659				struct notify_remove4 nr = { };
  9660				u8 *p = (u8 *)(stream->p);
  9661	
  9662				if (!(flc->flc_flags & FL_IGN_DIR_DELETE)) {
  9663					trace_printk("FL_IGN_DIR_DELETE not set\n");
  9664					continue;
  9665				}
  9666	
  9667				nr.nrm_old_entry.ne_file.len = name->len;
  9668				nr.nrm_old_entry.ne_file.data = (char *)name->name;
  9669				if (!xdrgen_encode_notify_remove4(stream, &nr)) {
  9670					pr_warn("nfsd: unable to marshal notify_remove4 to xdr stream\n");
  9671					continue;
  9672				}
  9673	
> 9674				trace_printk("encoded remove4 is %d bytes long\n", (u8 *)stream->p - p);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
