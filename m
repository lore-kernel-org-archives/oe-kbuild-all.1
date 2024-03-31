Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886B5144D19
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 22:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711925999; cv=none; b=gfikkk3PVXdMwx8XBtJmdf/kprG8z99UyAI+8b/OrkdOIEEt9DjRmS3q8NGggxmHqvw9pXlF4KwSppjB9425mwpme8RfWrWF6K9SwwnRVPhkKkPIhEcbZqOXx1ywi1PKaHbGBziz+AuKqUGLcOB5h577qpzHwFlaSi/1ptUkHWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711925999; c=relaxed/simple;
	bh=kGe7AHWzwEDk7OjwdtCIIfQbOdnnJiFllAt8L7Y6I8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ja5rqZGI7nefprZIOJAvQg2VGdwPOoiy7XAdVpyvVQ5HlVLGi8j4SZMROBbOkCKuiNW/HmKpPC0lYe0sDWPdRg+MTi0hiYLCCmR+6t3ej9IVlsIhw6vTBPgWa6Mw+4FjWwvJil2rx9rTqLYf4exOla1LCk92wMCmDVYWbzHZxvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lt1mK160; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lt1mK160"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711925996; x=1743461996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kGe7AHWzwEDk7OjwdtCIIfQbOdnnJiFllAt8L7Y6I8M=;
  b=Lt1mK160X9zPvZ00rn8McaUo4CuLSeGatzqWM3EyZZjricGgZ8fAxHhQ
   uvSusthTZYAM9W3O/OOf7v/HnzPRUkSYWIViBy/2XMzXEf6KrPSUireaT
   vbsVi6H1TOv62qmcxg0Jtua3hjQ8DApsXMnXHNRI4Bh2BviF45plEHH+r
   CFdBrTFwhl9Tg/4yjjD8pxOYZOZZ+7+clJ0QuApcj07l7zR+C/kpiVfwv
   /NhpGSRJEzKT1zuhBqgb3Za5A+xXp/ZuBuxp6WNaZ9o37wOetLq8iZn0w
   jx7vmx9roFkKPAIoPZasjDfjUn07BzayU5ig53s6EHUQp/isXfmgnkIz6
   g==;
X-CSE-ConnectionGUID: HR7JOmdtSWWw5NlIoc/6mg==
X-CSE-MsgGUID: zpJGmypgRe6bRlRneNsuuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="10868933"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="10868933"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 15:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="40704592"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Mar 2024 15:59:54 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr49Y-0001TG-03;
	Sun, 31 Mar 2024 22:59:52 +0000
Date: Mon, 1 Apr 2024 06:59:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21291/22010] kismet: WARNING: unmet
 direct dependencies detected for SPI_PHYTIUM when selected by
 SPI_PHYTIUM_PCI
Message-ID: <202404010612.4M21ZDCg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6726609c5990ede3a9fdb318d1dc759d03678a1a
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [21291/22010] spi: add phytium spi support
config: arm64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PCI-0-0 (https://download.01.org/0day-ci/archive/20240401/202404010612.4M21ZDCg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240401/202404010612.4M21ZDCg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010612.4M21ZDCg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
   
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PCI [=y] && SPI [=y] && SPI_MASTER [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
