Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081781CC14A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405752; cv=none; b=qBX6qqAJmpgxdQdebbzxQRnMj5h8Cw2lalrKJ5Lf3GOj9zQBTt2F0NxILUlan1FFl4bcS+ljSWrTeOjrJmkQFXJvmzc2IJw2CHyFM1tsfo2T2UDb/rs2YCYs+/AseQ6cTL0NvbB7rHaAvdG0hwSeSSr4vpiU2Hib9hU7nXXxGoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405752; c=relaxed/simple;
	bh=krWCIOgTemw/5Ro1e9/y4f5hkD1qz6urbTbSW5gwuXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7bDCeVGDX9i3wqIOPLAKqGSvUtgcOqRp7d8LrmXvVk2YSLR74GxooCDZ7WCciCNtkb3yLTg6bB/TA4RmAG6J/099FU4mxNljeun/bA/w59NI0gtkF4BI254z77b02FzPh947IFCTTZiU5GH5QPm9IVao77B6RJJ5Id4q5ph374=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itehYhyb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itehYhyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730405747; x=1761941747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=krWCIOgTemw/5Ro1e9/y4f5hkD1qz6urbTbSW5gwuXg=;
  b=itehYhybkVrdwGsj+6x8Aja9jAhSLsldRDoQYUYifBMSGGtPkkHHLLIE
   6vRnOhoqYTZY2suAQG4gaaJ+tYsdFoxXTwJ9gG1PpGLK0SlvNcLfFlZAh
   PmefCUY6PFyu3kvDr3zssFfEEd39TA6pdQAl7KJhrr22f4Qq4f3WuxwDY
   2B/LiXo8IaOgJMdzXLrEpEvchduyCy+NBghuL4QOh/X2oyBmpZGRIYSFZ
   q2NpDgOnjJJFJgC9TQL0O3aSZOyZCGCZGDBTOudXW7hGNXJCxSxXFCSft
   IXk4LCIvuHUyhkhDFEW+4dBt8rytEWDXYgH7VynTjIRKlNnUIVOm+54It
   w==;
X-CSE-ConnectionGUID: rkQtRYwkQn+MT6BwTB1CKA==
X-CSE-MsgGUID: zHMjc8hDTCmW4Bw16s5K7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52734402"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52734402"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 13:15:46 -0700
X-CSE-ConnectionGUID: 9HDaZ4qVQ868gGq3C2MQmQ==
X-CSE-MsgGUID: vxlNGZL4RyGM/W58WnmytQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87512260"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Oct 2024 13:15:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6ba2-000gg8-1T;
	Thu, 31 Oct 2024 20:15:42 +0000
Date: Fri, 1 Nov 2024 04:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/extended-linear 4/5] drivers/cxl/core/mbox.c:8:10: fatal
 error: asm/mce.h: No such file or directory
Message-ID: <202411010400.FKN9K98L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/extended-linear
head:   c4724382d8850a1fd8ea8b7777e1ef783c31f480
commit: 6c38847990ac33ff84ee4c96452cecff09caac37 [4/5] cxl: Add extended linear cache address alias emission for cxl events
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241101/202411010400.FKN9K98L-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010400.FKN9K98L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010400.FKN9K98L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/mbox.c:8:10: fatal error: asm/mce.h: No such file or directory
       8 | #include <asm/mce.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +8 drivers/cxl/core/mbox.c

   > 8	#include <asm/mce.h>
     9	#include <cxlpci.h>
    10	#include <cxlmem.h>
    11	#include <cxl.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
