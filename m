Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EDA3655FF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789829594; cv=none; b=ONrAeOOAwDwBeUBgA0dzXz7ni0i7hRo8L1rrN3M4Goy6oiLZqbiTNyOwLnc33KxoO6JhwlQitAt9JnSC/Ltvyv0GzslQ3EcCuUBx1eCNxyPjsjKJQjwEv3oFoLTo1OeuFaRgL0LhCPNwXHD58vMTA0hS1mN3KtTstHDsa/jiGqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789829594; c=relaxed/simple;
	bh=i1XZK4I+ky8oYWqBeChEAbKSbIMmFUKgjEWbhixtfDE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fEjQzT6k7qCT8eWe3sT1uT4KryANVmuZW/4/PvLpB3K/bVuIZW4OPgr743La5bvjn9Y4ihx611xIlU3TVvLYZTt9hGKKeMxDwEXCxOBWqYCN+HfmF4e1bK9fPwMX204WWSKEG9/bse2En+VlyWByJF9lihuTQNbN28yxLiJ9Opc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZOzWvmo; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZOzWvmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789829591; x=1821365591;
  h=date:from:to:cc:subject:message-id;
  bh=i1XZK4I+ky8oYWqBeChEAbKSbIMmFUKgjEWbhixtfDE=;
  b=SZOzWvmoYab8XXDfKCovjCRR29R250/t6e4KEKc6N8nvR4NrtvxALWt7
   EOfKQgCf659GaYMhSVRczB+rNXLpmvd0FR16HEajCldvCyCYSBkTYa9Pc
   owuzQzukizQORaFODNdV97bU2U70HvBF9qaXvZyvfUkDVikSmbbOX1EiS
   TZiRGS+mpjecQfQ9QkuhM7Pw/GFk2G5dU9/djEDnC1F/rP6jjFnDgffW/
   dbDbobVrtX5nDVBSTtaLv5mFDgxVp0/dx9EYSWnCB01/7TtAlK+Lb+n+i
   3odiHVY2DRtuUeaB7kpCRn8O/adbR/joBycoU2Ei7K3a4kV28oOKDHLDX
   w==;
X-CSE-ConnectionGUID: 9vdYyrlGS6ejmrq24p/RmQ==
X-CSE-MsgGUID: vmiDBpaQRrKBD4TKSEh8vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="857786"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="857786"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 07:53:09 -0700
X-CSE-ConnectionGUID: 7EnmRA+TRc6cdif/edORJg==
X-CSE-MsgGUID: TJreDXu2TuC9NhPXE7duLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="3029140"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 19 Sep 2026 07:53:08 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7wR7-00000000B0r-1MsX;
	Sat, 19 Sep 2026 14:53:05 +0000
Date: Sat, 19 Sep 2026 22:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/scsi/ufs/ufs-mediatek.c:1142:5: sparse: sparse: symbol
 'ufs_mtk_system_suspend' was not declared. Should it be static?
Message-ID: <202609192203.gZu2j2nJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   77804d3596695c7b85fe038c81d9580283ffd2ca
commit: 4d6bab8d366a10751b50a8cce88f9b91bf207795 [2/2] scsi: ufs: ufs-mediatek: Fix the timing of configuring device regulators
config: arm64-randconfig-r1305-20260919 (https://download.01.org/0day-ci/archive/20260919/202609192203.gZu2j2nJ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 05d706e9a816dbf9eff31f47869f53d6fe796089)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609192203.gZu2j2nJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609192203.gZu2j2nJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/ufs/ufs-mediatek.c:1142:5: sparse: sparse: symbol 'ufs_mtk_system_suspend' was not declared. Should it be static?
>> drivers/scsi/ufs/ufs-mediatek.c:1156:5: sparse: sparse: symbol 'ufs_mtk_system_resume' was not declared. Should it be static?
>> drivers/scsi/ufs/ufs-mediatek.c:1165:5: sparse: sparse: symbol 'ufs_mtk_runtime_suspend' was not declared. Should it be static?
>> drivers/scsi/ufs/ufs-mediatek.c:1179:5: sparse: sparse: symbol 'ufs_mtk_runtime_resume' was not declared. Should it be static?

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
