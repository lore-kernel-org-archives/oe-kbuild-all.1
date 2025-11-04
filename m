Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFD72951A7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 08:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762243799; cv=none; b=BtbBNO86AnAycgCXMRX0l0Urr49/VybW8HGbFMoLIVczwULl911Ue807WZjMSDXOXYonTSkgOVNT5vTPnYEPhTDPLh2yHuCBVcKpGs4kOWqmwFB8xhRaBy/Tzp/MoTHJKtHHe3JFFn7NUQBX6Hah1xOdhieHdEZdDUjc6L97qmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762243799; c=relaxed/simple;
	bh=dZ0kU5zv3a5Oj8O3BaVX/dH0O5tDk14A25n9PCjndpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G2Z/MNucAAhJD8B14W4ByKQIn/0vwM0G8AsaqYf3pJtIFEHeDgMT4mfatHE44DPKYw3pH0PfCKLAiFXt2GOFlq9XaeHcbBahNVpwFGhh4/m7ggDy/GMVt/6RZ126lGmpNU/M+f7gjEcpj+FadvvksyTXGYE/r1JGRCKe1n/ILA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njQeikEI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njQeikEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762243797; x=1793779797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZ0kU5zv3a5Oj8O3BaVX/dH0O5tDk14A25n9PCjndpc=;
  b=njQeikEIJROR0GH+dMFL6DFUYFjj/NdJqh1Ft2IqPGrOyoPgqqc8eA/7
   mcuz69heDFnjJrO9PncMOAHGLkvVwiXwYRY3HeDfvxganup9iEBwr/yoG
   9AMYCCCMfjY31nmNmiBZ1nFrmlBDPtlyn9C87o5WIQoG+n1a8YJHROWFq
   m5FlnqZJLY97Cp4pNQoMzGjSZj/IWeX/1xQgu3U8BnaxRN/H5maeb0ENo
   2IZ+I+uAZOBt3aAwRPv5mV2SQJjAwWT5GvM3LMGqyllnj2N6Z8OpA9ciQ
   +aHML0+tvUdrN0b3SX6fqHN1JzJIPVMw1a4g76K+cSbjNhTNSb/Iwcho+
   g==;
X-CSE-ConnectionGUID: jTco0yIUQ2GhA5a3fg6zIA==
X-CSE-MsgGUID: SUoJurVrRDOnlJ07sCt+Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64482862"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="64482862"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:09:57 -0800
X-CSE-ConnectionGUID: gQyOlgKrTO6Ck8sgvMnj/g==
X-CSE-MsgGUID: GTz95CKoR9KYUMpAeAXxkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="191442207"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Nov 2025 00:09:56 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGC6u-000R5Q-2R;
	Tue, 04 Nov 2025 08:09:50 +0000
Date: Tue, 4 Nov 2025 16:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 1/1] ERROR: modpost: "__umoddi3"
 [fs/rpdfs/rpdfs.ko] undefined!
Message-ID: <202511041546.fXGMorCm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   e8e76da7ed715ef67ccc4436f4981a5b39983d9f
commit: e8e76da7ed715ef67ccc4436f4981a5b39983d9f [1/1] rpdfs: initial commit
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20251104/202511041546.fXGMorCm-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041546.fXGMorCm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041546.fXGMorCm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [fs/rpdfs/rpdfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
