Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6048F48CD0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706002648; cv=none; b=UpHoNQdqWcVS9GjJvPqHQugC5MhHdS+ePwTq5UplyjsxdVyiKbMfx0yOeVstuCzddtrUEkDK6iCyKiS+YWgm8UOQY10faaNkgBftqXLzbN9Ef0anTk7MuwCqNRMyk4FNdD+rOiV0sJWJfE5oXxACb2gT5Q5W5Lzt4BPnewEvKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706002648; c=relaxed/simple;
	bh=iRTPa9ekwgK9ZKeDBEa/aiPsJbuxqT8J9aScWpKdvpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t4CKsqh/RZ5GGw4yMQThDR68aNvDrG2ljNymvG9YGMnnmraTQ2g+rwpv2Qd7CTYKvOxp2oN9iHLzGrUePiNIXQTJZIBauE7GHQIL4HMeElZzQDGg+jC0asp/PYPPc5BTIudrNM8vGQ/8ictH6M70FWgdaA7GmzybD7MPI6PsADI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUcQ+6Xy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUcQ+6Xy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706002646; x=1737538646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iRTPa9ekwgK9ZKeDBEa/aiPsJbuxqT8J9aScWpKdvpw=;
  b=YUcQ+6XytxEgLCerpHrq9DkLBhdSIP39QPJb3wAeOggXOtNWl5ejyfXp
   mp+cye//4gkEZL9b3yZYgAbnpuws0aU8h26UyNzjFEM1PqBnnzqcBWqv4
   kOOOVGUYvzFLjWTVllBSl2IcZgVUa/2jPJyJGv9DWZktNvLVD+H+tQk8u
   fafeq5jKIwBYI1NYOB1/k4PVeFeGNtGTZcaXj7yKlGdrqGOX3yoFxbP6c
   I3Kt5MqF3onDZ6MX4UXFGQCkujAgxSxO9cG6TDn1t/u7hbQB1VzPMVHzU
   X+/8fARkgz8FF9sIAa5dY/7tae2I1eKv5iXG6K41REuWmL3CEHOrZWEFr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="361347"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="361347"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 01:37:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="27959994"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jan 2024 01:37:09 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSDDP-0007Jn-0S;
	Tue, 23 Jan 2024 09:37:07 +0000
Date: Tue, 23 Jan 2024 17:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/namespace.c:5026:1: warning: the frame size of 1040 bytes is
 larger than 1024 bytes
Message-ID: <202401231743.amoJ86dc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ed2632ec7d72e926b9e8bcc9ad1bb0cd37274bf
commit: 35e27a5744131996061e6e323f1bcb4c827ae867 fs: keep struct mnt_id_req extensible
date:   6 weeks ago
config: x86_64-dcg_x86_64_defconfig-func (https://download.01.org/0day-ci/archive/20240123/202401231743.amoJ86dc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401231743.amoJ86dc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401231743.amoJ86dc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/namespace.c: In function '__do_sys_statmount':
>> fs/namespace.c:5026:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    5026 | }
         | ^


vim +5026 fs/namespace.c

35e27a57441319 Christian Brauner 2023-11-29  4982  
46eae99ef73302 Miklos Szeredi    2023-10-25  4983  SYSCALL_DEFINE4(statmount, const struct mnt_id_req __user *, req,
46eae99ef73302 Miklos Szeredi    2023-10-25  4984  		struct statmount __user *, buf, size_t, bufsize,
46eae99ef73302 Miklos Szeredi    2023-10-25  4985  		unsigned int, flags)
46eae99ef73302 Miklos Szeredi    2023-10-25  4986  {
46eae99ef73302 Miklos Szeredi    2023-10-25  4987  	struct vfsmount *mnt;
46eae99ef73302 Miklos Szeredi    2023-10-25  4988  	struct mnt_id_req kreq;
68385d77c05b40 Christian Brauner 2023-11-19  4989  	struct kstatmount ks;
68385d77c05b40 Christian Brauner 2023-11-19  4990  	/* We currently support retrieval of 3 strings. */
68385d77c05b40 Christian Brauner 2023-11-19  4991  	size_t seq_size = 3 * PATH_MAX;
46eae99ef73302 Miklos Szeredi    2023-10-25  4992  	int ret;
46eae99ef73302 Miklos Szeredi    2023-10-25  4993  
46eae99ef73302 Miklos Szeredi    2023-10-25  4994  	if (flags)
46eae99ef73302 Miklos Szeredi    2023-10-25  4995  		return -EINVAL;
46eae99ef73302 Miklos Szeredi    2023-10-25  4996  
35e27a57441319 Christian Brauner 2023-11-29  4997  	ret = copy_mnt_id_req(req, &kreq);
35e27a57441319 Christian Brauner 2023-11-29  4998  	if (ret)
35e27a57441319 Christian Brauner 2023-11-29  4999  		return ret;
46eae99ef73302 Miklos Szeredi    2023-10-25  5000  
68385d77c05b40 Christian Brauner 2023-11-19  5001  retry:
68385d77c05b40 Christian Brauner 2023-11-19  5002  	ret = prepare_kstatmount(&ks, &kreq, buf, bufsize, seq_size);
68385d77c05b40 Christian Brauner 2023-11-19  5003  	if (ret)
68385d77c05b40 Christian Brauner 2023-11-19  5004  		return ret;
68385d77c05b40 Christian Brauner 2023-11-19  5005  
46eae99ef73302 Miklos Szeredi    2023-10-25  5006  	down_read(&namespace_sem);
46eae99ef73302 Miklos Szeredi    2023-10-25  5007  	mnt = lookup_mnt_in_ns(kreq.mnt_id, current->nsproxy->mnt_ns);
68385d77c05b40 Christian Brauner 2023-11-19  5008  	if (!mnt) {
68385d77c05b40 Christian Brauner 2023-11-19  5009  		up_read(&namespace_sem);
68385d77c05b40 Christian Brauner 2023-11-19  5010  		kvfree(ks.seq.buf);
68385d77c05b40 Christian Brauner 2023-11-19  5011  		return -ENOENT;
46eae99ef73302 Miklos Szeredi    2023-10-25  5012  	}
68385d77c05b40 Christian Brauner 2023-11-19  5013  
68385d77c05b40 Christian Brauner 2023-11-19  5014  	ks.mnt = mnt;
68385d77c05b40 Christian Brauner 2023-11-19  5015  	get_fs_root(current->fs, &ks.root);
68385d77c05b40 Christian Brauner 2023-11-19  5016  	ret = do_statmount(&ks);
68385d77c05b40 Christian Brauner 2023-11-19  5017  	path_put(&ks.root);
46eae99ef73302 Miklos Szeredi    2023-10-25  5018  	up_read(&namespace_sem);
46eae99ef73302 Miklos Szeredi    2023-10-25  5019  
68385d77c05b40 Christian Brauner 2023-11-19  5020  	if (!ret)
68385d77c05b40 Christian Brauner 2023-11-19  5021  		ret = copy_statmount_to_user(&ks);
68385d77c05b40 Christian Brauner 2023-11-19  5022  	kvfree(ks.seq.buf);
68385d77c05b40 Christian Brauner 2023-11-19  5023  	if (retry_statmount(ret, &seq_size))
68385d77c05b40 Christian Brauner 2023-11-19  5024  		goto retry;
46eae99ef73302 Miklos Szeredi    2023-10-25  5025  	return ret;
46eae99ef73302 Miklos Szeredi    2023-10-25 @5026  }
46eae99ef73302 Miklos Szeredi    2023-10-25  5027  

:::::: The code at line 5026 was first introduced by commit
:::::: 46eae99ef73302f9fb3dddcd67c374b3dffe8fd6 add statmount(2) syscall

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
