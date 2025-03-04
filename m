Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25D72673BA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 17:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107927; cv=none; b=kPmVTjYBQLEVuqs99vKS6HuYKarnWVKoCayxFZdYrD8pcKzK2BKBnQem4g+f5WQCgsdeNZxwBpawBMWxUUmJSvrmv0mPL06eScklCgvwZ0TznlGrmcnOMKdJJm6n375NeFhs+43XCSVbtviwxWAELLhhV763j4hifRWaIOQok8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107927; c=relaxed/simple;
	bh=LPsgdpwihpKhxqh33oIAq+e4P+cy77Kq10hMEkI7Blc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gyWd+W6P5hvxr2XPRGdvP7OgKIbuE+O5Ih7yoHnL3wilu1tBdc1byEAIr7Fc3lxIFR9wgxFX2JoYH3Nuw+jliyJRJW1vR2j0bQPpTYBlVHN2DoSx6WqCw1DwiCtOyExX1D3EJ3stZpYv/jtG9ZdjGMYdlKDBFVI19CSNcZNnr9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eC0kCiNZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eC0kCiNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741107925; x=1772643925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LPsgdpwihpKhxqh33oIAq+e4P+cy77Kq10hMEkI7Blc=;
  b=eC0kCiNZ5do0bEfrx/OeatjuFSTjyM7EBa89aWetCwXyyyY63JKGh5tK
   YTJyeEt4nw+MKb3HP57s4c7CK3iWiXrVoDfm1d4S1CGs9z0zTo2U/tGge
   OPa0twkZEA3sqDZHgDWzARE6J67nV4DfX14dDzJHsFhj27dDdIYiFCiqO
   sVPXE1ZeTLYPkq58YDACpxYkwhv0KCprHScFiSe4GUKtxxZ/ZzTqqU72g
   h1SX8xLDj6SYAQIFnVZFbY5Rvh/edL7ab2cZ0oZyiXbZB13joMdpon/E2
   A34x+asMPkjmyALCwklURz6JX40kuYc52e4+LiCkcme+6i2BDLy4SQSAx
   g==;
X-CSE-ConnectionGUID: lGJSm8sOTb6D3s6Wn+nlDA==
X-CSE-MsgGUID: hI/sdCdaTL6O074oTM6Ykw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45965041"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="45965041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 09:05:07 -0800
X-CSE-ConnectionGUID: kOrjMeIWSQuX/k4c3k0kyQ==
X-CSE-MsgGUID: B4PZ6iAhTR2WFibXrkaaAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118427666"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Mar 2025 09:05:06 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpVhY-000K35-0P;
	Tue, 04 Mar 2025 17:05:04 +0000
Date: Wed, 5 Mar 2025 01:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:mm_init/mem_init/v0.1 2/13] ERROR: modpost: vmlinux: 'mem_map'
 exported twice. Previous export was in vmlinux
Message-ID: <202503050054.pKr57obi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mm_init/mem_init/v0.1
head:   55eb95380e481029d5e7b8b442b0fdfbe79a9d3e
commit: 6daa1f5d8ea5504c283f562a925f9b8b0d1602d2 [2/13] dev: arch, mm: set max_mapnr when allocating memory map
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250305/202503050054.pKr57obi-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050054.pKr57obi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050054.pKr57obi-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: vmlinux: 'mem_map' exported twice. Previous export was in vmlinux

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
