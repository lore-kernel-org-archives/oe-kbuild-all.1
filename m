Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100688;
	b=nP7lxNhfKal5fZMAmSrTvEbq9hAcwEeugUW26uDe3lGvxfxOeKyQTK+86QO6LNoKERh2
	 NO79lZ6oiiiat09ch1YvxlVkvOUSlBERxSexh+aCdmuN0Fzmueobtd3S1WqBnicbLX6JR
	 rpIhGA66AstbH0IhJFoJjXq4dlkkyeckX67kSI7abRI3ZI+kPT5Q7jWkXkSNYFPiFNq6k
	 Z7rC2TjzKixt6icjmbOLJN2lG2wNRDtc95v82de9XhTYUaiTTApwcDy8uoi/tYEnV6CDx
	 9jmi7IeQvCMQymcBK/cXi7e9PcTn7H75kxTibSAJo9HnRMqWSTSP3MbJx4Yrkj8qwSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100688;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ABJG2qH0hpHhWz8/nDrQG1N7eGBuxS208ZZRo8ngSJg=;
	b=PL0hJ7zZ6eM22BX55geypzcfvXGxIpQC8tkXKlbqrdwonrEPJggiWLqPtNFjo6hqBerI
	 lvrVqVoZjhlms8Wn/TtGfndhrQDrQFsAeKYqh5ZtDD24Icb2HJKuVSPPT1cXgfREDC6Fp
	 RYUVg7k4rcwHUpwhfWh5EW0Jzt87ceDWGvP504Bbf3v6RlTpGsIqF0Vl5UyloRV1F4kov
	 23Vu/cD22CHSTi9t0X/AIEbmgI0r3bDie4keMMBcfwJ14MgHpeMeAVIYDAtcLLlTkBgL7
	 mAUbbCuMRrpg9LFwwJWHkNHs21f2iGkfeR4Vq05rsYfiLapDoqtfEPuzFVcfT6HEN9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lDOJ2Dc2;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BAF606A326
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 11:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2BAF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lDOJ2Dc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793100686; x=1824636686;
  h=date:from:to:cc:subject:message-id;
  bh=bZ5w64yBrNhEwmpsk0nY3CZzsqP2b9+MV/hmZs7Ugtk=;
  b=lDOJ2Dc2LIGOwwiURA87mIq4LFc+6+NbEfpnXgqH44DRVfYemk167ieZ
   SRJtl5s8UaFLOyT27SB/rdfayE8MulNCq7OHrx/zWzgSMif3ECmIkax+M
   yyH8hcEVrdiNwE5ZH2qyLoTx4GF+f7qbUfTpxJ1rFAdbW42tDzAYhrYAG
   fhNOzcO5aMPyvPAPG0on4Q80s/k8ji1VluwZlFI41Lq2a4gqyTnMctvbw
   H5VdywfEJYs21LzPuzHi6kRTrFMipYtH027vPX7glRRRRQ4w3OJp0xGHf
   LwMOHl7MsBWO4KSi1USCB+WUFPSIzaaj6OWlCKaDD6ai+JwCLecLpVJ69
   A==;
X-CSE-ConnectionGUID: g0bcVLW7SRG5JeCJJMnSIA==
X-CSE-MsgGUID: BJ1qdgeQScKRHEAD50zXQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1706371"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1706371"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:31:25 -0700
X-CSE-ConnectionGUID: Uij3Jvg1TgqN6S1QjOup9A==
X-CSE-MsgGUID: VVBjaF/UTweEx/gNE3rAuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4906710"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Oct 2026 04:31:24 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLfOj-00000000XAs-3tmf;
	Tue, 27 Oct 2026 11:31:21 +0000
Date: Tue, 27 Oct 2026 19:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4 9/25] kernel/bpf/core.o: error: objtool:
 ___bpf_prog_run+0x16: ignoring unreachables due to jump table quirk
Message-ID: <202610271929.AjUtvNHh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4
head:   70604084d1e8fe0325f4d86cb7c43df4ce31fe2a
commit: 8b25e9d45cc0e46f0e9acc5c0c11822e1301fc1b [9/25] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-1009-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271929.AjUtvNHh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271929.AjUtvNHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271929.AjUtvNHh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/core.o: error: objtool: ___bpf_prog_run+0x16: ignoring unreachables due to jump table quirk

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
