Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3F63A1E6E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 20:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767211337; cv=none; b=WEsvnzbvKRBOeP1/+mOdyDoApMGBO9ioCOCPzD6x3PMmpPEGyDu8exadKXRWgO0vMwbrr5iHpsB3lIZ/p2tOKS7ZQzCNB3Fx3TRaB5bHyT7vRlnyHSaEt08qehdjNK37BlcDwXDiEPP9gYOOCCvDNFFI/BjPHYQqdgGb8Uf/l+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767211337; c=relaxed/simple;
	bh=Bbg/PTdIj61dHsOzp0PGj9RYQ9giB10ojNz2hbjdMGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NF4ss5sw4ig0aeIkFMWCouPAsXXF3wuFQUV5laSaKUTcsDjPkdh/+80qW2bqG6+pu+nf+MPcz++mYorEVBrbS3GKe7zSl+qQfqJOhfHE5VMwhYp1aNzh1aU3Sd43u0uBGaWSQ+TBHwuvCj2xeV0cVXADizXDMjYfC45RqDIFBs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bukNPxJn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bukNPxJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767211336; x=1798747336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bbg/PTdIj61dHsOzp0PGj9RYQ9giB10ojNz2hbjdMGg=;
  b=bukNPxJn1W6IIRhJjJygzRHsF67a3BfJB3Qah3PMfRr/ZMV+fghgo3R5
   N00e3bSygUSSeqG8fQG5rPsmQfLmJJb5xjjW4vI8xogvyjFSyeeAxbdbM
   gWL6OpFpYYOtAmuo0dsg7bQp0GxvyIdYvkKePoEf8rgbr9CvOsWFFKU+e
   eNPEamzAYCFmIFCEvieWFb5dVwxRqyXV9w8WzxcW09Ajkoifrb883ymDs
   6R9iyaKnOjmLyM1Y4ZyVZ+l92fdO5n9268JhXK7CDKwVulCrNF7g/030j
   skS0cjUbjO1G/jdchO590rnKk2wIQQKMlwSEnWn0UWVSs4rWkaftSp+UZ
   g==;
X-CSE-ConnectionGUID: xqOfRXW7R4O4JYe1M3Fn9w==
X-CSE-MsgGUID: lE8nkWp+Tra8s53rZ1+Q1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="80150829"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="80150829"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 12:02:15 -0800
X-CSE-ConnectionGUID: hVnHuEhnR6WC9a/bdQ/TVg==
X-CSE-MsgGUID: N9Oc2eFxRX+1oufGdtmJUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="202456887"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Dec 2025 12:02:14 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb2OZ-000000001S1-26oc;
	Wed, 31 Dec 2025 20:02:11 +0000
Date: Thu, 01 Jan 2026 04:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-next-2 29/31] lib/dynamic_debug.c:1304:24: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202601010356.s9OlXwlF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-next-2
head:   a91aa8738cf704e0a0b3137f93bfd3b9bcef20c0
commit: 85feb71d39a764c22e8ef05b1a81b1957736e3ad [29/31] dyndbg: resolve "protection" of class'd pr_debug
config: alpha-randconfig-r133-20251231 (https://download.01.org/0day-ci/archive/20260101/202601010356.s9OlXwlF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010356.s9OlXwlF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601010356.s9OlXwlF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:1304:24: sparse: sparse: Using plain integer as NULL pointer

vim +1304 lib/dynamic_debug.c

  1296	
  1297	static struct _ddebug_class_param *
  1298	ddebug_get_classmap_kparam(const struct kernel_param *kp,
  1299				   const struct _ddebug_class_map *map)
  1300	{
  1301		struct _ddebug_class_param *dcp;
  1302	
  1303		if (kp->ops != &param_ops_dyndbg_classes)
> 1304			return false;
  1305	
  1306		dcp = (struct _ddebug_class_param *)kp->arg;
  1307	
  1308		return (map == dcp->map)
  1309			? dcp : (struct _ddebug_class_param *)NULL;
  1310	}
  1311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
