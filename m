Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46C39E6F5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405202; cv=none; b=NuhEGM+FVQ+rMZk4DYnMQXMDBgWgRMcmrEpJK94205j6RjNxuHKacVjJDFT7cFNfdB8e5rsRIlCM2WgfJDSAQfN6eGUWPAiwIF2oYjuX3JhvveIIGAavl91ToE+qpC6dYF8S1JlpK1QVw1D0WbDlBD37ZggjmfFSfxnpzsZT+eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405202; c=relaxed/simple;
	bh=ro7Gf8Uy8xWahNd6aBNtueKx/mLKlwHb0JAG/shUQqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pTsDEgmtgp7EJSy4wDPDU8HlLwu1v3GsO7zyxMEhcmZZoCPXZC4yK+ORrukvFX5CYpdRppKVQGXWjochxI7AIQ/ykSuk7ilZT7oavqf1+o0xW+xRCWsaEPgJe2iDHFPeXB4tSDofMD0iY0xCTxR6w/cVtHwO/+cBI7MPMahznWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gV5KmvKy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gV5KmvKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768405199; x=1799941199;
  h=date:from:to:cc:subject:message-id;
  bh=ro7Gf8Uy8xWahNd6aBNtueKx/mLKlwHb0JAG/shUQqs=;
  b=gV5KmvKyFB7CmYERQDx2X7obHv+++mlDvXTt2LizdtH3injDq5hMktp/
   goTMnnS6734jYHbzaoxGXKCGfHysjTf0tu2ILCCwa6Miu460gks2VxIaD
   qqSLTm2JU9YeIuFxQJWNkQ5RSRE8nISkdGatS6M1s8uQDBrqkpZBCiE2w
   gLf3ea9yA+r4+LdliRjuNwr+wM4GkV++4CShZ6zngFxKjEijHY+V0UGoI
   TXXKVIlODdg5tasE5ynUhpT1YP2P4yO9iyGLO3wEKbnDE5ETalPaAqddl
   EIPDM4fnR50JElQxpX2J+CFgkMgRGALIWAqqZNYueUdSa9+0XAhTAh/sl
   A==;
X-CSE-ConnectionGUID: z2+dCIMeQoyonTLgGeHjzw==
X-CSE-MsgGUID: mu34R/QbSF6t/3ZCUkqgVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69791867"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69791867"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 07:39:58 -0800
X-CSE-ConnectionGUID: z9097xUpRAWGW1+MEDLHsA==
X-CSE-MsgGUID: bO5hgjPNTlGXjFeCj/mqwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="235965173"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jan 2026 07:39:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg2yP-00000000GZ0-3AfY;
	Wed, 14 Jan 2026 15:39:53 +0000
Date: Wed, 14 Jan 2026 23:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: <instantiation>:7:11: error: expected an immediate
Message-ID: <202601142341.nJRCghXO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Marco,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c537e12daeecaecdcd322c56a5f70659d2de7bde
commit: 56651128e2fbad80f632f388d6bf1f39c928267a MIPS: Fix idle VS timer enqueue
date:   9 months ago
config: mips-randconfig-r064-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142341.nJRCghXO-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601142341.nJRCghXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601142341.nJRCghXO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:7:11: error: expected an immediate
    ori $26, r4k_wait_idle_size - 2
             ^
   <instantiation>:10:13: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
               ^
   <instantiation>:10:29: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
                               ^
>> <instantiation>:7:11: error: expected an immediate
    ori $26, r4k_wait_idle_size - 2
             ^
   <instantiation>:10:13: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
               ^
   <instantiation>:10:29: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
                               ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
