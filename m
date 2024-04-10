Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB90D46B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 23:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712791076; cv=none; b=gBErbqvOlUaOnI1feHcUQWlTpUsB0k8G4bnQJEfPf7Z2DTHTXnQh0rXajSjhbXNQ3g/pcdnwbzEw4MQCLhznVKzidGH7SZjhGPlk3e7kBm9bSkj3cUuBY26L8z2Y/RZsW8LUNv3XIeLg/Q+STbS2K/0+oLOwjtETKcP0KfX/99k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712791076; c=relaxed/simple;
	bh=DvnQB50VMYEOSc5xeRLSLI/7y6ZInJnPeVzqRQN/OMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YduF0gfTCQXs8vzzwKcz3NG44WFDiYhk7E7moWkViHgZmzy30KzPFZKWzjeUQrdsSp3u4POZRO2z0vaPG4cwdSR0wuWvHTk4MLUSIcUceHpYGUqtPDryNKVjCVHeW7uMWSkp+xWV7gjrAYVspFXd61xlkP1VsD4q91+N3e2IRbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBftLEUu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBftLEUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712791075; x=1744327075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DvnQB50VMYEOSc5xeRLSLI/7y6ZInJnPeVzqRQN/OMo=;
  b=dBftLEUuymmn2Sb33WXEKGEjQVkfczmjDA0T/afnl8GLooMIc/lE/4Rs
   0iN+zMGrq7Nw0UEn0pV030HqJqWeHPWq3wLHo5UuBCB+tTzx+1Kq/hZSx
   h4gA1HEdXxFQTqPG9VfniT4ukei5rnnA8UEV+ConYb49ThS2JREdowBmb
   ZnPUEf338+TFOg9h2cbZh5lf9ZFqGrz+Y8Ug7hjjpLzFCnFz/+C+89DHM
   PNntNUbu+dwt3uckDlpJ+ql+9tKxrc0vHtoc+mbVL4VCZs1oUyk5kb4ki
   UMu60eXJGaECY5OI54kKhu+I/Mn8rtWz3MhuprGIH4z6lQ45Gf8/4vPHs
   Q==;
X-CSE-ConnectionGUID: xZnO00jeQiiILwT5EEIcoA==
X-CSE-MsgGUID: OMIly7yqQZS6Yxwik8zw2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11963533"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="11963533"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 16:17:54 -0700
X-CSE-ConnectionGUID: r8/6bY7ITFSFZPXCEyaJog==
X-CSE-MsgGUID: ICVb/DTiTw2NB+zxcYWHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="25494586"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Apr 2024 16:17:53 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruhCQ-0007we-2r;
	Wed, 10 Apr 2024 23:17:50 +0000
Date: Thu, 11 Apr 2024 07:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/memmap-top 2/2] ram.c:undefined reference to
 `memmap_named'
Message-ID: <202404110740.bA9sM2ZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/memmap-top
head:   3476bbecf61c5a2024f19357a5679e084557244b
commit: 3476bbecf61c5a2024f19357a5679e084557244b [2/2] pstore/ramoops: Add ramoops.mem_name= command line option
config: arm-randconfig-004-20240411 (https://download.01.org/0day-ci/archive/20240411/202404110740.bA9sM2ZF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110740.bA9sM2ZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110740.bA9sM2ZF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/pstore/ram.o: in function `ramoops_register_dummy':
>> ram.c:(.init.text+0x40): undefined reference to `memmap_named'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
