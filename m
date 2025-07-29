Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D90227EA8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753787534; cv=none; b=CfX4WwiRnZEBz2GEhBxDr6o+/JjudPh3cFYZvFwkZTAcV5rCEnNZ3mQZpyRf5qzxtX4EtzTLURcTvY96hcF5p64eYVteEedOcYZUb2hO/2Z/6FEx1gl0MfHMhcuLwkEi1CH69kLIv1M3yOdIpmizAESBt92wE5bUdfntck06Pm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753787534; c=relaxed/simple;
	bh=wT97VVDwLMc+b/OjXXAti28p7mNvFJSU8F4HZrAvuqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJqTeoI0QQFgM23FJNm+6JSYiaNXxvu4FD7ki8HV9yIh5pOa4PHZzSymH7iw3YO3J9CDx+RjkmNrrrVJ5wtkseYq9fbGyiLaGDESTJF9XsykMSUUuRoiB51Z+olUZi5C0yu066PasuPtnlrt2vPf55TIMoui5wYNpYncsTiKVaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLX0kNLP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLX0kNLP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753787532; x=1785323532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wT97VVDwLMc+b/OjXXAti28p7mNvFJSU8F4HZrAvuqU=;
  b=fLX0kNLPL6anKyC7AnKg02U4eoYwLajBd+U5AfAwvomN4DlzBHOb3h3v
   A0lLxgtlBU5MF2WrmQCJ7n/WSFNesLRzg6JSs7J08usEdcDNVGFb4D8WA
   GJwtUmQjZnj4UlZvC7wV1rWJkolA2go2YQ8bjieyf83jM9L7tlV1F1263
   QEdmi6AYoGql1dbTOy0imz+LJaZK6T4JZJfabZSV56AZZsVXyevd2T8gP
   hn3sUmyFp3huW5natFZO3sM7ksUbU4L1vPPim1J+gL82lVNiK7IblUy2m
   7Ud68WukYfmUcxdYqq65+O6mIQbi8JuIVRCKGsNnz2jd4BBtvXJNMem9Q
   A==;
X-CSE-ConnectionGUID: w+Y/OLDtQby+fimbCb6fIQ==
X-CSE-MsgGUID: uOTgjOX8QjSboRSi4CFiYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="73502271"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="73502271"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 04:12:10 -0700
X-CSE-ConnectionGUID: 7uMhsT3QQyWvToINElwc8A==
X-CSE-MsgGUID: /UCYX121R9yl9MJHbRyLtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="162712738"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Jul 2025 04:12:09 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugiFa-0001Dx-33;
	Tue, 29 Jul 2025 11:12:06 +0000
Date: Tue, 29 Jul 2025 19:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 35/35]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error:
 nbl_product_base.h: No such file or directory
Message-ID: <202507291941.PrxPXeLN-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   f5139a8dd3c12cb0a4d854039d7c6ae10a89a87f
commit: 7a025ab026a1cbd5622c8b14875b9e990db7a2b3 [35/35] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250729/202507291941.PrxPXeLN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291941.PrxPXeLN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291941.PrxPXeLN-lkp@intel.com/

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
