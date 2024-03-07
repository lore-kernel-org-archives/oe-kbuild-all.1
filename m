Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C1712BE88
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709805913; cv=none; b=LCSByNhjpYvPOxBSB203iSiXXs0SCdiDC1TY/I/jvxXNSFynx3Yd3rKZVdg7+b68sKK7l2qgzMsHLh2Nrv7NvgrVbvR/W+GUuSzroWr23b9JSIYqyuJY1Mx0hCSaiCfeFDcAORRxtjijSkWxL4ot2KYP1us8QGVJJMzH+aXNNRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709805913; c=relaxed/simple;
	bh=IN3w3ZHnPXM5zNg4iPW/8efUJfV3njtWPuwCld9AKsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUIL3Sxiw4Jg6ny65PEHqXA7Aqxylykfg9ivM8l1ksqEXqjCDNfpwFR9uoZgkiFEkroSkW3KeGEB2JaI387KOty1zkRWByW7QgRySBJLCDToEABJQuQ/CATeiDnRx8YTJBVas0Focz0EoE8faMA2y3382RSrjOc+8YfbTwmiE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XoERbdbY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XoERbdbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709805911; x=1741341911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IN3w3ZHnPXM5zNg4iPW/8efUJfV3njtWPuwCld9AKsA=;
  b=XoERbdbYN+h1z1V+ueanD83NkAq6HES2/IrIYCLjuK9o8q/j0Ny22rxw
   4ERUrYJcYPjm7eriE20B57LXdtICCLp35+sc/wcX0JoKDP636zN2MtfAo
   oVD2qYkWoVWsI15LbSG6hjOwtqyePTKtVWDQTHElglrWJXP2ENw4I4FKm
   A7S2VfYJds8F63/pMRid8h9lY88KPRH84h1cAE17ZkAsM1ZjLZ9SWOlpq
   +oU5Lo4Ta9nMmzafsY/JxlLiplVqyw27+iuf75eUfAEBsQ1xf/2481rqL
   1Od7Rx/mLc3BukmLofw8FedFVUBEIBFFAj1fHAzuaU7k1+Vw3X4lGCbv5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4635990"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="4635990"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 02:04:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="10130125"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Mar 2024 02:04:54 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riAcM-00053B-38;
	Thu, 07 Mar 2024 10:04:50 +0000
Date: Thu, 7 Mar 2024 18:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 24592/27434] ld:
 kernel/sysctl.o:undefined reference to `cpuset_cpuinfo_show_realinfo'
Message-ID: <202403071752.werFeTCi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: d0fd2ee97e01d9240d8b180d24a1dae9b07cd0b5 [24592/27434] cpuset: add switch for cpuinfo in container
config: x86_64-randconfig-123-20240305 (https://download.01.org/0day-ci/archive/20240307/202403071752.werFeTCi-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071752.werFeTCi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071752.werFeTCi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: kernel/sysctl.o:(.data+0x1808): undefined reference to `cpuset_cpuinfo_show_realinfo'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
