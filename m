Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2F6481675
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778183863; cv=none; b=CVIyDyVMwQ+lSc4rD/nCbsoMBY6TKg1bHEiImfmQkbOVUjY50hPRTPzJ3RSo4h5r3tC4wH6m9sYaNtn2MMuzEOUpoo1iT9xwbuocKjgeST1GvOhx0OzZU8DrD3GonNl69anr99w1iWlT0fm5HRmzaYV/8HWifS+ThtQ0a+EwCM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778183863; c=relaxed/simple;
	bh=FM3JyjULX1lnlZXdQ5PBZlEcLXNCfI0RfxPxmmxvNMg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fVRJsnyQ4hCo9Dk3nNQRz+Osh5J/UIisBAeu0UyHvdU57BlICQfSQEL9ehMPobAZV8x1MLDj/So5j/N4rJ208j9Bmzn+MIrav+isq1/t/cDq0KsH0LS/WdLdNfHe/v14XJb2JX5x5Aibp4K7/IBlAzparVLBKBoCj1KD416BKOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7fqcNI5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7fqcNI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778183862; x=1809719862;
  h=date:from:to:cc:subject:message-id;
  bh=FM3JyjULX1lnlZXdQ5PBZlEcLXNCfI0RfxPxmmxvNMg=;
  b=l7fqcNI5hRu6fjs+uqiwUIy+vyWxxE5BONZo6FLkicjkNY690CmYudTF
   TL4CvnvH5oPtcjv9dpaKKBm9sWx4cti5umavopIwSCGsicFg6JpECwEay
   nEugUV/CyCmgb7WBShi5Dy8N3vSJ2gGCkfNkMUHVHck3A+wm9mulMV7Mt
   c2wmfSTVsLDMBv86RtxMy1yl4O79VrzZjiZTWGMFvXoYYRDOi8ucJ6enr
   H4/ZPy+xAczjJdrdues53QmMjyDXGUf1KEWVnc1W/zN8HCfuxEbUPvLAu
   WRL5yeX305IdMahTRguxFuS9BW2t3qzaM5huHdmvgIXP2VAlMa8bhYWdE
   A==;
X-CSE-ConnectionGUID: JGm98qANSJCxeSOIrhtzCA==
X-CSE-MsgGUID: 3EKDsVPpSa6fLllSW9G8AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89843713"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="89843713"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 12:57:39 -0700
X-CSE-ConnectionGUID: I+tRP0nlSeq5mV0tNF4FlQ==
X-CSE-MsgGUID: 217bik8QQIKLZ+7A8FhSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="240549811"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2026 12:57:37 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL4ql-000000000Pd-0Exh;
	Thu, 07 May 2026 19:57:35 +0000
Date: Fri, 08 May 2026 03:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: [mst-vhost:balloon 4/30] Warning: mm/mempolicy.c:2527
 expecting prototype for vma_alloc_folio(). Prototype was for
 alloc_frozen_pages() instead
Message-ID: <202605080331.y1eIdVUC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git balloon
head:   9f56ee36fbf6a6d336dc6a9eaeb4f8a67cb42a31
commit: 95744e0e9c4df79c6bc8ec96306b29c7a8e8984e [4/30] mm: move vma_alloc_folio to page_alloc.c
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260508/202605080331.y1eIdVUC-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080331.y1eIdVUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080331.y1eIdVUC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/mempolicy.c:2527 expecting prototype for vma_alloc_folio(). Prototype was for alloc_frozen_pages() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
