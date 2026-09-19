Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EB43126DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 21:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854716; cv=none; b=Vo83gbf4+BrIZ5hO7XsyuJsOmpVrtGx5ecgEUarXCEF5xtwq/YRMJvCWj0so32G+y2zrUD311lVHo5qth6jA133yL2P2g1bqWVvUVtWjtMuB2cNRyi815Gop6/tZV5JlGoC1HjX1FOGVqOr7rwmlgHDPW2BkR+BqK74vLHa7MHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854716; c=relaxed/simple;
	bh=U6TtDozMRTlDE49+Ijt3Y2oPxMzmAZMy/Cg64zTGJ7I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lheqKq2c2BywM5M5pVWtjY0V9ZWLWtW3DzPdm7Ex2hxf7plvIPZsM8QNW6SVRFcRQIZJBfuKeAwPn38lJ6PtA441YDRbJOoSeJFjc1SnNm/673jHFCyzpJSDYQzgpxMRQjW59ZjgYfTYzXC2At4iDDEu/qRCRpTY1S9mZNZrSKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2kk9zCf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2kk9zCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789854713; x=1821390713;
  h=date:from:to:cc:subject:message-id;
  bh=U6TtDozMRTlDE49+Ijt3Y2oPxMzmAZMy/Cg64zTGJ7I=;
  b=V2kk9zCfMxKwn+dWZ40EpzD300hpNWvb9t8nUmbJAlYhVLOr5+l4ykfV
   AiAL+h03FMaR7Cl8XWSSOKA0PLqOyG82kJVIv0uuEILL0KJ+w6xjl4RCb
   bP4zTh5p4V8m4tk0amspDTs1YmUmlxiBAC5LaiCvKB0cgI6LIaR/T5R70
   nT2NgzNYQeUh/tBUA+PbDCqy8xkDJ7/0LKkbbw/Yt6rBy1eHADFlgg+XV
   cfrJsLviKtMNFSE3B9N6doQNf8dJz65ABvLZV/rUY/ZUP6dr8+csD//SR
   Nt2HjoSM393018KL2WSA8w+p93xExQxKfknpUqrzgGH0RwvZ8nSpXZsSc
   A==;
X-CSE-ConnectionGUID: AC/mwSfXT26kG5fNESptKw==
X-CSE-MsgGUID: fe3Qh0euRTeQFZ9d7l3iYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="90499988"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="90499988"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 14:51:53 -0700
X-CSE-ConnectionGUID: XU2gDzEjSs2x0ESa/KzoWg==
X-CSE-MsgGUID: mqWAcFCOQ/6BCAiCA8cVdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="3394107"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 19 Sep 2026 14:51:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x82yL-00000000BQ3-2tZl;
	Sat, 19 Sep 2026 21:51:49 +0000
Date: Sun, 20 Sep 2026 05:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 109/109]
 arch/x86/kernel/amd_nb.c:64:24: warning: 'next_northbridge' defined but not
 used
Message-ID: <202609200532.ijMYGryu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   04b4bf9552e8b33c5cbacd563be503e271170f4e
commit: 4fda8daac2a8eed840c58eda0a52b0bf68fe0f7b [109/109] anolis:x86/pci, x86/hygon_nb: Add Hygon Northbridge driver support via PCI enumeration
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20260920/202609200532.ijMYGryu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609200532.ijMYGryu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609200532.ijMYGryu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/amd_nb.c:64:24: warning: 'next_northbridge' defined but not used [-Wunused-function]
      64 | static struct pci_dev *next_northbridge(struct pci_dev *dev,
         |                        ^~~~~~~~~~~~~~~~


vim +/next_northbridge +64 arch/x86/kernel/amd_nb.c

a32073bffc656c arch/x86_64/kernel/k8.c  Andi Kleen     2006-06-26  63  
9653a5c76c8677 arch/x86/kernel/amd_nb.c Hans Rosenfeld 2010-10-29 @64  static struct pci_dev *next_northbridge(struct pci_dev *dev,
691269f0d918cd arch/x86/kernel/amd_nb.c Jan Beulich    2011-02-09  65  					const struct pci_device_id *ids)
a32073bffc656c arch/x86_64/kernel/k8.c  Andi Kleen     2006-06-26  66  {
a32073bffc656c arch/x86_64/kernel/k8.c  Andi Kleen     2006-06-26  67  	do {
a32073bffc656c arch/x86_64/kernel/k8.c  Andi Kleen     2006-06-26  68  		dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
a32073bffc656c arch/x86_64/kernel/k8.c  Andi Kleen     2006-06-26  69  		if (!dev)
a32073bffc656c arch/x86_64/kernel/k8.c  Andi Kleen     2006-06-26  70  			break;
9653a5c76c8677 arch/x86/kernel/amd_nb.c Hans Rosenfeld 2010-10-29  71  	} while (!pci_match_id(ids, dev));
a32073bffc656c arch/x86_64/kernel/k8.c  Andi Kleen     2006-06-26  72  	return dev;
a32073bffc656c arch/x86_64/kernel/k8.c  Andi Kleen     2006-06-26  73  }
a32073bffc656c arch/x86_64/kernel/k8.c  Andi Kleen     2006-06-26  74  

:::::: The code at line 64 was first introduced by commit
:::::: 9653a5c76c8677b05b45b3b999d3b39988d2a064 x86, amd-nb: Cleanup AMD northbridge caching code

:::::: TO: Hans Rosenfeld <hans.rosenfeld@amd.com>
:::::: CC: Borislav Petkov <borislav.petkov@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
