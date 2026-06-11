Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E76F36A379
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 22:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216155; cv=none; b=Zj3hpD+KExwJ7RbTju1PwoyzfTy7t4/5CS9Q8n60U4CPT4GW17KXbSxy4gA1T4pdEOoWQrBsNebG87itZ7tm+LYSraOnE8kLpbxu3AyTm+PP39Vq7sjMXRCKYNBwDPn5L6uAPuyms/zV2MOMOBH/+MD5zzzmir8la/tt8DeRpvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216155; c=relaxed/simple;
	bh=Ynp6fxIirKiJ9ETtqsaB2TbNur8yt+KemFdw3WfxzWc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=awh7Z1D3nXJEbEG2pydtcwKpl9VSDdpGmTiYOO8VjNH7oyEtWTcgt9qBUfY9CuLTm4h0xyJx2EKuMm1WArL9mFdQ30+dTpYVMIlsEKJDAYCKYJl9sHzm8jV6I4oNX76hkFG2GsQOb1JFOw2t7LcSbpANsx0N8fRUEYkQ2FzpmVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0WfNHEa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0WfNHEa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781216153; x=1812752153;
  h=date:from:to:cc:subject:message-id;
  bh=Ynp6fxIirKiJ9ETtqsaB2TbNur8yt+KemFdw3WfxzWc=;
  b=K0WfNHEacVs5AmyozQkX3NS0F2ObeOxP1T6Qvgrk9GW3ARX+onCPDRht
   5FXuqqqs0cDq4AHxcDQnWNPo4Q0ppE2I8eV5j+9o6NU9OMk/ONDtPERYl
   mceryf6yp66cQApHWkLWV91HM3oLrhJolJ03ECcJYJObNNrvq7KdBUfaH
   LYEsYyw6Z/tdGcPmyDOPYpdZ3KF759ECA9ASdTCFP4V42pghaZ2/TZMHo
   3YAgPQzsE1t8irRQA8keQMgtN+GiVIQ71KC409Dmxl0pCi9i+LlZLQ1iJ
   lUyiEGlxaZ5XusnMv4F0dVENTzzTQStsxjeaK4qi/rdeNVapGaR5xnl50
   w==;
X-CSE-ConnectionGUID: Fq2H2IFXSviPQZ/Iiq21Lw==
X-CSE-MsgGUID: GOJfh+fbSPawitQtRoG1BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107479801"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="107479801"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 15:15:53 -0700
X-CSE-ConnectionGUID: ThLN+v7pTBiRokEY2q4UpA==
X-CSE-MsgGUID: wbsfQGldT/yLgaB0dLpEOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251722433"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2026 15:15:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXngj-00000000Nvf-0NgM;
	Thu, 11 Jun 2026 22:15:49 +0000
Date: Fri, 12 Jun 2026 06:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/38]
 include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct
 rq_list'
Message-ID: <202606120634.reTH6NpH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17584f778119ed93d9ae85feb43561e05f5254b0
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [0/38] UPSTREAM: block: add a rq_list type
config: x86_64-randconfig-001-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120634.reTH6NpH-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120634.reTH6NpH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120634.reTH6NpH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from fs/nfs/nfs4trace.c:6:
>> include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                        ^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from fs/nfs/nfs4trace.c:7:
   In file included from include/linux/nfs_fs.h:31:
   In file included from include/linux/sunrpc/auth.h:13:
   In file included from include/linux/sunrpc/sched.h:19:
   include/linux/sunrpc/xdr.h:782:46: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     782 |         if (U32_MAX >= SIZE_MAX / sizeof(*p) && len > SIZE_MAX / sizeof(*p))
         |                                                 ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   In file included from include/linux/blk-mq.h:5:
>> include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                        ^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
>> include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
     239 |         return rl->head == NULL;
         |                ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
>> include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
     244 |         rl->head = NULL;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
     245 |         rl->tail = NULL;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
     251 |         if (rl->tail)
         |             ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
     252 |                 rl->tail->rq_next = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
     254 |                 rl->head = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
     255 |         rl->tail = rq;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
     260 |         rq->rq_next = rl->head;
         |                       ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
     261 |         rl->head = rq;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
     262 |         if (!rl->tail)
         |              ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
     263 |                 rl->tail = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
     268 |         struct request *rq = rl->head;
         |                              ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
     271 |                 rl->head = rl->head->rq_next;

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +1699 include/linux/blkdev.h

  1697	
  1698	struct io_comp_batch {
> 1699		struct rq_list req_list;
  1700		bool need_ts;
  1701		void (*complete)(struct io_comp_batch *);
  1702	};
  1703	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
