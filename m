Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266499;
	b=1FD1o+7fyfpEsSDUAj5e1fjtzCPAe0nKFg2oi+SC6rQxLE4G2dBDq12rmF3ZNXyOBO6M
	 xCBNF2DONVWIWuD+7WzlNDdcOAid64I9PGhKe6gjiWIVe/YpWjwLxD580mTTxlbvktRWW
	 7/1eRKKcfwbCZyvEU7cM6diAnlcU27bYREpQVFUtfKFuXUC/xNm7GEnWKPFE6yU2YIZco
	 fE7ITGn9Z0OMns0tJnfA98dyvDTHVkRZD9/5InB1cxDDulcSEnwJYR6n8oRCnQXL4FNgU
	 KxFMYns44zpumyTeFdecHOHRoCi2lG/+8FtrGb/PjB1fRkBEwt2ERQ6W6onwsT94gwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266499;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fQGwgcCcpywYqBTkMDcAKoZ9qZH3i37sJRJORW1RdQ0=;
	b=ORJKo9OqO8iHRqes5ywKtVsUw9QldSMh3moTTMskwYEmCZEoug5jezTg5CQki2eSEguX
	 BFN9zQilwUlvld5I9WU3hozSHPnkZUa/RCiE2ALUqw8U8axJeh5sBUULGNDcYhdfOkYIB
	 8Cp4YrAyJPHLoGFy1vVs8BNkl1cd0PiYGb9iLco59gFb6nfNhl8IIatCeGJi8aEfc7ijQ
	 a3E+Ta8X0Ua0iFqaNfuUO9lUNwcJNtKQMVmDFhevwxcrM0Z8ks9k736gT+19VnporoX2y
	 R++AFS2hQnG/hCbkvC3qkwV46dcUtt2oleaSfUYpM9hwj7i7khwuqNm8tGZ61p1spYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="kh0eH/0y";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A87606A333
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 23:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A87606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kh0eH/0y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794266499; x=1825802499;
  h=date:from:to:cc:subject:message-id;
  bh=nNFF5wzx9tftSQ0v3dRt1PmkHBocRMxx8CR5Pu9KWHg=;
  b=kh0eH/0yeFkxkM2OigrvZLAHFMXAewjwxp0uExIapqtgOvGOoFN7XvxY
   YoVtSU9rRhDTxkUWF0AVHV0hQrGIsxGtABhl8lB0GMJheznT6M06fcsQ8
   XsW/B7d48MLdUOYw/Qm3cSdyGcKr6l2gGA2YIgKiAHlmaayyUQ5Yhcngy
   GUj9MRsdUU1/nvOFtqRXPjE6yj9CUDCQZLRijMGhXvE8RKu0dAyu/1TZS
   3wzePLQDQDR84N0eeiFLL78sZ3MyM+fqUbb5SUs+fCVOWm9OhrsbWS0HH
   AujuKlTcD9IDla0ub1KA4TCsfZIhAU36UlBiYuwIGe4zav1pg6lRJIIF2
   A==;
X-CSE-ConnectionGUID: cvLaNaFkTcKQNv9mq///Aw==
X-CSE-MsgGUID: ifnBsOLoRcurKG5jCR6S3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2895594"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2895594"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:21:39 -0800
X-CSE-ConnectionGUID: afN58p3dTkC2uAYDhQtfCw==
X-CSE-MsgGUID: jVvDxa0sSIWcBR2kMjyscA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7862135"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Nov 2026 15:21:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQYgA-00000000vXV-32ll;
	Mon, 09 Nov 2026 23:21:34 +0000
Date: Tue, 10 Nov 2026 07:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 54/54]
 drivers/scsi/ufs/ufs-mediatek.c:1142:5: warning: no previous prototype for
 function 'ufs_mtk_system_suspend'
Message-ID: <202611100719.PxA2TjA2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Po-Wen,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   e519955bf54ce4a9a07b7d92cd59ced4779c1d45
commit: 4d6bab8d366a10751b50a8cce88f9b91bf207795 [54/54] scsi: ufs: ufs-mediatek: Fix the timing of configuring device regulators
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261110/202611100719.PxA2TjA2-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100719.PxA2TjA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611100719.PxA2TjA2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:372:9: note: previous definition is here
     372 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/scsi/ufs/ufs-mediatek.c:1142:5: warning: no previous prototype for function 'ufs_mtk_system_suspend' [-Wmissing-prototypes]
    1142 | int ufs_mtk_system_suspend(struct device *dev)
         |     ^
   drivers/scsi/ufs/ufs-mediatek.c:1142:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1142 | int ufs_mtk_system_suspend(struct device *dev)
         | ^
         | static 
>> drivers/scsi/ufs/ufs-mediatek.c:1156:5: warning: no previous prototype for function 'ufs_mtk_system_resume' [-Wmissing-prototypes]
    1156 | int ufs_mtk_system_resume(struct device *dev)
         |     ^
   drivers/scsi/ufs/ufs-mediatek.c:1156:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1156 | int ufs_mtk_system_resume(struct device *dev)
         | ^
         | static 
>> drivers/scsi/ufs/ufs-mediatek.c:1165:5: warning: no previous prototype for function 'ufs_mtk_runtime_suspend' [-Wmissing-prototypes]
    1165 | int ufs_mtk_runtime_suspend(struct device *dev)
         |     ^
   drivers/scsi/ufs/ufs-mediatek.c:1165:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1165 | int ufs_mtk_runtime_suspend(struct device *dev)
         | ^
         | static 
>> drivers/scsi/ufs/ufs-mediatek.c:1179:5: warning: no previous prototype for function 'ufs_mtk_runtime_resume' [-Wmissing-prototypes]
    1179 | int ufs_mtk_runtime_resume(struct device *dev)
         |     ^
   drivers/scsi/ufs/ufs-mediatek.c:1179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1179 | int ufs_mtk_runtime_resume(struct device *dev)
         | ^
         | static 
   5 warnings generated.


vim +/ufs_mtk_system_suspend +1142 drivers/scsi/ufs/ufs-mediatek.c

  1141	
> 1142	int ufs_mtk_system_suspend(struct device *dev)
  1143	{
  1144		struct ufs_hba *hba = dev_get_drvdata(dev);
  1145		int ret;
  1146	
  1147		ret = ufshcd_system_suspend(dev);
  1148		if (ret)
  1149			return ret;
  1150	
  1151		ufs_mtk_vreg_set_lpm(hba, true);
  1152	
  1153		return 0;
  1154	}
  1155	
> 1156	int ufs_mtk_system_resume(struct device *dev)
  1157	{
  1158		struct ufs_hba *hba = dev_get_drvdata(dev);
  1159	
  1160		ufs_mtk_vreg_set_lpm(hba, false);
  1161	
  1162		return ufshcd_system_resume(dev);
  1163	}
  1164	
> 1165	int ufs_mtk_runtime_suspend(struct device *dev)
  1166	{
  1167		struct ufs_hba *hba = dev_get_drvdata(dev);
  1168		int ret = 0;
  1169	
  1170		ret = ufshcd_runtime_suspend(dev);
  1171		if (ret)
  1172			return ret;
  1173	
  1174		ufs_mtk_vreg_set_lpm(hba, true);
  1175	
  1176		return 0;
  1177	}
  1178	
> 1179	int ufs_mtk_runtime_resume(struct device *dev)
  1180	{
  1181		struct ufs_hba *hba = dev_get_drvdata(dev);
  1182	
  1183		ufs_mtk_vreg_set_lpm(hba, false);
  1184	
  1185		return ufshcd_runtime_resume(dev);
  1186	}
  1187	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
