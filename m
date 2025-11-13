Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF91B244679
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 22:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763071396; cv=none; b=skkZC0yfXtnRjCMSXivwYwjY4VYAiydg6mlyDtcGQvbXmHeac/jp5QkqxAR+XpaXlzUtCVI51JYoN/EGJYhnXOvEOs1f5748tI9kb+el7g5fghzJbylrclDIegSOhsk0C22uE8Fsj3YYuGLLhhpT3maVWTPWUHubZg1k6ifWwAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763071396; c=relaxed/simple;
	bh=Wps90ZT0HGenQlKg7whLQwiMBIuTltM8PESaXxGlWWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OKYtJC62Mwcxi1Dy+Nem3nVOGADmCrOXbc30TRhbaP7s6J8h/Vyn5y2MWc1TvcX9Qke7oGWSg1UjBJteBB6+im6VD1YUa/i+EwxWQ9DFYp8tV7o1ZrVo8FtFhuBF1a//Ulqq5MiH9GvlxEifS3pO87itUPiU4kG8ywfXDPDSy3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9f+I6Rg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9f+I6Rg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763071394; x=1794607394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wps90ZT0HGenQlKg7whLQwiMBIuTltM8PESaXxGlWWE=;
  b=T9f+I6RgF54st7uPzd62mXOXGhGk7OL9GjBSuDyhM+vGqQF+gfZZOw57
   WkFUXpVVP7SHTtMkeMHE0KbNa8z9i+BXUlaE5c2HTVOQjoHWVv4JS9Mee
   yDKNCBh4VBRvvHuQ8UofslY74MxhwRWn/8RDDRGhWmBpHq8Q5oDAMXWZz
   iDmXmOCWJmrZBFyD/3UkjYCM0T47y0rQXOevkuIP7YJ49CU4l2urqm5Ia
   IEdp9AElEkt3ikwLwl0aoRftwEd0xhmz7DM7rZo1+Xd4mmNKsMctm9e0m
   p2lidZnbMS3tNJ+4WxvOSpHnyzKLlWnCi41Uj+9gkirYGU6RuMTngcqHh
   w==;
X-CSE-ConnectionGUID: iq4LkqqmQNSrOkTD1cdl3g==
X-CSE-MsgGUID: KfUDZG2sR8O5Jlrbq/k+/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82557906"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="82557906"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 14:03:14 -0800
X-CSE-ConnectionGUID: dup0v7o6QHiKF7uDPTczZQ==
X-CSE-MsgGUID: UxLY/pFvTmGhyFLxd0+hqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="190379321"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2025 14:03:12 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJfPK-0005vT-1B;
	Thu, 13 Nov 2025 22:03:10 +0000
Date: Fri, 14 Nov 2025 06:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-numa-sched-domain-ANBZ26672 3/3]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error:
 nbl_product_base.h: No such file or directory
Message-ID: <202511140528.dJAz3idU-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-numa-sched-domain-ANBZ26672
head:   bf45c63d740e8e294a0a11035769798525015c5c
commit: 059837f47f887848d0068cb0431354e8e1197e44 [3/3] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251114/202511140528.dJAz3idU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140528.dJAz3idU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140528.dJAz3idU-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error: nbl_product_base.h: No such file or directory
      10 | #include "nbl_product_base.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.h:9:10: fatal error: nbl_resource.h: No such file or directory
       9 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_tun_leonis.c:1:10: fatal error: nbl_resource.h: No such file or directory
       1 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.h:10:10: fatal error: nbl_resource.h: No such file or directory
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.h:10:10: fatal error: nbl_resource.h: No such file or directory
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_tc_tun.c:5:10: fatal error: nbl_resource.h: No such file or directory
       5 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.


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
