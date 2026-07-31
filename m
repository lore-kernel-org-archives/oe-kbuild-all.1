Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0026E429CD7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 18:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785524180; cv=none; b=IBKMeWQrqrxY+ge/g0cF8kWbIlcofBebuEwP+LaC2RejesxJ9h4VKqSnK2rsoufu4tfp+XSew49MApPlAmfRP3LZXcrwXz5WyS0ugL422lMDx2ODKQ2LHNyyvq8eZ8q5YHJGQ3bW8SrrjpG1jfRddazGP1BZ+T+8u8/SNkXbUho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785524180; c=relaxed/simple;
	bh=Zki5rUEsY3vrXrpOj5xNINV7lhYuvEYs1Sx8B7vSLVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ujCk7brf+1xHWll3IOwXxMZbOVD6HjEHZjhTD24xm5QovuJPN4qLlXTH76ksZtJKeFtLng8V4lot1vVyBuCX5SURKJh0/kZlOsobqoaNCQlSuRGUlytujktr/vuAXlpPcyhB6ppjsGsoXLM9c0tQf9zepLCN8/cZRziZY1UGaQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fK/ivfdb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fK/ivfdb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785524179; x=1817060179;
  h=date:from:to:cc:subject:message-id;
  bh=Zki5rUEsY3vrXrpOj5xNINV7lhYuvEYs1Sx8B7vSLVk=;
  b=fK/ivfdbeZjetND1I0nNY0+jrwBXDn77ZHOeBr2TA6KCHuPg6vIkg7p5
   t6cvMjmGTzHnETBktzC3p8fvvuA0CtO4Nobqv8xqagrvYb7J4yyYdJrKw
   rfj6HSUGEbtGahP+g8bZ0mYrNbJPXn7ZCt2GITLzQV2Oaf62IojcW6FLs
   wTspDOLazqKB+YtC9nytYWYMpPWv3A1Bk5R3hTJFqShPBwXpKjxEdeZ97
   REZ9LJxwGoZxvwAMHzG89fAvEk8W+fIvBjP8sCIqwTpjkCxNzv1VPJtAx
   9AAfuLwQpWSRmnwMX2DYeCMr6DEyFV7dIyYkxptckCasx40PUzrktY0KA
   w==;
X-CSE-ConnectionGUID: X/twRM3WS/yLYgJql1ag2w==
X-CSE-MsgGUID: 797//N9SQ6CyEFMpl9qS4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="103694713"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="103694713"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 11:56:18 -0700
X-CSE-ConnectionGUID: Fc5VZuyJTfuQnAlzoT1oAQ==
X-CSE-MsgGUID: OW4kzuNrSkSrXUJQZ1n5kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="285252635"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2026 11:56:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpsP0-0000000022b-2T3H;
	Fri, 31 Jul 2026 18:56:14 +0000
Date: Sat, 01 Aug 2026 02:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/scsi/ufs/ufs-mediatek.c:1142:5: warning: no previous prototype for
 function 'ufs_mtk_system_suspend'
Message-ID: <202608010213.u5N6zxnN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Po-Wen,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   e64da38e2e7380b65b4bda2884ee5e287656588f
commit: 4d6bab8d366a10751b50a8cce88f9b91bf207795 [2/2] scsi: ufs: ufs-mediatek: Fix the timing of configuring device regulators
config: arm-randconfig-003-20260731 (https://download.01.org/0day-ci/archive/20260801/202608010213.u5N6zxnN-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010213.u5N6zxnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010213.u5N6zxnN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:370:9: note: previous definition is here
     370 | #define __SANITIZE_ADDRESS__ 1
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
