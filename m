Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315B0377ED4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781257556; cv=none; b=m4gGl0CCVJOuUlMJ8RBqB4vsesGqP4ni3lFevNQIg86yobaGsOQD5QgeOm17ADFlTAVs+9xGwFlOlURYh6Ut2T2+rtUNc7foJ5xM7AHBrwFEmaLXiTNF35TtgWWPi+JmOu4EzfyJ1eBaxOfc+gQCcz3iIPHTI5rIu6u6y5b49Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781257556; c=relaxed/simple;
	bh=5kZYGlAIeZV0FMnxTw7YDi5SkMcsdsV5OoS4J4WqUhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lw29/rbe0X4EzMzCNo4DY+mblyHQeS2T4qg/wD7whuvf23t0Qh2ARWeizIXaE28JJHWY1+URWm9u7vzHCPr58XI1H6VlWoIKnNHeFsCSs17rY5/f9Of82irzAv7ipYqq3kndicHXzBKqTo3shdPxBeHSH9oCnAQsjhqVsoyomck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8ghxfMJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8ghxfMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781257555; x=1812793555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5kZYGlAIeZV0FMnxTw7YDi5SkMcsdsV5OoS4J4WqUhw=;
  b=F8ghxfMJsXI6ThJ3hc5BV6rtdQotX2NSzQ0Fv3fCk/ur3Kyf6TZGnwqM
   6J0pDO6cGGNTmQgMLa0LmVvdIeo930YNt2r2Qf70zewrOz22iWHX3kXSs
   U9gw+iauS/HAH86e2hdvWIWx321pCQUnY3FHKmpoza5CjruQEz11kTwKY
   MqnGHP7cnloAfb7h2hsBkavrpSGPa3uKDxEdmzm27hdvL5xvj1ao7pKDp
   CIc2AHXWO/BbV4Y6kQqk+m/S+QVX3X75WdHar+EER7IxanS7HlCM8dzMH
   dSYbF8b5VMDfnlfbdRRflABV4XIsPeQAw0yFFRJriCL2SDqlKuLuh9OPX
   g==;
X-CSE-ConnectionGUID: 2+D2my2xTjGmqBSnj9EAzg==
X-CSE-MsgGUID: WMuwZi0xTOuAu+uI6Y7Onw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81992480"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="81992480"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 02:45:53 -0700
X-CSE-ConnectionGUID: XwyvusprSpCsORDhyLtpDQ==
X-CSE-MsgGUID: vltGDbzWR7+p4T3OmRE3wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="248664732"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jun 2026 02:45:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXySS-00000000OZl-3xFe;
	Fri, 12 Jun 2026 09:45:48 +0000
Date: Fri, 12 Jun 2026 17:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Zeng <kylebot@openai.com>, jfs-discussion@lists.sourceforge.net
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Dave Kleikamp <shaggy@kernel.org>, outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>, stable@vger.kernel.org
Subject: Re: [PATCH] jfs: validate active AG before updating db_active
Message-ID: <202606121758.6bifYIqm-lkp@intel.com>
References: <20260611212956.10206-1-kylebot@openai.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611212956.10206-1-kylebot@openai.com>

Hi Kyle,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master kleikamp-shaggy/jfs-next v7.1-rc7 next-20260611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyle-Zeng/jfs-validate-active-AG-before-updating-db_active/20260612-054255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260611212956.10206-1-kylebot%40openai.com
patch subject: [PATCH] jfs: validate active AG before updating db_active
config: s390-randconfig-002-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121758.6bifYIqm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121758.6bifYIqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121758.6bifYIqm-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/jfs/file.c: In function 'jfs_get_active_ag':
>> fs/jfs/file.c:52:3: error: implicit declaration of function 'jfs_error'; did you mean 'xas_error'? [-Werror=implicit-function-declaration]
      jfs_error(inode->i_sb,
      ^~~~~~~~~
      xas_error
   cc1: some warnings being treated as errors


vim +52 fs/jfs/file.c

    43	
    44	static int jfs_get_active_ag(struct inode *inode, int *agp)
    45	{
    46		struct jfs_inode_info *ji = JFS_IP(inode);
    47		struct jfs_sb_info *sbi = JFS_SBI(inode->i_sb);
    48		struct bmap *bmap = sbi->bmap;
    49		u64 ag = BLKTOAG(addressPXD(&ji->ixpxd), sbi);
    50	
    51		if (ag >= bmap->db_numag) {
  > 52			jfs_error(inode->i_sb,
    53				  "inode %lu has invalid active ag %llu\n",
    54				  inode->i_ino, (unsigned long long)ag);
    55			return -EIO;
    56		}
    57	
    58		*agp = ag;
    59		return 0;
    60	}
    61	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
