Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19D61FDE12
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891564; cv=none; b=SPCUfgxBjuHTzOxMp8BK/Rm2/yEjnMK1VaoEjYHpl+OU0M6Uz7DuOClRwESsYOMNg2M8SD9m6H0Y5o3QEln0ok2BWnLSCn+u5SONCxsknMtplOSwKcXA+lXjaQZSfno3NxiyHP1ZvuzVkUMM8QRPs9KZdS8dcIv0gJNKGNLNB9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891564; c=relaxed/simple;
	bh=AD08lWM5zqgZQRbsLrPBblLAPvY39Q7oaUBZggY6wuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hj1yPI2Vu9yhAToNwO7e6b0nDN7mtUiojFODJ48opO7v2SI7KohL5LS0FM4EFwZTgoPqO4YldeznbfP8lWp2lHSqbPttBl/PgL+sOPpw80qrJHGLO/2etd1zWqClNKGMMV/Aaz5fr8QqiU9LcKTYXtqzbhLOABaPaRzhdT5hsNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VG6H1JQw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VG6H1JQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745891562; x=1777427562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AD08lWM5zqgZQRbsLrPBblLAPvY39Q7oaUBZggY6wuM=;
  b=VG6H1JQwDF3YxM61zAWnjAVl2vAVt9wt9mNQqY0WQzDvIX2HuaeuOzDD
   CNXFUepIErruquxHoaYGvqXVzZWiEDzDBFyiO4bxNQ2svlrabEV4Ty+nx
   XK9nJeqa5fwleoX2s5uDpXOzIp4fAkDUC6yDZnW8A3so0kR6LVqww3iXX
   qRZ8o1E/HZ/+QeI27Y50wefxqDfz8C+zjkiMdh9BHym3hq1pUGZDRywzy
   +nZhntuXTYswmZ2Qk8gZahJHgtOi8N4Jsv30tJlEMhX7ok0pia2PdaSeL
   XCdf4U8AYKYymtnfo3coe34JYpyKwphaO+cFWbA5HkCmmLwSzHzyU+4FZ
   A==;
X-CSE-ConnectionGUID: 3LlnV4R1RjKqD4fY7Xpt4Q==
X-CSE-MsgGUID: nDJI4zdaTjKRz+qK5ov+hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="65035353"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="65035353"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:52:41 -0700
X-CSE-ConnectionGUID: XZKUyII3TTu0atd2JKMxBw==
X-CSE-MsgGUID: qxmsk26ETVOwA78XlkFvUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133568052"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2025 18:52:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9a9G-0000On-1U;
	Tue, 29 Apr 2025 01:52:38 +0000
Date: Tue, 29 Apr 2025 09:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2175/2175]
 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_ethtool.c:3: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504290927.uassI0w9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   85cae3bfc6f56b1f497d5521a0caa9b8c299ac01
commit: dd013ad487534c1838afc2f55efdb5daec15aace [2175/2175] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-randconfig-161-20250429 (https://download.01.org/0day-ci/archive/20250429/202504290927.uassI0w9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290927.uassI0w9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290927.uassI0w9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_ethtool.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.


vim +3 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_ethtool.c

   > 3	 * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
     4	 *
     5	 * @file: sxevf_ethtool.c
     6	 * @author: Linkdata
     7	 * @date: 2025.02.16
     8	 * @brief:
     9	 * @note:
    10	 */
    11	#include "sxe_version.h"
    12	#include "sxevf_ethtool.h"
    13	#include "sxevf_hw.h"
    14	#include "sxe_log.h"
    15	#include "sxevf_tx_proc.h"
    16	#include "sxevf_rx_proc.h"
    17	#include "sxevf_netdev.h"
    18	#include "sxevf_msg.h"
    19	#include "sxevf_irq.h"
    20	#include "sxevf_ring.h"
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
