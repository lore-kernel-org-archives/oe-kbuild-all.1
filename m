Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4693856B81
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880057; cv=none; b=JSJIw55gTo4l5yDYo0bqpPI5IyNlUzy7Pzb6SP+2bV0kiueqgr5uTECVakjToaljCFk6kfedhv5sgRf7N6LrpNA3rneL5MocWOYlsInlRCSJ3rIjO6dpko3NUrxqgNllEXN+ht1enicemI64iY8A8I6T7uVKY95pH8BBNGkpKyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880057; c=relaxed/simple;
	bh=+JnuNyC3NfPspyhKpKANLev7d44bCbb2QZG/PNU2td4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8AwLA7M6laCY8aU7TblG5JI5mohmaVnQfo5MLJj+eqszb/uQSBQUUDndk+fsHbXdPr5V8OiIpjrOvviteHULVBwWfpdFbXJ+2Ra8PxxyhcJGEjn8HYOnKGGac+g/uvMYWJzGXcqNuwCeTTgnTAd9H6yhMptjBDjxGqUt5fY1Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TB6OPluW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TB6OPluW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765880055; x=1797416055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+JnuNyC3NfPspyhKpKANLev7d44bCbb2QZG/PNU2td4=;
  b=TB6OPluWNy6FBpzo4/Cc+T7rX6TRAK9awRtk+geApR27z1bB92qBHWWQ
   snfek0a90LxWNd5asOQVBYGvBpBhYAtrcwtwlCbFdDZxViriubm+e+jIC
   VpjRLMkBv4EGaKdJzXLdCzYSOE6EWm6q31IFRuFb5SE3MB+0m4+ZqHKIf
   ilHb326TH4xAM3tBlhNRV+GTL4LL0TVfM25UirvM/lakhBCOE94LB14UB
   831cAudUUZfS8Mlf33RrreVgLUUwmtC6jsEhlKFa/IzKQezy+yV0ONW4n
   M503L7SZOS9PCichKPN5UFMcktODo7aCikK4aPeQzYdHaJ97VU+/hGM1+
   Q==;
X-CSE-ConnectionGUID: SAroo1ItTgOoGFRZT530DA==
X-CSE-MsgGUID: DPHzWu7cSY+yiNNzbPX5Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="70370842"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="70370842"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 02:14:15 -0800
X-CSE-ConnectionGUID: rK88FS4ISd6ysEQFjmXy1g==
X-CSE-MsgGUID: LjXbDboWTKa391Dxvxcx5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="235390842"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2025 02:14:14 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVS4J-000000001UG-1Zw0;
	Tue, 16 Dec 2025 10:14:11 +0000
Date: Tue, 16 Dec 2025 18:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 drivers/cxl/pci.c:208:1: warning: no previous prototype for
 'cxl_pci_quirk_lookup_id'
Message-ID: <202512161840.GU4YdQ8s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   0bcb74c919819123b737554f5d35edefa0555d65
commit: 749b5ee0a31f88993106ee666c7992279bc7e86d [11/11] anolis: driver/cxl: remove the sanitize limit and fix the return code bug
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512161840.GU4YdQ8s-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161840.GU4YdQ8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161840.GU4YdQ8s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/pci.c:208:1: warning: no previous prototype for 'cxl_pci_quirk_lookup_id' [-Wmissing-prototypes]
     208 | cxl_pci_quirk_lookup_id(u16 vendor, u16 device,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/pci.c:223:1: warning: no previous prototype for 'cxl_pci_quirk_lookup' [-Wmissing-prototypes]
     223 | cxl_pci_quirk_lookup(struct pci_dev *pci, const struct cxl_pci_quirk *list)
         | ^~~~~~~~~~~~~~~~~~~~


vim +/cxl_pci_quirk_lookup_id +208 drivers/cxl/pci.c

   206	
   207	const struct cxl_pci_quirk *
 > 208	cxl_pci_quirk_lookup_id(u16 vendor, u16 device,
   209				const struct cxl_pci_quirk *list)
   210	{
   211		const struct cxl_pci_quirk *q;
   212	
   213		for (q = list; q->vendor || q->device; q++) {
   214			if (q->vendor != vendor)
   215				continue;
   216			if (!q->device || device == q->device)
   217				return q;
   218		}
   219		return NULL;
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
