Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF3F33C9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 03:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744427306; cv=none; b=QM2vRiEC1NeBpYkcoDjJPqrax81QE8ZPyHr0MEEqPHbW7eqo9N4UmcweVt9YIEEtoA2GWKI/XautIG6aprmO/otAbp0i7YbsfO2VHeBc1rLISPTzFJmZnieY4Sv5gmBYC67KdBS6yT8AuPHw1LF9sL7Z50nyBdo6LMk6zcuWxJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744427306; c=relaxed/simple;
	bh=qAzlIP52YavvazcIEjT7DVKbbq82bpHiH0XKDZjI04A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZkFU1FYGiTkoYKlx0sdqRsI8iwbvDWIixk6Rs79YiqFzY2iCGmpiAWfoIJ0s6tBTRChmLxLPToCdTOBaCYRCDlUcl7Xt8SiyOaO0PvmvMaUjvzJtIt4ZkUq27ka49XMSTuLPWICNSpmAJGZw5iPrbexrzjDDQ+G8MB3BhJpZ2Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jF8CVPFZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jF8CVPFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744427304; x=1775963304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qAzlIP52YavvazcIEjT7DVKbbq82bpHiH0XKDZjI04A=;
  b=jF8CVPFZeW/mO/uiLFuH3sdIvJnXnFSOndZ7jybSatceDcCHb++06ckG
   GjPaG/Jr8gU7evQvRnzw8nfhjGJAymFOgxrx5uIv5muB5pc/JRnwVATz1
   Ws1Wm+//ncIXpv7WnDiCTMJ/elaXLTnrYtbCCyWt3V2TwIqQ2PRb5gpFE
   HWfxeZ1QgwIaNKc47eEqCBKwVbPs6eUIhCjJyuah3MCtAwq+ryatuo/OM
   uT3K/S4Iyrx5I0ypkXnUsG/CG+Pu11sxJaspEFgin9ZfAaAcuF8OaeRyT
   VjGL7G9OlJcZLqi/ARrIHUOE2yzbbgEi2OhCeMuVZHiHYbaBevitIEzMh
   w==;
X-CSE-ConnectionGUID: K1oOR/MUTdaGRU8ZnuHQIw==
X-CSE-MsgGUID: owdhTKvxT8+F6OLCJ8WmpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="48687996"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="48687996"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 20:08:23 -0700
X-CSE-ConnectionGUID: XsdJ8WjMT/GmDLFU5qStdw==
X-CSE-MsgGUID: ihFEIN1xQ5G4a1tFSUcACQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="129911157"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Apr 2025 20:08:22 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3REC-000BXW-1l;
	Sat, 12 Apr 2025 03:08:20 +0000
Date: Sat, 12 Apr 2025 11:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: Aary Patil <aary.patil@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Ranjani Sridharan <ranjani.sridharan@intel.com>
Subject: [thesofproject:topic/sof-dev 8/8] mt8365-clk.c:(.text+0xb40):
 multiple definition of `adsp_clock_on';
 sound/soc/sof/mediatek/mt8195/mt8195-clk.o:mt8195-clk.c:(.text+0xb80): first
 defined here
Message-ID: <202504121007.3IOzDJho-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   f7978ee0239f435e07135fb50cd3ab6842f1f628
commit: f7978ee0239f435e07135fb50cd3ab6842f1f628 [8/8] ASoC: SOF: mediatek: Add mt8365 support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250412/202504121007.3IOzDJho-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504121007.3IOzDJho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504121007.3IOzDJho-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: sound/soc/sof/mediatek/mt8365/mt8365-clk.o: in function `adsp_clock_on':
>> mt8365-clk.c:(.text+0xb40): multiple definition of `adsp_clock_on'; sound/soc/sof/mediatek/mt8195/mt8195-clk.o:mt8195-clk.c:(.text+0xb80): first defined here
   s390-linux-ld: sound/soc/sof/mediatek/mt8365/mt8365-clk.o: in function `adsp_clock_off':
>> mt8365-clk.c:(.text+0xc80): multiple definition of `adsp_clock_off'; sound/soc/sof/mediatek/mt8195/mt8195-clk.o:mt8195-clk.c:(.text+0xc00): first defined here
   s390-linux-ld: sound/soc/sof/mediatek/mt8365/mt8365-loader.o: in function `sof_hifixdsp_boot_sequence':
>> mt8365-loader.c:(.text+0x0): multiple definition of `sof_hifixdsp_boot_sequence'; sound/soc/sof/mediatek/mt8195/mt8195-loader.o:mt8195-loader.c:(.text+0x0): first defined here
   s390-linux-ld: sound/soc/sof/mediatek/mt8365/mt8365-loader.o: in function `sof_hifixdsp_shutdown':
>> mt8365-loader.c:(.text+0x1c0): multiple definition of `sof_hifixdsp_shutdown'; sound/soc/sof/mediatek/mt8195/mt8195-loader.o:mt8195-loader.c:(.text+0x1c0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
