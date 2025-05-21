Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327611C6FE4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 03:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747799775; cv=none; b=fM5tdmXdtxWGGIM+5imDPOflpraEDxJeS8naggjvdywTdX6Q+7cs8sKthHJqY8Ila4/0D7lTgM+fLMyhGW8Th7inz72ieWYSQxuRokN+3itQ76hpQ+SyRN4H2xScnozrs79lGTGdgD/3UqV/TGkNXeR5f3vepcbUIDuqeA5csAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747799775; c=relaxed/simple;
	bh=iD8t8mBXYxfaoIFDV6mlRaO57Q55aA3dAwGC7ftyNdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dItrB2o9MCXlajAhVCs/+3MlB7vN6UYswJcZwXkHIkSqciuNbgIefmageKDTSWMgsBo4BX0EP4NLyn+o3xuXE4YYc5iH+FhmuDJ3THSIqefRGKfZVj4rPrUMUSkvIeWCBo4nlBntFmyJYTRh5WJvcXlTOiErmAj79JNSfbFd474=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAoZuTTx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAoZuTTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747799773; x=1779335773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iD8t8mBXYxfaoIFDV6mlRaO57Q55aA3dAwGC7ftyNdQ=;
  b=WAoZuTTxhWWVbRzoqSZ2UF223TI+6bEp5nEyylsS7F4TmZpLZMOG51Oi
   0dt/hrtySH3QByPbS6QSjZVaxiyFtlYQmUxhIYtjwC7bf217h46CC3Te2
   wFtN+etHJjzkZABJok6GjQ1sjsky3u7pb58car060dDJMHO7BH5JiPMRL
   USBckHILA7ydAATWgMcDpY4qgY1pAwlNkMC4dEfwQqbHi2cA9jqOhhx9n
   Ltw0OwVp4tkKDlaxSzqKMI0o8+apeOlTgjRdOtM0yQqznJRICLGZbiL3W
   +F6hEO/Uf5Jo0h6xJW7hJKlr5hLuM28x0T6zMAU9LSbOg1NO825AGna3R
   A==;
X-CSE-ConnectionGUID: xkqIAOzESG2iTdRvhL7WYg==
X-CSE-MsgGUID: PVnH9b7JTj+n7U7C2jrK4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="75159666"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="75159666"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 20:56:12 -0700
X-CSE-ConnectionGUID: MBI24qYXRQ6WIAqUMN3wJw==
X-CSE-MsgGUID: CvcU39bkTYOh16FpRiKn4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="143889127"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2025 20:56:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHaYr-000Nqe-1D;
	Wed, 21 May 2025 03:56:09 +0000
Date: Wed, 21 May 2025 11:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2263/2263] kismet: WARNING: unmet direct
 dependencies detected for ARM_SPE_MEM_SAMPLING when selected by MEM_SAMPLING
Message-ID: <202505211154.GJrcviY9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dea1e68d661266b45b33cc596c34b451de95000c
commit: cc5f4f44852f9eb4feb22a40cbb4e3d1b10c36a0 [2263/2263] mm_monitor/mm_spe: Add PMU based memory sampling abstract layer
config: arm64-kismet-CONFIG_ARM_SPE_MEM_SAMPLING-CONFIG_MEM_SAMPLING-0-0 (https://download.01.org/0day-ci/archive/20250521/202505211154.GJrcviY9-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250521/202505211154.GJrcviY9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211154.GJrcviY9-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ARM_SPE_MEM_SAMPLING when selected by MEM_SAMPLING
   WARNING: unmet direct dependencies detected for ARM_SPE_MEM_SAMPLING
     Depends on [n]: ARM_SPE_PMU [=n]
     Selected by [y]:
     - MEM_SAMPLING [=y] && ARM64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
