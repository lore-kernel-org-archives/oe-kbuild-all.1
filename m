Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6211CACF7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694338; cv=none; b=P+GwR0x8ectehVZT8uaLlhtyQ1/ZSopAVD2EfH0uWj/dNM22xXhWoaRHln4wMrtU2yeKt+3tIUZctPMPEP4EJFt5o6KwE6yzH8c5iSbXhMKmlRwZ+/x9Y8A+7za3CmqcEotxofB3wimWOajexAbq/nVizkpDtjbPELdmgADuINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694338; c=relaxed/simple;
	bh=dBC4y1J1HGWj8Pz8O3IbmO++4wQj5DFmZFsISyFop1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AEqN3wdIu2z74Uf9VhGYztVQXzkl0fybal8vedNNNHY6HtxZY8MmA7NwilY72H3RnsewgK1TifOpKYKHnDBgHzp/dhd1PkoZVsjzpeXMr/xZDk74N4+8cDIRtbvDRuhR1bY3aclW4QjuLn4t9qqlhAjgxIIXAjYmNk+oBRxRzrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLSQvIs5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLSQvIs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734694336; x=1766230336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dBC4y1J1HGWj8Pz8O3IbmO++4wQj5DFmZFsISyFop1A=;
  b=dLSQvIs5LRfO5Xfx7unXOjfgL8nO4pQbWXQBnqvci/NCtbM0FjNi05Q1
   jmfyOSBfkqMSUezcGcf+hLIZlstczMfO5knVZBIFKebsSIH8Yqpe9vxoY
   u5mCVGELOhRgdkVXJvDMlSBe/xzfAE8Q5N4/8F1aZMc4kt0FWeNNzj4NT
   DfTX4rw5BcHPVs34HemguGxGOKvEdntkOBAWhOX1oE/71yFkeh7Nljmhj
   dTG9Z7jGIiBbW6idvu+L6lAIb26Iu1FNFzCOrLkGupNL1gQPn6FDpXsVS
   VC/zSP4sawy1C30xbgXZKBUNz34oHRN6ueSpgFI6LUD4UhsLf0tBPzhAK
   A==;
X-CSE-ConnectionGUID: TJDxQfb8Ri+7r1ZMAzoXBw==
X-CSE-MsgGUID: 7TnyrEAhSUSJDph+QkDjDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34561287"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="34561287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 03:32:15 -0800
X-CSE-ConnectionGUID: kldoovHASOCQ4d4yvV9ppw==
X-CSE-MsgGUID: bIWeqI9cQ3eZukkzxYBZ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="103473427"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Dec 2024 03:32:13 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tObEp-00016H-1e;
	Fri, 20 Dec 2024 11:32:11 +0000
Date: Fri, 20 Dec 2024 19:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1336/1336]
 kernel/time/.tmp_posix-stubs.o: warning: objtool:
 sys_ni_posix_timers.cold()+0x0: unreachable instruction
Message-ID: <202412201921.TZ1izhG7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   02951ceaa6d546dfa0f741f52f6d47e0fb0ac7b4
commit: 56bc1719652e7a937bc9856f76f0c0fbf8ce1b23 [1336/1336] objtool: Support GCC 9 cold subfunction naming scheme
config: x86_64-buildonly-randconfig-001-20241219 (https://download.01.org/0day-ci/archive/20241220/202412201921.TZ1izhG7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201921.TZ1izhG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201921.TZ1izhG7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/posix-stubs.c:27:17: warning: no previous prototype for 'sys_ni_posix_timers' [-Wmissing-prototypes]
      27 | asmlinkage long sys_ni_posix_timers(void)
         |                 ^~~~~~~~~~~~~~~~~~~
   kernel/time/posix-stubs.c:74:5: warning: no previous prototype for 'do_clock_gettime' [-Wmissing-prototypes]
      74 | int do_clock_gettime(clockid_t which_clock, struct timespec64 *tp)
         |     ^~~~~~~~~~~~~~~~
>> kernel/time/.tmp_posix-stubs.o: warning: objtool: sys_ni_posix_timers.cold()+0x0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
