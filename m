Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3372882C9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986275; cv=none; b=WzQMhYT5odYhE8IXFdIomMwmF/mWcJ/QL7lLG1lda9KnEg7O8OoJd7XgRhhjisBtztEvqnsQxj/n0ioTFT3utxiZ39bMN2uoNZEqAX0Z7WGFVdPp8j2895NUH00DG9uO/ATvaEFkF7PVzdyz+cMrTbP0N0ecsubyyur8TzVANPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986275; c=relaxed/simple;
	bh=g1y6nbzRW8azkdohBTKTsv2nPqpP1QWzyZzFXrdCkis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T1av2FTcu8Pdff1JzZqYAnR8yaVdX8bBwYW8NXJ3fDbhFHc9eXN015Tz/5H5EUyQ0bg9mjGs9w3pkjxifK4d1FZcfch38gD7FC8IfaIJYOBfpbtMo2eqdpWY3RZ/qQnvdVOPLE1j83SCznBtX2K+uR46Nj68VzcHFDwkFLf0Fsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHbAQUy8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHbAQUy8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754986273; x=1786522273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g1y6nbzRW8azkdohBTKTsv2nPqpP1QWzyZzFXrdCkis=;
  b=fHbAQUy8PYQWgzLM7ZtIRd4Vpab/l61Al0/7abvc2XxZejNJnITTzmN3
   ZHNBRDcoG++idKUJe5c0knzYF9/83wG3aQt6IKeRerEHDWIZp5DFlp72R
   0VXWIJEBIVR/hBzo7BPPzDYiBTrj0oG8w25o7Knf3LuQm46c4gK+ZQIVl
   Ud5s0XXnhsWBLMWLBh+h1rdqaqJgRVIc9nKeucEMDPsPe4vhBDn3JRp4T
   XKgzyMe1WD3UoHR0/sIXa8UumZ9WbK533XYGsdDTqXiZeVuX1kLYHwOhh
   QERVfsj/NCuBxWOb8cmEyXyfSBQYn2UbV2TrmCJByXFJVmDKYciwJwqqI
   g==;
X-CSE-ConnectionGUID: uYBv9RD5SjywHVESVRb/CQ==
X-CSE-MsgGUID: n/OoZA7dShSxOVNzT1w3ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57175089"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57175089"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 01:11:13 -0700
X-CSE-ConnectionGUID: 9e9dFUd3QaOwBvYOEwELnA==
X-CSE-MsgGUID: BhPakgXoROOkpm/R15UB3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170351863"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 12 Aug 2025 01:11:12 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulk69-0003GJ-37;
	Tue, 12 Aug 2025 08:11:09 +0000
Date: Tue, 12 Aug 2025 10:10:30 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1755/1755]
 drivers/mailbox/mtk-cmdq-mailbox.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202508121002.xxDFTqIT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a7892155ca524e224cb2da85c85cc1bd4303179d
commit: 623a6143a845bd485b00ba684f0ccef11835edab [1755/1755] mailbox: mediatek: Add Mediatek CMDQ driver
config: x86_64-buildonly-randconfig-2004-20250811 (https://download.01.org/0day-ci/archive/20250812/202508121002.xxDFTqIT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121002.xxDFTqIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121002.xxDFTqIT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/mtk-cmdq-mailbox.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
