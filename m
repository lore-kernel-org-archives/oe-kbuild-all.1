Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE3E1AAE06
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 22:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731449901; cv=none; b=Ig0L6C2vaRoKmmaY1monT36FoEG+1uUISBnbPPNsFkkS2ozkZUm1mjAwtfMoxVhn1RAujCN8oZEEQQynE+tgZZp01K04PKJwyAPZRB/vpSFKuA9GADH4a2VGjYXo5vRdHL/dA/JttHHoyhWk+oo1GIpzQXtIKfxBSAZ44+scqy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731449901; c=relaxed/simple;
	bh=cHd+H9BqqscAdzoy1psqm18X7lkK2jE1Oo1r3T/OhEo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LhiKbmr+y+bJNtKtguZ2cCcvSp3EE+WFrAHVFKGpbvsnMLKxTA7oJqIdO63kCZT+mXaPwB1nrWE7SxIUrj3pzglI5uLgcZxLJBZ+07JskldBVxKkjB3d3ELVneeFEYXFflWV5AZrzbB41CZrAuAqtilrQ1+vI3Vs+XSA9E2+s8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvt5SLGI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvt5SLGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731449900; x=1762985900;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cHd+H9BqqscAdzoy1psqm18X7lkK2jE1Oo1r3T/OhEo=;
  b=jvt5SLGIzN3+St98tc0Igm9lf4zyvosWkPvuYwU9uxeDCNHBVSUq7uHa
   c6KnSYV1lXgvJpjgzXG5Cjq2TW1yC27HIsj6E7rHXCAsWtYm6xKDlMRPp
   u/RQD8t8aD+9c+iW9q+l+ncd9KZy4dmf7W+qqWX9lKhjlIcKkTDvTj0p0
   Hf9WucEQHhcIUVyTEJSQgNuxN6EO2Y3ubzlnB6cJY7MUX9mHb3fvk8qHL
   dPoHNzU9UR6oLIh6gRFL3Ro1KqtqbPWQ514Z5fOFMOTM6A/cheD7qqCG2
   A4S01j6onRAXCU3MG9BgNILMlCBxm87P48O+6wggR1V3vvXKS6bYcIJBw
   w==;
X-CSE-ConnectionGUID: efLaUjXyRECjdWdTALQ7zw==
X-CSE-MsgGUID: dDRZEQ+hTtC8Uip6/AkInw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31278395"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31278395"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 14:18:20 -0800
X-CSE-ConnectionGUID: DqvEEPswSby8G8vFyVlCQA==
X-CSE-MsgGUID: F8kLFWByS3KYRKhKUyMe+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="87823465"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2024 14:18:19 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAzDE-0001mV-0c
	for oe-kbuild-all@lists.linux.dev;
	Tue, 12 Nov 2024 22:18:16 +0000
Date: Wed, 13 Nov 2024 06:18:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/dovetail-xenomai 3813/13313] fs/ioctl.c:922: warning:
 Function parameter or member 'file' not described in 'compat_ptr_oob_ioctl'
Message-ID: <202411130633.mqmQf10y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/dovetail-xenomai
head:   8025dd14d72f1eee946ab67036c7a3a569861654
commit: 200db6c10cf1d52fab6bef7ede5177e7b87568b0 [3813/13313] dovetail: add core support
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241113/202411130633.mqmQf10y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130633.mqmQf10y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130633.mqmQf10y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ioctl.c:922: warning: Function parameter or member 'file' not described in 'compat_ptr_oob_ioctl'
>> fs/ioctl.c:922: warning: Function parameter or member 'cmd' not described in 'compat_ptr_oob_ioctl'
>> fs/ioctl.c:922: warning: Function parameter or member 'arg' not described in 'compat_ptr_oob_ioctl'


vim +922 fs/ioctl.c

   913	
   914	/**
   915	 * compat_ptr_oob_ioctl - generic implementation of .compat_oob_ioctl file operation
   916	 *
   917	 * The equivalent of compat_ptr_ioctl, dealing with out-of-band ioctl
   918	 * calls. Management of this handler is delegated to the code
   919	 * implementing the out-of-band ioctl() syscall in the companion core.
   920	 */
   921	long compat_ptr_oob_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 > 922	{
   923		if (!file->f_op->oob_ioctl)
   924			return -ENOIOCTLCMD;
   925	
   926		return file->f_op->oob_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
   927	}
   928	EXPORT_SYMBOL(compat_ptr_oob_ioctl);
   929	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
