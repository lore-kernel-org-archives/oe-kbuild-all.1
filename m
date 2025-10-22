Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D13B17A309
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 01:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761097660; cv=none; b=NrnsPd/8ZrcTTml45Q5MYd7hc4Q+N9dD/v3exiHI6oXvPqaL3TxAVeQQy6YqIxQCcsY/3kmCJduktZtNksOvJFZDzN+qcAvJpFTHjrYPzSyjWHwQl8IkFntE/hhMu5pQOHtsMs01ccn3kHpK0t+yCGLLsPIk5MTc8DkjUajHr4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761097660; c=relaxed/simple;
	bh=TMhLHu8rI0tLSEnoylARHTvcs/8nFNJAhKMBV+vPL9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ByLFEWQVV9IoIiHK/QezJybX23wymYnkgW2OdKqxy3cXlDDDG1BCTUkRoHendt0OkBl9Q/uNdko/4q/7aYhd5EBSWSibk/+AUD+DMFQBY4oLz7kmPEPDNob5ROn7PhCEA5/b+fFYNJuoj+nuM9T0tOYOk8ds78F8/NgRGfmSVBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tg3igK3M; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tg3igK3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761097659; x=1792633659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TMhLHu8rI0tLSEnoylARHTvcs/8nFNJAhKMBV+vPL9g=;
  b=Tg3igK3MAXPgVjEVJb84sa85xH6MaRBWIz2V92xo4mNJqsA3toG6UvHT
   Ib+2dWXSYs+I+fzBspYMITybFdmEFeG8W5jkRW9/VtDFVkf1C5rQdDn6J
   +yjNEPUDNGveN4c7C0ouLXSnvJw4xTWUxtpdiwiZ81cKF9hALLVE9FaGF
   cgyMWcEX6i20j3ldWs0SO85MbyukIa3OzovY4lIO3w7cXoVoggL9nuu99
   0XH1drTX8014eqcSdYWGiAvbAQlG+LcScDG4kYexUHwWAn6xhOIzzbHyL
   xuZpChCU3fc4iyibyUiFs7vt9vJuS+PMUvQ/zMViBr8h81zsLlvGkr+yy
   w==;
X-CSE-ConnectionGUID: wYYrGUOFQM+7MpA8943TtA==
X-CSE-MsgGUID: qPi5p2Y2St+sLD57Yy8BeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73525876"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="73525876"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 18:47:39 -0700
X-CSE-ConnectionGUID: xpE80YL4R16c0E+wVYFOcg==
X-CSE-MsgGUID: 2ILNYsDiQ4G1s4hTGmW96g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="214378241"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Oct 2025 18:47:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBNws-000BuY-2J;
	Wed, 22 Oct 2025 01:47:34 +0000
Date: Wed, 22 Oct 2025 09:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl-v1 4/7] pinctrl-pic64gx-gpio2.c:undefined reference
 to `pinconf_generic_dt_node_to_map'
Message-ID: <202510220947.U9E5lC9h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl-v1
head:   812dac031dbeccaf5456d0426f3f53768fb7902a
commit: 586afdcca4f5a6d3e5ce6f3d470abbd1b09c7304 [4/7] pinctrl: add pic64gx "gpio2" pinmux driver
config: x86_64-buildonly-randconfig-003-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220947.U9E5lC9h-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220947.U9E5lC9h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220947.U9E5lC9h-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `pinconf_generic_dt_node_to_map_all':
>> pinctrl-pic64gx-gpio2.c:(.text+0x4fd538): undefined reference to `pinconf_generic_dt_node_to_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
