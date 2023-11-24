Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E5028E3A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvG5tLog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700836812; x=1732372812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+IKWxJaXdZ0NkhgYhxR7peJrsUKpI63zLNacr8MZ6Pc=;
  b=gvG5tLogJbpC9T/+2UZBqzg3bZAmGm8BMionjvZMHSAmrFaZeBpIDGHB
   d+nY36HD6/W2BTlmkRMlg7aXtfIxpOXyp6vWtx2cftjxzGbR9iFHo1WZ7
   GwLgu1TUUc1i7qh3BJ6G+/XPYQMNNxRhgmGLwdlYF/h9T9+d+465n74e0
   RgHr622qiQOWxtFoRr+RzZaU5K29FnHC/MXD+KqC+1IfID0BxMdgTtupc
   lh2rC+FD1x+dm1BR6JXNwlEqlaburgPlEwdomSnMBDCjGYq2d/FiZpr4p
   TdMYKSxnBMQoqVWMHLVOT5lDJRoKF//5hOpxGvXaEOkAzjE+irQ/J/FwA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="11110372"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="11110372"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:40:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911464616"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="911464616"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 06:40:09 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6XLj-0002ts-0O;
	Fri, 24 Nov 2023 14:40:07 +0000
Date: Fri, 24 Nov 2023 22:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sarah Walker <sarah.walker@imgtec.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Maxime Ripard <mripard@kernel.org>,
	Matt Coster <matt.coster@imgtec.com>,
	Donald Robson <donald.robson@imgtec.com>
Subject: [linux-next:master 2539/2998] htmldocs:
 ./include/uapi/drm/pvr_drm.h:1: warning: 'Flags for
 DRM_PVR_DEV_QUERY_HEAP_INFO_GET.' not found
Message-ID: <202311241526.Y2WZeUau-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8c9660f6515396aba78d1168d2e17951d653ebf2
commit: 815d8b0425ad1164e45953ac3d56a9f6f63792cc [2539/2998] drm/imagination: Add driver documentation
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311241526.Y2WZeUau-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241526.Y2WZeUau-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./drivers/gpu/drm/imagination/pvr_drv.c:1: warning: 'PowerVR Graphics Driver' not found
>> ./include/uapi/drm/pvr_drm.h:1: warning: 'Flags for DRM_PVR_DEV_QUERY_HEAP_INFO_GET.' not found
>> Documentation/gpu/imagination/uapi.rst:124: WARNING: Title underline too short.

vim +1 ./include/uapi/drm/pvr_drm.h

1088d89e551530 Sarah Walker 2023-11-22 @1  /* SPDX-License-Identifier: (GPL-2.0-only WITH Linux-syscall-note) OR MIT */
1088d89e551530 Sarah Walker 2023-11-22  2  /* Copyright (c) 2023 Imagination Technologies Ltd. */
1088d89e551530 Sarah Walker 2023-11-22  3  

:::::: The code at line 1 was first introduced by commit
:::::: 1088d89e551530a9f5128770d74a1516090f1e41 drm/imagination/uapi: Add PowerVR driver UAPI

:::::: TO: Sarah Walker <sarah.walker@imgtec.com>
:::::: CC: Maxime Ripard <mripard@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
