Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F9D1D5CDB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 17:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730222845; cv=none; b=JR1idtGLaKbsDzdSexNj9D+6FM+CSmlunmpUYIsgqkszp045d7sdDmgL1q4ewA6irqdghwtkTjviM+6aNX/Kq0UbCbe9CYE+NXwlslUwp142VvjDHj2ffxkv4G/CteixSNfUe3ZFuCoSTFiB6qs9OYr6NDZes72Tl6eIdQDLYPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730222845; c=relaxed/simple;
	bh=+yYYC7MjyKLbAJ4r5AKrCCgEFc/jFuv2gpGmabSMQ48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n9f+JUclHV+YpEhr++QuZ1WLzAY54srr3Bdi4eHhb8HED2aNngvWrUKRhyiaUDWMD7uqo77f4Bi9zwYUWYSAsKnpMGNpfmH9SfDERLc3D7QAApkdZLfIbIE+XY1zjaryOUXFJz8AThJaLFMxAE+oDi1a7mgG0/VV9li45Oj1Pb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVYFKMLr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVYFKMLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730222843; x=1761758843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+yYYC7MjyKLbAJ4r5AKrCCgEFc/jFuv2gpGmabSMQ48=;
  b=IVYFKMLrNo/U1jGYDlfcarghmgmHa+Su//9pjcjfDR5nUr3DL8gTSaVw
   AMBztv5Qt/6pIszgEthbLRy2A01uD67L4Nn4k+V8COCiJVE6MkUG6r7CA
   yhNg2Cfp8zHPDWp32FaaMvaOdnEi4excBEiE8D9MkHfvImjTg4ujo3eeO
   678zOvjnum+JHGyUEDi9+GhCspoAnvI6rROehe9dKcte0cXI7K+phh/Ie
   B0eD6WdFCm23/ePQDRrf0lOpHwL1uoFGmbuT3rqu50MF2C8fsXbjptSL4
   361XaeB2r5HEUQ9NTyEP+reMFoDXls6GacAPKe+5WWdebmzIad/Ri3ZXW
   A==;
X-CSE-ConnectionGUID: WI5Up0N9Qa69OHW/XOfoVg==
X-CSE-MsgGUID: KOsXFdJHTiyTWryVe0SrDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40497749"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="40497749"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 10:27:20 -0700
X-CSE-ConnectionGUID: ewuLS+M4SkeFd80q0DlfgQ==
X-CSE-MsgGUID: 8psN9pHxQzapmkBSJbQQww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="112834543"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Oct 2024 10:27:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5pzw-000dwK-1f;
	Tue, 29 Oct 2024 17:27:16 +0000
Date: Wed, 30 Oct 2024 01:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18707/30000]
 drivers/ub/urma/ubcore/ubcore_dp.c:26:5: warning: no previous prototype for
 'ubcore_rearm_jfc'
Message-ID: <202410300109.pSLkwgUF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ffc5791ca9102a55d29c6dea26de38d32f052b01
commit: ad84f0a92e3fe282d8280d8c45f8d5b8aab1a2b4 [18707/30000] ub: ubcore add event api and add jetty and event api impls to compile
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300109.pSLkwgUF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300109.pSLkwgUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300109.pSLkwgUF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_dp.c:26:5: warning: no previous prototype for 'ubcore_rearm_jfc' [-Wmissing-prototypes]
      26 | int ubcore_rearm_jfc(struct ubcore_jfc *jfc, bool solicited_only)
         |     ^~~~~~~~~~~~~~~~


vim +/ubcore_rearm_jfc +26 drivers/ub/urma/ubcore/ubcore_dp.c

    25	
  > 26	int ubcore_rearm_jfc(struct ubcore_jfc *jfc, bool solicited_only)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
