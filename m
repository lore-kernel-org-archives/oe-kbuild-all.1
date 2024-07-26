Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40F1200C7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 06:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721975444; cv=none; b=aMEDfLSxMcGBzU1NCGfzOsB5ED/JKwOAq7ThlMPBSk9QSTactXoygpw628k8f9YQjk0z/uT/nPrKgIIMbuy6IrrI6UKDsebiYlvIjXNvvbc+tUYlt/Tll87aFm7Llpu9GED0BUxMFRexvjvAActIwxFFuNlQMTzZUXkTvjgxceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721975444; c=relaxed/simple;
	bh=2pG28zgYzLiYA/D5dHg8QQNibCJimfv235bZ3NYIxjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpvuBHnLq33n3C/CVIE2qHasf/H3DzXdrbte03F/gagkH9I2pgDp7jVRJG61bWI9Hd2+0WJnY1I7QgjUP771GkZRDaKg/vkob/aNzkhdMTSc4HRmipfLcPrNYbwhVN2CpTb3Z19aXJoFKKl0mjqTcB8ji7fGGuykzOgvjmQQZH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFUIHDnw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFUIHDnw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721975442; x=1753511442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2pG28zgYzLiYA/D5dHg8QQNibCJimfv235bZ3NYIxjQ=;
  b=dFUIHDnwd2H1TeH/ipD/QfruX7BAht8HP6ocZrtKwC+wqfyXxj9Kj1bP
   iTL7rFd3IRqGcsBc/eryv2lNcmuCAMX2y+b0vJ0IidnEXpypgbLyvWbJg
   ctfBF3O8xvtYZt/9/j3NgcrBluCy3Cd9ZFHmUWw8iKC5Ng6GJzU9SlhI8
   mXxWfEhGqbsSn91D8kpTY4iNqIE+J6DLaE/teNg1+WwFjMhJt87R2zhF0
   vfFmgZGjbyZN54rgdp6tNbnpgoEZfgbYbeNGHvtCp8w+nTA8+bm6DzwOe
   A6IaXZbXUUjcRky7cnnR0i/2LBdB4Em3hRaFPg5njlH7JSD/umrYhQqHN
   Q==;
X-CSE-ConnectionGUID: qD53cd0XT2S96WAoJhwzQA==
X-CSE-MsgGUID: Nk0+gCcnSAWxMGxEQURMUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19714540"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="19714540"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 23:30:41 -0700
X-CSE-ConnectionGUID: JVIgl+2pSXWat9a34RqK0g==
X-CSE-MsgGUID: FHJ13tAAT1SJDy8Wystk5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="53090284"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Jul 2024 23:30:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXETO-000orI-0s;
	Fri, 26 Jul 2024 06:30:38 +0000
Date: Fri, 26 Jul 2024 14:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 10/10] fsnotify: generate pre-content permission event on
 page fault
Message-ID: <202407261445.0FB9iQPW-lkp@intel.com>
References: <1bc2855779e7ba1d80592be7d6257b43f1a91886.1721931241.git.josef@toxicpanda.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bc2855779e7ba1d80592be7d6257b43f1a91886.1721931241.git.josef@toxicpanda.com>

Hi Josef,

kernel test robot noticed the following build errors:

[auto build test ERROR on jack-fs/fsnotify]
[also build test ERROR on pcmoore-selinux/next akpm-mm/mm-everything linus/master v6.10 next-20240726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/fanotify-don-t-skip-extra-event-info-if-no-info_mode-is-set/20240726-055009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git fsnotify
patch link:    https://lore.kernel.org/r/1bc2855779e7ba1d80592be7d6257b43f1a91886.1721931241.git.josef%40toxicpanda.com
patch subject: [PATCH 10/10] fsnotify: generate pre-content permission event on page fault
config: i386-buildonly-randconfig-001-20240726 (https://download.01.org/0day-ci/archive/20240726/202407261445.0FB9iQPW-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407261445.0FB9iQPW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407261445.0FB9iQPW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/notify/fsnotify.c:31:6: error: redefinition of 'fsnotify_file_has_content_watches'
      31 | bool fsnotify_file_has_content_watches(struct file *file)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/notify/fsnotify.c:14:
   include/linux/fsnotify_backend.h:906:20: note: previous definition of 'fsnotify_file_has_content_watches' with type 'bool(struct file *)' {aka '_Bool(struct file *)'}
     906 | static inline bool fsnotify_file_has_content_watches(struct file *file)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fsnotify_file_has_content_watches +31 fs/notify/fsnotify.c

    30	
  > 31	bool fsnotify_file_has_content_watches(struct file *file)
    32	{
    33		struct inode *inode = file_inode(file);
    34		struct super_block *sb = inode->i_sb;
    35		struct mount *mnt = real_mount(file->f_path.mnt);
    36		u32 mask = inode->i_fsnotify_mask;
    37	
    38		mask |= mnt->mnt_fsnotify_mask;
    39		mask |= sb->s_fsnotify_mask;
    40	
    41		return !!(mask & FSNOTIFY_PRE_CONTENT_EVENTS);
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
