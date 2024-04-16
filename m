Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544C6386
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 07:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713253215; cv=none; b=Y77E3C8UluC4ssrj/csgu52hJm9B3n8xuNDEqVb6U1BJou8da7UM3elUwpJZlgbY7zg8P/u3h80KhtVwARXsfCaKInx2imB+GGYS0SHQYb/0CZSAyPUlKZKeG2rGKuMsgvIu0mjD9ee83PSLrqYEE8lncRVettMuLBcA0nbP5/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713253215; c=relaxed/simple;
	bh=OtgHsS+GY2pqOjVFT4LFdERcOqk5oMPFYW8EsvgQQFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ciGFsBzeOr8KwWoM8w7EYvm5H6G6dY86cD9yUb7mYk6P2FHoDUhb5U4W6qRq8E01b2OXuPNwNdXxHHHJc1tu1nZZasrZljMuAMz+lLFYdomkCIkOWc8AUeRn1Wkfmr5JVSURmi8mVoAqip8+Z4IxIL+hcnvPgoVS2mXEyoNApCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQ/QRE1N; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQ/QRE1N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713253213; x=1744789213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OtgHsS+GY2pqOjVFT4LFdERcOqk5oMPFYW8EsvgQQFc=;
  b=lQ/QRE1NqenGa09s6b1iDuJ18NgA4WHxPhtcC1Xd94dN2mNPr//nhBg6
   WOMulP4zVg46dIqqinHH99Q/GvTMzIdpK9hfc8SttfsTvMRy4Q6k6PS3O
   rmr31HwBmSnsXBpE4rfbY9AKorKoAqkjsc7nC2TicEdWouKPhiXnP1SNV
   hLtV3xoS7zhdFSRxpBDpvu8bsfqA8hAmzDb1WPTB/aWGZC2L2iex1uEti
   ERVJyhpFjLNvlhE8pzx1TsYfu+ytRauu7rwiZ2gzH3lwu1sVcllg7Evz3
   YtAE9vsLz4Ztnxa0JPa/5uNqmAHtxIll1tMnpvUjk7lCPGRv4n2ex95Ae
   w==;
X-CSE-ConnectionGUID: UHkuvQRITGiH5tyIhibBAA==
X-CSE-MsgGUID: ThQHgDhySmKomLewwcIpXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19279841"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="19279841"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 00:40:08 -0700
X-CSE-ConnectionGUID: fqABcRsLTdmWtyKa00TgGw==
X-CSE-MsgGUID: XhFhmgspRMSc1RFHnZZtNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22648656"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Apr 2024 00:40:08 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwdQD-00052k-1f;
	Tue, 16 Apr 2024 07:40:05 +0000
Date: Tue, 16 Apr 2024 15:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 12469/30000]
 isp1704_charger.c:undefined reference to `devm_usb_get_phy'
Message-ID: <202404161511.eIIOVFVJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   1d2ccd15e99ca276aa87a43300b0a81856b2f621
commit: 5ea2cc2db6cc28453c07b2305bc74e9379878e27 [12469/30000] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: x86_64-buildonly-randconfig-002-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161511.eIIOVFVJ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161511.eIIOVFVJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161511.eIIOVFVJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
>> isp1704_charger.c:(.text+0xfa5): undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
