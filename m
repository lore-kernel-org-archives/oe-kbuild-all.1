Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7978E8836
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710577123; cv=none; b=txWhwqZAea8OPfCqjjMsBUmW+dJTgKhoJe7N0blWpqTQgkV2SRSnoCE7AmPGcyOicCl8VTd8/254qSYUJt1Rt0lKkKI9GcTcEEWCBcJSlbZfQWyxwogycelBgWFtdU2FVnSqp2WI5dtQFAOtlIj49bNhHf18RUPLuSQSfNEr62A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710577123; c=relaxed/simple;
	bh=e09I7AelfpXxNgb86oLj7Km8inhSmdxzmrY0INnpCoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=trdaP9Pm/BEtQG8FjGaMwxAsxRJf4gPr9QF+5frC43SJWZhhNOr/o93hO7Bsh2S/IhzFUqAHdLpapAVmohDVTHvNWcUXGxYfl+T9D7dorODtwLqQzNTT5NHSw9PptGL4NHHLk7G5WqvgO5ulMPtfxhdG3/XvDOMOIpzrd684XzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsYMqIR5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsYMqIR5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710577122; x=1742113122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e09I7AelfpXxNgb86oLj7Km8inhSmdxzmrY0INnpCoU=;
  b=SsYMqIR5YUceTd9dlvvfNMtOiAgMCXNDXM3z0tLLgA8vR9Iz5YpN/boU
   29jnxJ+ZYIVPg1YKsEFNensadyuJey4tvU/69K6jYNtoGvEQ0BO3J7vKm
   SPkZQCS8jy/4EqzZTe+n5aQWALsQNG1cTSsEeewi7ugbipv7ncm9GiRMg
   sdkAWb5dl2RQlenXG2KBjlNUay43s0hSFVsHzqCh6lz2Joc2jk0bkCQR5
   fL+ogXhixGbBx4zVZxVBxOxarpmKUrJ5dnCj1b/swZxZiU04qjzTpdz7o
   lzINx1Hs4ICceE/WczMqmf3ZA2Vcr1H3s4DzIH0fLfEuXGIRqXYYrtN9U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="9264903"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="9264903"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 01:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="12853589"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Mar 2024 01:18:40 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlPFV-000FDl-1j;
	Sat, 16 Mar 2024 08:18:37 +0000
Date: Sat, 16 Mar 2024 16:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 11/12] csky-linux-ld:
 client.c:undefined reference to `netfs_write_subrequest_terminated'
Message-ID: <202403161642.ifqOZIlR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   be938ad004e7a8f28cc6fc8500c120c7687339f7
commit: 489782b46f83f343c2449bbc797ef390816163bd [11/12] netfs: Use writeback_iter() and improve the writeback algorithm
config: csky-randconfig-001-20240316 (https://download.01.org/0day-ci/archive/20240316/202403161642.ifqOZIlR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161642.ifqOZIlR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161642.ifqOZIlR-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: net/9p/client.o: in function `p9_client_write_subreq':
   client.c:(.text+0x34be): undefined reference to `netfs_write_subrequest_terminated'
>> csky-linux-ld: client.c:(.text+0x34e6): undefined reference to `netfs_write_subrequest_terminated'
   csky-linux-ld: client.c:(.text+0x353a): undefined reference to `netfs_write_subrequest_terminated'
   csky-linux-ld: client.c:(.text+0x35ac): undefined reference to `netfs_write_subrequest_terminated'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
