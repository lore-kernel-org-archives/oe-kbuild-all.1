Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49ED5DF2E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 21:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707170326; cv=none; b=gwVVc/NerrLpVWSnTow+5DTdEf9HdVi1PY3y446ZYr8sFYuIiMA6/KzeJPOFrXNMQ6ZBeQgzySpyfQ94XpXFcCCnkW8XmRBDFKzD6kZohbGKbCALUCljgU0F/J6LEX2JCB96Juaq369/HW2ItUPJGDvKWAc6yXz2ZVA8GAb0S4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707170326; c=relaxed/simple;
	bh=DjTTHWrD+ny+XM6yEKNJ9+wAYbJHv+zfc8fryhfFxC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oXPTIQdSpSqS70kbBTG5bo8ChAsw3dEU9Z6oDJlxpXzVKrmA55xGNQaa4x64X42pSs80Wu7eX0VcaIniCZ/cesXOoyMTZMPBLbVF0zkjUYZQdNCwf9T3GzjYfySxmJpAMFh7J+xhT6eJRrEbFE4gi5I4rNEvKCP4t+63j30jvlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdvM/72n; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdvM/72n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707170325; x=1738706325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DjTTHWrD+ny+XM6yEKNJ9+wAYbJHv+zfc8fryhfFxC4=;
  b=BdvM/72nfPQwQ5kjiseqB3AsFBN1uxxQPSJu8RVpFUDNPq7DHPHX+0cR
   67M3EK/3bGAHdnmA3JR8TDbKDrlN+JPdndcID1JM0HtdKbe2RecqFGPu5
   4jXvE30oxDoTcvzDfjRZ0bhjdoSyVncppOONbh7eib+SsGo9lJgIQYMD/
   y0fEoOKszU+N8UzvDQGy8X99FNgW/biKXJqfVkQp0EoGNC54VZzyi9Ned
   sxkr9s9Gq3nUimtLpnVBXAEUZCj196J84wJpb6n6iwgABuNn2gap8anVV
   4HlwhZalYubkC0s60SR8evEOKYeMx7LddlRzKzU2GJ0e+SctVuSeLXYTq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="502174"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="502174"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 13:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5585864"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Feb 2024 13:58:42 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX6zA-0000pq-0t;
	Mon, 05 Feb 2024 21:58:40 +0000
Date: Tue, 6 Feb 2024 05:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wanrenyong <wanry@yunsilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28324/30000] htmldocs: Warning:
 drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file
 that doesn't exist: Documentation/ioctl/ioctl-number.txt
Message-ID: <202402060516.wsIHFNKg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   162d8dcc29a0a3e083d45339f1ba89cdc2129030
commit: d48b7d951d22f7f97d68ae7b580769827683d404 [28324/30000] drivers: initial support for xsc drivers from Yunsilicon Technology
reproduce: (https://download.01.org/0day-ci/archive/20240206/202402060516.wsIHFNKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060516.wsIHFNKg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
