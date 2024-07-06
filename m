Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9C81171C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jul 2024 04:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720239148; cv=none; b=t8DkV4F7mm1rKzhLndyk+QoAQUH7+O30UVp3q/Zx7xVvv4Pz73G2jMzsZNP/K9+qQnKrWrQNTPnR3pAI8VbtzY9mBrjA8rIPyFih7jm0P3Mzwt/22OGed+1VWMrvgEASUGOKH9Vi1tnEZCbNImsG3LIrcol8abd6Grmd+pCn1jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720239148; c=relaxed/simple;
	bh=oWG0CcR1nuMx7h6Qp83fy773WNt4LghdKFqj7T+Jw38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqC1iWwhJ549J1z1LXGSpch/qoyEm0IZfO45WACWu+LodOEKMWeXOFIjlcx3Up9E/eTYKv/lr7rN6lqTXV+QIJHpNqRFOl0DdawdPwBHt1lUmnNVF4LbI/xwwlScGEottMGfXvCqTbjbYeHbISdb4UFBxl1026jadWy/Z5ZTxWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtFC12Ii; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtFC12Ii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720239146; x=1751775146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oWG0CcR1nuMx7h6Qp83fy773WNt4LghdKFqj7T+Jw38=;
  b=FtFC12IiC0S3m/rW46SDO1/NhPrpgmHmH+N/hQdf/Y7ZIymmUIzk/AWP
   Cm0iyTp8iaqesH1GNVG96PFf0pJ0rr0eRJyrcS1c/ugFluUG1fYDUhQ12
   KVhzEx5O0ON4dFVbQVEewwwGlpn/LjCBHOE8p3ia8ql4emBPlnyIpNeE+
   P00iVVsKsRWK7VskIXry3WH+ti+gpKhQi2sT9AipfKztKtc0YnOpoKoi0
   n6lIoJ3F4/SsVQygAFWxcCHdtuRNd0Bb6Bt94RlIouk06QkckjQsm5Jlx
   FQLtp64qbgDQkDxVN2DzlliMtxYqjkgJiuyMjSZVKdMurYK/9Cl55lmL6
   w==;
X-CSE-ConnectionGUID: SQLeF7rHQhORHsS1GQ6tYg==
X-CSE-MsgGUID: Zub5pSZ9QlO5I6jFtm/csQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17237187"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="17237187"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 21:12:26 -0700
X-CSE-ConnectionGUID: dFqHxJDIQsucJTQJjd4kdg==
X-CSE-MsgGUID: 4yCpsjsQTLyAo6N/Lxz9Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="46975453"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jul 2024 21:12:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPwmd-000TIC-1V;
	Sat, 06 Jul 2024 04:12:23 +0000
Date: Sat, 6 Jul 2024 12:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/3] PCI/NPEM: Add Native PCIe Enclosure Management
 support
Message-ID: <202407061155.ONPs0ANe-lkp@intel.com>
References: <20240705125436.26057-3-mariusz.tkaczyk@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705125436.26057-3-mariusz.tkaczyk@linux.intel.com>

Hi Mariusz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.10-rc6 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mariusz-Tkaczyk/leds-Init-leds-class-earlier/20240706-015012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240705125436.26057-3-mariusz.tkaczyk%40linux.intel.com
patch subject: [PATCH v3 2/3] PCI/NPEM: Add Native PCIe Enclosure Management support
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20240706/202407061155.ONPs0ANe-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061155.ONPs0ANe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407061155.ONPs0ANe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/npem.c:143: warning: Function parameter or struct member 'active_inds_initialized' not described in 'npem'
>> drivers/pci/npem.c:143: warning: Excess struct member 'flags' description in 'npem'


vim +143 drivers/pci/npem.c

   111	
   112	/**
   113	 * struct npem - NPEM device properties
   114	 * @dev: PCIe device this driver is attached to
   115	 * @ops: Backend specific callbacks
   116	 * @lock: serialized accessing npem device from multiple LED devices
   117	 * @pos: NPEM backed only, NPEM capability offset
   118	 * @supported_indications: bit mask of supported indications
   119	 *			   non-indication and reserved bits are cleared
   120	 * @active_indications: bit mask of active indications
   121	 *			non-indication and reserved bits are cleared
   122	 * @flags: npem device control flags
   123	 * @led_cnt: Supported LEDs count
   124	 * @leds: supported LEDs
   125	 */
   126	struct npem {
   127		struct pci_dev *dev;
   128		const struct npem_ops *ops;
   129		struct mutex lock;
   130		u16 pos;
   131		u32 supported_indications;
   132		u32 active_indications;
   133	
   134		/*
   135		 * Use lazy loading for active_indications to not play with initcalls.
   136		 * It is needed to allow _DSM initialization on DELL platforms, where
   137		 * ACPI_IPMI module is needed.
   138		 */
   139		unsigned int active_inds_initialized:1;
   140	
   141		int led_cnt;
   142		struct npem_led leds[];
 > 143	};
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
