Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E53429A1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 05:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730005814; cv=none; b=YTzfD+3ldQ4B+1JBmGM07LN/SRE1RfM14tHDy/NV3gGrIyXCRdmmlu3TP1XxvT0rrKDc88GL4KXlNQ4lCcGiIVzSQn5Tx0XUh01ua2s7pB+If8Sc1A6TqE3t2hvy9R7QhhuKpXLUKw2PA3cbAPQMZGWvXAZw7SRVCa39c5K2U4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730005814; c=relaxed/simple;
	bh=WMqSbS6djQLe3YeDbaCq1MyaSCrK/ih7T5oYj05ohi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Usqvm+ANrr81leTX42wTrydbpylzIRnoXWroAwQ03+MDYWp6aYgUgFLM0rnS4Jfs1Is7z6mCqaGdm/pcopnicQsZPxXKkCQCfUri10cOvODXd/3Zz4SGHFqn79z9dmOTGS/B/5Fadu3yx1KHPhQ4utJ1aboFx+G+OES/9+4cV1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F36QNWdu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F36QNWdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730005812; x=1761541812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WMqSbS6djQLe3YeDbaCq1MyaSCrK/ih7T5oYj05ohi8=;
  b=F36QNWduTptF1cGCNEqKSpIE8/N6r3guQOhH56Egrs+89JiGi2qRUuZN
   Ru0h6OLDxpfCCGGk2q/k/X78skL0ukbwwf/HPl0DcbAc7qimEG9QzLw+c
   ALhckIkVWptBlCsQafdOktrNG3s4VsBo9qf/X+MNPJvfQB7/xA9CiKh95
   +ZTICcakrxKU3o3Y+aKz+erQqhwYKO42+SQA3rn/47X89Wv0qS4NWVTDB
   6dqkNrephOoIz1ydiWHFREkVvWtci7pcpgfcTfmqwINJvwhpy+VOlHtjW
   iKpjNlkRgZYoKzmF/MWRu5z+RmelNsHJx4CppulHkzBap2dS1JPqtekrP
   Q==;
X-CSE-ConnectionGUID: /5Nx7YDPQeiz961NF5yuzA==
X-CSE-MsgGUID: V0VY5AeeQPaBZAADXjT/zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="32492531"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="32492531"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 22:10:11 -0700
X-CSE-ConnectionGUID: BRRCL2s2TN6MzsjaOsUh2A==
X-CSE-MsgGUID: gbcFEYwOSyKhUYH+bzJDiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="80921918"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2024 22:10:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4vXU-000aO4-0H;
	Sun, 27 Oct 2024 05:10:08 +0000
Date: Sun, 27 Oct 2024 13:09:15 +0800
From: kernel test robot <lkp@intel.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] memcg: workingset: remove folio_memcg_rcu usage
Message-ID: <202410271316.RPNBjlOR-lkp@intel.com>
References: <20241026163707.2479526-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026163707.2479526-1-shakeel.butt@linux.dev>

Hi Shakeel,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shakeel-Butt/memcg-workingset-remove-folio_memcg_rcu-usage/20241027-003815
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241026163707.2479526-1-shakeel.butt%40linux.dev
patch subject: [PATCH v2] memcg: workingset: remove folio_memcg_rcu usage
config: sh-secureedge5410_defconfig (https://download.01.org/0day-ci/archive/20241027/202410271316.RPNBjlOR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271316.RPNBjlOR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271316.RPNBjlOR-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/workingset.c: In function 'workingset_activation':
>> mm/workingset.c:598:38: error: implicit declaration of function 'folio_memcg_charged'; did you mean 'folio_memcg_check'? [-Werror=implicit-function-declaration]
     598 |         if (mem_cgroup_disabled() || folio_memcg_charged(folio))
         |                                      ^~~~~~~~~~~~~~~~~~~
         |                                      folio_memcg_check
   cc1: some warnings being treated as errors


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
