Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D2A145FF8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 15:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709133066; cv=none; b=cWg4tOPC+49m5ERwef513OxxDtdsPzLM0fjbfnC8ndCih6inWbdaSzo1zRXAnpfhZ3q1VM0XupWQZsYRSigR9rgHVVboQGqFaXXsIyi6DHCULj2LMpMzthRml09/VNdSlfDFb4q8JLvz/vZxRGCDRghJ80KzydI87aWcrFOUAx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709133066; c=relaxed/simple;
	bh=NZ0DgWZOD6UMiN6z0xRVRgeuyR/H8+G7tAppY4YcREs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GrEd3loqg0S+If9h2O+xf4PUwwhdEqv96ckA9CKFL8C/8e7AWV6eNfrdrZ9zNqiRhvPfHVd27WUTWaS6H5xmP4xosrIexI058Or9LJ1r/TFBfzwYrrbcf3U29KVBB2MT12W9sSQYfPJ2e/LBGxoMvrJP/fZW2CssmySkSiWoIBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUo7hCcV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUo7hCcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709133064; x=1740669064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NZ0DgWZOD6UMiN6z0xRVRgeuyR/H8+G7tAppY4YcREs=;
  b=FUo7hCcVwyPdGXH384YljJ1yQmD/uJFE214vkYOpZekiyYW7VUXtPln/
   H5Dwvh5JkJlW7bmSrXD/1eiZC1psvvbFu0xCvflNfbtevdZcEmwDLoAus
   UR67e9QfRftvEwlvtPhhhuPivCHpCAt5IXk8wyuGMpuBoSE8Sz+KiJoXw
   K6oGDXrocIikwgFU0j43xvUCiYzRv6jyn+A2Q1MubAR7n72wr0bByakRs
   950YfyEFi9sKyknnS7k72h0PjqNaLeqRaieK+j3KElYomQr3YnTJYL2y3
   TxXyZ8FNps8ZGp3o0dvLZtC7N8D9O+60/wJvHhUtCIUEX89ta42Qs74cO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3383326"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3383326"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 07:11:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7576823"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Feb 2024 07:11:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfLaA-000CAN-1b;
	Wed, 28 Feb 2024 15:10:56 +0000
Date: Wed, 28 Feb 2024 23:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: Chengming Zhou <zhouchengming@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 10516/10830] mm/zsmalloc.c:742:23: warning:
 'get_zspage_lockless' defined but not used
Message-ID: <202402282356.8HzbImAg-lkp@intel.com>
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
commit: 2258bdebb55e3ad3d30fd3849ddb955ff36825de [10516/10830] mm/zsmalloc: don't hold locks of all pages when free_zspage()
config: m68k-hp300_defconfig (https://download.01.org/0day-ci/archive/20240228/202402282356.8HzbImAg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240228/202402282356.8HzbImAg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402282356.8HzbImAg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/zsmalloc.c:742:23: warning: 'get_zspage_lockless' defined but not used [-Wunused-function]
     742 | static struct zspage *get_zspage_lockless(struct page *page)
         |                       ^~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:288:13: warning: 'kick_deferred_free' defined but not used [-Wunused-function]
     288 | static void kick_deferred_free(struct zs_pool *pool) {}
         |             ^~~~~~~~~~~~~~~~~~


vim +/get_zspage_lockless +742 mm/zsmalloc.c

   740	
   741	/* Only used in zs_page_migrate() to get zspage locklessly. */
 > 742	static struct zspage *get_zspage_lockless(struct page *page)
   743	{
   744		struct zspage __rcu **private = (struct zspage __rcu **)&page->private;
   745	
   746		return rcu_dereference(*private);
   747	}
   748	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
