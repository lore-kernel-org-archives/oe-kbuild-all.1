Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC2F415B70
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 06:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294382; cv=none; b=BZoRjJn46sQLmiElj8IHC1TmpQX+IZ2LZDp1y+LrjqJnCBKCBGi/+yuHUMePRqVb1WXaNc3KLUmi9LVGcKFJ923YLCTko2QvUPMw22zhSKFHVxCO7tu5IFEPV8wX0vRPt8ogUeOphECFx0osIp962Ot/QUUPX1Zy+AsUWN/LM9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294382; c=relaxed/simple;
	bh=GKzHvQniF9Q4JQYzOz2P5LzK6vze2zMfzB2CqoTAcW4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R4luFvU7+rXTRcqflXrmFSptgmgb8hWTMHAMGh/Tzt7+Z02u2aB+VBejp/sDZz29KXnQ3xZdS8dyPFFhUgKP7ENQtMyxDuyHog80VAfpyg9M/nhk8qtWp7fUz1aJH2ds6bAQKj421xBSx1FqvJSaj6rOQzxEsiNDpaTBBz5/ggQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bptT6LfL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bptT6LfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787294380; x=1818830380;
  h=date:from:to:cc:subject:message-id;
  bh=GKzHvQniF9Q4JQYzOz2P5LzK6vze2zMfzB2CqoTAcW4=;
  b=bptT6LfLyQZWq/B6dPiqawv1B9sKvMzoiWrsteAmDNOgyREh3Bru9zVA
   faJ7Qjt80CDCbM3t8vAfdkyUkk0g47KO9Pz3SyCPbxSojvGa4zxHs6T5F
   LsDOIVKPqf2+t+CFJFB/xRB1IldhzSdZUVscLLMHrGNvpHJKSJ17blS+7
   2sr7puBcdiB4vk1SIIcEgj7BCJQ1QstH4PfvesAjZnvm4JGfUBwLXXPiq
   Lej+fWFLwHM+wb+eLTzh+ZdB8XGnH8Nt6POSxfwV1hKRURdn+Ji6HG3sW
   tMkYk0Ku0PlTvxHMjybSWjVEVGp1G3v02svWwUzmpdur9WoTiI16txZvd
   A==;
X-CSE-ConnectionGUID: hU2ru3uiT6OHBYcx8nP61A==
X-CSE-MsgGUID: Y773lSk8TryX3VNc4EYGFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="99359838"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="99359838"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 23:39:40 -0700
X-CSE-ConnectionGUID: 2NoM1QlKS9OikrGXcGzBEw==
X-CSE-MsgGUID: CbyB11fCSaKXtbFaxlIMfQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2026 23:39:39 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxIue-000000007fZ-2vLt;
	Fri, 21 Aug 2026 06:39:36 +0000
Date: Fri, 21 Aug 2026 08:38:59 +0200
From: kernel test robot <lkp@intel.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: drivers/i2c/busses/i2c-xiic.c:106 struct member
 'irq' not described in 'xiic_i2c'
Message-ID: <202608210821.usqUc0mj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Abdurrahman-Hussain/i2c-xiic-restore-non-managed-runtime-PM-to-fix-clk-WARN-flood/20260820-052507
head:   755d2734b8d3cb289f9c2952b7466419d03565b6
commit: 755d2734b8d3cb289f9c2952b7466419d03565b6 i2c: xiic: restore non-managed runtime PM to fix clk WARN flood
date:   3 hours ago
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260821/202608210821.usqUc0mj-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608210821.usqUc0mj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608210821.usqUc0mj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/i2c/busses/i2c-xiic.c:106 struct member 'irq' not described in 'xiic_i2c'
>> Warning: drivers/i2c/busses/i2c-xiic.c:106 struct member 'irq' not described in 'xiic_i2c'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
