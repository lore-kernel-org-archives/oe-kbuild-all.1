Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D775D18C933
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 19:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451930; cv=none; b=h18c1lJHgXTh1it2SDR+whpOQAOD2kTXsGVYX+QwFwJMuhVw82jJdgT6WcdIN1VyaBCuuQL+x1ntexTBCSKYkOqeuy2258p1ElHAMhucuXw2hZDHjvh6D9cGFAcpKwtW3/r0hVrAKa2oIzCv/g0VKdpxFxkpBKBpCGmn7lz50fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451930; c=relaxed/simple;
	bh=3ucPnqbtuWidzL6BgtclNjHSkHG6oRfEe4MfV/Ltu8A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VVFm3cUwYQErwtTA1nu8zv76jkyb90rhMUZ90qUbivfjs+UZQ6VzHsImHMcbHpXBPd46bYjcwfwgot6dKQfqAIGUakLK0KRrNcE8wwE7nrOFEGsn4OYE3khf3X2NEWGZhK3X8jZwVB/YpdslcmgjYxGtSii/NPjgkucrMX1X0Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDjlUJfI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDjlUJfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783451929; x=1814987929;
  h=date:from:to:cc:subject:message-id;
  bh=3ucPnqbtuWidzL6BgtclNjHSkHG6oRfEe4MfV/Ltu8A=;
  b=GDjlUJfI2Ed//RULQ05gc3Ebt2kq/5paBOmg8eddn6MIuCqnD44h6LXv
   pgHSqkCA/7RFY9VDLQeEz55uIGjgVn6r5i+3SYpivHgQWGgtDV5q46Tka
   tfUwdssVBKyFaRJM58hO33aFaDIRUi3kO5BmJVKv8NZa5oHvDGe5LR0dv
   S9bgt0w/LJvVjFzA/ZHkZ91YG7k5UBLJW/Yqhe1YQS8fpqH2p0xDPKk3U
   Zyz5MyZL/u3bIe83nDIbPrxKeWivLBkZYBgFtzz7OHHUv17cKywWXMw1i
   dvoBigo6lb6m9jR7K0rvU8zKG2N3cLzN2ukMAzQ4iny3X4raBeMcT8XE2
   w==;
X-CSE-ConnectionGUID: u985b9QAQfiOSUZbsmIsrw==
X-CSE-MsgGUID: o4QGoFhvQLOj7zscZxEN6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="101657379"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="101657379"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 12:18:48 -0700
X-CSE-ConnectionGUID: DrPFyMfQR7uprAi0hoD/pQ==
X-CSE-MsgGUID: Cf9hGP9nTpq3Cix9jgNC0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254154182"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 07 Jul 2026 12:18:48 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whBJc-000000002an-44Tb;
	Tue, 07 Jul 2026 19:18:44 +0000
Date: Tue, 07 Jul 2026 21:17:49 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-dango 119/215]
 Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml: address:
 missing type definition
Message-ID: <202607072100.k7tcymIR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-dango
head:   d19514df7d0958e914bdb3435ea4d64d2fc5766a
commit: 01c653eb0e0b4d23361a7a18e2c386f69a370d53 [119/215] dt-bindings: mt76: support setting per-band MAC address
config: arm-randconfig-2051-20260706 (https://download.01.org/0day-ci/archive/20260707/202607072100.k7tcymIR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607072100.k7tcymIR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607072100.k7tcymIR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml: address: missing type definition

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
