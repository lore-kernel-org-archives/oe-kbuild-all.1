Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28341E487
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 16:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709570657; cv=none; b=XmikT2SNVTc4+m0ovyqH+IyBdapX9OXMbTRYVEgiEXF9VQlRNkx8kxtymZVkIMiZ+SHAMYAsXzlyc43pLhwCc8/caEkvHeTwqXkag9DSe+iGxQjrf2wia2oSPPkS8E9ygr5LaAthzfT8df791EYcAmK7otcr39+MfwDr8cBqtIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709570657; c=relaxed/simple;
	bh=4lMfLCH+SbReP6c3gydx/aquGNIn/j0WW7Gwm8p7Ndo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Okw/lsixOm6yi930GRrzgJRKryZhFHny9CWquMYwvRQeMjBp4ezGP7Gn36fW06N7B3AcArkC3tb1nqxLOUzK3ScCtfBiMMKo74pQJamjlTXTf//frjbWgKbDXAFptT6RU9xNSJnmlx9pXTLzC/L7Ndj+8tiLAhZiFiufTuRrqLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcliiPhr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcliiPhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709570656; x=1741106656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4lMfLCH+SbReP6c3gydx/aquGNIn/j0WW7Gwm8p7Ndo=;
  b=KcliiPhr2zCj0vBTC5Rnn7a+ifYC+GHw0sVLwTiWbwVrxOybDs/z0si3
   OYP+GyW2+hFF4CI8ibE4MfXWR9X5bBqV+j31qqgjSN2apG4azWgXGdvYi
   HZYs2Bq3BNTKz8//X1LFT08p9cL6sYMvcqz7r2d9JXN0dPg/4uZHKZKKo
   OeUr73IjVT/IXAugjpPJJzBKZcYsplRVpzxJcsEa1hklq2dpnUkUoIdtH
   SScrTkNdYbYYVHHLUbGICc+xOO63OzIlBqGZvcyV9pdhDf9zDkP61TDeB
   JICBwKFdK9DNxTySfXcC/Hf6pFFNPJE7j8MCCTWtE2HvCyMMzRQbmEhHe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15479099"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="15479099"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 08:44:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="13726753"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Mar 2024 08:44:14 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhBQB-0002d1-0T;
	Mon, 04 Mar 2024 16:44:11 +0000
Date: Tue, 5 Mar 2024 00:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip-rt-rebase 142/216] ERROR: modpost:
 "rz_mtu3_shared_reg_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
Message-ID: <202403050009.HmRLR90k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rt-rebase
head:   1ec962d6d01a6eb6fbf3d00e4b012812f96d0541
commit: f9f66604de4561beeabcc7e197aeedb0f7b3a573 [142/216] mfd: rz-mtu3: Link time dependencies
config: i386-buildonly-randconfig-003-20240304 (https://download.01.org/0day-ci/archive/20240305/202403050009.HmRLR90k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050009.HmRLR90k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050009.HmRLR90k-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rz_mtu3_shared_reg_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_16bit_ch_write" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_32bit_ch_write" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_16bit_ch_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_32bit_ch_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_8bit_ch_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_8bit_ch_write" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_is_enabled" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_enable" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_disable" [drivers/counter/rz-mtu3-cnt.ko] undefined!
WARNING: modpost: suppressed 1 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
