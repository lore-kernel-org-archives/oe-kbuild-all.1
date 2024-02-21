Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D5081737
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708537397; cv=none; b=iqHQq4PC4OPUsaL3k1lJp9rXt7JgjA78Z4mjfGrMcK7KhWA89mFfFtAXish6piwjDGmVspu3LAauuQarx48ckay7uUr92JwORS0qZvtls0vCju+pGU9mFITfY3uuX7lHPvfkHEG73JEJ2CwL9Yi3qe02rhQ1TirMVqHPuUB+s9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708537397; c=relaxed/simple;
	bh=HFjG881lGNg06q4sPERHHloRMTId3j01N8n0czE7+PI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BsxKkEmwMeWJuIMubhbTBOKg7UzcKDX6BZDvQLTwxOazbkZPY6oOqXGy29X/riyojH5ATQQ6kEwS5PTk3KB5eNfUGOuF97OX95UVFxZ6+D2e0Ty3GIKyznAmjOZ/6HBxYx5vrAcaUj5gg+2ETn2V/DHJcjN5p0hZQljZbz2Xdaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zt+bVF2i; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zt+bVF2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708537395; x=1740073395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HFjG881lGNg06q4sPERHHloRMTId3j01N8n0czE7+PI=;
  b=Zt+bVF2ieh5Ms6qcu47eLOWDrt2y+Cz0etfYvhRg4eU/8A2QuqG4QPjY
   ZUSIczJUgpjdcY9ItL3m/4wECbHl03U0qhrz4h7oupi+8dDZmmG803rc/
   8+N01ikbrA9bwf7zqq4cHI3XybojN88hYq/t4qjx9vstkPIHWOCgsDyQ6
   n+B1is5zhlz9TAHj6i+b4VfmKKXMTIplZOWt9KGUQ8d/CG1QhSsbBJ2tF
   8IQVVaA7hTdisBhLwT+Vi6vZYuvRoMmvInjylUbt2y+yAQaGoRU3it0bR
   D1INUTgsdlF1wkBNGaWRgvjXtDhMZtN8/k3EnbHNRXZP7Fsy1beHSHmYb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14136877"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="14136877"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 09:43:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="9769344"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2024 09:42:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcqcC-0005YK-1t;
	Wed, 21 Feb 2024 17:42:49 +0000
Date: Thu, 22 Feb 2024 01:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: net/toa/toa.c:255:45: warning: unused variable 'ipv6_specific_p'
Message-ID: <202402220136.DXHjoS1J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.
date:   2 years, 11 months ago
config: x86_64-buildonly-randconfig-004-20240221 (https://download.01.org/0day-ci/archive/20240222/202402220136.DXHjoS1J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220136.DXHjoS1J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220136.DXHjoS1J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/toa/toa.c: In function 'hook_toa_functions':
>> net/toa/toa.c:255:45: warning: unused variable 'ipv6_specific_p' [-Wunused-variable]
     255 |         struct inet_connection_sock_af_ops *ipv6_specific_p;
         |                                             ^~~~~~~~~~~~~~~
>> net/toa/toa.c:253:27: warning: unused variable 'inet6_stream_ops_p' [-Wunused-variable]
     253 |         struct proto_ops *inet6_stream_ops_p;
         |                           ^~~~~~~~~~~~~~~~~~
   net/toa/toa.c: In function 'unhook_toa_functions':
   net/toa/toa.c:295:45: warning: unused variable 'ipv6_specific_p' [-Wunused-variable]
     295 |         struct inet_connection_sock_af_ops *ipv6_specific_p;
         |                                             ^~~~~~~~~~~~~~~
   net/toa/toa.c:293:27: warning: unused variable 'inet6_stream_ops_p' [-Wunused-variable]
     293 |         struct proto_ops *inet6_stream_ops_p;
         |                           ^~~~~~~~~~~~~~~~~~


vim +/ipv6_specific_p +255 net/toa/toa.c

   243	
   244	/*
   245	 * HOOK FUNCS 
   246	 */
   247	
   248	/* replace the functions with our functions */
   249	static inline int
   250	hook_toa_functions(void)
   251	{
   252		struct proto_ops *inet_stream_ops_p;
 > 253		struct proto_ops *inet6_stream_ops_p;
   254		struct inet_connection_sock_af_ops *ipv4_specific_p;
 > 255		struct inet_connection_sock_af_ops *ipv6_specific_p;
   256	
   257		/* hook inet_getname for ipv4 */
   258		inet_stream_ops_p = (struct proto_ops *)&inet_stream_ops;
   259		inet_stream_ops_p->getname = inet_getname_toa;
   260		TOA_INFO("CPU [%u] hooked inet_getname <%p> --> <%p>\n", smp_processor_id(), inet_getname,
   261			 inet_stream_ops_p->getname);
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
