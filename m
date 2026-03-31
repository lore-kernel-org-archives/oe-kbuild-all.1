Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B906319847
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970206; cv=none; b=f85Z9keg23EcBgbWt9MDDKJiBtUrOoNuz/3MY/MgknW579x02+rb3XIAj1Svb4NWlkB6GnBIgW4ezXHdtgvg8AmvG6MWC0nR/mkCVu9c2nnUepsyT9BzV4e4bbfEbzk0PBgNRi6g4w+vAC2rJ74PP+qe3sXQLNJmj2aX2b5MmrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970206; c=relaxed/simple;
	bh=FbAaGfGDI2OXX4CiYcWgzJKO3lCpGxHSpXm1sQLcaR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=keff6F+yrPC4Daf5IrGddP3KkzfaKPjjNjrTABpcn7OZ/kjg01xdpBJDVo+lRgGM4JF4wc2ei1j05aWZwxMLA1RVEiVZdZPfo3O0nBcmsDoe4sjcfONOcNb5pa0MWJO+wfz2n8lD9ziApXIl0ilPPeZZjf+XzFuDTYf20XW3PBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W05ZUBA+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W05ZUBA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774970205; x=1806506205;
  h=date:from:to:cc:subject:message-id;
  bh=FbAaGfGDI2OXX4CiYcWgzJKO3lCpGxHSpXm1sQLcaR4=;
  b=W05ZUBA+874W4ImzT/RY/LzVRFH4iK1ZoGDo5q76supR02VP8yY8Z6uB
   ysM0jjfT2VomZ0VZ+jZn+zy0rtKmKnm7ttdcoUJuN7XkeJcjgS0GxMmWO
   fXFg70U6FFDaYT4QZTT2fIFzNbLDzYTmNHV4DOxGPsjJKHSyHKIAAWv8W
   AUkHo2fTXsYx754Gx6S9K9nVDJWnc7hpfS9aeVg1xm3q88wDzqL4OYcNj
   N09qwx+CtgVWDfwiaIvUv55KdFJ0xUISmSlzOAnJrFqfNhBVi39lVE75b
   C15oxmpEAj9hWSzrGU83cM9emCnRUm2mlAz4HEROIkygpK8eKl1nQsyFl
   w==;
X-CSE-ConnectionGUID: /dBqi3Z3TrK/LuxmIU0yEQ==
X-CSE-MsgGUID: C1bJXd8fRZCRh6eO+iwgeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="63539386"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="63539386"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 08:16:45 -0700
X-CSE-ConnectionGUID: YzJX652HRXCS80TM5Pte/g==
X-CSE-MsgGUID: 4JA2L0C6RKKuzljxGDvGUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223091931"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2026 08:16:43 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7apd-000000002np-2IgV;
	Tue, 31 Mar 2026 15:16:41 +0000
Date: Tue, 31 Mar 2026 23:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2026-03 1/1]
 drivers/scsi/ufs/ufs-mediatek.c:1142:5: warning: no previous prototype for
 'ufs_mtk_system_suspend'
Message-ID: <202603312344.wvpXiTBT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Po-Wen,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2026-03
head:   a53695b322b936b61cd943e72c90534e6717fc15
commit: 4d6bab8d366a10751b50a8cce88f9b91bf207795 [1/1] scsi: ufs: ufs-mediatek: Fix the timing of configuring device regulators
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260331/202603312344.wvpXiTBT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312344.wvpXiTBT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312344.wvpXiTBT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/ufs/ufs-mediatek.c:1142:5: warning: no previous prototype for 'ufs_mtk_system_suspend' [-Wmissing-prototypes]
    1142 | int ufs_mtk_system_suspend(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/ufs/ufs-mediatek.c:1156:5: warning: no previous prototype for 'ufs_mtk_system_resume' [-Wmissing-prototypes]
    1156 | int ufs_mtk_system_resume(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/ufs/ufs-mediatek.c:1165:5: warning: no previous prototype for 'ufs_mtk_runtime_suspend' [-Wmissing-prototypes]
    1165 | int ufs_mtk_runtime_suspend(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/ufs/ufs-mediatek.c:1179:5: warning: no previous prototype for 'ufs_mtk_runtime_resume' [-Wmissing-prototypes]
    1179 | int ufs_mtk_runtime_resume(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~


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
