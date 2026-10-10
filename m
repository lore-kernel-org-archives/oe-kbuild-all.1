Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD66400987
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633446; cv=none; b=GXOAFB+L0H6ik/mA/qZfeWZS0nYqinDE4C6dUHD8Po0G0u5Zl6vnZ+mFbEtMHfj+hV4KJh3fZvRNUjtylxf/+Lano0qwKeQ3jGVRenUirp3uNWlm68wcneyM4CEnQzCs1llX+oY3RO7E5t42NG6w11l3aB5RusxtF5bsxzfXHK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633446; c=relaxed/simple;
	bh=ntSkBxp+hXNlVR5zareTEdNizNktxEpwJDQRHwVcBdg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SZwus1NfhedCWNpzqW1PjOXffClHOUWWMbWeXQyNPaGlgJz32NlGKejtXfGVqy1SpiCfucUmPkCep/vM8xOgXOs7f26jPlhF+bQzXlBFRY7Y4XQF0JDOGVQIzu8R46eK77o+Y/AcRjs6qFOCqlN3wpI98VSu/iuJOb0ORR6RR88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XC1mbd7I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XC1mbd7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791633444; x=1823169444;
  h=date:from:to:cc:subject:message-id;
  bh=ntSkBxp+hXNlVR5zareTEdNizNktxEpwJDQRHwVcBdg=;
  b=XC1mbd7IaGk4Ezl1rN05tSDrnNjUjsjDlEr/nfcY8Db/ymkb/gLf+4is
   6ewAj6TUVmV/I/gGfg4LtSKcqUEBSs1wMBKvOCtSzQzc9oRqtxSDkF03o
   YB6Khn4/Xtr7SIWVbcyhLk6IyPvftLn5iorjjdzxMnHtuOLX9npHyGa/z
   XUgPEeEpMWMdyP1soxReS1Z3oXlrVdL15/sQ/SYSfoXsUmbE9BN+LSXYs
   dKOUNIbwtzeef230c6V7QuFiWzVn0/7/xuxSEdt8kh0g39JmCkx75ri6E
   8u4EQ5EFwxrnobpRQ3fHcfTidZZm3axS0SREuXerhqK+Cmbn9uioXq4pu
   w==;
X-CSE-ConnectionGUID: Y+o3XWPbSEGO/0e4lUgZtw==
X-CSE-MsgGUID: 3cY6tnNLRAGFpWrHJQutiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="315026"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="315026"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 04:57:24 -0700
X-CSE-ConnectionGUID: hZbkBJpNQ6+nI1NBHz3ARg==
X-CSE-MsgGUID: v8NGBFdOTYmFZvVGOOwuxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="599274"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Oct 2026 04:57:22 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFVhX-000000008yZ-3qWF;
	Sat, 10 Oct 2026 11:57:19 +0000
Date: Sat, 10 Oct 2026 13:56:33 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/195] htmldocs: Warning:
 anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't
 exist: Documentation/amd-pstate
Message-ID: <202610101300.9vBhMg6Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tianchen,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   cf8b9c0b957f45db78a5233576f7c57c3f615feb
commit: aea0cbffc6323957c930eb6c90c41d12df29fe7d [0/195] anolis: changelog: Add changelog for 6.6.102-7
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610101300.9vBhMg6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101300.9vBhMg6Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/64
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/hw-vuln
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/kernel-parameters
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/amd/hsmp
>> Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
>> Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
>> Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
--
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/64
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/hw-vuln
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/kernel-parameters
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/amd/hsmp
>> Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
>> Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
>> Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
