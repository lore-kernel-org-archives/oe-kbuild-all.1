Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772552E62B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 01:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734055064; cv=none; b=u3qlwwgjphdME4knA+OmjMp/x48+B7/W0SscAa7mh7FBKFYP8oLBwloXfKUoQ8rAI6VthKt/V+thetLPEJocP+46PrKnOe7m8rO53fhGGQCszmWxjV7IIvUSmOWRlLcfv2j9s0v+U1M40Ir3xCpFLISwFIqlBQmJDb8o/NFN2Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734055064; c=relaxed/simple;
	bh=t6oOR+9hXadMZMxKaH+ruqSD0BCH/Y7lEuFbODerOwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j3aY9J3Iri01jc8gJyAFaRJK/6T4S6gIVXadYbvNy/1sq6hz0qJhVEniZKKGJ9qhu/HgUcQqRACmgIQr8bHoXXlUIoqpITBCtc08Fjf7QlZXR/IaxEXC4gWUmmIMiP2XFqc20Yzj9Bsl3DfAUt8TU4TvKW2MQeskUXthHxSkAFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CrjZ59Hn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CrjZ59Hn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734055062; x=1765591062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t6oOR+9hXadMZMxKaH+ruqSD0BCH/Y7lEuFbODerOwU=;
  b=CrjZ59HniH5fYc4cWJvKAUw/SO6YMHn4D0JwS58bGCSw1ZJjX30AQqQI
   wk//s9sJ1YKvZ2TyHwK8Kwt5SQ0z1/W5KL/qt/KmiUkD6rAWzPJgtMTq4
   ItmHxEVFBUqaJEWCaTAUe949sxVO2BemUYenhqzlOkPc5ZF15PO6J/eky
   W2lrhGGAH/mK6BBiEpkhLWNPPrehnl7myWZIU0sq80IKnPAuJLtdoKHFT
   7djm/gbToWJAbFfwGq1naQD3VGKABcqYDCu1mLztAJfhN4+wkKOu+ui+U
   yEPleIPDXD1e8u9iVLFyOwceX61r8PQFPpKy7kvIafkt0EihgzamA7VHD
   g==;
X-CSE-ConnectionGUID: LqRDuVyGTDW1JwQwkYLosQ==
X-CSE-MsgGUID: M0qWMhpzTkilHSC3WHvzHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="33830451"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="33830451"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 17:57:42 -0800
X-CSE-ConnectionGUID: W7y8uid5TwG2z/JAcpDSSw==
X-CSE-MsgGUID: tr1V9KdmT3+KtkaQBF6oGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127401845"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2024 17:57:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLuvy-000BbF-2i;
	Fri, 13 Dec 2024 01:57:38 +0000
Date: Fri, 13 Dec 2024 09:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 15/30] {standard input}:6: Error: junk at end of
 line, first unrecognized character is `S'
Message-ID: <202412130935.mSV7rNN0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   8ecd52ed0821c4955732e004a6cdb812d78d2b20
commit: 29d4bdd173e617586717963c7992edb66a4c1570 [15/30] PCI/CMA: Authenticate devices on enumeration
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241213/202412130935.mSV7rNN0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130935.mSV7rNN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130935.mSV7rNN0-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:6: Error: junk at end of line, first unrecognized character is `S'
   {standard input}:7: Error: junk at end of line, first unrecognized character is `S'
--
>> lib/spdm/req-authenticate.c:20:10: fatal error: asm/unaligned.h: No such file or directory
      20 | #include <asm/unaligned.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
