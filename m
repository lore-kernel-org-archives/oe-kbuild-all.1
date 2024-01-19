Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF77056472
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 20:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705697959; cv=none; b=YSmAh+hkCCZkLkykRf4K55qZWlG5RjRSW04uYYICu/8mF8E3hkqBNxTCsF8UuU4vR+6X975jcMYoY719v4vLj/5bDtd4RwWDOBPt1gqFRpBRnCGGbC68pRrOfVH7LcowBCCgOMWvOrT3e/UTRNxczCsYlhSfgWXN0b3lC39yzdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705697959; c=relaxed/simple;
	bh=h/0ilGRjr3cNhsf7dlnKpzDEFsW1bYoN3pno5nJ869Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AWc3oiXIfir2g7eMVgUsoaXiD8FxONZPAVcha0DEf4JAT5tLavFtJDAfo4ADQ7+hCT+Tf37MERMdGCx6a2I1oVggmHgenaM7yKazdLPZutAUk4DBmMWqqJUcaxm4EjT69qhflY7xPtd3dRZ+9+mnZw/GIIE/udJHoug1YvTvbho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j36YNSRh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j36YNSRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705697957; x=1737233957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h/0ilGRjr3cNhsf7dlnKpzDEFsW1bYoN3pno5nJ869Q=;
  b=j36YNSRhDFC6w+AL2N9+j+rx9whdGkPPhPGnW1lk+Nz/kFtOPmqODlG7
   gAK83crde0byr5nBCOGeyuH1Pcb5np/7UNKBzb0g3dLrVx3Tz9ZvEA1bU
   Aq5C3EsJA5MmoPKw9XYhQZJl6wGx8RGC+Fq29iJq2L4Y2wAnaOaWT8eS4
   /4IZUb4xD8PWovcZ/XO5gM/h8sMmRVQHwr+R6/KKggSYVKfLVkFeC8c/7
   PeHPC+qowiaXgmo/RfzQsIblb0/IktQnRG6wcEQRljDbI2PFfUtiigtrM
   CpD4pMMy7GO4xIOkgrqYbs+T4zUnZotZ84bZJcBiYYGXgTR3CLo09ZF78
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="7527087"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="7527087"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 12:59:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="761229271"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="761229271"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Jan 2024 12:59:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQvxI-0004QK-3D;
	Fri, 19 Jan 2024 20:59:12 +0000
Date: Sat, 20 Jan 2024 04:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/bbr3 1/1] tcp_bbr.c:undefined reference to `__udivdi3'
Message-ID: <202401200422.IPB89V67-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/bbr3
head:   5d8376057790252b220d3a5eea2b628106f69d38
commit: 5d8376057790252b220d3a5eea2b628106f69d38 [1/1] tcp/bbr3: initial import
config: i386-buildonly-randconfig-002-20240119 (https://download.01.org/0day-ci/archive/20240120/202401200422.IPB89V67-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200422.IPB89V67-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200422.IPB89V67-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/ipv4/tcp_bbr.o: in function `bbr_packets_in_net_at_edt':
>> tcp_bbr.c:(.text+0xef): undefined reference to `__udivdi3'
   ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs':
   tcp_bbr.c:(.text+0xcd5): undefined reference to `__udivdi3'
   ld: net/ipv4/tcp_bbr.o: in function `bbr_quantization_budget':
   tcp_bbr.c:(.text+0xd46): undefined reference to `__udivdi3'
   ld: net/ipv4/tcp_bbr.o: in function `bbr_inflight.constprop.0':
   tcp_bbr.c:(.text+0xe1e): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
