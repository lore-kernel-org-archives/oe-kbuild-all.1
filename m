Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C6D1B267
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707041066; cv=none; b=hg3s4RRDfS39KqPb+Y100RxgloVBgD0g6QP9nq91Ew2eE1FiSdmU9MZZHVxnmuJhdrmKG78G636CLswZvK1m/QiY7L6duDWMkI1LqLT9FMXi/bRdbiyV2f/6bY/GX1v+bJ/x0H/0y1LWsJuHmmriT3gmE1/cqu+xD7GSQKanylk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707041066; c=relaxed/simple;
	bh=C3sCyZJ3054h09DeOX4OGMuLHUT9azzEK0BMAB3avEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4Efr71UlFLY0YL//4Cl8AIf5yrsSjDh+lYmJhshm5Wr1sfjxRewWYeh/QD31DSuWrqXkuQPksNq/e/Dtt28ThspD8dlpAp94EfD0zyAZdPMSwSx3QhHgchKsVGHOSuhgwP7y2Cgn+h3G+eowbGt3Z1dJ3DZ64n3y4nyNfUFcus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6cfa+/P; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6cfa+/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707041063; x=1738577063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C3sCyZJ3054h09DeOX4OGMuLHUT9azzEK0BMAB3avEw=;
  b=Z6cfa+/P3zUZKqWcXILK+493NN6A00WMz9mp1IKBa+0kEA4NySovCltW
   ohTOLQTBDK9P7YLmZKkujnOzMFpkCriNz/tNQkDh3v/wO3FQFtqsZAj1U
   n3N+KuJ0BPziV9KH/ahNchVcMqPXlI3UQkWKsjjgw2UZT9kXCiqPhYnak
   5AMVrFU+dxdDikwIIy8vfe9WWsh680qF3UqoeuXhoSXT3L1ncW8/0wPyX
   lakbCSq198V8hfPr8bpgZlSvJKgi0eRKaHNoMSngcpFkBawAJgHX35fXb
   xD3NRpnOD6i4DnaTeAN2GSELDOgeQjlA1DPplB702dBtOjpuAs7vclCr7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="531934"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="531934"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 02:04:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="799202"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Feb 2024 02:04:20 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWZMH-0006E4-2w;
	Sun, 04 Feb 2024 10:04:17 +0000
Date: Sun, 4 Feb 2024 18:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: Fiona Klute <fiona.klute@gmx.de>, linux-wireless@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Fiona Klute <fiona.klute@gmx.de>
Subject: Re: [PATCH 1/9] wifi: rtw88: Shared module for rtw8723x devices
Message-ID: <202402041702.OzA8uZKv-lkp@intel.com>
References: <20240202121050.977223-2-fiona.klute@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202121050.977223-2-fiona.klute@gmx.de>

Hi Fiona,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.8-rc2 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fiona-Klute/wifi-rtw88-Shared-module-for-rtw8723x-devices/20240202-201428
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20240202121050.977223-2-fiona.klute%40gmx.de
patch subject: [PATCH 1/9] wifi: rtw88: Shared module for rtw8723x devices
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240204/202402041702.OzA8uZKv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041702.OzA8uZKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041702.OzA8uZKv-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723d.o: in function `rtw8723x_iqk_backup_path_ctrl':
>> rtw8723d.c:(.text+0x3b0e): multiple definition of `rtw8723x_iqk_backup_path_ctrl'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x1114): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723d.o: in function `rtw8723x_iqk_config_path_ctrl':
>> rtw8723d.c:(.text+0x3b5a): multiple definition of `rtw8723x_iqk_config_path_ctrl'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x1160): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723d.o: in function `rtw8723x_iqk_restore_path_ctrl':
>> rtw8723d.c:(.text+0x3bf2): multiple definition of `rtw8723x_iqk_restore_path_ctrl'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x11f8): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723d.o: in function `rtw8723x_iqk_backup_lte_path_gnt':
>> rtw8723d.c:(.text+0x3c6c): multiple definition of `rtw8723x_iqk_backup_lte_path_gnt'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x1272): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723d.o: in function `rtw8723x_iqk_config_lte_path_gnt':
>> rtw8723d.c:(.text+0x3d04): multiple definition of `rtw8723x_iqk_config_lte_path_gnt'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x130a): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723d.o: in function `rtw8723x_iqk_restore_lte_path_gnt':
>> rtw8723d.c:(.text+0x3d90): multiple definition of `rtw8723x_iqk_restore_lte_path_gnt'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x1396): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723d.o: in function `rtw8723x_iqk_path_adda_on':
>> rtw8723d.c:(.text+0x3df0): multiple definition of `rtw8723x_iqk_path_adda_on'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x13f6): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723ds.o: in function `rtw8723x_iqk_backup_path_ctrl':
   rtw8723ds.c:(.text+0x0): multiple definition of `rtw8723x_iqk_backup_path_ctrl'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x1114): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723ds.o: in function `rtw8723x_iqk_config_path_ctrl':
   rtw8723ds.c:(.text+0x4c): multiple definition of `rtw8723x_iqk_config_path_ctrl'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x1160): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723ds.o: in function `rtw8723x_iqk_restore_path_ctrl':
   rtw8723ds.c:(.text+0xe4): multiple definition of `rtw8723x_iqk_restore_path_ctrl'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x11f8): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723ds.o: in function `rtw8723x_iqk_backup_lte_path_gnt':
   rtw8723ds.c:(.text+0x15e): multiple definition of `rtw8723x_iqk_backup_lte_path_gnt'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x1272): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723ds.o: in function `rtw8723x_iqk_config_lte_path_gnt':
   rtw8723ds.c:(.text+0x1f6): multiple definition of `rtw8723x_iqk_config_lte_path_gnt'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x130a): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723ds.o: in function `rtw8723x_iqk_restore_lte_path_gnt':
   rtw8723ds.c:(.text+0x282): multiple definition of `rtw8723x_iqk_restore_lte_path_gnt'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x1396): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723ds.o: in function `rtw8723x_iqk_path_adda_on':
   rtw8723ds.c:(.text+0x2e2): multiple definition of `rtw8723x_iqk_path_adda_on'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x13f6): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723du.o: in function `rtw8723x_iqk_backup_path_ctrl':
   rtw8723du.c:(.text+0x16): multiple definition of `rtw8723x_iqk_backup_path_ctrl'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x1114): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723du.o: in function `rtw8723x_iqk_config_path_ctrl':
   rtw8723du.c:(.text+0x62): multiple definition of `rtw8723x_iqk_config_path_ctrl'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x1160): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723du.o: in function `rtw8723x_iqk_restore_path_ctrl':
   rtw8723du.c:(.text+0xfa): multiple definition of `rtw8723x_iqk_restore_path_ctrl'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x11f8): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723du.o: in function `rtw8723x_iqk_backup_lte_path_gnt':
   rtw8723du.c:(.text+0x174): multiple definition of `rtw8723x_iqk_backup_lte_path_gnt'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x1272): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723du.o: in function `rtw8723x_iqk_config_lte_path_gnt':
   rtw8723du.c:(.text+0x20c): multiple definition of `rtw8723x_iqk_config_lte_path_gnt'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x130a): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723du.o: in function `rtw8723x_iqk_restore_lte_path_gnt':
   rtw8723du.c:(.text+0x298): multiple definition of `rtw8723x_iqk_restore_lte_path_gnt'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x1396): first defined here
   m68k-linux-ld: drivers/net/wireless/realtek/rtw88/rtw8723du.o: in function `rtw8723x_iqk_path_adda_on':
   rtw8723du.c:(.text+0x2f8): multiple definition of `rtw8723x_iqk_path_adda_on'; drivers/net/wireless/realtek/rtw88/rtw8723x.o:rtw8723x.c:(.text+0x13f6): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
