Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C24433C1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 05:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706505788; cv=none; b=EpY1fYTmvvND4I8ZJ0sL/fLR5hktu2MWbgj+3GyQVRiVV8Weqatg176sx8jM2GAqUW++Q4RlLcnZ/w14IuOrsJ8XNQHVY39CgFDI9aGIT9+NY2EiDv1zAilF8n77sOPYLTAzUK+L0BiebVRzZnrpaZz2WRUuMQ4kSbJPr2r3YgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706505788; c=relaxed/simple;
	bh=cEBjhh4nST8yctmfA+qn5tzrPWcKqjSfSoQ/tGFn+fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZbI7oiWAKiLm+d6T3nxx3x0+Ubn9IX709j08qEMyo8b7olRXu+eflzOxYSk8SxilsKj68+02V1Mgi5GE+Un7PhzTGzEmVr8JLtqkQJkiyIbNnUccIZBuzTH4Qa59yhIw+Q7aVZvrx7F+QYxfzrGIXKrhB1ts/953rEP5AeJ72w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZnq9VJx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZnq9VJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706505787; x=1738041787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cEBjhh4nST8yctmfA+qn5tzrPWcKqjSfSoQ/tGFn+fg=;
  b=gZnq9VJxtupURZzQ+mLDtzsEPOV+vxzzfkGRg2T9sTrAhjFs/hrkMwVN
   qaf18VdGUqZkqB9zzM6NOb66mlsZ6JUU0Xql8feKAveaafOMQdJPJO1yM
   JUFor9VRTo8WzE1IkuNOjHBdbRiUVL7FlI3HrEFlTm9HiXKLvPi9gZHoD
   /fBDonHBzpQ4wz1sEiWNbiSeQ0LuoQlswRTZPwA5VZUVN4ILis3z6hVPb
   haMI053jEpNNfo0eZbsqlGe8K0Lhcwo2xjPAJr5Meje5SaMIe3dQNz2/d
   w3cGqELttKaFIZ9nkFQfwfEDIMY3InfMeC/zhGfwtKF4pW18wivVY8iMV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9598736"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9598736"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 21:23:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="21989489"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2024 21:23:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUK6o-00044U-2s;
	Mon, 29 Jan 2024 05:23:02 +0000
Date: Mon, 29 Jan 2024 13:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v3 13/17] WARNING: modpost: vmlinux: section
 mismatch in reference: cmdline_find_option+0x3b (section: .pi.text) ->
 myisspace (section: .text)
Message-ID: <202401291302.1JuF7mcr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v3
head:   76018d102c84ba52d1ee5747cf97577d60e299f7
commit: 0fe954066fb5e85812b4dbe94bd26c3ed7c335d7 [13/17] x86/sev: Make all code reachable from 1:1 mapping __pitext
config: x86_64-buildonly-randconfig-001-20240129 (https://download.01.org/0day-ci/archive/20240129/202401291302.1JuF7mcr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291302.1JuF7mcr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291302.1JuF7mcr-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x1 (section: .pi.text) -> __cmdline_find_option_bool.constprop.0 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x3b (section: .pi.text) -> myisspace (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x66 (section: .pi.text) -> myisspace (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x90 (section: .pi.text) -> myisspace (section: .text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
