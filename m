Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5051427A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 22:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764715807; cv=none; b=ldEjJZ5QeAgcKIzhV7tlcJ7QN33LIm+sr7Uj5VkCg2ErgYX2K+ECsm9GDZ8nwZL5feREEkOdHb/IaLl7tUNEe7asL0rVAoAYK3YSS6pM/mz+0tFJ7/28wfw56MXr9qpMocX0Eioe27PciLrjH7D3N1r6tUegLBv43SxxuXXZEpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764715807; c=relaxed/simple;
	bh=G4oPXrPI8PwJJLVy+NJqGPdaksfb/5A6sgtJVTFuEAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOFCEHp4Zil9vLTdyx/h94awKUk8Fi+h+PBg6UX55feU2/MnxLBb1rFsSRh1wdVFa+RRnKMYGlBVJIntVr4EZS8qAIuYotx+lkUOX54U5u0PnhCFgXKRWzcP3IfP/NXi/DQp4XqsCINDr+J2FGiQTzu41CcYuK25HSuAwuYrtLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJSQiEMg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJSQiEMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764715806; x=1796251806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G4oPXrPI8PwJJLVy+NJqGPdaksfb/5A6sgtJVTFuEAo=;
  b=cJSQiEMg9UVyr6MC0nsZIJhCa0r6AsV/e1KkvWWsud28La884kxxC3qM
   9WUdCdP6ENMq4H+DzFfl6s1tUUUj0TCRKZ7RaejKNC+79vLEtulkwfQJa
   nceu1SzmHbn/fMH2kA+VuSuPL+bQToUYTTsC1KkVrnDRaKHlUxo7Gi4ar
   xgM1dBhowAzf5xPPE/XMQA4axEJJIKIYIiSwgNNyoCU1HI8ZhmvYwPR1X
   t+XyMZWCDVKHwMiWi2aBTwkEHnrQs79jZtjgELU/K/MKWMCF2Dugn8VAr
   FMd7k0i+lxiu3canaVMWIi4CsFN+3FvCCdLF4OAEb5VmeiXnpGTGzaARu
   g==;
X-CSE-ConnectionGUID: h+5a51PDQJaST9RJelXEng==
X-CSE-MsgGUID: XHIRxmHCR/+mxGasu3NtkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66420976"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66420976"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 14:49:59 -0800
X-CSE-ConnectionGUID: rVvzLVFqTCKrPMQzuuHqwA==
X-CSE-MsgGUID: hjzNXh/LSAqGS7RjtkXM2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="231840756"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Dec 2025 14:49:55 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQZBw-00000000AHF-2htP;
	Tue, 02 Dec 2025 22:49:52 +0000
Date: Wed, 3 Dec 2025 06:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: adrianhoyin.ng@altera.com, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, adrianhoyin.ng@altera.com
Subject: Re: [PATCH v5 4/5] i3c: dw: use FIELD_PREP for device address table
 macros
Message-ID: <202512030652.72UiYSSA-lkp@intel.com>
References: <4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng@altera.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng@altera.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on i3c/i3c/next]
[also build test ERROR on linus/master v6.18 next-20251202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/adrianhoyin-ng-altera-com/i3c-add-sysfs-entry-for-Device-NACK-Retry-count/20251202-163150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng%40altera.com
patch subject: [PATCH v5 4/5] i3c: dw: use FIELD_PREP for device address table macros
config: powerpc64-randconfig-r073-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030652.72UiYSSA-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030652.72UiYSSA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030652.72UiYSSA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i3c/master/dw-i3c-master.c: In function 'dw_i3c_master_daa':
>> drivers/i3c/master/dw-i3c-master.c:214:40: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
    #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
                                           ^~~~~~~~~~
   drivers/i3c/master/dw-i3c-master.c:862:10: note: in expansion of macro 'DEV_ADDR_TABLE_DYNAMIC_ADDR'
      writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +214 drivers/i3c/master/dw-i3c-master.c

   206	
   207	#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
   208	#define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
   209	#define DEV_ADDR_TABLE_STATIC_MASK		GENMASK(6, 0)
   210	#define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
   211	#define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
   212	#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))
   213	#define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
 > 214	#define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
   215	#define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
   216	#define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
