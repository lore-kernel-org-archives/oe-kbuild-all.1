Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50959EC7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 01:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708737666; cv=none; b=MbOQ6xu85DURV+bn7DcDJdlsZdFifJmOUbkgdoSX/lugY5wuC7Wq7JiBcX0d2hxl+8FlK/ne6n/+wWq1s9DGHqm2lc+SglwunFJtWfBEVPhi9860C/6pw1WEXpaeoeu11dozkmCvfs3lt1mRAGiWm6u0KjAY+dz6ptlQhQjvv0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708737666; c=relaxed/simple;
	bh=H5g+ec8NnNuwHBckN1XYCAsZgi+mA2e51RsIxI5atYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=REeoceSfoKumP8A4+3pV0AXi3RN9grPOKHXYnwc+f06c6wkNZJJRYPH+EOH1NxEI0f+0YKiwfnCI36Tp400BJ7+GYaObunTyxhIMgw8mJnwXB/GkjdPUpTiipJRi1VW5LJM/KydIdCmO/eBKSnMeAsT2mxxXf5OChtujaU7c3O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwLjgngl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwLjgngl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708737664; x=1740273664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H5g+ec8NnNuwHBckN1XYCAsZgi+mA2e51RsIxI5atYw=;
  b=fwLjgnglxyocflJ2dBdOcuCUzoLwo2gFdMR55kaR7JUGt766LLMndyDG
   8TuNumOWYCg1bbXiodpgOi2Khp6vsONnwYxUPiyuuD2lgEhn5Fguh3ECw
   Rtnn/mhDsEcqI/D17YeQJO0lDSybGVgQ7VUVHwbnyvaVCISE+WnBD7iv+
   rja/Gse5kGNJ7+lxdjVhT4A+ZubGC/VwvCo+aaU7hAnmrvI+dFZZoXCIm
   rIBNt0/imSTXVtXvlYGPyZ5FGlJc1ESmtENSVW9V84B47tulTR+yM/xNa
   Fx4vs+jm0caNq1W6RlRtCjygB6zNWo/3tbAh45NAERIGI1rg5pMzG0M+f
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3248374"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="3248374"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 17:21:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="29260771"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Feb 2024 17:21:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdghz-00085E-2V;
	Sat, 24 Feb 2024 01:20:56 +0000
Date: Sat, 24 Feb 2024 09:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17747/21632]
 drivers/dax/pmem/.tmp_core.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202402240932.WccokBnQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b97b63500af297c36f80416fd1f1193d227cf51a
commit: 31251a62e6358cf3a099926bfecf4170263b4bf8 [17747/21632] Intel: device-dax: Add /sys/class/dax backwards compatibility
config: x86_64-buildonly-randconfig-003-20240220 (https://download.01.org/0day-ci/archive/20240224/202402240932.WccokBnQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240932.WccokBnQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240932.WccokBnQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dax/pmem/.tmp_core.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
