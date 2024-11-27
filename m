Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8438C154C12
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732697359; cv=none; b=mm0FoeL4OJ2qouGvEVA8tKptUccBE6aY45vsmPgEJZA+zLaxlomab4UjgtB6wnYOt5zRCl/wGifwtvh0J3tdHwJCYM9Y0dOptoimQuBBTeR+eme+pKc46HnG7Blj534x/sxpK4Cbn2EdVTQYZQa5CGuxCGV8fHVCAtaf4Lg1Z1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732697359; c=relaxed/simple;
	bh=TEsqJYgObIs9BiW7/U74JYtK/HEWGHLvyiGcKf0miIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XjzQ3d8Fv1GBlqUGatBBYC7C5vSYY+JSPYIv0OOq+PQpeLh6iB3mUV92uswzmyG+2Xgh2f0S9MxfZeLEDwc1G9VipLE1kpEmRkv3bEmpvQdDvAEp27VHsjj1h2Rh6Q4J/7jVR3OY1M40naCpNeRXwVkTKBGdeBm9X/3m0FIM9dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsXvXPCR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsXvXPCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732697357; x=1764233357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TEsqJYgObIs9BiW7/U74JYtK/HEWGHLvyiGcKf0miIo=;
  b=fsXvXPCRok6XSrCDnHzolh1QVRQKYxOKxLjxzPqKfG6VK4HK14IhoHvI
   NRiUH3y/g4JFOKTTjMeLCW7FJYmrGDjjsBIB5ZLRX2lQygcTU0bXRUhKs
   36CPvTsyCtTAtHeYBe6zSEVQZOv7jzzdfUc98T3VFxL9ozxBU29p8gLqc
   QXLYAHuUPKudeva4LjpPspuoFuW34C5NcjWvfLJvbEOWn8X0tAWhSI9vQ
   Rvp1r/tB3F335ffm9J8sQTKYAmY0T3p+LWwdqle6CSG5b88eCM2EOQxqX
   l+Z0vlTwOsUwTSygehoRfTRATirA4W8aMeMAhLfjhGACA3C2fbYkT0HR2
   g==;
X-CSE-ConnectionGUID: iFlGn5xVRCSwNWM8yZqThQ==
X-CSE-MsgGUID: eX8Ki7wzR8emMJDKLNjqNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43381862"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="43381862"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 00:49:17 -0800
X-CSE-ConnectionGUID: tbCuTrcYTKma3uprwopTfg==
X-CSE-MsgGUID: GjGCXDG1TBK2bCYS/wBbSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96930650"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Nov 2024 00:49:16 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGDjW-0007qt-0F;
	Wed, 27 Nov 2024 08:49:14 +0000
Date: Wed, 27 Nov 2024 16:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-loongarch 2/4] fs/nfs/nfsv4.o: warning: objtool:
 _nfs4_proc_secinfo+0x179: return with modified stack frame
Message-ID: <202411271600.1iKytBkw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-loongarch
head:   38dcfbe72402b6af003603a662e5720873f3d382
commit: 2a881be2e01ef4c6128b8c82c93347c0adce8d43 [2/4] objtool/loongarch: Simplify frame pointer detection
config: x86_64-randconfig-004-20241127 (https://download.01.org/0day-ci/archive/20241127/202411271600.1iKytBkw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271600.1iKytBkw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271600.1iKytBkw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/nfsv4.o: warning: objtool: _nfs4_proc_secinfo+0x179: return with modified stack frame
   fs/nfs/nfsv4.o: warning: objtool: _nfs4_proc_statfs+0xe4: return with modified stack frame
   fs/nfs/nfsv4.o: warning: objtool: _nfs4_proc_pathconf+0x11c: return with modified stack frame
   fs/nfs/nfsv4.o: warning: objtool: _nfs4_server_capabilities+0x308: return with modified stack frame
>> fs/nfs/nfsv4.o: warning: objtool: decode_recall_args+0x94: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
