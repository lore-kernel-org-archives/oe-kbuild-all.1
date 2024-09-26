Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC333FD4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 12:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727354477; cv=none; b=kh0jDrALUZ6KvcB/DnLoxuP79nSHq3ADeNi0xGIL3HD7tz2zB7qQJfhgVXchlvbPJkGTMsp3fL90mw5YOeWyz2Zwk+NB7G5Lsi9HUhTEiPI+Q23lsNjeRnoZvAqdp0WTjj4d4eBhDRgR07ABCLnKDKvZcTH0FbkN/V2c7W+DH98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727354477; c=relaxed/simple;
	bh=LaOchxQ7xdYuKpFSgKSohiaIn4WVAktf9QGwbMtwL88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qRmdDM98udQxQ6jDAJ8yVORyqmnVETl4AiyZEm7nnZhSLF86GVykMB0zpKxJbJaq+e9EIJqJFso/mqs+VagmUO0cGo75cerOzsBeEM23jWYio/EB6zpFijTqXsntCi0+PUiV6lCq0B+YJGfTxtiGWz2irmQuRJ70iYYd0rnlWh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uug/Pksz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uug/Pksz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727354476; x=1758890476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LaOchxQ7xdYuKpFSgKSohiaIn4WVAktf9QGwbMtwL88=;
  b=Uug/PkszEHl39oD2DFNxstAArDIeZJKlFBjwkJ2u8dFemUGl/J6vyvoF
   j6md+XIo6k3n8VAIJ5Yq0AX0Bij5lXYJdBxNNXfqtv6R3P5ZnKEjcUpu7
   twYv0SKM/0ki0Xsz84dQ+mr+JhCSGVIjSI4Lo6UMXbE9Ls2UFcR0wsOGj
   wW+FXuw4V/JNTw+vGSj87dkGDWXEwWrhTxN0SK9VamwH9KQhhSgD8NkdZ
   Z15YQFn0pgBuTnkBV3kwHyeOPsxCJ4l6iu6cwyWcDC903DeEDhCJwKqAI
   4QVqsS+liwVG2LdEaIJpQoCGruSCGH7SCI4mQof05xU5jeNtOmdEP+mkR
   g==;
X-CSE-ConnectionGUID: i05IxTMgSnG37wBOpFTuUg==
X-CSE-MsgGUID: lHKOnfIdRs+b/lW207xoCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37113641"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="37113641"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 05:41:15 -0700
X-CSE-ConnectionGUID: oNlPE7q3RYyQkma4sc5B6g==
X-CSE-MsgGUID: 5eQRJq+dRnmGArKMbzO9+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="72026522"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Sep 2024 05:41:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stnnz-000KiH-0L;
	Thu, 26 Sep 2024 12:41:11 +0000
Date: Thu, 26 Sep 2024 20:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 1/1001]
 .github/pull_request_template.md: warning: ignored by one of the .gitignore
 files
Message-ID: <202409262009.BpMyuNYE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michal,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: a3ea857146954f18b02b1ac7ee28566072ab30b0 [1/1001] xilinx: Add a github template telling people to not use pull requests there
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240926/202409262009.BpMyuNYE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409262009.BpMyuNYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409262009.BpMyuNYE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/pull_request_template.md: warning: ignored by one of the .gitignore files
   tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one of the .gitignore files
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
