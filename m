Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753AC1D695
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 21:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtdEG/5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699047287; x=1730583287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JvASnZRDFEVRPIVwtu0XCpe4FKtFAty0Kc/AJ4tHhew=;
  b=EtdEG/5fNUMqquvGF/hBKvS1NpgKUpN6zbLIp9PXI+gwXQUBuynu8o6w
   IzsXuVewjrifiP07RO1tMS9AC1cDApF220w2SEtiNFww50ofK9dVldoc1
   bpmi8ZlfAZXguAqQ5lo8oJe/iUCz60tsxwd1OApY4WkQx/mpCcMivQlLe
   i57yfQTeg9Fv5z7nsW1LzJzCGtIfnaEY2G0Y9YeO7OmKTdHB+lA/VnpZ7
   LYC9AXNeg8g42HpgCb6dRwGNx7y+ysoaPjME13sa+7KiXm52DlGrxPhIU
   94p6zuKhwREI8XePsQ42fdeVyabSzWBbuH00WdXy3mVyEc/zLm6FkgkRU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388851767"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="388851767"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 14:34:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="9863017"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2023 14:34:45 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz1oQ-0002xs-2X;
	Fri, 03 Nov 2023 21:34:42 +0000
Date: Sat, 4 Nov 2023 05:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-multi-device-freeze 17/18] fs/super.c:1972:13:
 warning: unused variable 'count'
Message-ID: <202311040548.A4a6EDve-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-multi-device-freeze
head:   36b37b3767a85a911e35a8b24e76b241b0d56230
commit: 76ae79f39c04866d51fda0f7c8694aea522497a0 [17/18] fs: handle freezing from multiple devices
config: arc-randconfig-001-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040548.A4a6EDve-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040548.A4a6EDve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040548.A4a6EDve-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/super.c: In function 'freeze_super':
>> fs/super.c:1972:13: warning: unused variable 'count' [-Wunused-variable]
    1972 |         int count, ret;
         |             ^~~~~
   fs/super.c: In function 'thaw_super_locked':
>> fs/super.c:2098:14: warning: unused variable 'bdev_initiated' [-Wunused-variable]
    2098 |         bool bdev_initiated = (who & FREEZE_HOLDER_BDEV);
         |              ^~~~~~~~~~~~~~


vim +/count +1972 fs/super.c

  1917	
  1918	/**
  1919	 * freeze_super - lock the filesystem and force it into a consistent state
  1920	 * @sb: the super to lock
  1921	 * @who: context that wants to freeze
  1922	 *
  1923	 * Syncs the super to make sure the filesystem is consistent and calls the fs's
  1924	 * freeze_fs.  Subsequent calls to this without first thawing the fs may return
  1925	 * -EBUSY.
  1926	 *
  1927	 * @who should be:
  1928	 * * %FREEZE_HOLDER_USERSPACE if userspace wants to freeze the fs;
  1929	 * * %FREEZE_HOLDER_KERNEL if the kernel wants to freeze the fs.
  1930	 * * %FREEZE_HOLDER_BDEV if freeze originated from a block device.
  1931	 *
  1932	 * The @who argument distinguishes between the kernel and userspace trying to
  1933	 * freeze the filesystem.  Although there cannot be multiple kernel freezes or
  1934	 * multiple userspace freezes in effect at any given time, the kernel and
  1935	 * userspace can both hold a filesystem frozen.  The filesystem remains frozen
  1936	 * until there are no kernel or userspace freezes in effect.
  1937	 *
  1938	 * A filesystem may hold multiple devices and thus a filesystems may be
  1939	 * frozen through the block layer via multiple block devices. In this
  1940	 * case the request is as originating from the block layer by raising
  1941	 * %FREEZE_HOLDER_BDEV. The filesystem remains frozen until all block
  1942	 * devices are unfrozen. If multiple freezes are attempted without
  1943	 * FREEZE_HOLDER_BDEV -EBUSY will be returned.
  1944	 *
  1945	 * During this function, sb->s_writers.frozen goes through these values:
  1946	 *
  1947	 * SB_UNFROZEN: File system is normal, all writes progress as usual.
  1948	 *
  1949	 * SB_FREEZE_WRITE: The file system is in the process of being frozen.  New
  1950	 * writes should be blocked, though page faults are still allowed. We wait for
  1951	 * all writes to complete and then proceed to the next stage.
  1952	 *
  1953	 * SB_FREEZE_PAGEFAULT: Freezing continues. Now also page faults are blocked
  1954	 * but internal fs threads can still modify the filesystem (although they
  1955	 * should not dirty new pages or inodes), writeback can run etc. After waiting
  1956	 * for all running page faults we sync the filesystem which will clean all
  1957	 * dirty pages and inodes (no new dirty pages or inodes can be created when
  1958	 * sync is running).
  1959	 *
  1960	 * SB_FREEZE_FS: The file system is frozen. Now all internal sources of fs
  1961	 * modification are blocked (e.g. XFS preallocation truncation on inode
  1962	 * reclaim). This is usually implemented by blocking new transactions for
  1963	 * filesystems that have them and need this additional guard. After all
  1964	 * internal writers are finished we call ->freeze_fs() to finish filesystem
  1965	 * freezing. Then we transition to SB_FREEZE_COMPLETE state. This state is
  1966	 * mostly auxiliary for filesystems to verify they do not modify frozen fs.
  1967	 *
  1968	 * sb->s_writers.frozen is protected by sb->s_umount.
  1969	 */
  1970	int freeze_super(struct super_block *sb, enum freeze_holder who)
  1971	{
> 1972		int count, ret;
  1973		bool bdev_initiated;
  1974	
  1975		if (!super_lock_excl(sb)) {
  1976			WARN_ON_ONCE("Dying superblock while freezing!");
  1977			return -EINVAL;
  1978		}
  1979		atomic_inc(&sb->s_active);
  1980		bdev_initiated = (who & FREEZE_HOLDER_BDEV);
  1981		who &= ~FREEZE_HOLDER_BDEV;
  1982	
  1983	retry:
  1984		if (sb->s_writers.frozen == SB_FREEZE_COMPLETE) {
  1985			if (sb->s_writers.freeze_holders & who) {
  1986				if (!bdev_initiated && sb->s_writers.freeze_count > 0) {
  1987					/*
  1988					 * Only freezes originating from the
  1989					 * block layer can nest freezes.
  1990					 */
  1991					ret = -EBUSY;
  1992				} else {
  1993					sb->s_writers.freeze_count++;
  1994					ret = 0;
  1995				}
  1996	
  1997				if (sb->s_writers.freeze_count > 1)
  1998					pr_info("VFS: Filesystem grew multiple %d freezers\n",
  1999						sb->s_writers.freeze_count);
  2000				deactivate_locked_super(sb);
  2001				return ret;
  2002			}
  2003	
  2004			WARN_ON(sb->s_writers.freeze_holders == 0);
  2005	
  2006			/*
  2007			 * Someone else already holds this type of freeze; share the
  2008			 * freeze and assign the active ref to the freeze.
  2009			 */
  2010			sb->s_writers.freeze_holders |= who;
  2011			sb->s_writers.freeze_count++;
  2012			super_unlock_excl(sb);
  2013			return 0;
  2014		}
  2015	
  2016		if (sb->s_writers.frozen != SB_UNFROZEN) {
  2017			ret = wait_for_partially_frozen(sb);
  2018			if (ret) {
  2019				deactivate_locked_super(sb);
  2020				return ret;
  2021			}
  2022	
  2023			goto retry;
  2024		}
  2025	
  2026		if (sb_rdonly(sb)) {
  2027			/* Nothing to do really... */
  2028			sb->s_writers.freeze_holders |= who;
  2029			sb->s_writers.frozen = SB_FREEZE_COMPLETE;
  2030			sb->s_writers.freeze_count++;
  2031			wake_up_var(&sb->s_writers.frozen);
  2032			super_unlock_excl(sb);
  2033			return 0;
  2034		}
  2035	
  2036		sb->s_writers.frozen = SB_FREEZE_WRITE;
  2037		/* Release s_umount to preserve sb_start_write -> s_umount ordering */
  2038		super_unlock_excl(sb);
  2039		sb_wait_write(sb, SB_FREEZE_WRITE);
  2040		if (!super_lock_excl(sb)) {
  2041			WARN_ON_ONCE("Dying superblock while freezing!");
  2042			return -EINVAL;
  2043		}
  2044	
  2045		/* Now we go and block page faults... */
  2046		sb->s_writers.frozen = SB_FREEZE_PAGEFAULT;
  2047		sb_wait_write(sb, SB_FREEZE_PAGEFAULT);
  2048	
  2049		/* All writers are done so after syncing there won't be dirty data */
  2050		ret = sync_filesystem(sb);
  2051		if (ret) {
  2052			sb->s_writers.frozen = SB_UNFROZEN;
  2053			sb_freeze_unlock(sb, SB_FREEZE_PAGEFAULT);
  2054			wake_up_var(&sb->s_writers.frozen);
  2055			deactivate_locked_super(sb);
  2056			return ret;
  2057		}
  2058	
  2059		/* Now wait for internal filesystem counter */
  2060		sb->s_writers.frozen = SB_FREEZE_FS;
  2061		sb_wait_write(sb, SB_FREEZE_FS);
  2062	
  2063		if (sb->s_op->freeze_fs) {
  2064			ret = sb->s_op->freeze_fs(sb);
  2065			if (ret) {
  2066				printk(KERN_ERR
  2067					"VFS:Filesystem freeze failed\n");
  2068				sb->s_writers.frozen = SB_UNFROZEN;
  2069				sb_freeze_unlock(sb, SB_FREEZE_FS);
  2070				wake_up_var(&sb->s_writers.frozen);
  2071				deactivate_locked_super(sb);
  2072				return ret;
  2073			}
  2074		}
  2075		/*
  2076		 * For debugging purposes so that fs can warn if it sees write activity
  2077		 * when frozen is set to SB_FREEZE_COMPLETE, and for thaw_super().
  2078		 */
  2079		sb->s_writers.freeze_holders |= who;
  2080		sb->s_writers.frozen = SB_FREEZE_COMPLETE;
  2081		sb->s_writers.freeze_count++;
  2082		wake_up_var(&sb->s_writers.frozen);
  2083		lockdep_sb_freeze_release(sb);
  2084		super_unlock_excl(sb);
  2085		return 0;
  2086	}
  2087	EXPORT_SYMBOL(freeze_super);
  2088	
  2089	/*
  2090	 * Undoes the effect of a freeze_super_locked call.  If the filesystem is
  2091	 * frozen both by userspace and the kernel, a thaw call from either source
  2092	 * removes that state without releasing the other state or unlocking the
  2093	 * filesystem.
  2094	 */
  2095	static int thaw_super_locked(struct super_block *sb, enum freeze_holder who)
  2096	{
  2097		int error = -EINVAL;
> 2098		bool bdev_initiated = (who & FREEZE_HOLDER_BDEV);
  2099		who &= ~FREEZE_HOLDER_BDEV;
  2100	
  2101		if (sb->s_writers.frozen != SB_FREEZE_COMPLETE)
  2102			goto out_unlock;
  2103		if (!(sb->s_writers.freeze_holders & who))
  2104			goto out_unlock;
  2105	
  2106		if (--sb->s_writers.freeze_count) {
  2107			pr_info("VFS: Filesystem has %d remaining freezers\n",
  2108				sb->s_writers.freeze_count);
  2109			error = 0;
  2110			goto out_unlock;
  2111		}
  2112	
  2113		/*
  2114		 * Freeze is shared with someone else.  Release our hold and drop the
  2115		 * active ref that freeze_super assigned to the freezer.
  2116		 */
  2117		error = 0;
  2118		if (sb->s_writers.freeze_holders & ~who) {
  2119			sb->s_writers.freeze_holders &= ~who;
  2120			goto out_deactivate;
  2121		}
  2122	
  2123		if (sb_rdonly(sb)) {
  2124			sb->s_writers.freeze_holders &= ~who;
  2125			sb->s_writers.frozen = SB_UNFROZEN;
  2126			wake_up_var(&sb->s_writers.frozen);
  2127			goto out_deactivate;
  2128		}
  2129	
  2130		lockdep_sb_freeze_acquire(sb);
  2131	
  2132		if (sb->s_op->unfreeze_fs) {
  2133			error = sb->s_op->unfreeze_fs(sb);
  2134			if (error) {
  2135				pr_err("VFS: Filesystem thaw failed\n");
  2136				lockdep_sb_freeze_release(sb);
  2137				sb->s_writers.freeze_count++;
  2138				goto out_unlock;
  2139			}
  2140		}
  2141	
  2142		sb->s_writers.freeze_holders &= ~who;
  2143		sb->s_writers.frozen = SB_UNFROZEN;
  2144		wake_up_var(&sb->s_writers.frozen);
  2145		sb_freeze_unlock(sb, SB_FREEZE_FS);
  2146	out_deactivate:
  2147		deactivate_locked_super(sb);
  2148		return 0;
  2149	
  2150	out_unlock:
  2151		super_unlock_excl(sb);
  2152		return error;
  2153	}
  2154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
