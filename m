Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A654BFE79
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766348; cv=none; b=PUXIBpo/D8rSViEk5LOiiSFFljtEMgYENshkrfA8qwPChw+o1RlRscz0fUYHLUmxLpr1vNHlZYRtbkPQPa+5z3EKCV59/N64pKdYG578YzUTT3bV9yi7keetbyE3Ouf+mPeN4C6oJn8+5Q24EkARSRTi6aBpqxPAbOm+1L4UQnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766348; c=relaxed/simple;
	bh=Qz+KUgtYNfBSrTAz0m3/0OqtZoHpTPDmYkZ7g3/uMtQ=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYAcq2r2mSXDD/Qsay1TlxMpgm+737QIwJarJKFOGi1RtkSioXqcBQlMb7qx5cGfeBpibOl9I/0f5gc/QlZcTrXbNEgRhyu/PAzWcDsdlVVSi+0tFARc4gXrhCujEpG0GDloUnYur1rHc0u1xm0f07SpVa4jGICh27YSmhzf7dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcOfGkxp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcOfGkxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790766339; x=1822302339;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=Qz+KUgtYNfBSrTAz0m3/0OqtZoHpTPDmYkZ7g3/uMtQ=;
  b=JcOfGkxp5uv5vh2ZQxiQAGIAQf4VLD4AsM94KCE8v8WwRIE0DEgCKyot
   NAIAywBR9o9mhpEWEoNtW+Hj27vbhDT4sOF6pgfvBGYcyJgstk3JCvahk
   4uSAGKUBCE9Vw/rsaEvVawtghs/7MSbsFZcbem5IHQpgxclpbIE8VKKjY
   KaiGs1jYZLsSHs4bEwiPLVCXei+brAHnH5HVxai4ULE5pXJ3Rqnc92mAd
   dKy65BnZuEc5tL5PGb4o3wmxiqrNv5bgD54zQiHRkp1YkkeIkpX/e4bqN
   H7Iz1JzVdwSgad/DUi0OVQW94/RuzKcjtYZ8TXE9RfERUtCvYKeBWz+9R
   A==;
X-CSE-ConnectionGUID: C+tHCqmpQwqYEiMtnGoaHA==
X-CSE-MsgGUID: kslauEmMSpS/GYleDgYPPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="79068384"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="79068384"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 04:05:33 -0700
X-CSE-ConnectionGUID: birw+zb7Qym/SvwiUkUKTA==
X-CSE-MsgGUID: Woca2ZWtQzqR4qVXLqf8Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="303594567"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2026 04:05:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBs7u-00000000QXc-3L1v
	for oe-kbuild-all@lists.linux.dev;
	Wed, 30 Sep 2026 11:05:30 +0000
Date: Wed, 30 Sep 2026 19:04:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: badblocks: actually round to block boundaries in set/clear/check
Message-ID: <202609301822.F5vZG8el-lkp@intel.com>
References: <202609301822.F5vZG8el-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609301822.F5vZG8el-lkp@intel.com>

Hi Li,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/lirongqing/badblocks-actually-round-to-block-boundaries-in-set-clear-check/20260930-114941
base:   
patch link:    https://lore.kernel.org/r/202609301822.F5vZG8el-lkp%40intel.com
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20260930/202609301822.F5vZG8el-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301822.F5vZG8el-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301822.F5vZG8el-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: block/badblocks.o: in function `badblocks_check':
>> (.text+0x2668): undefined reference to `__umoddi3'
>> microblaze-linux-ld: (.text+0x26c0): undefined reference to `__umoddi3'
   microblaze-linux-ld: block/badblocks.o: in function `_badblocks_set':
   (.text+0x28fc): undefined reference to `__umoddi3'
   microblaze-linux-ld: (.text+0x2958): undefined reference to `__umoddi3'
   microblaze-linux-ld: block/badblocks.o: in function `_badblocks_clear':
   (.text+0x3a90): undefined reference to `__umoddi3'
   microblaze-linux-ld: block/badblocks.o:(.text+0x3ab8): more undefined references to `__umoddi3' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
