Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D0CA943
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 06:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722666696; cv=none; b=lJipAN222hCsKNcgxo1dtI1SWJ7hp8KNszMe9D6NQQ+UHiXiJZnOpYYT7tpzdOhppDXDhPzqddREdfRM25Ae+rmBz9hIiqnboVzmrwJxfTk2vmzJ6diN9nOruXOiVFot4IqPJYF4w19UFa/XLnfsPNYp3CAyOFqH2DJCLUh4VBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722666696; c=relaxed/simple;
	bh=TeSjJ74SZYyOL3VCzzR9XWsb0TWkPMYeD/ElIWlZ12M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUIfy9suZT6VTPflueVMsh1TMLKhf2ccVVtIGVkbNrVFRyR5KkKs7wASk5wWEaYPu80h+t99yKaT0xEBpx3M065YzKhKNxWWWSPeXGUiiu5N4T4yGQzR2ht5O26ZcHTnKHyNlacGag5bXoq28tdTV8KZxDG7FJLmHAUVrl4leb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvC0xfPf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvC0xfPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722666695; x=1754202695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TeSjJ74SZYyOL3VCzzR9XWsb0TWkPMYeD/ElIWlZ12M=;
  b=XvC0xfPfxIBF7SgQZdCb0xUwyeExUy+gotdiRel7WdjgsxFs7+57Sv0m
   n2EY67rMRV4wm0Xj1/P5Zs/G4ucjecYcmAAV6qcJxL6Zi7LZHXOyRJR4X
   9Q74X042c2P0CjSt6FACliEtkZKLB48HZHuKMBeIClLmKtsDJ9t2k+I/Z
   zZTnKv/q88Ri2VZJ6NhvnKmwP3cZVrlK9Orc38wngLIlapneqRByyVjbK
   cJfge1qnYplLXBYQ9JaFKoJiNlMsx0k/TK9yetv0rHx/Vjvf1/eBdOmir
   WZOE5SUf1AZoesjWpezNZodkDBfWCDtu23JSncg3vVa1sk8HgTN/86wRK
   Q==;
X-CSE-ConnectionGUID: L+ZQvQDTRD6pF/7tCJer0Q==
X-CSE-MsgGUID: YRA6R585R+GWxkZuuGQJGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31342442"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="31342442"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 23:31:30 -0700
X-CSE-ConnectionGUID: OvUNCpMZT+OYeM1C6UYwTA==
X-CSE-MsgGUID: PjRINyg2QiWyfkTFNgHoBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60651982"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Aug 2024 23:31:29 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa8IY-0000BT-2p;
	Sat, 03 Aug 2024 06:31:26 +0000
Date: Sat, 3 Aug 2024 14:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot+extras/v6.11-rc1 151/152]
 include/linux/arm_mpam.h:11:10: fatal error: asm/mpam.h: No such file or
 directory
Message-ID: <202408031442.Jyi5TZt3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.11-rc1
head:   31781dfaf7c1998c9a37ccb074dea9638612653c
commit: 8b1745a307374e2ce65e37e124232410b0183ac3 [151/152] fs/resctrl: Add cranky debug for reading CPU msr values
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240803/202408031442.Jyi5TZt3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031442.Jyi5TZt3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031442.Jyi5TZt3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:6:
>> include/linux/arm_mpam.h:11:10: fatal error: asm/mpam.h: No such file or directory
      11 | #include <asm/mpam.h>
         |          ^~~~~~~~~~~~
   compilation terminated.


vim +11 include/linux/arm_mpam.h

    10	
  > 11	#include <asm/mpam.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
