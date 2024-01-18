Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1B62C6BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 17:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705599329; cv=none; b=lSCd84i1xEqybc24UNv/DJ9yT2K4Ze3E9tNB2xtolTOitZ6EGQzsw2WtxYlCs0EAzEz/t9wiQ1NqcGorBzOh5szIF9L2grGrQTXwnOGTHyM6fzf9WueFbJ2QfcQp51mfgnW+xsnWRwGvbKQP48m0uO3mnfPbQX0iQbXHmyhYEkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705599329; c=relaxed/simple;
	bh=kZWZOTex7He1qTbQbw5NXcfJ4xVC9+sqY1xj8BFG/LE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X+Mr02alWrhvUpNiPdMLo3Mi3kfX2twBvUW9P5ZkLRZhuHcF/+D7hj9CP/u9z4PAGHfyX0D0bgYU9ItLV43pS0dkHwoH6UxqHULeNFmIRnOhSDCX5nZ+W6q5uP1mJvFzaREY7QhE/9luWXhj+vhdRYOhAlKD3HX1FSGxwQ+AYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlcrLNzu; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlcrLNzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705599327; x=1737135327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kZWZOTex7He1qTbQbw5NXcfJ4xVC9+sqY1xj8BFG/LE=;
  b=HlcrLNzuXU9wHrtl7JbWJM/ykpp45lth3cD5vQ7I1UoN2zQSddKLMDPi
   HpkU6hpGYzPfQS9b/wePs8uH0VOH888VAU00kAAkkF6G2j7TtVLs8kj5F
   5RsddgpxWLduKaKryIkdsRWfsNPBJQIfe26sZWVDnNsHmeqREynYFEE7+
   O4hlIr9yi4Y/xTqciK9uYsTL2cuaumIFYeh14zgjsAb/B4Ad88h71CzRy
   olF1i5jA9dm8zBAs2fJS6eeQYDLc2GfgNSO204YhiAM2dKVGC9OTQFPIl
   V6L7hbR9LK7EA1Nm7oQV5FKAJq04Q4N9seuG2TeD4+yMC4kUo34B6IpVJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="399391529"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="399391529"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 09:35:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="818841650"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="818841650"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Jan 2024 09:35:24 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQWIU-0003BB-0b;
	Thu, 18 Jan 2024 17:35:22 +0000
Date: Fri, 19 Jan 2024 01:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vishal:vv/dax_abi 4/5] include/linux/memory_hotplug.h:266:13:
 error: unused function 'mhp_supports_memmap_on_memory'
Message-ID: <202401190108.kOcbgPbk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/linux.git vv/dax_abi
head:   d3de88ca301b687923a19a41d16a22afcd9c40a1
commit: 8c76ff6fca69d280f0a316831957accd9ded09b8 [4/5] mm/memory_hotplug: export mhp_supports_memmap_on_memory()
config: i386-randconfig-063-20240118 (https://download.01.org/0day-ci/archive/20240119/202401190108.kOcbgPbk-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190108.kOcbgPbk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190108.kOcbgPbk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:9:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1425:
>> include/linux/memory_hotplug.h:266:13: error: unused function 'mhp_supports_memmap_on_memory' [-Werror,-Wunused-function]
     266 | static bool mhp_supports_memmap_on_memory(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


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
