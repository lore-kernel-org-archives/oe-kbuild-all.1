Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7045E2D3A77
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903332; cv=none; b=FtNLZcqwBSThdbOKmT1gRjDRl9KmYaJS7YxMXsg4KQUVdoo4tAW3Oxatkt6uZmHxaQC9vC1xvOCXRsS75Df8VFH4semz1a25reiHiZqOn2FW17DVe9IBsh0C/DXUQtLZJRmz3VbeEYQURYoOf2KR9RK/HjOKKkKhPJZafnbdQVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903332; c=relaxed/simple;
	bh=RxuODvu8TIKw2d9jyEgE91jXS27pM3i+S+DRUGvlVF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OytRCQ+NWuoEPcUXsyqXrcDVD7J3q9T6wuAry3JRgn7Gc+hMPWzz/0jA/yWrGZtuGSfKrxCOp98KdK5WR1UN6LIYQV+OTyuEN8OT5g+wpYUi7Zt5V9/R0f0isMeJ0hiG3KI9R/WQHwxR+4iwkeSqU76BjkA4Mn0shjUWgKgJI/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7nMejDT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7nMejDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765903329; x=1797439329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RxuODvu8TIKw2d9jyEgE91jXS27pM3i+S+DRUGvlVF4=;
  b=F7nMejDTQGmpcHiFoeVQP6JFi9TFtwU8eZ0zEE/VtfWrn/keuAGSaLG7
   c6kaacSZY2DRQSh8AgLwJ6y5req2XvMTdkci6cdbXgnLju1Mh8RaAJ1FN
   XtGhk45vgeYpRUP4+WNQOYkMEc8QbH8tgs6kx+C/6shvH6SSY4JWiCVZw
   mTg1F5HYAaFapFyvBXzs1bROoI4qqF9awL0i4R4kLReHVLAL86WTUIURH
   ZVprqBp37JzKDF4luiC6KXC4I4rH9It89NUg1LXoiP7BxaI18KXlHtEqi
   eJdk/xBzSw6PFS+NN0CZXRfahP6RJqCtWKB2hscePIx4miI5MGAL+xwDR
   A==;
X-CSE-ConnectionGUID: AMhHgolXQV6dQ9tU2VGCZg==
X-CSE-MsgGUID: q+Tok3pZRhyeVIDL6MIzfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67869245"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67869245"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:42:07 -0800
X-CSE-ConnectionGUID: qhO/mLbrQaOECh8tpyQ0Sw==
X-CSE-MsgGUID: ADXNgSjWSGqCnKBYHhQgCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197812107"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 08:42:06 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVY7d-000000003Zc-2swR;
	Tue, 16 Dec 2025 16:42:02 +0000
Date: Wed, 17 Dec 2025 00:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/scsi/ufs/ufs-mediatek.c:1142:5: warning: no previous prototype for
 function 'ufs_mtk_system_suspend'
Message-ID: <202512170015.swcBzwih-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Po-Wen,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: 4d6bab8d366a10751b50a8cce88f9b91bf207795 [2/2] scsi: ufs: ufs-mediatek: Fix the timing of configuring device regulators
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251217/202512170015.swcBzwih-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170015.swcBzwih-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170015.swcBzwih-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_ADDRESS__ 1
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
