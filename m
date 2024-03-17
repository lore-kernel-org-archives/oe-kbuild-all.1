Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982BA1BDC3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710682402; cv=none; b=S1SGskIp+CsNkTOSLHBCP9xvLlBx8OUN0NGSS3Zk9R5TnpFfKhVaqMhw+t0apxRoqtcRgPFukJ4zqIyW/nZq7XMDTUf3KrDdf2uwugf13rLGByeqIyD+4cgOBcgJu8AXilezNpg9AFghfEVKtprbYfRRuwz48ry8DIsWOQ954jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710682402; c=relaxed/simple;
	bh=CQLATJanaWsDVxWd49tLqSJZLH9SyaymOzicnjI2Zh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OkSj9ZnIn2NjKj1pytai4Xbs65qOCbho4s8hAEjBVhtD0IdP4I1XbVNV3nbiPCQsaqt3wZsLTpB12dEqAUBva33Rhcx7fBRaaIHLLb8ZNmW09cFTdjAASnjMb+VnBk2tJcpnkftRci37IriItnfbgFpUWlpoEr4rq9CsQKjIsb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwzeUmmf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwzeUmmf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710682400; x=1742218400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CQLATJanaWsDVxWd49tLqSJZLH9SyaymOzicnjI2Zh4=;
  b=kwzeUmmfS9KjGc4C5GyVPSI59A+RGJ0AlzgyrglkLn9j7DZe3I64woHF
   bp7i/fnfGQkZFdGqDzYG5t+D6EOz3UiN9sXd/9HWpDcmHmAf93/gRJ+W+
   YWlnOE8OgIssN6+APKE13dw5OQ6tXsGIhllZugfnw0ud/Z08uIP+V1FwA
   p40UvDZhH+aS0TQdH6HQ7lMjHUHvQKBjIO/RCKNoG5IEPtsViakNs9NmN
   0VuCyS+lvgtqhym7VKYg6C2b6Z75sNZd95NM2Sz76sJwSIRKKOJ0inEYZ
   upkp2GfIuzqwW5bVjn+uttBDrUF+rhWb/q42hiq6jT1pbTJYmD9+iulZH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="5706652"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="5706652"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 06:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="17907735"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Mar 2024 06:33:19 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlqdY-000GFT-1u;
	Sun, 17 Mar 2024 13:33:16 +0000
Date: Sun, 17 Mar 2024 21:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Super User <yoonjin67@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/279 1/1] make[6]: *** No rule to make target
 'drivers/accel/ane/and_tm.o', needed by 'drivers/accel/ane/ane.o'.
Message-ID: <202403172144.VeLdblcA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Super,

First bad commit (maybe != root cause):

tree:   https://github.com/AsahiLinux/linux pr/279
head:   15d2163ed4a2934b567a1cb2c59678ba1190b35c
commit: 15d2163ed4a2934b567a1cb2c59678ba1190b35c [1/1] Asahi-test
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240317/202403172144.VeLdblcA-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403172144.VeLdblcA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403172144.VeLdblcA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/accel/ane/and_tm.o', needed by 'drivers/accel/ane/ane.o'.
   make[6]: *** [scripts/Makefile.build:243: drivers/accel/ane/ane_drv.o] Error 1
   make[6]: Target 'drivers/accel/ane/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
