Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488F348C3EE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647205; cv=none; b=FG4Jpx4QO6ZHEYKfWvtfy9phojzUzEgNyoDNwaFQaSKQBQ2MnCEWtiBWD1agx/bNWqaWw/D8RY36RP4X9r2lP5JNid7qGaS8MCiPZzMr2VDFAu2/bDEIyt0u+hSu2z7ihBnLYXWODNoeagrCMwPWCBoU0b3DOX6+sqow4GcQX7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647205; c=relaxed/simple;
	bh=Ct3T4T5DVcVASXEhapPCaR5PyOp0j/ujb/ujcNFg+S8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZPQVo9hfDcAvFQyeZASmiuwYEnrd4n4dheuyfJUeTlEtKbt34AXEjMvG59UXirtdFnFkMpVLK3AKEcDay+E+ao1SxMZC6n4gJX7v9MSWfpgxYAYWy78rQIOe+VxRJ63he26wXEZt6UrJzoQt47qaQy1+Z7xE2oW5TYaR/jc1N4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHdE46tO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHdE46tO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780647204; x=1812183204;
  h=date:from:to:cc:subject:message-id;
  bh=Ct3T4T5DVcVASXEhapPCaR5PyOp0j/ujb/ujcNFg+S8=;
  b=HHdE46tOCl02gYOYcrKCvNLMlT2LCmlYkPbJKYCfhWU8OI4HL/gH23hi
   JI232XA39MvZ6zwPkSSEOIAB/D+kYExnibNeM7hbGf+GfE71FEuW+xbtb
   zn4Ic3nR0/8NSpowJcGI7UbWZQ+WtrwJzNDK8cVFVPQxU5GAPMGkaqDed
   opAZxEAizhcI/PsoyM95d49R9FPFYr72x0iLxvuOg/JdHFonMfGvLv6Ei
   vJhptNVuEZo8n/I4P0GpzwrLWpSc85gd3TcjBsjTF2gSQ+yj1gEn4ri5/
   Wp+Lb+8PKf7SVhffZRwOumZTeUCBvaxXtsYZhOLur44HaM/5Gj4mu4dZx
   A==;
X-CSE-ConnectionGUID: BAWCFprNQzyviEGpK7NEwQ==
X-CSE-MsgGUID: KeV2LZCrTFyAjvLQ06qTNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="99052547"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="99052547"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 01:13:24 -0700
X-CSE-ConnectionGUID: zybKB1vHTl2UV2sKS31NNg==
X-CSE-MsgGUID: gnAVu31ZTaa6+g3UWXApdA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2026 01:13:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVPg7-00000000FjO-3bIr;
	Fri, 05 Jun 2026 08:13:19 +0000
Date: Fri, 05 Jun 2026 16:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: {standard input}:3354: Error: register save offset not a
 multiple of 4
Message-ID: <202606051638.c3sb0GpM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Eduard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ddd664bbff63e09e7a7f9acae9c43605d4cf185f
commit: bf0c571f7feb6fa05a512e2a5e50702501849d61 bpf: introduce forward arg-tracking dataflow analysis
date:   8 weeks ago
config: m68k-randconfig-r132-20260604 (https://download.01.org/0day-ci/archive/20260605/202606051638.c3sb0GpM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051638.c3sb0GpM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bf0c571f7feb ("bpf: introduce forward arg-tracking dataflow analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051638.c3sb0GpM-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:3354: Error: register save offset not a multiple of 4
   {standard input}:3355: Error: register save offset not a multiple of 4
   {standard input}:3356: Error: register save offset not a multiple of 4
   {standard input}:3357: Error: register save offset not a multiple of 4
   {standard input}:3358: Error: register save offset not a multiple of 4

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
