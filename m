Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4B513D88B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 04:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722487587; cv=none; b=RbdZrEcLqittF+qMJR2xg23xTH2lD5d/TG/hXWRUM0DeGdZxBm8WNQz19YRJurTYCGU1oIbsTxSJzA4ZFyX7ZT5PZI3lGNfy1OWGHB2uCwidm5w8NUcAYHkGLrlOtmPo0BDt0JfhR1If32tU3SApNogKkrSr4Qs+P2l75+LOUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722487587; c=relaxed/simple;
	bh=F6cGXB+Tcpx6+PW2rVo3rUS5tCzWwyTMFO6BcdJpIjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XPJX42JwwmZiQ5LifD65vWR4dmGx4uaJ0B0FSx3F2kB6cgimDJfkrfs9/5fUvVGqm3vxdYY+EUznhmmkfhTw2qLCUb3/9kHzXdZA+Jd3sGXlHWNU3htovZNkJ17+BR1lb4Y2CpptM795fMub0gvPausu0uhQrqu2AOfZEHc2F8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GI32lwMB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GI32lwMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722487585; x=1754023585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F6cGXB+Tcpx6+PW2rVo3rUS5tCzWwyTMFO6BcdJpIjQ=;
  b=GI32lwMBzFaVwqdjLvP1ggs5MSec5++W74O3hrfoPDvXmep80EyYeODo
   G1wBeD2dZgktIEUHm5bW9m5KbrivX/sJ75NbDnnBov0PWwmuQB/QcR0PL
   aEUpk0ELA++kozoukxzWsldhK93I3y0A8dstwToDGvkIg87wiS+Dtb2BP
   CzNd4CRz7u9Mgjw0PPgjNeCZKyvrWyUPOyZd/OLSO4oXVSDYvDuWxZGsQ
   Fk9rF6QvkrdHTKFAcrS7G1B0gLsAXTr8WU/f6g77AF1XtAOfIYQDeSQLB
   h2RhsGARQIR7u8yCUzns+Wu9qZ+t9lPQDI2voHUjV3xGun+4fZc0F2AIC
   w==;
X-CSE-ConnectionGUID: gXnQzoPrTg+GFI77a8TL2g==
X-CSE-MsgGUID: ElMwxQhNRGOJ2dtPTQlZnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20100835"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="20100835"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 21:46:17 -0700
X-CSE-ConnectionGUID: Jeaxx+PeQwuu3UQplrEVeA==
X-CSE-MsgGUID: sZmzBq1URSOFAwHBwNXr4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="59555443"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jul 2024 21:46:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZNhd-000vCm-1Y;
	Thu, 01 Aug 2024 04:46:13 +0000
Date: Thu, 1 Aug 2024 12:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>
Subject: [brauner-vfs:work.procfs 2/2] include/linux/proc_fs.h:182:24:
 warning: no previous prototype for 'proc_self_symlink'
Message-ID: <202408011207.vG4GrqbA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.procfs
head:   168c8d86d8ac87a04878717d8d13d6b63339db8d
commit: 168c8d86d8ac87a04878717d8d13d6b63339db8d [2/2] [DRAFT & RFC]: proc: restrict overmounting of ephemeral entities
config: arm-randconfig-002-20240801 (https://download.01.org/0day-ci/archive/20240801/202408011207.vG4GrqbA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011207.vG4GrqbA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011207.vG4GrqbA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/parport.h:11,
                    from drivers/pps/clients/pps_parport.c:22:
>> include/linux/proc_fs.h:182:24: warning: no previous prototype for 'proc_self_symlink' [-Wmissing-prototypes]
     182 | struct proc_dir_entry *proc_self_symlink(const char *name,
         |                        ^~~~~~~~~~~~~~~~~


vim +/proc_self_symlink +182 include/linux/proc_fs.h

   179	
   180	static inline struct proc_dir_entry *proc_symlink(const char *name,
   181			struct proc_dir_entry *parent,const char *dest) { return NULL;}
 > 182	struct proc_dir_entry *proc_self_symlink(const char *name,
   183						 struct proc_dir_entry *parent,
   184						 const char *dest) { return NULL;}
   185	static inline struct proc_dir_entry *proc_mkdir(const char *name,
   186		struct proc_dir_entry *parent) {return NULL;}
   187	static inline struct proc_dir_entry *proc_create_mount_point(const char *name) { return NULL; }
   188	static inline struct proc_dir_entry *_proc_mkdir(const char *name, umode_t mode,
   189							 struct proc_dir_entry *parent,
   190							 void *data, bool force_lookup,
   191							 u8 flags)
   192	{
   193		return NULL;
   194	}
   195	static inline struct proc_dir_entry *proc_mkdir_data(const char *name,
   196		umode_t mode, struct proc_dir_entry *parent, void *data) { return NULL; }
   197	static inline struct proc_dir_entry *proc_mkdir_mode(const char *name,
   198		umode_t mode, struct proc_dir_entry *parent) { return NULL; }
   199	#define proc_create_seq_private(name, mode, parent, ops, size, data) ({NULL;})
   200	#define proc_create_seq_data(name, mode, parent, ops, data) ({NULL;})
   201	#define proc_create_seq(name, mode, parent, ops) ({NULL;})
   202	#define proc_create_single(name, mode, parent, show) ({NULL;})
   203	#define proc_create_single_data(name, mode, parent, show, data) ({NULL;})
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
