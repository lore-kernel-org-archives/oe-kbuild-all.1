Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EA03B6C0B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 05:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790486491; cv=none; b=IoJNeEYhCN8lLOe5eG9Myvwvzs43e86bRFRoupY7bdpApqpsORIG5Yf1gXVgsQVUjDUWmgCRhytJOHOXg1zPl7goFCUeMy35VqwJSZmClBDjXg4f9tsNgjt5IcW6Pev//c9aqzGshpKX/M6gSu3rBax6qmQHRqLO89zh0/NH830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790486491; c=relaxed/simple;
	bh=x9L6i2tBk8jLyE1Z3zDw7W5VsVMaIBfxmiXz5++jCbA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cWsrUag9hG3jSUkeSXkGCjK6Ck5PwJU0ZhKFyOHH1K6TKaIbQ0E2o9zPjmHZJAZazJd3DCoD73W8ljxZfRBx21HFhOm0WhM48ubNzOhK8xNVvljkmBxUvb8RllRB8CwY4SYz5aOtuUwkAehY9tN+iUxB3wy2NaupUiqTt3DkYHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzVjF5Ba; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzVjF5Ba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790486489; x=1822022489;
  h=date:from:to:cc:subject:message-id;
  bh=x9L6i2tBk8jLyE1Z3zDw7W5VsVMaIBfxmiXz5++jCbA=;
  b=dzVjF5BavlV75QDlsZ1XEKyGZOy9avCaiOD9je0JpSKJ07z4GYXxluHI
   TWhsIpQETI7yOGktLPkUrVx2YdIN42/99ymcECWThkDsAvdofQpIGrhal
   2d2/AZjVOAH6PbQHlNHgmj2GVJ6pWeO4zzBBm3LbNFZT6ClEBMc0PFCLI
   eImWtBS7+nqjddZr5AUQOHYAFUf+pP+TdXcjHEeln4Kra1XX/iFBr2dyw
   ecQ0LQKzUl+aPIs8ayItEwVGToVG8IXjcwWBxmrFbWXc5TByDNqEuPcxY
   t5sHFFP0G1MA7klEbd6pKWgaqzfbQegKXhzq52PXlFiVxgikUjbVz+gu/
   g==;
X-CSE-ConnectionGUID: Er/DOhsORYadUyqnOix9Gw==
X-CSE-MsgGUID: pHvn8pO0QIKDocfYCBFyzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="93932159"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="93932159"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 22:21:27 -0700
X-CSE-ConnectionGUID: M0iGWSTnSVOKRgoKghqqAw==
X-CSE-MsgGUID: RRuMKWlfRCmMClyVPtqydA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2026 22:21:24 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAhKD-000000000Rf-48qP;
	Sun, 27 Sep 2026 05:21:21 +0000
Date: Sun, 27 Sep 2026 07:20:36 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for DRM_GEM_SHMEM_HELPER when selected by
 DRM_HISI_HIBMC
Message-ID: <202609270719.It6pIejV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_HISI_HIBMC-0-0 (https://download.01.org/0day-ci/archive/20260927/202609270719.It6pIejV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609270719.It6pIejV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270719.It6pIejV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_HISI_HIBMC
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_HISI_HIBMC [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
