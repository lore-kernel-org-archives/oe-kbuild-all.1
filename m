Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC80615ADA1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 18:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728153507; cv=none; b=fGiUToOwF4rtIGb2PFgdDoJj2uF5uTQtlcrOFDM6FjisSBE1LH1OabsUXRFEecIyxHOWbF88TqfKoz/EjcY5p803tqiDehMKRGKvEbUSupiG/TOItfS7kJtnhqW2mzCMVG5NQmtW9aWMG+TQPPpJOdjwQFjFD2p8U3/t0Tb5XtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728153507; c=relaxed/simple;
	bh=ZUxzEbDw30Y4rCez9hdOLFgI8+dJXFQ6N67/Cp5fSMA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0ktKXDUprm/iuVFAEgxsCZmpq97QetHGyh5wymL3fZVpwQkS+2ztb6qQdcHrrSllshz+xB8XxLunRn7um1iLlai6EluS3055xQPenCBd0UKn/rYiCYHxEowWrLwxXRkyUX+4trbetcTEvFxj4dotELJFRtdK1Zslwpnpshcaqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLC0bG7V; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLC0bG7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728153506; x=1759689506;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ZUxzEbDw30Y4rCez9hdOLFgI8+dJXFQ6N67/Cp5fSMA=;
  b=hLC0bG7VpdXf8nq2o+IKCANwWIu5fDYj/3HOurRbvBZKYD2/3aC2Sx32
   yGTW6sdR9xKfWdzGLT+GPDJCsCCEnqjHvyTGLg9YovXWx1/HoUWG+dnzu
   0yqRiiaeDKqEgiEnqUJgiE5IvO3I3dRl5KmBicb22s/UDDts62msmNO/d
   7++HVjZ7NOp+2MLl4hS8poghVBs0rwUh/pW8zNWVECheQgGlfOqYDSM0L
   L11btJ++aO3qBBWyrHaFBaYUW8ws9fWFvYkqSnWk0OuT35DlBKOLOhj0c
   Xoi6eJzyXoVDuNHIFXZrNqW1glHHGXAIMjPNSHKXrfYxpYFbDkJlFuSVe
   A==;
X-CSE-ConnectionGUID: YUhgKnQ5SOeNtsKjb1Et8Q==
X-CSE-MsgGUID: 53dPOz3FSZ6NoJs7YagFsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="38007369"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="38007369"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 11:38:25 -0700
X-CSE-ConnectionGUID: 9vBdphBOQPCd101lEcRTWg==
X-CSE-MsgGUID: WrQDtHl0Ry2/G2BZbUe+JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="112503359"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Oct 2024 11:38:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx9fZ-0003Gq-2e;
	Sat, 05 Oct 2024 18:38:21 +0000
Date: Sun, 6 Oct 2024 02:38:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, matttbe@kernel.org
Subject: .topdeps: warning: ignored by one of the .gitignore files
Message-ID: <202410060248.qArlaWIg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jenkins,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matttbe/net-next.git b4/mptcp-issue-368-selftests-old-kernels
head:   71ffa0bf649c2228f63bcb4633c8b02bb2b266af
commit: e8a6a7e84c5b102e6d35e436f83832915f6022ee tgupdate: merge t/upstream base into t/upstream
date:   1 year, 7 months ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241006/202410060248.qArlaWIg-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060248.qArlaWIg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060248.qArlaWIg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .b4-config: warning: ignored by one of the .gitignore files
   .cirrus.yml: warning: ignored by one of the .gitignore files
   .git_markup: warning: ignored by one of the .gitignore files
   .github/workflows/build-validation.yml: warning: ignored by one of the .gitignore files
   .github/workflows/checkpatch.yml: warning: ignored by one of the .gitignore files
   .github/workflows/notif.yml: warning: ignored by one of the .gitignore files
   .github/workflows/update-tg-tree.yml: warning: ignored by one of the .gitignore files
>> .topdeps: warning: ignored by one of the .gitignore files
>> .topmsg: warning: ignored by one of the .gitignore files
   drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/vc4/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/ext4/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/fat/.kunitconfig: warning: ignored by one of the .gitignore files
   kernel/kcsan/.kunitconfig: warning: ignored by one of the .gitignore files
   lib/kunit/.kunitconfig: warning: ignored by one of the .gitignore files
   mm/kfence/.kunitconfig: warning: ignored by one of the .gitignore files
   net/sunrpc/.kunitconfig: warning: ignored by one of the .gitignore files
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
