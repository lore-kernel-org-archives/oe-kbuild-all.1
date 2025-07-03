Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D9B126C03
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551537; cv=none; b=g68GmRyoXZhabrszi48D9oCEniPCcJDAhyldB05a0WD/coMCe+zjSc/YF059NFOssOkkE8iJgP8eOqs8tKmMfgDIsxhscnW/F+H076k1X4dd+v4M4Tc6pZIJNNZSMc3phOBYWKsEU6Hf8yXeClJHJnpSVwprmCcR/pDbsXR/CxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551537; c=relaxed/simple;
	bh=Gk53JLGupfT+jaB1KccpHKXilxPjJ1SngG+Jf1Yok8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PNXhJIzkeOlSZGuZfm2CHsuq7qzK5327ksCQWNwDT4iLbq8/utANspQwXizXHl2WK1Hg8fFbm9GkTpQsL48QpHLTf4liz5H/W7vdQ7ndmpQhnnKNiQ4bDTDjrt/Ry0mF7Ko9pUneIIC3M3lL2+JAak87u/WNZ2Kbc8f8gr4lrWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaNdx8tM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaNdx8tM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751551535; x=1783087535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gk53JLGupfT+jaB1KccpHKXilxPjJ1SngG+Jf1Yok8s=;
  b=CaNdx8tMhDvWBsnPCemYcREnNAI0APd8/ByaJoxxh7boxk6PAuWSC+mk
   Xey8R8jaQvlkw6AQYvP7CwsNZYpSNYWYqhkqPCp6yLX8Kc+FAd8bk6Lko
   vTZq2MRD5h/S926foqm/OObGAVuWFD1peDLjAWrzLe6I3POlk4GMkAoPD
   B+K7D3KvpBdUnpkHX6skFAmLabvOi/ZcngDTXJ5/aG2tbro1Xz/Isnx/U
   B+Q/zVUkoE5EPpMfn1f60hO/IX6jUxahQ6NwtO8AZNFoj0jNBSyw/rw/B
   5wBfeRCs704h1iglMItRgGF4bgewDvvVcwCdNd9gCR2vdGVb8hJuwF8Dl
   g==;
X-CSE-ConnectionGUID: LPzxlPm6QyGTTttWCUrqlw==
X-CSE-MsgGUID: BNFgsEtqRPGr+j8NH96H3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76425981"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="76425981"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:05:28 -0700
X-CSE-ConnectionGUID: jbpzGRRXTfOj+PMScESfGA==
X-CSE-MsgGUID: DEW7vCbwQ0+3xxc1MWBYtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="185328437"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jul 2025 07:05:27 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXKZ3-0000UL-0R;
	Thu, 03 Jul 2025 14:05:25 +0000
Date: Thu, 3 Jul 2025 16:05:18 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] mm/vmacache.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202507031600.pMMU65PM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5536700e483b14a193ce40d6be90b95fb2d7532e
commit: ddbf369c0a33924f76d092985bd20d9310f43d7f [1605/1605] mm, vmacache: hash addresses based on pmd
config: x86_64-buildonly-randconfig-2001-20250501 (https://download.01.org/0day-ci/archive/20250703/202507031600.pMMU65PM-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507031600.pMMU65PM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507031600.pMMU65PM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmacache.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
