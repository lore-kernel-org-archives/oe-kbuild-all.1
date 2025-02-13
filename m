Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB6C18C0C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739427346; cv=none; b=EhNFOFtb5UEmy/7dHBNdwLEG6/6N8ZHi3RsmJLSMIkapg1j2b7frBCvWWabYeZv3I3rKXj5F7lFPCksiOiV12Yp1PPvOnSezSx152AojLGFBStHCCTOPRUWVLOI1ZyF2ndjWsxTzKGFBqZsAbMIBfpAiWF7/j1PyQucJFEdGWJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739427346; c=relaxed/simple;
	bh=l0ZHarXwr86T215QAMDqiAMhYEnAW2FEcXIRkYMUhC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZFE2E8hwsBLEdmEXAaJhUK1bg3A3HUxI/ww4fICMrn34DXZCInTZe/786PnmdQTK9noCUZBw68bTp4iHoLdvcU0+M0W++ggrzO8L/ZnHha8qNSO3TwU9Pn6Kl4Yu8tGTLhR1OE4ZorRdOGNFkN7qV0gwGrg/fjA5EyzfgVsVWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJe4zJYX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJe4zJYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739427345; x=1770963345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l0ZHarXwr86T215QAMDqiAMhYEnAW2FEcXIRkYMUhC8=;
  b=bJe4zJYXLvSQXDW7ly799Effpg9NjoXdKpnhOP/TfrHSEKhrJ2WEffUA
   wiw3LwrI7lDq7VClaMmvSwEeilZfvkA+RO7M79745LohFRr0oaOFZQvVQ
   ++S6BypU0SFJQJ3VeOlWVvpA5gc6BnFIxdRluxUf71K+pdgUQ6JdLaLpg
   by9QuUCyHe8xX5TEZYmZfoVpPiMaZuMIAEGXZjoaPF8/Y7Ta/5lfjDEVc
   z9nS2jzfE5q4hazjlcOfiNtqNb6cXneZ9xhsS31YWvrWs9OKxUF4StqKt
   Kz4UZ5ebdfI3ep9QBB/FOUos6z02WtuVX6P7a31+8Bqkde9TsztI+UgDz
   Q==;
X-CSE-ConnectionGUID: oR3XoKDjQaCMpbae9cQfjQ==
X-CSE-MsgGUID: HI+IInRoR0GBvgDVRG78Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="42952217"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="42952217"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 22:15:45 -0800
X-CSE-ConnectionGUID: sjibTcmQQv2Yu38J74C9SQ==
X-CSE-MsgGUID: vuWXo8s4QlGYH1pWolwf8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113234183"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Feb 2025 22:15:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiSVh-0016cp-1O;
	Thu, 13 Feb 2025 06:15:41 +0000
Date: Thu, 13 Feb 2025 14:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kundan Kumar <kundan.kumar@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/3] fs: modify writeback infra to work with wb_ctx
Message-ID: <202502131351.uG7U2prq-lkp@intel.com>
References: <20250212103634.448437-3-kundan.kumar@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212103634.448437-3-kundan.kumar@samsung.com>

Hi Kundan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 57d357a7663c4025c68ae07974b679d84e2d5d1a]

url:    https://github.com/intel-lab-lkp/linux/commits/Kundan-Kumar/writeback-add-parallel-writeback-infrastructure/20250212-211021
base:   57d357a7663c4025c68ae07974b679d84e2d5d1a
patch link:    https://lore.kernel.org/r/20250212103634.448437-3-kundan.kumar%40samsung.com
patch subject: [RFC 2/3] fs: modify writeback infra to work with wb_ctx
config: arc-randconfig-002-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131351.uG7U2prq-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131351.uG7U2prq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131351.uG7U2prq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fs-writeback.c:130: warning: Function parameter or struct member 'p_wb_ctx' not described in 'inode_io_list_move_locked_ctx'
>> fs/fs-writeback.c:334: warning: Function parameter or struct member 'p_wb_ctx' not described in 'inode_cgwb_move_to_attached_ctx'
>> fs/fs-writeback.c:334: warning: expecting prototype for inode_cgwb_move_to_attached(). Prototype was for inode_cgwb_move_to_attached_ctx() instead


vim +130 fs/fs-writeback.c

d6c10f1fc8626d Tejun Heo    2015-05-22  115  
d6c10f1fc8626d Tejun Heo    2015-05-22  116  /**
4f84ead3d4293c Kundan Kumar 2025-02-12  117   * inode_io_list_move_locked_ctx - move an inode onto a wb_ctx IO list
d6c10f1fc8626d Tejun Heo    2015-05-22  118   * @inode: inode to be moved
d6c10f1fc8626d Tejun Heo    2015-05-22  119   * @wb: target bdi_writeback
bbbc3c1cfaf690 Wang Long    2017-12-05  120   * @head: one of @wb->b_{dirty|io|more_io|dirty_time}
d6c10f1fc8626d Tejun Heo    2015-05-22  121   *
c7f5408493aeb0 Dave Chinner 2015-03-04  122   * Move @inode->i_io_list to @list of @wb and set %WB_has_dirty_io.
d6c10f1fc8626d Tejun Heo    2015-05-22  123   * Returns %true if @inode is the first occupant of the !dirty_time IO
d6c10f1fc8626d Tejun Heo    2015-05-22  124   * lists; otherwise, %false.
d6c10f1fc8626d Tejun Heo    2015-05-22  125   */
4f84ead3d4293c Kundan Kumar 2025-02-12  126  static bool inode_io_list_move_locked_ctx(struct inode *inode,
d6c10f1fc8626d Tejun Heo    2015-05-22  127  					  struct bdi_writeback *wb,
4f84ead3d4293c Kundan Kumar 2025-02-12  128  					  struct list_head *head,
4f84ead3d4293c Kundan Kumar 2025-02-12  129  					  struct wb_ctx *p_wb_ctx)
d6c10f1fc8626d Tejun Heo    2015-05-22 @130  {
4f84ead3d4293c Kundan Kumar 2025-02-12  131  	struct list_head *pctx_b_dirty_time = &p_wb_ctx->pctx_b_dirty_time;
4f84ead3d4293c Kundan Kumar 2025-02-12  132  
4f84ead3d4293c Kundan Kumar 2025-02-12  133  
d6c10f1fc8626d Tejun Heo    2015-05-22  134  	assert_spin_locked(&wb->list_lock);
10e14073107dd0 Jchao Sun    2022-05-24  135  	assert_spin_locked(&inode->i_lock);
a9438b44bc7015 Jan Kara     2022-12-12  136  	WARN_ON_ONCE(inode->i_state & I_FREEING);
d6c10f1fc8626d Tejun Heo    2015-05-22  137  
c7f5408493aeb0 Dave Chinner 2015-03-04  138  	list_move(&inode->i_io_list, head);
d6c10f1fc8626d Tejun Heo    2015-05-22  139  
d6c10f1fc8626d Tejun Heo    2015-05-22  140  	/* dirty_time doesn't count as dirty_io until expiration */
4f84ead3d4293c Kundan Kumar 2025-02-12  141  	if (head != pctx_b_dirty_time)
4f84ead3d4293c Kundan Kumar 2025-02-12  142  		return wb_ctx_io_lists_populated(wb, p_wb_ctx);
d6c10f1fc8626d Tejun Heo    2015-05-22  143  
4f84ead3d4293c Kundan Kumar 2025-02-12  144  	wb_ctx_io_lists_depopulated(wb, p_wb_ctx);
d6c10f1fc8626d Tejun Heo    2015-05-22  145  	return false;
d6c10f1fc8626d Tejun Heo    2015-05-22  146  }
d6c10f1fc8626d Tejun Heo    2015-05-22  147  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
