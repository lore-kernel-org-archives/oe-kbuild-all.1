Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC7B3112B2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 21:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774300093; cv=none; b=N+djJ1k/6LYXgzthIVJ0jsVe6/oqwaSv8WgCT80osfy6Jp3mWJj6qpPTk/DwTTyPMdflXhmRy432RTr1jViJINONnx/5Io+dL9xV9fCpDmv2NDzotli8CH3HHeJWIl/Kgk52kyx4qab8k3XoToCyDc8X61fXlJJmfyT9FYrE1FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774300093; c=relaxed/simple;
	bh=MiXk0AOrItbsZqjv8LLe6KkQsggXXTBdUS+Si1MrWqw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZMi5NOE2wR/wscLBlctojIzfkC/5qWhxhdSymd+ddN3Dd+oKYDJxxbA87c4/RafIWNgwf6H46ITzoVV76DDmhEXyRB//1BgdI8rdPeh+ec8PbsxXoTzlb19akyE1Cm+Ky6tR+XdLFCcyNoELIwHnyKyoyKB/4/QxGsAY+mXqsxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vl4mW5sQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vl4mW5sQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774300093; x=1805836093;
  h=date:from:to:cc:subject:message-id;
  bh=MiXk0AOrItbsZqjv8LLe6KkQsggXXTBdUS+Si1MrWqw=;
  b=Vl4mW5sQCDYrOIdHvf036J3s3fjTK9wLlWTTnNRnLWzWXMgg8mZ8n+or
   ztgwwJ3I8ejfWsZ2ekJRR6QyKqTAuiOls+5c3z+JDQBMCx9gvrXwlhcMf
   oPqRcT6RuXM9+OSfENJrZ2GRrkTidVpC2jsZqTvOTPhEmEYm4oIONo+x4
   SeO2o6BZy+LtmqxwUbtfIvrizYEK9M7A8q3AGWvM81rP1441AmFWjtXiu
   qIemPUYoGdM1gUNoxRFjgVIeDW/pkx376agGdKb6Ih+WMwIbOOifWN9xU
   OTqXDs8hSd+qGU/ik+f2MhD0zVgLXRzsb87zSa1pX7qhdYA9AhmQcv9UQ
   w==;
X-CSE-ConnectionGUID: IHyLKJfkTxmeB7JHTfvdjA==
X-CSE-MsgGUID: o7hYQNPwRk+C+s2a5C6DiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75329909"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75329909"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 14:08:12 -0700
X-CSE-ConnectionGUID: cSJhkkUQTE6cG8iCPpYqEw==
X-CSE-MsgGUID: rBruDhOJTFqK3Dgwcu7jCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="262060113"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 23 Mar 2026 14:08:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4mVM-000000006ir-1z9O;
	Mon, 23 Mar 2026 21:08:08 +0000
Date: Mon, 23 Mar 2026 22:07:34 +0100
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 42/42] fs/afs/write.c:333:13:
 warning: 'netfs_dump_sg' defined but not used
Message-ID: <202603232152.ph2g80Xk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   ae7ccdf83025020c44837849de26fb4546fbf825
commit: ae7ccdf83025020c44837849de26fb4546fbf825 [42/42] afs: [DON'T MERGE] Implement trivial content crypto for testing purposes
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260323/202603232152.ph2g80Xk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603232152.ph2g80Xk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603232152.ph2g80Xk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/write.c:333:13: warning: 'netfs_dump_sg' defined but not used [-Wunused-function]
     333 | static void netfs_dump_sg(const char *prefix, struct scatterlist *sg, unsigned int n_sg)
         |             ^~~~~~~~~~~~~


vim +/netfs_dump_sg +333 fs/afs/write.c

   332	
 > 333	static void netfs_dump_sg(const char *prefix, struct scatterlist *sg, unsigned int n_sg)
   334	{
   335		unsigned int i;
   336	
   337		for (i = 0; i < n_sg; i++) {
   338			void *p = kmap_local_page(sg_page(sg));
   339			unsigned int l = min_t(size_t, sg->length, 16);
   340	
   341			printk("%s[%x] %016lx %04x %04x %*phN\n",
   342			       prefix, i, sg->page_link, sg->offset, sg->length,
   343			       l, p + sg->offset);
   344			kunmap_local(p);
   345			sg++;
   346		}
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
