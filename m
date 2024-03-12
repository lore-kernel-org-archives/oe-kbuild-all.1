Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D9678667
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 16:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710261168; cv=none; b=axGhvarQklkfq6iNxVkwfktcVkx57l4BuJMWRlSGdz2qOqjdWVp0O6g0aZKCih5W7zw3vWvqzscd34TTwPnZ4jKJf/nJUYHiKtQiGuRlI5ccExuNtiCyow7iOIFj6JmcSQP3l3aF4/D22OkIerFSSjlpo+6W1f6y8o4G8JrA2XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710261168; c=relaxed/simple;
	bh=DmZ9VFHVXW3cbnALmyhSCPTMrptlJueYro8B4Bzosj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cw9OfWzeXCPWWziEtIvMUQKWO15VuNO16suuzoQN1X8PLFcp7ALU3vA9umB6LO+C5TNMyk3G9AlfhgSlgYt2yhz9mZt8u9nPcKoEOpXK0CWOlQfoOGK6KaI33aCAfCtjhMZpeti5u8J2VJ1bfW7YReeN2tVSa/kkBcmZ1yK4JLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NblzJ5ax; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NblzJ5ax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710261166; x=1741797166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DmZ9VFHVXW3cbnALmyhSCPTMrptlJueYro8B4Bzosj4=;
  b=NblzJ5axZxKvXhoVR0+9AGqzozH7Hxlqe4Dz/pzLsl8kgupQQulU5BBt
   c0rYP2WQFxJn+C1jTCM8M/fHtzrrm+4hp7kJcgpZP7Ukv/g72/5cOjrBD
   Qjmv1G9By9pEHWa1kUft+Vm0qN5dUiQO1/z3fMZiYQVMPk0wucLoNTUdU
   Qx+wLcGduGEGVMoT6QxgCT4NKS4NWI2pqUS6oGoMLcQofp8wLOHSZoIB4
   U2DLubz7ROJVRG1VcfN8Iq/M0Oex8mktulG06najZvc1PZZQYCm/y3JEr
   9KKMCpn5HJuRsOMvAUNUxDgwfVyNadb8n2+OnrFkjPLkOeOoPcdd82hYi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5168401"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5168401"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 09:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16163921"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Mar 2024 09:32:44 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk53S-000AWh-1X;
	Tue, 12 Mar 2024 16:32:42 +0000
Date: Wed, 13 Mar 2024 00:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 8322/29228] kismet: WARNING: unmet
 direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by
 GKI_HIDDEN_SND_SOC_CONFIGS
Message-ID: <202403130043.OtF8Y5ft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d24801ee88749d3bff9f942f228c42a76d4edc48
commit: dd17237d7284a4f7a881bd3c746e299f5b4675da [8322/29228] ANDROID: gki: build-in DMA_VIRTUAL_CHANNELS
config: i386-kismet-CONFIG_DMA_VIRTUAL_CHANNELS-CONFIG_GKI_HIDDEN_SND_SOC_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20240313/202403130043.OtF8Y5ft-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240313/202403130043.OtF8Y5ft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403130043.OtF8Y5ft-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by GKI_HIDDEN_SND_SOC_CONFIGS
   
   WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
