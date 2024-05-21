Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D627F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 07:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716274826; cv=none; b=uWbHfpcMYbdAe/sewVaWPy+pGrqX1ILKNgSdQ+bMedBwciJLPML1fVjIQglPqmxccBlWGyvxgB1vQqzfoxtqePUrtJ0ZcEcHCByzqJpDRuGGhyNUs+QSmqqEa5Z0jjock4chdYOjRnW8+QAAhdgQA4EQY7Shf+8xtp3vR6M0UUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716274826; c=relaxed/simple;
	bh=LCvBLtMGCFvZvlW32JdS6+bSW1DobU32f+vyIIa/GKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CZP4UridiHtypEpXq1usTw+j23A2Phq+8iv7AQHRQ3ngjuIG8ZwtG25hGm1P6foPiQvuH4fwWxRZxxrXOTIfqwVzC/WSppf2b4W3Srhry2YvYJidXiiqTMrKO0Q3obm04RwcjxV13YRJ9BIH+VAOPCbSCZg/4GkO6snkd/Royb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikWELigw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikWELigw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716274825; x=1747810825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LCvBLtMGCFvZvlW32JdS6+bSW1DobU32f+vyIIa/GKs=;
  b=ikWELigwhJHrtA6BO99Dztk60a7tJai05KMkrb85nLtNvp+7zKj9C6k9
   QFcYjTzH15fHu5aQvh8dkV1NFqrOHtMWvP2dJY/J966buR5bbC/CAofcP
   SNf00JHJz8b6OXcFcFiLRhZP6DX3mT8Fr8iwk0H6uImGNL5qdEyynsE6Z
   ZWcVbseokbMDyZfpU11JbaAoxHRjJ+SX0zYvua+9iEzGp4ggosk4pI/t3
   JdDoo85jQS+9y0rjgsIu9ZdyLvIoCGUF0xMBagze5jBHLLOoCI6GA6Dau
   vcyRt3wVTK8CbxT63WTGiRJ7RohBFH8glngOnabft8ctBejDdhSbrnwg5
   Q==;
X-CSE-ConnectionGUID: RG6uqO+1TQ+dd2hIMFCgdA==
X-CSE-MsgGUID: EnzPkwk1SxCFc6GGQrNKUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23857083"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="23857083"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 00:00:10 -0700
X-CSE-ConnectionGUID: 52zgXnpUQ36+/VPYFwP1Bw==
X-CSE-MsgGUID: CNseoJs2Sc2mv5VlluLCyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="70219872"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2024 00:00:07 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9JTa-00062i-1N;
	Tue, 21 May 2024 06:59:59 +0000
Date: Tue, 21 May 2024 14:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6984/7601] .gitmodules: warning: ignored by one of
 the .gitignore files
Message-ID: <202405211447.q7mOLqPn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   3d005f3eb08ec52d3b09d59ffc09bec4a8ae4900
commit: 5539eb94813473b5a6234699b4fa6c45a595c4ba [6984/7601] emm: add submodule of emm
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240521/202405211447.q7mOLqPn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211447.q7mOLqPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211447.q7mOLqPn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .gitmodules: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
