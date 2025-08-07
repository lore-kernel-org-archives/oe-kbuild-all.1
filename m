Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C373C35965
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754574094; cv=none; b=mjtO9ovDk5F7iqjWUK4pJFmWiB09KXI71Um4T3Cq8OmaOhInAf4H5Zug7UDQuM4J1fE+o/uotu2yljFZ6VbyXod3HOIL3g8c4+ARhGN58eo10QapGzZZcT70TfVVQMn9QdGszk5yYcJTMI7KmfcQ+udlgTfPcB5MqIVcenBXQJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754574094; c=relaxed/simple;
	bh=zJC9dzMM3GGXlZeIRNdQxQWm9VLF0LZhww6n+HbX564=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CeXMbTsRAj9jmqhEMZOR0QAG/6JY7XiX+CR4QvFhEN7vfv/r1yz2a2u42zjwqrXYTpMlosXuQ6UIIFCfOUnG5dWPDM7ivUvtfOnbOHPYQsV9bpJ5mpQ0jmzwWrcECuhNjslbgryphQ1zb5oHxR9jah5c9Ovv2+gLDRGtFTKwMMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgupY6+R; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgupY6+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754574092; x=1786110092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zJC9dzMM3GGXlZeIRNdQxQWm9VLF0LZhww6n+HbX564=;
  b=UgupY6+ReRlOewLHhkWsBNGkOAu6Mn8PexKqzPZHviwpIFA9nmYLbK3J
   hlHBeYgEu4USU6J39vQwWRHo53mfpWlSraSNP14taYkAhm0gDMDEH7yB7
   69nTi8ME2Q+Mtws67QIpDu0sDW4O/2li+RukFQtkOPibcvX86UXHAav8L
   VXUwpi/q5I+/8tDSHdDqV6kIGipJJFcs13VaSKnAnjNI1HdghM464kqOs
   Nf4OkPwZ8AvVA+pJHJ7xG72mITDwGXa3Mn6xK3VT3669TrGrT84KKOiwD
   uLWgCjnEyztIMEprTjcgWapx+Yjw1g7Ghkl5h8h1HYj8rz7S1n3NcvhEb
   g==;
X-CSE-ConnectionGUID: MMJn5SV+T4+9R23LrGxCEA==
X-CSE-MsgGUID: wo4qv5y2TCak9gzftfHDeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57044566"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="57044566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 06:41:30 -0700
X-CSE-ConnectionGUID: OPeR3yWLTm2AvO4Kqvsmbw==
X-CSE-MsgGUID: mkKbMt6tTZafWTAVwFLjXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169275786"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 07 Aug 2025 06:41:28 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk0s0-0002St-2e;
	Thu, 07 Aug 2025 13:41:24 +0000
Date: Thu, 7 Aug 2025 15:40:58 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 444/444]
 drivers/mmc/core/crypto.c:14:6: warning: no previous prototype for
 'mmc_crypto_setup_queue'
Message-ID: <202508071539.Fpas2YR4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   d7bfd4b043082929d98d2883c5f6a205fe89c195
commit: 555cf12eb672727979bc7b7840c7503f3de27220 [444/444] ANDROID: mmc: MMC crypto API
config: i386-randconfig-2005-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071539.Fpas2YR4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071539.Fpas2YR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071539.Fpas2YR4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/core/crypto.c:14:6: warning: no previous prototype for 'mmc_crypto_setup_queue' [-Wmissing-prototypes]
      14 | void mmc_crypto_setup_queue(struct mmc_host *host, struct request_queue *q)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/core/crypto.c:21:6: warning: no previous prototype for 'mmc_crypto_free_host' [-Wmissing-prototypes]
      21 | void mmc_crypto_free_host(struct mmc_host *host)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/core/crypto.c:26:6: warning: no previous prototype for 'mmc_crypto_prepare_req' [-Wmissing-prototypes]
      26 | void mmc_crypto_prepare_req(struct mmc_queue_req *mqrq)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/mmc_crypto_setup_queue +14 drivers/mmc/core/crypto.c

    13	
  > 14	void mmc_crypto_setup_queue(struct mmc_host *host, struct request_queue *q)
    15	{
    16		if (host->caps2 & MMC_CAP2_CRYPTO)
    17			q->ksm = host->ksm;
    18	}
    19	EXPORT_SYMBOL_GPL(mmc_crypto_setup_queue);
    20	
  > 21	void mmc_crypto_free_host(struct mmc_host *host)
    22	{
    23		keyslot_manager_destroy(host->ksm);
    24	}
    25	
  > 26	void mmc_crypto_prepare_req(struct mmc_queue_req *mqrq)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
