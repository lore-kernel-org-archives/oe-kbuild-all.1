Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C99E23875A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 17:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733332448; cv=none; b=WDMglg5wIyfH0QJCItx98cn/JP72f3lpqAVqw6rNmQFv4LFaVktJIoK0kXyDxcp8SyIUGKaFpsfjJJ8YA0ruffv0+jlfIiTLAvx7RS3obEG/jTICmMVXQ/Hb2Jg+yx+G/E0z60C4YqwUCFF23OddkeYfCZTJyT+yF8aOUQfJmEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733332448; c=relaxed/simple;
	bh=ChKkFSn+HqNwYxXPJrcJdOBEyWhHbGL/w0jr10G3JTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QzKmn771zYEQsYdtaUZvPHHET9HdkiNzoWq19veyFVNleDHF//Su13/ByQ56FoBhkSVLo3kn65CmGRQu26VgtLpPYFja3sGyKjFGp8Cot6BWuGt2QILFlMSOFKapsKVDZTcLn57EfLzf4I+ZbmgCB3FaTzxK+u80YHHg8kAO7Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gttBN2bQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gttBN2bQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733332446; x=1764868446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ChKkFSn+HqNwYxXPJrcJdOBEyWhHbGL/w0jr10G3JTw=;
  b=gttBN2bQaxzLOCAprxoYqDjS55WXDW7Vq1ihcHsWWCOKQmG741RtCt2F
   Axij2UwH/vLUpC0VI4vxD8KcFUL8WVEGmLR+0VJ5VSOFJuQOe0cNhDnVc
   i5ZQvov7NRvpeijtp9OONbeCvB2bfz9+Ilr07f6PcdXMxKl7KzQnsVduZ
   FyY2ucD+007zDTnbG4n00UO5PT4WfTadwtuLXX+nzmBNokTk/12HBOflq
   57da8XzZ/3LCsWj2bULLQKqmcPBiicp1iZwVtYur5nIDyy9fltxvekO5A
   3O+OFyRnpyBDuOfx4/HcCBye5PVonc7+vWL4gvfjSNFRyJseC5ptKsgV0
   Q==;
X-CSE-ConnectionGUID: 9tUeuM5CSh6vAp2DDDaFdw==
X-CSE-MsgGUID: bMPKUQiaT+S8n7K8RtWMKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33740153"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="33740153"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 09:14:06 -0800
X-CSE-ConnectionGUID: htJ7TogrRwC2q/Wx6M7rYg==
X-CSE-MsgGUID: 7d9Nt9ORRq6Ms9LRe0Pf6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="94012862"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Dec 2024 09:14:05 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIsws-0003KZ-2b;
	Wed, 04 Dec 2024 17:14:02 +0000
Date: Thu, 5 Dec 2024 01:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, heppen <hepeng68@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544] kismet: WARNING: unmet direct
 dependencies detected for CPPC_CPUFREQ_SYSFS_INTERFACE when selected by
 CPU_FREQ_GOV_SEEP
Message-ID: <202412050118.uE81aGlX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b71af6f00ede58be00cb7306c9acb2660ec90947
commit: c3fe0dc62217d6faa76128ed26d64e421767919e [2544/2544] cpufreq: Add SEEP governor for hardware-managed P-states
config: arm64-kismet-CONFIG_CPPC_CPUFREQ_SYSFS_INTERFACE-CONFIG_CPU_FREQ_GOV_SEEP-0-0 (https://download.01.org/0day-ci/archive/20241205/202412050118.uE81aGlX-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241205/202412050118.uE81aGlX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050118.uE81aGlX-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CPPC_CPUFREQ_SYSFS_INTERFACE when selected by CPU_FREQ_GOV_SEEP
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]
   
   WARNING: unmet direct dependencies detected for CPPC_CPUFREQ_SYSFS_INTERFACE
     Depends on [n]: CPU_FREQ [=y] && (ARM || ARM64 [=y]) && ACPI_CPPC_CPUFREQ [=n]
     Selected by [y]:
     - CPU_FREQ_GOV_SEEP [=y] && CPU_FREQ [=y] && (ACPI_CPPC_CPUFREQ [=n] || ARM64 [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
