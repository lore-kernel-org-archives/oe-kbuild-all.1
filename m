Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1C82F12C3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 20:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766262166; cv=none; b=QcIHaDiDIsXDZiOMNPh82XbPb3hSnUt6c+VcPQ0NSPbtS+tnW/cd/YihppI212QYtcluETk8x7jdOzyPM2zzZthk9uVb54S2a5YpoA0bnXVbANolwALhsQ+S70GuinpYGaR9YOfMVlKR0LEG89bjOXtzxpg9fDggzwibNvDugPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766262166; c=relaxed/simple;
	bh=z9mD+yE9F4PVhGZjxMPYkO8dfLj9mMILbGha8LMZXnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tsv4P1grSn6bxZWJaX7vW7FGjzRDExaqK5/IQ66oaiZ8pxxc+HNSEaS1xxkriDQl96TTufYCi7NkKuMrlwgMxCxSzw1pA1Cc+udiflIy1hQTAREa4aKq0amRV9Km9/o8XAAzXIFj2mYTXUBLowDnkGjVK0/MB4sUs0x+9TRyJ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/5isIbb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/5isIbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766262165; x=1797798165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z9mD+yE9F4PVhGZjxMPYkO8dfLj9mMILbGha8LMZXnE=;
  b=e/5isIbb1gLwsDbD8HyZxZJNe4MdejGEsMckWpP5Rp0K9/yUU7jBLj54
   sS499Ci7w6Ck/lnhoTabhAWm2uPMTNOvMJyYRi+rJz9SKbxTXdGBkPD3Y
   O/gdzamPJD1bRaN/iY21IqUK8Mv7/jGin9asfGsvxk6T9WxUtm9nMX4Ok
   U5eghrcISSW4x1dh/S10xltB+uO4UHYLhOMK+CLyYVor1bqOpTv3TMM25
   m27fjOVhTe2jsT3vUrqDbLMJNQ2E6+m7FwChS2WT3HXBBTZL8npzQJlxu
   jgNpBkL7Ym/ViOBltgPVjSft2flTcJ8cCs4aA/T6trhTvDeL7oru4sUnl
   A==;
X-CSE-ConnectionGUID: FBX5eACoTUSBeoJJyQ5hKw==
X-CSE-MsgGUID: b5JSaDVuTY2wPqJeCDo2Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="71816879"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="71816879"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 12:22:44 -0800
X-CSE-ConnectionGUID: p2kbP386TAKV+Ff5htT/Dg==
X-CSE-MsgGUID: Rt3DZ05sRUO4TX3PanIaFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199199876"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2025 12:22:42 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX3TM-0000000056f-3gDR;
	Sat, 20 Dec 2025 20:22:40 +0000
Date: Sun, 21 Dec 2025 04:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542]
 drivers/crypto/ccp/hygon/vpsp.c:1055:5: warning: no previous prototype for
 function 'vpsp_do_cmd'
Message-ID: <202512210938.tNGRHg5O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: e2861aaa47961017ada7f66de11104bbf3b85eb1 [3542/3542] crypto: ccp: move vpsp-related functions to vpsp.c
config: x86_64-randconfig-012-20251215 (https://download.01.org/0day-ci/archive/20251221/202512210938.tNGRHg5O-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210938.tNGRHg5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210938.tNGRHg5O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/vpsp.c:589:6: warning: no previous prototype for function 'vpsp_set_default_vid_permission' [-Wmissing-prototypes]
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +/vpsp_do_cmd +1055 drivers/crypto/ccp/hygon/vpsp.c

  1054	
> 1055	int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
  1056	{
  1057		int rc;
  1058		int mutex_enabled = READ_ONCE(hygon_psp_hooks.psp_mutex_enabled);
  1059	
  1060		if (!hygon_psp_hooks.sev_dev_hooks_installed)
  1061			return -ENODEV;
  1062	
  1063		if (mutex_enabled) {
  1064			if (psp_mutex_lock_timeout(&hygon_psp_hooks.psp_misc->data_pg_aligned->mb_mutex,
  1065						PSP_MUTEX_TIMEOUT) != 1) {
  1066				return -EBUSY;
  1067			}
  1068		} else {
  1069			mutex_lock(hygon_psp_hooks.sev_cmd_mutex);
  1070		}
  1071	
  1072		rc = __vpsp_do_cmd_locked(cmd, phy_addr, psp_ret);
  1073	
  1074		if (mutex_enabled)
  1075			psp_mutex_unlock(&hygon_psp_hooks.psp_misc->data_pg_aligned->mb_mutex);
  1076		else
  1077			mutex_unlock(hygon_psp_hooks.sev_cmd_mutex);
  1078	
  1079		return rc;
  1080	}
  1081	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
