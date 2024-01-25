Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF62967C40
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 02:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706150904; cv=none; b=rir+YkM3+Dprj5Ce1kgU4IfjDKcylw56mFN8gQlBol5UKBn/IvWdekPOMFSDgJ6Y6Eg0npQQOHVawcEkVemFPaokNJ2X+ou1sCB0FO+G3/vNABN/vTE1qhSd1aRSNz1wIXfhIBt2/7PCNp8z1fgdxSP9bCqwTtlbE96+7SAbsoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706150904; c=relaxed/simple;
	bh=M6rArGNYSJX5Xyh7SnVQ/I92T4vlIn4dQmvTtZG09j8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D2AE+9UqdCeIBXbT6MqaqJWfqBnBtH7hKw9l3bZwUirx1I7uA02OS/N79uAg7j3q5BnTFGthFQJ3uadyatr9pmhSAKNz1cXic7zHHLVsGKOnRtbLvwt+sUARgWGsPUmBAaZyMuRD3mTlZaC1Dc/z9J6JENFLQgIk2rjn7KyilOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvVjf/lg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvVjf/lg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706150903; x=1737686903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M6rArGNYSJX5Xyh7SnVQ/I92T4vlIn4dQmvTtZG09j8=;
  b=GvVjf/lgVEoSeDG5Ns1IEniz/YZslDnhMth/LcX+bNuvjWodcRrpERKP
   F2cMZWWAz5wNY0yFTfLd8MEjP7xj4gNUZu2lI7YczKujWqIwA0QTjJ8fK
   XI2mSbzBn9/dEiCCRRap+b8NJ0o3Ci2HyjaIIRXLXVhQN1bhVdFWY3f+s
   pahVk1XixfR+mpBGrFL8MGDLc8yvPC2Bkg/Ye8B/YGawSg9ZWmCePYAYK
   DFTci8s9UXwCroKJxzMAO5beeJIYDrqc7mVZ+bNo4HcIcxgOo7sMkDEbu
   jOJd0MoQ/OcKUVh1iS8aI3YqJHRr8HXPiGhXpiMlS733C8WJF4f24wa8v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15570952"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="15570952"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 18:48:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905822579"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="905822579"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2024 18:48:20 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSpms-0008au-2r;
	Thu, 25 Jan 2024 02:48:18 +0000
Date: Thu, 25 Jan 2024 10:47:43 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vishal:vv/dax_abi 5/6] include/linux/memory_hotplug.h:266:13:
 error: 'mhp_supports_memmap_on_memory' defined but not used
Message-ID: <202401251054.6miWMRlA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/linux.git vv/dax_abi
head:   7b18b50e5778a1abc835957102c45b1140bbc2b5
commit: 82a0cdb33619455fb73bd3f54ae580e2ddc7dcb1 [5/6] mm/memory_hotplug: export mhp_supports_memmap_on_memory()
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240125/202401251054.6miWMRlA-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251054.6miWMRlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251054.6miWMRlA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:1425,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_bitops.c:9:
>> include/linux/memory_hotplug.h:266:13: error: 'mhp_supports_memmap_on_memory' defined but not used [-Werror=unused-function]
     266 | static bool mhp_supports_memmap_on_memory(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/mhp_supports_memmap_on_memory +266 include/linux/memory_hotplug.h

   265	
 > 266	static bool mhp_supports_memmap_on_memory(void)
   267	{
   268		return false;
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
