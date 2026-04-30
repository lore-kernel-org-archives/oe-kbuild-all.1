Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859225474F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 03:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777518934; cv=none; b=E7/K9yBmZsl2nZ7dmd2n0wVTPpeyT97a0bXb4759awO4WOFFAbd9l8L5InFNJ7koQLuzcHT3N8ad2evP/AFCKdm3i0hTKWIf+bghAWMNmh+k6yAeks/boeuD+42FkObN1C7bnCJpNHvYNvBXmXiNJEUIUQpvnjwswItx2Zo9KYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777518934; c=relaxed/simple;
	bh=10qE15zBdmoj8FJ8vZbRd7MFHEQB+9yLHzBzj6EBTwY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mWAZaCTFqFMhGrCMz/A+phIBKDDtf60zwYKxn+Xr2a2N3dQus0/xorjohLLuIKIPbxmOHK8KPKY0GiySkQJn7xobh3ANTkSm0QDYmVcUtAwH3SrHegrhJnNwyq7bkO5VSlPRLEpNoYi3GM2V0VhA9dpZAuDbV1ECFX9pfvXN5Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/29Q7Gz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/29Q7Gz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777518932; x=1809054932;
  h=date:from:to:cc:subject:message-id;
  bh=10qE15zBdmoj8FJ8vZbRd7MFHEQB+9yLHzBzj6EBTwY=;
  b=X/29Q7GzE94WFAmnjgPyp95kWznNQGulNAAsAISCysyqV/qLafxIqUQV
   SoFWOGosAhQIUGFep8qPpEXgs7ZtWtYo7eWHufqGTcyGr8hyV+rVy1EHZ
   25WKqzkP8k3pdHJeCle1GEaLWIELKmo3sowUbXsHCiN4z/rQQ4B7aUFF+
   AKrBbZFVK70QvBzOyUFJC5tN47YueGcL+GNL6Ac1KB6/2dgllLp0CL7Ss
   tddj39UrxAvYDHYobAx3tyceVp0AJIPdtmBT5WQ3eDP/d/q0HwzlNU6NO
   WsMjZ1WB29v7hopugNS80p8i1c7k/hpjEau7Qso/cv5FyQhxCjavjKM2n
   g==;
X-CSE-ConnectionGUID: UbxXxQEuRwSCgGiuYXyxwg==
X-CSE-MsgGUID: arvOG22TTy6pEqLXSjrkLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89058782"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="89058782"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 20:15:32 -0700
X-CSE-ConnectionGUID: Ti75rnyrSES3bcly1cn+5A==
X-CSE-MsgGUID: O4kZBqP8TRizzTknH5NC0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="229848343"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2026 20:15:30 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIHs8-000000004ir-3LYn;
	Thu, 30 Apr 2026 03:15:28 +0000
Date: Thu, 30 Apr 2026 05:14:59 +0200
From: kernel test robot <lkp@intel.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: htmldocs: include/uapi/linux/videodev2.h:880: WARNING:
 Invalid xref: std:ref:`v4l2-meta-fmt-rkisp2-params`. Possible alternatives:
Message-ID: <202604300527.cRmPEKT7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Paul-Elder/media-dt-bindings-Add-rockchip-rkisp2-bindings/20260425-032621
head:   0eb3098f7859b571065f4a9d89f1f72cf654ba06
commit: 94dc55dbdcf43c06972f251f2a260c33b18eb615 media: rkisp2: Add parameters output video node
date:   5 days ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260430/202604300527.cRmPEKT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300527.cRmPEKT7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:166: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:189: ERROR: Unknown target name: "network flags". [docutils]
   WARNING: ./include/uapi/linux/rkisp1-config.h:210 Enum value 'RKISP1_V30' not described in enum 'rkisp1_cif_isp_version'
   WARNING: ./include/uapi/linux/rkisp1-config.h:210 Enum value 'RKISP1_V30' not described in enum 'rkisp1_cif_isp_version'
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]
>> include/uapi/linux/videodev2.h:880: WARNING: Invalid xref: std:ref:`v4l2-meta-fmt-rkisp2-params`. Possible alternatives:
   std:label:`v4l2-meta-fmt-rk-isp1-params` (from userspace-api/media/v4l/metafmt-rkisp1)
   std:label:`v4l2-meta-fmt-c3isp-params` (from userspace-api/media/v4l/metafmt-c3-isp)
   std:label:`v4l2-meta-fmt-rk-isp1-ext-params` (from userspace-api/media/v4l/metafmt-rkisp1) [ref.missing]
>> include/uapi/linux/videodev2.h:880: WARNING: undefined label: 'v4l2-meta-fmt-rkisp2-params' [ref.ref]


vim +880 include/uapi/linux/videodev2.h

   878	
   879	/* Vendor specific - used for RKISP2 camera sub-system */
 > 880	#define V4L2_META_FMT_RKISP2_PARAMS	v4l2_fourcc('R', 'K', '2', 'P') /* Rockchip ISP2 Parameters */
   881	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
