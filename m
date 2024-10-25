Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3411758210
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 03:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729825240; cv=none; b=Al/XV65ICa7bMNqzn9uA65KqpRL3pwrKrODG90AZggH++iZipR+GoF2EuDWjZyPvvc/ehi+T8uNDsQSHMI3EHym3TkPv/5CWe4uAXuThtWrcY2jMbXZwRXuERRZ56Unej8Agm9PyTYqJ+Fd1juKVNspXFm4bKzSFqeUh8F3ZnqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729825240; c=relaxed/simple;
	bh=VzjEHNWIwxTs1FjHCWTlYOAOnjOXiugqFmU5A8h+y0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7+XmMfrufDB/VmjzPJ/PmKnscpfgOt6skeUE54WQg7FeZXbpQ8pLVZYnk6nTijl56AEAJPoCI145SOeiPuDGdm227M+D0X2yVl9llU7m9xvmpA9lPZBxBOCkJDVF2B2ULamq5l1bY5nOw3opTJEECqCEKgGyGneVFyKrP7yL5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtnc5G/1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtnc5G/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729825238; x=1761361238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VzjEHNWIwxTs1FjHCWTlYOAOnjOXiugqFmU5A8h+y0g=;
  b=gtnc5G/1J1PWeB/g13ekLTpLYjiQ4XP/FK6QnmIQ6pj2XIVkQ8WROunr
   b3VWTP4oM7LTMZxWVxxZeBnO9S+CtwyFG8mrscfVaH6UmGDRIhwqACSx+
   OXfIAEwaSzNcnbGsMTnnT0w9sV/38tmu92+afTtH+DWpYOmWJddXeYCAb
   Tzi4ssCEAonU8MiirvNHMBXn+JguJCHp01SeAeELftRilT8E5nLLTRh1e
   Cgi7wVjuz3mtHc96tA8QQBrGqySM/X4nIsjAIIW5Ey/+BOFH2eOdtM8Hv
   yWWJzurx6XY5BVJvOOLmpuaIxiqRe/ENRREI6y7KBKz7VXILcs1D49GCD
   g==;
X-CSE-ConnectionGUID: 3DJATu4oQ0m7e5JVhKYONQ==
X-CSE-MsgGUID: 43BqLB+CTGCE/QGRv5f/MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29603413"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="29603413"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 20:00:38 -0700
X-CSE-ConnectionGUID: DeuL4gz0SRWzRJnp2g78GQ==
X-CSE-MsgGUID: GlcLfdCRSPW7ILTPZAYhpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80787920"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Oct 2024 20:00:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4AZ0-000XUs-2a;
	Fri, 25 Oct 2024 03:00:34 +0000
Date: Fri, 25 Oct 2024 10:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mic:landlock-audit 12/22] WARNING: modpost: vmlinux: section
 mismatch in reference: test_init_once+0x10c (section: .text.unlikely) ->
 set_reset_devices (section: .init.text)
Message-ID: <202410251000.FsqqTpGr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git landlock-audit
head:   b3b217bbd19f28ca1b2d9f86cd12a7e590d98a39
commit: 6d68ea6cbd868fb93342bfd6aa99ce6a5c33a817 [12/22] landlock: Add unique ID generator
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20241025/202410251000.FsqqTpGr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251000.FsqqTpGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251000.FsqqTpGr-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: test_init_once+0x10c (section: .text.unlikely) -> set_reset_devices (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: test_init_max+0xb8 (section: .text.unlikely) -> set_reset_devices (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: test_init_min+0xb8 (section: .text.unlikely) -> set_reset_devices (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
