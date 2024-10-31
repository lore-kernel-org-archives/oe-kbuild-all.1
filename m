Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0189014F9F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 08:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730362205; cv=none; b=nZOnO5DwpxS5EA6oEe6cKkU3RODAIIxbr1XWjlmlXHUmBhj+fbgl2tTtjfuaWX2kCkO8v52S51+2NIvFYLJQ5pVKJ9lDBXVYdDJbuRpJIIQmS7jEwirSVJGgjsR+dfa0FTqq6Sy1gxIHa4IKNvxlu0eQIWLTwegMppZgqoCA/tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730362205; c=relaxed/simple;
	bh=lWMkrnTomc2jkBlSDhTXR/SmdDKZrr8T4OlRowMc5zA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTmDTdpwW4Uk21M2uhXOi6+rRbqPCApd/LRh7svQ7SeTok1eHigAnCGnWvrLG5663PS91KNPUkOw4ivY+zgjSwYysVnGmyzQf/flnW1phlGeiCE5La1jh1DCvvuzQdODe5jADszEquXa7NGgfo96g6MQqjdsvcu3oMQSlGFpmmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMyptBCF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMyptBCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730362203; x=1761898203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lWMkrnTomc2jkBlSDhTXR/SmdDKZrr8T4OlRowMc5zA=;
  b=VMyptBCFPyDfpfT9Bs00i2ZCNsb/frT5xOfWaTMMWc8QYRWl+aOw/mLw
   CMn9t88zyLyHFFpq4YM6En4cDL1V7Rho9k7+4g2VrynhuAA2DsFtfLZLY
   c3c+HXnI7g3QAF/g523r1HpXu4J2/ZCV+yBkkJGz7nPpASl2dsbUMw04c
   BtZDxCyounvuImKBSNbmjh2e81Bw4h4KMlS3R8+TTF4uRKlnISOzUW9KI
   iS7njcAYSxO6POjXGPNlD/JhgeiEQQe2+hElVstmphn/5Bp+2UB63G0ah
   YglYHHBpntTA0S8ooRoO94mruEci7B48nH14e2Ubq8HbkYaY6xLrEOBD/
   Q==;
X-CSE-ConnectionGUID: LNUVyHkZQEamW0g7kj1h4Q==
X-CSE-MsgGUID: GT2jvyWUQm2STf0nAVDqXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29526515"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="29526515"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 01:10:02 -0700
X-CSE-ConnectionGUID: RfucPYcOSx+jXkK+iu5a/w==
X-CSE-MsgGUID: FQ3pXmzgS2qO8rXWo1yWIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87107098"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2024 01:10:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6QFj-000fq8-0t;
	Thu, 31 Oct 2024 08:09:59 +0000
Date: Thu, 31 Oct 2024 16:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7587/7771] lib/x86_64/vmx.c:203:40: error:
 'VMX_BASIC_MEM_TYPE_WB' undeclared
Message-ID: <202410311616.VCFAELFs-lkp@intel.com>
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
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311616.VCFAELFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311616.VCFAELFs-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/x86_64/vmx.c: In function 'init_vmcs_control_fields':
>> lib/x86_64/vmx.c:203:40: error: 'VMX_BASIC_MEM_TYPE_WB' undeclared (first use in this function)
     203 |                         .memory_type = VMX_BASIC_MEM_TYPE_WB,
         |                                        ^~~~~~~~~~~~~~~~~~~~~
   lib/x86_64/vmx.c:203:40: note: each undeclared identifier is reported only once for each function it appears in
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
