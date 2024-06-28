Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BE961FCF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 18:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601030; cv=none; b=gu5D1hwXup0lSWF9/19P71CME7nhyfcgu0AZWqkrAw4vunPJzo2tE8S5bvTpnJN9Sxy0dodZcoss2zYfSSdy3qFsw2k+4xKDVunraw2RQ+SH5Pp0bJIFQRd32GnIVzaHZZtlOD37q5BPyyut/lDzZqgjH/U8LLeVFnoznxsP6y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601030; c=relaxed/simple;
	bh=+5r7EYc5oBj15urWvAetZz8N3KMyNso3gszr+ICQVwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nWvQQD+Z8d01aANgRgucnb6wBjShJnwoIgBLWfM5ZSCo7ciMUAJn0UE4vkVm37CvafmEee8Ep0kBIvqpbIFLiCiFr1mnVkebYwrTszajfrNEkpa7ly3PsOj4CHz72kxfBsOk+RZ0hWXX01sUQD2GiP2aCD/IlwTKnjN9s943LTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRFJTfzg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRFJTfzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719601028; x=1751137028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+5r7EYc5oBj15urWvAetZz8N3KMyNso3gszr+ICQVwo=;
  b=MRFJTfzg5ZVeclMEVNKT0Z/cvAtIwMn2SiGxrMJuaZkUFlXMtBTVD0VQ
   HrZUJgpPcBm1Rm9mkxma3WtYPZMt1MqycHEkw6u7T3KB7/1p6GlordDho
   oN//4sPS8pAA3M4QLjBpHL3KX21FoOGG22rHiJ8TKIeOYilouasIlbT9k
   jesxfNXjefgDjSp+6xdYtc2cGCVczMTFtIiNKO7oC6DYmqm7wVDW87SMk
   hHhXkFbTbEXRipzCptq7Q5qzYHfhOd9Onkjb3s1klGIiGk6MVuPBbkrIl
   BdWerVPtqbvhlJeCY95+3fjSshA9cffsNx7OVRdZJYEGw38AZiBJH77lK
   w==;
X-CSE-ConnectionGUID: YKLAaOYHQ86dXDOewUQQ8Q==
X-CSE-MsgGUID: 2y6FEoBeRpORtPggKQPdnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16932716"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="16932716"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 11:57:08 -0700
X-CSE-ConnectionGUID: hWGMCK87RMa7diAj9e57gQ==
X-CSE-MsgGUID: FRLNl/hqR8GrnnRr0jj8mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="75547439"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jun 2024 11:57:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNGmO-000Hql-0M;
	Fri, 28 Jun 2024 18:57:04 +0000
Date: Sat, 29 Jun 2024 02:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Subject: [brauner-vfs:vfs.nsfs.2024-06-28 4/5] fs/nsfs.c:96:16: error:
 cleanup argument not a function
Message-ID: <202406290204.QsLMvOIW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.nsfs.2024-06-28
head:   1cbcd0fbb586ed09ba76dfb4e65cab2bcaec7e5e
commit: 4cf9ee1f184ddc959556337a53075a3b824f3642 [4/5] nsfs: add open_namespace()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240629/202406290204.QsLMvOIW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290204.QsLMvOIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290204.QsLMvOIW-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nsfs.c: In function 'open_namespace':
>> fs/nsfs.c:96:16: error: cleanup argument not a function
      96 |         struct path path __free(path_put) = {};
         |                ^~~~


vim +96 fs/nsfs.c

    85	
    86	/**
    87	 * open_namespace - open a namespace
    88	 * @ns: the namespace to open
    89	 *
    90	 * This will consume a reference to @ns indendent of success or failure.
    91	 *
    92	 * Return: A file descriptor on success or a negative error code on failure.
    93	 */
    94	int open_namespace(struct ns_common *ns)
    95	{
  > 96		struct path path __free(path_put) = {};
    97		struct file *f;
    98		int err;
    99	
   100		/* call first to consume reference */
   101		err = path_from_stashed(&ns->stashed, nsfs_mnt, ns, &path);
   102		if (err < 0)
   103			return err;
   104	
   105		CLASS(get_unused_fd, fd)(O_CLOEXEC);
   106		if (fd < 0)
   107			return fd;
   108	
   109		f = dentry_open(&path, O_RDONLY, current_cred());
   110		if (IS_ERR(f))
   111			return PTR_ERR(f);
   112	
   113		fd_install(fd, f);
   114		return take_fd(fd);
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
