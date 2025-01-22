Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78820203705
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737534315; cv=none; b=rqpJOwcPwoQAjIDex+mRpEVR+WAO4FB1WCDAn1Y9SwTGV6n2s3Ijx36w1MUyTb/suQ2J7ubYtTL4cnxqMsPqX5yQ2dhZSh6Mbvfouv4RIp8tGWNRP0HrKKlWLlAEWU3XBsEqO0rKCazOU5hCy7cKKs34ccu8FxzwzgRjDuAOU+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737534315; c=relaxed/simple;
	bh=nDRNqI1tAhR7rseupjtfft0HzHCzrSZlSXs70lLOdUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iFsRSLAiD5e67LfesKGGw9zcGTSmS50fh4I26HnOsPq0BLPYvQxIgAxOkO/cLWFtqIDCo8Va2PsPZ8c3uYqAeyb/2FOuIHG7Hu+Hb+oJ8Txqx4GZ/RdF4grlFTc0NcRpPimDpla88lL2AVszD+0rZrwxSqBEtcbaazTSCYLx/Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWKjL68q; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWKjL68q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737534313; x=1769070313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nDRNqI1tAhR7rseupjtfft0HzHCzrSZlSXs70lLOdUk=;
  b=NWKjL68qeTnSyZbY74+TF08v3AIyA5qE0Xovls1iGeFeuoS/OCv6g16h
   UCt6TraJlWQKY80fMOLU4//jH6zRDnsAp2xQv0xuTAnwOgX61B3sF6pzm
   TzRBItLvr+TaeUEhEGesLgvtljruk6X72WSMgu49YzAGcJY7Jdk1UnfzG
   ZUsZj0fa3D0TU6O5rOM0ASk779RACNEOFxgp19ulku6Msj3PbSqxANlWv
   ZbXYUCq8y+pqW4ZaKTEWBuwIWKOvgFJ4ub97f/5m4QlBim20pUCbNTiqK
   tF8XKWI/wBp+S6JoyUh3/KTIuP9MY0hTeN6hnY2+glOMPcuutKFWY7zWU
   w==;
X-CSE-ConnectionGUID: v2KQAUKDQjSb7G4/uC9BJQ==
X-CSE-MsgGUID: z9p2ZxVOQLyzE6v/jZN2dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="40798368"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="40798368"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 00:25:12 -0800
X-CSE-ConnectionGUID: i1lYFtD0Q7CezdJ/eLFs4g==
X-CSE-MsgGUID: L+MBFikhTBWhNmICkMbCqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="112067520"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jan 2025 00:25:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taW2v-000ZeN-2c;
	Wed, 22 Jan 2025 08:25:09 +0000
Date: Wed, 22 Jan 2025 16:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1410/1410] arch/x86/entry/entry_64.o:
 warning: objtool: If this is a retpoline, please patch it in with
 alternatives and annotate it with ANNOTATE_NOSPEC_ALTERNATIVE.
Message-ID: <202501221629.J60ha3Fd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4d48400e0254b5310842eb2ad33c6ccba43b0f1d
commit: 3acbac72baea337e0ac79801a8ba4b81e3b67014 [1410/1410] x86/speculation: Change FILL_RETURN_BUFFER to work with objtool
config: x86_64-randconfig-102-20250121 (https://download.01.org/0day-ci/archive/20250122/202501221629.J60ha3Fd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221629.J60ha3Fd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221629.J60ha3Fd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/entry/entry_64.o: warning: objtool: .entry.text+0x1e2: unsupported intra-function call
>> arch/x86/entry/entry_64.o: warning: objtool: If this is a retpoline, please patch it in with alternatives and annotate it with ANNOTATE_NOSPEC_ALTERNATIVE.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
