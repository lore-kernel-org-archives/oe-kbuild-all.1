Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE47EEC3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 15:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032841; cv=none; b=SSSWwwnEdx31iFqV5TIz/T7BC8s3D/OqU9TGjTzXtgMXEvoqqFB9ojV3lw9t4kfPTvw6QmIcmvuVlCsdP+FVdB54ULHlwnQQWi1KkAWr1rWfhn3P2RbOY8xq6fJnpG5WNEeeWzJIg9H07TD6oALiQkKTX4U0xP1J/oFtLsbeTy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032841; c=relaxed/simple;
	bh=uiCnDnNiKIAco9v6qpSv5J3po9i3rWfe/GTa8Dxcvwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dz9oz8zNYll33t52qCC3adiCd8rIzfNBDzI6FZ9UZtByGOshzmwRfvH+WjH5u1o3n9S2a95mn7iQDfluVIbGPQlkjvNCEus70cHskyfK/yTWqhEuu5b4fk1enTQMSM1sB01kGqc+eyCHmI1UyNz3ITkc0WX+65kH4239bEUKdB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2VOKmdn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2VOKmdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725032839; x=1756568839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uiCnDnNiKIAco9v6qpSv5J3po9i3rWfe/GTa8Dxcvwg=;
  b=U2VOKmdniAkocZwuvdTLMoZ5I7z74iijglmw4MscktUH/ePlOJBwLa1p
   KXX1Lziw1WnnuBKieFvSA5eTTJbQhQW2RLuyQXDjI+DXP3n8QuoQQLf+C
   UUJdVs5DjkHw4/uc2fnKtLwQyKjqDg+FfhZ1T71SnG/RWSag7WJTmeRP/
   6trObAR8wRB1b+X/QXuYky+jXurZ6V26ewxWdEheOofGc0FMhOrRDWLpC
   +eD1GGRiu41VHcyEZTgaxAHWSFCjYE93kK80yh5MZT6v6BTYy0MlhZcJq
   dk8pBKVYJR6vT3t+cUEeoZu1QFHcuu2fgRlspMVPatrL3xZRJUHNM3Jfn
   A==;
X-CSE-ConnectionGUID: MfEQ2OZhRpaYT7HkhQaYlg==
X-CSE-MsgGUID: AkGlXyxITC2zc1i/Hy3/8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="46187236"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="46187236"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 08:47:19 -0700
X-CSE-ConnectionGUID: I4UYG+87Qfa+7DgX0IABYA==
X-CSE-MsgGUID: MB/2X/7GR/+3GLIJpNyARw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="94744154"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Aug 2024 08:47:16 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk3qE-0001bq-0n;
	Fri, 30 Aug 2024 15:47:14 +0000
Date: Fri, 30 Aug 2024 23:47:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: Re: [PATCH 2/2] btrfs: constify more pointer parameters
Message-ID: <202408302358.rW7e7sjz-lkp@intel.com>
References: <e163012ed80a4f55ce17641586681c6ac4ff9018.1724859620.git.dsterba@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e163012ed80a4f55ce17641586681c6ac4ff9018.1724859620.git.dsterba@suse.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master next-20240830]
[cannot apply to v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Sterba/btrfs-rework-BTRFS_I-as-macro-to-preserve-parameter-const/20240828-234222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/e163012ed80a4f55ce17641586681c6ac4ff9018.1724859620.git.dsterba%40suse.com
patch subject: [PATCH 2/2] btrfs: constify more pointer parameters
config: i386-buildonly-randconfig-001-20240830 (https://download.01.org/0day-ci/archive/20240830/202408302358.rW7e7sjz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408302358.rW7e7sjz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408302358.rW7e7sjz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/block-group.c: In function 'btrfs_should_reclaim':
>> fs/btrfs/block-group.c:1762:51: warning: passing argument 1 of 'btrfs_zoned_should_reclaim' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1762 |                 return btrfs_zoned_should_reclaim(fs_info);
         |                                                   ^~~~~~~
   In file included from fs/btrfs/block-group.c:20:
   fs/btrfs/zoned.h:245:69: note: expected 'struct btrfs_fs_info *' but argument is of type 'const struct btrfs_fs_info *'
     245 | static inline bool btrfs_zoned_should_reclaim(struct btrfs_fs_info *fs_info)
         |                                               ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~


vim +1762 fs/btrfs/block-group.c

2ca0ec770c62b3 Johannes Thumshirn 2021-10-14  1758  
17ca64afd0470e David Sterba       2024-08-28  1759  static inline bool btrfs_should_reclaim(const struct btrfs_fs_info *fs_info)
3687fcb0752ac9 Johannes Thumshirn 2022-03-29  1760  {
3687fcb0752ac9 Johannes Thumshirn 2022-03-29  1761  	if (btrfs_is_zoned(fs_info))
3687fcb0752ac9 Johannes Thumshirn 2022-03-29 @1762  		return btrfs_zoned_should_reclaim(fs_info);
3687fcb0752ac9 Johannes Thumshirn 2022-03-29  1763  	return true;
3687fcb0752ac9 Johannes Thumshirn 2022-03-29  1764  }
3687fcb0752ac9 Johannes Thumshirn 2022-03-29  1765  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
