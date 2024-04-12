Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AD6168DE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 05:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712901034; cv=none; b=Vhj98nP9ImI1y4iBZQirY8gSzxfnuJSmYD7jso50XbEF0jzaVNyF40uINOYAmGGfpahjiCmO0qR2/iQRC2br2bDFQ8AiXq0jYRL51F6h4qN8obBJAZfvRbk9yPPTrtFDxF8shymwlr7pgiBPFENYLqoi7KKIGElXS9X9eNdwHc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712901034; c=relaxed/simple;
	bh=hJ3wFNAlO4T/XbnyEhQOrsNBzmstACsUndQMIJwLV6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NipMRqLeEZQ8vyc8Gfxwa55Jw7T5ERLzm3R9ESfuvlWu9/ohRi75w68ykWDBnhe+LTqIhpry2ZKpR4Vk+tNkqS0rcY3sNWy+5c7hvg5qYMuoP0gl3BxS7EsqDFfSQplQxP8ZroXi3xCpKW1ycrj/Rn7KCckeZ6kAh8AXShKZWc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqwkjMXF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqwkjMXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712901033; x=1744437033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hJ3wFNAlO4T/XbnyEhQOrsNBzmstACsUndQMIJwLV6s=;
  b=jqwkjMXFiVUCqBgNx1+4rkhlD0ZZs0GaLmVClHLpRAwXrwxeSJ4Si1Fw
   IUtxx3l1ttzMgnDd73tNQrgt77eSLH6cfBNm6uHVZpb8ekIPtIopfFrEE
   5Qzk/aRm1rOqz21LXKisDAWmU3qH+ccTaMAjzG+eZLNnt6RnQDoZbU1KM
   KCMT/TbzGyGRWWmDNyCWX9GdSQU69vdCTClKS297vvX/keookTjLVUYPj
   z2/8vxCc5jbezvq3WShhrWGcnXDDRs7lkDpL16hGT4/KQSvpKULIUrkdJ
   FVj5sqHf3WwYKGIXqT4tWHUegfBHHiN7rI8PoXlNTq16ApQSf6ZonrPEw
   g==;
X-CSE-ConnectionGUID: t5W+AAytQvSexusI1JElvw==
X-CSE-MsgGUID: P/HlpYz8SUG5YzyQlipaSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19765806"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="19765806"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 22:50:32 -0700
X-CSE-ConnectionGUID: 900BzE8xRuunyCEfLhPpgA==
X-CSE-MsgGUID: W/2Yoz6fRwSxzpQvvc+KmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="21183909"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Apr 2024 22:50:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv9nx-0009Qr-0g;
	Fri, 12 Apr 2024 05:50:29 +0000
Date: Fri, 12 Apr 2024 13:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: cel@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 2/2] libfs: Clean up the simple_offset API
Message-ID: <202404121313.3QGwuj72-lkp@intel.com>
References: <20240411182611.203328-3-cel@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411182611.203328-3-cel@kernel.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on brauner-vfs/vfs.all linus/master v6.9-rc3 next-20240411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cel-kernel-org/shmem-Fix-shmem_rename2/20240412-024237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240411182611.203328-3-cel%40kernel.org
patch subject: [PATCH v1 2/2] libfs: Clean up the simple_offset API
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240412/202404121313.3QGwuj72-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121313.3QGwuj72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121313.3QGwuj72-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/shmem_fs.h:6,
                    from mm/shmem.c:36:
   include/linux/swap.h:568:6: warning: no previous prototype for 'swap_free_nr' [-Wmissing-prototypes]
     568 | void swap_free_nr(swp_entry_t entry, int nr_pages)
         |      ^~~~~~~~~~~~
>> mm/shmem.c:2483:27: warning: 'shmem_get_offset_ctx' defined but not used [-Wunused-function]
    2483 | static struct offset_ctx *shmem_get_offset_ctx(struct inode *inode)
         |                           ^~~~~~~~~~~~~~~~~~~~


vim +/shmem_get_offset_ctx +2483 mm/shmem.c

e408e695f5f1f6 Theodore Ts'o 2022-07-14  2482  
a2e459555c5f9d Chuck Lever   2023-06-30 @2483  static struct offset_ctx *shmem_get_offset_ctx(struct inode *inode)
a2e459555c5f9d Chuck Lever   2023-06-30  2484  {
a2e459555c5f9d Chuck Lever   2023-06-30  2485  	return &SHMEM_I(inode)->dir_offsets;
a2e459555c5f9d Chuck Lever   2023-06-30  2486  }
a2e459555c5f9d Chuck Lever   2023-06-30  2487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
