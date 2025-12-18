Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A56E1C8626
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 03:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766027252; cv=none; b=SHIBqTDibMVas/y7WYY6W4CiqZNqDexPn5Z7uLoabb7zyAEYLMy3aNvbPrNGCKbyPXyIfIvRtSEUYGbHzRfvv3waWNg8ZA3ipO4eeF95VCuRhmqP6X3V724AzErUcLnSwfYE8cfAAuzAUtMTlyJGipMTFJL28S9bi/Qljo6PmnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766027252; c=relaxed/simple;
	bh=lR6nzcqm+ujHnjdS6JFYRJFqKq9y7xh9Xrnx3LwFThM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PeNhmEH2SLB0e7U+PuORNrP9K4m+tINaSN7Eiaj9ZjgAn62X1RfpvAcOyYoWKEG8p29PnMLU7ZP8Tpvm1Qu5Kz1uM5u9BRauOxzhu6ckbFyhFRhUH6QqerztcQJ6hTLmqdzOu7vOcfD0hvvUNFfwnq60inQfVEhCDVe/BkcSdnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsA9XSL0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsA9XSL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766027250; x=1797563250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lR6nzcqm+ujHnjdS6JFYRJFqKq9y7xh9Xrnx3LwFThM=;
  b=lsA9XSL03l2D0L/n3wX5dj2K5wUl227w0LqKVHurQrlv2sPqxhCZpBEH
   dqFhbTdRa8XK0JpTLd08lBtyMLXdB5YAO2kBAU2fenjgZ3gE2t+9tUybT
   wYej2ct5MMLA1Xl8uNH9rvizA569/ABgdUHnsmiF2jT4lDCV/UM7mhwQE
   WtpUXtZD2RimEj1NaA0WIdmCFRldUZc+yu+u1vBg5CyeHgplsrPFQacl2
   nmh+ZH0lBuvuy+V7d0lqe9k1dwGvYYOQQt7ce3hkoopHLJIKoOx7KyYdJ
   zoECAvD8Nvwji9JCATbioZ2MzKXp7qms+8+evp438yVDyNV2sS9xCcJp6
   g==;
X-CSE-ConnectionGUID: h3KOsKIFRE+NCffj0lGxAQ==
X-CSE-MsgGUID: 5GOgWkBEQKWQjKj10e+Lgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="68015764"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="68015764"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 19:07:29 -0800
X-CSE-ConnectionGUID: 8giaZCIHS2WjoZQ4BQ8pOQ==
X-CSE-MsgGUID: u7jiEhIsT5+jff3UknKxfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198237211"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Dec 2025 19:07:28 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW4MP-000000001VH-1gRh;
	Thu, 18 Dec 2025 03:07:25 +0000
Date: Thu, 18 Dec 2025 11:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/nsproxy.c:264:9: sparse: sparse: dereference of noderef
 expression
Message-ID: <202512181002.T1MzUgAK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 3a18f809184bc5a1cfad7cde5b8b026e2ff61587 ns: add active reference count
date:   6 weeks ago
config: i386-randconfig-061-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181002.T1MzUgAK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181002.T1MzUgAK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181002.T1MzUgAK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/nsproxy.c:264:9: sparse: sparse: no generic selection for 'struct user_namespace *const [noderef] __rcu user_ns'
   kernel/nsproxy.c:269:9: sparse: sparse: no generic selection for 'struct user_namespace *const [noderef] __rcu user_ns'
>> kernel/nsproxy.c:264:9: sparse: sparse: dereference of noderef expression
   kernel/nsproxy.c:269:9: sparse: sparse: dereference of noderef expression

vim +264 kernel/nsproxy.c

   261	
   262	void get_cred_namespaces(struct task_struct *tsk)
   263	{
 > 264		ns_ref_active_get(tsk->real_cred->user_ns);
   265	}
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
