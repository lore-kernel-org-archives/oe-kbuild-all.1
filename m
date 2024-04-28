Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1698428FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 12:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714307797; cv=none; b=YDPSZNJvW2sW+ydXrBU7M7hJLgBCUrm/aLh+Ym/C7jxx46tXMc7sufBSQzjbp9wfdiWsaVXPANVsW7dn1W7S9fyyzHe5PRS3OehfN3a/ZI7KtChBUAOOrcX8GtaSaM+YNGdLCg7KFz6IuTHT++ihU3mcDjNA+pVcmGBnpFfY1Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714307797; c=relaxed/simple;
	bh=V5NS7HI+EVHD6fkbWy3azlpBgYKOs8knpNf+mi4aB6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HsVIpKtYB1l46T+j2xNviHvGNbNjjwnKhGgpipHC2o6fnIBr9jeKlid0HImtfRNydhan0FpH+Ew16/9QeC0Hw6kyQ5W21WBGyLM7FbezPDknR9bYFdfEpT/oWjdF/CFxUu83mPiC9MDOZi+urrRiUEvZFXCQX3IvDcWQwdCI2o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9U3fRsT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9U3fRsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714307795; x=1745843795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V5NS7HI+EVHD6fkbWy3azlpBgYKOs8knpNf+mi4aB6Y=;
  b=D9U3fRsTa4jZLeK1qd/uLuzcC4xu1J3At3sIyu8K6CENiIOIkXD/+ybu
   dkGUAll/GnJwEKpaXChthAJYefeczdqCKFXtOmL48VJ0IJThShBTGlEWc
   iK0DQrFaA6ZRDELfuA2MHKqEzrfAMclDHT1wQSln8u+x/gYjoohgXyWLZ
   jsYgWAHYpb6MzBiIj0xI7wBrefJ2wPBIqgb8RYDcMKx8nc649vpZaqQE2
   48JFfs3ZHh0HmoqM3fEx0xC7ZyA/nLdVq2O6LmI/yqWZfimaU7IEjwIyu
   q+XTahSCiCLD+7ozenSh6GTJF5V5bWwS3gMHL36hX5j10zL+LhpVnLY/+
   Q==;
X-CSE-ConnectionGUID: PV9Nr3UpQUGP3+ThuOpHNQ==
X-CSE-MsgGUID: ZX3c/DHzTLSZBFtanxjP2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27501113"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="27501113"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 05:36:34 -0700
X-CSE-ConnectionGUID: oRVEP+o7TjGKqOGhjLbLoA==
X-CSE-MsgGUID: tKDI6wC4QL6JhQ2cGwi88g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="25861250"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Apr 2024 05:36:32 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s13ld-0006Ms-3C;
	Sun, 28 Apr 2024 12:36:29 +0000
Date: Sun, 28 Apr 2024 20:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7603/7617]
 drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:10:
 warning: the current #pragma pack alignment value is modified in the
 included file
Message-ID: <202404282049.k0qBLpt4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   914551aad506a7dbdf214c9f49956ed47b8769b5
commit: 5bc8dbb5fdf565625b2eea4080dbd70bade992b8 [7603/7617] infiniband/hw/hiroce3: Add Huawei Intelligent Network Card RDMA Driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240428/202404282049.k0qBLpt4-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404282049.k0qBLpt4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404282049.k0qBLpt4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
>> drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_ccf_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_ccf_format.h:720:9: note: previous '#pragma pack' directive that modifies alignment is here
     720 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:
>> drivers/infiniband/hw/hiroce3/include/rdma/roce_dif_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_verbs_mr_attr.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      15 | #include "roce_dif_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
>> drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "rdma_ext_ctx_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:377:9: note: previous '#pragma pack' directive that modifies alignment is here
     377 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
>> drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       7 | #include "rdma_context_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:5179:9: note: previous '#pragma pack' directive that modifies alignment is here
    5179 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "roce_verbs_pub.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_pub.h:223:9: note: previous '#pragma pack' directive that modifies alignment is here
     223 | #pragma pack()
         |         ^
   6 warnings generated.
--
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:13:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
>> drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_ccf_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_ccf_format.h:720:9: note: previous '#pragma pack' directive that modifies alignment is here
     720 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:13:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:
>> drivers/infiniband/hw/hiroce3/include/rdma/roce_dif_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_verbs_mr_attr.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:13:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      15 | #include "roce_dif_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:13:
>> drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "rdma_ext_ctx_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:377:9: note: previous '#pragma pack' directive that modifies alignment is here
     377 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
>> drivers/infiniband/hw/hiroce3/cq/roce_cq.h:13:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      13 | #include "rdma_context_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:5179:9: note: previous '#pragma pack' directive that modifies alignment is here
    5179 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:15:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "roce_verbs_pub.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_pub.h:223:9: note: previous '#pragma pack' directive that modifies alignment is here
     223 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:15:
>> drivers/infiniband/hw/hiroce3/roce.h:30:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      30 | #include "roce_verbs_cmd.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_pub.h:223:9: note: previous '#pragma pack' directive that modifies alignment is here
     223 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   drivers/infiniband/hw/hiroce3/cq/roce_cq.h:15:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      15 | #include "roce.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_attr.h:411:9: note: previous '#pragma pack' directive that modifies alignment is here
     411 | #pragma pack()
         |         ^
   8 warnings generated.
--
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
>> drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_ccf_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_ccf_format.h:720:9: note: previous '#pragma pack' directive that modifies alignment is here
     720 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:
>> drivers/infiniband/hw/hiroce3/include/rdma/roce_dif_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_verbs_mr_attr.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      15 | #include "roce_dif_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
>> drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "rdma_ext_ctx_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:377:9: note: previous '#pragma pack' directive that modifies alignment is here
     377 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
>> drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       7 | #include "rdma_context_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:5179:9: note: previous '#pragma pack' directive that modifies alignment is here
    5179 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "roce_verbs_pub.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_pub.h:223:9: note: previous '#pragma pack' directive that modifies alignment is here
     223 | #pragma pack()
         |         ^
>> drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:63:5: warning: no previous prototype for function 'roce3_cq_hw2sw' [-Wmissing-prototypes]
      63 | int roce3_cq_hw2sw(struct roce3_device *rdev, struct roce3_cq *cq)
         |     ^
   drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      63 | int roce3_cq_hw2sw(struct roce3_device *rdev, struct roce3_cq *cq)
         | ^
         | static 
   7 warnings generated.
--
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:26:
   In file included from drivers/infiniband/hw/hiroce3/roce_event.h:20:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
>> drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_ccf_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_ccf_format.h:720:9: note: previous '#pragma pack' directive that modifies alignment is here
     720 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:26:
   In file included from drivers/infiniband/hw/hiroce3/roce_event.h:20:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:
>> drivers/infiniband/hw/hiroce3/include/rdma/roce_dif_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_verbs_mr_attr.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:26:
   In file included from drivers/infiniband/hw/hiroce3/roce_event.h:20:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      15 | #include "roce_dif_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:26:
   In file included from drivers/infiniband/hw/hiroce3/roce_event.h:20:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
>> drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "rdma_ext_ctx_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:377:9: note: previous '#pragma pack' directive that modifies alignment is here
     377 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:26:
   In file included from drivers/infiniband/hw/hiroce3/roce_event.h:20:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
>> drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       7 | #include "rdma_context_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:5179:9: note: previous '#pragma pack' directive that modifies alignment is here
    5179 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:26:
   In file included from drivers/infiniband/hw/hiroce3/roce_event.h:20:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "roce_verbs_pub.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_pub.h:223:9: note: previous '#pragma pack' directive that modifies alignment is here
     223 | #pragma pack()
         |         ^
>> drivers/infiniband/hw/hiroce3/roce_main.c:1256:6: warning: no previous prototype for function 'roce3_need_proc_link_event' [-Wmissing-prototypes]
    1256 | bool roce3_need_proc_link_event(void *hwdev)
         |      ^
   drivers/infiniband/hw/hiroce3/roce_main.c:1256:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1256 | bool roce3_need_proc_link_event(void *hwdev)
         | ^
         | static 
>> drivers/infiniband/hw/hiroce3/roce_main.c:1296:6: warning: no previous prototype for function 'roce3_need_proc_bond_event' [-Wmissing-prototypes]
    1296 | bool roce3_need_proc_bond_event(void *hwdev)
         |      ^
   drivers/infiniband/hw/hiroce3/roce_main.c:1296:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1296 | bool roce3_need_proc_bond_event(void *hwdev)
         | ^
         | static 
>> drivers/infiniband/hw/hiroce3/roce_main.c:1401:6: warning: no previous prototype for function 'roce3_event' [-Wmissing-prototypes]
    1401 | void roce3_event(struct hinic3_lld_dev *lld_dev, void *uld_dev, struct hinic3_event_info *event)
         |      ^
   drivers/infiniband/hw/hiroce3/roce_main.c:1401:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1401 | void roce3_event(struct hinic3_lld_dev *lld_dev, void *uld_dev, struct hinic3_event_info *event)
         | ^
         | static 
   9 warnings generated.
--
   In file included from drivers/infiniband/hw/hiroce3/mr/roce_mr.c:4:
   In file included from drivers/infiniband/hw/hiroce3/mr/roce_mr.h:15:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
>> drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_ccf_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_ccf_format.h:720:9: note: previous '#pragma pack' directive that modifies alignment is here
     720 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/mr/roce_mr.c:4:
   In file included from drivers/infiniband/hw/hiroce3/mr/roce_mr.h:15:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:
>> drivers/infiniband/hw/hiroce3/include/rdma/roce_dif_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_verbs_mr_attr.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/mr/roce_mr.c:4:
   In file included from drivers/infiniband/hw/hiroce3/mr/roce_mr.h:15:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      15 | #include "roce_dif_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/mr/roce_mr.c:4:
   In file included from drivers/infiniband/hw/hiroce3/mr/roce_mr.h:15:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
>> drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "rdma_ext_ctx_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:377:9: note: previous '#pragma pack' directive that modifies alignment is here
     377 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/mr/roce_mr.c:4:
   In file included from drivers/infiniband/hw/hiroce3/mr/roce_mr.h:15:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
>> drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       7 | #include "rdma_context_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:5179:9: note: previous '#pragma pack' directive that modifies alignment is here
    5179 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/mr/roce_mr.c:4:
   In file included from drivers/infiniband/hw/hiroce3/mr/roce_mr.h:15:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "roce_verbs_pub.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_pub.h:223:9: note: previous '#pragma pack' directive that modifies alignment is here
     223 | #pragma pack()
         |         ^
>> drivers/infiniband/hw/hiroce3/mr/roce_mr.c:914:5: warning: no previous prototype for function 'roce3_check_mr_status' [-Wmissing-prototypes]
     914 | int roce3_check_mr_status(struct ib_mr *ibmr, u32 check_mask, struct ib_mr_status *mr_status)
         |     ^
   drivers/infiniband/hw/hiroce3/mr/roce_mr.c:914:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     914 | int roce3_check_mr_status(struct ib_mr *ibmr, u32 check_mask, struct ib_mr_status *mr_status)
         | ^
         | static 
   7 warnings generated.
..


vim +8 drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h

     6	
     7	#include "roce_hmm_context.h"
   > 8	#include "rdma_ext_ctx_format.h"
     9	
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
