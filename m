Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC7B1755E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707129386; cv=none; b=iw9ViTvsF8KXpYpxqEn+wApNR/hDsdBvIBfT/MJvuEGNuEyuN3V//ATDByZfT1boMcfB5ILM02WwYPL6Pap0WKfUTQkMbPM6067a52sWyI0kJwiyzMa4MA5QAWXBXciusZIkYtw9oywtSsGeJPTKsus+D3czGfSLEbYcNHi9sh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707129386; c=relaxed/simple;
	bh=lwstbBDomVaE9gozOTEyB5gbo1ql7yZcxJ9MBcS/k1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r1sQQz+IQKmRhtFvzrVUx5ldheeQJcw1OO31vRr+b3VZ00wRv+s1NgtTxTvWgf1ZY+2cHpadidO1YzkZkp14tDQpYcTsDxTtYS0JUIV2vK4RV6uo0punRK/IFxLH0l+CQ7+o/PzZT+poPPG1e2BZ8b1gk3efb39fwE5mUKX8zDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2SCktfr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2SCktfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707129385; x=1738665385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lwstbBDomVaE9gozOTEyB5gbo1ql7yZcxJ9MBcS/k1Q=;
  b=e2SCktfrnl1ZJ7ehdmUq40qmP87Shyduum4iZL8JpHS2svAWrp7WsM9G
   WGd2XqFQy0OApJFhSbk5p9Oc/HH3PgKSlhb9hMUqeyRnNtGF5msRzuyed
   2TDlOVuNVx3o1t9cQSjnvLkqtCwJaOUU8hpr0znKt/DFTlBSY+fdUU/KQ
   oaAmmgmgkjYN6bo1gJROHkpq/Lr06KqEfuxbEXIKKTEAP5fITbu2rcrGU
   td2Gf/3+xDzZafDeEEZgcYttwix7esuFs0e05C2ZxrMIl3/pdYn9B18Cf
   E+0TXxM+0Iq7KNTcA3xGBSGWbz0ApnVeVtDxAFkm6UuS7O5iurXKFqArx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11866195"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11866195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 02:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="977198"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Feb 2024 02:36:22 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWwKq-0000O6-1u;
	Mon, 05 Feb 2024 10:36:20 +0000
Date: Mon, 5 Feb 2024 18:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2403/2965] mm/mem_reliable.c:345:9: error:
 implicit declaration of function 'mem_reliable_ctrl_bit_disable'; did you
 mean 'mem_reliable_ctrl_bit_disabled'?
Message-ID: <202402051838.GXTgdTCQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b90fb300320b834bfe9ab7eff95cfa536fdc86b8
commit: 425771499c0742a996ab28df143d7a5123102686 [2403/2965] mm: mem_reliable: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-003-20240205 (https://download.01.org/0day-ci/archive/20240205/202402051838.GXTgdTCQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051838.GXTgdTCQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051838.GXTgdTCQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mem_reliable.c: In function 'mem_reliable_feature_disable':
>> mm/mem_reliable.c:345:9: error: implicit declaration of function 'mem_reliable_ctrl_bit_disable'; did you mean 'mem_reliable_ctrl_bit_disabled'? [-Werror=implicit-function-declaration]
     345 |         mem_reliable_ctrl_bit_disable(idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mem_reliable_ctrl_bit_disabled
   mm/mem_reliable.c: At top level:
   mm/mem_reliable.c:320:13: warning: 'mem_reliable_ctrl_bit_disabled' defined but not used [-Wunused-function]
     320 | static void mem_reliable_ctrl_bit_disabled(int idx) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +345 mm/mem_reliable.c

   322	
   323	static void mem_reliable_feature_disable(int idx)
   324	{
   325		char *str = NULL;
   326	
   327		switch (idx) {
   328		case MEM_RELIABLE_FALLBACK:
   329			reliable_allow_fallback = false;
   330			str = "fallback";
   331			break;
   332		case MEM_RELIABLE_SHMEM:
   333			shmem_reliable = false;
   334			str = "shmem";
   335			break;
   336		case MEM_RELIABLE_PAGECACHE:
   337			pagecache_reliable = false;
   338			str = "pagecache";
   339			break;
   340		default:
   341			pr_err("unknown index: %d", idx);
   342			return;
   343		}
   344	
 > 345		mem_reliable_ctrl_bit_disable(idx);
   346		pr_info("%s is disabled\n", str);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
