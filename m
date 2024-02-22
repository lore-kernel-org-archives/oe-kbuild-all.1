Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FF114B815
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 20:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708633445; cv=none; b=ZK8zPZtUcFMofUHxuo/3ftzU6Z/Yf2NbZp9hvCcbDXEd1QFS/gMKc/d8ZU6mG8HXrC4FjPxN1UdmQOOU8gpoMbKFBM9Sdc4BJSDqtZGleJTMvD+QGOFAO7rfTmS2oipMRPpSfiROHzU1znB/iulN4G0pQ1BRkxjvarCzV5GHiHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708633445; c=relaxed/simple;
	bh=72oBv4CFT1wp9+83xsn8JmxuKv/9lHQUWeANNr7ELIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AxYiQeHZmjCYsLilLyyf4v8M3N2rdiFgwg/UJJLO/uC4fOVxYV6w/7ZkFSTrb8pFbSpFxut8KPAkXazuIziVp1++cN1SWPlIiiIvAQ0trcx17gCBhYQSNUjYs7P7mOiTVS+XSjIP6Q9fJ1cL8DK4EE5GRYSFZrz4wMC+u/2Z4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jedoi7SO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jedoi7SO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708633444; x=1740169444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=72oBv4CFT1wp9+83xsn8JmxuKv/9lHQUWeANNr7ELIM=;
  b=jedoi7SO0eWQ0wRDx8K8SkplYoFveMXkT+tcIzXCIEghb+z2AwMEzI0w
   gqP283+EVPQ0IiftRoO8eZ8Tegb/6sNAzZiQC4SQ1vOUrFTsua6cAl59l
   7JC5iNRR8n0Pmd7LE27kGGwxbCuJiQ6K4LGOeCsQRcoCVMv3pfvBQjC7X
   AemA/YbcbjnlIGP8bo46I+zQhlAUKOIRU3eAM7m9uan335rBteMYRUea6
   T33zl03zJCaY2i+ZrNO9WjX2ZKU0eGTTpJiP8d332s7wPeezPZuC3X+C/
   LAmLfF/Z0HK2ZNfUevHvFH/rTDc4Bb/uu5x9Dbteg1XejGh92R4I5IwhS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3035486"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3035486"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 12:23:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827600231"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="827600231"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Feb 2024 12:23:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdFbE-0006gO-2M;
	Thu, 22 Feb 2024 20:23:20 +0000
Date: Fri, 23 Feb 2024 04:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Seth Forshee (DigitalOcean)" <sforshee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sforshee:fscaps-vfsid 12/26] include/linux/security.h:965:12:
 warning: 'security_inode_remove_fscaps' defined but not used
Message-ID: <202402230453.ENH8sPlt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/linux.git fscaps-vfsid
head:   5ce094a334396397b1fc55565f035ffd4c68e612
commit: e1b4b67006eba055ec2e37b6ea358c12c244284d [12/26] security: add hooks for set/get/remove of fscaps
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240223/202402230453.ENH8sPlt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230453.ENH8sPlt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230453.ENH8sPlt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from kernel/time/time.c:33:
>> include/linux/security.h:965:12: warning: 'security_inode_remove_fscaps' defined but not used [-Wunused-function]
     965 | static int security_inode_remove_fscaps(struct mnt_idmap *idmap,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/security.h:959:12: warning: 'security_inode_get_fscaps' defined but not used [-Wunused-function]
     959 | static int security_inode_get_fscaps(struct mnt_idmap *idmap,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/security.h:952:13: warning: 'security_inode_post_set_fscaps' defined but not used [-Wunused-function]
     952 | static void security_inode_post_set_fscaps(struct mnt_idmap *idmap,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   kernel/time/hrtimer.c:120:35: warning: initialized field overwritten [-Woverride-init]
     120 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   kernel/time/hrtimer.c: In function '__run_hrtimer':
   kernel/time/hrtimer.c:1652:14: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1652 |         bool expires_in_hardirq;
         |              ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from kernel/time/hrtimer.c:30:
   include/linux/security.h: At top level:
>> include/linux/security.h:965:12: warning: 'security_inode_remove_fscaps' defined but not used [-Wunused-function]
     965 | static int security_inode_remove_fscaps(struct mnt_idmap *idmap,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/security.h:959:12: warning: 'security_inode_get_fscaps' defined but not used [-Wunused-function]
     959 | static int security_inode_get_fscaps(struct mnt_idmap *idmap,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/security.h:952:13: warning: 'security_inode_post_set_fscaps' defined but not used [-Wunused-function]
     952 | static void security_inode_post_set_fscaps(struct mnt_idmap *idmap,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/security_inode_remove_fscaps +965 include/linux/security.h

   944	
   945	static inline int security_inode_set_fscaps(struct mnt_idmap *idmap,
   946						    struct dentry *dentry,
   947						    const struct vfs_caps *caps,
   948						    int flags)
   949	{
   950		return 0;
   951	}
 > 952	static void security_inode_post_set_fscaps(struct mnt_idmap *idmap,
   953						   struct dentry *dentry,
   954						   const struct vfs_caps *caps,
   955						   int flags)
   956	{
   957	}
   958	
 > 959	static int security_inode_get_fscaps(struct mnt_idmap *idmap,
   960					     struct dentry *dentry)
   961	{
   962		return 0;
   963	}
   964	
 > 965	static int security_inode_remove_fscaps(struct mnt_idmap *idmap,
   966						struct dentry *dentry)
   967	{
   968		return 0;
   969	}
   970	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
