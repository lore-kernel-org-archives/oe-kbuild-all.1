Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C9185920
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 23:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737416546; cv=none; b=BbgNgKjPSuucJ5fhSqJ/bQvH2ES7cHKAwzIR5hVVzk0yvI1upNQ/5rXZt0mj5P+3aELV18aICXrQ/1ZFGG8PMztpkFX58ceTOoOo/OX/G57/3tWhTZVRZ/pVuXqha5MtSfu+EVrs1JogudaC6s2w3gxTyjRsptqR9jSrSENg3fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737416546; c=relaxed/simple;
	bh=CSvKZNRzM/0ZzgCX9thNg8YNK1topqvBTvIMVIIyS48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CStL/XitlStGcidH0xLPrVhLjWpcTAkzBYYIgS2DRiVeOuMKgqUk2SnZuUxISWv53KXnpIoobqZ7iy9lZY0N3qAUW9CnlfHI/U9xXSijBm1r3p36/MIDrXWTzxcn7gjppz5wxGe06Km63KDQwnjK/BBIoaBwlWfLlGn30NMqaTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nf8scPXk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nf8scPXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737416545; x=1768952545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSvKZNRzM/0ZzgCX9thNg8YNK1topqvBTvIMVIIyS48=;
  b=nf8scPXkBdUn/8kHMABIkzFQNgFUmimj7ndqHMHkYNhjoQ/iUnmeyVsx
   C6/0bnWXQZgfP3ZRkesYS/9GpWixiHd6knihwJpIshJXIy1yi3LoRteWG
   crG90YWfmSsftmsiCAfOlVTHHNZLEMKBFhYoi2GVMS7KlhUET4mwNUg+V
   T1sJM2Cot9V3AaHg4+NWPLt4zVmc0wbU8OTO9I8YD7WeEpivgYwb3abj8
   VZACfQk8BR+FK29dX2/uezGfsGUCNA75zCNCJnYrM0dRsTSYE1q6f6t6I
   fjwksjgUcQuxneQfoavP2LR7rqVwErrZFxqH3hBrlN76V+v/ct+Cd6iPE
   w==;
X-CSE-ConnectionGUID: 3HoR7sgATFyXfiPfhGb/HQ==
X-CSE-MsgGUID: lytbhAh+T9uO2lssU3iHXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="48407494"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="48407494"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 15:42:24 -0800
X-CSE-ConnectionGUID: /CY4D4V2Q/mfJD5aiZlu1w==
X-CSE-MsgGUID: V1NUW64WQsq4yWVrlrk/zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129906828"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jan 2025 15:42:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta1PQ-000XMJ-2P;
	Mon, 20 Jan 2025 23:42:20 +0000
Date: Tue, 21 Jan 2025 07:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1833/1833] mm/mem_reliable.c:345:9: error:
 implicit declaration of function 'mem_reliable_ctrl_bit_disable'; did you
 mean 'mem_reliable_ctrl_bit_disabled'?
Message-ID: <202501210717.sGx6dRjf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   88ee450e4bfbe03d27189e9a1a794f610ad57ae5
commit: 425771499c0742a996ab28df143d7a5123102686 [1833/1833] mm: mem_reliable: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-r061-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210717.sGx6dRjf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210717.sGx6dRjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210717.sGx6dRjf-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mem_reliable.c: In function 'mem_reliable_feature_disable':
>> mm/mem_reliable.c:345:9: error: implicit declaration of function 'mem_reliable_ctrl_bit_disable'; did you mean 'mem_reliable_ctrl_bit_disabled'? [-Wimplicit-function-declaration]
     345 |         mem_reliable_ctrl_bit_disable(idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mem_reliable_ctrl_bit_disabled
   mm/mem_reliable.c: At top level:
   mm/mem_reliable.c:320:13: warning: 'mem_reliable_ctrl_bit_disabled' defined but not used [-Wunused-function]
     320 | static void mem_reliable_ctrl_bit_disabled(int idx) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
