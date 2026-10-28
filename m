Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174021;
	b=L/R40H6yhL0CWcSu4q//qrOCJZAh76LSzPbXZu2js4mN+sdVy73PP30b+sC3/TzS5jTc
	 h+yGkGcrYQ5wWPQyNoOA+yHz0f9YJT5KDPAM8xLf7Wilr3RL1uiP/TTqd6LOyytqU4hum
	 87edZMdDGagmfhiD+lxG7LBQW1R5ocFVNBObWE5uT0WlSiA5yhnM51YKvM5sECRO4K+6Y
	 V6UcIF9XG34EYCaNt3wgObz0mNfOsEhZo0IJihCCAiYt2vI6MmwVnwiGpDVlcPTDIXs9Q
	 /GxXYrJdkDgzgLASWehx9DQXt+4YTAdjDDOBISnBnUbiZC9SfJX8Gc99nkSsDuRuPQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174021;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ByvPH4ykA8tGA6Ajg7PY7PkhHScSm/swsXpJQ+BJnMk=;
	b=S2uQqeEKRP6cY53AJGtLRdg/TzhQy9U6bVsybuLmjCOa/vGaUDkFNbp5wfuMZuRrTHQH
	 S3w4eA/uXGCcCaNVWaaIB1UJvqD0PbfWnclg/Z2ZcKlWrnrjYKrq8CDxYK1gmRXmVM8t0
	 cjJbaRwTzMbxFgK/9rlyrMvbsbXfx0vL4LWsKai2vKx/dsReKnh8g66euXzY6w6aeHALw
	 UH6SrEwRCR4VdcKBuhHeEbru3Ivn2UoQvd+3sRMITeIALQufdFXOmjZQCNNwOke/hqi6q
	 akNDymzpOcwII3uuqy6Sz4X0H9xO6S/p3byOu345+5tS8Gq2wvSeLPsWQIwYGzR1k8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HTYT7azh;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DECD606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 07:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DECD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HTYT7azh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793174020; x=1824710020;
  h=date:from:to:cc:subject:message-id;
  bh=CsJttNPfPLKLOtsUO2fKc12+eNhywuWacPVlRGaHgNI=;
  b=HTYT7azhyp6Ge4qcgO1E69ZWzchP1QRZpZ7n0X+Vc8Sefoy5wSxO0h24
   ty+++eYNXfApSf7RvelADrrY1W8ws2YLGv5AwweL+FrbqvE8TRh3PCXMY
   fll1s6WydTvZHwQTQgRJfVi4BDuBW24fJL67V1zzbOUsBgpee6w0Ua3Yp
   EEIHz8jdkBH2INWDIj9fhSalpiOMDTnjJ+/c+DvLWbpoS3j+EGOMpwwga
   b5HOII3s+6D4plnWhsnZqCe21I+oXM8xE6cNSi80h2pNFTXofg0FdQCNo
   E3iz0kSrKU0anEnxVlmROTdm1WsTL+FOojxbqMCWRc5lscpUxPbLVgi7w
   g==;
X-CSE-ConnectionGUID: lt7Pp0+/T6603yXK5HzBYQ==
X-CSE-MsgGUID: GIaR6gGkSnSkzh62S2EByA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1903482"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1903482"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 00:53:38 -0700
X-CSE-ConnectionGUID: XCWajYOBRYmvUCw+zf5+jw==
X-CSE-MsgGUID: K7z4Xf31Q7qffJpOvOqasQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4813952"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2026 00:53:37 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLyTW-000000004nt-1Vqg;
	Wed, 28 Oct 2026 07:53:34 +0000
Date: Wed, 28 Oct 2026 08:52:55 +0100
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett (Google)" <liam@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liam:dense_ulong 75/78]
 ../shared/../../../lib/maple_tree.c:7216:13: error: redefinition of
 'mas_wr_span_walk'
Message-ID: <202610280818.8dOEDzvn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git dense_ulong
head:   263600ba8fac7176cac2ef7eed0a831c9acaa814
commit: 089853b9a7e40c95fdb73d5bddcab95c7df056e2 [75/78] maple_tree: Use 32 bit nodes for any node that spans 4G or below
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261028/202610280818.8dOEDzvn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280818.8dOEDzvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280818.8dOEDzvn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ../shared/maple-shim.c:10,
                    from maple.c:72:
>> ../shared/../../../lib/maple_tree.c:7216:13: error: redefinition of 'mas_wr_span_walk'
    7216 | static bool mas_wr_span_walk(struct ma_wr_state *l_wr, struct ma_wr_state *r_wr)
         |             ^~~~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:6054:13: note: previous definition of 'mas_wr_span_walk' with type '_Bool(struct ma_wr_state *, struct ma_wr_state *)'
    6054 | static bool mas_wr_span_walk(struct ma_wr_state *l_wr, struct ma_wr_state *r_wr)
         |             ^~~~~~~~~~~~~~~~
>> ../shared/../../../lib/maple_tree.c:7250:13: error: redefinition of 'mas_wr_span_setup'
    7250 | static void mas_wr_span_setup(struct ma_wr_state *wr_mas)
         |             ^~~~~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:6089:13: note: previous definition of 'mas_wr_span_setup' with type 'void(struct ma_wr_state *)'
    6089 | static void mas_wr_span_setup(struct ma_wr_state *wr_mas)
         |             ^~~~~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
