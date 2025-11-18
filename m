Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF7C2F8BC8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460735; cv=none; b=SQNiBSrU88YdPmH93Eao4JYlTud9p8G+jNVvceZGKGgVg9ifGPartzfpegQm8fRPbjgWKZzPWWw6ha3H8AEBlFbMF/KRUNy3c5Y1CuPQ8KE2O2QaSkbAusM6fK+Ch3+cMxCyJtkzbmDOt2r85xNmcxxfqGhPvSiG/b2UHuNf28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460735; c=relaxed/simple;
	bh=ECOE/4jwGufQxptaxiQrXkL72HPwp97OHHlX5PwS8sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReIR2C8fgUtoD3QMfWyIF3pk9d1cScSHrGu7oYzsKXoLKCY1IEiBO6GXTQ2YvLIEO3TjUV88/glOlfpl1B9SIn6aPzqS1wrF8QRO2UP0tD35lRBD+1XoItT3W9Te2OhIHYWgEAq1d7B1ikDIVWKfcxOql7hUG6zri9sCDsvJp1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWrEPiI/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWrEPiI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763460733; x=1794996733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ECOE/4jwGufQxptaxiQrXkL72HPwp97OHHlX5PwS8sc=;
  b=QWrEPiI/zm6Gw6baHp2X62SXxAnevO0exZl2hD0Cf5JELVmwKhvnfVNi
   DxH3HCdaJvvHjTChTrJbNPC+J2E2htNabdvDtk0BRD5pikfGIGGZSNTq3
   v8yxs3EMut8TdGx4KJKR3w0IqFzEXFkzDybit8mbUKqOBEgxOomm3ouRL
   GfOgIJdbmsiVixdLi4B01I5Z+curwNXtjbEMqlzXnrmO03++owiiRcdKc
   Dtki3MV7ocsRwp5pkU21Mx165C0aR9mkJu44EQ5edd2TVaVxWyPfhig7i
   JCArx2XEbIUI5m0MfsLPqVRcSgWeeJZ1TwsTfTI+LJepqOAF7YYJa5YVN
   g==;
X-CSE-ConnectionGUID: /nbkambcRmKTmy4wgqdDYw==
X-CSE-MsgGUID: bRMQc5DEQ9+XNiTs0ilWtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65358549"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65358549"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 02:12:12 -0800
X-CSE-ConnectionGUID: r6uiMCkJTi6SZ3aVufOraw==
X-CSE-MsgGUID: IfcDk26TTJKAWDFZ8M9mkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191157956"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2025 02:12:12 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLIgz-0001bD-2Q;
	Tue, 18 Nov 2025 10:12:09 +0000
Date: Tue, 18 Nov 2025 18:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Daniel Hodges <git@danielhodges.dev>
Subject: Re: [PATCH bpf-next 1/4] bpf: Add SHA hash kfuncs for cryptographic
 hashing
Message-ID: <202511181714.PFZYXnZk-lkp@intel.com>
References: <20251117211413.1394-2-git@danielhodges.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117211413.1394-2-git@danielhodges.dev>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Hodges/bpf-Add-SHA-hash-kfuncs-for-cryptographic-hashing/20251118-051958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251117211413.1394-2-git%40danielhodges.dev
patch subject: [PATCH bpf-next 1/4] bpf: Add SHA hash kfuncs for cryptographic hashing
config: m68k-hp300_defconfig (https://download.01.org/0day-ci/archive/20251118/202511181714.PFZYXnZk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181714.PFZYXnZk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181714.PFZYXnZk-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/bpf/crypto.o: in function `bpf_sha384_hash':
>> crypto.c:(.text+0x5d6): undefined reference to `sha384'
   m68k-linux-ld: kernel/bpf/crypto.o: in function `bpf_sha512_hash':
>> crypto.c:(.text+0x65e): undefined reference to `sha512'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
