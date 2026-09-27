Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95271E505
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790508051; cv=none; b=ZbeWPNEFU0cRZNtOQKNG8z/9F0q6xeYbLI0cm7yHs+/uBht89/cxxJW63XhtwPNgPmnxESBXSSLEykLI7S1VeirF6dQu3fRn8PbGi3ojI/MjirWBsDc/foIxlhqokWztQk1izu0vPXLKJyRfdJM7vZSpFvM2z++pOEwU2Rh2OeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790508051; c=relaxed/simple;
	bh=7h6lQdkokbbT4mI3yWMAbE/P1JsxcChAmNtgaHga6o4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cJ4pwvnN9VDYJhEShS7uhXX0ckssW+C8li7H23VpZS5adSToAAJoSjeBJfK0L+9MfidD/a6oFDz1BUjBynCN7T0iDi4vzWhBVO0IJr6BRVvdOc3bmIPmGTguSzJE+76uZ15VY7o6KioFo3DetkP50aEtjKEnk90Jq8eHivMg8fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GM9VTCdw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GM9VTCdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790508049; x=1822044049;
  h=date:from:to:cc:subject:message-id;
  bh=7h6lQdkokbbT4mI3yWMAbE/P1JsxcChAmNtgaHga6o4=;
  b=GM9VTCdwhqyvhyTxCCybNrsuoBkLiQBgIvc1nheRIw8hLLHQ6CHq62W7
   Je3YQTd4C4iM/O8W6BD6oDyO0ZHww2R+66ElghNnoy2ZJG2SWnHJPxhgY
   TnPmdFEUbBrD39JOTBjgVLmRVDTdlpFtc9pN3zkPxz3x7kBYzr9kVQR9F
   3C3n5QEN48TRBt6XLL0mXs+FKIVSh75QlDQEgw8V1BYKfkY18X+IN52Dq
   Ouh0Xlxrmm+v3CdWP2X/Rxz7EZfMP8B+guUzCl7RGqKBmfDpFog0r3Jte
   ePbU4JVX308naE3qySncVAyMSJvg7UHmX/pB0BiSeUY0Svs3p0siwvl97
   w==;
X-CSE-ConnectionGUID: vTzVSYV/TuG1tNaXa+tQrg==
X-CSE-MsgGUID: wuRkCkpNRgWJ3IYvTQgJfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="116757499"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="116757499"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 04:20:48 -0700
X-CSE-ConnectionGUID: MDSIA6lcSRuxnZ9LVDZv/w==
X-CSE-MsgGUID: +aArY6DtThelDO56MblFTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="274912424"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2026 04:20:45 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAmvz-000000000Yp-1gT0;
	Sun, 27 Sep 2026 11:20:43 +0000
Date: Sun, 27 Sep 2026 13:20:42 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for DRM_TTM when selected by DRM_NOUVEAU
Message-ID: <202609271351.tw8EOsgz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_DRM_TTM-CONFIG_DRM_NOUVEAU-0-0 (https://download.01.org/0day-ci/archive/20260927/202609271351.tw8EOsgz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609271351.tw8EOsgz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271351.tw8EOsgz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_TTM when selected by DRM_NOUVEAU
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_MGAG200 [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
     - DRM_NOUVEAU [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
