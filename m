Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534F614658F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 19:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729710721; cv=none; b=FuF5SwhNL705clLu47CCs9aMxt1ts2GOeIXv00N754HiM1dQR4l+RrEaLf/ctZ1eR1sst2QVxcXW/IPEuxYBdgX3u2L5aLjbc/nyDbdSViwzjoWFaxeHnd6BNHjOjwM7pjNBvX9/T8IjVrIeTEMO1LuPJU3qDo9OSPL1SXoLGJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729710721; c=relaxed/simple;
	bh=zK9Akr29F8tUTOb3wX23ag1UxqjlHMxhKeh0q145hYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ot72E0E5mEJW9n23PTSfbzcmve4KsWwNHzvhabJVWzt6zuPtYzjeDSEFVspHXkd5mHdMXLzM096dFK+TgEPqUMuMBdMu9ru74+cvZnSogU0FW0/7fOrodRVWFrlquIlnXWYpueoTt5op7imnF24Onl4hB+yncvU2Zajhja5nLHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ua+QWCKt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ua+QWCKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729710720; x=1761246720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zK9Akr29F8tUTOb3wX23ag1UxqjlHMxhKeh0q145hYY=;
  b=Ua+QWCKtifmGeUpZ+xPms5UoZzk4wPi/Yyo+5cG9n4X3zL3Eem16Q49F
   B7a5FMNbdpVUvjXl93xnabkYREKtElxr7bR+3uS7ewMBsPD3oRq9bkQrY
   2Rlh5KNXj0iYBMRagm8MYM0OrQFsnmNcMr7uCu3AMLWukM0r/TOeUm8fn
   AX2rr5gJNH89JnhMx4Aj/S/rxbRo/arCeSddb5qtvcat8pxk9BTZgtAVg
   k+mMH2JM/pxeU0+8YNtBIf2B00q3CBNBGqdp7BVFev8usc6LgJiwGtN9v
   7hBC7mWBjGxgSf07jWYFjccqxOXXLQmEPbjgUkCDNworPILPigFjYiIR0
   w==;
X-CSE-ConnectionGUID: VNblKRGBRg6lgHxvXTmzEQ==
X-CSE-MsgGUID: 13JrgXBXRHS7oOshuY3ugA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29098305"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29098305"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 12:11:59 -0700
X-CSE-ConnectionGUID: YLBJmPTqTJaTFUnJR5PKaQ==
X-CSE-MsgGUID: 5WP8NHBjQ5a3IE5hoaCc8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="85459106"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Oct 2024 12:11:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3glv-000VKK-2q;
	Wed, 23 Oct 2024 19:11:55 +0000
Date: Thu, 24 Oct 2024 03:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] btrfs: add new ioctl to wait for cleaned subvolumes
Message-ID: <202410240253.PbPbNgay-lkp@intel.com>
References: <20241021192826.10206-1-dsterba@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021192826.10206-1-dsterba@suse.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on linus/master v6.12-rc4 next-20241023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Sterba/btrfs-add-new-ioctl-to-wait-for-cleaned-subvolumes/20241022-033049
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20241021192826.10206-1-dsterba%40suse.com
patch subject: [PATCH] btrfs: add new ioctl to wait for cleaned subvolumes
config: x86_64-buildonly-randconfig-001-20241023 (https://download.01.org/0day-ci/archive/20241024/202410240253.PbPbNgay-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240253.PbPbNgay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240253.PbPbNgay-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/btrfs.h:1062:9: error: unknown type name 'u64'
    1062 |         u64 subvolid;
         |         ^~~
>> ./usr/include/linux/btrfs.h:1063:9: error: unknown type name 'u32'
    1063 |         u32 mode;
         |         ^~~
   ./usr/include/linux/btrfs.h:1064:9: error: unknown type name 'u32'
    1064 |         u32 count;
         |         ^~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
