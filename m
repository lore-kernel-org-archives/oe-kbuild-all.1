Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DA21366
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 02:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716602902; cv=none; b=aGMdeqC5qY3o6g0tnVd90o1ma01wx/s2fY0l6nF/taYl4EhZP12WFzBNk31kni63ejkuD+XtKZgM6GV7XZHMP9XMa4fgAktsdyBb1XRlGR/Sy8UAA6FsumIuxNOk3pUjJyNdMtL9DsMEHsED16fU0xtLosy36RQYbJDRXcHvcx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716602902; c=relaxed/simple;
	bh=VHkNPJAFEY4RAsDE+pEIt6ReS6wwGoWyNOz3GW3zInc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNk1qg9qQ/tyfUi5+BE4krB0muPFCVgr/8Fog6ch837vBEcMnptotL49gmkz8Gdv0J2pFbO2Qp+TLZGJwPh/GjCzZoDRkNZiXd3fEAgE2njP29gUN14zBMdluorzSWtD14vmwD5Q5H4x+ut4gpUghqV6svKPWGC8shZVpEDOrrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A32O8ptP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A32O8ptP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716602901; x=1748138901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VHkNPJAFEY4RAsDE+pEIt6ReS6wwGoWyNOz3GW3zInc=;
  b=A32O8ptP43GOeCd3zNgb5uRvNY5+R2S83/rWygzFInWDP14Phn5K75le
   jsipCM7fK4+WtYBYWHSTbsJe4g76nCyBJh/+nU4jBWJIViwkbqqB0Q10e
   vq//cVHhMQlsUK8zm/Qjd1F8V1UIdbvIouUe1WDodDkogs224rCB/fqte
   WZ4Yo1eOi4kEI15ZWzjtjmzKZacScXn19fTBbkwE8lHfXl44oi9t/jL9l
   C2fGclVRrsp2FFOLbRlCHEoyo9e98z1VZCOI7/4PVKtYDxqv0LH/7Lrri
   MA1OMeGj/DfKiyWjlj8vFBE9aVh6xEozWjFbFtIqPKellY6sVaEdJ6rIg
   w==;
X-CSE-ConnectionGUID: ZC+xjxoQR7WzvxsUaUN/nQ==
X-CSE-MsgGUID: 0wyKSvryQM2fn+9q9QqKQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="16785177"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="16785177"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 19:08:20 -0700
X-CSE-ConnectionGUID: PrvfBT+4Q0S558OEiNuJZQ==
X-CSE-MsgGUID: ec3hj9TqQRKGI40XFOPciw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="34205678"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 19:08:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAgpU-0006Ln-1G;
	Sat, 25 May 2024 02:08:16 +0000
Date: Sat, 25 May 2024 10:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 2/2] drivers/input/joydev.c:1101:10: fatal
 error: kpatch-macros.h: No such file or directory
Message-ID: <202405251039.8LLW9yIf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   745009dc796e56fc87e911138d801679ecd3576e
commit: 745009dc796e56fc87e911138d801679ecd3576e [2/2] test
config: sparc-defconfig (https://download.01.org/0day-ci/archive/20240525/202405251039.8LLW9yIf-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405251039.8LLW9yIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405251039.8LLW9yIf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/joydev.c:1101:10: fatal error: kpatch-macros.h: No such file or directory
    1101 | #include "kpatch-macros.h"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +1101 drivers/input/joydev.c

  1099	
  1100	#include <linux/module.h>
> 1101	#include "kpatch-macros.h"
  1102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
