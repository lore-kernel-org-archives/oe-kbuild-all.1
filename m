Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD716F4ED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 09:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748077420; cv=none; b=u/vXKrDNFjO70ABvFYTl8h41/RNeBTtL66QlaqdmlOhyiFkVvkIxqUx/G09i4/3+xO1DUe3K25Rb7dFRIFcwaU5/cdYlvtAKgSIbKTEISV9fK6TzGLbTfd25q6daDANONHr4mSPgl/FGIgoOfPOTsSc+Nl5yyjcHXplx+H/qMdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748077420; c=relaxed/simple;
	bh=JODdN0ccs0MZXyrkNWBncStKhn3SxBkf32oRwBI5eTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hpr+rwlovxoxcP+72oGDej3A1gTzqkzPXvSwq+XARviszZ2lHv4FnAa1nx/MSu2Bf5tQxgXV4xgB0iL2p3KHQsdJXjq1pF7iZgznEvbPg4EFpbIzHvYKpx0Yxezn5LqQF9BjgZcva1Z0H4iRJ3D4sAC82XuJ64Z7WszP2R2eoA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gm1LXgG0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gm1LXgG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748077419; x=1779613419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JODdN0ccs0MZXyrkNWBncStKhn3SxBkf32oRwBI5eTc=;
  b=Gm1LXgG07OenVJFosTZQdM1Tc3ZoUJfwkRQ6f7chx8goMX0yDb9aJqiT
   Neslh4wQlaijKYVJQ+yxbvhjYagNSxvGFchey4pblnBYynPVwfx4aBoxN
   VUUPCD3B07IRECldGUaIt4SDpm4dVcVtYEfIusvkn5tTaW8ozjU+bcPo6
   a+5vLguu0cFXbNqzn51uiuMJWqLrK6a170ZOqeRn+Lkqwrb4+88oEAYby
   rW8uYMMiF2p9+NubLWbZzbwzkL0hwKFhq6IZNNmP43R7UHJHrwtquy7pC
   Fwzsg7V4TiSVysW/RR18xyifp2d+OtcyzxJYPbPz2wQHJArMs1SJ/aAqC
   A==;
X-CSE-ConnectionGUID: AZ/PbmITRUuAlrAvbtZGEQ==
X-CSE-MsgGUID: jEWdw6uNSbWJLby6JHpMCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61529898"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="61529898"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 02:03:38 -0700
X-CSE-ConnectionGUID: DeiWNAslTh6UKeHlurwFbA==
X-CSE-MsgGUID: X3TGzdOmTsGvvlprtmQYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="145451707"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 May 2025 02:03:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIkn1-000R4O-0F;
	Sat, 24 May 2025 09:03:35 +0000
Date: Sat, 24 May 2025 17:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 43/45] fs/nfsd/nfs4state.c:9708:38: warning:
 format '%ld' expects argument of type 'long int', but argument 2 has type
 'int'
Message-ID: <202505241639.cBZR074e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   9269fcb6b78c95611f229f90e3d7d82520580e88
commit: aae085e8fb728d651e71ab540c8c695af221db51 [43/45] DEBUG: trace_printks all over the place
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250524/202505241639.cBZR074e-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241639.cBZR074e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241639.cBZR074e-lkp@intel.com/

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
>> fs/nfsd/nfs4state.c:9708:38: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'int' [-Wformat=]
    9708 |                         trace_printk("encoded remove4 is %ld bytes long\n", (u8 *)stream->p - p);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~~~~~
         |                                                                                             |
         |                                                                                             int
   include/linux/kernel.h:238:47: note: in definition of macro '__trace_printk_check_format'
     238 |                 ____trace_printk_check_format(fmt, ##args);             \
         |                                               ^~~
   include/linux/kernel.h:275:17: note: in expansion of macro 'do_trace_printk'
     275 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                 ^~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:9708:25: note: in expansion of macro 'trace_printk'
    9708 |                         trace_printk("encoded remove4 is %ld bytes long\n", (u8 *)stream->p - p);
         |                         ^~~~~~~~~~~~
   fs/nfsd/nfs4state.c:9708:60: note: format string is defined here
    9708 |                         trace_printk("encoded remove4 is %ld bytes long\n", (u8 *)stream->p - p);
         |                                                          ~~^
         |                                                            |
         |                                                            long int
         |                                                          %d
   fs/nfsd/nfs4state.c:9708:38: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
    9708 |                         trace_printk("encoded remove4 is %ld bytes long\n", (u8 *)stream->p - p);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~~~~~
         |                                                                                             |
         |                                                                                             int
   include/linux/kernel.h:291:43: note: in definition of macro 'do_trace_printk'
     291 |                 __trace_printk(_THIS_IP_, fmt, ##args);                 \
         |                                           ^~~
   fs/nfsd/nfs4state.c:9708:25: note: in expansion of macro 'trace_printk'
    9708 |                         trace_printk("encoded remove4 is %ld bytes long\n", (u8 *)stream->p - p);
         |                         ^~~~~~~~~~~~
   fs/nfsd/nfs4state.c:9708:60: note: format string is defined here
    9708 |                         trace_printk("encoded remove4 is %ld bytes long\n", (u8 *)stream->p - p);
         |                                                          ~~^
         |                                                            |
         |                                                            long int
         |                                                          %d


vim +9708 fs/nfsd/nfs4state.c

  9645	
  9646	int
  9647	nfsd_handle_dir_event(u32 mask, const struct inode *dir, const void *data,
  9648			      int data_type, const struct qstr *name)
  9649	{
  9650		struct inode *inode = fsnotify_data_inode(data, data_type);
  9651		struct file_lock_context *ctx;
  9652		struct file_lock_core *flc;
  9653	
  9654		trace_nfsd_file_fsnotify_handle_dir_event(inode, dir, mask);
  9655	
  9656		ctx = locks_inode_context(dir);
  9657		if (!ctx || list_empty(&ctx->flc_lease)) {
  9658			trace_printk("no ctx or list_empty\n");
  9659			return 0;
  9660		}
  9661	
  9662		/*
  9663		 * FIXME: Do getattr against @inode, and then generate an fattr4. Use that as the
  9664		 * ne_attrs in the notify_entry4's.
  9665		 */
  9666		spin_lock(&ctx->flc_lock);
  9667		list_for_each_entry(flc, &ctx->flc_lease, flc_list) {
  9668			struct file_lease *fl = container_of(flc, struct file_lease, c);
  9669			struct nfs4_delegation *dp = flc->flc_owner;
  9670			struct nfsd4_cb_notify *ncn = &dp->dl_cb_notify;
  9671			struct nfsd4_notify_spool *nns = ncn->ncn_gather;
  9672			struct xdr_stream *stream = &nns->nns_stream;
  9673			static uint32_t zerobm = 0;
  9674	
  9675			trace_printk("considering fl=%p\n", fl);
  9676			if (fl->fl_lmops != &nfsd_dir_lease_mng_ops) {
  9677				trace_printk("fl_lmops doesn't match\n");
  9678				continue;
  9679			}
  9680	
  9681			/* If no buffer or slots are available, give up and break the deleg */
  9682			if (!nns || nns->nns_idx >= NFSD4_NOTIFY_SPOOL_SZ) {
  9683				trace_printk("no buffer");
  9684				nfsd_break_deleg_cb(fl);
  9685				continue;
  9686			}
  9687	
  9688			if (mask & FS_DELETE) {
  9689				static uint32_t notify_remove_bitmap = BIT(NOTIFY4_REMOVE_ENTRY);
  9690				struct notify4 *ent = &nns->nns_ent[nns->nns_idx];
  9691				struct notify_remove4 nr = { };
  9692				u8 *p = (u8 *)(stream->p);
  9693	
  9694				if (!(flc->flc_flags & FL_IGN_DIR_DELETE)) {
  9695					trace_printk("FL_IGN_DIR_DELETE not set\n");
  9696					continue;
  9697				}
  9698	
  9699				nr.nrm_old_entry.ne_file.len = name->len;
  9700				nr.nrm_old_entry.ne_file.data = (char *)name->name;
  9701				nr.nrm_old_entry.ne_attrs.attrmask.count = 1;
  9702				nr.nrm_old_entry.ne_attrs.attrmask.element = &zerobm;
  9703				if (!xdrgen_encode_notify_remove4(stream, &nr)) {
  9704					pr_warn("nfsd: unable to marshal notify_remove4 to xdr stream\n");
  9705					continue;
  9706				}
  9707	
> 9708				trace_printk("encoded remove4 is %ld bytes long\n", (u8 *)stream->p - p);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
