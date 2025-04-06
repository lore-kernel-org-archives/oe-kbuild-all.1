Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51142BB15
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Apr 2025 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743934021; cv=none; b=AK7dD7tTlP4MBXngXpG3Oxn3fbS7zdfm5jnHWkc6gemL0gg+w0km6XSCmq4sj4O//J18ozioSbwomvJZaVkUzvz/kJNIC4D1b+skfdni4hgHkcKdxFIcLD4BNwxciwxE1t38nirPPrOISMYKmqDZ589Z6S5aJHCx+oyOXbwvOvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743934021; c=relaxed/simple;
	bh=3ogaiLm7zY7ExBvhU0wCaTIh4FloWzuJpR27AS/K70I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DLqmohOqQXMakDyWoC8fCFCz5QtXn9TOrP+L4aUR0VxMlrI6Ntf3KK3F/DaJOrUESS67/I1fJDXgnHXtoqzTaJ1GTnH2EDhjbe6rjX+Y2EUmY03AjdQljcJq2b0qmbN2i7FV4uVq/uQrFFLkjhnroU+oOZondUAccLfI8BPmtIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eg2JfXE7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eg2JfXE7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743934020; x=1775470020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ogaiLm7zY7ExBvhU0wCaTIh4FloWzuJpR27AS/K70I=;
  b=eg2JfXE7D6MM3uQsq+DUQSmU65a0Of5Yst/cLecP+9AIRPRNVD2Y9Ml0
   yWgWosamj7Dcy6rt2TNS9Mjx+X0BL/b9fN6te5YeIbJrrFz4Y0EP2htF8
   72QKGucKJheTl/5zct3RJ+cMJbhEJOg/KxUZTKqkgmuwFJN5j4DyX9f60
   wdgTDWX8H45O0En4zJV0H2iU6o8AO6s3BbGENhnKpoalsZm/qz5rg7oCi
   6vUDvn+SEs9RAfuQ3acVB9sFz55AIXIM/EjtN+3ixvKlj6EoqBOFSb9a8
   8Rcu79FixzRMZeIofBnmO5/V+kShD/PvEOymbCjyT8blSmuHb4HD4OqA7
   A==;
X-CSE-ConnectionGUID: 5AahjvwxTY2JpbiHOajvfw==
X-CSE-MsgGUID: mbxeHbUoTjOKTxYQb8e1jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45233984"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45233984"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 03:06:59 -0700
X-CSE-ConnectionGUID: +l1EkKxwQsCeiPffdfRl3g==
X-CSE-MsgGUID: FKlNzjpRTdqTodCMG5Daeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128009202"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2025 03:06:57 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1Mtz-0002Xd-0w;
	Sun, 06 Apr 2025 10:06:55 +0000
Date: Sun, 6 Apr 2025 18:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 17/25] kernel/irq/irqdomain.c:916:29: error:
 'const struct irq_domain_ops' has no member named 'get_info'
Message-ID: <202504061741.GTuVK3RN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/ppi
head:   aefa1f7be0ec85eaa2d21637deea85660d4c153a
commit: 56d963e82dae51037c004093c820370a4ad96cba [17/25] WIP
config: powerpc64-randconfig-002-20250406 (https://download.01.org/0day-ci/archive/20250406/202504061741.GTuVK3RN-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504061741.GTuVK3RN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504061741.GTuVK3RN-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq/irqdomain.c: In function 'irq_populate_fwspec_info':
>> kernel/irq/irqdomain.c:916:29: error: 'const struct irq_domain_ops' has no member named 'get_info'
     if (!domain || !domain->ops->get_info) {
                                ^~
   kernel/irq/irqdomain.c:921:20: error: 'const struct irq_domain_ops' has no member named 'get_info'
     return domain->ops->get_info(info);
                       ^~
   kernel/irq/irqdomain.c:922:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +916 kernel/irq/irqdomain.c

   910	
   911	int irq_populate_fwspec_info(struct irq_fwspec_info *info)
   912	{
   913		struct irq_domain *domain;
   914	
   915		domain = fwspec_to_domain(&info->fwspec);
 > 916		if (!domain || !domain->ops->get_info) {
   917			info->flags = 0;
   918			return 0;
   919		}
   920	
   921		return domain->ops->get_info(info);
   922	}
   923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
