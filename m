Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C4B11712
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756024503; cv=none; b=LiXjymkpqmOnWBnjr8SyjGhfao1Pna4AJRmWck/mLKUf9x2CWCZzhXjy3fW1xtCvsSBzoR3GAEiNkBeEtNiVUXV/9O4RbF81+3Y8I/rohSiu8468wGAQqO31gdkzY9gqe5wjPc0qXntqesQUgy3y+VnhfKOQQY13NfzR5F+ZcA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756024503; c=relaxed/simple;
	bh=FQXj0YKXIUXHIfWgCboBFu/Dl8CkJRcW5KkXGVaDPdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UqfND6oJblONsVxOluGbNXxID0azBIhgvuuAG03sGFPeI/uWdxjtP2UcoNuModofjrYVXKqgU5SqpVQ6sUxhahx8RFEXY40zCIAKZ4geXN1+UYuxzR/3RJNQNuhpiE71SL5uaImFm73irv07zU4JxPz5yiND5ncrAgKZZ4Dn9hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAPfR/Un; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAPfR/Un"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756024502; x=1787560502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FQXj0YKXIUXHIfWgCboBFu/Dl8CkJRcW5KkXGVaDPdA=;
  b=bAPfR/UncipZKgT+s3QW/OwDU00x40fcQn52VvxsrEXuEre2UbBOomQw
   aH1l8gHbtH5Gs7jUKwFxHHbl0YjM8pad2FHY7p8N/ZPax/HDHf/becFnb
   1iofZ8kTj+gGkuj0IhmY5HIlMnCo02MMur8TD9w/k/sJl+X0gQoYJPLFc
   CVVyQi9M65pCWNBm8qAxiGRniSdwYgvc9L3m5vwcl0THSjOr3Gs2snQLn
   /Fp3PyCySH+OeNHNaFuxgzvS4cbfBA2b70Re78+vkqJlUj8VbnWMs51Re
   82awXL0tzSVYAqZMz0bAdUwV3gEbsfMYnV3KRrnSpDPJCw43A4rua0Z9p
   w==;
X-CSE-ConnectionGUID: GVfS+OmySp+WZTIjT2Oykg==
X-CSE-MsgGUID: nlihtwrZSkiUotyGtafv0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58186356"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58186356"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 01:35:01 -0700
X-CSE-ConnectionGUID: FsrAGfpKSH+0kD1Sw0cMUQ==
X-CSE-MsgGUID: frqY2v0hShW25pKL5RV+Vw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Aug 2025 01:34:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq6Bl-000MtX-15;
	Sun, 24 Aug 2025 08:34:57 +0000
Date: Sun, 24 Aug 2025 16:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-rc 37/56] kismet: WARNING: unmet direct
 dependencies detected for FWNODE_PCS when selected by PCS_MTK_USXGMII
Message-ID: <202508241628.eq7tx9wU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.17-rc
head:   ee7e8b71595b90aaf4014e5dc933af93210cbe71
commit: aad83baf67542c255dd49098681c16d231559056 [37/56] net: pcs: add driver for MediaTek USXGMII PCS
config: i386-kismet-CONFIG_FWNODE_PCS-CONFIG_PCS_MTK_USXGMII-0-0 (https://download.01.org/0day-ci/archive/20250824/202508241628.eq7tx9wU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250824/202508241628.eq7tx9wU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241628.eq7tx9wU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FWNODE_PCS when selected by PCS_MTK_USXGMII
   WARNING: unmet direct dependencies detected for FWNODE_PCS
     Depends on [n]: NETDEVICES [=y] && (ACPI [=n] || OF [=n]) && PHYLINK [=y]
     Selected by [y]:
     - PCS_MTK_USXGMII [=y] && NETDEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
