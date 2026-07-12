Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA991F30A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870569; cv=none; b=Y/2QS5Ay099lWYq/KFJNWkXZOW8ekXpYDmfB1s9Vqcwc1D/17VT6MqH2HGpUeNm8IhU3lg72v4UjdkZBjqeBkK5+9FNFVpFd7iRVrYXKcUqz+miuWrJ3qvpiMuNObjmk39ihMXomKz+cPpUs5X3QLjpLVjNONVGD2tK0e7cXs/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870569; c=relaxed/simple;
	bh=kR5fLsvKjjiAOBObPv5mU8vQuqiEkBu9zeF/oxKh45M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UP+OPpfj0P7uSPh+FlCsI8QpSmDR4VZz/3Nm9njBMCUmgI+a/oTdXSuu8RvUcD6t+wnnTxYIqgbZs7DbTlk03KDMa9nAiIdi6TJ6ICMGnd4iywHIfZLW6bUs2N2WhD1s6Ncqhc/k5J3de21Ccspw3XZMZDRRJcNdEck8S07lWy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQVIs9KC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQVIs9KC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783870568; x=1815406568;
  h=date:from:to:cc:subject:message-id;
  bh=kR5fLsvKjjiAOBObPv5mU8vQuqiEkBu9zeF/oxKh45M=;
  b=GQVIs9KCvnZ2ctPkI1lxFp++GZQoz8SUGn7RBsVNxvKHsvI0eYFjEjPS
   /1fQd5DE5TtCMZ9OZQ+HhUc/Tj0m9OVq7Ua1kEHlbQ4lrioxZ8s1BrOXR
   gWcQoKvLJYQEqXgOo6I7tWrVBqfNHxuiGRYXGhwLeQJ3FWSpSzs3GgFPj
   bIbKBvuEzG3sG/9ffG2ph3G6e+U0tbCh2henzSs2ECEa/tLZ7ndryI3gP
   eXwy/VrZollsgp2d5pQlVxt9692AEMCppF73ly4txUEhJ4X2FRZiQWFcC
   UzsnhzQm/fIVnPOpfIzBP/KXVrioLDUr8jNOPiKFmUvpCYZGBS8UC39+a
   g==;
X-CSE-ConnectionGUID: 0WZDUWgZRqyW3ucPkr7P1g==
X-CSE-MsgGUID: DTZTx1pOSZeVnxJr84oRAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87040280"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="87040280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 08:36:07 -0700
X-CSE-ConnectionGUID: gpe6DPajRi2oOJe7W7Jr9g==
X-CSE-MsgGUID: fVL5EYzYSSOv0a8yTmZ0mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259198988"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Jul 2026 08:36:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiwDj-00000000Kwo-2VY7;
	Sun, 12 Jul 2026 15:35:57 +0000
Date: Sun, 12 Jul 2026 23:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Harshal Dev <harshal.dev@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 4886/5655] depmod: ERROR: Cycle detected:
 qcom_scm -> qcom_tzmem -> qcom_scm
Message-ID: <202607122327.3zkZCUaB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: 5c1a2975d23c51c01aca51945d0f10a4ee4c9020 [4886/5655] firmware: qcom_scm: Migrate to generic PAS service
config: i386-randconfig-003-20260712 (https://download.01.org/0day-ci/archive/20260712/202607122327.3zkZCUaB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607122327.3zkZCUaB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607122327.3zkZCUaB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: qcom_scm -> qcom_tzmem -> qcom_scm
>> depmod: ERROR: Found 2 modules in dependency cycles!
   make[3]: *** [scripts/Makefile.modinst:132: depmod] Error 1 shuffle=4014285631
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:2090: modules_install] Error 2 shuffle=4014285631
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=4014285631
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=4014285631
   make: Target 'modules_install' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
