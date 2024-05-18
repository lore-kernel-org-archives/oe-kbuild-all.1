Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA76179B2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 10:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716029462; cv=none; b=HqRVidVWiDwRysNxN5B8Lu3nbobvk+0ZKl0SJ7X0tOvZ6xAjU2KGNdC+ZO3bQg+gv2VonkMhgrjMXnKrZrnH1Ri5x7n0WYrpIrYWVmyz3bWySgzwFzfl8bdVtsibOYVJNCfwTbK5R4dk+E/K60xI7tmIIcM2KpVNZYn8VKBzYhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716029462; c=relaxed/simple;
	bh=kZnj6CrIbU+CbH6IR7d2sTVS2P+MgCEq0mP+ETrdej4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SB3FPncVcyXV9CgjhY+rOcBnjx11FDZIdwtxZhbwmUBnPEVH1rHd4B44gxsuGn3qiJrPUr43JergCsQqZh67rU57J2fJMqthBABtYihTi/XZp+Z/QgpG9R7FXKH5dxMlo3ZuBya+LTH5W+bcqhcAdBlCmSGj7XsMCMrsu1a+Y9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMw0olMn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMw0olMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716029461; x=1747565461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kZnj6CrIbU+CbH6IR7d2sTVS2P+MgCEq0mP+ETrdej4=;
  b=WMw0olMn5oebq7jxcSM6RwF7PSAUFjB7R6tlEK5QGoyMJGbFbBfisr7i
   kazP60+4UI6t2sw145+TPaAHDcCnWmtkc+HnwlXSZPA8mv0TsvHLc0bLq
   kO0qqpV4pqKr4av+6zP0aDJPJUjlqEpqoL3SoOv+5eD7bzPNOmeGkynG5
   pb67yOllaGliFrxsO8CAtFtTrO8YBVGpTFfexi81g0Jr89ofnLDYSStyb
   fPb4DP/1Mci+xQtRD1ZheVoyaiE2eru0fKdE0JOI4J1ZPsegr1H2OxxtJ
   khA+X6JKKrk1BB7hl+BU1dID/TkIv+9H65h6SlfVvhUmtWPZ+QXtvREod
   Q==;
X-CSE-ConnectionGUID: HO94sug3TeqKsZ/Gf/HQKQ==
X-CSE-MsgGUID: 6ANoii0LQx+ZxqfdfhlDUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="29732756"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="29732756"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 03:51:00 -0700
X-CSE-ConnectionGUID: v1nSMiUsSSaeJllJ7yBMPg==
X-CSE-MsgGUID: N4mZU5qmTPGoHeCEQ8lFIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="69502139"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2024 03:50:59 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8HeS-00026m-16;
	Sat, 18 May 2024 10:50:56 +0000
Date: Sat, 18 May 2024 18:50:13 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Janne Grunau <j@jannau.net>
Subject: [arm-platforms:kvm-arm64/mmu-pgt 773/874]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h:123:16: warning:
 'txchain' is used uninitialized
Message-ID: <202405181803.0kfJ27Ki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/mmu-pgt
head:   1ed29f79e7c6441ef29c25a43d7c82d91e884dcc
commit: e529bcaa17060f516d1e4f345ea460ea206317d1 [773/874] [brcmfmac] Compute number of available antennas and set it in wiphy structure.
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240518/202405181803.0kfJ27Ki-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405181803.0kfJ27Ki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405181803.0kfJ27Ki-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:30:
   In function 'brcmf_fil_iovar_int_get',
       inlined from 'brcmf_setup_wiphybands' at drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7359:8:
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h:123:16: warning: 'txchain' is used uninitialized [-Wuninitialized]
     123 |         __le32 data_le = cpu_to_le32(*data);
         |                ^~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c: In function 'brcmf_setup_wiphybands':
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7316:13: note: 'txchain' was declared here
    7316 |         u32 txchain;
         |             ^~~~~~~


vim +/txchain +123 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h

31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  108  
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  109  s32 brcmf_fil_iovar_data_set(struct brcmf_if *ifp, const char *name,
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  110  			     const void *data, u32 len);
e7191182adc51c drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Hector Martin    2022-02-01  111  s32 brcmf_fil_iovar_data_get(struct brcmf_if *ifp, const char *name, void *data,
81f5dcb8083077 drivers/net/wireless/brcm80211/brcmfmac/fwil.h          Hante Meuleman   2012-10-22  112  			     u32 len);
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  113  static inline
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  114  s32 brcmf_fil_iovar_int_set(struct brcmf_if *ifp, const char *name, u32 data)
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  115  {
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  116  	__le32 data_le = cpu_to_le32(data);
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  117  
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  118  	return brcmf_fil_iovar_data_set(ifp, name, &data_le, sizeof(data_le));
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  119  }
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  120  static inline
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  121  s32 brcmf_fil_iovar_int_get(struct brcmf_if *ifp, const char *name, u32 *data)
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  122  {
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03 @123  	__le32 data_le = cpu_to_le32(*data);
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  124  	s32 err;
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  125  
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  126  	err = brcmf_fil_iovar_data_get(ifp, name, &data_le, sizeof(data_le));
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  127  	if (err == 0)
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  128  		*data = le32_to_cpu(data_le);
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  129  	return err;
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  130  }
31343230abb168 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h Arend van Spriel 2024-01-03  131  

:::::: The code at line 123 was first introduced by commit
:::::: 31343230abb1683e8afb254e6b13a7a7fd01fcac wifi: brcmfmac: export firmware interface functions

:::::: TO: Arend van Spriel <arend.vanspriel@broadcom.com>
:::::: CC: Kalle Valo <kvalo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
