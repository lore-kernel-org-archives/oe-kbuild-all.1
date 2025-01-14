Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67B81474C9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736865185; cv=none; b=t66q5CFZaezKQOMOcaD4qvp6kxdCvYEkCJi1jG3kZREdMuMgfzrKT7l0mOATYOEHwaE/A/l+iqFn3qEcaNtf0U49CP2d+XkgLMesrdfC4F6gTYhEApPLf0AVE/FZqbZXm9blBUNLvm4JDkG1TPEJG0hlowCJlHrArZ/6RxqmuQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736865185; c=relaxed/simple;
	bh=aysFEMxJf5n/qCTxJttrxTdXfgKDJIdY73c5hVe5Uak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ftEz2cC3EEsN2D4gzTqYC2kbf7KkTCp+llpbTX24AAGBoEDg3GVb+Yj43gjps2SpdP50SJh6yWdP0WRoAVgeH2VGGwHlQ9uLEtc0aKX7U9O0S823xcjDDqa+HHY8UO0i0l6JK78js9qGy+sbUajBobmEXHcCCvIGqpa+pJt+h94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJw9PVwX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJw9PVwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736865184; x=1768401184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aysFEMxJf5n/qCTxJttrxTdXfgKDJIdY73c5hVe5Uak=;
  b=fJw9PVwXoRy+iEaLBpn/gL8KyIGVYe8QgnRcmNAvd1xqOTXZiv2Me9JJ
   KUXHZG+CDU0Di2Oe6+0YxzdBCkZgr6a7s6jVGqFdS2mxlrBya5WSkPESF
   wQ8UnCo5U8ocD8oZhhQ1ylTmZKrH6KKsUI7oEgMcLVpEMqMX/rMZCTF5/
   l9awHPWoqKn6l1nW9ruzdt3iPiOnZ4uIcyOM0hLcGlJyCqeq9AzIR4kDb
   /IcxQ6ZG/qVDqedqHw9c+QhqRDca+vnvVhZ3yorbrK9/weYgAQYNoBFaW
   aO6ad20Mh5iqCq/e6TRvWvZ9TJ6F9/GFGQH9gLA8bClTdiXgsvrZL0G23
   A==;
X-CSE-ConnectionGUID: La87tqHrSvu7hXP5zESDGA==
X-CSE-MsgGUID: P34LfSZtTwWXfzHv3iryHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48547483"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="48547483"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 06:33:04 -0800
X-CSE-ConnectionGUID: EKwvcFrfQAeUSqgOmMZyXQ==
X-CSE-MsgGUID: VyWg93IFQZasmalwZYE23A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105678953"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jan 2025 06:33:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXhyV-000Oep-0p;
	Tue, 14 Jan 2025 14:32:59 +0000
Date: Tue, 14 Jan 2025 22:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [linux-next:master 6470/8513]
 drivers/platform/x86/dell/alienware-wmi.c:521:1: sparse: sparse: symbol
 'dev_attr_zone00' was not declared. Should it be static?
Message-ID: <202501142200.ezULWY9P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dab2734f8e9ecba609d66d1dd087a392a7774c04
commit: 7c605f6460e80b393c7cc24b089afa876beadb48 [6470/8513] platform/x86: alienware-wmi: Improve rgb-zones group creation
config: i386-randconfig-063-20250114 (https://download.01.org/0day-ci/archive/20250114/202501142200.ezULWY9P-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501142200.ezULWY9P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501142200.ezULWY9P-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/dell/alienware-wmi.c:521:1: sparse: sparse: symbol 'dev_attr_zone00' was not declared. Should it be static?
>> drivers/platform/x86/dell/alienware-wmi.c:535:1: sparse: sparse: symbol 'dev_attr_zone01' was not declared. Should it be static?
>> drivers/platform/x86/dell/alienware-wmi.c:549:1: sparse: sparse: symbol 'dev_attr_zone02' was not declared. Should it be static?
>> drivers/platform/x86/dell/alienware-wmi.c:563:1: sparse: sparse: symbol 'dev_attr_zone03' was not declared. Should it be static?

vim +/dev_attr_zone00 +521 drivers/platform/x86/dell/alienware-wmi.c

   520	
 > 521	DEVICE_ATTR_RW(zone00);
   522	
   523	static ssize_t zone01_show(struct device *dev, struct device_attribute *attr,
   524				   char *buf)
   525	{
   526		return zone_show(dev, attr, buf, 1);
   527	}
   528	
   529	static ssize_t zone01_store(struct device *dev, struct device_attribute *attr,
   530				    const char *buf, size_t count)
   531	{
   532		return zone_store(dev, attr, buf, count, 1);
   533	}
   534	
 > 535	DEVICE_ATTR_RW(zone01);
   536	
   537	static ssize_t zone02_show(struct device *dev, struct device_attribute *attr,
   538				   char *buf)
   539	{
   540		return zone_show(dev, attr, buf, 2);
   541	}
   542	
   543	static ssize_t zone02_store(struct device *dev, struct device_attribute *attr,
   544				    const char *buf, size_t count)
   545	{
   546		return zone_store(dev, attr, buf, count, 2);
   547	}
   548	
 > 549	DEVICE_ATTR_RW(zone02);
   550	
   551	static ssize_t zone03_show(struct device *dev, struct device_attribute *attr,
   552				   char *buf)
   553	{
   554		return zone_show(dev, attr, buf, 3);
   555	}
   556	
   557	static ssize_t zone03_store(struct device *dev, struct device_attribute *attr,
   558				    const char *buf, size_t count)
   559	{
   560		return zone_store(dev, attr, buf, count, 3);
   561	}
   562	
 > 563	DEVICE_ATTR_RW(zone03);
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
