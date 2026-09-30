Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493A630C147
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 05:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746649; cv=none; b=GxS/BY3A2aloKOwlMZgMwM1RYA2Srhwin1FBR79YnU80h+hWmZNf4Om6IKUBCQ1xPymvXqNRvlU4Y1yGGi9KgUbVgW0uKWzumbc+nJ0n87yZWrgCpVTqrbHW88+qf3o2zdEOmLjWCTJcc4S0GqD9rhsj4A3qnBAVzpgk8IRWaX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746649; c=relaxed/simple;
	bh=LtxNA2G3hvY927C4l7T7w7vQMB9SQ+4/m06MtGNe/yA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=smoKSAFhuh1vIcM9JOUYvGkCKYe5uCL4JWCGHnv+pauIJwqz7kgpNjvS8yhJjVXmjS1RZwS7ErsBo3zQrj/fBdC0bmdqoCjSuGW5KJzQIbo2DwUGnYxbtTTiS9erOrHAPi+pkZs+ukKJTiEkpoAGsuMy6mH0hBQJgZcKu2xoFnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjZQvjQD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjZQvjQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790746647; x=1822282647;
  h=date:from:to:cc:subject:message-id;
  bh=LtxNA2G3hvY927C4l7T7w7vQMB9SQ+4/m06MtGNe/yA=;
  b=bjZQvjQD501LysRsyDJK+dOkzRf+Cawk0gnIGoRLTojNv0sGAEqL1xu/
   3ZXQ1TxFKVz/tpO+iOJMcv+4/WNigaPBYNQQnNi6FJkdev0PrVfHU0U6e
   N7/VsqbpIlhXjTakQZFIANJFlfLlz+zY9H8EblAV0GE0dfoJkJ5V8npFC
   sEKZtP3mWtL1OHyvQe6BaOR9gnhyHYsslNL4AASvNAgXnpMJhF5LbqmVF
   H7fh+bXfCVSCTkAFFYewJTApntttqUe4xB6SUCGZRMvveXGc7Ceu6aCCu
   wbUsIrQzvQEgE9RGCRqv+2zpRNFYvziPiRpbJ6zf9dHnfocbvOmERIPny
   w==;
X-CSE-ConnectionGUID: 4aTqDYYVQzabNMDUqC82Bw==
X-CSE-MsgGUID: Kp/HaYDTSveywZUc/PPNFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="94188464"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="94188464"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 22:37:26 -0700
X-CSE-ConnectionGUID: IdAt5F66Q4OimTgiOLC2HA==
X-CSE-MsgGUID: g2UbpLc+TWu7EvGo9Lv9Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275618663"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 29 Sep 2026 22:37:25 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBn0N-000000001l5-07X0;
	Wed, 30 Sep 2026 05:37:23 +0000
Date: Wed, 30 Sep 2026 07:36:25 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 21/26] kismet:
 WARNING: unmet direct dependencies detected for CRYPTO_SHA256 when selected
 by ATTESTATION_SIM
Message-ID: <202609300748.8PA2Lk0Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 70182d901dfdf94f8f611319f5bf3f7f6f18e1da [21/26] attestation: add the simulation provider
config: openrisc-kismet-CONFIG_CRYPTO_SHA256-CONFIG_ATTESTATION_SIM-0-0 (https://download.01.org/0day-ci/archive/20260930/202609300748.8PA2Lk0Q-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260930/202609300748.8PA2Lk0Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300748.8PA2Lk0Q-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_SHA256 when selected by ATTESTATION_SIM
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - ATTESTATION_SIM [=y] && ATTESTATION [=y] && DEBUG_FS [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA512
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - ATTESTATION_SIM [=y] && ATTESTATION [=y] && DEBUG_FS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
