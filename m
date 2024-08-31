Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B1E17E009
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 12:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725107113; cv=none; b=qcd9MiykixsfUEld7EkyrBreQAHEcmlGXlTVnq/zdP7OEcM+uw28OneQT3jNsnK+TlGJ4wi2evIVsxYtzeWGgLemVc85c88hQ1rn2eTuJPvSnUuRQquP58FNWIHKFVPDohCDWePmjgsF1F7JT6QoSEwFfSiXm2VKxs7yz3m7r3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725107113; c=relaxed/simple;
	bh=+kYu9N7nUWafMoOz8m4ixd5wnCvayuyVJJxCUolgL28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7YO4mvn2Q5/80Re7rgKO7pvucs8H+Vn1tfxH9BlYmX4DlXkLfhOF3hUhZ3M+KkdLn/SoxISN6lVgqKq1SeFl7wU31jPHWBObQu6+RzfSbKfxzHgG5+ic3nAbqhOxjdyCl0CT/zUwrPIZtaDPU3KlJu/fFKOqsIUYipWvpnlKpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIBQBhhS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIBQBhhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725107111; x=1756643111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+kYu9N7nUWafMoOz8m4ixd5wnCvayuyVJJxCUolgL28=;
  b=hIBQBhhSobx8n3cDNo9off6PqByZHTBLM9VsqlXPRAtAG56IPs6IE3Jf
   YJiGTsPI4AFz+td+hW5yk4Fr+9Uncezlg1+iXjuSX+FpoRBJMbI2u9VpR
   gCQpK2fZkmmWMm6pYS4oTcnMXaibqD6w9TOXYQXwcAz60s3yAa7myedbx
   7fDn9P2TFpt5mAITV2qZVFn7X3CylLXDhZ/IJoL2OWGEUn0UOfzDIBdMX
   zvbVdIZ1Rd0Afytfk3R7p+dBt1ilO7Io5ZSvrN7AkhqKaMFG5AcJwcbRb
   mblo9B2sHKhJHsGLyNUUslnFfQIT7ArmRb5B+sOxgFYhhStvWrbymuGDX
   g==;
X-CSE-ConnectionGUID: dF7RVo64ShuTv3d9ARwwjw==
X-CSE-MsgGUID: 7msJU4C5SRu7sCW88gcytw==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23257939"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23257939"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 05:25:06 -0700
X-CSE-ConnectionGUID: Fxy+PcEjRC+NwvNZO3pRwQ==
X-CSE-MsgGUID: obp3rYC0Tz+0M2BUV+uPig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="68950929"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Aug 2024 05:25:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skNA5-0002kM-1w;
	Sat, 31 Aug 2024 12:25:01 +0000
Date: Sat, 31 Aug 2024 20:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Group all DesignWare drivers under a
 single option
Message-ID: <202408312050.fs0rCgDO-lkp@intel.com>
References: <20240830111222.2131172-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830111222.2131172-1-heikki.krogerus@linux.intel.com>

Hi Heikki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heikki-Krogerus/i2c-designware-Group-all-DesignWare-drivers-under-a-single-option/20240830-191656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240830111222.2131172-1-heikki.krogerus%40linux.intel.com
patch subject: [PATCH] i2c: designware: Group all DesignWare drivers under a single option
config: x86_64-kismet-CONFIG_I2C_DESIGNWARE_PLATFORM-CONFIG_TXGBE-0-0 (https://download.01.org/0day-ci/archive/20240831/202408312050.fs0rCgDO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240831/202408312050.fs0rCgDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408312050.fs0rCgDO-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_DESIGNWARE_PLATFORM when selected by TXGBE
   WARNING: unmet direct dependencies detected for I2C_DESIGNWARE_PLATFORM
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && I2C_DESIGNWARE_CORE [=n] && (ACPI [=y] && COMMON_CLK [=y] || !ACPI [=y])
     Selected by [y]:
     - TXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
