Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEFC424646
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 20:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380042; cv=none; b=JhGq0cXs8buUtzUZg5+JK6/qPDlnqMNm08F4AqRYMuzxLrN/zWXamfJI0kb01kL8GnvEmWLpZg25li4GI/rHGwU7tTOaNTbY4lHvE6R1Tb2lPC/jwSBqivt1f43ZJD4BrReeu1xDDvk42SDcRuI4rY/ZrJCKa+dIzlA5xSxhaJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380042; c=relaxed/simple;
	bh=xa03x0xulIB904RuLJ8WlRhmIXH1+jM8oXbA8/Mi8vU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qXs2tccoWAPu8pxceZERP2o4hn/PWUg5IcPOhtuH9Pi6Ie9Vp9p6oIlhI4fEnp/QgB782l2xNv2IrWBJkpVUqzk96bR9+JOU+IijEfpXQq052eZjPc6YeYj/TjWhcEzIYGSOo9qFtMSggPyrYKPEGyTxgCqb30TtRYQ9PWMNsew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBk0wcKP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBk0wcKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788380039; x=1819916039;
  h=date:from:to:cc:subject:message-id;
  bh=xa03x0xulIB904RuLJ8WlRhmIXH1+jM8oXbA8/Mi8vU=;
  b=UBk0wcKPCl7KUzc1PoVepkBxWaFbT6CEenyJ42D7u8ztZmP97R7U+yYZ
   tTh1Xfis9w1+mxJAL8ivWgedvcXUnics1w4S3+agaU5HTm26FaMwiUeyQ
   EFRsUo7YaX3c5rrhJanMW8g6dET6WkOPa1xEDRnxkaqVOCawrfl/3NnJ8
   hk3F6aLpe0G/aB2PGWGhRwqlxPovsrv3wRuL0qIIFSisa2DmC9Zgv70n8
   u8wyxRCLxRlsn1svrgYgrRiA20av8jmGvhlqg/Rv+ztmHQyFhkLmYcnz5
   GRo00rnk5J/JstUfDBy5dBs3LPE5juLhtJILtZ+99bVoiHYW2/4V2ezrv
   Q==;
X-CSE-ConnectionGUID: BkphGFw9SI+EUk7OAC/P1A==
X-CSE-MsgGUID: Bjf7CJ3iTm2AUevLO2Jfxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="89061633"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="89061633"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 13:13:58 -0700
X-CSE-ConnectionGUID: UqYNDHCXTc6oatGuWMHLRQ==
X-CSE-MsgGUID: aYNsxLXETt2jybE7Ht4M6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="265810551"
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 Sep 2026 13:13:57 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1rLH-000000000Lf-0Tlz;
	Wed, 02 Sep 2026 20:13:55 +0000
Date: Wed, 02 Sep 2026 22:13:18 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 278/278] kismet:
 WARNING: unmet direct dependencies detected for RESET_TI_SYSCON when selected
 by SCSI_UFS_MEDIATEK
Message-ID: <202609022250.y08noq6f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   ae917b3c7332e08006443a49c261aa97ce703103
commit: 127a7e28adaf4eea024327d7a2eee7ef17a36abd [278/278] FROMGIT: scsi: ufs-mediatek: Create reset control device_link
config: arm64-kismet-CONFIG_RESET_TI_SYSCON-CONFIG_SCSI_UFS_MEDIATEK-0-0 (https://download.01.org/0day-ci/archive/20260902/202609022250.y08noq6f-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260902/202609022250.y08noq6f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609022250.y08noq6f-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESET_TI_SYSCON when selected by SCSI_UFS_MEDIATEK
   WARNING: unmet direct dependencies detected for RESET_TI_SYSCON
     Depends on [n]: RESET_CONTROLLER [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - SCSI_UFS_MEDIATEK [=y] && SCSI_LOWLEVEL [=y] && SCSI [=y] && SCSI_UFSHCD_PLATFORM [=y] && ARCH_MEDIATEK [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
