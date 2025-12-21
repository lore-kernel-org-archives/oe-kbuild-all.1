Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0277C221F26
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 23:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766358625; cv=none; b=REIhPcDD7m+G7fBEdYdAV2Ko1fDQlimJjpcfsFdoXGecXQhOpVkZsYhXJ3gFaAhHylPK/g1Erbh0gq7D7MrywRAktEjqFq3koFlBUiqkVebAkNhkYe+XrgEnhmpRf8Wr7u08HaYqnAqqPKUsl9OTSrYJvnfYWT7S2rU5b1cp6O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766358625; c=relaxed/simple;
	bh=fHkh02+0rvsGN/WoqkQab0/nZwRBpU8bZa8Ue9X9nnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKHW9ZnJTMdZHSjZlhFxPq8qbEOGepCfFFqJYtqUqXnNTkcngAdac/5uc7b/5jWVQwr1LPOq6z+QN8Ge1L20pWdPqs4Q5w3h9u+g48gBmuNc52EGxEjaqQeKtxw3cU5EPrZQjpsMaNSnSO6fz7tJnFbTvB5OCcqQAUHFfaJSGdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrEgdJkZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrEgdJkZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766358623; x=1797894623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fHkh02+0rvsGN/WoqkQab0/nZwRBpU8bZa8Ue9X9nnA=;
  b=YrEgdJkZwFPbrTSHVI5lYeeN92MYEmJd0fbXYCrgyQKJI8j0SZRUDxZA
   7OwYbRWsxwLWpQ/G8lq4ZMLfofHtM9izG2j+fzeAHSjZqWV7ZZqCbyv1M
   WlZ1qcBDeZJhaRZDNh8ajrvsVWbveKy+skdyvg7HcH19B6qNA9mvDeuXj
   9fEgG63+EM3QXr8rBKiGQ1NvoEZ/FNHZHtsV9dr4SYpvPGJTxE29S4uLI
   jPapy/I21RIUsxAduFOwJsvNsVW2ORaEFn+EaSJrkCWPTWTt5x5e2G8M2
   KiRBYGMNyFPu5vVC0WyCPVjHZC10i7+BUVjtQCNdrEu4HXJAeD36hY1ZV
   A==;
X-CSE-ConnectionGUID: SgXarbHRTJWQooZ9TydYLA==
X-CSE-MsgGUID: UBkfIFkCSnqgslSwqnC+uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67418574"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="67418574"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:10:22 -0800
X-CSE-ConnectionGUID: dbA6W2SBT/6/sIpmqpKvNw==
X-CSE-MsgGUID: o+yIcGnpSvuSd6aWDqZ9Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199679064"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 15:10:21 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXSZ9-000000000HD-1ZbO;
	Sun, 21 Dec 2025 23:10:19 +0000
Date: Mon, 22 Dec 2025 07:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] loadpin: Implement custom proc_handler for enforce
Message-ID: <202512221207.wmjLxyLE-lkp@intel.com>
References: <20251219-jag-const_loadpin-v2-1-a1490ab35a1d@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-jag-const_loadpin-v2-1-a1490ab35a1d@kernel.org>

Hi Joel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Granados/loadpin-Implement-custom-proc_handler-for-enforce/20251219-185849
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251219-jag-const_loadpin-v2-1-a1490ab35a1d%40kernel.org
patch subject: [PATCH v2] loadpin: Implement custom proc_handler for enforce
config: sh-randconfig-002-20251221 (https://download.01.org/0day-ci/archive/20251222/202512221207.wmjLxyLE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221207.wmjLxyLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221207.wmjLxyLE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from security/loadpin/loadpin.c:12:
   security/loadpin/loadpin.c: In function 'report_writable':
>> security/loadpin/loadpin.c:86:25: error: 'loadpin_root_writable' undeclared (first use in this function)
      86 |                         loadpin_root_writable ? "writable" : "read-only");
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:585:9: note: in expansion of macro 'printk'
     585 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   security/loadpin/loadpin.c:83:17: note: in expansion of macro 'pr_info'
      83 |                 pr_info("%pg (%u:%u): %s\n", mnt_sb->s_bdev,
         |                 ^~~~~~~
   security/loadpin/loadpin.c:86:25: note: each undeclared identifier is reported only once for each function it appears in
      86 |                         loadpin_root_writable ? "writable" : "read-only");
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:585:9: note: in expansion of macro 'printk'
     585 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   security/loadpin/loadpin.c:83:17: note: in expansion of macro 'pr_info'
      83 |                 pr_info("%pg (%u:%u): %s\n", mnt_sb->s_bdev,
         |                 ^~~~~~~
   security/loadpin/loadpin.c: In function 'loadpin_check':
   security/loadpin/loadpin.c:167:17: error: 'loadpin_root_writable' undeclared (first use in this function)
     167 |                 loadpin_root_writable = sb_is_writable(pinned_root);
         |                 ^~~~~~~~~~~~~~~~~~~~~


vim +/loadpin_root_writable +86 security/loadpin/loadpin.c

    79	
    80	static void report_writable(struct super_block *mnt_sb)
    81	{
    82		if (mnt_sb->s_bdev) {
    83			pr_info("%pg (%u:%u): %s\n", mnt_sb->s_bdev,
    84				MAJOR(mnt_sb->s_bdev->bd_dev),
    85				MINOR(mnt_sb->s_bdev->bd_dev),
  > 86				loadpin_root_writable ? "writable" : "read-only");
    87		} else
    88			pr_info("mnt_sb lacks block device, treating as: writable\n");
    89	
    90		if (!loadpin_root_writable)
    91			pr_info("load pinning engaged.\n");
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
