Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3E9322C81
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762524250; cv=none; b=dmfoPh8foF/HxU3EuDHkbMHrI+Bs3KOSEVtV4wlCOBrgMnCEj/EVK0R2yDyqfxNu8q/QR1rxPOC/bIR+mlQH/KRJkadHaf65kWsiX6EINr3WUemGoQnQHpRSJKv15eh9iTGVD1gJelZc/zXhGBxVTqkrUmOW4HLzjv78GkRbFw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762524250; c=relaxed/simple;
	bh=UfMAtfXAXsTNx78xuCM/1JF7fi8Lm5mYpL5EFsKWfiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhkrXeF7Qz7GvK0siI/LhNbENhjC5wiXQnC1Pw0aKIrLyxsM+hHewnMCqZqAjya5kVmiKvZ37NmiRzfmnmM3sSkMqw6iPJPHKxvXd50mcCGgK0bo1p5skTgC4Hcby94wbgu/tVZ/GS6tsCLfds4fjqhOOESxYPf1HX9tP+984AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lP/8CxyM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lP/8CxyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762524249; x=1794060249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UfMAtfXAXsTNx78xuCM/1JF7fi8Lm5mYpL5EFsKWfiM=;
  b=lP/8CxyMA9QVjvoWDCFlh/sZtd6O0TCjEVSv2MiaG/vQvhWnWEVvRBz/
   cY1E4JL7UuHKpL6xSDXsQpIsJ5D7b0b+pMdU4vX/tZNilEYv2ZJsuqwt2
   cG0VJ84rRA0qhPzOCdB3Dcd2vZAD4r92485Q8DgcPkGFtt7FdMmmTyQIK
   RdlTJsIUaLpNS6+h9dedE46mxRUdhpc8+uryvwWQvr5dsC0n5NUkQXSj3
   meg+ycqWh18dnfqGmwf+yaVHZM+ar+an9S5yj6jvXIL9DjpV8K/qdcRv7
   ABaK31640FzFZTagFC0EgV+K9wasQLI9LlnXka/tfBtIVutg+7v9ozhd+
   w==;
X-CSE-ConnectionGUID: ZqbTnvkuRh2u7bQbecqvMA==
X-CSE-MsgGUID: Y3XvhKNcRU+f9dJF/xIW8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="76122009"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="76122009"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 06:04:08 -0800
X-CSE-ConnectionGUID: jhJt2EqgSc67m5LIMqpsoA==
X-CSE-MsgGUID: HgwGF+83S6WbD38cbfvkcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="188311345"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Nov 2025 06:04:06 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHN4O-000VBI-1h;
	Fri, 07 Nov 2025 14:04:04 +0000
Date: Fri, 7 Nov 2025 22:03:56 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC nf-next 06/11] netfilter: conntrack: move nf_conntrack_hash
 to struct net
Message-ID: <202511072102.lOOFMVU8-lkp@intel.com>
References: <20251105164805.3992-7-fw@strlen.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105164805.3992-7-fw@strlen.de>

Hi Florian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251105]
[cannot apply to nf-next/master netfilter-nf/main linus/master horms-ipvs/master v6.18-rc4 v6.18-rc3 v6.18-rc2 v6.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/netfilter-netns-nf_conntrack-per-netns-net-netfilter-nf_conntrack_max-sysctl/20251106-014030
base:   next-20251105
patch link:    https://lore.kernel.org/r/20251105164805.3992-7-fw%40strlen.de
patch subject: [RFC nf-next 06/11] netfilter: conntrack: move nf_conntrack_hash to struct net
config: s390-randconfig-001-20251107 (https://download.01.org/0day-ci/archive/20251107/202511072102.lOOFMVU8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511072102.lOOFMVU8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511072102.lOOFMVU8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/netfilter/nf_conntrack_zones.h:6,
                    from net/openvswitch/flow.c:38:
   include/net/netfilter/nf_conntrack.h: In function 'nf_conntrack_get_ht':
>> include/net/netfilter/nf_conntrack.h:344:13: error: 'struct net' has no member named 'ct'
      hptr = net->ct.nf_conntrack_hash;
                ^~
   include/net/netfilter/nf_conntrack.h:345:18: error: 'struct net' has no member named 'ct'
      hptr = init_net.ct.nf_conntrack_hash;
                     ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [m]:
   - REGULATOR_RT5133 [=m] && REGULATOR [=y] && I2C [=m] && GPIOLIB [=y] && OF [=y]


vim +344 include/net/netfilter/nf_conntrack.h

   332	
   333	/* must be called with rcu read lock held */
   334	static inline void
   335	nf_conntrack_get_ht(struct net *net, struct hlist_nulls_head **hash,
   336			    unsigned int *hsize)
   337	{
   338		struct hlist_nulls_head *hptr;
   339		unsigned int sequence, hsz;
   340	
   341		do {
   342			sequence = read_seqcount_begin(&nf_conntrack_generation);
   343			hsz = nf_conntrack_htable_size;
 > 344			hptr = net->ct.nf_conntrack_hash;
   345			hptr = init_net.ct.nf_conntrack_hash;
   346		} while (read_seqcount_retry(&nf_conntrack_generation, sequence));
   347	
   348		*hash = hptr;
   349		*hsize = hsz;
   350	}
   351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
