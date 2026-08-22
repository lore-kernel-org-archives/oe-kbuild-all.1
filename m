Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46C02AD00
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Aug 2026 02:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787364629; cv=none; b=aj6laKfF7dMr6ZoGkK6PwCedFMlryMgCvxLT9wSQkpvwlmnCxsLu2m0w3w7v371g06FYaGhujve7HQvVgy8IKEEzjBkLyFmQW3ADGqQuK2uqXE2WlFrbS0sY8hVTQH3cc/UcvlJaqVPEbVN5+bZpe0JnlnDDOUz+LIlZ8IlMCc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787364629; c=relaxed/simple;
	bh=yzIIKK6J60/eoIQq0grp/W+JnvW1XE2GuRITGD394lw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pW0oBEcMJgaEkKx8tpambkEATN0LM7/lg6/weDUjt3yh9V2NsdVR4KqFbiZXIOQIk4FOvSR59T9Pm/8ZnIRyLBdCbbs6iHH3Zs7ezPw57j0qkfn7QzJuVSMd3PfWsMWDxEyFe4GCaaW51ggjIkcoOmaW5zJuIxKVbFbjBfV2UF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxO/YRWk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxO/YRWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787364627; x=1818900627;
  h=date:from:to:cc:subject:message-id;
  bh=yzIIKK6J60/eoIQq0grp/W+JnvW1XE2GuRITGD394lw=;
  b=dxO/YRWkZX/ApRw+7ETagYEu7D7Ek9pJtzh/vGZ0W8goPbekQe0zrZMF
   d+nlvw26EvA8RXomr7TXea255TiQ2zG8tf8AhXo0p2unG4HW5szTu2fdi
   8cxDX9sMTsSB1Fmn9ZLufBoJezIi7NOdYLCVVRR8pIHCZyzjqmusshIX9
   IdWW/g0chqDu2WsBdXjBKyAGnwu3yDSCx+efuVF3NKmPoEBdmhWtBCfJ/
   B/SFl/Bj1zFFthSi9G9GKj9eBXP7yaBerTHu8kOKlZsJtEtuXoSp2ASAZ
   7Kvi4EbEYP6GT8mxiU69kIVHJH8sCV+l+o6ffGTUGeConIQm/wjM0hqpG
   A==;
X-CSE-ConnectionGUID: RySpf9+STQGp2/qK5AjLiQ==
X-CSE-MsgGUID: PG3EpDHORsKQS1uf8vykWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87678575"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="87678575"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 19:10:27 -0700
X-CSE-ConnectionGUID: agaOJ+uoR7KdJPhtoGWb2w==
X-CSE-MsgGUID: VV62NPorRA6lzG8dp0IYIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="269974836"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Aug 2026 19:10:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxbBf-00000000qkv-3BEc;
	Sat, 22 Aug 2026 02:10:23 +0000
Date: Sat, 22 Aug 2026 10:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 drivers/scsi/ufs/ufs-mediatek.c:1142:5: warning: no previous prototype for
 'ufs_mtk_system_suspend'
Message-ID: <202608221044.wgocmzVj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Po-Wen,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   4658b8c144ed394a271eeab38af94b88745cdab5
commit: 4d6bab8d366a10751b50a8cce88f9b91bf207795 [1/1] scsi: ufs: ufs-mediatek: Fix the timing of configuring device regulators
config: arm-randconfig-002-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221044.wgocmzVj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221044.wgocmzVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221044.wgocmzVj-lkp@intel.com/

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
