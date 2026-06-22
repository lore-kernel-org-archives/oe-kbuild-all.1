Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2082436E489
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 21:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782163497; cv=none; b=qibUBquQA8UJx5Xw73mwsu/FSF3uJ7EST91IqYfklYltHoF2llH5KtqVKRgdAg/lbFqV2hTHRa4AYh8kWhRcNfzCVyQHHjJRtb8V7kr0CX0yrmR1Rm81w4N3al7VrOqFlJHkV6q8SrQAG/SIGfUbX8YLLQx663LzrDbustozzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782163497; c=relaxed/simple;
	bh=uuExHg97ZgSilzytzTvhEQLzKQFJUaCeGl1oJqCJE8g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SNZfltwH9n+0k/U2/NZ9p88G6a7bXuWf8p4WlfTzqh1fcDpL5bjNPbsJIVHr0jZ0KO4vq9nVijNrSNQWB0SWW82SXD/a8gslQyOKf38J6Ol3QMpqfhxNjU3Chq8sqUFJ0x8d3grmIpTWbZRq0STCvxsXDAfrLwS9oze3/fLXLdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDqjZeHm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDqjZeHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782163495; x=1813699495;
  h=date:from:to:cc:subject:message-id;
  bh=uuExHg97ZgSilzytzTvhEQLzKQFJUaCeGl1oJqCJE8g=;
  b=NDqjZeHmLyVpDtiuia8OyKLfcEFnYMmuKcdSd1+aLH99XA58WJ+FEJff
   g7V3i2JCthmDqJFw4VwmrCbCD2FabtPNMZC8T65vDmsrX6DcJIc1YPyQl
   C32eNy2x0IdXMGCQhO2OH4hcxwbHQu4TPjxyuGyL//UIrcEqWWSEy9J9G
   T2l6gqX+ce92m+BZIckpXSg/lWyy10c9TM5BYWo+/TlrEn/KC1pEpGOP0
   jiV79qxCXYrTpik1S7acAXZHKeos4MbCt7gkRUesgPA0sfxHAbW1auCWV
   OXzGPkBn2u1hj1AskD3iOl+/jdU4xB8kdHdGGnSX7Yei99gEBi3jejlri
   w==;
X-CSE-ConnectionGUID: duf403jwRfS0QJYxRyIR0Q==
X-CSE-MsgGUID: WHhonFxXRQ6jMdmflCBLdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100453480"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="100453480"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 14:24:54 -0700
X-CSE-ConnectionGUID: MUGGzYydQz25g4hWg8L6aQ==
X-CSE-MsgGUID: TN76H6L2TQ2M+sjTF5ipgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="244971037"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jun 2026 14:24:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbm8Q-000000001wb-3fXQ;
	Mon, 22 Jun 2026 21:24:50 +0000
Date: Tue, 23 Jun 2026 05:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v2 2/18]
 fs/configfs/dir.c:1866:68: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202606230539.Qmma6AIY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v2
head:   3d482734f1581168bb7973032424df660ce14955
commit: ef10e19014b14b7ac73434044abbe473fa34b2df [2/18] fs/configfs: dynamically allocate super_info
config: arm-randconfig-r121-20260622 (https://download.01.org/0day-ci/archive/20260623/202606230539.Qmma6AIY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230539.Qmma6AIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230539.Qmma6AIY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/configfs/dir.c:1866:68: sparse: sparse: Using plain integer as NULL pointer
   fs/configfs/dir.c:1935:68: sparse: sparse: Using plain integer as NULL pointer

vim +1866 fs/configfs/dir.c

  1863	
  1864	int configfs_register_subsystem(struct configfs_subsystem *subsys)
  1865	{
> 1866		struct configfs_super_info *info = configfs_get_super_info(0);
  1867		struct config_group *group = &subsys->su_group;
  1868		struct dentry *dentry;
  1869		struct dentry *root;
  1870		struct configfs_dirent *sd;
  1871		struct configfs_fragment *frag;
  1872		int err;
  1873	
  1874		if (IS_ERR(info))
  1875			return PTR_ERR(info);
  1876	
  1877		frag = new_fragment();
  1878		if (!frag) {
  1879			configfs_put_super_info(info);
  1880			return -ENOMEM;
  1881		}
  1882	
  1883		root = configfs_pin_fs();
  1884		if (IS_ERR(root)) {
  1885			put_fragment(frag);
  1886			configfs_put_super_info(info);
  1887			return PTR_ERR(root);
  1888		}
  1889	
  1890		if (!group->cg_item.ci_name)
  1891			group->cg_item.ci_name = group->cg_item.ci_namebuf;
  1892	
  1893		sd = root->d_fsdata;
  1894		mutex_lock(&info->subsys_mutex);
  1895		link_group(to_config_group(sd->s_element), group);
  1896		mutex_unlock(&info->subsys_mutex);
  1897	
  1898		inode_lock_nested(d_inode(root), I_MUTEX_PARENT);
  1899	
  1900		err = -ENOMEM;
  1901		dentry = d_alloc_name(root, group->cg_item.ci_name);
  1902		if (dentry) {
  1903			d_add(dentry, NULL);
  1904	
  1905			err = configfs_dirent_exists(dentry);
  1906			if (!err)
  1907				err = configfs_attach_group(&group->cg_item,
  1908							    dentry, frag);
  1909			if (err) {
  1910				BUG_ON(d_inode(dentry));
  1911				d_drop(dentry);
  1912			} else {
  1913				spin_lock(&configfs_dirent_lock);
  1914				configfs_dir_set_ready(dentry->d_fsdata);
  1915				spin_unlock(&configfs_dirent_lock);
  1916			}
  1917			dput(dentry);
  1918		}
  1919	
  1920		inode_unlock(d_inode(root));
  1921	
  1922		if (err) {
  1923			mutex_lock(&info->subsys_mutex);
  1924			unlink_group(group);
  1925			mutex_unlock(&info->subsys_mutex);
  1926			configfs_release_fs();
  1927		}
  1928		put_fragment(frag);
  1929		configfs_put_super_info(info);
  1930		return err;
  1931	}
  1932	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
