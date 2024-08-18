Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BD21803D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Aug 2024 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723984032; cv=none; b=dnC3BhgYuk8OOLHFkW9XSaJTBCCOemnrmgaXL0MIiGJxh7/ULCK/IOAQHJJ50GwgKzZ4CfENgr66AwuRXDZLsZsAgm1+jJHLSgxNBE4dQbB1LpWgQbptr55G3PamdjmjtRM3Gf4SFJTr7lHRWsN/YGBuYOS8sIDaLzGw5b/Qgs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723984032; c=relaxed/simple;
	bh=vuTn9I8VI9M2T/7djjzuWv0Z3S0bU9RsStRKN/m/RXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oDvKCQKRUKdEIV7R1TxRDoLIC5oD3/ujA9Pq0nb/ZdAX+WXGfm+SD04JUf+yEF6KOgm2XK+8NHB0ByZ9Tp3Dmyh4VHCJwf/OHm/eZKO0B7MZ1NV/et/Es0QfsSl4StGvu9WtTnLfcj5bVWldjqkYFtCCz39eFVdp+oS7jxqzKNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCATIv7O; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCATIv7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723984030; x=1755520030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vuTn9I8VI9M2T/7djjzuWv0Z3S0bU9RsStRKN/m/RXg=;
  b=SCATIv7OK7xvMR8XLZMaz9zUYKlggm7YWWg/bhrj7DS/9Y0DERWwK1y7
   MHBVXNAiPaHUggY/jx195jR5SIVRTjUHpzhuRs8G0lEFPRVXanPOEEdgJ
   uSfCE4q2dDH50HIaa6lgEa794yL7naD/06RCPBcdBP+dJNPDwCvCqDY5N
   srV76Toa2T687/pQzpbnFFFuBAi4IUXWl4AGFyoVFifIgQiEaQk/7tRLV
   Gln0x7XW0OVhesgq++LmJr9YDl262lQ4Fhzhc2K1ujn/VGR+WlhCsaWPo
   LGWPrhO41L8O1uukoBmcd81cPRAJ6L81toQNYqnYPMuEB3NbeUndrU8td
   g==;
X-CSE-ConnectionGUID: Y1zBY10PSN6IMHMgvPOAuA==
X-CSE-MsgGUID: gY87lLYbRYyQ5uyBkx7Ebg==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44753111"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="44753111"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 05:27:09 -0700
X-CSE-ConnectionGUID: DIk8VhKGR/i+hhJB4ZAEzQ==
X-CSE-MsgGUID: 9fOoMiY7QiS0cMhYMgLCdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="64935370"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Aug 2024 05:27:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfezx-0008EM-2F;
	Sun, 18 Aug 2024 12:27:05 +0000
Date: Sun, 18 Aug 2024 20:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.headers.unaligned 2/2]
 arch/x86/../../../arch/x86/lib/insn.c:16:10: fatal error:
 ../include/linux/unaligned.h: No such file or directory
Message-ID: <202408182032.bPmVfkhF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Al,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.headers.unaligned
head:   5adcdf60b29da8386cab7bb157927fec96a46c42
commit: 5adcdf60b29da8386cab7bb157927fec96a46c42 [2/2] move asm/unaligned.h to linux/unaligned.h
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240818/202408182032.bPmVfkhF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408182032.bPmVfkhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408182032.bPmVfkhF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/decode.c:12:
>> arch/x86/../../../arch/x86/lib/insn.c:16:10: fatal error: ../include/linux/unaligned.h: No such file or directory
      16 | #include "../include/linux/unaligned.h" /* __ignore_sync_check__ */
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[6]: *** [tools/build/Makefile.build:105: tools/objtool/arch/x86/decode.o] Error 1
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [tools/build/Makefile.build:158: arch/x86] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile:70: tools/objtool/objtool-in.o] Error 2
   make[3]: *** [Makefile:72: objtool] Error 2
   make[2]: *** [Makefile:1360: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
