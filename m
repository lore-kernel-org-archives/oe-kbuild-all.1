Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE107397694
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125066; cv=none; b=MkhfoWfsh+WdBPjB31riXBfNytnvN/KdfAptxe8LrQjR1zbAnOw0tzJ+prVaVvzupeAGe2JhlJRe/lG4InGYiDBr1FrzFMhUdgMo95At5FNplDEJ0MktmFpCkRUPxa7Bm4kFfTAvJBGeyibiMGfbxlbSmC6xDh+MtqMS4owgPjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125066; c=relaxed/simple;
	bh=/U9AGqAH/0VvkDjGZtGDTmgW64mPmUJ/zNU8vyqJwMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k0owhkdzz7ZMJTrqj/yBihStvaLQgW2TGH1NABD8SsuR3a1D3Z2EZmqgQwPtBVH/t4dA62hLsn/QzGDrYB1VUnc+eloEsw4ql66iRuO23BpIiqG/3d2nkDonT7VOHSLgObQ98m5Y0LDZlq45U1o2LS+c5hTIkm+O8ZDDPi5XJXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDzlW9nz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDzlW9nz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787125063; x=1818661063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/U9AGqAH/0VvkDjGZtGDTmgW64mPmUJ/zNU8vyqJwMo=;
  b=gDzlW9nzuDttCX91hGaWT3vyykor6BQVmRHY5lK+YiHYrvsE/EGszrpQ
   GrhiLkXj+qDZrGjsQxAWKSVMWSGEQaFPFUw8kvyznh7LNlJrN84Q5ifXV
   QVFbrf/bNZfTHg45Yl9iaq7dGqa0qIWSkPLL5FbxB8pnvnfHXyoDQ8IT0
   +NSAyQbmm8eAVtVM9cRxgSbkz2SPW6ogqsY8LZE92fwFHb2P7GP1RvHNX
   vMLzywhJCgDTRpsEzHaTwZMA2fXftHBzr8dA9eeKzG/SldYZJt/3Sr3Sw
   RsqbKZDvDr6e8kqFBxMuy6NPNFc8i0Ibyc23eVDomR/huHmu2fbJWRlKk
   w==;
X-CSE-ConnectionGUID: byGVWNumTBKbhCEnMKiVYQ==
X-CSE-MsgGUID: GMdfg+HGSbCCKHiVbKqqYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="97966551"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="97966551"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 00:37:41 -0700
X-CSE-ConnectionGUID: 9yu5x4hmTseWL6aYj3Q2ug==
X-CSE-MsgGUID: BDPylSWsRXSUaRvrAG0cIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="264144790"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Aug 2026 00:37:41 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwari-00000000eyE-05Jc;
	Wed, 19 Aug 2026 07:37:38 +0000
Date: Wed, 19 Aug 2026 15:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:m-5 105/106] drivers/gpu/drm/drm_gpuvm.c:1075:1:
 sparse: sparse: symbol 'gpuvm_scratchpad_key' was not declared. Should it be
 static?
Message-ID: <202608191554.QUA1867H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git m-5
head:   f4586ca88dc640ffb7dea6725f1b347cd3c51bf9
commit: 7ea7256340194fe4223105505426c05bdc8a7a40 [105/106] fixup! drm/gpuvm: Route gpuva_op allocations to folio_scratchpad
config: sparc-randconfig-r134-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191554.QUA1867H-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191554.QUA1867H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191554.QUA1867H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_gpuvm.c:1075:1: sparse: sparse: symbol 'gpuvm_scratchpad_key' was not declared. Should it be static?

vim +/gpuvm_scratchpad_key +1075 drivers/gpu/drm/drm_gpuvm.c

  1074	
> 1075	DEFINE_FOLIO_POOL_STATIC_KEY_PARAM(gpuvm_scratchpad_key, va_scratchpad,
  1076					   "Toggle DRM GPUVM range folio scratchpad allocator");
  1077	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
