Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4D211A14
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 12:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429353; cv=none; b=pYrFtc6B6sxyworpqurPwZZ+Ueds6dcmwlCqvS34S2N3w7SZaEwo6OF3Q8IEpOOHAP7sh1jvaBEugPD+gQ461yrWKeAwWRzJK8slO8ALnmQCcKsBnut4Kv3H/VvNVxGGxSX1aMf+8uBVLmg0FqOmhFNAxMF1/0u5JtCTZKuXj2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429353; c=relaxed/simple;
	bh=cYtZd1QQx+xIlqdb2m9vnU5WT+nsQAXsPdeOme5rY2k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ny44+jtDbB3R++4LBlRkQeA3SyvABIi24OB8+Xp5LGTuVqTgkCFBX8bO244VDzur4GwUstCTuLCcHEnA9QUUO/9qG3F0EkD2O75f6C3MleO6bfrVUU8aTxQ2xCK8uqquUOI1MVqQ5RFfWDn594Dh8hnLEk59Gh4dzlazSlXcqvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImQN4CmJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImQN4CmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776429351; x=1807965351;
  h=date:from:to:cc:subject:message-id;
  bh=cYtZd1QQx+xIlqdb2m9vnU5WT+nsQAXsPdeOme5rY2k=;
  b=ImQN4CmJCNt62/I0tw7+2Rqy6oZIo/f3ocgBAN+qeX+daTktPOe2Jk91
   9sgXEPZ39bPDyQJ3456yoWJZD3PVe1BxS6LV2vUJz0hK4ojUqppSYa0hc
   XuXttNkIIMBT9R0ejqRZhd4l+HvJhRN4LLIScIYCEqevpSn2xG+X4MpZf
   90L/1JoOPrr/ZA0qpl+9YjyhhpfiglliD4PT/Y1HjDrI3viLUlAwCKxlF
   EGI41fdn98J2hF5PZuBreSif8Gxar8hTjSQijETAhgX6PNUb2q/eZg+c2
   tSqz7dXYoSrO7KeqXhOPFS2SvLfNISLJLK8sj9OX3g5dS/wkkah9zGcjn
   g==;
X-CSE-ConnectionGUID: /Bgos5xoRDCGFygo8VZOMQ==
X-CSE-MsgGUID: s3eCEXxbRr6JWEX85h4vww==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88061886"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="88061886"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:35:50 -0700
X-CSE-ConnectionGUID: xMY4duhuSaaDfmdY0IiUZA==
X-CSE-MsgGUID: 7BuMv41wSoOmzsq0WdpBUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="254247453"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Apr 2026 05:35:49 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDiQE-000000000Lg-1zVr;
	Fri, 17 Apr 2026 12:35:46 +0000
Date: Fri, 17 Apr 2026 20:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 7/19] Warning:
 drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not
 described in 'genpd_power_off'
Message-ID: <202604172040.tizCAWCv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   ecad9364496d64ceef9ab8ef75ab398aba04781c
commit: 95dd6a61265dd715bba154f546db7bc36148a742 [7/19] PM: domains: Add a flag to defer power-off until all consumers probe
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260417/202604172040.tizCAWCv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604172040.tizCAWCv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604172040.tizCAWCv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not described in 'genpd_power_off'
>> Warning: drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not described in 'genpd_power_off'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
