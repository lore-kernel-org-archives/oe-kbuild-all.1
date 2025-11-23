Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9434A35
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 11:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763899050; cv=none; b=Z03IYUR2kWc7TkCXHkKDdgOF0jZU2AggBXFtCCRO1xL5aGOFpVYl+aUDAwyfqXUhsVu2+Rqnf+3dRWDkK/wZvDDrVB8yOg3qbQ/lhiGtLOns5OEZVAT0TNKatTcEFG81rAA1BlzVQoK0+VgHussS50yg8SLCUIYzKwLoFaHTKVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763899050; c=relaxed/simple;
	bh=efNPPeL6tD3DB8Hfx7mqKvcuxkjsue51F4TofJ8Id/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oyS41Tx23WLe/sFhrwxVuxvnlCSlFtDaGFx1JI1jCki7rx4pbSXfqF/yjXxUd6sSzGw3flZ3yH7JYfQMReBCl7d4ZWSmoNOeE6befQRV4MBqZoVQIF+LGdPTIGhQiRaBJvEbF3JhvQWcjLVmmbkGjt0b4rZxuGbfzDism0EYJss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqzU68wC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqzU68wC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763899048; x=1795435048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efNPPeL6tD3DB8Hfx7mqKvcuxkjsue51F4TofJ8Id/o=;
  b=PqzU68wCZIwEu4k7TMUPxRZ/POMUJCASQ7GNhto7aomm95ttAPNB46dI
   QqKz0mgj0cDuAgbzwhG46jyHZtpxwCjUSkhheP3cMwDuyZA8bSQ411QCP
   haUj5bfKQDjKmGaMrHAV6G1Hj4XUDulKmK4r4qafKXhGNVf4g72/999yo
   qBQm5gq+PhjtaTwqt//V8h3H0rxCLDLEeMbrNpV7J9FXG5chOf4YUdSnQ
   /3HhcRDPZ4isI8jVPdzHiwmcihTJEbgsPLN349VkVzaMvx7iDEC8v1A2C
   qj2nE6SDxLx74/YrSVesdXYPnE4YZ+/q49fwQiO1+el+MrzMGjxztbznZ
   A==;
X-CSE-ConnectionGUID: W+ZLdSNiSOW4uh/gDjz1qw==
X-CSE-MsgGUID: Pe6c9IWtRuqEimSS3ahJbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="68518175"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="68518175"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 03:57:27 -0800
X-CSE-ConnectionGUID: RCqlIyqVSUaxXozrAVsCgA==
X-CSE-MsgGUID: W80T7lOySyWhIV9asz9eRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="191367819"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Nov 2025 03:57:27 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN8iZ-0008Fb-2P;
	Sun, 23 Nov 2025 11:57:23 +0000
Date: Sun, 23 Nov 2025 19:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Subject: [thesofproject:topic/sof-dev 1/2] hppa-linux-ld:
 sound/soc/sof/mediatek/mt8365/mt8365.o:undefined reference to `sof_of_pm'
Message-ID: <202511231932.PPVXjOcw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   cdadd7263fb81b49fc509aed5f284b183c88337f
commit: d3741c24e014995094ed83665def277828ef881b [1/2] ASoC: SOF: mediatek: mt8195: Add prefixes to avoid duplicate symbols
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20251123/202511231932.PPVXjOcw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231932.PPVXjOcw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231932.PPVXjOcw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: sound/soc/sof/mediatek/mt8365/mt8365.o:(.data+0x110): undefined reference to `sof_of_pm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
