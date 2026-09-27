Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BC121B192
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 02:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790476696; cv=none; b=trAvYTH13Osvk8zFg3P5YSUCxOap/3U0iKoS4268o335o7EzzS2bjd0jcLOKYjqSZdZJKPnjJSjTfz6FgHree57lX4YUmLp/fihLFh58nJyIfWXxhB8e86hEEWHqhcPoZqTXAhvOSB+Raq9FlkgYdsJ87zbIZz/VeU2I48pAg50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790476696; c=relaxed/simple;
	bh=hgWtaOJNDNboysI/w/aw0w6qV5tlF4CarmQ7BKNg8hs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=esSQTb5WgS3uaE29BvDSmkBPOpVhP30BPyOBY5L+Yt94ebiu8i0t1QjUiyUbQkvn7aNXLd6JhZFmXSQCTdyrXcrYKRfxToyRtc8iBx+0SxmxAh41O1n/GXGRQkRBX9BFEiEUQo9pYEpLepffcMYKWTf/raHlvmHxp7dAdg00UAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUcNQO6Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUcNQO6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790476694; x=1822012694;
  h=date:from:to:cc:subject:message-id;
  bh=hgWtaOJNDNboysI/w/aw0w6qV5tlF4CarmQ7BKNg8hs=;
  b=WUcNQO6ZY+WpwJE0UxS22HNO2Y9O5Qr0Do8g6Q7oydAGKXYYuCigwyoW
   ggVwTdtnP6Jm5SmaWo5MuEdycsQ9H9Ao2vdt5897hqM6w+NJORnED/qK8
   B6E58VQnTEcPGzjXgUuIIbWo6nRvuQPmsIzEuNfSk7r2t8XCVLDya1fBx
   wZ8iV+wEKc6la3l4Gw7S9GvzijY8MJvXWNSxjv3/JZCzPys5ewF5NS/kG
   I+7nVxWq7dpJm4NLwYZA3uT2LBqH/O6q1+BwdUx4znNjoriErTP/eJsvw
   fIqWKXGbdLeXSOU4XgqLP08UfmFp/ToSS8CqS0sFE9IrAwgfRwxKs/R+t
   A==;
X-CSE-ConnectionGUID: JS22usa/QFafI7XnVZwgVA==
X-CSE-MsgGUID: fXJe9I5HS/aFyYU2PxjVCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="100547200"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="100547200"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 19:38:13 -0700
X-CSE-ConnectionGUID: 6PhUAnLwRKqaWCgoyIRZ2g==
X-CSE-MsgGUID: by6WQ6jhSD+BwDDIa2cTFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="274829049"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Sep 2026 19:38:11 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAemH-000000000O7-0Xo8;
	Sun, 27 Sep 2026 02:38:09 +0000
Date: Sun, 27 Sep 2026 04:37:37 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_AST
Message-ID: <202609270410.Kc2FsJp1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_AST-0-0 (https://download.01.org/0day-ci/archive/20260927/202609270410.Kc2FsJp1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609270410.Kc2FsJp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270410.Kc2FsJp1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_AST
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_AST [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
