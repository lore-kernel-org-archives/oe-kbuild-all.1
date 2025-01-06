Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E758CBA34
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 19:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736192553; cv=none; b=cqnQXWjMfAS4Ongna1PjenRb303S3fMA34c+8iB8mW+LHlaXs+hvy2JVTIRtPyum/q9jvxcLKNGTFtKfrwM1d9Yq8ANe6Qx5BeXdKhmLR4DoG+xI6sZs1rnDpAqPdUUHwpkgcvt8/UIMgGXdal//yO0C4JonuZkKlhhduGTpInw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736192553; c=relaxed/simple;
	bh=xLqONzileMpvafHMju9QIuyUQkUiXEToJayU+CFcAoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSsmrl2HmyGc7CtWAtTzXZB4Q/fme2te2Svsx1z9ifYZ1vu3LZRdaJlyoy1S7iNeNHWH5tRWlgwE5Fl8xUpb/WicS00nyjIIwNhoZ6h9QrEd20zw1PeNP74cL4q3eRK2fTb7tvrLWV0tx70+fIFt6cJbnwyCSiHDUXMbBg0F9pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPXKvRYW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPXKvRYW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736192552; x=1767728552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xLqONzileMpvafHMju9QIuyUQkUiXEToJayU+CFcAoQ=;
  b=PPXKvRYW/fB5gdRqfANupDNt3A20DGW4AAFn8nJDOcBzSRchxEdbc8lr
   WxXWhyr6IChUfTYLgh7MMgOdkg4khXmpGvsNylF5XW0K3bvWTKpN8l/CL
   i+W98Niap6H2vJtzk448/DM6kJ6ELAPVm8vjCq9RdnPaecXq9teDLgYAl
   uQgF/EClXzGkZjYuy4CiMVr4TpOTlqNcXRsu+cK7ZwqbpuUNkTxiWam1p
   rTcEJfiT6Ir3S7g8Tq1BXjBJCWjO+v4/qX8htWhjBOqumNFtUAdS0f0yD
   SRev1AtIlblUfQGuxTahzaVgbfgU/fQM+l4d9pihIf4QKJyRtylB+9SMl
   g==;
X-CSE-ConnectionGUID: 7tHWpf+pRpG7uMTnjXnyeA==
X-CSE-MsgGUID: 7oabng2PRqipgxzYJWUKQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="46932689"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="46932689"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 11:42:31 -0800
X-CSE-ConnectionGUID: urjGneSMTEq+Zkx4M7JPlQ==
X-CSE-MsgGUID: gXBvqDZeTi6rAGu+aCWcjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="102723702"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jan 2025 11:42:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUszc-000Drn-07;
	Mon, 06 Jan 2025 19:42:28 +0000
Date: Tue, 7 Jan 2025 03:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 765/1347] drivers/scsi/ufs/ufshpb.c:680:45:
 error: passing argument 4 of 'blk_execute_rq_nowait' from incompatible
 pointer type
Message-ID: <202501070341.leBnf7Pr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: f34b8f68d863eb866fe5aa227ec32a772ceb55f1 [765/1347] block: change request end_io handler to pass back a return value
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250107/202501070341.leBnf7Pr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070341.leBnf7Pr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070341.leBnf7Pr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/ufs/ufshpb.c: In function 'ufshpb_execute_umap_req':
>> drivers/scsi/ufs/ufshpb.c:680:45: error: passing argument 4 of 'blk_execute_rq_nowait' from incompatible pointer type [-Werror=incompatible-pointer-types]
     680 |         blk_execute_rq_nowait(NULL, req, 1, ufshpb_umap_req_compl_fn);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             void (*)(struct request *, blk_status_t) {aka void (*)(struct request *, unsigned char)}
   In file included from include/linux/t10-pi.h:6,
                    from include/scsi/scsi_cmnd.h:7,
                    from drivers/scsi/ufs/ufshcd.h:41,
                    from drivers/scsi/ufs/ufshpb.c:15:
   include/linux/blk-mq.h:928:17: note: expected 'enum rq_end_io_ret (*)(struct request *, blk_status_t)' {aka 'enum rq_end_io_ret (*)(struct request *, unsigned char)'} but argument is of type 'void (*)(struct request *, blk_status_t)' {aka 'void (*)(struct request *, unsigned char)'}
     928 |                 rq_end_io_fn *);
         |                 ^~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c: In function 'ufshpb_execute_map_req':
   drivers/scsi/ufs/ufshpb.c:722:45: error: passing argument 4 of 'blk_execute_rq_nowait' from incompatible pointer type [-Werror=incompatible-pointer-types]
     722 |         blk_execute_rq_nowait(NULL, req, 1, ufshpb_map_req_compl_fn);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             void (*)(struct request *, blk_status_t) {aka void (*)(struct request *, unsigned char)}
   include/linux/blk-mq.h:928:17: note: expected 'enum rq_end_io_ret (*)(struct request *, blk_status_t)' {aka 'enum rq_end_io_ret (*)(struct request *, unsigned char)'} but argument is of type 'void (*)(struct request *, blk_status_t)' {aka 'void (*)(struct request *, unsigned char)'}
     928 |                 rq_end_io_fn *);
         |                 ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/blk_execute_rq_nowait +680 drivers/scsi/ufs/ufshpb.c

4b5f49079c52a7 Daejun Park 2021-07-12  665  
41d8a9333cc96f Daejun Park 2021-07-12  666  static void ufshpb_execute_umap_req(struct ufshpb_lu *hpb,
41d8a9333cc96f Daejun Park 2021-07-12  667  				   struct ufshpb_req *umap_req,
41d8a9333cc96f Daejun Park 2021-07-12  668  				   struct ufshpb_region *rgn)
41d8a9333cc96f Daejun Park 2021-07-12  669  {
41d8a9333cc96f Daejun Park 2021-07-12  670  	struct request *req;
41d8a9333cc96f Daejun Park 2021-07-12  671  	struct scsi_request *rq;
41d8a9333cc96f Daejun Park 2021-07-12  672  
41d8a9333cc96f Daejun Park 2021-07-12  673  	req = umap_req->req;
41d8a9333cc96f Daejun Park 2021-07-12  674  	req->timeout = 0;
41d8a9333cc96f Daejun Park 2021-07-12  675  	req->end_io_data = (void *)umap_req;
41d8a9333cc96f Daejun Park 2021-07-12  676  	rq = scsi_req(req);
41d8a9333cc96f Daejun Park 2021-07-12  677  	ufshpb_set_unmap_cmd(rq->cmd, rgn);
41d8a9333cc96f Daejun Park 2021-07-12  678  	rq->cmd_len = HPB_WRITE_BUFFER_CMD_LENGTH;
41d8a9333cc96f Daejun Park 2021-07-12  679  
41d8a9333cc96f Daejun Park 2021-07-12 @680  	blk_execute_rq_nowait(NULL, req, 1, ufshpb_umap_req_compl_fn);
6f4ad14f0fb9f0 Avri Altman 2021-07-12  681  
6f4ad14f0fb9f0 Avri Altman 2021-07-12  682  	hpb->stats.umap_req_cnt++;
41d8a9333cc96f Daejun Park 2021-07-12  683  }
41d8a9333cc96f Daejun Park 2021-07-12  684  

:::::: The code at line 680 was first introduced by commit
:::::: 41d8a9333cc96f5ad4dd7a52786585338257d9f1 scsi: ufs: ufshpb: Add HPB 2.0 support

:::::: TO: Daejun Park <daejun7.park@samsung.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
