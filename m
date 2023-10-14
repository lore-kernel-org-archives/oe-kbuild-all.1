Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DE519BC2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 16:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNYfyqQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697302678; x=1728838678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eTg0/cENUbp8zCKgeE97m4a6SBC0rIL/W7AHduIeFFI=;
  b=WNYfyqQEFh3ZQNozUHqz40X/IJtL/bVbNVfJOPsPdxXXE0SkzkqlbQLP
   gzj1qnd51ZFnq51oIwVceaGEHlCc8VLHW42D5t895rEBatPmcBe+kqp5v
   OfhWtSrl4CkEoeShfuEXADR2rLcfg+RA2e/dRjxqQW4ihxdwEVcnddHet
   VMfX8sHY4DlKbjoLJyox1ABzaQvh1pdVhPM4KyC1CL5JTpAFTSyeaiC7i
   seMVYBsyay5zGI32nFnZ9MV1hpW/noyMmnQYqtrzvyCAhUcgbCP8vCH/n
   dB3tRKt0emaShwiAXccJm0RtVH2+zWF19FCf6dh3U2WB4zpzelPG77OXp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375688655"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="375688655"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 09:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825415652"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="825415652"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Oct 2023 09:57:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrhxX-0006QE-04;
	Sat, 14 Oct 2023 16:57:51 +0000
Date: Sun, 15 Oct 2023 00:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [aegl:resctrl2_patches_v6.6-rc5 79/101] checkpatch: ERROR: spaces
 required around that '=' (ctx:VxW)
Message-ID: <202310150013.kxEDVtjq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_patches_v6.6-rc5
head:   5923ca9112dd53a998ef4b986edcf65ee0b9065d
commit: 77b055d033f4edf47976c538fab3b8e2160d29a7 [79/101] resctrl2: arch/x86/rdt_llc_occupancy: Add module for LLC occupancy
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150013.kxEDVtjq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150013.kxEDVtjq-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: spaces required around that '=' (ctx:VxW)
#86: FILE: fs/resctrl2/arch/x86/rdt_llc_occupancy.c:34:
+	.mon_domain_file= "llc_occupancy",
 	                ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
