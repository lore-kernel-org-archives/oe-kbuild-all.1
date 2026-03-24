Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCF92F6922
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 06:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774335513; cv=none; b=m4mMON6snTTA+iJRjB0emC+ydqUPjB4c53kRYi1dXzxw/NQePQ8GK99SXqV29Hbif/lXbGOaLDv4wKNFiTCU/epxVLNwuOs+VRFgVIMdEYv40kZTBWORmE13K1leNEsJ8UZDSUUvod/EdRwGiGD1MDcLvUSz3NZnpM5NUCHZo0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774335513; c=relaxed/simple;
	bh=dqehyE3eHUO3fVEGvAOerXppKxne6SdxFS1qeZaRNlY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=prKcqagZvQVKsRLDYF6zRljWrY5FAdFe1VG24odHAl9L3PuArC8JAiJaAWxKlhuSD1syxBb36kSnt7jQOE+8sTgAZWXzb6woKYSk+mCK+tTpJUR5CqUausDndLoWV5qExuWSt6UKCqvKzY8EcTNrle7WLOFmA7dg2GvkJfBg0GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cngNMTeq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cngNMTeq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774335504; x=1805871504;
  h=date:from:to:cc:subject:message-id;
  bh=dqehyE3eHUO3fVEGvAOerXppKxne6SdxFS1qeZaRNlY=;
  b=cngNMTeqcrc1G2s6mMO1T9cLsQo54vFgS876YroZgE/ws5HB+/pYP1Uy
   tqsp+GZMF8J2PkT2cnyJn571cBoMWACId3Yv9umzvRZCM2DQ6pW8rhXLQ
   jrrF7NrSRCX2rIiGS5eVfRGwWkZysf/iExKUXeFqH2Yp9xzZuS9wevArX
   sgXB+obmi2Z4/MifDCcUrYr/9IZJzl9ioVNJcDQ5MvWOcsTRrs93R9Ib6
   rPcCV83r86Zv2hcF3dSQEnNsz6vbVd6o6iCMazknIE+G2FEmKt/YPM0TS
   V5w/1DXVNsqz7hT3a/STGM4N8iL3SBcB/1nBeQ3dv+cmGxpif+Eo4Hmc1
   Q==;
X-CSE-ConnectionGUID: 0ivFDsO9SQ6laDHpvFc7qQ==
X-CSE-MsgGUID: Txrj8F7aQZeNH3Z30HwWZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86418688"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86418688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 23:58:23 -0700
X-CSE-ConnectionGUID: coCBa4u/TiebFxqeU3jZuA==
X-CSE-MsgGUID: q81j1YkhQeW0OqdnUPPVYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219377737"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Mar 2026 23:58:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4viW-0000000043l-0hS5;
	Tue, 24 Mar 2026 06:58:20 +0000
Date: Tue, 24 Mar 2026 14:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 42/42] fs/afs/write.c:333:13:
 warning: 'netfs_dump_sg' defined but not used
Message-ID: <202603241453.PFODgYO9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   ae7ccdf83025020c44837849de26fb4546fbf825
commit: ae7ccdf83025020c44837849de26fb4546fbf825 [42/42] afs: [DON'T MERGE] Implement trivial content crypto for testing purposes
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260324/202603241453.PFODgYO9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241453.PFODgYO9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241453.PFODgYO9-lkp@intel.com/

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
