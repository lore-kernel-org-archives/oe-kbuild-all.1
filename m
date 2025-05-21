Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4070733993
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 04:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800436; cv=none; b=njLsyYs8Yq/tP/SpiGzyf5lRvK0AJqE7Q5QcXghrmpznalz5rOMkUw2C5ePZn5PAHbZyKGpZsjwPXDAbRoN436lsG9lxxQgz8hXAoKhU2WQ2wWZFxSI2Bvffti4YjyXk8B+X2FvRBKIumcAjuv/W5zSkqjrrqT2dUXTuVfz9PhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800436; c=relaxed/simple;
	bh=2XlBqXol5sl6R6nAuFPzeIHy2Co7y1yVV01fTwcyu64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lBCiltFuy+ec5fqOWGoqGaWIQGMqYaJ6AVkGlJ3TyvQGor34ZoEUF1xK5oqBdrhQTQoxRFTnvRZluog/5UxC/tE7mNhQeDtc8RKj2/z45Kcx+ypAiXLUh45VwJPeS/Ct3+ooXujrVn2+qlezGuF6mVnCXkClYmd7lGzNUMUiQOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKydU4G4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKydU4G4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747800434; x=1779336434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2XlBqXol5sl6R6nAuFPzeIHy2Co7y1yVV01fTwcyu64=;
  b=NKydU4G4UdTTNSl+HE1tVkFYX+OOBWUjPEI+oJRXWMpZ/0ZbJ/3MPRas
   EMOxGE4Biv3ZcUWWxNPjpPokyefHSrk9QnnP/wyBxAPcqkW+2+chIQvrO
   9dcnzZzFHAGzMe5uJA6iuhCRWRTxxt4GHBbfuSJoJKjGodqIZcCu4hoOl
   BOc9+rEAJfxRc330kdCdQHryZegipAzQZr7zctMieqhkq9Wb77BK6xtty
   sO1/SePdwP4HF2blxQFnbYdCu0dPflIBSgDWFwTi5a626Jnq2IYZTuMdN
   kyXdqNBdY36HmRQa0JAr+sYfDb88FB6suiuQoZxxSlNRxn9UJyMC3EL3S
   A==;
X-CSE-ConnectionGUID: R4/2HWbISFO5EudgLBBa2A==
X-CSE-MsgGUID: trjQSVGgRByCi1HikRm9zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60400228"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60400228"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 21:07:14 -0700
X-CSE-ConnectionGUID: XS+IwHp0T/K/bzRHllxfsQ==
X-CSE-MsgGUID: g3MK0IRiTiO2zhnVIftw2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139768867"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 May 2025 21:07:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHajW-000Nqq-0Q;
	Wed, 21 May 2025 04:07:10 +0000
Date: Wed, 21 May 2025 12:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 22/22]
 drivers/crypto/ccp/vpsp.c:1182:5: warning: no previous prototype for
 'vpsp_do_cmd'
Message-ID: <202505211110.C3pHUCeL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   ace7789354948892feb8f07d384af6d4af715703
commit: 94841c3243c5a2b082f2d8e485eac96c4abebd0e [22/22] anolis: crypto: ccp: Remove vpsp's dependency on sev module
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250521/202505211110.C3pHUCeL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211110.C3pHUCeL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211110.C3pHUCeL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/vpsp.c:729:6: warning: no previous prototype for 'vpsp_set_default_vid_permission' [-Wmissing-prototypes]
     729 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/ccp/vpsp.c:1182:5: warning: no previous prototype for 'vpsp_do_cmd' [-Wmissing-prototypes]
    1182 | int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
         |     ^~~~~~~~~~~


vim +/vpsp_do_cmd +1182 drivers/crypto/ccp/vpsp.c

  1181	
> 1182	int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
  1183	{
  1184		int rc;
  1185		int mutex_enabled = READ_ONCE(psp_mutex_enabled);
  1186	
  1187		if (is_hygon_psp && mutex_enabled) {
  1188			if (psp_mutex_lock_timeout(&psp_misc->data_pg_aligned->mb_mutex,
  1189						PSP_MUTEX_TIMEOUT) != 1) {
  1190				return -EBUSY;
  1191			}
  1192		} else {
  1193			mutex_lock(&sev_cmd_mutex);
  1194		}
  1195	
  1196		rc = psp_do_cmd_locked(cmd, (void *)phy_addr, psp_ret, PSP_DO_CMD_OP_PHYADDR);
  1197	
  1198		if (is_hygon_psp && mutex_enabled)
  1199			psp_mutex_unlock(&psp_misc->data_pg_aligned->mb_mutex);
  1200		else
  1201			mutex_unlock(&sev_cmd_mutex);
  1202	
  1203		return rc;
  1204	}
  1205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
