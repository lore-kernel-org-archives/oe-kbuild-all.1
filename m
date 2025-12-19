Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23372D836D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 19:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766173275; cv=none; b=bdXjMwXP8qXOZxb9TVXHSFMApJKSTofC59JuWyB5+bcs/1K7xZ8w5icVxZTFzQVtM2VFwT2v4mCCtrzYQmW/yYAyNtPmgDKoVqr4LTUSQ8Wf/COp7WHX0eMpmUIfpoM63K+Y3nvHN8kLSIb39we7iSiuB2/9RP3Z6l4i7dJGhOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766173275; c=relaxed/simple;
	bh=BdgEtSnt4RdIRR9TRw0/cFfo9oeyhuNZPOBgkzeHdrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=reCypLdYVVYB2+i09Mdt5oq250IdwsKeqpQr37essfOWWUb18fXCL2tEugJA9sWCukT3mgNbtJyO0QxGdPPiGNZN6QNAxhSBkhs/pXHOl6Ab3VyyXOctHQve7qyMcElqIX+ZwbP/opdYbwdWJU3pBBX8DRHRpt+0uBIz7xl16Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUQeIuYb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUQeIuYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766173274; x=1797709274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BdgEtSnt4RdIRR9TRw0/cFfo9oeyhuNZPOBgkzeHdrE=;
  b=QUQeIuYblS6Tz4ECnQWShZkd0WO3IF2zz1X8sdSUPehwANPW3EhAQGFh
   btL+AV/7tKY7fI+3osqq751KIt+R8n18mb4UUVD14azp58RNJLsFf8+nq
   pJxkO0wTG0gZemcoM+At6vXvZaojXf/fIWcQXL5hytytL4pa+dRPurkaa
   u8aAWkY5CK0htpqwUmcrY8F8JWIkeuX4kOfUasLTIn/vbsjmfdK1epnUA
   qSjEizNweG3XiVRAakxsraIAsyjiOLXVi/TOfv0yQbGS+jTYxRVdcB45B
   75eDAEINEgNVf7QJ0GjqUoLpHa0ZXiqXLYb/FWuZlBxQxDcTRc/HeWsPQ
   g==;
X-CSE-ConnectionGUID: cjQH/GTERuqfj/tGXnqwzA==
X-CSE-MsgGUID: Y5A4DG3MQEKtPClYipjuNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67133575"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="67133575"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 11:41:13 -0800
X-CSE-ConnectionGUID: PGN96lFFQWWxjQOf8dERSQ==
X-CSE-MsgGUID: pDMhsPRzSM22fpzO3mUNXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198093591"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Dec 2025 11:41:13 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWgLd-000000003wM-46Gq;
	Fri, 19 Dec 2025 19:41:09 +0000
Date: Sat, 20 Dec 2025 03:40:20 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-Uncore-sysfs-ANBZ26617 18/18]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error:
 nbl_product_base.h: No such file or directory
Message-ID: <202512200356.6FACrSxs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi nebula_matrix_driver,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-Uncore-sysfs-ANBZ26617
head:   ca5ab61a687caf05d0e5c5b4a24434fa6fe362b0
commit: 059837f47f887848d0068cb0431354e8e1197e44 [18/18] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251220/202512200356.6FACrSxs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200356.6FACrSxs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200356.6FACrSxs-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error: nbl_product_base.h: No such file or directory
      10 | #include "nbl_product_base.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   cc1: all warnings being treated as errors
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.h:9:10: fatal error: nbl_resource.h: No such file or directory
       9 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
   cc1: all warnings being treated as errors
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_tun_leonis.c:1:10: fatal error: nbl_resource.h: No such file or directory
       1 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
   cc1: all warnings being treated as errors
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.h:10:10: fatal error: nbl_resource.h: No such file or directory
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
   cc1: all warnings being treated as errors
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.h:10:10: fatal error: nbl_resource.h: No such file or directory
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
   cc1: all warnings being treated as errors
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_tc_tun.c:5:10: fatal error: nbl_resource.h: No such file or directory
       5 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
   cc1: all warnings being treated as errors


vim +10 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h

     9	
  > 10	#include "nbl_product_base.h"
    11	#include "nbl_def_channel.h"
    12	#include "nbl_def_phy.h"
    13	#include "nbl_def_resource.h"
    14	#include "nbl_def_dispatch.h"
    15	#include "nbl_def_service.h"
    16	#include "nbl_def_dev.h"
    17	#include "nbl_def_common.h"
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
