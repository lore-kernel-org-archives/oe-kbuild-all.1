Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA33C21A928
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 17:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754416254; cv=none; b=rpYtIjAjRxTOcoGf3o2izXpe5zmjFQevOAd+yb2L5vMAEJ8To8SsM2bV04bA9J0/kZ1iNWt0Gcm8Lnksi9IHfPx9vDRyunxihraG18T86pHVeoI3miS9SzcO/dZbcRbRY0OdnWHyVn2MzHnXnzEs72fWYW60yDU82KHN+Rf4X5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754416254; c=relaxed/simple;
	bh=dezgW/bukliKoJ4/6g9X0APlWh9/8bTwEMiERmpfA0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RZ9xZpuMCC5HVqbCFCFczJkpLD74WZc2SOBVo75SMy/TNSu+UtLeUKN4CJ3OkyKaVkyvpgdmk/RXz9bWhavOI0sDqmsmkGHGlHqcvn280IJvYL6GVP/VOylS1RXOWUFJMqVLk3PDXDRtqoqghnRV+19aIzc7L41v67RTIeNCCeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsmMI5uM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsmMI5uM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754416252; x=1785952252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dezgW/bukliKoJ4/6g9X0APlWh9/8bTwEMiERmpfA0Q=;
  b=AsmMI5uMTK8tlC2jaxZ0OwN8aAVA7m97DVYGi79eB5kfxjwTdgGIqF/z
   pmpQNnCcsjMWzq+jE0rMqYnodgEiuvTtpgHfgUP6AlGcAxtGtYy+MOroE
   gRVcJhbYgtbmjn6+K+xOza50on2tuj2wEIiz3vTEga6gF9y37MTz7lPu1
   L7LsOvkWTlFLPpnihWYzhPMiLTMNPFjm7NH4Hr2hOMI+hfcFBLT61hDje
   G7Qug3AIBkhYlV76buBfQFPW1hA5HfQSiZVJAWSON+OogUI8Myg3q1Vg7
   IwVfS2KJAJkG65TMRzELPTMOUtGZrCUw/nYO70INK1OB4RVum2v0w0SfU
   Q==;
X-CSE-ConnectionGUID: uBp3AXDmTUOb9xqCiuAyUA==
X-CSE-MsgGUID: DGwpf/YaSPaIsKulmXA16A==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56683932"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56683932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 10:50:52 -0700
X-CSE-ConnectionGUID: iGwfXF7BSZ+MbqLc69eYZQ==
X-CSE-MsgGUID: ofJ/F84qRbuMxhmshpn3yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="201739113"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 05 Aug 2025 10:50:51 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujLoG-00022d-2h;
	Tue, 05 Aug 2025 17:50:48 +0000
Date: Tue, 5 Aug 2025 19:50:47 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743]
 drivers/mailbox/imx-mailbox.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202508051931.A1JkynYg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   58693b1f5fa8f02b34ab9a02096472232731e864
commit: 2bb7005696e2246baa88772341ca032ff09a63cb [1743/1743] mailbox: Add support for i.MX messaging unit
config: x86_64-buildonly-randconfig-2001-20250802 (https://download.01.org/0day-ci/archive/20250805/202508051931.A1JkynYg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051931.A1JkynYg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508051931.A1JkynYg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/imx-mailbox.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
