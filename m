Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C701C2E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758665979; cv=none; b=PgZZYBISdqHmikEfRX+dmwT+ORHG/7mVEltDs8IMxulYYFb2b4c6X0Epy/FGTxv61AqgMZ+hO1NOhuONUScvsV9/rP/IHOYHe/oT6/1iuFVJDcc6bxk3ezibx2g+2kucsucm+/lClph1PFp7QXSrWeFJjhH2M0mzurqlUuOb9gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758665979; c=relaxed/simple;
	bh=mmUIukSUcr3xeqe4EmiUtKtTPWtM9WYm/hSj+wS7FAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tJwGBZrhiBxJ1CaONBEwZ1nurScBci00ao/bmHUWumkW/IFqXp6Qy+rne6FcM0rsaNFszcMJoCyneXg46Fac/BD2HT235418cpsXaIhRDwRplFZp8RMclbvFT3QL6GrEe6Pq+bjkDlp2uVI5VPyLpMCuDJwsFrzM6G99lRa+CnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1lUsMNb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1lUsMNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758665978; x=1790201978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mmUIukSUcr3xeqe4EmiUtKtTPWtM9WYm/hSj+wS7FAc=;
  b=B1lUsMNbUEP4oUXmHvigE6ROZR5bRPLV1cBCSi1K1ca4nrL+K8VV/HOA
   Ep711X/D8SuTepqG8EcNEB5WcY/FLZ3rBD8wpUK8MLAE/Xvwiygsg+oFb
   33vSqmuxmjTTGSmQESGSuWqwgJyHqtLpGNYMp2AMHd88XnGHd8DgR/t9Z
   fiSqn5RebWGyhG9G4xpv8NXRo7Bgwn7R2bRnNWzycL/MMCK3kDCF28Zlt
   Y9aESlEmgiefMAePNRzP8FdqC2pEqOHR/+yAXlZmK/Ne3PD8r30EtfCJ0
   eDIHSkzzA4NFb7H7O+QQi9z8m7MUFX5L3C614yFd2Y/ScbUATHKbJClwX
   A==;
X-CSE-ConnectionGUID: QIZ9ioR2RKuAa6YznxDwtA==
X-CSE-MsgGUID: zvJA3jZzSdqVGDGY4QgtIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72062895"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="72062895"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 15:19:37 -0700
X-CSE-ConnectionGUID: rLUNKEsURciiKcpyJ0rxVg==
X-CSE-MsgGUID: UqBoyKYLSfeFiFIIDkdbMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176477170"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 Sep 2025 15:19:36 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1BMD-0003az-24;
	Tue, 23 Sep 2025 22:19:33 +0000
Date: Wed, 24 Sep 2025 06:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [btrfs:pr/1157 106/114] include/linux/kern_levels.h:5:25: warning:
 format '%zu' expects argument of type 'size_t', but argument 4 has type
 'long unsigned int'
Message-ID: <202509240615.SCHt0FHO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/btrfs/linux.git pr/1157
head:   09abde49979e33ec033ee6dc09185f2afa899d39
commit: 98077f7f2180fa996710452564ebe71adc66af59 [106/114] btrfs: enable experimental bs > ps support
config: i386-buildonly-randconfig-004-20250924 (https://download.01.org/0day-ci/archive/20250924/202509240615.SCHt0FHO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240615.SCHt0FHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240615.SCHt0FHO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/btrfs/compression.h:17,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.c:22:
   fs/btrfs/disk-io.c: In function 'open_ctree':
>> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   fs/btrfs/messages.h:27:32: note: in definition of macro 'btrfs_printk'
      27 |         _btrfs_printk(fs_info, fmt, ##args)
         |                                ^~~
   fs/btrfs/messages.h:47:9: note: in expansion of macro 'btrfs_printk_in_rcu'
      47 |         btrfs_printk_in_rcu(fs_info, KERN_WARNING fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   fs/btrfs/messages.h:47:38: note: in expansion of macro 'KERN_WARNING'
      47 |         btrfs_printk_in_rcu(fs_info, KERN_WARNING fmt, ##args)
         |                                      ^~~~~~~~~~~~
   fs/btrfs/disk-io.c:3398:17: note: in expansion of macro 'btrfs_warn'
    3398 |                 btrfs_warn(fs_info,
         |                 ^~~~~~~~~~
--
   In file included from compression.h:17,
                    from extent_io.h:15,
                    from locking.h:13,
                    from ctree.h:19,
                    from disk-io.c:22:
   disk-io.c: In function 'open_ctree':
>> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   messages.h:27:32: note: in definition of macro 'btrfs_printk'
      27 |         _btrfs_printk(fs_info, fmt, ##args)
         |                                ^~~
   messages.h:47:9: note: in expansion of macro 'btrfs_printk_in_rcu'
      47 |         btrfs_printk_in_rcu(fs_info, KERN_WARNING fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   messages.h:47:38: note: in expansion of macro 'KERN_WARNING'
      47 |         btrfs_printk_in_rcu(fs_info, KERN_WARNING fmt, ##args)
         |                                      ^~~~~~~~~~~~
   disk-io.c:3398:17: note: in expansion of macro 'btrfs_warn'
    3398 |                 btrfs_warn(fs_info,
         |                 ^~~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
