Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9052E72606
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 21:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755293229; cv=none; b=koSyIPh8GXWOkxjtZz+zpwPDyTZ7rGFiz72aheYCq/UznaJnMLzBHSElLwg5dbahRttsNdQx2725FN0Bg50xzrbBHKUREKMxFg+hxm7itVLp8HqoTwGll4kNVDtlcHEofvaNOAp04LnqYduYNigi2mCfj3otDayCBAwxohXPEBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755293229; c=relaxed/simple;
	bh=BV3cu+p8ZkzIXI5aoBysXNHmqJo0HDvNna3qfC101zE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T35A8aLDnGlDmqqVyWQZpSspq6NziEwSmOM2gbV3AyessEnIp1HPeVQlWJYzf1X+qsZxBEibE33Ed85TXriyPEO2CWhOBrm3knpShp2+PagTQHmKUnQjwJXG+Zb0dCPNIl4ULMoMeZx3Rmuxet1htiR7djapHBhvAOhz6mzgAQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ik5t/pos; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ik5t/pos"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755293228; x=1786829228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BV3cu+p8ZkzIXI5aoBysXNHmqJo0HDvNna3qfC101zE=;
  b=ik5t/posoZO8d52sbiLXhKhe+Lmf5JNJtbgOZUnb8FMQC+umTfI2cEtr
   V064H9cWZZAfEdXucqfvDXTvDQgkRJ46dhcXJNgzMRIrbzgsyx2+ZEczC
   fPNYe9o/SsvJ9tZTKRjYkBX+Lp+hN1aazGodVhYbN3Bhf8KgiZEDm5BiO
   ZBPKgof1q2vG9cPbB4uheOa0LKRru/0qep+TVB3CeORxOpWMtEogq0e4B
   HbrAPByxyHtkhHJCX7HbXJhM1l6MdxAvT0E5tH5WTenlDIIvfw1W+XTOd
   0zI3l3C0LbeMG4rx/cjV6Rd+EqzuaPOK4BXOnTUpW4rom1DNqOnyLaIZZ
   Q==;
X-CSE-ConnectionGUID: XhYJgT7HQFyZX/0P8khMAQ==
X-CSE-MsgGUID: u8V/9NAESgGhkI1aLQefPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57765657"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57765657"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 14:27:07 -0700
X-CSE-ConnectionGUID: IxUrWnRMSgCF8nRNquOk8g==
X-CSE-MsgGUID: 3H4K/xUOTSe+9ze0nsV5lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167482311"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Aug 2025 14:27:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un1x2-000CMA-0E;
	Fri, 15 Aug 2025 21:27:04 +0000
Date: Sat, 16 Aug 2025 05:26:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2681/2681] kismet: WARNING: unmet direct
 dependencies detected for PTP_1588_CLOCK when selected by SXE
Message-ID: <202508160556.ck8PeKXE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   54d96ebb93c9ff0573fe16586a47778ebe26de32
commit: dd013ad487534c1838afc2f55efdb5daec15aace [2681/2681] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: arm64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE-0-0 (https://download.01.org/0day-ci/archive/20250816/202508160556.ck8PeKXE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250816/202508160556.ck8PeKXE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160556.ck8PeKXE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - SXE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 || ARM64 [=y]) && PCI [=y]
     - SXE_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 || ARM64 [=y]) && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
