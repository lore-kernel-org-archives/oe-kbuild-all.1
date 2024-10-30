Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A251E1A2B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730278686; cv=none; b=BBwjCeH6A5RMRjjHJVEFTI+5T+BV9BWkZYN9jpyOhwuEVV2MmwbvXieppqV5TBPXkJnIxZfIbjUOEbTGRAyZdBSX9CW2TUlPoW1T9qD292AOQCfqhnyxPfkOYn0u+VS0GMRHtmtL6/Z0OMcdj4++hKY9Fbop9ndQ629ZWebSJv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730278686; c=relaxed/simple;
	bh=r+D8nkciWlzL4PKMhfd8+jlrZ33x+mXVuM6U2F1xq44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K0287ocZFhgpuV4EzF+CftVGVxhSLBQUqRqdxu+M/b3BCEK5Hj76O+hSwFSxbxAAkMvjhNs3hyJwimDGOyH+1VTXJvVmNX29HeAwbIZYTmiuZP8kd929Q7b8TLTb7rjalDiVfV5jb7WyF5ZCaoknuHjHuUBHbLX+H6qynzgIznY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZainNTCK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZainNTCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730278684; x=1761814684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+D8nkciWlzL4PKMhfd8+jlrZ33x+mXVuM6U2F1xq44=;
  b=ZainNTCKDPPXjK7BqeeUS+seI/c8+rnFdy/zEKLdHJs9SJQkLrOzUQMN
   iuh0Ubm6Vb3JQ/KloAyBzNiEGDevlDlTU2TRy9dXXKfWQntAhkRzQGJWn
   N3530vi8W4twIqPh/QJQWK84um2w2QKUrcB0J9bXlEfhrETTmvGn1I4iv
   pagZuUZB5oXstPIDLQGMzO4+wiY7mJEvmys0XWev9EQnqB3gtH3NJx36F
   jMueO5v7hFWDHXXVm2Jtrhkm8lzdS2/JkGhS2DQj9ksAWMpSPtR4tbBGI
   4w91DoRcRT2DEV+dSQCYcT9dToi6Qr/gNkZS9n+dGatX0Bb/Mwbbws0/q
   A==;
X-CSE-ConnectionGUID: LT1jbi/lROqOHlnGTg1n0Q==
X-CSE-MsgGUID: RdQHXKvHRzOr2UjIjJlQCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="47443089"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="47443089"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 01:58:04 -0700
X-CSE-ConnectionGUID: SzWV4yuIR9Ct6YAwWWcUCA==
X-CSE-MsgGUID: mRIoUsV7QMCOT8NqPu//ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="82176739"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2024 01:58:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t64We-000egi-0M;
	Wed, 30 Oct 2024 08:58:00 +0000
Date: Wed, 30 Oct 2024 16:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6997/7771] mm/workingset.c:598:38: error:
 implicit declaration of function 'folio_memcg_charged'; did you mean
 'folio_memcg_check'?
Message-ID: <202410301614.VKluIqA5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6fb2fa9805c501d9ade047fc511961f3273cdcb5
commit: b4fa93fbd1dc5828d3a21ec45d9a6386058181de [6997/7771] memcg: workingset: remove folio_memcg_rcu usage
config: alpha-randconfig-r054-20241030 (https://download.01.org/0day-ci/archive/20241030/202410301614.VKluIqA5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410301614.VKluIqA5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410301614.VKluIqA5-lkp@intel.com/

Note: the linux-next/master HEAD 6fb2fa9805c501d9ade047fc511961f3273cdcb5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   mm/workingset.c: In function 'workingset_activation':
>> mm/workingset.c:598:38: error: implicit declaration of function 'folio_memcg_charged'; did you mean 'folio_memcg_check'? [-Werror=implicit-function-declaration]
     598 |         if (mem_cgroup_disabled() || folio_memcg_charged(folio))
         |                                      ^~~~~~~~~~~~~~~~~~~
         |                                      folio_memcg_check
   cc1: some warnings being treated as errors
--
>> drivers/md/dm-vdo/int-map.c:85: error: Cannot parse struct or union!
   drivers/md/dm-vdo/int-map.c:328: warning: Function parameter or struct member '__always_unused' not described in 'search_hop_list'
   drivers/md/dm-vdo/int-map.c:328: warning: Excess function parameter 'map' description in 'search_hop_list'
   drivers/md/dm-vdo/int-map.c:459: warning: Function parameter or struct member '__always_unused' not described in 'move_empty_bucket'
   drivers/md/dm-vdo/int-map.c:459: warning: Excess function parameter 'map' description in 'move_empty_bucket'


vim +598 mm/workingset.c

   587	
   588	/**
   589	 * workingset_activation - note a page activation
   590	 * @folio: Folio that is being activated.
   591	 */
   592	void workingset_activation(struct folio *folio)
   593	{
   594		/*
   595		 * Filter non-memcg pages here, e.g. unmap can call
   596		 * mark_page_accessed() on VDSO pages.
   597		 */
 > 598		if (mem_cgroup_disabled() || folio_memcg_charged(folio))
   599			workingset_age_nonresident(folio_lruvec(folio), folio_nr_pages(folio));
   600	}
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
