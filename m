Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A49217653
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346162; cv=none; b=KXWGnFbkevu+CLoY5RweL70feVVD+obLElAUdkSfjvJMSDf7bCw4qDGrQ+bAL0gQlgCCUC9mk1/CsYH/2cxCR9J5VRypPmWlgs3U2QtVmdQOKSGAO0Up/i+mJpFPcM8UGHIfFL0EmtnDPEE23EMSkfXiYnAX76ONQT4thu5Rr8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346162; c=relaxed/simple;
	bh=wX3Vymz4l/O54rkneO1+uXiJSTDlFRpOfGqjpyqnGHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vl1vflE1Eh8WKHlCF7+QCDA9O+6XBlB3F9ZKL2YL2RBnswgZmuQhf8Fl54JkyP/8GNglDnRrVZPIPWjTWVWFCN+AKMa7J6oTvRcW82FS+8yDEWQQa1GBqAR3K3WL6+EmbTKTfe9Kdc53GmPq1o2ra+n4uyaBrGQA+6lnjuTl+cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXHspWmO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXHspWmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741346160; x=1772882160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wX3Vymz4l/O54rkneO1+uXiJSTDlFRpOfGqjpyqnGHM=;
  b=QXHspWmOBlxOTL4eJI2TPsuayMktBzRO+i4SFqtG/rQFudRW7KgqdsMD
   DG71+bIL4w2M4kAELK6+NyJ9gQf6Qgtn50Jy4r+4BucY2zO68JfeW1orw
   cp3fYA9exWMAedVClSCE9IwiAXRAeiMTCPg60a0hKyMmcboRiBbjmqXJe
   rnmI2U5kFxkSITRooy3eiMxVKlyFSrAymXPyz8hgAYVZSiv3xm1+/Di2W
   pnuU8iH0Ny3d2HvfuiXzEuN7WlwmBuC39R3JoShu+upPWZQB0FcfmeA5H
   voK7vWblo2ampT/n3Z5sU1b1Mk3yEhZaBXB5/SUMDr6M4cwFeuiyb/Jhp
   w==;
X-CSE-ConnectionGUID: Jv2I9cSBSM6K5q4S1XgqeA==
X-CSE-MsgGUID: 2esAcKm4TA+NNR+TuNXzkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41560190"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="41560190"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:15:59 -0800
X-CSE-ConnectionGUID: OnTP3sMcQ/CFi8nptCb35g==
X-CSE-MsgGUID: yITXQzeOS+eDl/3dkBI/gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="123890543"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Mar 2025 03:15:58 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqVgJ-0000Mb-2a;
	Fri, 07 Mar 2025 11:15:55 +0000
Date: Fri, 7 Mar 2025 19:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	ian.forbes@broadcom.com, martin.krastev@broadcom.com,
	maaz.mombasawala@broadcom.com, Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH v2 1/2] drm/vmwgfx: Refactor cursor handling
Message-ID: <202503071951.dBYmEILU-lkp@intel.com>
References: <20250306041222.2776379-2-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306041222.2776379-2-zack.rusin@broadcom.com>

Hi Zack,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-Rusin/drm-vmwgfx-Refactor-cursor-handling/20250306-121451
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250306041222.2776379-2-zack.rusin%40broadcom.com
patch subject: [PATCH v2 1/2] drm/vmwgfx: Refactor cursor handling
config: arm64-randconfig-003-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071951.dBYmEILU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071951.dBYmEILU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071951.dBYmEILU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c:19:10: fatal error: asm/page_types.h: No such file or directory
      19 | #include <asm/page_types.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +19 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c

    15	
    16	#include "drm/drm_atomic.h"
    17	#include "drm/drm_atomic_helper.h"
    18	#include "drm/drm_plane.h"
  > 19	#include <asm/page_types.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
