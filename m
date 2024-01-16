Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279661369
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 00:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvfpDm9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705364437; x=1736900437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kRgbKzF3qZ/BMTsleQDp/3ejdcBNnEmxZp+zTK9mJEw=;
  b=FvfpDm9lrtEiVklbOYrtG8JMOx7RVNI5nwRwL8ESiAyJ3QLXREy7o6Pz
   7SChF4tkj6XqSFS7w26f0VMzwcItGKHMsntPbOCm9OuTUy5jK2r3HvFjq
   x/XGhiMx9/gjFAUPK5DrrQXha9yjonF0Fr92OgnGZcsJpXlBI4O5Eox80
   HqpKT12/+FcmvGpw+rDIeaorfbIa0uo2qJWSTs27Hr/Qg23eg9wsypTrX
   anbOBHh+Ld7YD1ieeInU0YIKNhT8F8YTPxPtlkznqGfn6GLQ7LsSvJlWN
   MQlRhFi9rqRa+3Z5LrED/8EH2ns469kNlbxfSfDUNPUHHwDZ06k/q8PNf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="6427859"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="6427859"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 16:20:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="956955709"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="956955709"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Jan 2024 16:20:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPXBw-000CpK-32;
	Tue, 16 Jan 2024 00:20:32 +0000
Date: Tue, 16 Jan 2024 08:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [toke:xdp-queueing-08 5/10] net/core/xdp.c:939:6: warning: no
 previous prototype for 'dev_check_flush'
Message-ID: <202401160811.4wA6iAbX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Toke,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git xdp-queueing-08
head:   6b7e918c9c07efda4a33ce43d8926dfa59db82a3
commit: 96cd8dc4671edf2d40a17ed13629be341995b8f5 [5/10] xdp: Move bulk queue functions and data structures out of devmap.c
config: x86_64-randconfig-003-20240116 (https://download.01.org/0day-ci/archive/20240116/202401160811.4wA6iAbX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401160811.4wA6iAbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401160811.4wA6iAbX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/xdp.c:939:6: warning: no previous prototype for 'dev_check_flush' [-Wmissing-prototypes]
     939 | bool dev_check_flush(void)
         |      ^~~~~~~~~~~~~~~


vim +/dev_check_flush +939 net/core/xdp.c

   937	
   938	#ifdef CONFIG_DEBUG_NET
 > 939	bool dev_check_flush(void)
   940	{
   941		if (list_empty(this_cpu_ptr(&dev_flush_list)))
   942			return false;
   943		__xdp_dev_flush();
   944		return true;
   945	}
   946	#endif
   947	
   948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
