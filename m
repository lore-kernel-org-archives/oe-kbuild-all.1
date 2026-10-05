Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF9048425A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 14:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210576; cv=none; b=lOg30QheTy+hzDA8GAut9MVysb6tKbCfru7bDn+K9am/cd2Gq78O7KtKuuzfVGgFvcsjXrbjCzQyebtlU812Z5ulPTAEORyMRS9W3G++IxmKpAws8CTEtqIdMXBtpWHaaUfIw3D1/fCIeFVcqciur0PmJsQmJ29BnT1eRGPPZ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210576; c=relaxed/simple;
	bh=zlrC4IADZ8wLW05ktMEXKIoqdufPr3kK2/rN4jFtQoc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=duap6zIkvp1wtUZ13eNWvYaVCl0OM6fRzLBs7YHiIu7NNgjUYKxkoQWgNHY1YHI3bFFgyk52hxXJ5wonBIoCVLizADVHCN67vwAWMWbg9gEX2DsXHSw3X2AxISrHwd5sJ43BfclAzt7mgkZVDkZkG785zctg93t/jDpyp2wwY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2wDTDC7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2wDTDC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791210573; x=1822746573;
  h=date:from:to:cc:subject:message-id;
  bh=zlrC4IADZ8wLW05ktMEXKIoqdufPr3kK2/rN4jFtQoc=;
  b=B2wDTDC7nhf83srZ2QZCh0MSo6iLbNMXRmPhCnqkg82FcZp2tW84tmM4
   qyLQrQ+C+HR25heH94nCKxAJniENNtTfCFI+bNwC0hXHTZ1pOuzcNmjon
   wKAbc3xbCENF7o3tHRNnF+aBy8M7kt3iSYzRl268xsZz6t7mpnggXlbdF
   hWRpoBXBqhmfdjVGad0kD1QV3qyGZ7CQUYoo+Jh2MDO/eCPs3QeOwufXq
   g8E96KsxFXyAvpdWxdFPTj/FYyevFG0szXnFPW6R6YFg8qGmZo4J6lsqU
   PCa6l3h+OEQA0sg2fSCGKYCY8fcat1o9UHYVZaBt80yDnWXbZjywsfICr
   Q==;
X-CSE-ConnectionGUID: PuWCpxOCQAaUFsOBXPJBeA==
X-CSE-MsgGUID: R1VlouLPRo2lwgzMmzG5dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90833259"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="90833259"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 07:29:28 -0700
X-CSE-ConnectionGUID: gy3grtbpQ4GFii17BWyI/Q==
X-CSE-MsgGUID: f2HdC57ATZ6awAs0Etdq/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="38276"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 05 Oct 2026 07:29:26 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDjgx-0000000009X-4BBd;
	Mon, 05 Oct 2026 14:29:23 +0000
Date: Mon, 05 Oct 2026 16:29:21 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 drivers/block/loop.c:1989:6: warning: no previous prototype for function
 'loop_process_cmd_list'
Message-ID: <202610051656.M0ijtmCw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi jiayingrui,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   54d115d7e4356554c262ffafc23a12d51c0187c3
commit: aa8a9034d8a0e18d37fff6c6053f470be77637ae [0/1] ANDROID: loop: export loop_process_cmd_list
config: x86_64-randconfig-2100-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051656.M0ijtmCw-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051656.M0ijtmCw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051656.M0ijtmCw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/loop.c:1989:6: warning: no previous prototype for function 'loop_process_cmd_list' [-Wmissing-prototypes]
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         |      ^
   drivers/block/loop.c:1989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         | ^
         | static 
   1 warning generated.


vim +/loop_process_cmd_list +1989 drivers/block/loop.c

  1988	
> 1989	void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
  1990	{
  1991		struct loop_device *lo = disk->private_data;
  1992		loop_process_work(NULL, cmd_list, lo);
  1993	}
  1994	EXPORT_SYMBOL_GPL(loop_process_cmd_list);
  1995	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
