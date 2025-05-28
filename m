Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53161E5B82
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 03:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748404387; cv=none; b=NSn02+Rr/HhXfJc/I537xjYIt7RS3evzcoWbD6QR+r04ByN7maJRTExeMzi83de2TQrjqnYs31r0QgvV9s6HtT6EECZ1wF/D9/p+h+fAC1mVvZk0ib1tYP2BO73Ur13WgXS+dnDSlx7pwDgwSbdmWjHAI0YtjxlfHOfWd70Vjro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748404387; c=relaxed/simple;
	bh=HaXa9kj7ad1p4uNDmTX7GmDvO3/0Bq83Td596CvVNgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bSPX+QZRjPBqSD2e7v9O1FGLBKRpFkbG+OnuLdvrtJzFYRPd0elOT0kVnTxooZbpWsDeeowzEw10uvC43FolpLLNVsiOi/XiXWwQBw3Z5uKHAtGKpsA6h0mUCrPlPxixSAilUL7LQ6oM9tZL6EhFs+T5QFhfBdobDoFMFpkB8es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsosKwSy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsosKwSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748404385; x=1779940385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HaXa9kj7ad1p4uNDmTX7GmDvO3/0Bq83Td596CvVNgI=;
  b=hsosKwSyvJn6bqLynF9NYjXZirFzJa3BlmyjlxhKmxPOKxKisNtL/Eg6
   G3pJ0HEZn2f9M4MWdHFTeTFIZqIK9OQSCtepw+mK7a+Srdqqa32qEBqYV
   J2zstbhOZyG/2QDHwiqrxEosavO6tyVUB2OSIqNO2ZEuiuD4meedI5OeI
   w4isNYv27S9cSsbqBLncpHjIR5xxf7r6mWf/Mz2UHXhTRfcDOU936itM4
   9FFtWHSNUxzeBVBgtTLa/0mKyPUWVTuHeIQxVrLgAwKA8Dch9YCpUcr4Z
   9ppGcRGFHyCzYgl3Gylro6ut29BsaFwpWttdGSFwquUXUnNWwJPIPFWlL
   A==;
X-CSE-ConnectionGUID: jJ2VxW9KQYuRo3AajPpc7A==
X-CSE-MsgGUID: w3wiXtl9TACdKvUrS2Qmxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="38036616"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="38036616"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 20:53:04 -0700
X-CSE-ConnectionGUID: 9HqFWvH5QFysnJYemV64Ig==
X-CSE-MsgGUID: uDvrW9TPSWqn0T135yfkRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="148228342"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 May 2025 20:53:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK7qf-000VFg-1d;
	Wed, 28 May 2025 03:53:01 +0000
Date: Wed, 28 May 2025 11:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2311/2311] kismet: WARNING: unmet direct
 dependencies detected for MOTORCOMM_PHY when selected by YT6801
Message-ID: <202505281128.MTV3LnwY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   571552c7fb136e86f4279b2e96292270085255e5
commit: 6460d9d3c42d1357c8292d7be5c26cb7b84e84d7 [2311/2311] yt6801: Add Motorcomm yt6801 PCIe driver
config: loongarch-kismet-CONFIG_MOTORCOMM_PHY-CONFIG_YT6801-0-0 (https://download.01.org/0day-ci/archive/20250528/202505281128.MTV3LnwY-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250528/202505281128.MTV3LnwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505281128.MTV3LnwY-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MOTORCOMM_PHY when selected by YT6801
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]
   
   WARNING: unmet direct dependencies detected for MOTORCOMM_PHY
     Depends on [n]: NETDEVICES [=y] && PHYLIB [=n]
     Selected by [y]:
     - YT6801 [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MOTORCOMM [=y] && PCI [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
