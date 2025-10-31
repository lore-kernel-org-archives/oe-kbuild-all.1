Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750A334D385
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 15:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761923131; cv=none; b=CQnI6UPQC/TcFpvkYlJPyL/YvWPoBfiiKU1pq7vlx5k4xqI+H2dVskI6w7dH8hTuGR4uq5pVMDeZ8yyQB/AbZNU5YaldahGibIIj0HU0H8tdg6dGIDJ14gVgTaMdSstsgRJPbmCeuTTEwhFmzcbn1illaQHLMrcjq+ni+2VVV/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761923131; c=relaxed/simple;
	bh=+UPyyioFbPdQ/VZ4PicpMJltNtZBr/bqvsceKSd1NYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1PLFUk4CBS+4UKgG0QBfh/51lAitFZsq8aI6NQAKG/r/nGKizCcpwPLU6oNxyHj2+aANgp9w/jac4MH+6gsVYFCy7suTQbXEuhGATxYfbNCIroQnmJ4ccRCLOUHdGfzO0SMIrFw8qHA4GpUkmkTq/Hp5Mp36m+ygf+DLkCBjP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ag4S0pge; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ag4S0pge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761923130; x=1793459130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+UPyyioFbPdQ/VZ4PicpMJltNtZBr/bqvsceKSd1NYY=;
  b=ag4S0pgeniGrb5X7GaTF3zc7X0GLAjAM3YOT2BAG8eaVNeOS+Ha9LjGF
   0Ji8F71sfHolkZw/2+13D65lK3TgQznCizeJxhp/5eTK85rQR1K07JKR4
   3V3AmpwW0MKJeDYemdvLe4T4W0cUJLwIDCtNbzhsyr++2vOGXCYhy4iUa
   A1craa2TvRPYmmB2ggS1Y3Ws24VDVm7TwN+kxQ9WH1JciPOJHkrzu+BGP
   uML9ONCbQ0qumw3yOc+OLypJHdIN5yD3sCLgl1DV/0Yru/yZ1Bm6fqx52
   qK1+hJLVvEHJ5K4pda1KWfxgQV3R7YrbQxGSdy3BTAPtBjp9+A7KC+0FO
   g==;
X-CSE-ConnectionGUID: sKzGHG/CQVarM7xwmntAww==
X-CSE-MsgGUID: pp5+f3IPRFq50G2v8d1O/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64236532"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="64236532"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 08:05:29 -0700
X-CSE-ConnectionGUID: y3MmArBUQ4WtsSuPQE+6zw==
X-CSE-MsgGUID: QDDjVjlRTuqYON5p8x01SA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 31 Oct 2025 08:05:27 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vEqgv-000000001BY-3T7u;
	Fri, 31 Oct 2025 15:05:25 +0000
Date: Fri, 31 Oct 2025 16:04:44 +0100
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 16/28] fs/xfs/xfs_healthmon.c: xfs_fs.h
 is included more than once.
Message-ID: <202510311626.Itg6WKrh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   0263868510909c21d7c1ded623cf97dbf4cf55ad
commit: f57328d3a014162f40365fc9a28886431f59abb4 [16/28] xfs: allow reconfiguration of the health monitoring device
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311626.Itg6WKrh-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_healthmon.c: xfs_fs.h is included more than once.

vim +7 fs/xfs/xfs_healthmon.c

   > 7	#include "xfs_fs.h"
     8	#include "xfs_shared.h"
     9	#include "xfs_format.h"
    10	#include "xfs_log_format.h"
    11	#include "xfs_trans_resv.h"
    12	#include "xfs_mount.h"
    13	#include "xfs_inode.h"
    14	#include "xfs_trace.h"
    15	#include "xfs_ag.h"
    16	#include "xfs_btree.h"
    17	#include "xfs_da_format.h"
    18	#include "xfs_da_btree.h"
    19	#include "xfs_quota_defs.h"
    20	#include "xfs_rtgroup.h"
    21	#include "xfs_health.h"
    22	#include "xfs_healthmon.h"
    23	#include "xfs_fsops.h"
    24	#include "xfs_notify_failure.h"
    25	#include "xfs_file.h"
  > 26	#include "xfs_fs.h"
    27	#include "xfs_ioctl.h"
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
