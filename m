Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CA83914E4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977525; cv=none; b=kJ5ldtqRbCxAcgfqJg082yndJdpiFwMma03eCAvCN0CSFHps0dm4AsNyyjKwWOhLf8ErfyOmtP9KOvwzw7h1HL2NRKcAkoEAbaOmB4i940kMOjWmUm7Uy5JP0TTWIUFcwkMsgpm/YHll8Ax0wJAIsnczMPgFW0nVTLl/FLses5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977525; c=relaxed/simple;
	bh=O7bq//5Y1gXCGsyWTNI1On6HKhHlPFYN7RTxVQNMJag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ffvhgrXbckBwGccEB1IjW5oTt5Pr6fRB3/Q8gZL0aH0k+INbRFofpRAUQnuavX2EzTPL2MpVc7LCHvNuBeopK0fiX91PscK30SGm1glVuVhOsh4e6Gp44hmYMRts3frZ7HJBYIW2+NomleDtBH0ewdahuKxhZ1JjmwU+mZSdv/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/iAwTNH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/iAwTNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782977523; x=1814513523;
  h=date:from:to:cc:subject:message-id;
  bh=O7bq//5Y1gXCGsyWTNI1On6HKhHlPFYN7RTxVQNMJag=;
  b=K/iAwTNH6rvzpLR8vY3J/JEUN24aBYCCos41sgCtDl1VyYJMWdYYP9ud
   BLfIQtkj5LQOxS2PRGFmcemKV2xoASbzjzsL1lruXDV/ZM8194IhbhNjC
   25GkdryXBUMJ0/QfjmcOYmftAbgnY2Gt8DA2bFUIdvSuylHH4ViVuCIup
   jAWdTEAbCj0Cc3CI0XdebrqCBVRv4tAIpiLWf9TkKHh2NpgeEKEGG/bxW
   OEIy+jS0bsKLDAs6s3BP9ri548kXqJ9274VHQGKlzaHu6z01uBo3Xo/yw
   I6Dy36j3z17MmuxxWtPDKFINsZ4pQF/QRzQDrTPYukx4D/KGs8kudP1B4
   Q==;
X-CSE-ConnectionGUID: 7H3rKgKVRjiRZlSA67tqOQ==
X-CSE-MsgGUID: U1vd33gvSUWlPSnradqNxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83588542"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83588542"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 00:32:03 -0700
X-CSE-ConnectionGUID: ApDDQ/4ZR+ueH3Vxl8XRjQ==
X-CSE-MsgGUID: feGXs6I1R0qcFa/g1imdvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="257119229"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Jul 2026 00:32:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfBtv-00000000APv-0ENz;
	Thu, 02 Jul 2026 07:31:59 +0000
Date: Thu, 02 Jul 2026 15:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] Warning:
 drivers/virt/gunyah/rsc_mgr.c:161 struct member 'pm_nb' not described in
 'gunyah_rm'
Message-ID: <202607021509.TmwFrETR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Hrishabh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   e344d519d93fa6f51e7c3886a3ee4f7c044191a2
commit: 3db5d840fdbe2110fc14bb003421a241e8b7a68a [2/2] ANDROID: virt: gunyah: Fetch fresh Gunyah information after restore
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260702/202607021509.TmwFrETR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021509.TmwFrETR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021509.TmwFrETR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/virt/gunyah/rsc_mgr.c:161 struct member 'adev' not described in 'gunyah_rm'
>> Warning: drivers/virt/gunyah/rsc_mgr.c:161 struct member 'pm_nb' not described in 'gunyah_rm'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
