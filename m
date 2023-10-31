Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512BAA3F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 02:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ci2Ce7Gw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698720366; x=1730256366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VRtT5LbzFmqKo5qD5luqKATUJRocT7sJW8P3VJh0sTE=;
  b=ci2Ce7Gw2iGTvOIeeeQGR5lxvYhfa0G0pm3gdxrkg83kSkU0f0t/aqLC
   hf3A/LAzhS8J0nQTEVhtNeXAGJ1S5UYA7Ag5F4pwQGDzAxarzhM+MF2VY
   3xEkLG6zVnajmr0+8pf+Neg50w8NESKYN1jV1WdgT8wEOX0BxXTmjcyzp
   JLeb3GyoH0xDLQYrJ1O1hYYxR76NWsUD/r0lYuWla8kevMgHPCGTUjISp
   9aYmfv04wKCdCE1bkWaWOSdT2ihhge9QejNwOg8Y8qcuAxk+HhjuKfBN4
   mUlwAYF11wQ5Fib2HiOG1xM2eJpHAuysTf//mPjVTVrfa7lsKanQawhUa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="388021493"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="388021493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 19:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="1696298"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Oct 2023 19:46:03 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxelU-000Dlg-2Q;
	Tue, 31 Oct 2023 02:46:00 +0000
Date: Tue, 31 Oct 2023 10:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>, Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nfs@vger.kernel.org,
	Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>
Subject: Re: [PATCH 1/6] nfsd: prepare for supporting admin-revocation of
 state
Message-ID: <202310311025.kdFXiVKx-lkp@intel.com>
References: <20231027015613.26247-2-neilb@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027015613.26247-2-neilb@suse.de>

Hi NeilBrown,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6 next-20231030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/nfsd-prepare-for-supporting-admin-revocation-of-state/20231027-095832
base:   linus/master
patch link:    https://lore.kernel.org/r/20231027015613.26247-2-neilb%40suse.de
patch subject: [PATCH 1/6] nfsd: prepare for supporting admin-revocation of state
config: arm-keystone_defconfig (https://download.01.org/0day-ci/archive/20231031/202310311025.kdFXiVKx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311025.kdFXiVKx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311025.kdFXiVKx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/nfsd/nfsctl.o: in function `write_unlock_fs':
>> fs/nfsd/nfsctl.c:283:(.text+0xa58): undefined reference to `nfsd4_revoke_states'


vim +283 fs/nfsd/nfsctl.c

   237	
   238	/*
   239	 * write_unlock_fs - Release all locks on a local file system
   240	 *
   241	 * Experimental.
   242	 *
   243	 * Input:
   244	 *			buf:	'\n'-terminated C string containing the
   245	 *				absolute pathname of a local file system
   246	 *			size:	length of C string in @buf
   247	 * Output:
   248	 *	On success:	returns zero if all specified locks were released;
   249	 *			returns one if one or more locks were not released
   250	 *	On error:	return code is negative errno value
   251	 */
   252	static ssize_t write_unlock_fs(struct file *file, char *buf, size_t size)
   253	{
   254		struct path path;
   255		char *fo_path;
   256		int error;
   257	
   258		/* sanity check */
   259		if (size == 0)
   260			return -EINVAL;
   261	
   262		if (buf[size-1] != '\n')
   263			return -EINVAL;
   264	
   265		fo_path = buf;
   266		if (qword_get(&buf, fo_path, size) < 0)
   267			return -EINVAL;
   268		trace_nfsd_ctl_unlock_fs(netns(file), fo_path);
   269		error = kern_path(fo_path, 0, &path);
   270		if (error)
   271			return error;
   272	
   273		/*
   274		 * XXX: Needs better sanity checking.  Otherwise we could end up
   275		 * releasing locks on the wrong file system.
   276		 *
   277		 * For example:
   278		 * 1.  Does the path refer to a directory?
   279		 * 2.  Is that directory a mount point, or
   280		 * 3.  Is that directory the root of an exported file system?
   281		 */
   282		error = nlmsvc_unlock_all_by_sb(path.dentry->d_sb);
 > 283		nfsd4_revoke_states(netns(file), path.dentry->d_sb);
   284	
   285		path_put(&path);
   286		return error;
   287	}
   288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
