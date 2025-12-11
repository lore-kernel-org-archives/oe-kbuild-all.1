Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6603B8D48
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 20:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765485955; cv=none; b=rSZFiYj3GgJHHyd5UBrhaCbnYcTu9LJWiKnhc/iu0jCaMmRbIRQYvwq+mdE2Gyx7dlC0Sz7JBkXAbHPc+M2Q+fLSIYHw9ribGqeLJadbA5BZ0kcWPdS3ry5VR3JTF9PaygitCsGef82KK5TxiPfRuZmBXVoSZdbTZwfg83aXk3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765485955; c=relaxed/simple;
	bh=WYjwMSTLLBIFxJa9UleIJQPFHzbOM9ECBYjx0fVjXqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SGZw/FDsBRvoePMx1lsYLdfyjKzSNLrKBTavDqzwinLn4ps248JrzPCR0n87HZJzIt1eXZHFpkiJVO7uLu6sutGhXtTXwuPcCgf7pD6YkdvM8LyIxlsU4eBrsuLFBBs6iX0c0xZmS4qaOwnYUyvB9SBVsZ/li1TNA9SBgaiIECA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYxWSixc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYxWSixc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765485954; x=1797021954;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WYjwMSTLLBIFxJa9UleIJQPFHzbOM9ECBYjx0fVjXqU=;
  b=kYxWSixc8quy/pv1/h2CeWSxOr6hR4wZbHDIuF3O6xreC6S5VNLS3cOC
   PzcsLSW7ihDLlK5gQ5N6+wW6vAOgqxZUUlt+s3iajhx78Na0O+iRDwbyI
   MLreET40NNOE+quCifrBRZRdvSkglhBq4rSMMqaAnzEG3jFAlEh6LNEZI
   UJKJJ2wmJpjc05jDShy+JSWbqjVuuTd1f87T67u2GJs37DOhjpifFIGM8
   fLnixLJirXf29pERXkM0oy5SQyZsMSIXkJ+fVJNqEpTkrLj61jPq/g8QT
   awwk5VAe9l6Rssbx3ykOdduttP5uBt/NN+MgTF63naY7ej0/EPDU2GoXD
   g==;
X-CSE-ConnectionGUID: 2B9/w/ixROaygeRCGyv5cg==
X-CSE-MsgGUID: 0lo3xUV3QxempZI7dsK57Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71101948"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71101948"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 12:45:54 -0800
X-CSE-ConnectionGUID: ZB30N6cOSg+ITb5N9RlNGQ==
X-CSE-MsgGUID: mfCNAOhkQfKEHR8vG1x80w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196183416"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2025 12:45:52 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTnXp-000000001CG-3jCE;
	Thu, 11 Dec 2025 20:45:49 +0000
Date: Thu, 11 Dec 2025 21:45:49 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] htmldocs:
 Documentation/translations/zh_TW/dev-tools/index.rst:21: WARNING: toctree
 contains reference to nonexisting document
 'translations/zh_TW/dev-tools/sparse' [toc.not_readable]
Message-ID: <202512112120.v8ybUBJh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: b5ddf23d827cd42071866cc3bf265044c87e4ca9 [3534/3534] docs: kernel_feat.py: fix build error for missing files
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512112120.v8ybUBJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112120.v8ybUBJh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   KASLR for Freescale BookE32
   ------------------------- [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fprobe.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
>> Documentation/translations/zh_TW/dev-tools/index.rst:21: WARNING: toctree contains reference to nonexisting document 'translations/zh_TW/dev-tools/sparse' [toc.not_readable]


vim +21 Documentation/translations/zh_TW/dev-tools/index.rst

a149733d00db3a Min-Hua Chen 2024-03-20  18  
a149733d00db3a Min-Hua Chen 2024-03-20  19  	   目錄
a149733d00db3a Min-Hua Chen 2024-03-20  20  
a149733d00db3a Min-Hua Chen 2024-03-20 @21  .. toctree::

:::::: The code at line 21 was first introduced by commit
:::::: a149733d00db3a31a18e7818c361617daecdfa1f docs: sparse: add sparse.rst to toctree

:::::: TO: Min-Hua Chen <minhuadotchen@gmail.com>
:::::: CC: Ma Wupeng <mawupeng1@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
