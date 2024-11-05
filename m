Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF2C1AB505
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 05:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730782870; cv=none; b=Yy49gTE7dn87/EW5sxliNwTuy1rIAMS3obz4Gl8DUCJNXmcFrbJ9+3KbJHNBYFYOMKXw7A5HLJY2spR1/tB7al/pTi0vs0Jpi0zTVIBPkrJWvN54kKtOwqBXDNRNWI/nedmM2IrTskG2z+uVK0wcOkJ6aTFg1YZ0s1Dr7zBxEYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730782870; c=relaxed/simple;
	bh=5RLxnLM/8Sh+hGkC4wL1p+jXx5SsxxmvXF7Nrdgcesw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ofSjcK1W/wLESI9wK8WFkU9f4jqS/Zl3GY7eNki5Xk++DPUwOYmUrHlGsTjIW1bwBYGfVwJAOdUaodYJKxU+gKJXxs4Gmkg4QGTOGc8M0BjcFvH3SqUZdvfWKP+OmGIxiD3w1JZdvUKwc7ZexLAslIPz2nh/CJLvB77R9puLB0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKuhyaQU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKuhyaQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730782869; x=1762318869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5RLxnLM/8Sh+hGkC4wL1p+jXx5SsxxmvXF7Nrdgcesw=;
  b=FKuhyaQUMkJWFWLsjDhndiMvjhYYtiTmPpIIHFbvtOvjFYGM7HCn/GyZ
   er8TkA/0araVqnnvMsYK+nCv1ZtryMsODuL7xbfFLQ8U7HAuqzLbmCcqY
   tDBNOxhm9j5mVLUzleUn0BF/gceAMZB3EcRnVBHvpOV5X3zMD1GZvOoOE
   0uBcqwPCKRj1yli6d1degyNzrz2ugDnpodrMpikpZCS8MXyS5OefrH2js
   sUjh94aBliPvsHWwplbaYKlrxpHl4WpMrvmRpW01WCcRu+D2iRZ3Xs0gl
   PmWleP1lx8UkR0jOmuWPFqoA8JkRauhkXnk1G+kQc/TopZAS3vH9F/6pJ
   A==;
X-CSE-ConnectionGUID: 2ogrrXZ9RhGH26IuGB4zpA==
X-CSE-MsgGUID: r10eGvMRRcK3MtdUbMX8bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53075619"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53075619"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 21:01:08 -0800
X-CSE-ConnectionGUID: NxlqCrCWTIWWMoGDlUGqvA==
X-CSE-MsgGUID: bMj7moMuTZ2plWqGAEjnwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="114670662"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Nov 2024 21:01:06 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Bge-000ldz-23;
	Tue, 05 Nov 2024 05:01:04 +0000
Date: Tue, 5 Nov 2024 13:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Richard Weinberger <richard@nod.at>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1257/1257] fs/ubifs/.tmp_master.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202411051232.roOpwrLm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d426553bb97ebfcb4ea34e8fd63477a44316644
commit: 2e52eb74463f15c745d64948cedfaee722d6268c [1257/1257] ubifs: Rework ubifs_assert()
config: x86_64-buildonly-randconfig-002-20241102 (https://download.01.org/0day-ci/archive/20241105/202411051232.roOpwrLm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051232.roOpwrLm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051232.roOpwrLm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ubifs/.tmp_master.o: warning: objtool: missing symbol for section .text
--
>> fs/ubifs/.tmp_lpt_commit.o: warning: objtool: missing symbol for section .text.unlikely
--
>> fs/ubifs/.tmp_budget.o: warning: objtool: missing symbol for section .text
--
>> fs/ubifs/.tmp_recovery.o: warning: objtool: missing symbol for section .text
--
>> fs/ubifs/.tmp_log.o: warning: objtool: missing symbol for section .text
--
>> fs/ubifs/.tmp_commit.o: warning: objtool: missing symbol for section .text
--
>> fs/ubifs/.tmp_scan.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
