Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71F8208BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721165361; cv=none; b=csPDyWtbUZ+tS/obSHvFJRwAfPJnM8bnH+kCGx0oxvKSy4Fq0eyWC7wOcFNPA6pK0BM/sPifrQWQzi8QO7jJxoY/oni8CGH1qRBsSt8sA/sU0CqnzwtOBTcVo/BX1ZnyZqMWzt2jogdmRp1g8PsY0xbwyXQT3qf+hsc8CX12dy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721165361; c=relaxed/simple;
	bh=3kPNq3drRw+aVihHAGhgY0GZDi7q4dPtw3rrUl9+iac=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q3o7agY+8khErBheDCWszbkhyQERfOrEg1OmrK7XFua44D8oNHUPeSch/FWaWzfmOZW4PhFDFXYJu1FgLPFCwnTDxQZKWWzpDByn3FIhwqOlhX18RkdpMeryp4FQ7rXuuh921ploRqc+19GxBg2nptBfEhk8N9y3s1AqrhaqbRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDbl5iLv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDbl5iLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721165358; x=1752701358;
  h=date:from:cc:subject:message-id:mime-version;
  bh=3kPNq3drRw+aVihHAGhgY0GZDi7q4dPtw3rrUl9+iac=;
  b=QDbl5iLvuScTObv6E1uvTwKmu6VBGSyZf4gizuuruz0o9K2Ne4UzxvUn
   CSvUXMgHyer8ot7cllzap58ahsZsteR9QmC8UYCtlxZHwUygwxXkNBXUn
   Ey8PHuMcadZJ+fK3KaVdp852xp6OZfnQG3WAvCdtQ/xcWJfbeEAPCvUUx
   JYGoc9dW82Oal42H8WOBIxd3VoHcljugTTFCTSFSpbQFkDKY845pbvYjU
   tmiuP5WWWpyy/qqimLkSMBJsIQviNmwYwcxZY18M9oqP/d9au8VP0nEx7
   I/s0+mU90nlIrzS9Z7kjH9i/uyCrkCJZfMt9DbVJe3h1iceglxuXKjKK0
   Q==;
X-CSE-ConnectionGUID: j898/RvZT8OsLZ5tMa7Qiw==
X-CSE-MsgGUID: X2l5Tp06QYeHvVTZbnFO4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18593215"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="18593215"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 14:29:18 -0700
X-CSE-ConnectionGUID: m73ED9w9QPq0b7o6G2A9fw==
X-CSE-MsgGUID: iJzdjGIQQBCZGdqfl5LTjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="49899752"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jul 2024 14:29:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTpjX-000fgk-0p;
	Tue, 16 Jul 2024 21:29:15 +0000
Date: Wed, 17 Jul 2024 05:28:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:sdw/enable-interrupts-before-reset 32/43] ld.lld:
 error: duplicate symbol: sof_sdw_quirk
Message-ID: <202407170511.vm9cA30x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/enable-interrupts-before-reset
head:   aae1700aed4c9fa5260b81267e25c0b11e310ddc
commit: 8245a1411fef45a208f182c176660107b7f582aa [32/43] ASoC: amd/sdw_utils: add sof based soundwire generic machine driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240717/202407170511.vm9cA30x-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170511.vm9cA30x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170511.vm9cA30x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: sof_sdw_quirk
   >>> defined at acp-sdw-sof-mach.c
   >>>            sound/soc/amd/acp/acp-sdw-sof-mach.o:(sof_sdw_quirk) in archive vmlinux.a
   >>> defined at sof_sdw.c
   >>>            sound/soc/intel/boards/sof_sdw.o:(.data+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
