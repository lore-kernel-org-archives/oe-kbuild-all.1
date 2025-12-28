Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4EAF9C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766930102; cv=none; b=inqxWHjOwsgm3lejuNe690j5a7Uzv70uzaJJLYNc4RBrvh7Cfpdi/Pqt0YmJK5269mUypXNRikMVP7PRAFT0elcePqb9aN/2yVq6AU3APMwmz2hlQLLar/c+MtvqPWRkYsRQlcCaFwRwqIjNLSpNafALxmlXfbu64fr3TcNq9/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766930102; c=relaxed/simple;
	bh=1aIeLn0NqWjvQsnzMr6H2H+VV3QWGju4iydj8qCuDs4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YrVOnREjrGt1nVSKj11uk3aEvexHI23YqVlb6Qc9arZXZhlZNYZuvAnbqcxHDz6zYYkjeX1BK4kmSTpT0DVRGEHNWjgruFbeamELUwNQDErzjhzhjKxFTqVHg1589dS+qOfQK754Wdiph/nqUO9IHB2eOrSz6Oka0TVByqdos7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFhwVz5Q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFhwVz5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766930100; x=1798466100;
  h=date:from:to:cc:subject:message-id;
  bh=1aIeLn0NqWjvQsnzMr6H2H+VV3QWGju4iydj8qCuDs4=;
  b=KFhwVz5QJKTopTPF+6WZEHd8tMr/5VFhzDk5NEmZcjqsuAaEuQ3Dvpyv
   U85S+s4OO1m1zI+t/ezbs2nfKEeZefsaIql6CxSOz9RtjSmohO7WkjxfC
   XP0MrKdoi5+w1aCHwSdGoqcx1gVpeYzeBdQ+C8X6V0RjduGlDMolf4CLu
   UXbqHo4MmLZZJHOdPbbdWuWlz/gRDUxgNLYRKd6tpCtIWkZoQ3kxiDJxZ
   HL3wB/vvPJNOCrzlFRAxEvUI+6AVL1pviAXuqboMiNoF4lv+olmPpm+IV
   fgbcBg72+e0XgfkKYFlfcvkgDHdc9efIMA/0q2RNh5HbPxy83re1BkbXs
   A==;
X-CSE-ConnectionGUID: an6jIRe3SP6poeO/c65oog==
X-CSE-MsgGUID: Vj6eQ4cgQDalm0hXXlqHFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="72428499"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="72428499"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 05:54:59 -0800
X-CSE-ConnectionGUID: vJ+aBdz+RWSTPwD13ATejg==
X-CSE-MsgGUID: z5Fg6G/qROSTvHmdJb3ZpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="238142039"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Dec 2025 05:54:58 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZrEV-000000006VN-49xc;
	Sun, 28 Dec 2025 13:54:55 +0000
Date: Sun, 28 Dec 2025 21:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [drm-misc:for-linux-next 2/4] ERROR: modpost:
 "drm_connector_hdmi_audio_plugged_notify"
 [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
Message-ID: <202512282143.ftK5h4OP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git for-linux-next
head:   130343ee6bca9895c47d314467db7dd3dcc8bc35
commit: c08c123d4cd6ec3ee482d607e29388d0db2d3f1d [2/4] drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
config: riscv-randconfig-r062-20251228 (https://download.01.org/0day-ci/archive/20251228/202512282143.ftK5h4OP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512282143.ftK5h4OP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512282143.ftK5h4OP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_connector_hdmi_audio_plugged_notify" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
