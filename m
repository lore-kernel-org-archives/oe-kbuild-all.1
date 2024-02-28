Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4865F1C10
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709137638; cv=none; b=e/Kjr938BKgbGL4EGkYX3VBkDMPtgwIhIYJ4C5r90DmXeTocy+2s27VpEz31p5DAckUNZEtdWXaq2JBlOz1g9sS5ZpwGwcM3EX6l1fYfnB064vZYso4lfbxZcLEhhsDuVyMdRO5zKmA1wne77Fmb81AAJxj8nCLojN9XFHMfGuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709137638; c=relaxed/simple;
	bh=1J3z4MEfoJZFVgfYMlh6DZXWqjE8yv6B8zY9bL8NnFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=klLWtrGk5zRMGezvShSeJpW04bSQ4AA+GI8pZ9g/uHaoZRnhXtFhczkAndyE6UMYIykPD0Hu2+4lhqX8GPHMVxCZdZhf74LEh9HAAEF4zSEK2f6/0b9klsxmZgQD7ag7zpd2BgO8wxI5KBJpcvnEx/DjslrHpjc9pEYjIrlWzEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgyGBLqJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgyGBLqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709137635; x=1740673635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1J3z4MEfoJZFVgfYMlh6DZXWqjE8yv6B8zY9bL8NnFc=;
  b=dgyGBLqJnhR/pemmqGTuZWN6HahJBs8jBinaaIt11k4Gl+fmfrPruk72
   y6m5D6ugSFyUFQC/RdllpqwALRHmxPxnZNmfDUw34fhfDsgUJ9PEwxkz0
   I4EyWWK5S78g8WKzAzNhS+RUDeF4BXTYGwLlw097DyCag3X8kO07ddaeH
   0QOAPRzR5nmP/9mrLtYUrJXWgoD6B3LZ6LH8ACf9UySjwld18Oi9SJMVK
   cWLNaUdtM/xDocZhA5GX/fPXdIDBkIUHkU6ByzLCA1BvtiyfI/sEN8hu1
   z0Ku9FvOt5s/zsWz7kIqRvtfnk6xY7aw0UdGbeAbSZZA3h/SHuKQHG9SL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14260408"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="14260408"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 08:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="12053017"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 Feb 2024 08:25:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfMjp-000CDX-2K;
	Wed, 28 Feb 2024 16:24:57 +0000
Date: Thu, 29 Feb 2024 00:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@nvidia.com>
Subject: [linux-next:master 10123/10830] include/linux/dpll.h:179:1: warning:
 control reaches end of non-void function
Message-ID: <202402290000.tX1Ed1x7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
commit: 0d60d8df6f493bb46bf5db40d39dd60a1bafdd4e [10123/10830] dpll: rely on rcu for netdev_dpll_pin()
config: i386-randconfig-141-20240228 (https://download.01.org/0day-ci/archive/20240229/202402290000.tX1Ed1x7-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290000.tX1Ed1x7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290000.tX1Ed1x7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/rbtree.h:24:0,
                    from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from net/core/rtnetlink.c:17:
   include/linux/dpll.h: In function 'netdev_dpll_pin':
   include/linux/rcupdate.h:439:9: error: dereferencing pointer to incomplete type 'struct dpll_pin'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:587:2: note: in expansion of macro '__rcu_dereference_check'
     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rtnetlink.h:70:2: note: in expansion of macro 'rcu_dereference_check'
     rcu_dereference_check(p, lockdep_rtnl_is_held())
     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dpll.h:175:9: note: in expansion of macro 'rcu_dereference_rtnl'
     return rcu_dereference_rtnl(dev->dpll_pin);
            ^~~~~~~~~~~~~~~~~~~~
   In file included from net/core/rtnetlink.c:60:0:
>> include/linux/dpll.h:179:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +179 include/linux/dpll.h

   171	
   172	static inline struct dpll_pin *netdev_dpll_pin(const struct net_device *dev)
   173	{
   174	#if IS_ENABLED(CONFIG_DPLL)
   175		return rcu_dereference_rtnl(dev->dpll_pin);
   176	#else
   177		return NULL;
   178	#endif
 > 179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
