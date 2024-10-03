Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88292139D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 04:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727930057; cv=none; b=PrPREH51JnuzUZqmDI+uVHks/8sNmsX/wvl0cfaqX4Va7WD9OlhdrA4siQBB7YElEMDQaJnkhbNfULjrbsRufQMGuZiVbnFYfhZMvJetul1KkpHaeZ5mL2bVRqtiEZjgSZjeTyP4pI7PslnYAjvtcivglwH7Wo/BK5niUIrZZy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727930057; c=relaxed/simple;
	bh=tdKHvMRasUGig/EqKqopKwRqKVXkZpnfoF7sOCU+Vb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LfDurSPmuC3Gm0PxBHoF7ocWhM99GGXH6ucFzu5+beJjbeoPf0bMf2yQPVGlD31UyE3bUtCqBC0cUG7IHn2GChgQrihXCLYGhQgvKziiQviUP1TC3ggItXvlh1s+e0yzhRr/ACD2CfbyC0O0e/IoqTupGBWjfBh6ORWfwi3WdHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSvERMkb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSvERMkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727930055; x=1759466055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tdKHvMRasUGig/EqKqopKwRqKVXkZpnfoF7sOCU+Vb0=;
  b=iSvERMkbnS8XRvFP0jo9FOJ2kDX6FWCFvmd/yF9SWsjMTHNBMjUBAUOi
   EX53MBwesGtrSRj8l6OTw/Sp14WbxmqxVQgd0QhQrH/m/kdlWX34TfT7l
   eEJuQrw2pa++yzHXMwUM1xnCKrGllJlTQFBuXHpa5PEI7mjUwObFkuRGJ
   TUq3rQozzgARRKJmvo+/gnJeIkQiPq2CwWav17KrGuhPoGaYFvXjlGqkO
   N18mP6/mxOPKMxDCUULjfMEMduir1Y2Vfsk8EWfmqomUOTuGLEPY//Wu6
   aGMlTn7X7sVp7ov/XdZRSzjBAnVx5fjTQal/knRWmuKdqE3VPe6Z9cX/F
   g==;
X-CSE-ConnectionGUID: Y+lnVql1QD+7a6fhpvcBAg==
X-CSE-MsgGUID: HI8IyiGvTqu+/J36x87Z7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26582989"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="26582989"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 21:34:14 -0700
X-CSE-ConnectionGUID: zxUiqnObReGAisJf9DBrSg==
X-CSE-MsgGUID: Vih/jH9fTuuFjjKsBBODbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="79202678"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Oct 2024 21:34:14 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swDXX-00002U-2A;
	Thu, 03 Oct 2024 04:34:11 +0000
Date: Thu, 3 Oct 2024 12:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:b-4.4-st56-rt51 173/395] lib/percpu_ida.c:31:30: warning:
 'irq_off_lock' defined but not used
Message-ID: <202410031209.3R8Veo8X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st56-rt51
head:   83b6d202216c6d5a6a328dc895dd1b7005dedd92
commit: 0efec5734a5187eb69e7d7896cd7fed4b6db55ce [173/395] percpu_ida: Use local locks
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20241003/202410031209.3R8Veo8X-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031209.3R8Veo8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031209.3R8Veo8X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/percpu_ida.c:29:0:
>> lib/percpu_ida.c:31:30: warning: 'irq_off_lock' defined but not used [-Wunused-const-variable=]
    static DEFINE_LOCAL_IRQ_LOCK(irq_off_lock);
                                 ^
   include/linux/locallock.h:242:60: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
    #define DEFINE_LOCAL_IRQ_LOCK(lvar)  __typeof__(const int) lvar
                                                               ^~~~


vim +/irq_off_lock +31 lib/percpu_ida.c

    30	
  > 31	static DEFINE_LOCAL_IRQ_LOCK(irq_off_lock);
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
