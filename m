Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E271DA60D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 21:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731879820; cv=none; b=HxxNoEDh7FU9wfNiZRiiNvlMqE8P77n41wY6Gj2llBkP1x/c4f85Z5+gScWBzII3IGQPLmwMe1kphqmncL+ZPgPqR3uAfzHOIbHVx2PspwPCGrupNMlYvESkJ7YUGl1NJjtn/nDFTOaugxzHmsbDkshlGAbINrO9MwKpFzyaK48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731879820; c=relaxed/simple;
	bh=8kTOqSJPbJJPh/Uz0WE4VN6g0VPgb4ZgfLREioHjhc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kjqXx0lZt+BxD9Hz2J3e3DD+7GFWDcHd9JMuj0gUQtyZmQdvtyG3xLa41t5lnkTolgxy0uGW64BFiqFLDJFFDGqsA5XqoaVPG2X8NXIzMH/kLdr4cILeAmmiHPD+h8JErI7Qu5CHMB7l/lDOvmhVyABEcfYj3HaO2B2lalYQVpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K25+EcSK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K25+EcSK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731879818; x=1763415818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8kTOqSJPbJJPh/Uz0WE4VN6g0VPgb4ZgfLREioHjhc8=;
  b=K25+EcSKv1l/JmiEhTCdHU+1OLB9CLdqyg1W8X/Xx9YPyAMUz/YMwnMj
   IwVd1AtuNnD24mP2W8XSRVOeR2BVCjHKKBnJTLfgzsV/djIiE/H6n8xbj
   4LJAKfY+d5l08wTGkdZ7A+rLOSTP+UvOPrx+4G6m6HHo//p5oSe+c2vZT
   Q2+kELX+IO59AQmzYE4DsPtpgp7WKCXqSUzhDX/OgIKzz/WylzXjZJAGy
   CwJmsq131+jFk/p0YcqrOn5E6P8AtyMh1sXBq64+SA3ffnnDsjIBHkIo5
   +P5Uk42sGfyHoIzqaqd7Bym8tGUNcE85mE6enHg6J4ak96vcPCIOLscvA
   A==;
X-CSE-ConnectionGUID: wppvniUDRnuo56lYZ1qbBQ==
X-CSE-MsgGUID: b9aPyUNLRlmcBsfF7KEqmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31579162"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="31579162"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 13:43:37 -0800
X-CSE-ConnectionGUID: V6wslXJ9QnSuVXMfIYlvgg==
X-CSE-MsgGUID: SGywOnkZSJap3/K2JFTIQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="89163555"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2024 13:43:36 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCn3O-00023H-0O;
	Sun, 17 Nov 2024 21:43:34 +0000
Date: Mon, 18 Nov 2024 05:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-iothread 63/64] ERROR: modpost: "__aeabi_ldivmod"
 [net/rxrpc/rxrpc.ko] undefined!
Message-ID: <202411180534.SsXzA2kZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-iothread
head:   2f36eeb32c6d169f6def5f26b80a769ce6e47821
commit: bfd619ae7621aeb303a461188f453034d90383d2 [63/64] rxrpc: Skip trawl of packets in tx queue for every ACK received if we can
config: arm-randconfig-001-20241118 (https://download.01.org/0day-ci/archive/20241118/202411180534.SsXzA2kZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180534.SsXzA2kZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180534.SsXzA2kZ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
ERROR: modpost: "minmax_running_min" [net/rxrpc/rxrpc.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [net/rxrpc/rxrpc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
