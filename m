Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD72E8DEC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 09:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786872749; cv=none; b=qYIf/N5tua239vTmqMs/LH5tZCX+SmEM4qxFIUOfVKu4y42nUmKWmScm4KcblFXNqf/2vZGjUS8lstGKVxcSVMG5GsTXBQejMY0VEuwgwCAbmkE1KdL8nlO1ft19jJtyZ78B7Yo/vuJTkdLEAkrChfOIpHDf25lQp8P6+uaZpMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786872749; c=relaxed/simple;
	bh=NmS7jzKk37BsHToEJGCYVmw9xyL0W3fOMQ6g3G/8RWk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E8ydeIQ6n4mwLiE+gvu9eUAuhO/9UubOjiD8oSDeLa693tjXgSNbNr46KZLeqUdME22FnqunuU+M4XEf+0xZaEmihW1vmB9MdlqwvY65dAhe1vhJv9I+0RXFJxf+7Ke/aEAtKW3ZKKJlkUrZJtM5LQWw5F9pt6hUe80Ui1pO00Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBpCWKwY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBpCWKwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786872746; x=1818408746;
  h=date:from:to:cc:subject:message-id;
  bh=NmS7jzKk37BsHToEJGCYVmw9xyL0W3fOMQ6g3G/8RWk=;
  b=FBpCWKwY2txt6QysDEn2nvLRfmZu8VyqQcAGck4sd1pxgwzo30q1P9J4
   rcA/8SCDrouKGWFTGylmyrRyCPj0+ch/9U17Yp9gktWskOPaLVhSiRey1
   h3CO7vd79w9tfbAUcONR1nkSGUi0Me8vSrnkluNcjo92zqEZf4E6K7Fv0
   wP189PyYayxUXWUiKGdKsmzL7XBQAdnGb88ovF5aMSwluMtH9ZHlwemh4
   yEd9V/noAIXdl1f4m+G9Yn7Nk2RTCMqFLeHT/E4F8CnxPt/DJqKkGx0W6
   nBT1PVSXzIAoc/EsuxzIKv2u5q5lNisptEyIcvgzjNFK2l3zXrTlSZ2TA
   w==;
X-CSE-ConnectionGUID: oCwLgBiZTvGp9tpHOpTn2Q==
X-CSE-MsgGUID: meLnNhz7S3qXxe5cHWffgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="110163593"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="110163593"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 02:32:25 -0700
X-CSE-ConnectionGUID: p/I0a755RFarYW8+84tDzQ==
X-CSE-MsgGUID: 7/4f3UGQSxSgb7+shVM3iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="268487657"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Aug 2026 02:32:24 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvXE5-00000000cqK-2ZvC;
	Sun, 16 Aug 2026 09:32:21 +0000
Date: Sun, 16 Aug 2026 17:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Wang <kevinyang.wang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1445:2-9:
 opportunity for str_enabled_disabled(enabled)
Message-ID: <202608161707.IAEa5YkL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3eb40771c00a8488fa6ed2cc1fe203477908bf38
commit: 2a9c5154a5650c09ad44ff5e1dff74754e15a3c6 drm/amdgpu: check ASPM on the dGPU host link
date:   4 days ago
config: x86_64-randconfig-104-20260816 (https://download.01.org/0day-ci/archive/20260816/202608161707.IAEa5YkL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2a9c5154a565 ("drm/amdgpu: check ASPM on the dGPU host link")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161707.IAEa5YkL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1445:2-9: opportunity for str_enabled_disabled(enabled)

vim +1445 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

  1397	
  1398	/**
  1399	 * amdgpu_device_should_use_aspm - check if the device should program ASPM
  1400	 *
  1401	 * @adev: amdgpu_device pointer
  1402	 *
  1403	 * Confirm whether the module parameter and pcie bridge agree that ASPM should
  1404	 * be set for this device.
  1405	 *
  1406	 * Returns true if it should be used or false if not.
  1407	 */
  1408	bool amdgpu_device_should_use_aspm(struct amdgpu_device *adev)
  1409	{
  1410		struct pci_dev *aspm_pdev, *parent;
  1411		bool enabled;
  1412	
  1413		switch (amdgpu_aspm) {
  1414		case -1:
  1415			break;
  1416		case 0:
  1417			return false;
  1418		case 1:
  1419			return true;
  1420		default:
  1421			return false;
  1422		}
  1423		if (adev->flags & AMD_IS_APU)
  1424			return false;
  1425		if (amdgpu_device_aspm_support_quirk(adev))
  1426			return false;
  1427	
  1428		/*
  1429		 * pcie_aspm_enabled() checks the link between its argument and
  1430		 * the immediate upstream bridge. Use SWUS for dGPUs with an
  1431		 * internal switch so that this is the host-facing link.
  1432		 */
  1433		aspm_pdev = amdgpu_device_get_aspm_pdev(adev);
  1434		parent = pci_upstream_bridge(aspm_pdev);
  1435		if (!parent) {
  1436			dev_dbg(adev->dev, "ASPM: no upstream PCIe link for %s\n",
  1437				pci_name(aspm_pdev));
  1438			return false;
  1439		}
  1440	
  1441		enabled = pcie_aspm_enabled(aspm_pdev);
  1442		/* Report the exact link used for the automatic ASPM decision. */
  1443		dev_dbg(adev->dev, "ASPM: link %s <-> %s is %s\n",
  1444			pci_name(parent), pci_name(aspm_pdev),
> 1445			enabled ? "enabled" : "disabled");
  1446	
  1447		return enabled;
  1448	}
  1449	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
