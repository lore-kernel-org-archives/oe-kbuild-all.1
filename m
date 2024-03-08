Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291BC55E65
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 19:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709927344; cv=none; b=pBTwNS1mdJmb4xM4InN/I+mTd5KDqTSajnmN9mvEKva3raKC62rJaQWoYH/7SYY456uQdV+LUZVncnrx0nFKZuhXnJIVKahLaCwOwfxsf1H6CpYjMth8FZTciN1tHFTzygU6n4WIh8OQ1cIkQ4kmI6UZmO9ukET0rKEEcdTm0ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709927344; c=relaxed/simple;
	bh=rA5cvXcOVSZYX65jcPF9HfkFI5VhT+faIgJCu9Qi11s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DSDd2GOwEMKFNpnF3WbK5otnurIEeyWc8iVsUepk3JS9LPO4u4EM9zSA3ssvc0EY3v5g2rDKOS1oarE2MouUry+GD3YBNznzpxWH/k8DR06kLGZujJs11OhEJuQlaYoDyTxVk8C9yTwBdrFkz40mFqUzb7Zh6aX9/WxK67oAOH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IV6FTivf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IV6FTivf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709927342; x=1741463342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rA5cvXcOVSZYX65jcPF9HfkFI5VhT+faIgJCu9Qi11s=;
  b=IV6FTivfg9kxCDXe/qg0h02nGVpOdC9ZwpoQFl73lX4yl6HnDmxWE5s1
   DO+qeMqaSKeNsFWVwZbR3tmFe8yEZSLnDU2d0m+KvhrINP6+i36j/g47D
   EIPyH4p6xM8PjHCRJ+wh+0lIh229gbPdQOZ3YkGPoFTjnorxr9sem6ag6
   QEwzgfdOegZkLK8fY7jE381K/gjLIGMCBMX8TwOlLso6h0ve8ssi6FFv5
   0meQ/NUYehbINQWcLaHEuThWR0aIuW5nDDg3dUBATJ7s0Zh20Z1bYZIJ6
   qeAR96dAlCNKyGPRHGLFfd+jStK9+UjofQNE4ASfe1eQFd6qh4rfL6oln
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="30104465"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="30104465"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 11:49:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="10447419"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Mar 2024 11:49:01 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rigDC-0006et-0X;
	Fri, 08 Mar 2024 19:48:58 +0000
Date: Sat, 9 Mar 2024 03:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/7] binfmt_elf.c:undefined reference
 to `__moddi3'
Message-ID: <202403090359.7mg5Tk1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e9c73e0594e0bdb3b71e4e1fbb49cf903d73c5d7
commit: 65e40fb8a142b422473deec3b66644df8bd4d876 [4/7] ANDROID: 16K: x86_64: Set ELF_EXEC_PAGESIZE to __PAGE_SIZE
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240309/202403090359.7mg5Tk1Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090359.7mg5Tk1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090359.7mg5Tk1Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/binfmt_elf.o: in function `elf_core_dump':
>> binfmt_elf.c:(.text+0x3100): undefined reference to `__moddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
