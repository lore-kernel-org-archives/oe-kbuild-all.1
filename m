Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F3D227EA4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 01:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510369; cv=none; b=k/Pej5ewm7BtoM2/5efj0vggSiCu/QU3xWbo6mRtItI7HB1cH74tviYRvNx6oNJE6QZxG9n2+xDgbHbbhQY8YEMuKJAcjJT0lsLt3CMKvsrR5+STNhcrjzzfjSgGlVqQ0ZISR67jaYv+AF4Z8BJADkZoM/4956V2I8wq+Jvw+KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510369; c=relaxed/simple;
	bh=HQhNo8XhaK2ESpjCRDAj7W22IfLjkSWEyt4sy12bI2A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pxg2xfpTFZuU6p1BGpEuVqPVeofyz1Z2+wKMcqIYjCfgSFbx51iKmW9KVkkGbcYcbkcff66tqPEVVGSnVg1OR5/52NHKWwTylTbc7+40u8xXUoyAIhPILRmfN6ESTnTw+TxIRZUvs2cLCHaVwWAAT0VPkFO0ymImdTt8xMz0fZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGwUQy7I; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGwUQy7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791510368; x=1823046368;
  h=date:from:to:cc:subject:message-id;
  bh=HQhNo8XhaK2ESpjCRDAj7W22IfLjkSWEyt4sy12bI2A=;
  b=HGwUQy7IG2E641eAdVgXKkvfIWRSlGha1yctf55s9BVH/uCUbbcRzXz3
   wXRwwpJc99I0jTGQ7QdptVCowzyBDdxCuZTfJUrkLbCjPbrFaWK36RBc9
   cHU911xcx7bOmE+CzzBi4TYzPpEGUFNQm0UyaQX+emJJfcdTkoxYzvD3/
   kELq/a1QIGc3t+L3Er8cPOLzO2WCr+wBtjmH7Wpzd3pVsfAKamoJkASjq
   b9AUeMx1EGpii5yXDOELOfmCdjO1ZjyF9OiCqXH6g9q3kd8tzZsCs8U6Z
   AZYJ52D1mft2qQrsr3+erTe3+NgDBbnK7SNWnOgKbNRlnzMX9VfwzE4Aw
   A==;
X-CSE-ConnectionGUID: 6BbwoU0LR+mGRqgaakMnBA==
X-CSE-MsgGUID: Xz2jf4KnSuKEqqL+DoH+Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="330501"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="330501"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 18:46:07 -0700
X-CSE-ConnectionGUID: VPpUViNdTuaQgWwnUFk9IA==
X-CSE-MsgGUID: QmTQMg5pQFSIQDKqqieqZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="307207"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Oct 2026 18:46:06 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEzgS-0000000059O-0sWg;
	Fri, 09 Oct 2026 01:46:04 +0000
Date: Fri, 09 Oct 2026 09:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v9 13/13] undefined reference to
 `io_register_dmabuf'
Message-ID: <202610090919.26N5Ibcy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v9
head:   a71d400980af9de2724bcc5d201040a930eecaf4
commit: a71d400980af9de2724bcc5d201040a930eecaf4 [13/13] io_uring/rsrc: add dmabuf backed registered buffers
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20261009/202610090919.26N5Ibcy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090919.26N5Ibcy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090919.26N5Ibcy-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: io_uring/rsrc.o: in function `io_sqe_buffer_register':
>> (.text+0x3108): undefined reference to `io_register_dmabuf'
>> alpha-linux-ld: (.text+0x3140): undefined reference to `io_register_dmabuf'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
