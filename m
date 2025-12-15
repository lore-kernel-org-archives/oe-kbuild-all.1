Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7CE227E95
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765782358; cv=none; b=bVLoU7XUaC4nJMkJrRjHb4htLoBstkMfDQbnu1XiINctSaNl8g+sefy87Pl5+KNEwzXhJIOInNa425PWlmS/9cR52KAVp+KPchq2Foc5CrHtsuiuzTJV8Qp0Bw2Vsi1VDyJL54x4y6/DFVp/6ANukEtAgni8LJ/CqGqsw4CoCHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765782358; c=relaxed/simple;
	bh=62WXN1UXiUZQWTcoeiqzVyWgFIJEXnQQkIjPJfw+KTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JW+0QnweDM1JitmwET4Cj424Q0V3oPwxI77paGpBTrl70lbynKTnKeP2y1bp1gbeUnmsCLe/ndjQ7/dIV0wV1TRXjuP1MECzpo2+EmtGzeDFCES1hTmmFuzOgGv2Segu3/Te87QJEdcDryL7MWYLauY+UB8LTwOGscLnE+HMmFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9/oRQOc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9/oRQOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765782357; x=1797318357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=62WXN1UXiUZQWTcoeiqzVyWgFIJEXnQQkIjPJfw+KTc=;
  b=b9/oRQOca733xPHkiLOUcPe8Lv+c4Ib4h1ZdeDAUtiHaHAi+NuIqM362
   x+JKoYJuu2z/+Pq1H0bcm3o0L5H2Jrzl8Db96a4PaaUY+ya2yYJ/5VbA+
   RhbDeUVie2SMvETZH+a/+E+2qtDd7ZqYSm5frumLReULJKWVSUzNgntZb
   VcZfZJGWYBHMAJk17c3ZDLtnATRF4B/Ciyy/7NV0H2CvKCBa1lPuG02dz
   VEyDUeoGmKxjL/XP/BzZX1ziXpzoAZzl+GN/ZltxBcoyH/ERy92RMyyFc
   cztSPVmeqPS4u0dGcO0utfbfzHiNO8509PUAwwFPm4LAM+IlSZhm8l2jq
   A==;
X-CSE-ConnectionGUID: EHzjpyXxRYawB4+NA73oCg==
X-CSE-MsgGUID: lqspZwRkTQWgCIATdXLG+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78316957"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="78316957"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 23:05:56 -0800
X-CSE-ConnectionGUID: vbvf22thRWqjuxNEEJj66w==
X-CSE-MsgGUID: d6hTWLHKRXqu8oitBfLQ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="235036327"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 14 Dec 2025 23:05:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV2eW-000000002aq-26wI;
	Mon, 15 Dec 2025 07:05:52 +0000
Date: Mon, 15 Dec 2025 08:05:52 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:queue 4/11] Warning:
 security/keys/trusted-keys/trusted_tpm2.c:356 function parameter
 'parent_name_size' not described in 'tpm2_load_cmd'
Message-ID: <202512150816.hC7XvTfD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git queue
head:   f09c898d7441da7e85f77a6a1f458a3581a19393
commit: 3f9a923a51cfe50797f748d806c4555e0187a919 [4/11] KEYS: trusted: Re-orchestrate tpm2_read_public() calls
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251215/202512150816.hC7XvTfD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150816.hC7XvTfD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150816.hC7XvTfD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/keys/trusted-keys/trusted_tpm2.c:356 function parameter 'parent_name_size' not described in 'tpm2_load_cmd'
   Warning: security/keys/trusted-keys/trusted_tpm2.c:455 function parameter 'parent_name_size' not described in 'tpm2_unseal_cmd'
>> Warning: security/keys/trusted-keys/trusted_tpm2.c:356 function parameter 'parent_name_size' not described in 'tpm2_load_cmd'
   Warning: security/keys/trusted-keys/trusted_tpm2.c:455 function parameter 'parent_name_size' not described in 'tpm2_unseal_cmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
