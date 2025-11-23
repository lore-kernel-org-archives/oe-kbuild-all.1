Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A3E28313D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 07:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763884149; cv=none; b=PCtWjASUAT4l/T0m8leCLbJXMjof/hRZ4Asds8UnYD/BBCtZ0gWaj3zeAEPD2i+ZkQk4hOzEC6BhGPBhnaUalNrhQQflZ3GUNY1O8AlE4O2UCIjMR9BuJs4/Wqc23SU7ml7IhW3BodBdXPtbvmHq3VqjoPYygyzuMVSCaXKsrFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763884149; c=relaxed/simple;
	bh=7AhrVDm2iARSLXsfQeR30+FpCXIElx5Xq7BAd1ewNEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qKJDMPFn3XL2ykn6rtWNbaAAeUSdv9c7ILRjRdXEw1tnjsDP5ASTebfa+BnvEzAqpQi7lxrAs/1GpAXESAFn/82ox0NanMUD7D3H20RkmaZahasfCsAUGzaTZrlucnJJTrt2YczH+ju0mqZGgjv7mXr8d4Fwb8Em1NrWTqds56U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1OVQNxq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1OVQNxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763884147; x=1795420147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7AhrVDm2iARSLXsfQeR30+FpCXIElx5Xq7BAd1ewNEk=;
  b=a1OVQNxqtYEhpFmU56rqPnDS+wG0G+7sWtXbhPehvPJM+w0kLKaSHbx5
   v+X4wl9Is6qD8nHMetynZgklIhzrbt6eWAAG7r5k1NrO/YwPAaVd1+ej8
   1q6rMZxaEf1KlwWWeQYZCHzo+vvR455OraG72fwotK4FFEbG4I4Bu84Gi
   /uKk3gs+UZJgpw42BxAgOZ/LHzwrgEy9ecoCTGvlPFFLLQFfvo9Xp7Hv1
   Qy0EivbnAzqOCMkduLo9JQYavY14njF9QL2SqK9ymtOqElEIDxiP+8VTO
   LGVs3AY9Ybf5RZMEev+9YA2NZ+3AunSqrnOQXr4ytxbwglZS++6fMIbmP
   g==;
X-CSE-ConnectionGUID: Q1vpx0GGTe+M3LFz6D1/Hw==
X-CSE-MsgGUID: YRc888QKSH2arOw+qb+pYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="77027959"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="77027959"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 23:49:06 -0800
X-CSE-ConnectionGUID: 4Ogp48JcREeuE3PjL23RHQ==
X-CSE-MsgGUID: Nty2AsxIRnS2uJmoYw/7EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="196984749"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Nov 2025 23:49:05 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN4qF-00088L-1m;
	Sun, 23 Nov 2025 07:49:03 +0000
Date: Sun, 23 Nov 2025 15:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare.scoped 41/51]
 drivers/gpio/gpiolib-cdev.c:316:33-39: ERROR: application of sizeof to
 pointer
Message-ID: <202511231553.tOdYotw7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.fd.prepare.scoped
head:   09ba3707485de081133d97c9bdc7fa364d318f46
commit: ec5375d630a01fb398dce31411a58e29fc3a1bec [41/51] gpio: convert linehandle_create() to FD_PREPARE()
config: i386-randconfig-r064-20251123 (https://download.01.org/0day-ci/archive/20251123/202511231553.tOdYotw7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231553.tOdYotw7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpiolib-cdev.c:316:33-39: ERROR: application of sizeof to pointer

vim +316 drivers/gpio/gpiolib-cdev.c

   300	
   301	static int linehandle_fd_create(struct gpio_device *gdev,
   302					struct linehandle_state *lh,
   303					struct gpiohandle_request *handlereq,
   304					void __user *ip)
   305	{
   306		int ret;
   307	
   308		FD_PREPARE(fdf, O_RDONLY | O_CLOEXEC,
   309			   anon_inode_getfile("gpio-linehandle", &linehandle_fileops,
   310					      lh, O_RDONLY | O_CLOEXEC));
   311		ret = ACQUIRE_ERR(fd_prepare, &fdf);
   312		if (ret)
   313			return ret;
   314	
   315		handlereq->fd = fd_prepare_fd(fdf);
 > 316		if (copy_to_user(ip, handlereq, sizeof(handlereq)))
   317			return -EFAULT;
   318	
   319		dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n", lh->num_descs);
   320	
   321		fd_publish(fdf);
   322		return 0;
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
