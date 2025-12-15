Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F10329E74
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 08:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788180; cv=none; b=OvZdFjLJ3BKH+ggXwIrt9B31UKidyEfHcA1s1U/FE+zuP5k4d9z8yQVyKlZiJEtnBhG/2DWEMAOImHzhzK5xrd0mcC2FAUbgrC7jAyNL8VUlhsdJgYNdjK3QmtU8gAjlAdtQTQTUEJSrCADeShEzXvQEf9S48NsvWRrVnpf2+s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788180; c=relaxed/simple;
	bh=brtW7xzfVTPVQRY/HLP2Ii6G1YmjplnYN5pyrVJoKSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LNgza56qRc1AHHjEckwBTv4T6orS1RR5jjnFWaab6eMBZ4JCc50m0B6LUcGR3wg5AzMTNwPjD1Et1QHVxwYmRPtPo53EOIMDpEIEXEprFuQa4iSMMRWYidb17pFNDSTXhAYu2fhVJ/e1lrrTUDTZ9euDPIcM9PYoD+exKe9XSew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDt8hTv+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDt8hTv+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765788179; x=1797324179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brtW7xzfVTPVQRY/HLP2Ii6G1YmjplnYN5pyrVJoKSY=;
  b=DDt8hTv+qcb1jIK8OoT8xUU7yFA5EsPM+XwvXJw/41PZOQubV1cF9Cnl
   j7iEdukB1IK5NME+BRA+JL8zz1i9A3OcfXRRANPJeTJVszIJpaGKRVK9G
   zUsy9hsHl6HchDQ+wYqFAWkyyEAj11vTltJO3a23VnXPgN5PxtEr25iDK
   rl4Td+9PywhzDlEdZKGp4QHtLqszhXDzHnU9eF3BU+9Pysb0PWPhev4df
   rQbpSKmwDz2NStvTSmuxaKXs5OsnHdvpladBkV+RpKhqXRVzbseSIAmeD
   B3o9jqe8oBgjnvAMW18W+t2tbjCKkQgxdgES1iG0ka+u0B5SVcjTQdiYl
   Q==;
X-CSE-ConnectionGUID: j4dGqeXgS7CVQwVdXgFmGg==
X-CSE-MsgGUID: /XNyeDEnSnyvmQhJAOw51w==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67561438"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67561438"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 00:42:56 -0800
X-CSE-ConnectionGUID: ou9xsl31RGGEMGfPf+FTMw==
X-CSE-MsgGUID: Vu4pAO+FRFSp7p+etmECIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197561764"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Dec 2025 00:42:55 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV4AO-0000000005X-3Xh0;
	Mon, 15 Dec 2025 08:42:52 +0000
Date: Mon, 15 Dec 2025 16:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542] arch/x86/kernel/early-quirks.c:727:34:
 warning: no previous prototype for 'kh40000_get_direct_dma_ops'
Message-ID: <202512151614.LDi8I6GA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   81b22958142c03b02c766c79cd1554ebfa142be4
commit: 11557c1ae4529f133483879b7ee00b7d8c653be7 [3542/3542] x86/cpu/zhaoxin: Encapsulate access to kh40000_dma_direct_ops within function
config: x86_64-randconfig-161-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151614.LDi8I6GA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151614.LDi8I6GA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151614.LDi8I6GA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/early-quirks.c:722:6: warning: no previous prototype for 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     722 | bool is_zhaoxin_kh40000(void)
         |      ^~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/early-quirks.c:727:34: warning: no previous prototype for 'kh40000_get_direct_dma_ops' [-Wmissing-prototypes]
     727 | __weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kh40000_get_direct_dma_ops +727 arch/x86/kernel/early-quirks.c

   721	
 > 722	bool is_zhaoxin_kh40000(void)
   723	{
   724		return zhaoxin_kh40000;
   725	}
   726	
 > 727	__weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
   728	{
   729		return dma_ops;
   730	}
   731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
