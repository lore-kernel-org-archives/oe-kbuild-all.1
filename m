Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5117F1BF2A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 18:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716402751; cv=none; b=FdxrK+ewEx9yFqRdPdRZAtsQhbJnpXmG/e86wEz30WkKvcFGZlMLd8gSzpCAJMp4LI1KjaxlEtL0omoJTQoGqBinfVYNXcjojNh1+f2fqkS2iBqUVnwiVkPB565hR8aJHOQvFZSVy9vhd9NDvxZWhTmxXoUFnlYlrulUA82CijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716402751; c=relaxed/simple;
	bh=CdRjMyQS77TJkxwofNWoAwek2rb2LNKl0e0yiUmVQT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhnhbH/UDUNsHE0AC5BiC4rO2ciixPfxxNug5ZbjNAUBWMrPnihKiRUKp4yqB1DgPUZ7xHokvwjlqKuNXv8awRVkJsHJubsMKBIdIYfnwlKFukyQNXtdLefsGi1XEBTH6uos7ebz9W2cuKr1IvJiqVyg8Q2zPFZIjrBi+QOKxfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kO0bXR//; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kO0bXR//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716402749; x=1747938749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CdRjMyQS77TJkxwofNWoAwek2rb2LNKl0e0yiUmVQT4=;
  b=kO0bXR//srovkTAp/JDwsxL0nRs1K5Jrn2c3FO47F+NDOY5sgGWYlgfQ
   R+lnN8Drtkc4c0FWIezh3aBVsK4WuB0N4RGOU5mA45W+FgUqIQvVA9sDe
   j3UEa12tVSGedeNrOWbNPVp4nnSoZb/W/Kts2cf86uP6NoKJSyqO54XLr
   3yFVgZY5FL4hLDk0g0zOLagttBww6F+caE6Pp+9wsJzbzFSFBX73SXpC0
   TCkQnKZh86fknvtyNmGKTjU2CNeH4IK+aYqbx2PStk0cMaFB5/suPAL6q
   Cw1e2VE0CCW89DZuICwTxJpTvLqWfPz8e1GmIjc+0lgmdpjZ1A20670KV
   g==;
X-CSE-ConnectionGUID: /HQBGDODSJ6wdV5XSAVVGw==
X-CSE-MsgGUID: S6ms7UN7REKAECAYDS3dLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12516007"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="12516007"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 11:32:27 -0700
X-CSE-ConnectionGUID: I0ZtVZz0RAqK1HNp4K6IRQ==
X-CSE-MsgGUID: eTWlYOXpQf6UrhZ1AOpFrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="33364412"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 May 2024 11:32:26 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9qlE-0001qT-16;
	Wed, 22 May 2024 18:32:24 +0000
Date: Thu, 23 May 2024 02:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fanotify_userns 14/14] fs/fhandle.c:184:30: error: no
 member named 'mnt_userns' in 'struct vfsmount'
Message-ID: <202405230200.LWJV3iQ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fanotify_userns
head:   e830e0b8d94234d6bae5b5174021d80bf3e7d67d
commit: e830e0b8d94234d6bae5b5174021d80bf3e7d67d [14/14] fs: allow open by file handle inside userns
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240523/202405230200.LWJV3iQ3-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405230200.LWJV3iQ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405230200.LWJV3iQ3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/fhandle.c:2:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:5:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:1970:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/fhandle.c:184:30: error: no member named 'mnt_userns' in 'struct vfsmount'
     184 |                 if (!ns_capable(path->mnt->mnt_userns, CAP_DAC_READ_SEARCH)) {
         |                                 ~~~~~~~~~  ^
   1 warning and 1 error generated.


vim +184 fs/fhandle.c

   161	
   162	static int handle_to_path(int mountdirfd, struct file_handle __user *ufh,
   163			   struct path *path)
   164	{
   165		int retval = 0;
   166		struct file_handle f_handle;
   167		struct file_handle *handle = NULL;
   168		struct dentry *root = NULL;
   169	
   170		/*
   171		 * With open by handle we don't look at the execute bit of the parents.
   172		 * Ideally, we would like CAP_DAC_SEARCH but we don't have that.
   173		 * A userns capabale user is allowed to open by handle in a filesystem
   174		 * that was mounted in that userns. The user is also allowed to open by
   175		 * handle in an idmapped mount, mapped to the userns, but only as long
   176		 * as the resolved path is under the root of the idmapped mount.
   177		 */
   178		path->mnt = get_vfsmount_from_fd(mountdirfd);
   179		if (IS_ERR(path->mnt)) {
   180			return PTR_ERR(path->mnt);
   181		}
   182		if (!ns_capable(path->mnt->mnt_sb->s_user_ns, CAP_DAC_READ_SEARCH)) {
   183			root = path->mnt->mnt_root;
 > 184			if (!ns_capable(path->mnt->mnt_userns, CAP_DAC_READ_SEARCH)) {
   185				retval = -EPERM;
   186				goto out_err;
   187			}
   188		}
   189		if (copy_from_user(&f_handle, ufh, sizeof(struct file_handle))) {
   190			retval = -EFAULT;
   191			goto out_err;
   192		}
   193		if ((f_handle.handle_bytes > MAX_HANDLE_SZ) ||
   194		    (f_handle.handle_bytes == 0)) {
   195			retval = -EINVAL;
   196			goto out_err;
   197		}
   198		handle = kmalloc(sizeof(struct file_handle) + f_handle.handle_bytes,
   199				 GFP_KERNEL);
   200		if (!handle) {
   201			retval = -ENOMEM;
   202			goto out_err;
   203		}
   204		/* copy the full handle */
   205		*handle = f_handle;
   206		if (copy_from_user(&handle->f_handle,
   207				   &ufh->f_handle,
   208				   f_handle.handle_bytes)) {
   209			retval = -EFAULT;
   210			goto out_handle;
   211		}
   212	
   213		retval = do_handle_to_path(mountdirfd, handle, path, root);
   214	
   215	out_handle:
   216		kfree(handle);
   217	out_err:
   218		if (retval)
   219			mntput(path->mnt);
   220	
   221		return retval;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
