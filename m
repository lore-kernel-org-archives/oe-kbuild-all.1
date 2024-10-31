Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C6D13A256
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730363478; cv=none; b=p52uEzo3irpH5vhvJin8uk1j93laRP1cVdbGnlE/ndiCVFiQlomxTxi2vPsssQLKJe0eB+GwUl0JGRaS3DNAu6T73f+MDZVAl1Djhxs1w1LVgs8F1HCLCObGuzt2/3GvqA0wLU9o/5048py+O7AVRuUUk/arTD51xUeNsaKTlac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730363478; c=relaxed/simple;
	bh=RnYekBpMcDIQnTJ8lIXxCdzmzb/IzVzMZJEy4dbWrwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/VUdIv13sY7xd6SGiQIM9y2Apjv4fMlgud4yObulRS6T1/L8ofBSznVYCKCroEBF0m4mWL6xAJOtrnkUr7pItoejR+r0uFiq9XsCW3LN013CN++8BMe7cPnlfsP5pt2fyZNwy5B8aHlm9cn2ZOnyy7+xTAO2PS8SxHPEMKjus0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W282RJh/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W282RJh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730363476; x=1761899476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RnYekBpMcDIQnTJ8lIXxCdzmzb/IzVzMZJEy4dbWrwc=;
  b=W282RJh/P+tm3Ydz8mV/6wRbZWugbxkaSwlvPFGAgqH9N6I0Ff7VJ4mn
   OUVRUX3AaxWA7n197VZerbVC7T9uDCbAuJtKYCkIdTl/l8jgFuHHekYbf
   o+Kki/PO7kP4rBkXY8Qw0wkEmNxmWoU4RVP2eab0oBHd/Yho+00OtjvT1
   Stz6g1dHM4Ib7Y6SFISYowOcCLCwmbrHi/M+v0u6wSjr2VOu1mGODhk0w
   i/rdQ0+xn+LWuXG7J22IW0sVvn0/j3IzTN5QYnh3rI+KeojbpoiYCEKC4
   qZdrPcfdcIBCASfCNy4QCcW6e8HV6oG4k2e3qKI1tFxPO3+wExwHIeSxR
   A==;
X-CSE-ConnectionGUID: rIugCohyQom6bj4y17/jYg==
X-CSE-MsgGUID: RuScQSMSRBWA6lYevM+wMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="41481621"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="41481621"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 01:31:16 -0700
X-CSE-ConnectionGUID: MkVcJ7ruRZaocrHzeEomww==
X-CSE-MsgGUID: eOfVzdhDQ4qJjENrf2i3lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="83364808"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Oct 2024 01:31:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Qa5-000fr6-1h;
	Thu, 31 Oct 2024 08:31:01 +0000
Date: Thu, 31 Oct 2024 16:30:08 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7587/7771] lib/x86_64/vmx.c:203:19: error: use of
 undeclared identifier 'VMX_BASIC_MEM_TYPE_WB'
Message-ID: <202410311632.To4HmwKO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
commit: 9af29a4f0b2ff984770581664266d123a8c3100b [7587/7771] Merge branch 'perf-tools' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311632.To4HmwKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311632.To4HmwKO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/x86_64/vmx.c:203:19: error: use of undeclared identifier 'VMX_BASIC_MEM_TYPE_WB'
     203 |                         .memory_type = VMX_BASIC_MEM_TYPE_WB,
         |                                        ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
