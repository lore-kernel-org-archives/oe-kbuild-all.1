Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E833D18990C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 21:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729285807; cv=none; b=VY2/AcCtRAM7HwFOqb0Vr2zeGI7iMM1Cwyslh4aKBfVnU2HprwbX9GT/rZMgVK2aaFU5E8531iJLSXyXKKwBZY8dpluIJ8eeb+NXSKaMjbI7sLoB6rjCwCNIx7uNe2/eiwMAxjJEL+pLyBjSkHj985H8oMNahMpEiDFC4BRQ7bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729285807; c=relaxed/simple;
	bh=/Pf5KMXasYc+ggDSCb01aA9D9J7P+2tZyoUtsWztRz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/3MTrce4CDqdexDpwDZxnDcfpzKzgsgMqVImhzns5gWtzMRTWaLgBvshQdeAzh8EvQMu5HgBSbM2K6Y2zxt2owJuGI0HpvNch4atMGSaQFSHwodx8ea4tzrfi0X8KSqvFvkk7dDUsEuJQwaxxPV2nT90oXE3pcJWKQUkpGvydM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L74DMZwS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L74DMZwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729285805; x=1760821805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Pf5KMXasYc+ggDSCb01aA9D9J7P+2tZyoUtsWztRz4=;
  b=L74DMZwSJFkTebfNR1XhdJjHFJS2+i57/ONHvTTrn9AXdQJbU/qO/FV8
   1mq5rgNcGC7OPdJCqWUBypUqgEvSZkttlfBjNn7HuxvnM7moeAmfWsD+s
   F7ffYFFNLhw0FNTS5TsqgxN+VYpRTJBHLiDpSzN4QsLQnUtsHTWET8za3
   /uFLIqJV/cNmI/SPUKc1eALjhClYIGvfWaAPkx2jSluR/nCdqRK0e90Ld
   BOGP8Ocy/CJDtJVOKBTAmACWJhOzzhmx+RfMVocUuNCb/QL185ouEzUkV
   wqoZUza67hVZhVERy4XgTPEg82vAH/KNr9MPm382kMQiVEXWn40GEEkLs
   w==;
X-CSE-ConnectionGUID: dsvOX+J8R0qYCn1BTVPGPg==
X-CSE-MsgGUID: wE1EwNhhRgunMECiZN6Y0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28790767"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28790767"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 14:10:04 -0700
X-CSE-ConnectionGUID: ZC2iOYRmSEay7M/OXgopNw==
X-CSE-MsgGUID: KOUzeRYkQkKWwsGFXAovEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="116434645"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2024 14:10:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1uES-000OJN-0R;
	Fri, 18 Oct 2024 21:10:00 +0000
Date: Sat, 19 Oct 2024 05:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.1.x-imx 3613/17818]
 drivers/regulator/max17135-regulator.c:796:19: warning: 'max17135_setup'
 defined but not used
Message-ID: <202410190546.bUF17gpf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.1.x-imx
head:   096cd0432b03805f49c86684dafb9ced4511a714
commit: 853944c5181946f7b7d04330e610316b49aee2d6 [3613/17818] MLK-11556-1 pmic: max17135: add hwmon, mfd and regulator drivers for this pmic
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241019/202410190546.bUF17gpf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190546.bUF17gpf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190546.bUF17gpf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/max17135-regulator.c:796:19: warning: 'max17135_setup' defined but not used [-Wunused-function]
     796 | static int __init max17135_setup(char *options)
         |                   ^~~~~~~~~~~~~~


vim +/max17135_setup +796 drivers/regulator/max17135-regulator.c

   790	
   791	/*
   792	 * Parse user specified options (`max17135:')
   793	 * example:
   794	 *   max17135:pass=2,vcom=-1250000
   795	 */
 > 796	static int __init max17135_setup(char *options)
   797	{
   798		int ret;
   799		char *opt;
   800		while ((opt = strsep(&options, ",")) != NULL) {
   801			if (!*opt)
   802				continue;
   803			if (!strncmp(opt, "pass=", 5)) {
   804				ret = kstrtoul(opt + 5, 0, &max17135_pass_num);
   805				if (ret < 0)
   806					return ret;
   807			}
   808			if (!strncmp(opt, "vcom=", 5)) {
   809				int offs = 5;
   810				if (opt[5] == '-')
   811					offs = 6;
   812				ret = kstrtoul(opt + offs, 0,
   813					(long *)&max17135_vcom);
   814				if (ret < 0)
   815					return ret;
   816				max17135_vcom = -max17135_vcom;
   817			}
   818		}
   819	
   820		return 1;
   821	}
   822	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
