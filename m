Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1C117EF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 00:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709596950; cv=none; b=HHohjCYJUC5IUWFokjyUnV9zoUDreCR5WpTWeFKh3Bvd1bfVcUgwXljUOrVYER3T+h6LW8aypVgrDfZBxQ5oidsxqpEO/yRJnsAjeqqS82Da68L90nhXObvrQR0kSkxGuSFK9KLF7V2zZV8/Zmq6AWKctaeG+uuy1qeDivyMm+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709596950; c=relaxed/simple;
	bh=HKRRK6PR69gw6QAxvcGJYO5QInM4U6MqlLmgwCek5cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jv8x5ZqIEfPstqr1qeDHcPocM/PCrC9OKY2NhzxuKbX1KxFQaRPRB5+swetzqyGi3m7Zb/8PtkUMJQHivucTyOzPB5zzIDVFsvokvuFFFzUJtMjJYFnrQiB1QhB1BUZZovb5EyAG0efeH60+IdLDHykaTAvWq4+RJxFzQwoTWsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nt1egOr+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nt1egOr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709596949; x=1741132949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HKRRK6PR69gw6QAxvcGJYO5QInM4U6MqlLmgwCek5cQ=;
  b=nt1egOr+BXImNXLNu8pqtkoM5Ui2af4UuUXGsyS2ztv334mhkaMZ26t2
   x82927aSbP6zqHYGb+vJZz8vRdFISJpyuT+LyCza5O977ZnZFfB1oKXgq
   zOFgAEj8dE5wmTdX71213a37wEAFdUlIIvMgpyOg2G7aPK/HeCtojH1o1
   WjKJOv3mSFpaZqH4MxToLWXq5nU2/bM6rS+TstBlqSk9Iko60EHcWheYG
   GTRekt3gpNG1uKxSPjTjmBia15QyfNjDSlBrdZnfaywr8MwoMl/9qjvQw
   PEC2Ieftfv4QXQEw5EyVDEy/5bxVAfIlWzDn5JOkpOM9D3hgIQsf6YF2F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15551670"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="15551670"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 16:02:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9343338"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Mar 2024 16:02:25 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhIGE-0002qf-2w;
	Tue, 05 Mar 2024 00:02:22 +0000
Date: Tue, 5 Mar 2024 08:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 25/98] net/core/net-procfs.c:344:45: sparse:
 sparse: cast removes address space '__percpu' of expression
Message-ID: <202403050701.qou7DsLb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: d9324ddd538a0b57dbee8623806ff9b9f7811202 [25/98] net: dev ipv4/v6 stat
config: x86_64-randconfig-122-20240303 (https://download.01.org/0day-ci/archive/20240305/202403050701.qou7DsLb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050701.qou7DsLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050701.qou7DsLb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/net-procfs.c:344:45: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/net-procfs.c:344:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *mib @@     got void [noderef] __percpu ** @@
   net/core/net-procfs.c:344:45: sparse:     expected void [noderef] __percpu *mib
   net/core/net-procfs.c:344:45: sparse:     got void [noderef] __percpu **

vim +/__percpu +344 net/core/net-procfs.c

   334	
   335	static void dev_ext_seq_printf_stats(struct seq_file *seq, void *v)
   336	{
   337		struct net_device *dev = (struct net_device *)v;
   338		int i;
   339	
   340		seq_printf(seq, "%10s  ", dev->name);
   341	
   342		for (i = 0; snmp_devstat_list[i].name; i++)
   343			seq_printf(seq, " %12lu",
 > 344				   snmp_fold_field((void __percpu **)
   345						   dev->mib.dev_statistics,
   346						   snmp_devstat_list[i].entry));
   347		seq_putc(seq, '\n');
   348	}
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
