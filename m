Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36871197A83
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722353510; cv=none; b=lEAXsFaD9IiqaZ8yk2XHjLwjjo/9FiGerodLVS0z1vop5w5nMUtGhHTf2chDOIUrxovNVAbc2ExrrVw4MLqWaH4Ue//jMYgWJ2JchsYPPbKZlBuxH5j2m/nBuicze6i/BpaJevMBkkOgj7dHKbz1LEVaulzon+y3EEy8UXLAzPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722353510; c=relaxed/simple;
	bh=/ODKqendkicASBGqDKt23LR6U6SFzxoTwp3NYxAXvYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KRy8l49JQKS6dthVUu7PRl8Gmgd1P4bE6XBZwsSNPzxFLss1jwrWIlMCeJprYmv+ycF+FuMlAVeBpf8C7is9qyBBtPVyYILqB0OSqycxw1JfbZLB5oL6KDJ8ff9pmd1E+l69e9uNjqSWF4mPMfjWOF0QyrEoBpI+ehLwS6NoO4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBsmbQ2u; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBsmbQ2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722353509; x=1753889509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ODKqendkicASBGqDKt23LR6U6SFzxoTwp3NYxAXvYU=;
  b=NBsmbQ2uMr71F/9Xpg9gkaGpC6T/6h+XEPlu+vfitJ4Zv6XQ8QPYmNlp
   RJclubdMmTtn6W6V6KKsInn2ZgrIvEpSfn7VB3b7zNhhxHDSRQ9EW0tRu
   N3LIOUep5k9Z4+UII8gJyfy6NO16cM71QKUbXihcdIJ15QQMIP1/WtiTa
   38nMRb2Ax1tOoGMj/ee5/LrmWsaAfzRwHUn61PQbkrH7dl/xSslu6prlI
   rnp01V5b4q1jnXdUaWne1HNmpUBYV1DEA79MvncMGhwqKDTuqnwKQLccK
   wsSSkUk/ZMRnASaAVlYGibjJaozMuB8vNPgb8wgg+1Bcyg2C/HlHWg783
   w==;
X-CSE-ConnectionGUID: IC7J2/L+TkyB0x1FyuSsOw==
X-CSE-MsgGUID: xtrMvy9YS7yxIcaFJIHDCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="42705731"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="42705731"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 08:31:46 -0700
X-CSE-ConnectionGUID: ptIJ90QuSRCNth5vOL7J5Q==
X-CSE-MsgGUID: 3hU3ebhLTGevqCnLzvyCew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54370316"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Jul 2024 08:31:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYopC-000t12-0B;
	Tue, 30 Jul 2024 15:31:42 +0000
Date: Tue, 30 Jul 2024 23:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: Witold Sadowski <wsadowski@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1008/1677] drivers/spi/spi-cadence-xspi.c:529:33:
 error: implicit declaration of function 'readq'; did you mean 'readl'?
Message-ID: <202407302351.yYAIELQC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cd19ac2f903276b820f5d0d89de0c896c27036ed
commit: 75128e2a14a9f443e8debdd30445f5934b5a7c83 [1008/1677] spi: cadence: Add Marvell SDMA operations
config: powerpc-randconfig-r023-20230208 (https://download.01.org/0day-ci/archive/20240730/202407302351.yYAIELQC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407302351.yYAIELQC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407302351.yYAIELQC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-cadence-xspi.c: In function 'm_ioreadq':
>> drivers/spi/spi-cadence-xspi.c:529:33: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     529 |                         u64 b = readq(addr);
         |                                 ^~~~~
         |                                 readl
   drivers/spi/spi-cadence-xspi.c: In function 'm_iowriteq':
>> drivers/spi/spi-cadence-xspi.c:555:25: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
     555 |                         writeq(*buffer++, addr);
         |                         ^~~~~~
         |                         writel
   cc1: some warnings being treated as errors


vim +529 drivers/spi/spi-cadence-xspi.c

   518	
   519	static void m_ioreadq(void __iomem  *addr, void *buf, int len)
   520	{
   521		if (IS_ALIGNED((long)buf, 8) && len >= 8) {
   522			u64 full_ops = len / 8;
   523			u64 *buffer = buf;
   524	
   525			len -= full_ops * 8;
   526			buf += full_ops * 8;
   527	
   528			do {
 > 529				u64 b = readq(addr);
   530				*buffer++ = b;
   531			} while (--full_ops);
   532		}
   533	
   534	
   535		while (len) {
   536			u64 tmp_buf;
   537	
   538			tmp_buf = readq(addr);
   539			memcpy(buf, &tmp_buf, min(len, 8));
   540			len = len > 8 ? len - 8 : 0;
   541			buf += 8;
   542		}
   543	}
   544	
   545	static void m_iowriteq(void __iomem *addr, const void *buf, int len)
   546	{
   547		if (IS_ALIGNED((long)buf, 8) && len >= 8) {
   548			u64 full_ops = len / 8;
   549			const u64 *buffer = buf;
   550	
   551			len -= full_ops * 8;
   552			buf += full_ops * 8;
   553	
   554			do {
 > 555				writeq(*buffer++, addr);
   556			} while (--full_ops);
   557		}
   558	
   559		while (len) {
   560			u64 tmp_buf;
   561	
   562			memcpy(&tmp_buf, buf, min(len, 8));
   563			writeq(tmp_buf, addr);
   564			len = len > 8 ? len - 8 : 0;
   565			buf += 8;
   566		}
   567	}
   568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
