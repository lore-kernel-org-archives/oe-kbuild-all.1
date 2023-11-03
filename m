Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A72422EF9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 19:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meg5MM5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699039695; x=1730575695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qRIUzUZf2hwS39+hx3pP6Cz8RUibjohufTxfab7FTDE=;
  b=meg5MM5szYMvNGlkOQaCfw3IzVR44UdyWR8oa2Wmt35zBRk1A5IdnGO1
   qFPABchl/0mbYvJSiFSVdV8HCvdm/wq2LXf7HQWfHJQ3+ll11wiThvNwh
   OQG4eAiJDtIlELFKUCsYtjrQn8KgaAMyzHAV14IgE9wYhUibhZiGJrnJc
   Jyuj7m4LHDlLAZJBUwsDknI6EoQ/3b2w/KPzXS2mcPIn8tAoPMX/ayO+S
   Bc7yVuyPxrT+OWPjPDa+utjuD93hUsaXmTTgknWAGf8lHJ1IHMV5MCL2S
   Ei8jf2DNh4OfubYVPpoyER1ak59Jd1PYAbqRzPiF3jxvsVa0SNCHqBl15
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="453305918"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="453305918"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 12:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738169223"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="738169223"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Nov 2023 12:28:10 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyzpw-0002sj-0W;
	Fri, 03 Nov 2023 19:28:08 +0000
Date: Sat, 4 Nov 2023 03:27:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Aring <aahringo@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/2] refcount: introduce generic lockptr funcs
Message-ID: <202311040321.Rq7eR5bG-lkp@intel.com>
References: <20231103161635.1902667-1-aahringo@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103161635.1902667-1-aahringo@redhat.com>

Hi Alexander,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6 next-20231103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Aring/kref-introduce-kref_put_lockptr-and-use-lockptr/20231104-002152
base:   linus/master
patch link:    https://lore.kernel.org/r/20231103161635.1902667-1-aahringo%40redhat.com
patch subject: [RFC 1/2] refcount: introduce generic lockptr funcs
config: arc-randconfig-001-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040321.Rq7eR5bG-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040321.Rq7eR5bG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040321.Rq7eR5bG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/refcount.c:183:6: warning: no previous prototype for 'lockptr_lock_irqsave' [-Wmissing-prototypes]
     183 | void lockptr_lock_irqsave(void *lockptr)
         |      ^~~~~~~~~~~~~~~~~~~~
>> lib/refcount.c:191:6: warning: no previous prototype for 'lockptr_unlock_irqsave' [-Wmissing-prototypes]
     191 | void lockptr_unlock_irqsave(void *lockptr)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/lockptr_lock_irqsave +183 lib/refcount.c

   182	
 > 183	void lockptr_lock_irqsave(void *lockptr)
   184	{
   185		struct lockptr_irqsave_data *d = lockptr;
   186	
   187		spin_lock_irqsave(d->lockptr, *d->flags);
   188	}
   189	EXPORT_SYMBOL(lockptr_lock_irqsave);
   190	
 > 191	void lockptr_unlock_irqsave(void *lockptr)
   192	{
   193		struct lockptr_irqsave_data *d = lockptr;
   194	
   195		spin_unlock_irqrestore(d->lockptr, *d->flags);
   196	}
   197	EXPORT_SYMBOL(lockptr_unlock_irqsave);
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
