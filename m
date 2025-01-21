Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7AADDC1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 05:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737438726; cv=none; b=CrhDKz1nTDrLyH78T21hfDjlO6M432K7VadqL4uJGhrau9W6rP9XztZO6xOShyavmgW+q3ERs56c15cltBJwb6H+HdxXbcDhJAZwGLJ7OOSqoIt9aV1p3f7RouvP8aFLdWDfuGQoIU6kBKVw1shmRbzyeOiZYSbo2w9bJXyoDDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737438726; c=relaxed/simple;
	bh=aszY4RahvyJVDEf/DEITfeb61UXze9BZivZcsYyLUBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hIIKY4Z+g/O/Z02YRXHDeG1c3+1g8tTM8rIGjbTyUCyUBrG484FdTUGKSE++pHccehC7nu0yFE9mi+aOknHrF43V+cCX+gZ3ZMnaWKeYtY5Q1O1iZXVOVZAAASIZnKsu2XpokOT5N0PejI808nR+PzRtsuQhWHjTtwEK+iD+OcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xj3jtbue; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xj3jtbue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737438724; x=1768974724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aszY4RahvyJVDEf/DEITfeb61UXze9BZivZcsYyLUBo=;
  b=Xj3jtbueWnFMeUpz/eFnNfGtGmr5QqLeKKCv+LJWgFbwxCFJvP1QnBU6
   0AM+7sMdswMZgbhude51FNCqUgtpqWLhXyahclIj4sRJEiZQJl8p525Ve
   5PeW5k+VhOiPD9sw9gjg/l7y1QIrumLttHOo+m7kdgCwEJ/DxmU05E6NS
   WPFZMIa7GUzEaPO/mPkgFlcAivl9lAS0HP/wtSfmcmYFJJb/OoRCl8tyc
   ZofsORKGswSX/74i3adqXSWCK9bXJB3MK7gNiNsW4rZlIvKYEhPJwzFG2
   UpsZnehuas6Khr3gdpn5xolrRGStnGbIzmMdRh6aI/iz+8gDDjo/EnVc4
   g==;
X-CSE-ConnectionGUID: VfABHZ65TAyhQvtUIB0DDQ==
X-CSE-MsgGUID: ui9DL924QHiw9su8yl8GBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="63204514"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="63204514"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 21:52:02 -0800
X-CSE-ConnectionGUID: zT7ZwKLpQ9CcSLSh0BsDuw==
X-CSE-MsgGUID: YTU71zyESPO1qzhfvr39VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="111694701"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jan 2025 21:52:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta7B8-000Xgn-2z;
	Tue, 21 Jan 2025 05:51:58 +0000
Date: Tue, 21 Jan 2025 13:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9669/10024] security/apparmor/lib.c:33:22:
 sparse: sparse: symbol 'debug_values_table' was not declared. Should it be
 static?
Message-ID: <202501211337.WG9ibiKv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
commit: 71e6cff3e0dde6f6a3355d6c73ca3e176567995e [9669/10024] apparmor: Improve debug print infrastructure
config: sparc-randconfig-r111-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211337.WG9ibiKv-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250121/202501211337.WG9ibiKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211337.WG9ibiKv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/apparmor/lib.c:33:22: sparse: sparse: symbol 'debug_values_table' was not declared. Should it be static?

vim +/debug_values_table +33 security/apparmor/lib.c

    32	
  > 33	struct val_table_ent debug_values_table[] = {
    34		{ "N", DEBUG_NONE },
    35		{ "none", DEBUG_NONE },
    36		{ "n", DEBUG_NONE },
    37		{ "0", DEBUG_NONE },
    38		{ "all", DEBUG_ALL },
    39		{ "Y", DEBUG_ALL },
    40		{ "y", DEBUG_ALL },
    41		{ "1", DEBUG_ALL },
    42		{ "abs_root", DEBUG_LABEL_ABS_ROOT },
    43		{ "label", DEBUG_LABEL },
    44		{ "domain", DEBUG_DOMAIN },
    45		{ "policy", DEBUG_POLICY },
    46		{ "interface", DEBUG_INTERFACE },
    47		{ NULL, 0 }
    48	};
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
