Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87EE8F70
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722510932; cv=none; b=SlwEz8eTMEmd/SA5Zg5SwtkuxOY5IWpCyoTEL3VrGJiDPtuVR/OB5ujqmsBtoBpaL5nbBKUAkerezVXuwM3spP6IIz8ijSbePxaj/irWf+/OuuOijw171coARJ/q3v0atO/aN9gKAhZHMBITso2UwdCQ37iiAdy0cYzf8BXBJ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722510932; c=relaxed/simple;
	bh=iMWXiAV68u+iDkR1KdbTfgCvO7g7SK67b4dswd0ywcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oTfHon5y/hRM6lkdvy6YL1WhSZBPo9j9LMwsY3TVMaTT8jI3uxWuNkPnc6x8KOGvGLALIPQe/MoO0eIWptFWjbxLpUY5VbKr3bwhM+6w1W49E9eAYUT/A+Tlr2+/GJ8lx6kO0s6/ty84ZxCfzhCe7+vV7mXo6XAjdfS9VYMeWSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPth1sfR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPth1sfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722510931; x=1754046931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iMWXiAV68u+iDkR1KdbTfgCvO7g7SK67b4dswd0ywcA=;
  b=gPth1sfRmW9YyiVja6KX9hNsxmCngEcID5C0LIuuGH63P9bcdGliTNNO
   ou5wRRSxFbpwsGnQHdtKziScBN8gHhiyPACqyYjCGTzZOioRfxRibjrne
   R27m1jV64wkZ9z4t+HRZMs4uvwPVaEAm/i2yRdyGZBr5lyqCUYJH82cTp
   LL7YnYclyE+ei+UFsBmuk/dlwyHzRrFIvwfJpCp60jIWitvg2vLLSE9YH
   xLkUDr5JU6TiqvX/XIyd0wliHKjNP/B/K8akgMOpc7KfZZTMueOqvnqRE
   zbhTmmfgnpg208Hwc3G4zcJ2Ro4rgyP8dOMuaIfpK/kyteGf47dOfOgU6
   g==;
X-CSE-ConnectionGUID: oOO5Y4tGQuG5QdlNLquduw==
X-CSE-MsgGUID: Pva3wNmhTg2elLDuwXycrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37921615"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="37921615"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 04:15:30 -0700
X-CSE-ConnectionGUID: ANieTKN5ScSAEw60tepXiQ==
X-CSE-MsgGUID: LTrLHbnfTnuqoxCgl4qILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59119924"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Aug 2024 04:15:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZTmI-000vWv-1h;
	Thu, 01 Aug 2024 11:15:26 +0000
Date: Thu, 1 Aug 2024 19:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14935/23403] lib/test_free_pages.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202408011939.8jsCsdtA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   39e859c5836c18cb021d3435101c4066536caa81
commit: 07bfcd6945a587611c2812377494457fd2c4c452 [14935/23403] mm/page_alloc.c: fix freeing non-compound pages
config: x86_64-buildonly-randconfig-002-20240801 (https://download.01.org/0day-ci/archive/20240801/202408011939.8jsCsdtA-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011939.8jsCsdtA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011939.8jsCsdtA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/test_free_pages.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
