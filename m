Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7261DE887
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 21:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769549578; cv=none; b=VCt17RiKixSccZ0wKiyFnaFvHu3il28Azr2K7tRBGkMDHPjIIc37fF1svaGZh/E88DUd5U8ILEu/BXyIlkGm99teKNxOeEdukCOWAP7n4j2LseX8A1HFHpNtTZRuIRkIQD4LG3+uQH0o2i+VBjir81r3FSlrpxx5LINA2UWKzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769549578; c=relaxed/simple;
	bh=kR46qem1rN8PQzYcuGUjPwi/ChRf8n+j9+ovHmxE2rY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V+Ag8uPJ5NJc/9pKaMhMVf7ih/F2l/8UU1hdEaJQp8O2wd2kgZX+EM9PENdLR6//E5We9UUrzFGuachSafP1Wswe1ENSdvaUyE4+ALJtzRQHxO9t5VwZO0emNCy99Dx6dlVOqIffSr8TdzZVotPDMKiF8oWE0fJoVcoIRS38CU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZ1A5cIs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZ1A5cIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769549577; x=1801085577;
  h=date:from:to:cc:subject:message-id;
  bh=kR46qem1rN8PQzYcuGUjPwi/ChRf8n+j9+ovHmxE2rY=;
  b=VZ1A5cIsHZKvWK+eF/xP8N/M/ZNxR/AIhnyIJcWmfeScTArDWSJP8jrf
   b09lN2sVNbZlcHtGwipyy0rWDLcG1dMb7Nx0XdjHMKEZLmutAx2KlMpME
   oI5S9TSXz16pLoctfO2OrpECRjzy3IBDNbYE9mddwXyTlLLObDLZKqizX
   71iJcrJ2hRAobsDEtoHY2T5BW1O1sgKbwrItUrxJkxqIEcZTV643UpBUe
   XfFOx87dusG1dKA3BjXlLykjyFyRXzSsp2G8NOyYgWA9Z3kjAhroCjwdy
   /pI0QSQGqLtMKt+BQN6NGwEEqk3Df69N7HhNtnIVUBJdR+Fn4C2V73+Mj
   w==;
X-CSE-ConnectionGUID: uZ6qbrqHRzWAXljjNG2U5Q==
X-CSE-MsgGUID: 1hY+gjV6S9+POzeXJ66iSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81863617"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81863617"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 13:32:57 -0800
X-CSE-ConnectionGUID: twi3YFVuQbeJ4E26i7JQCA==
X-CSE-MsgGUID: Uzc1v+2dQAu3zabsvB+i5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207983850"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jan 2026 13:32:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkqg8-00000000Yx6-26Cy;
	Tue, 27 Jan 2026 21:32:52 +0000
Date: Wed, 28 Jan 2026 05:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: Bahubali B Gumaji <bahubali.bg@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>,
 "Sang-Soo Lee" <constant.lee@samsung.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 2/2]
 fs/smb/server/server.c:31:23: error: storage size of 'ksmbd_counters' isn't
 known
Message-ID: <202601280500.eVB8ewNo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   71e7b7a9f9433c5c340eeb8cfaa12a72e2369f73
commit: 71e7b7a9f9433c5c340eeb8cfaa12a72e2369f73 [2/2] ksmbd: add procfs interface for runtime monitoring and statistics
config: s390-randconfig-002-20260128 (https://download.01.org/0day-ci/archive/20260128/202601280500.eVB8ewNo-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280500.eVB8ewNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280500.eVB8ewNo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/server/server.c:31:23: error: storage size of 'ksmbd_counters' isn't known
    struct ksmbd_counters ksmbd_counters;
                          ^~~~~~~~~~~~~~


vim +31 fs/smb/server/server.c

    30	
  > 31	struct ksmbd_counters ksmbd_counters;
    32	enum SERVER_CTRL_TYPE {
    33		SERVER_CTRL_TYPE_INIT,
    34		SERVER_CTRL_TYPE_RESET,
    35	};
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
