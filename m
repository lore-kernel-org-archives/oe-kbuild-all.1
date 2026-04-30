Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016523B6BFF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534297; cv=none; b=uMhsxpworH5ujIv15Mn5fq26+636Kfhzdjn/t/VEZAqSq6feM/WOePV61YXTFME0+iUajsAUG+ywW6B1a3CLrqpX7SQqn9PMaOJICwD7Y11N7xUBSv0vX2p7IBrxS7NVszj6HkmF4jKEZrU4kzAQtDxfOB4dNxWinbOJfzTyDCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534297; c=relaxed/simple;
	bh=J23x0TEXi9nOBKByYJgS55xOzC+FZ8S92xR3bnkuSnw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gtaceU3SWSM6Mua77XQ/j9KChj6+tbaXqbIbw/Fa4LsHQBA4xLuQTJ5R30QUC3M2iqM1hivJU93vyF/LJQdRsd1meWMgFsIf3kBP7CjLx5qKjgNedpvNfzdBrc3A3aZYiNIhZHqluyQXzBEe2Ov9QezXhD2JNB2pkdV7RhMLcxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGB+dhDv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGB+dhDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777534295; x=1809070295;
  h=date:from:to:cc:subject:message-id;
  bh=J23x0TEXi9nOBKByYJgS55xOzC+FZ8S92xR3bnkuSnw=;
  b=lGB+dhDvhlIAgceLqBXbjWP9pTXjNveZE/D2nRnegy6QPAFAUXzccN7p
   lDxYkxcs+ixIrVArMp+sI3GmbawOz6N+P9OK/uKp3uB1LTsN2bC/qyta3
   iVMCmsLw6QzNprebgDVz6cNWiVeGUZIU3tW0VgVRbwaQ9KlM97+hrY7HC
   C/G9zSk1QK45t2dj6qPPbH6piwY0Jw478IWOjhnf1ioWGeQiYa+vmOiPF
   8spoYZXq6oI8ixhLupYTTPNXJWgahSjvvx+y5cODkoLvfG/aU4Ks0aAWK
   D/1QwNbUhA6vGE+Gbh8Gf4kQGCDOOiIYIovvK5Cya1yCHvFVYcmuoLprx
   Q==;
X-CSE-ConnectionGUID: EGEboJ5pQ8ePo5drTWS04g==
X-CSE-MsgGUID: GcSBWEJVT1OAdhx6dmetiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82333013"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="82333013"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 00:31:34 -0700
X-CSE-ConnectionGUID: XThgu85eSCu2+GbKodudJg==
X-CSE-MsgGUID: H5vcctVTSuufDi3+y/iqVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="228001620"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 30 Apr 2026 00:31:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wILrv-000000004ll-0ica;
	Thu, 30 Apr 2026 07:31:31 +0000
Date: Thu, 30 Apr 2026 09:30:55 +0200
From: kernel test robot <lkp@intel.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: htmldocs: include/uapi/linux/videodev2.h:881: WARNING:
 Invalid xref: std:ref:`v4l2-meta-fmt-rkisp2-stats`. Possible alternatives:
Message-ID: <202604300916.BnmwANJV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Paul-Elder/media-dt-bindings-Add-rockchip-rkisp2-bindings/20260425-032621
head:   0eb3098f7859b571065f4a9d89f1f72cf654ba06
commit: 0eb3098f7859b571065f4a9d89f1f72cf654ba06 media: rkisp2: Add statistics capture video node
date:   6 days ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260430/202604300916.BnmwANJV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300916.BnmwANJV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/uapi/linux/videodev2.h:880: WARNING: Invalid xref: std:ref:`v4l2-meta-fmt-rkisp2-params`. Possible alternatives:
   std:label:`v4l2-meta-fmt-rk-isp1-params` (from userspace-api/media/v4l/metafmt-rkisp1)
   std:label:`v4l2-meta-fmt-c3isp-params` (from userspace-api/media/v4l/metafmt-c3-isp)
   std:label:`v4l2-meta-fmt-rk-isp1-ext-params` (from userspace-api/media/v4l/metafmt-rkisp1) [ref.missing]
   include/uapi/linux/videodev2.h:880: WARNING: undefined label: 'v4l2-meta-fmt-rkisp2-params' [ref.ref]
>> include/uapi/linux/videodev2.h:881: WARNING: Invalid xref: std:ref:`v4l2-meta-fmt-rkisp2-stats`. Possible alternatives:
   std:label:`v4l2-meta-fmt-c3isp-stats` (from userspace-api/media/v4l/metafmt-c3-isp)
   std:label:`v4l2-meta-fmt-rk-isp1-stat-3a` (from userspace-api/media/v4l/metafmt-rkisp1)
   std:label:`v4l2-meta-fmt-rpi-fe-stats` (from userspace-api/media/v4l/metafmt-pisp-fe) [ref.missing]
>> include/uapi/linux/videodev2.h:881: WARNING: undefined label: 'v4l2-meta-fmt-rkisp2-stats' [ref.ref]


vim +881 include/uapi/linux/videodev2.h

   878	
   879	/* Vendor specific - used for RKISP2 camera sub-system */
   880	#define V4L2_META_FMT_RKISP2_PARAMS	v4l2_fourcc('R', 'K', '2', 'P') /* Rockchip ISP2 Parameters */
 > 881	#define V4L2_META_FMT_RKISP2_STATS	v4l2_fourcc('R', 'K', '2', 'S') /* Rockchip ISP2 3A Statistics */
   882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
