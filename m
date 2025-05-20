Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D4C265CAF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731558; cv=none; b=PKYX0lhPUBu8N9KatT+xiuHujS6E/BztLH2rgllatSsuPnSkxt72SP9O52FOD2OUUHVqzDIDl9vTDviRpeHuPce8ZT4MRXybSBVBClDV306trAuNdP8VVC1vJbqCq369hMzNsB1SQc1qGifh4/+LybUkfBHPrHmv4RqGbMf1jRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731558; c=relaxed/simple;
	bh=DPK/lxFevY1ENl7gslnit0Fr52zOqsFw7uUSbHWbGmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tBYzG99f8yNEocLtfUUulRDeavrJwDH/+0/9BDF39l8wM0xLU0HX1fo/Fmjer5i5QaHSFjW86GAJdmJFQioW/ohxeo5b7M3icbXuuavuRpJOQSNnkqL5QaIRCOaEHsspoJKmqtaNjAGp31iO/T0HQdXYmp6Vh4Hi3dkRZCzqWPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWGGZOwL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWGGZOwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747731554; x=1779267554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DPK/lxFevY1ENl7gslnit0Fr52zOqsFw7uUSbHWbGmA=;
  b=FWGGZOwL7xyPXc8h5GdWkn5nLPehX2BCnNki80rlo6HfKB/0KcdCalt8
   eyTIW1y0J/23i0UIcIB5VBj+amgG9SnJRX2DTgSz4NHk4u91zjkfyuGU6
   ZEhBB2zamPIOGfVMBhKG8GSglMH0FMo+mCrF9Slwp1Ku0aXsIfP0Hh9zj
   J2Z0B17NF3Sv7ZIFkybJQO/XhCXjq+AWJQvevFTZ4WHdjo0yXGmr7P6af
   9QkF6lni3roqAF3GxIqEYhhyD/v4MqoHTD61ofdC5YRCEPSEl3A6z5VJX
   wMSLDoZNRG14bF1fYCMZIPgL4K5NnQOyN9FXjAZaPxMDyfWEbSnBwzJ9d
   A==;
X-CSE-ConnectionGUID: oz7kjJvoRCSfL/6WujF+5w==
X-CSE-MsgGUID: irZneujmRJeGNRgE1XNOwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52285564"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="52285564"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 01:59:13 -0700
X-CSE-ConnectionGUID: jbeM91wBQSCpMPTjcOMNQQ==
X-CSE-MsgGUID: G/qb7ehZQqaGN408s3R20w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139511286"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 May 2025 01:59:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHIoX-000MMG-0r;
	Tue, 20 May 2025 08:59:09 +0000
Date: Tue, 20 May 2025 16:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2257/2257] mm/memcontrol.c:4428:12: warning:
 'mem_cgroup_check_swap_for_v1' defined but not used
Message-ID: <202505201603.DayzxkWd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   289de29f4f837038aa79e765e64ddc1d410fe5fd
commit: a095a940f784db58ea4e87df361f9a4fd0dd977f [2257/2257] memcg: add restrict to swap to cgroup1
config: x86_64-buildonly-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201603.DayzxkWd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201603.DayzxkWd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201603.DayzxkWd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:4428:12: warning: 'mem_cgroup_check_swap_for_v1' defined but not used [-Wunused-function]
    4428 | static int mem_cgroup_check_swap_for_v1(struct folio *folio, swp_entry_t entry)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mem_cgroup_check_swap_for_v1 +4428 mm/memcontrol.c

  4427	
> 4428	static int mem_cgroup_check_swap_for_v1(struct folio *folio, swp_entry_t entry)
  4429	{
  4430		return 0;
  4431	}
  4432	#endif
  4433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
