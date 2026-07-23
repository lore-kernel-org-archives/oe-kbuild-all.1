Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E163B47F0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 18:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830923; cv=none; b=WSv1Aq0YU/0BZ/nJvwlfkUiqozH25XEM8aTvaGxOhRagmCKU+MTLMkHD/YpfMksgAaq6DSzHe1bTPkmhGJtnozheP9upWTxBuJrF6bHVNgAPOMXSJdoYR5dql36lXBKf+QHNsgbPbkHe7JIT+aRccXrWxnAB7n9+aozrg5MXdNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830923; c=relaxed/simple;
	bh=IumcKfXyfh/wqgydSMDjMY1cb9pAskBjlt8lzoGEDEM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LuWbIFdcIPDUWp7eD0ojQWGHdGYT11RgA0liTFYTIveelcM3ieRS+BwYXAJ+vfOUXG8A4C3o5W+ACOCqC4hhoF3nP85fs7V9yPKkpdIlgTE4wej2vdBK+H7NZsD/gnr93DKi8F6RFE8HTDMlSgZtmbkMIEcX5dVzEO30qSN37IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKeVT33q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKeVT33q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784830920; x=1816366920;
  h=date:from:to:cc:subject:message-id;
  bh=IumcKfXyfh/wqgydSMDjMY1cb9pAskBjlt8lzoGEDEM=;
  b=SKeVT33qiMaryoOiSjzmv9R04akWqtXc9ePV8g5hh3gRL/ahdYaAjsdW
   SJfGzxeyffCjtwHo/gdK8q8Bg4m4y6wM3C+JnvCoOSwN7ebCBPthuD+jk
   QY9NsyTMPo2DoMs5aL6CL41agOCC7OIouqyW72kOu8i+/BVp8laEqxOAm
   XV86SkeY4FFuOjElvrb8Ln9GHMhkr9Xj621wf+ekch3IiVZebmVaINaKj
   m44nsKOqxUSZukUqh20vLAIMk69yXvtb5qGKj8etNk/vFs0oa5PYz8QiF
   UPUPVW6+lq0yl8Tb07eaq6ygSrJKoOuv8mXYiGf7IsKo3rbq375kr5Rr8
   w==;
X-CSE-ConnectionGUID: 1vjXr53bQg+s/JNdR7XcvQ==
X-CSE-MsgGUID: 7pxIPp8tRHG4ulFxL4H8Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="111038382"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="111038382"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 11:21:52 -0700
X-CSE-ConnectionGUID: xTievKl/Q6WjRnOCFfteXA==
X-CSE-MsgGUID: l4mxTiuSQUi9SJfeVRQSvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="252183066"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jul 2026 11:21:50 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmy3I-000000000oI-0sQW;
	Thu, 23 Jul 2026 18:21:48 +0000
Date: Thu, 23 Jul 2026 20:21:32 +0200
From: kernel test robot <lkp@intel.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 168/176] kismet: WARNING: unmet direct
 dependencies detected for DRM_XLNX_BRIDGE_VTC when selected by DRM_XLNX_AVPG
Message-ID: <202607232009.mSXWD7BT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3128e0f044012bb39c8e24551d72e4a72e0808f0
commit: 317bbf6a2ab3aa4c3d6421fd943a3cc69ee69665 [168/176] drm: xlnx: Implement AV PG driver
config: alpha-kismet-CONFIG_DRM_XLNX_BRIDGE_VTC-CONFIG_DRM_XLNX_AVPG-0-0 (https://download.01.org/0day-ci/archive/20260723/202607232009.mSXWD7BT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260723/202607232009.mSXWD7BT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607232009.mSXWD7BT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_XLNX_BRIDGE_VTC when selected by DRM_XLNX_AVPG
   WARNING: unmet direct dependencies detected for DRM_XLNX_BRIDGE_VTC
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_XLNX_BRIDGE [=n]
     Selected by [y]:
     - DRM_XLNX_AVPG [=y] && HAS_IOMEM [=y] && DRM [=y] && OF [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
