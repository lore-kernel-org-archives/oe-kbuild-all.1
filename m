Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399E043ACB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 04:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728967472; cv=none; b=XjAMxE8/kVE3gJrmtPiRV5EtdrXUHMKWTItUoxF692iyNjOkamMyhkVuBP1vmFHarJg9IpanBkvx4bdhe60UA9/mbbcaMMr7gVZCUOMPnPW4k6FN2MgRqIbQ7xylx0A0liU7F4qD+WyPR6ajvKS4wTDtaa1fU+LfFKWtHfrbULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728967472; c=relaxed/simple;
	bh=Qnx4bGm6+CFLawiAZSyOUAVq1h+yXwRmkuE7eM4FUXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cljluzch/8ARPvDaoLtY/baG78ZEWQ4pgrrnfOKDPfHJRrePyj7rKndiNl2mksBbPm+yZDejZsEgot3Ts4t/9Xx7JGnnIa7BuEhOL3GK+z5/7MqkUKDCS3tIJVJ+u4RdAmGFi04N1iQdlD3MiS2sAXDxQkkdFGdpuLH3kt6aWxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRLpYh5t; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRLpYh5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728967470; x=1760503470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qnx4bGm6+CFLawiAZSyOUAVq1h+yXwRmkuE7eM4FUXA=;
  b=IRLpYh5tAyUPAklHG09aUHftg8iVPtUPi/ksYUeHtw5QHyYjYen9jaqe
   ybtGv6Ei2TBF3KTgFJRo3XaXlHR2ynZ7AMlVNXnM1jnu5oseNgvXy0dKR
   Rwwiso8EvVqRinQA/jYRjk00WoSXp/Kbj3vWO2i4w3gzO4JFj+p69rJZr
   XRMRm2gPVMOggbxFRKLHA9XaIjaFFfNQBrEJ0i8K2/VwytRfcbYSEjYES
   PPd4iFsGMZg2rCUZQGJ4tPFgnYQ8dXlTkxGhXm5HfxCFHmWYRfupg4cz2
   EoMFniybEvtV0AB13Yu+cr+U4T7OM67/AsyUfLXqPBZPMRSJuJSB9Ovcr
   w==;
X-CSE-ConnectionGUID: vlZa+KwgRD+WRo7Q3FGwAw==
X-CSE-MsgGUID: eIQz2l+ZSgi/Z2MLBpP5yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28294452"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28294452"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 21:44:30 -0700
X-CSE-ConnectionGUID: AgzzTqQ6Qh6LisnyOB+PJw==
X-CSE-MsgGUID: 49b8BDfVRCinDPAyzovs0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77947104"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Oct 2024 21:44:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0ZQ1-000Hcv-2U;
	Tue, 15 Oct 2024 04:44:25 +0000
Date: Tue, 15 Oct 2024 12:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	"Darrick J. Wong" <djwong@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [linux-next:master 3233/4178] fs/inode.c:148:37: error: implicit
 declaration of function 'timekeeping_get_mg_floor_swaps'
Message-ID: <202410151246.rfsfj0l3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7f773fd61baa9b136faa5c4e6555aa64c758d07c
commit: 73a47cf40f84312cb6ea2b3583825d671930b24f [3233/4178] fs: add percpu counters for significant multigrain timestamp events
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241015/202410151246.rfsfj0l3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151246.rfsfj0l3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151246.rfsfj0l3-lkp@intel.com/

Note: the linux-next/master HEAD 7f773fd61baa9b136faa5c4e6555aa64c758d07c builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   fs/inode.c: In function 'mgts_show':
>> fs/inode.c:148:37: error: implicit declaration of function 'timekeeping_get_mg_floor_swaps' [-Werror=implicit-function-declaration]
     148 |         unsigned long floor_swaps = timekeeping_get_mg_floor_swaps();
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c: In function 'current_time':
   fs/inode.c:2262:9: error: implicit declaration of function 'ktime_get_coarse_real_ts64_mg'; did you mean 'ktime_get_coarse_real_ts64'? [-Werror=implicit-function-declaration]
    2262 |         ktime_get_coarse_real_ts64_mg(&now);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         ktime_get_coarse_real_ts64
   fs/inode.c: In function 'inode_set_ctime_current':
   fs/inode.c:2756:25: error: implicit declaration of function 'ktime_get_real_ts64_mg'; did you mean 'ktime_get_real_ts64'? [-Werror=implicit-function-declaration]
    2756 |                         ktime_get_real_ts64_mg(&now);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         ktime_get_real_ts64
   cc1: some warnings being treated as errors


vim +/timekeeping_get_mg_floor_swaps +148 fs/inode.c

   142	
   143	static int mgts_show(struct seq_file *s, void *p)
   144	{
   145		unsigned long ctime_updates = get_mg_ctime_updates();
   146		unsigned long ctime_swaps = get_mg_ctime_swaps();
   147		unsigned long fine_stamps = get_mg_fine_stamps();
 > 148		unsigned long floor_swaps = timekeeping_get_mg_floor_swaps();
   149	
   150		seq_printf(s, "%lu %lu %lu %lu\n",
   151			   ctime_updates, ctime_swaps, fine_stamps, floor_swaps);
   152		return 0;
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
