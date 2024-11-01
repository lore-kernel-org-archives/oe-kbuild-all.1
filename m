Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB52C15CD41
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730453612; cv=none; b=smuE/EokQjLOsNPMhVmnDD5TfrspTN+9rSmdJ0dIU1Gj7rb9c1lnJ86ub90fVr8kqnpUe4I7EepqXn4fLVrDsRuegl92OlQe9CDx0pmhhRCn6+BzD8L/G3aV8uZCi8a7kPT8HLSlnng/TVneh0fcR8eWgpXsZy0MDAlm2jWP62s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730453612; c=relaxed/simple;
	bh=0Xk1FMIxt4u/7NH74O6dGs0BVncVKfc2uv9GQ8Fe3+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kgrv55HyHEeqCGvud/O0wvsZ1Me4lN9HNqg9yV6+Ed3+U9A1WANxr51TdiSzKBzfHt1hQs3b+yVdytgqW/nXEFeE0knLTDAAb7Lm4FII3x6LksCJV8witvYgUuS8I8k5W5yPkjek4HYC2hzdN+ldI1Y9jbrOeyExG56aY8Je09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWKIVu5+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWKIVu5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730453611; x=1761989611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Xk1FMIxt4u/7NH74O6dGs0BVncVKfc2uv9GQ8Fe3+A=;
  b=VWKIVu5+vmgcRqFzbONZNcgCrxEJIZcckFESksFE9QAyICGDn/4siiXD
   xmoTDQY503bi4k5irL+BwFN+oxQchuyQ2PT7lVxbXJFYtlH9vDqijQ7su
   HJvyFmkUfGSa/LUX6FUixCMAgbQpxpvYteJWivNhEprjBfReDNPU7tlVj
   KotsuXrWB/l0DeAu2po2iTZw0KdE57qrNP+AtQJFELYm5VhRgXmRnCZMC
   sUkLeX9lgY7bM6CiCUoNa7OgnHG44p3YSYQOthbl9zxqjmdWSNUQKYT/d
   ZipiBnK80PvkS0rQTKVwDdFHnE1D4xP/FfZ/qQgDuyPLsh4+QEpFxnCfb
   Q==;
X-CSE-ConnectionGUID: GnLPOq5TSoyhQHfFX3n40g==
X-CSE-MsgGUID: 7vmsE6uARsylExUeapCp+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33908158"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33908158"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 02:33:31 -0700
X-CSE-ConnectionGUID: eoAzJZp4Rg6RMLmqnPzV2Q==
X-CSE-MsgGUID: 2or6aD6/RYiHcwuLkbrWzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83343675"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2024 02:33:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6o23-000hMR-1J;
	Fri, 01 Nov 2024 09:33:27 +0000
Date: Fri, 1 Nov 2024 17:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-group 59/60] io_uring/filetable.h:44:45:
 warning: left shift count >= width of type
Message-ID: <202411011724.VIxc4mxP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-group
head:   208960febed8e8a2deaadfc0135e934373b16532
commit: 3f048388f63bf3e751c0eca2a55db050c558da61 [59/60] io_uring: extend io_uring_sqe flags bits
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20241101/202411011724.VIxc4mxP-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011724.VIxc4mxP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011724.VIxc4mxP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.h:13,
                    from io_uring/io_uring.c:83:
   io_uring/filetable.h: In function 'io_slot_flags':
>> io_uring/filetable.h:44:45: warning: left shift count >= width of type [-Wshift-count-overflow]
      44 |         return (node->file_ptr & ~FFS_MASK) << REQ_F_SUPPORT_NOWAIT_BIT;
         |                                             ^~


vim +44 io_uring/filetable.h

3f1a546444738b Jens Axboe        2024-10-25  43  
3f1a546444738b Jens Axboe        2024-10-25 @44  	return (node->file_ptr & ~FFS_MASK) << REQ_F_SUPPORT_NOWAIT_BIT;
4bfb0c9af832a1 Christoph Hellwig 2023-06-20  45  }
a4ad4f748ea962 Jens Axboe        2022-05-25  46  

:::::: The code at line 44 was first introduced by commit
:::::: 3f1a546444738b21a8c312a4b49dc168b65c8706 io_uring/rsrc: get rid of per-ring io_rsrc_node list

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
