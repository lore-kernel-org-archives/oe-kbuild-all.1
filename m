Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4241FECB0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 22:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747347624; cv=none; b=H0x/1KfvxT8/1yOD/YtUOoWZYGGIuEQNJ5ooCo8kcova7kHbWPB5Z21I/barHtv5jgMhYfl8pKaRQVxxbPRHDG4jBlX5B5aSk6jjIEL4AZMvsEbdfFPJumQysIL4nrfgY+hjLPOTPSDGqNBA294Q60WPUmFUMo75klrdXt7B/n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747347624; c=relaxed/simple;
	bh=xa+sZpmuziX2Vade5WDa3ArQqf7JdxIxvp8RgpTfuTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MUgERxqaGQwYK+w74zUpdvrlHOhQGVF0mKpOWw4Ne48Uspoefqo8q9XbU8SpMB1nV+pzawKCsutDSS+9lwselOiO8gqxawd2XkLmXYbN/TOxN8vrJyU6aejRMLcWnzQBUmSUIe4RLoCnBK0VZ9B8acij0coXa6MgyWQNCZwqplQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOUsycMT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOUsycMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747347622; x=1778883622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xa+sZpmuziX2Vade5WDa3ArQqf7JdxIxvp8RgpTfuTw=;
  b=iOUsycMTb7WCNCdsgnONRJCI/34svJsLhgUK+pUzYa38a9fivw5FqR9P
   oTT4Z7lHeQTC4oCoweEvVYyfhYn+m/bPBQpj6FyNZMpHKsEJSsFmUVzdv
   5GW/9qj9il+x7FFOIhXGDEH05wuEov3ps2WnOMrKMTNCEkqCXHtFJtoZB
   sUHUNVRufh2ZIqmGDfAGo+iBm3e/ZoGMAgPhsdzK/YBuKHoawWulgdYcc
   ekJRanPgdtkzX8FHZGm6NDqsLJvHQ78ATnZLYCm7dMumENXoiyiafufAF
   IrG58zWAXKAfxgUY1Su0k3wmHopt11miknnXevEFytcBFD3lPAXqhl+HA
   g==;
X-CSE-ConnectionGUID: OItmCw4TTf6vtD/Z/UQzzA==
X-CSE-MsgGUID: LdV9cohJQEGKTIdRG1HBdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49002002"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="49002002"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 15:20:22 -0700
X-CSE-ConnectionGUID: Nmi/ovrpR12NTx8v758GQg==
X-CSE-MsgGUID: KkTHEsoiRtazPja0v24KSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138901546"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 15:20:21 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFgw6-0000Jf-1a;
	Thu, 15 May 2025 22:20:18 +0000
Date: Fri, 16 May 2025 06:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229] drivers/crypto/ccp/hygon/vpsp.c:589:6:
 warning: no previous prototype for function
 'vpsp_set_default_vid_permission'
Message-ID: <202505160621.OjKQTnzL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   baf4f02470215e4f896899f495ff7ac7fbfda979
commit: e2861aaa47961017ada7f66de11104bbf3b85eb1 [2229/2229] crypto: ccp: move vpsp-related functions to vpsp.c
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250516/202505160621.OjKQTnzL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160621.OjKQTnzL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160621.OjKQTnzL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/vpsp.c:589:6: warning: no previous prototype for function 'vpsp_set_default_vid_permission' [-Wmissing-prototypes]
     589 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         |      ^
   drivers/crypto/ccp/hygon/vpsp.c:589:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     589 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         | ^
         | static 
>> drivers/crypto/ccp/hygon/vpsp.c:1055:5: warning: no previous prototype for function 'vpsp_do_cmd' [-Wmissing-prototypes]
    1055 | int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
         |     ^
   drivers/crypto/ccp/hygon/vpsp.c:1055:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1055 | int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
         | ^
         | static 
   2 warnings generated.


vim +/vpsp_set_default_vid_permission +589 drivers/crypto/ccp/hygon/vpsp.c

   582	
   583	/**
   584	 * When 'allow_default_vid' is set to 1,
   585	 * QEMU is allowed to use 'vid 0' by default
   586	 * in the absence of a valid 'vid' setting.
   587	 */
   588	uint32_t allow_default_vid = 1;
 > 589	void vpsp_set_default_vid_permission(uint32_t is_allow)
   590	{
   591		allow_default_vid = is_allow;
   592	}
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
