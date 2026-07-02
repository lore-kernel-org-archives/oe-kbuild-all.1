Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5B42641C6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 01:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955335; cv=none; b=Gh+sLja+7Dee5qmCSDM76A81BeHOlRQQjsYPOmnOMdI6hZdJx2NDaYDVtVNEfOXK+e/bYPhsbb3NdWGS+LhpaYl/MoMQJnHWTCGFua43IkKa2CYwVg9wCk93cWrXBHkop6Vkvjzqnk7IN3Vaqt0xIpMH5+qatQrlJRaF2pd+xrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955335; c=relaxed/simple;
	bh=D02+Ao6dpBku5vp3dVvCYEOystNiibX5y0/g8BRxGqE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GLwAd9HZLCczX5XMPVGpgdTrUZKV08/X9mGzTuPldU2YUUvqKEat/mc0p2ekJGfKiytQhMLWZVdvXrqmvkBDahfDZvIxCj5VQhZhuRfWBn3bUg3ID/5OJmL9syQ3HHqTSRxKUNgz/DMDbilQVh1KVUTvfFggSAw+UeGBF4GPMIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URIGhUny; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URIGhUny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782955333; x=1814491333;
  h=date:from:to:cc:subject:message-id;
  bh=D02+Ao6dpBku5vp3dVvCYEOystNiibX5y0/g8BRxGqE=;
  b=URIGhUnyAqZTNpEindqGYH0Il4exNU9SD1POyF0QT1ypcgYtz4UBAXLA
   dojSBrX+wlPQyfweELKfI8JcNwZYPbjnm4AE9Zjg993ho/bymQoG+eWi4
   vw+SUA3juMvtlrY5DpIrSMutnt0spcGjDfSItEv6Hi5a3e2LHShd8lHyc
   RWHp/c0pqgPHk7Sh0B35/iO9bhBejxOM39YvFHQSnoZK/400oUETMfaWW
   eIEs5UFyMkvz7/9R+2D7NQEXpiL9R6LOAR4jxFISqw5M1wbA0ozSirfdv
   ViMb8rga+Y/lOZFB25fvRJH9wL0wH9xkO1GwStW4dvti+YmZZNOcAYHev
   w==;
X-CSE-ConnectionGUID: 5xB6QyRBRpy/nOawimUBBg==
X-CSE-MsgGUID: OWrBJZmLRzS92+B+BEpqKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82688349"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="82688349"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 18:22:13 -0700
X-CSE-ConnectionGUID: vzH5FSBSSCWCaUMPxo5w0Q==
X-CSE-MsgGUID: GWmZH2dBTQmowtf5sLJkfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="257603880"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jul 2026 18:22:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf680-000000009p9-44an;
	Thu, 02 Jul 2026 01:22:08 +0000
Date: Thu, 02 Jul 2026 09:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 18/20] Warning:
 fs/smb/server/auth.c:141 function parameter 'sess_key' not described in
 'ksmbd_auth_ntlmv2'
Message-ID: <202607020904.uWq7WiXR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   dfe522089ae556450921886e41712c8fec2a7120
commit: cfe3cc53fe1953169d9fa905e5849f4324aadd5d [18/20] ksmbd: fix multichannel binding and enforce channel limit
config: loongarch-randconfig-r073-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020904.uWq7WiXR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020904.uWq7WiXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020904.uWq7WiXR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/smb/server/auth.c:141 function parameter 'sess_key' not described in 'ksmbd_auth_ntlmv2'
>> Warning: fs/smb/server/auth.c:197 function parameter 'sess_key' not described in 'ksmbd_decode_ntlmssp_auth_blob'
>> Warning: fs/smb/server/auth.c:141 function parameter 'sess_key' not described in 'ksmbd_auth_ntlmv2'
>> Warning: fs/smb/server/auth.c:197 function parameter 'sess_key' not described in 'ksmbd_decode_ntlmssp_auth_blob'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
