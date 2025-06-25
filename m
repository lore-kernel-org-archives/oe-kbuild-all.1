Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029EB2C325B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 17:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750872773; cv=none; b=ke9t/OeN7JWPBnHOgFdXd+F+/cK66JPR5JXG0kDjcsPRwbL/z3ffJ1vW8qIWC8hvjSxuKcweEYff/PVwVMx2rIJ1CY4gJJmzhnjiSyXDH68AHXTIlAfFVmpPaPNmmYVnBDwaq1Gon/QFPvrurZiAiLrBNzytq5BPQzKPVKPBnxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750872773; c=relaxed/simple;
	bh=1hMQDfeXncGWdS7X2ShYad/6MSGW9Vw16KtcFCAvaHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTNGxEElMAonH4hkjIYc5oXDNblmIDJulpN9zTk7ao8cztRjhaFO1/4h4eNP/cxPHbjJrQa+g8MCGh27HedILJ9er4MoV/1jQJrLhX0BIMQz9/cfhupZyr+lN9qxIfoxDFerU58JMUd/fz5VQnKSPKsFRiSPoDeCSaXU+uhWs2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0AjE1PF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0AjE1PF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750872771; x=1782408771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1hMQDfeXncGWdS7X2ShYad/6MSGW9Vw16KtcFCAvaHg=;
  b=i0AjE1PFMRBhdTllAuWqtmnUpZnTss3XYKm9Vh2An1EOnVATG0i/zUdm
   w2+5BtLQgel9StgGgSIg224xY/6GgsJ9kgixVyhFhMKIDvR/9JEWGhLFk
   o39KAo+AeajEqiS3ow8fc97awKzQ2FoLJzIc+hDdm2PAlYUgcBzGRdHDx
   UO6CwTrLG4pkzJZeEv94KW2LWQkGE8m62fZ1+f+24Ittg3aRQ7Ai/Jn44
   +Vq9H0NOI9DYnuhbKistg71+ak09m+xdt5rz5c01kXMEMFaxVbthFjgFp
   SVRs7NJmi52En33LvRxAmUMAE7hr/RagVYDyWV0jApHVR2CN3J+6Z47qA
   A==;
X-CSE-ConnectionGUID: G81dWFJqRniKwWxKl4LbUA==
X-CSE-MsgGUID: MOPLGBEwQki7wQZ3AQD6pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="70586972"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="70586972"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 10:32:50 -0700
X-CSE-ConnectionGUID: gbJtHF/JSqG84QIeUgnmXQ==
X-CSE-MsgGUID: amPUlWoqTkKAtS5MY4m9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="158038099"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 25 Jun 2025 10:32:49 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUTzL-000043-0O;
	Wed, 25 Jun 2025 17:32:47 +0000
Date: Wed, 25 Jun 2025 19:32:11 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] arch/x86/kernel/early-quirks.c:722:6:
 warning: no previous prototype for 'is_zhaoxin_kh40000'
Message-ID: <202506260155.UP7h1X4B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 8eaba08b2d72718a40cafe3402ab4f26b0dc62eb [2195/2195] x86/cpu/zhaoxin: Encapsulate access to global variables within functions
config: x86_64-randconfig-2005-20250501 (https://download.01.org/0day-ci/archive/20250626/202506260155.UP7h1X4B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260155.UP7h1X4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260155.UP7h1X4B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/early-quirks.c:722:6: warning: no previous prototype for 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     722 | bool is_zhaoxin_kh40000(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/early-quirks.c: In function 'quirk_zhaoxin_dma_patch':
   arch/x86/kernel/early-quirks.c:737:28: error: 'kh40000_dma_direct_ops' undeclared (first use in this function)
     737 |                 dma_ops = &kh40000_dma_direct_ops;
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/early-quirks.c:737:28: note: each undeclared identifier is reported only once for each function it appears in
--
>> kernel/dma/contiguous.c:209:13: warning: no previous prototype for 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     209 | bool __weak is_zhaoxin_kh40000(void)
         |             ^~~~~~~~~~~~~~~~~~


vim +/is_zhaoxin_kh40000 +722 arch/x86/kernel/early-quirks.c

   721	
 > 722	bool is_zhaoxin_kh40000(void)
   723	{
   724		return zhaoxin_kh40000;
   725	}
   726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
