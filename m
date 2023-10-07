Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCA55232
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 22:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pkg0N0Rh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696717777; x=1728253777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5PttSpOgxN2/VI+lM9MZbt8SeUhy0nxrxz22qEm7+ck=;
  b=Pkg0N0RhHn06Dxq27PrTA0DuCAdSjFSbHu93U/qqp3ycerztpJIeAJ+n
   NjjlOo17CdN/k6o62F/48MJbg3ZJRbNUq0jz7QCH3rYeJJ7TK8NQWzSdW
   6trqadec0uUxSvZTyLhJlMcxZpsrOJEJFma8y3hCQoimRBVlWBCt/TUdK
   cKFVnsvRsHwb7EZ//2FxgrUU+j2OLfd5K3qGDuFhnCQldlp9y+/AG4x4P
   pqVPUt/CQsqQCBZJywcKcyGrcojZmo3t9XJAuLTHqw3hZjkioINzkiJVu
   U/BnrvzQYJ01rdXryUS8begTP2aPKXLHbXZBuMj6OVniGQSQuw/UVFTGP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="369024663"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="369024663"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 15:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="868782279"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="868782279"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Oct 2023 15:29:35 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpFng-0004rb-2a;
	Sat, 07 Oct 2023 22:29:32 +0000
Date: Sun, 8 Oct 2023 06:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 9947/29110] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-ctrl-type-area (if the link has no caption the label must precede a
 section header)
Message-ID: <202310080641.9qeUyca9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ricardo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   5f1cbd78af5925311b9d58f8066186a356d9a73c
commit: 7875a06b12b6e9978bb9cd25493b3f32d1891491 [9947/29110] UPSTREAM: media: add V4L2_CTRL_TYPE_AREA control type
reproduce: (https://download.01.org/0day-ci/archive/20231008/202310080641.9qeUyca9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310080641.9qeUyca9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-area (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
