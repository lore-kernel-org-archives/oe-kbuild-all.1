Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0C918A93F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 00:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771546855; cv=none; b=I0/xTb3V0lFH7uv/4F7KV2PF3wM6AdlCbdi8sG0P01sxHghT4FC31Tr0Z9ft4axZIODyngw8C+b2v9bjh0hVtjh2svzFmROO1OOGJu+29+9tLhlK8iiamlsn0oqIUM1/szz1Gd/pQcRmbA4b5Dg+mQIpvUTXJVHVIGFGFlNSbws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771546855; c=relaxed/simple;
	bh=tgh+naibtHq7lprpiZUOCY6EWqb4svB0KN8ATEhvRpI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i0BnZfIiEe+QMVkxsuSEa5roBSkrqtFvxwRPZMiCXFmNnOBnpEm1S45ZeEuK/V0MOXnB+HE8Twc27AEYoNozYV/ovg4ZEMiG/bmXyfhR6tPwq+sXNds8oGMSzbzE+qQlE7CJBLSbBit0SHlEE3YvbJKeQ0uztrrrEiNaS9uy6t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvohvAoz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvohvAoz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771546855; x=1803082855;
  h=date:from:to:cc:subject:message-id;
  bh=tgh+naibtHq7lprpiZUOCY6EWqb4svB0KN8ATEhvRpI=;
  b=gvohvAoz0AojzH1nbRq9uRC9xjyvl0snyn1Vo5+E9AQytVbgoIAE76eP
   kpoZ2ErP2X78g1a/+ekkz0qgY+oWTybNoyJ4w8h0V5jLyXLpCBDw9o2zc
   kPdJfRcmoqfj1XDNeqiC0xXn/TrMbua3liECgAxJtjp+Is+KXCeVsF0uG
   AaMJfNT4SDccKSiujRdmZhSFSlKLf+S2i3VSPw8uzRU10W5TyDZvckymx
   q7zCCRcvmMazOhGqx70psw6sO/jSK3xcDV6cjY7nUHoR1TtKLvL3AueqG
   QQW8xQtRQ1k03pEmiSWtvYhRaidlKcZjaJU/SslmFOBTCycmuvY4fxJ5m
   w==;
X-CSE-ConnectionGUID: qCMbxyStS6SF62V1RGNggA==
X-CSE-MsgGUID: AhMPZ4hRSDWZh99WPgiikQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72546634"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72546634"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 16:20:54 -0800
X-CSE-ConnectionGUID: h/VDISKXQaiT5rKHmiwqHQ==
X-CSE-MsgGUID: oCjK1avwRLGFQh6Cx9lpow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="213927313"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Feb 2026 16:20:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtEGI-000000013ei-1Lpf;
	Fri, 20 Feb 2026 00:20:50 +0000
Date: Fri, 20 Feb 2026 08:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 7/18] <stdin>:1627:2: warning: syscall
 rootns_create not implemented
Message-ID: <202602200834.wT98Mt6u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   bbfe3fc31c861befc0d2aa15a02e672b2e248cd6
commit: 0944dc7efffffb5c4acb8ab671e5a42109ea5c2b [7/18] rootns: Implement rootns_create()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602200834.wT98Mt6u-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200834.wT98Mt6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200834.wT98Mt6u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1627:2: warning: syscall rootns_create not implemented [-W#warnings]
    1627 | #warning syscall rootns_create not implemented
         |  ^
   1 warning generated.
--
>> <stdin>:1627:2: warning: syscall rootns_create not implemented [-W#warnings]
    1627 | #warning syscall rootns_create not implemented
         |  ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
