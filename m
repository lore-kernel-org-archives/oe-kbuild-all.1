Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730CC191
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 21:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730581677; cv=none; b=V+8rMJop8r0N0k2MVKoRBj3au9QCD8KBiqde8dGwpG61YyoaovIcczuDlS5CllMbR9TP7wlh+R6qCwRoaZyyDRXLWvJn7/4xpLM+roZFxfJGn0nMjNaAmZLvLfyNHYEUnH90vzvAvgptQDLMH1zwb3Yc8fTPOkgX5V4/r+cJSwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730581677; c=relaxed/simple;
	bh=K2CJ+yKv3spYlKukZYTAmluRFK9UhcJ+G2VH6+o8cBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BwjIkAj4wzZLJ1TTkHv0CYxC/RmHuERBPh7f5Axudwi6qAS1Rtu9nxqCTMx9zkNicEumt0lzy/Vb7HUFoZNyoVs8dhKkkE33YypHWS0uV4+2X+UcrdbGP+0MBVpn5U0W4sKvDLNyb4L181KDwe2VCpvvlzbU29AytRvHL7MqklA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHVZhk+u; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHVZhk+u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730581676; x=1762117676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K2CJ+yKv3spYlKukZYTAmluRFK9UhcJ+G2VH6+o8cBA=;
  b=YHVZhk+uoB8hqEClOTjr3xWv8zGuYMkgwLCUCprpVTQCUHjzLt8H6XgD
   wxNTZiddq5SksQrQkord2i4hkd1XHh79APDs0fphX1+YZoQ1kgyJiN7GA
   QmvRssp3ofdovdE8yuySdcRKnS0UL60nCrj/d+Bevy+Xazwgkw8Vv90n0
   QxDAcFQfO7+JQl0PO9A9ShbDRoo5aMljpNtqRAz+ycA8nOjcGqEW8i/dw
   SUFeNuisoi2fopMUpdNLvUS5sMLnf2Xq5UrJlJ3s0c1/QWgTJsOg27FIo
   bB/Ob4hSI9ASzRdH1O+uFBFasQb12aStMp8tX6qOLPgZqwJMqU4N1Pm37
   Q==;
X-CSE-ConnectionGUID: Q1XYyTx5QWOy+z3v9ZYzzQ==
X-CSE-MsgGUID: FDpV+Y5dTOmLRrZPdv5PAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30164804"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30164804"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 14:07:55 -0700
X-CSE-ConnectionGUID: 9cxmuGqLQJuFRj5eDfL5Ag==
X-CSE-MsgGUID: VhA2eqL/TtCeqMJ1RMThiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88033150"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Nov 2024 14:07:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7LLb-000jLf-29;
	Sat, 02 Nov 2024 21:07:51 +0000
Date: Sun, 3 Nov 2024 05:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8617/8858] lib/x86_64/vmx.c:203:40: error:
 'VMX_BASIC_MEM_TYPE_WB' undeclared
Message-ID: <202411030518.5SWuvXwz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c88416ba074a8913cf6d61b789dd834bbca6681c
commit: 44796a9f155c630a5fd5ccea3891011c4dc6a3e4 [8617/8858] Merge branch 'mm-hotfixes-unstable' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030518.5SWuvXwz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030518.5SWuvXwz-lkp@intel.com/

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
