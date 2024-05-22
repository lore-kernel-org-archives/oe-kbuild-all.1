Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEEB13D88D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 18:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716402150; cv=none; b=OLYT5xaHuK6UdeQc1UGTN1I7IoaX6vjKpopsX540jgYCxir5aRUcAv7gsg7kmowIV9qwTr1J9j7PUYePKtqj8Aa447nkmbg/PW9sn20U3gVD6pHiBUUBUsanYNDoSHXJPGfM5qsHXWZACtMuEEd8//3iOyqJRCXh7B7paOzkGTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716402150; c=relaxed/simple;
	bh=crFgTVwvSx2rgnwHbdacsZak6cnC23Bz1JfvD9u4dNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V+0XsfaTjjGJeTa8+ifePSf3b12j80Ty7tI49AslWQ2D97QQ8SupXhovY3RnSb1mKq+QoFfprcGBsF7ZsIoI8PigG4RVF5cJEiO87ZajefYSCOGfqhkyIdFh8STR/VzZFJRe+sAy/rjDO8G1scDHjES5O+pW0bm7sg/ORQ9Xo4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ph1dIPWj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ph1dIPWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716402148; x=1747938148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crFgTVwvSx2rgnwHbdacsZak6cnC23Bz1JfvD9u4dNQ=;
  b=Ph1dIPWjQQutodPLd1s/r7ExS6fLwNNM79EylRvBCF4JaS2rCamNIKrn
   xALyT2qyNZHx+UnOYOr5iPbapndDcxaSq0/bXRv63GLzOcuOOtceWAyLe
   X3LS8lZcTmXWtzKfM/7uvaiHFrRpwip3RO0VdGZnTDF3g9vKB5B3O7JNn
   chFEN2IJLoFHIR6tExFhZuG+trEEQygqSOEy+k3BZUkHc/P94oMaTQdE8
   EgMhXEGV39Y5Dg3XiKJtGjJd5KGkn4HegpKbkEENAojZ5sHybwnz/KqlI
   hM3GfAvWRQpUsuz19BLEIuP5qEGXHmun0tdNIPTrpt9VbLXD2Em5apnuW
   g==;
X-CSE-ConnectionGUID: bbjske3VTbC8SnnlGk0rvA==
X-CSE-MsgGUID: E53u7mWhQPKY5BQK/ykeRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23814203"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="23814203"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 11:22:28 -0700
X-CSE-ConnectionGUID: M90pHdCiRSee2D2awSagxw==
X-CSE-MsgGUID: g84cAGa4TKSyK2paTscA6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="33381855"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 May 2024 11:22:26 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9qbY-0001q9-0L;
	Wed, 22 May 2024 18:22:24 +0000
Date: Thu, 23 May 2024 02:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fanotify_userns 14/14] fs/fhandle.c:184:42: error: 'struct
 vfsmount' has no member named 'mnt_userns'
Message-ID: <202405230231.Cj5CS9Kd-lkp@intel.com>
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
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240523/202405230231.Cj5CS9Kd-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405230231.Cj5CS9Kd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405230231.Cj5CS9Kd-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fhandle.c: In function 'handle_to_path':
>> fs/fhandle.c:184:42: error: 'struct vfsmount' has no member named 'mnt_userns'
     184 |                 if (!ns_capable(path->mnt->mnt_userns, CAP_DAC_READ_SEARCH)) {
         |                                          ^~


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
