Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD0A2AD35
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763674587; cv=none; b=Bx2KGAUNrCHRRKCmPMNhk2AxKgbXMlbs7+j2dB+rDjuUWc6YETKWHezVHaoTGWTgKz4yjQS4iDgGIBlTPUqlLtmtrvRvIF7hPQeulC3xZmLdyzHrEgTFf5vZPUjpYFkbhL0dFRNFT6o9UZuDi4VLZ7o2MtcWsdFKcBNA51IUwqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763674587; c=relaxed/simple;
	bh=DU7XGzoH3AZNUi+RrQ3xeIu8dOW4ZXL6yva3U5HYBaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aKgg7e2hKYnzba9btCkZmbZl74Tk7JJtj3oIHP96xEAk66GvKXsaMi8wgy2QcRXWlCLQ45UNkgi32PArdJORnioTKLi8nf1aTehE/4OP0ddMCVEz72V5TEhiBpjqA+p1I7jTI1PWjuQ/u65pp6aEW5wsgQFLclKvtjopZsUC5XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaJBzhHJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaJBzhHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763674585; x=1795210585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DU7XGzoH3AZNUi+RrQ3xeIu8dOW4ZXL6yva3U5HYBaE=;
  b=LaJBzhHJ4U4BBJmiMx7/knwwzqwTmnZEdpU1aP8m/FgFn3kf5lPicCan
   JMTPmOshlSL13+Ze93w+EyLRgEsJzYgWiaEn+783859ZHKO6jGcayZcA+
   UL1lOH6D1erE7NTVIiSe/a6no9x/yiHuzWrVglUO1xDMF1llTC5umg9fe
   JMT/JAccUYu6kidYtfYpdcAcEoM8kQn9bBXwnLn/Gftgs7PhGGU938fAZ
   qKn6iKwJY2MynNDosoo5CZY/0+G1AM0WNaoFgfX3S82VGJQnB0fh5cwYE
   f7fglF6pnjFmzHS6+P7FOohFhnzUMnhLwOrdCPaiLfgWnz2dUDSE6b/fF
   Q==;
X-CSE-ConnectionGUID: gddPpq82SPWKtAglJTATEw==
X-CSE-MsgGUID: OfJTrfd+SMmFJsRH9tvcdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76864704"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="76864704"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 13:36:24 -0800
X-CSE-ConnectionGUID: NeC6Lu3vSg6ak7hTcTip5g==
X-CSE-MsgGUID: D2K2LDidSsmNJb062+ajeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="191591618"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Nov 2025 13:36:22 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMCKB-0004bJ-33;
	Thu, 20 Nov 2025 21:36:19 +0000
Date: Fri, 21 Nov 2025 05:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9912/10599]
 kernel/liveupdate/luo_session.c:392:86: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202511210513.ywQeN1k6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
commit: f485f57c35af5b8c2a243dfc39ee171673484915 [9912/10599] liveupdate: luo_session: add sessions support
config: x86_64-randconfig-121-20251120 (https://download.01.org/0day-ci/archive/20251121/202511210513.ywQeN1k6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210513.ywQeN1k6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210513.ywQeN1k6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/liveupdate/luo_session.c:392:86: sparse: sparse: Using plain integer as NULL pointer

vim +392 kernel/liveupdate/luo_session.c

   357	
   358	int luo_session_deserialize(void)
   359	{
   360		struct luo_session_header *sh = &luo_session_global.incoming;
   361		int err;
   362	
   363		if (luo_session_is_deserialized())
   364			return 0;
   365	
   366		luo_session_global.deserialized = true;
   367		if (!sh->active) {
   368			INIT_LIST_HEAD(&sh->list);
   369			init_rwsem(&sh->rwsem);
   370			return 0;
   371		}
   372	
   373		for (int i = 0; i < sh->header_ser->count; i++) {
   374			struct luo_session *session;
   375	
   376			session = luo_session_alloc(sh->ser[i].name);
   377			if (IS_ERR(session)) {
   378				pr_warn("Failed to allocate session [%s] during deserialization %pe\n",
   379					sh->ser[i].name, session);
   380				return PTR_ERR(session);
   381			}
   382	
   383			err = luo_session_insert(sh, session);
   384			if (err) {
   385				luo_session_free(session);
   386				pr_warn("Failed to insert session [%s] %pe\n",
   387					session->name, ERR_PTR(err));
   388				return err;
   389			}
   390	
   391			session->count = sh->ser[i].count;
 > 392			session->files = sh->ser[i].files ? phys_to_virt(sh->ser[i].files) : 0;
   393			session->pgcnt = sh->ser[i].pgcnt;
   394		}
   395	
   396		kho_restore_free(sh->header_ser);
   397		sh->header_ser = NULL;
   398		sh->ser = NULL;
   399	
   400		return 0;
   401	}
   402	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
