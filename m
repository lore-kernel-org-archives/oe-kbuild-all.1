Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C113B78F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726675475; cv=none; b=M3mawmncAfxcy/FSK2M7FAV63PUYrRP+cKX+M473BWDRVspJFcr6wYtWeWI60zicNSXWBfnQCPdy8yf4AUFBLrRFca7RznuJblHgDCkCEe/RXLEGO9wEitORYTrNZYjVIR32WlpH8QMgLIJtKzq1YKsFAPW9Gkk8r0MBS+4CCMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726675475; c=relaxed/simple;
	bh=6Eyc7OAHThU9yTIdJjfroQZj/S5C/hU7mZOwrhOdsM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nLcPpYOZxqalSy0KFey38YqVdUhAzOkOrLOZUc4Qq+mVl7AfSA/lsAoMKPEffA/kb38hlx6k3DaB3QfGow4bVghn6hnwSbguX6FA0YLlqiZzDxRzu1UL64LsCyKGwuqWAAxLGMo6j7acddSBEc6SBwHATcPNCzHxqneQBFbran8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9S3A4qX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9S3A4qX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726675473; x=1758211473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Eyc7OAHThU9yTIdJjfroQZj/S5C/hU7mZOwrhOdsM8=;
  b=f9S3A4qX0NgZL82YtpUAaTx7QI7oaTiorE6zFOnZSWkXwNJ29q8rdALS
   Ln3vQ4bF78RWm0YgiinhiuJH+0ACKF3Qsl0u0rx0li7M15fSLzGblX87u
   7cYCETsOr/oKD4as3LM9O6PyjRMkpeepDgAZmPST5qVxGGiQDsulntBn+
   aheX8ehhZ0U0X/K5dG/KyyOq74X4lPtvhZxVR3O0Kn2r0fdMyRnidsdNW
   2EuDS9Vk0gCpMcIShf5LyrOfearlo7N06l3j3XQDQvhvwJdD4tIyCyeiy
   8P8rzVunFHkZUU2RiqplTHaDNesQqywkBbTWzhO+n4T9cUHEURBa9gIMp
   A==;
X-CSE-ConnectionGUID: UFaYdexxS+2D+0y7+1L3SQ==
X-CSE-MsgGUID: kdHJrpm7Soa1R+qMaZBNNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="43115937"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="43115937"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 09:04:28 -0700
X-CSE-ConnectionGUID: 5SFlpBeCRdaTt2YGN+xD+w==
X-CSE-MsgGUID: 1lNPIeE6SoeD75ltW28qSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="69865224"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2024 09:04:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqxAH-000CNS-1Z;
	Wed, 18 Sep 2024 16:04:25 +0000
Date: Thu, 19 Sep 2024 00:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.11/bbr3 1/1] tcp_bbr.c:undefined reference to `__udivdi3'
Message-ID: <202409190056.ka8IivJG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.11/bbr3
head:   366d1965ffbae499c55086e05ea2b4c0b14aecea
commit: 366d1965ffbae499c55086e05ea2b4c0b14aecea [1/1] tcp/bbr3: initial import
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240919/202409190056.ka8IivJG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190056.ka8IivJG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190056.ka8IivJG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs_generic':
>> tcp_bbr.c:(.text+0x1aa): undefined reference to `__udivdi3'
   ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs':
   tcp_bbr.c:(.text+0x2b3e): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
