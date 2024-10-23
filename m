Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A828E1CEEAB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729695827; cv=none; b=G99n1vkJeyjbFQJjtW/kWYAjbEuAZeL0fjZ8tbe1wt6EmiUD1gH8imOCqORYtJiN8ETedmfOv16rqSpL0YxlT4PGtK8sOwpxKohKfrIXoxBwuKofPxOHGqHo0pjKzLBlw1YXzwdC5E99Jdvfmc+e/PJ8p6iVX15yIMraXffZ5x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729695827; c=relaxed/simple;
	bh=wihxFhkDZoIhhB+8NqMBEFYo4w8rJ4uHjAIEYrWbk3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOlTfiyc+PxRqQ/5GD4EVqG/iBSxmxaqySeQ5MCPOYBW4LUOx5YqnJB8qR27k41ln/LjCpUk6IN77gsiOAi3OpRWSKqxKIuxRxrfRpHO9FItGBAioebDAA6QWxq+AQUqY/pf0FaJbZR61M5D1BZStSHlOodCBiylXJrIXFYQA+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqsOJg/2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqsOJg/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729695826; x=1761231826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wihxFhkDZoIhhB+8NqMBEFYo4w8rJ4uHjAIEYrWbk3M=;
  b=aqsOJg/27r8CG6+9tinvdo9SLtTHAD840LDOkkaUN2PCxEdx1/sCFxXY
   G4mTjuuEumL+oGF7tdTatAHvfFvF9033MQ0pYnCkmZxanoxtW4kWfZxME
   t17lrlRWEGJUe912OzBo161w7NhvXp/FsfWIEqS+y9P7GRjDnuU99guNR
   ylFP4q8P7DynvZZS/4IpkHpJsYj0g7oSFD1enyD8DFobU4/Wk5G1l+ufP
   nHrR6UmzrImjKTtYRi0qc2Sc5xTuxzKC1nJ9KE1Z1e1vzD9vk2SBV8xwn
   JvcZj2hZjl5oBHlx/JmaKsyZpKdnq5qNn38Sefr1cBjY1sX+ZEJ7WmfgA
   A==;
X-CSE-ConnectionGUID: ZXEl6tjyRyGiaXQ/EqVFBg==
X-CSE-MsgGUID: YpnRp7PSTx+HGYPV3sNfBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29444992"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29444992"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 08:03:43 -0700
X-CSE-ConnectionGUID: Znw2zJLwTJOL4h0FOoQyOQ==
X-CSE-MsgGUID: mRI0u7b9SXysG/Uk4MkqNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="84850213"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2024 08:03:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3cte-000V3Q-2S;
	Wed, 23 Oct 2024 15:03:38 +0000
Date: Wed, 23 Oct 2024 23:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH nand/next 1/4] mtd: nand: Create param.c to do CRC
 check and bitwise majority for Parameter & CASN page
Message-ID: <202410232209.VNMcFcd5-lkp@intel.com>
References: <20241020132722.20565-2-SkyLake.Huang@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020132722.20565-2-SkyLake.Huang@mediatek.com>

Hi Sky,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/mtd-nand-Create-param-c-to-do-CRC-check-and-bitwise-majority-for-Parameter-CASN-page/20241020-212938
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20241020132722.20565-2-SkyLake.Huang%40mediatek.com
patch subject: [RFC PATCH nand/next 1/4] mtd: nand: Create param.c to do CRC check and bitwise majority for Parameter & CASN page
config: i386-randconfig-012-20241023 (https://download.01.org/0day-ci/archive/20241023/202410232209.VNMcFcd5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410232209.VNMcFcd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410232209.VNMcFcd5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "nanddev_crc16" [drivers/mtd/nand/raw/nand.ko] undefined!
>> ERROR: modpost: "nanddev_bit_wise_majority" [drivers/mtd/nand/raw/nand.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
