Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B43645DF60
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322365; cv=none; b=I5eGkmmtwGGRBxRTMGHRon9UxEqaivBMYa+5yJBzB8AlxIOJHcpvSD7GgTUVCWx7xsF+F8t0EdBPjXSqXlEGTQoYZo2rTpnqTfPl+j0Z9MyabBaApf6UzbeVvSXbTo9z8BDyT6QdokzxxBjV5h6f7yUfeka6hprvdZ9N1ZQlY1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322365; c=relaxed/simple;
	bh=300otkGU15qAXZhmJAZsFo38MwRyebcYPLkNl4QVGlE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kXKsKgnEyr40jGFJTLh0TzACHKJBu4e7lvh1KUr3HLKVuMA4XGnMHqDkL+fThUtyk9iHyOuh/DAohtiibki5cZD+AiYMvn5MieM5/e3Dmj3+Bmpifwhda5+fC//CycHYyfYdPwGCMM4nEzH9y50BNSghLiz7TW7RwkAdtW1rpzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFBTyIJT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFBTyIJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785322359; x=1816858359;
  h=date:from:to:cc:subject:message-id;
  bh=300otkGU15qAXZhmJAZsFo38MwRyebcYPLkNl4QVGlE=;
  b=TFBTyIJTZRvmlHcWgnymqJV3hpefiSTKNnj7JNIS8Jgq9fPArPkAhy8F
   o3En6xW0mwWFQjUEa4j410zt3Axv85Z4cs7NaEqpVFZqj6zbH1nG6tzdK
   9O1hw/y36YDP2RwsBE4/vcNfpSo1S33UJuD0oOjMXv0ZNAbCAwMjChDe4
   govYP/HixdxZIqAL3AvPPQNo4pNqoE9IsPawgCuAGtOEcZ402TNfnQdz/
   dzjAFxP4a21YpZQazrloRZnJspUBJ1PiFhXOe8yjWff1Xr29GMCQ4rGOI
   6pr6oHmoxHuESz+JFfRWAO180+NvNa745uLd5flJYWX2i1OlczXZ/WOtp
   A==;
X-CSE-ConnectionGUID: 3nMicRV9QP+a53YmA4Rpeg==
X-CSE-MsgGUID: uvp3dl+0QDOXZref4tPuZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103330544"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="103330544"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:52:36 -0700
X-CSE-ConnectionGUID: sqKLiWTEQnm+QRzFMmM7vg==
X-CSE-MsgGUID: yDMCXy+PR1+Bc8x7h6HErg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="284531788"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2026 03:52:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp1to-00000000fHq-1Zya;
	Wed, 29 Jul 2026 10:52:32 +0000
Date: Wed, 29 Jul 2026 18:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1191 1571/2006] Warning:
 fs/bcachefs/journal/journal.c:736 function parameter 'flags' not described in
 'bch2_journal_flush_seq_async'
Message-ID: <202607291855.8fITJPuy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://github.com/koverstreet/bcachefs pr/1191
head:   ebf13875265a693f2834403f5f4d92903feb11ac
commit: a0168a474528cc64bf290cf20399e714161f4538 [1571/2006] bcachefs: Pass BCH_WATERMARK_reclaim when discards require journal flush
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260729/202607291855.8fITJPuy-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291855.8fITJPuy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291855.8fITJPuy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/journal/journal.c:736 function parameter 'flags' not described in 'bch2_journal_flush_seq_async'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
