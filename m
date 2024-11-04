Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AC220ED
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 04:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730694463; cv=none; b=glEYZu/GaFwHZ34lb/nwQI4tmq1++OKSg8TI7YtjTwmTAdqk8LKHwE/996neoF77PoZMKQg2Ttafk5DqKbLN4Fz/zkio7KTIctk4WgHrz6Tu3GFghGqYt6asZ7VHfw1ahxIGZwGI4vWLflrMYMpm/dKgh2SZrGVycpi51wTh6Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730694463; c=relaxed/simple;
	bh=V+vke6vJSWO3N9yTxP58By5xDGQWIehKX7Q8zyc10EU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AKg7MbcB35EYTgWpBCsx53ZrpQjgc3QqcZHCICDn6GoeoG5EkL7Cg+Va1iBG2wYw6/ekQkfQiO83pxvChg1cN030uN/ggVlx3n1itXiR5F7Dh2INFVTvJ8AIfR+g+oJlIPsgKoiY5VDVBIW93Vq6aTKMPxfhhO1zvISNoXoMArI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgu4Fe7F; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgu4Fe7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730694461; x=1762230461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V+vke6vJSWO3N9yTxP58By5xDGQWIehKX7Q8zyc10EU=;
  b=fgu4Fe7FUaXLGlACmmuJVTU2LSHnAVNLLQjKzQ3J92iz/gQXort0hRrE
   5tjYnR2HxldPFPAwBVjM3RFdApjLg82vXDOUSM7DG9ORxsrSN9cmGL1rH
   oGaOifePlP/ITxh73aGvTNCT6lNtjsaLAt7/dafdTQOOFBELKvm9V+acE
   Timq/UIbrbBtZxlir6Qmgnp1owlclY4gutl+L86WU6oBZI6xZH7Iq+FNk
   y/8599ZvYCbeeIeQSYWeBS8/nFWTD4vzPKoKdrxcLpzW95S3eBinYHyPW
   yC/PYEpk0WMLo0n1ZsC3YwlKKpnchBUorTDsGaAQp2JHMjs9j4HMcly5/
   Q==;
X-CSE-ConnectionGUID: MB6DMbSoT96X5bUHZl0UsA==
X-CSE-MsgGUID: nemeGoQJTsOutAT4huiirw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="41750596"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="41750596"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 20:27:39 -0800
X-CSE-ConnectionGUID: hTQiwMkJSuuBsnqH9pV8sA==
X-CSE-MsgGUID: 6ovlEMEWTwKO4krNxT5gJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83876611"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2024 20:27:39 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7ogi-000kSL-0t;
	Mon, 04 Nov 2024 04:27:36 +0000
Date: Mon, 4 Nov 2024 12:26:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2284/2284]
 include/linux/compiler_attributes.h:221:41: warning: attribute 'fallthrough'
 not preceding a case label or default label
Message-ID: <202411041220.EBEmz3cz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f57c7b292bcdd58fd6816e9636768ef58adf9ff7
commit: 06fcc73ce3f691a693a5bfbca2ba3b490bd25b65 [2284/2284] driver/arm/spe: making mem_sampling and perf mutually exclusive with spe driver
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241104/202411041220.EBEmz3cz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041220.EBEmz3cz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041220.EBEmz3cz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:65,
                    from <command-line>:
   drivers/arm/spe/spe.c: In function '__arm_spe_dev_probe':
>> include/linux/compiler_attributes.h:221:41: warning: attribute 'fallthrough' not preceding a case label or default label
     221 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   drivers/arm/spe/spe.c:492:17: note: in expansion of macro 'fallthrough'
     492 |                 fallthrough;
         |                 ^~~~~~~~~~~
>> include/linux/compiler_attributes.h:221:41: warning: attribute 'fallthrough' not preceding a case label or default label
     221 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   drivers/arm/spe/spe.c:514:17: note: in expansion of macro 'fallthrough'
     514 |                 fallthrough;
         |                 ^~~~~~~~~~~


vim +/fallthrough +221 include/linux/compiler_attributes.h

294f69e662d157 Joe Perches  2019-10-05  209  
294f69e662d157 Joe Perches  2019-10-05  210  /*
294f69e662d157 Joe Perches  2019-10-05  211   * Add the pseudo keyword 'fallthrough' so case statement blocks
294f69e662d157 Joe Perches  2019-10-05  212   * must end with any of these keywords:
294f69e662d157 Joe Perches  2019-10-05  213   *   break;
294f69e662d157 Joe Perches  2019-10-05  214   *   fallthrough;
294f69e662d157 Joe Perches  2019-10-05  215   *   goto <label>;
294f69e662d157 Joe Perches  2019-10-05  216   *   return [expression];
294f69e662d157 Joe Perches  2019-10-05  217   *
294f69e662d157 Joe Perches  2019-10-05  218   *  gcc: https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html#Statement-Attributes
294f69e662d157 Joe Perches  2019-10-05  219   */
294f69e662d157 Joe Perches  2019-10-05  220  #if __has_attribute(__fallthrough__)
294f69e662d157 Joe Perches  2019-10-05 @221  # define fallthrough                    __attribute__((__fallthrough__))
294f69e662d157 Joe Perches  2019-10-05  222  #else
294f69e662d157 Joe Perches  2019-10-05  223  # define fallthrough                    do {} while (0)  /* fallthrough */
a3f8a30f3f0079 Miguel Ojeda 2018-08-30  224  #endif
a3f8a30f3f0079 Miguel Ojeda 2018-08-30  225  

:::::: The code at line 221 was first introduced by commit
:::::: 294f69e662d1570703e9b56e95be37a9fd3afba5 compiler_attributes.h: Add 'fallthrough' pseudo keyword for switch/case use

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
