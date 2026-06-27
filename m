Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B417318140
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jun 2026 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782574054; cv=none; b=uhNFMQee6aEV3nQJySV/cvPQRhYLybXFx2cFl5H0mHq5Zm0ra9lJj3FlTeXqOojb2c3ha+MdJoQXLy2WdaEb5PvW+i/wFFs3XarcsVbGa7+qiQDDwr8c+pT7EC3ec6VWtUpDdB4zGUCZ07y8ptZHB+hfiNGP50XHVJeUrBOyqJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782574054; c=relaxed/simple;
	bh=xTTLGXmvvz2VMpNGyKjJzib/c+B6zhUXfbJ4R4poMR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZysvWsEqFmOKgbM9JIwizZ+NDt63/8S/wNz6yIXP/9W0sZNBaIVU45lH0WJQMuTamjAHL/OnenNY7MLfLn1kJgnwHSZaQG21OOXfI+sMxl2nuCpsdQhGHvuXkVhMSbTsrIDkmltCN5CvDJV2ggPZeubDS87t89LZpVQje3VKoq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M96ui1D9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M96ui1D9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782574052; x=1814110052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xTTLGXmvvz2VMpNGyKjJzib/c+B6zhUXfbJ4R4poMR4=;
  b=M96ui1D9Au+Fi2KyajaA6OBnP5zWXl4pu63PWulpyAjWYamzNV00rsXi
   KJfrqqCIX2ingd78khKfyX1f3XamhZ9tNPBIJ9X/eWDUtsWqtKAtItN9B
   nTQ1VTqbSrbqlCREuNk3emB3Z4fb1TJs8AkC4iG/l0cadTVHiSX4PHjFk
   IIUcH0mdGoFNhOgpEDlwahyEd+3dcdt2H2WXI+JnuDFF59N5BUIWXWEoo
   IyQPsk/HFo8eyRJz/tOsmym/65+HUcE+wcZQOXAI7yzuNpvK91Rm/QrJy
   7TJu/WKOHznmZ48e5SWTpVoWcZl2t5el30ixCcBGmc7TLl0z8pyP0bghh
   g==;
X-CSE-ConnectionGUID: 44Zv9fFeQ2SxWa5pQQaHkg==
X-CSE-MsgGUID: bWYOFOoeQjKX+35dglKU7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="85882054"
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="85882054"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2026 08:27:31 -0700
X-CSE-ConnectionGUID: 6/hJWrJOTMiFb9cnk1/p4g==
X-CSE-MsgGUID: si2SBHIQRVuhShtuHhSf+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="249875361"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Jun 2026 08:27:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdUwJ-000000005uL-1ahk;
	Sat, 27 Jun 2026 15:27:27 +0000
Date: Sat, 27 Jun 2026 23:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-header-dependencies 3/5]
 ERROR: modpost: "hrtimer_update_function"
 [drivers/net/wireless/ralink/rt2x00/rt2800mmio.ko] undefined!
Message-ID: <202606272318.aS7iVH6t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-header-dependencies
head:   7c6a2b4d48e905380f1c24cd685e513f547f8c0a
commit: ba84ad80de4a06659ab26ea32246250c66fc8115 [3/5] hrtimer: Move the PROVE_LOCKING variant of hrtimer_update_function() to hrtimer.c
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260627/202606272318.aS7iVH6t-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606272318.aS7iVH6t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606272318.aS7iVH6t-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "hrtimer_update_function" [drivers/net/wireless/ralink/rt2x00/rt2800mmio.ko] undefined!
>> ERROR: modpost: "hrtimer_update_function" [drivers/net/wireless/ralink/rt2x00/rt2800usb.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
