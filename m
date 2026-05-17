Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7FC2E6CC0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 06:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779000989; cv=none; b=FlTkuknOAe9WWXsFt+s70M4yHQ8em1oD5sFCqtLelDky14uNR3dCN3n+T/dYL+zlpmTYiNIv786o9pe6IJLqRBNeRcPt/8TVcroSPR+95ji9I1KBR62hLWxs2xGkYlpLxqvUHlwMt0nC4Wgd0oci10Iep1bZesXoEWI6x/AHbLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779000989; c=relaxed/simple;
	bh=fGT5I6ToH7UCt6pHUBQr+TnBqyhXcXF5apg8Jg9Ghow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vmx9QrrUDh5ilbvMC3GWlCoUYlLpxX81oheVCmK7krEMWJd9RGJUb98eOFpCfoB9FVnQItp0HGLLbolBU6dsAMpthNM7Vxmhpn80EUXx0n0v6bugPbBoe7Ex9Wxq3BtvIlztvr+9aEe2edONkL3dt7mRpZR1xGkiDjWw58R5Tr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcwiXO/s; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcwiXO/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779000985; x=1810536985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fGT5I6ToH7UCt6pHUBQr+TnBqyhXcXF5apg8Jg9Ghow=;
  b=PcwiXO/sp9OUIqeoP8gW6u/380SgjI8T2NtQaDrLrXAIP/5Mtjld7rxP
   91iPgV2PICb/F2XuKTfAiqHTIzrW7lX0M23yPjEySQipOZoWlFWNTKXpr
   MLqvh94oEp7DO5yESX3YEwem/VTXXbxX3yfSbVlPUoeKN8AXSTmmPJZhg
   Cl6RGfSi2ACoGut7iJt+Ax8lJwMx1lqwds1voJviQvZvxhph33MY0O03L
   kg42cRwYNrlLthCDr5oKcRyTz8JBgn6wqr/szRzMgMwvEuh192IpkLHak
   zomhlUNPU+rzHvDiRcz8AN8c0xVhtbpCA7awSgwQGB7x3itp0fW+9NM2f
   A==;
X-CSE-ConnectionGUID: +KiqNvj/T26AQNvDrAFrYw==
X-CSE-MsgGUID: KbbEf+ScRFC+6bG2fQbmdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="83760054"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="83760054"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 23:56:22 -0700
X-CSE-ConnectionGUID: r6Sw8oi6S1+ePIGN0LFVzQ==
X-CSE-MsgGUID: iI4sUX0jQWGG/BIglWLPnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="262870834"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2026 23:56:20 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOVQ9-000000001QQ-3fum;
	Sun, 17 May 2026 06:56:17 +0000
Date: Sun, 17 May 2026 14:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: remove unnecessary architecture-specific
 <asm/asm-offsets.h>
Message-ID: <202605171438.l6sZ9CCp-lkp@intel.com>
References: <20260517030408.100043-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517030408.100043-1-enelsonmoore@gmail.com>

Hi Ethan,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm/for-next]
[also build test ERROR on arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next soc/for-next linus/master nferre-at91/at91-next shawnguo/for-next v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Nelson-Moore/ARM-remove-unnecessary-architecture-specific-asm-asm-offsets-h/20260517-110530
base:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
patch link:    https://lore.kernel.org/r/20260517030408.100043-1-enelsonmoore%40gmail.com
patch subject: [PATCH] ARM: remove unnecessary architecture-specific <asm/asm-offsets.h>
config: arm-ixp4xx_defconfig (https://download.01.org/0day-ci/archive/20260517/202605171438.l6sZ9CCp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171438.l6sZ9CCp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171438.l6sZ9CCp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/lib/ashldi3.S:30:
>> arch/arm/include/asm/assembler.h:22:10: fatal error: asm/asm-offsets.h: No such file or directory
      22 | #include <asm/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> arch/arm/kernel/sleep.S:4:10: fatal error: asm/asm-offsets.h: No such file or directory
       4 | #include <asm/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +22 arch/arm/include/asm/assembler.h

^1da177e4c3f41 include/asm-arm/assembler.h      Linus Torvalds  2005-04-16  19  
^1da177e4c3f41 include/asm-arm/assembler.h      Linus Torvalds  2005-04-16  20  #include <asm/ptrace.h>
80c59dafb1a9a8 arch/arm/include/asm/assembler.h Dave Martin     2012-02-09  21  #include <asm/opcodes-virt.h>
0b1f68e836bcf1 arch/arm/include/asm/assembler.h Catalin Marinas 2014-04-02 @22  #include <asm/asm-offsets.h>
9a2b51b6ca93fc arch/arm/include/asm/assembler.h Andrey Ryabinin 2014-06-18  23  #include <asm/page.h>
7af5b901e84743 arch/arm/include/asm/assembler.h Linus Walleij   2024-03-25  24  #include <asm/pgtable.h>
9a2b51b6ca93fc arch/arm/include/asm/assembler.h Andrey Ryabinin 2014-06-18  25  #include <asm/thread_info.h>
747ffc2fcf969e arch/arm/include/asm/assembler.h Russell King    2020-05-03  26  #include <asm/uaccess-asm.h>
^1da177e4c3f41 include/asm-arm/assembler.h      Linus Torvalds  2005-04-16  27  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
