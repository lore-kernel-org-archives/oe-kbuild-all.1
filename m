Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358F12BF3F9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 09:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015620; cv=none; b=iesnMg6/zg6NeJJ5/QFhQXJs93pm8UCFd7i/iK5ULVPEcxR43epInbPwa+SomKcx5vryR5VvFQNOUD+w4FIz3NVYAeh9grHesZygnPAMQfog5diNw35irAj7GUadYOXNV6L0QXo/hcLd5d7BxmV5vEXoejA7iD45TVTFsuKwp6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015620; c=relaxed/simple;
	bh=YgN/OxCTnvDBVze2Okvi0PKmG7AbVmSYJ/mnM7PFhe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/ohjCR47mtlv9tRWogTyQQ0bo5Wluze1x1gp/vFLqZhFtGK0uGYbhSQU3ruMyjsmH1c8TeED7gl1CVmwrdDhdqkNf0HlSqZCi8d7EElFDAeePVxMo85i7fJSzbAtpZTXMCkks2YXr96fF20A6VrqhKfcFiUxOZFhtgwn5x0TXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blBG/awj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blBG/awj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751015619; x=1782551619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YgN/OxCTnvDBVze2Okvi0PKmG7AbVmSYJ/mnM7PFhe8=;
  b=blBG/awjh6cUDzbAMuPMwKJhJRXiNW+wUolNGCNloup+ZuYTUsLDs87A
   IkKAWmTgJ8YxXVQHX/U8quNTGMNh7+bBAud1F6LATz8FsYstPDJEIg1ME
   efSpFsFgXxW/ybGPtCKvU7DcVvUWcVycMZdVm3pzZE10pMK+neYxXKXJI
   adFKNdZBNqmODN2qx/kR6gfooSyVkRB6vB0knxE58Fk1Hqf1wX435ur9P
   ABosNF88HZjtMFydlflx9a/77JpqaVU11ofG7w3iHvs4drN/LNSAWrE8f
   Al4d7wM62bWUdUFYgJrriI07t9N7+aYFG+3dc9pfI50HAicYHLfHuRxeT
   w==;
X-CSE-ConnectionGUID: ZERWOfUFQ6Go9avbo9yLAQ==
X-CSE-MsgGUID: MwrYOxSVQpG2WvQ17He2jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53198450"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53198450"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 02:13:39 -0700
X-CSE-ConnectionGUID: EzwgJ2XdTaqQznt5kGMpLQ==
X-CSE-MsgGUID: 88JHtBrFSsuhFNYRZZIjjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="156797001"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jun 2025 02:13:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV59L-000W10-1c;
	Fri, 27 Jun 2025 09:13:35 +0000
Date: Fri, 27 Jun 2025 17:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/2] btrfs: open code RCU for device name
Message-ID: <202506271745.xBqbUHXo-lkp@intel.com>
References: <1e539dfd73debc86ddc7c1b1716f86ace14d51aa.1750858539.git.dsterba@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e539dfd73debc86ddc7c1b1716f86ace14d51aa.1750858539.git.dsterba@suse.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20250626]
[cannot apply to linus/master v6.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Sterba/btrfs-open-code-RCU-for-device-name/20250625-214017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/1e539dfd73debc86ddc7c1b1716f86ace14d51aa.1750858539.git.dsterba%40suse.com
patch subject: [PATCH v2 1/2] btrfs: open code RCU for device name
config: powerpc64-randconfig-r133-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271745.xBqbUHXo-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506271745.xBqbUHXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271745.xBqbUHXo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/btrfs/volumes.c:407:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got char const [noderef] __rcu *name @@
   fs/btrfs/volumes.c:407:21: sparse:     expected void const *objp
   fs/btrfs/volumes.c:407:21: sparse:     got char const [noderef] __rcu *name
>> fs/btrfs/volumes.c:661:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *device_path @@     got char const [noderef] __rcu *name @@
   fs/btrfs/volumes.c:661:43: sparse:     expected char const *device_path
   fs/btrfs/volumes.c:661:43: sparse:     got char const [noderef] __rcu *name
>> fs/btrfs/volumes.c:1022:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const *dev_path @@     got char const [noderef] __rcu *name @@
   fs/btrfs/volumes.c:1022:34: sparse:     expected char const *dev_path
   fs/btrfs/volumes.c:1022:34: sparse:     got char const [noderef] __rcu *name
>> fs/btrfs/volumes.c:1424:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const * @@     got char const [noderef] __rcu *name @@
   fs/btrfs/volumes.c:1424:42: sparse:     expected char const *
   fs/btrfs/volumes.c:1424:42: sparse:     got char const [noderef] __rcu *name
   fs/btrfs/volumes.c:2174:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *device_path @@     got char const [noderef] __rcu *name @@
   fs/btrfs/volumes.c:2174:31: sparse:     expected char const *device_path
   fs/btrfs/volumes.c:2174:31: sparse:     got char const [noderef] __rcu *name

vim +407 fs/btrfs/volumes.c

2208a378f35fea7 Ilya Dryomov    2013-08-12  402  
f2db4d5cb457b7d Filipe Manana   2023-04-26  403  static void btrfs_free_device(struct btrfs_device *device)
48dae9cf3f95acc David Sterba    2017-10-30  404  {
bbbf7243d62d8be Nikolay Borisov 2019-03-25  405  	WARN_ON(!list_empty(&device->post_commit_list));
9fc9a5a2dc4bd09 David Sterba    2025-06-09  406  	/* No need to call kfree_rcu(), nothing is reading the device name. */
9fc9a5a2dc4bd09 David Sterba    2025-06-09 @407  	kfree(device->name);
e965835c9829b11 Filipe Manana   2025-04-04  408  	btrfs_extent_io_tree_release(&device->alloc_state);
5b316468983dfa9 Naohiro Aota    2020-11-10  409  	btrfs_destroy_dev_zone_info(device);
48dae9cf3f95acc David Sterba    2017-10-30  410  	kfree(device);
48dae9cf3f95acc David Sterba    2017-10-30  411  }
48dae9cf3f95acc David Sterba    2017-10-30  412  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
