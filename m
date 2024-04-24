Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606CE393
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 00:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713917093; cv=none; b=NmdW3WcpTmUJKDwU+qubimSMK1YkvQRuPt2fGtHwjZX+5xA3P8FJMJlGFHZi7te5qJDpAbBwv5RgCOBFe0eAQ1FxLwOjeqhkhiDYggyJY3/0Pv69VbscEMVyXGsnZCz6hu5BM0dKypX0llzBfZw34jJqn5IHhzvPUFkf4ZnQfPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713917093; c=relaxed/simple;
	bh=o2/99OXR6kmqSXDMNd/FFOdKwUL9yteOQHIli1MuV+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nTbGwuqcKOXBpKC7oIftecDWLtpFDIIR+5pBaDGXqf2JrAdOlZd7Z9EUkQSusfFERNTD1IYg4xCSsReFJxlU6YmUmRotrKMDNMXR2CMDfrjZJf4Ffwr9PjcHc8GBlTFR/zhwfqL10QQZd7aGExS8B5MXCYHXySvEo9IRP4x6+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdgZ6o9M; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdgZ6o9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713917092; x=1745453092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o2/99OXR6kmqSXDMNd/FFOdKwUL9yteOQHIli1MuV+w=;
  b=KdgZ6o9MvL4IPSvvM9R8gM2MjoG9w5oNT/2RDZHhoRyJjoot5FjQ7xJN
   6eqNATqzRsWzlE/sR2nPZIEi0KOw75U3x9KFLtLInWGbZNKm/ES44Jlne
   5FPLS2CJSvy050FwJpEUScOlUXL3NDpSiYrSETHNdqLTQKPykl5ElRGD3
   KVIUbaXQSeDYmVpy39JDDRLpKfDvdZewx7WWv9CT1MAVwVx5NaevzVLDg
   MDprGasiyinMEKSJv/Wz6lRNkAexAUGtkt7rVDKbaeSYTIMw/gOAfm/8m
   TDdpMCQd/1HXcjRbFQgIgNrEx+S6V7bHpV0fedUl2d4K8gVqtklF6OasU
   A==;
X-CSE-ConnectionGUID: kTcx+oNqReWuUaxbEMRn1Q==
X-CSE-MsgGUID: dvcfO2K2RoyKk/pxcOmdRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9693818"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9693818"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 17:04:49 -0700
X-CSE-ConnectionGUID: jZwyBG1vTICHRApodL2yww==
X-CSE-MsgGUID: NAoxH1HpQgyuhmyKPtTATg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24415474"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Apr 2024 17:04:49 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzQ7y-0000eN-0c;
	Wed, 24 Apr 2024 00:04:46 +0000
Date: Wed, 24 Apr 2024 08:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16749/22178]
 drivers/cpuidle/cpuidle-haltpoll.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202404240755.6cyyb93J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b3e8831fccd1999bb3d13b324fce51dcf3d41841
commit: 8104395ba98a81c8cb1ddd245482baca0d57d163 [16749/22178] add cpuidle-haltpoll driver
config: x86_64-buildonly-randconfig-005-20240424 (https://download.01.org/0day-ci/archive/20240424/202404240755.6cyyb93J-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240755.6cyyb93J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240755.6cyyb93J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpuidle/cpuidle-haltpoll.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
