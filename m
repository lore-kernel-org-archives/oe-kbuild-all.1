Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFB32DF3D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753897257; cv=none; b=rWXJlv5jsIVtP2PTK55e5G0rGdvrsjtw2zY8OwwrPYWmBj+pHLQkHodKZpSABi7vCWbM225lPZRRdiVaFKyacq0NxYScPxg2oW58CVCanITHobkNIMwFFlErX1NMD6jsQDo5Fdu8DCoKhBoPGuc5rhIJIi/2VcBKAF7UuDIFmtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753897257; c=relaxed/simple;
	bh=7pVi/yMYJdH8BSLRoov/mVW7xvRN8paxTK65JoTnSfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZxVGM4TqJc9RHjPUBafTWV0pq2Quk1a7Fyl1Fhdhwr93+zJmcXvU4bYKs3HplLqcVjEbtAMvILh8cLESRXXtc99t6Hdvxdy/XQyUTkqFvyZXyhNQAml96l+TIwl8L/zmAZPIrCZuz9d6tj1hWt2MNcBpUKHX5rvTomWIGY3rVv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7BFoJq2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7BFoJq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753897255; x=1785433255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7pVi/yMYJdH8BSLRoov/mVW7xvRN8paxTK65JoTnSfM=;
  b=O7BFoJq28xI+6RKjExGhxr03/deoD/dxlkdznjbaDKxl/QTJw0NmXN7c
   vZbqH7B85eC72lpnQfty0nZtzzAlxTtzSncDA57/Zzb6lU3g7OPjm3vEB
   l7jpIIFoJBsLLV3h+BCP+n2W1mz++7wwxmV6wnlihrmp4Th3WADVCBVYq
   AQ2bVOFl7vcEru+m2BGbWlvzKTMGZrpC8PjIo5RfDbWI+HOPhul3iVK4r
   B9yCM32QkUyoracJ09m9hlVAMbxAzaEZ9uvQAMUiYguS1SpFoWKGMIXXN
   DjZRjdGKvnpmS9C++n32UZXkFLq8Iv2bJJabvtjTXkegqjirda7zHtjSF
   A==;
X-CSE-ConnectionGUID: AeGrz9+rTDWz9D9Z3lJVeA==
X-CSE-MsgGUID: QrmiqUvrTpeDV0EOrw4Mow==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="81660115"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="81660115"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 10:40:54 -0700
X-CSE-ConnectionGUID: bg/hPciiSV+M5MjiI9kXZw==
X-CSE-MsgGUID: UndQourvQNue2ZFrXKhlEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163838683"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jul 2025 10:40:54 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhAnL-00030Y-2e;
	Wed, 30 Jul 2025 17:40:51 +0000
Date: Thu, 31 Jul 2025 01:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_tun_leonis.c:1:10:
 fatal error: nbl_resource.h: No such file or directory
Message-ID: <202507310149.gBInD5RR-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8b2d4607375adcbd520a2b7c4aaf0030228ff409
commit: dd70f3837d475e33fd445bd822d8e058547e6dee [2/2] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250731/202507310149.gBInD5RR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310149.gBInD5RR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310149.gBInD5RR-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_tun_leonis.c:1:10: fatal error: nbl_resource.h: No such file or directory
       1 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.


vim +1 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_tun_leonis.c

   > 1	#include "nbl_resource.h"
     2	#include "nbl_tc_tun_leonis.h"
     3	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
