Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606F61FC7CA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 10:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741083696; cv=none; b=qpCnRWEtY0nupzeCflDE/T9+j8vqx/YGEdMbi5/BfHe2zIjJRRPp3xNONfWDwqriL3XW9EK/cb4zec9sFs7I310re29nDI3+mh8iAHgSlq7XoS/bSCLfMugfEjQfs90RtSmhBP/LBiW4WsakOduZHaCxhjcaCdorp8XUK/xGyCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741083696; c=relaxed/simple;
	bh=eRmKs/KA5t2czXG5JRwEy8ZVXDjGdUOsM9uvoq6t7cc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AMXxHX2g6Vl/G27JjdvXUOc5y9lTno4bbixsoW1UGRUSdeaR4Bf1GX7qvCjIB7BxvL0xI1RtTwph7vX9jI5Ox9XrOs+fHWraSPUHhQcLPh6aXHMdQK4PaQnPcBrS3OXFFFXykCcK0Jy2Rdd1UrPs2ckfz45BixMe+NmxOuUcIOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdNqy69a; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdNqy69a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741083695; x=1772619695;
  h=date:from:cc:subject:message-id:mime-version;
  bh=eRmKs/KA5t2czXG5JRwEy8ZVXDjGdUOsM9uvoq6t7cc=;
  b=LdNqy69aRdtO4Q89BHsnx4HnAvWHaQ4Q/cZkYyLnfCRC4mVRx1N8Hj3H
   zC5OpIvBldvfMrnT1U2IptmDFWAJ0zgYKDXugfMGNNWr6N+3jAH3bXjm3
   XM2KKjVKlg8KJ8q2lHn7hLkT8IU0tgGURsO6Qr3mxaSjhybS5mwhPbP42
   2enrwtuJWQVwpTwuoF+4PB/KvuBnKqZ9Wtqkl1SiEdLqdOsORDFWO3lkj
   rrDlZF9V27LqF2NDM6u2rPsPXOntDYqyIDw+upAkMxcmTtymkQQZUYW+0
   6XS377zwoVYage93ipS7+mdUmtVZdPysComcr+j+P0FsZD+Z4H8PVYfH1
   g==;
X-CSE-ConnectionGUID: EECaOhzIR/WWOeZtgI18fw==
X-CSE-MsgGUID: iEhHJmewRKqfaugPVhT5+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41706107"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41706107"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 02:21:34 -0800
X-CSE-ConnectionGUID: uCKql8lqQcuRNrOTAUIaIQ==
X-CSE-MsgGUID: XSrKT2JCQyakIyC0NHMQqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149264140"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2025 02:21:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpPP0-000Jal-2d
	for oe-kbuild-all@lists.linux.dev;
	Tue, 04 Mar 2025 10:21:30 +0000
Date: Tue, 4 Mar 2025 18:20:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] net/netfilter/nf_conntrack_core.o: warning:
 objtool: __nf_conntrack_confirm()+0x17f3: unreachable instruction
Message-ID: <202503041805.MvzIbjnv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 13f5251fd17088170c18844534682d9cab5ff5aa [1/1] netfilter: conntrack: fix cloned unconfirmed skb->_nfct race in __nf_conntrack_confirm
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250304/202503041805.MvzIbjnv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503041805.MvzIbjnv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503041805.MvzIbjnv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_conntrack_core.o: warning: objtool: __nf_conntrack_confirm()+0x17f3: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
