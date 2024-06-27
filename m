Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CC513D29A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483859; cv=none; b=W0vD3OFwONMXHJ/hvSi0Hqn16uWcpYnqLsXikKFifwP2gYB8OzxzRObmhrZX2lhLDGFnmmGNTfyM+WQt6weHlFtzQUX2cHB7MYyLBSxRbycYF/QnI4lN1lUkvvFhukZoI1n9G3/buqIFCpOkMEZufVaZQYEDBLYlC2AQrf4T3kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483859; c=relaxed/simple;
	bh=OegROeflUSGuMgmiBgP3ZziPxf/1HMuvfvg3epE0qqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOHDB9Hdhnv756OdBdBKhnMLJHZYK9J5zYmqCJR0/5G9ObtAyYHhMMdJQMyY8nhbX+ydTs8h2U7lRoy7c7UWLIYnvKBsr/KSZ3KIWIXfLkB21SI5wyOXWIUsW5+hhvNSsQKx+3lX710jeJKoRkYdlvp4J8927zbq/pnEIf2SlTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fy7O7IlB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fy7O7IlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483856; x=1751019856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OegROeflUSGuMgmiBgP3ZziPxf/1HMuvfvg3epE0qqE=;
  b=fy7O7IlBIVelRm293TQ6ZsoAGrlWdrmPRa4QL5oOhxl8S/hsEUkKgaDg
   tcgSrWh6Ve7Nl+3owFqzR0PGJwfGejCAEie0Jl2LE8IrFcxrJzS42rw2X
   K+Fg6UUufsHu51esFMWoWcJiuZ2d9WLgZ/1dBMUkDfzCosHG8NKZ+LRkI
   y3QbrajnKMdmmFQAinjqjjQ/Yn8wgQPoP7BOtx98nOTSRf8vFUmxOoOXX
   /+f3Y9S1RioUf3q+9MkNC77XIr4WRBOqw2REVWNYTlqRgHFv6HNR8p/tw
   dXQpmNcSv8uXCvNLmZeCnbIvW4cQNBXHnTnmz4zKYH4EbKf1v8e1X3G4b
   g==;
X-CSE-ConnectionGUID: PchO5iYMROKbLw9Hdp07BQ==
X-CSE-MsgGUID: oPoSEYI2QKGv3z2279pMnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16276086"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="16276086"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:24:16 -0700
X-CSE-ConnectionGUID: SZ7rbeJwTSaa64bMK6f/NQ==
X-CSE-MsgGUID: EQ4jv9itTN6MjPd+pf9jlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="67538876"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jun 2024 03:24:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMmIV-000G7a-1M;
	Thu, 27 Jun 2024 10:24:11 +0000
Date: Thu, 27 Jun 2024 18:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5561/7880] kismet: WARNING: unmet direct
 dependencies detected for MEMCG_ZRAM when selected by EMM_ZRAM_CONF
Message-ID: <202406271832.nxYVblhc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ca7064b2308b42201419e17b030e6a9347be29cd
commit: 5723adb73901b05640a72b59bfa6125a3a469cd3 [5561/7880] emm: configs: enabled EMM related configs
config: loongarch-kismet-CONFIG_MEMCG_ZRAM-CONFIG_EMM_ZRAM_CONF-0-0 (https://download.01.org/0day-ci/archive/20240627/202406271832.nxYVblhc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240627/202406271832.nxYVblhc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271832.nxYVblhc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MEMCG_ZRAM when selected by EMM_ZRAM_CONF
   WARNING: unmet direct dependencies detected for CRYPTO_LZO
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4HC
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for MEMCG_ZRAM
     Depends on [n]: CGROUPS [=n] && MEMCG [=n] && SWAP [=y]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
