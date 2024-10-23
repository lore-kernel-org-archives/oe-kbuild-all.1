Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EE014265F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 17:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729704537; cv=none; b=QhwgncqU3CW1z0ntqFS6mWxoJ5lDFPDSpMLdf9wI2GxC0Or8GvdP0WhvY1v2QmYBxXXOznynJOj3xmi/XMd1v9TwJ8WPdHBpjey1EJZgefyfFLXliz3g7IqBeZU9tIS8hTr7Id/XiwvSNVdbklezE08A7m2Fk1yW0tWDXd7KzJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729704537; c=relaxed/simple;
	bh=1o4csFtB/XNLo+S4uGSt0VcmkOB2e0KrkLK5P86AIdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZfxDvuFLcLvLiidki83nBGx/6dEKLIBueOGxAB9aT6xDgfXyiUoiaNpDw6E+qSb1FdwtRSJx0EKXG4BQJNMcRapkftagoW8tujTpCl74sr9j+uhfDWETHQ52yvW3T0AGyii651JrLJR2InE2A6fv1L8K9XKcZgnV1YwwjfKVFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4G028k2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4G028k2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729704536; x=1761240536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1o4csFtB/XNLo+S4uGSt0VcmkOB2e0KrkLK5P86AIdU=;
  b=d4G028k2I84yOtD7SpVhJobneP0oMbDBZ8cG2hMrLL3EKwI1Y2X5ryeZ
   eyZp+Iia9oZUFZ6TNUOY3j8xMKHEg3P26e+A9v6BcNv4IggC7jXvLy8sz
   2DLAv3SfPy6EaXkNH/19qPjKI5RxZGaR2Ym4IKxxnRrLaMxPOO53u8Mt6
   bmZYPYNnUxhZurOrs/Rssc5zUtORApLlipV1BkClOz9zIywj/JdXjZGu3
   DHmFlLIF2kwXFC8PICifxOJ9spjzT5pxSquPMg7jueb4fn9jb5Qr8EjyM
   Nve4gj3Mjh4BTlWIeUgHpbCCka5n/ZpjBgATlAort4xYi9GdnkUIN/THS
   A==;
X-CSE-ConnectionGUID: kW72ZPJgRCesxW58FtP88Q==
X-CSE-MsgGUID: 00lDpkc/RXCU6akHaatj/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33113790"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="33113790"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 10:28:52 -0700
X-CSE-ConnectionGUID: 45pDd8U1TYqBcng6Z5H9+g==
X-CSE-MsgGUID: ECDjLXPbRDufGHQESBzZRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="84889477"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Oct 2024 10:28:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3fA9-000VDQ-04;
	Wed, 23 Oct 2024 17:28:49 +0000
Date: Thu, 24 Oct 2024 01:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 14224/15255]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error:
 'nbl_product_base.h' file not found
Message-ID: <202410240121.PVeRwkG2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e7bc79687a034a22f94328123d5cf8c4d4436c35
commit: bad535d287c9c1056d99de3666be7da84de4a8fc [14224/15255] Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241024/202410240121.PVeRwkG2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240121.PVeRwkG2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240121.PVeRwkG2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error: 'nbl_product_base.h' file not found
      10 | #include "nbl_product_base.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.h:10:10: fatal error: 'nbl_resource.h' file not found
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.h:10:10: fatal error: 'nbl_resource.h' file not found
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.


vim +10 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h

     9	
  > 10	#include "nbl_product_base.h"
    11	#include "nbl_def_common.h"
    12	#include "nbl_def_phy.h"
    13	#include "nbl_def_resource.h"
    14	#include "nbl_def_dispatch.h"
    15	#include "nbl_def_service.h"
    16	#include "nbl_def_dev.h"
    17	#include "nbl_def_channel.h"
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
