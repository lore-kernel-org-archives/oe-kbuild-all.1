Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B021A94A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 00:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746579514; cv=none; b=mW/3ZvRb2wHW3FtNaJdZDQgXtRIuNlOFiu9hpgQJgmtG1pPPRNhd5k6CPk9gJ01ppYa/xLexely/8nvKzYvSI6Qc2jqg/KTtPbklf5sqI7UlgetMdGhGwxRIHOkVck+9QXZZUomz9fgXLtC7f1sDoPq97hhahFQUYsQpHoaN2ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746579514; c=relaxed/simple;
	bh=UIFx0iYPTPZkhqPqMamtAE3YzGAJgBzDewCP/d3Z/4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AqYIY51+OrtED1D04QM5sPh83MNU9Ij+9LfVylAwb6yivXdx2q32a4hnCIC+nT2PjAwU5YIchGorcFZaVzh/x2trDP8OKFA1WkgmVp5h2Z5Pxl273gZoNcGYVTQgF+qbwL2ZfsQ83ytoHBgkd8KmVqmNFxLdxYyiCxI2lwHs5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmdlDyYK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmdlDyYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746579512; x=1778115512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UIFx0iYPTPZkhqPqMamtAE3YzGAJgBzDewCP/d3Z/4Q=;
  b=EmdlDyYKl0yf/xdIYlCCusRaIX4gDOEfb1wKRLYpY7Bb6Zo+oziv1AdM
   66pNhl0jse9dfd7kiqrO3tf0vT6hT9EXRBos4DPgYg0mRJmej2K6mnIBA
   Y/xyo/V2r+GkvaE/WfSdmj8C5x/mKWNC/mKBwx04NGGpsDp/qg9+buO8F
   sw5XRb05gzoOcw7jp7le8HS0LDG8ufAjw2zhc/4Jd6svIMdoygTABhJ0j
   j9/xF3MjYlB2EHdCX4tDbPE7ZpLZNouxGW/VhTOS+44tRGi3i2mvQMReH
   R/uKxQveSIuOaFf2mJFS6RPiUPNoJz9ouUG4pKNsE8RlPdVD7RYwJtOvx
   g==;
X-CSE-ConnectionGUID: 7lXXYCinRNyIwVlDM5gf2w==
X-CSE-MsgGUID: oXVvYYmKQaanrFloYpWOww==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59640847"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="59640847"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 17:58:31 -0700
X-CSE-ConnectionGUID: TV6I6xwjSFKE+CFY3Fb9mg==
X-CSE-MsgGUID: /8XmZlz7RTONMCxRbE25bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="136802803"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 May 2025 17:58:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCT7D-0006xt-2s;
	Wed, 07 May 2025 00:58:27 +0000
Date: Wed, 7 May 2025 08:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [iwlwifi-next:next 59/90]
 drivers/net/wireless/intel/iwlwifi/mvm/tests/hcmd.c:12:26: error: missing
 binary operator before token "("
Message-ID: <202505070821.M3UWPD3M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git next
head:   bb19250c3b4444dc7dca2f01f377d8bd7a8ccce7
commit: 621b2b3ac2d03a0e4bb598d0d2af5f11126d309c [59/90] wifi: iwlwifi: mvm: add command order checks to kunit
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505070821.M3UWPD3M-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505070821.M3UWPD3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505070821.M3UWPD3M-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/mvm/tests/hcmd.c:12:5: warning: "LINUX_VERSION_IS_LESS" is not defined, evaluates to 0 [-Wundef]
      12 | #if LINUX_VERSION_IS_LESS(6,13,0)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/mvm/tests/hcmd.c:12:26: error: missing binary operator before token "("
      12 | #if LINUX_VERSION_IS_LESS(6,13,0)
         |                          ^


vim +12 drivers/net/wireless/intel/iwlwifi/mvm/tests/hcmd.c

    11	
  > 12	#if LINUX_VERSION_IS_LESS(6,13,0)
    13	MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
    14	#else
    15	MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
    16	#endif
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
