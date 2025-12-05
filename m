Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF08354AEC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947756; cv=none; b=lmmu6XUYIGCzWBwVu+RsfmHxp1hsHqBN/mBvyGEqmVeaihw4vcFdARfqikOD0+E08oW+W8mV+Bxz6513JNeZjn+yhjIQ9CmwCJFvLKqOjnSz/d8gOEOQHacnS7VlCfJFx3hDumZ3IZLgo0BCAgaIpxaH8Mu6PedJh00PT1byzmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947756; c=relaxed/simple;
	bh=nxoj7Bufvybb1w1s2LtXs0ceW12FK2aolBnXKhYAk+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCa3HbkvbNUPFP0zDdKWCr+HaF3OaDaJV+eSFt4Xe5NlV5ZSRG2Hq8oKe6ijWim0wa1x9CuC4sOqKEf/3cYhuQ6e+Vjd+/RAbs+1gjvbRP/ylKVA6Vb1YrSv3qDIV0w6hoMwQ4F9PN89iIJTGWYLY68OVoFYUZb8UXA0+RdnGDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FX0t0DwT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FX0t0DwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764947754; x=1796483754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nxoj7Bufvybb1w1s2LtXs0ceW12FK2aolBnXKhYAk+g=;
  b=FX0t0DwTi1z9pjUuThxS9jPp4Y4913YMlTmRgenYUaIM+iatyAElyw4m
   dvwe1cN0yMEB2twFFzGvBwnJbZoO05ns1Vumjglgmz+yN8m5YZ7Ht8uoX
   067yr3+c3ZSAwYemLwJz8h5HoKYiPXFPVJBZt3xog1eyiTJKvxJOXmuEL
   A0AgDMF0INBSnGaVdsm3RZgOvi10lzCGUh8HHfd2RmOSqeEbMo9SaKxJZ
   eqFtJdkjEt5ObDXNjAgPEpbl8XiZc7FINDhJBPata4FK2dWpy25D7bC5Z
   iWFzkS5C059Y1x7XUU8/DSbcsNbm1k65NEXZ8zdd0L1U3UKWzrYNlo3Rk
   g==;
X-CSE-ConnectionGUID: bn5bhvNKRRa245oPZjAc8g==
X-CSE-MsgGUID: 0kZ0Fn0DSJqIQGGAV58kJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84388711"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="84388711"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 07:15:53 -0800
X-CSE-ConnectionGUID: JqWC01B9RfubsR9Co+FL+g==
X-CSE-MsgGUID: HxfK5RbwTFeuYArb4bN4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="199746867"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Dec 2025 07:15:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRXXC-00000000F7d-0aEO;
	Fri, 05 Dec 2025 15:15:50 +0000
Date: Fri, 5 Dec 2025 23:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] netconsole: Plug to dynamic configfs item
Message-ID: <202512052343.v0ejaRho-lkp@intel.com>
References: <20251202-configfs_netcon-v1-2-b4738ead8ee8@debian.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-configfs_netcon-v1-2-b4738ead8ee8@debian.org>

Hi Breno,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on e538109ac71d801d26776af5f3c54f548296c29c]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/configfs-add-kernel-space-item-registration-API/20251202-233234
base:   e538109ac71d801d26776af5f3c54f548296c29c
patch link:    https://lore.kernel.org/r/20251202-configfs_netcon-v1-2-b4738ead8ee8%40debian.org
patch subject: [PATCH RFC 2/2] netconsole: Plug to dynamic configfs item
config: arc-randconfig-001-20251205 (https://download.01.org/0day-ci/archive/20251205/202512052343.v0ejaRho-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512052343.v0ejaRho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512052343.v0ejaRho-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/netconsole.c: In function 'populate_configfs_item':
   drivers/net/netconsole.c:231:1: warning: no return statement in function returning non-void [-Wreturn-type]
    }
    ^
   drivers/net/netconsole.c: In function 'free_param_target':
>> drivers/net/netconsole.c:1892:8: error: 'struct netconsole_target' has no member named 'group'
     if (nt->group.cg_item.ci_dentry)
           ^~
   drivers/net/netconsole.c:1893:31: error: 'struct netconsole_target' has no member named 'group'
      configfs_unregister_item(&nt->group.cg_item);
                                  ^~


vim +1892 drivers/net/netconsole.c

  1888	
  1889	/* Cleanup netpoll for given target (from boot/module param) and free it */
  1890	static void free_param_target(struct netconsole_target *nt)
  1891	{
> 1892		if (nt->group.cg_item.ci_dentry)
  1893			configfs_unregister_item(&nt->group.cg_item);
  1894		netpoll_cleanup(&nt->np);
  1895		kfree(nt);
  1896	}
  1897	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
