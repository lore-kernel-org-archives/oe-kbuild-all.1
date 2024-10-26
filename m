Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD2914A91
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 14:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729954150; cv=none; b=hL3IYVV9Xfr99wz1wLO9z6gANd3KX3Dypp/E3U1FSPRDoECJ2KT4WPoq5jHilFc1vtNXvXMYIe3Tl1ckG5EKvi74166gI3lXZIcHTm+ddgjkFa7hCN2PfGbEMnh5Dihr8YzWZOV9U9ga5wuPdBG0F4lrctIG/4dSM49iS3PygSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729954150; c=relaxed/simple;
	bh=go6OLNGD5UT9BngxizQvvC/GdixZbugOCO7yq9JwcEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RpVmOlB+tl8Upf/XQlD/C2Zk7cUvyo0b1JutAoXjXPWJQ5HfvzNdHz66mwIfO7t0Ktwv1qbsHU41aOOFzoPcWwL06vWPCnEVuPzqseBr/lCNBMoyWu0H7fByZQ1pLvtuWWEPf/qj1oRSjnUidvshAU+xiywmXWryb+BdfRBBY3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXLCxA8p; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXLCxA8p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729954148; x=1761490148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=go6OLNGD5UT9BngxizQvvC/GdixZbugOCO7yq9JwcEs=;
  b=iXLCxA8pC4ExtiB7CCqRf/yhH61H/z1gumD/N5r2VtyjCO0LGM2LkGuV
   lkZQa+0qYojSFVclwD8jZvTm6SfeisqwlJz2dtg6UyYXwmPipxZ8ffka2
   qNYeM8uTisnRIWxPYh8R5PLxpPwJDVCcPK47Ze2ht0iATq06K9fdRRukt
   zisWTKa5QrQ5Cvzh+PM8+y+2/iIPmNDn6hzgftHAX5fNEiOYUCBKtuBRH
   JJGKNCdyYJY1yxu6mB90+gpGnFCqFgwud7tLHzewr22NlKGTzD/967gej
   3kLiC1Tz26rUq1I7Ko7g87SyjG5NqzgrEu8OtQXMHRFPShDfsFTRRIolC
   g==;
X-CSE-ConnectionGUID: W2QUCrlTTga4nRy7ierU6Q==
X-CSE-MsgGUID: nx23PP6kTVKVRYuMjkPRXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47072199"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47072199"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 07:49:07 -0700
X-CSE-ConnectionGUID: DGjVOzAfQHOcQ2ueKiWGOQ==
X-CSE-MsgGUID: obzkojOgSwOHOnjOndVlVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="104515528"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Oct 2024 07:49:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4i6C-000Zk0-0K;
	Sat, 26 Oct 2024 14:49:04 +0000
Date: Sat, 26 Oct 2024 22:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-rsslro 8/69]
 utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202410262257.MUI4GH8d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-rsslro
head:   c40c9a8a6472ba6a40bba42d22578ff068f3d0d7
commit: 73d017d2081914dda668e77020506189e450daba [8/69] utils: firmware: add r3mini phy firmware
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241026/202410262257.MUI4GH8d-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410262257.MUI4GH8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410262257.MUI4GH8d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
