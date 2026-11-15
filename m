Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752152;
	b=PJGNXA8JP2W+39jB6ycA8dXsx2aGtHmvNEwMiyk1YO8TYanem5sIxc2SBExvIYSBYJSY
	 oIDOrWlS6NvQKQhT0WM/CF6HazPMgZhGZqwGNN4b0pgsNTLpJ6n3tdqAyTQXGKhrPElOG
	 W9QUJ1QcRxUwLkm5+OJZjyWwf/OG2KhBAecsdqPVZtp9PfI9n6z2OBz07fR+K2Fscx9+L
	 DylEXkSyFhK7IoWhpB6mf3x59KcZYpktnc4ogZSFh5LunBnwbxArGoTV/AYzJj14ynEAq
	 v3AEGvYsODSuglVsTBlFgtj3F+6ZtmenOjhsradE+oWT57x01tOzU9uz/5aIjbEY2Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752152;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tOL+0JoDanUkltOj2+1nw7gvD9RhxSJN4tEUQ5kfXls=;
	b=rnV5fhE8St4y3mA9Px6ezHdr+29SYAFvgKDU7QIgILxCOkyjtnij8KGDsNP80xaUbl+D
	 XDEt/dmuDIDrfc2paNRg+qJYLlV8Bp+CC3+tE4EbmRF8ShElnIKDm7Y1jt4YF4t32adFO
	 7tWNPf7UYYlnUohrnAG19qRVRR0CFZ2AjBzfPII1rDRjjXKFiwZGeauqEumnwDpvl5jEy
	 KlMzQ095O8Zg95HAlDjTDvmCnBDgkWabhSXsO3e6WxiuLfXLL4sHXiLApzc0yNgKHtpvU
	 2Zcx+vrhfDpF4mYMQAzgr8oTJ8yqmc7/3gu11DydDk+gA8oaGq/suC24ojI1rmBM17g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QnazKjH7;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7FD606A329
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 14:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B7FD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QnazKjH7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794752151; x=1826288151;
  h=date:from:to:cc:subject:message-id;
  bh=S7y64ItCaxmQN2FJlZ76/Ygl61K6tNTYLFQbr4k8AI8=;
  b=QnazKjH7fFKG5NxrHaZdGUvvrmJACtMjyVsOPy6TFGpZGCzgCcpJbYI2
   UfDh5V/SIV0wU76O+6MiROfSo5pPVCG/DrSyL1UDmqJcQqjfOWIHMpBRm
   ZxwEAWYlxPz10b8AEOn9BCfCgWqXT+YsXUeEoGbQQRYbNTrIUR9Pb2FD6
   BIsZ/V2tVySyzSdsBUJeIvHf/coxFbFB7hMUDLFmH7/q00twZuLOOoYLx
   WMnExFuX/YmogjTqit+3LhXsZ2Sb/O8RC8ER2RFenGcac56us2/bJyBK0
   FakShiJGMgvQ1CoKT71DgiReTHpXdOLctjhHPG2xtv81g7DNtzyA78MYp
   A==;
X-CSE-ConnectionGUID: x6RlRj/vTx2FhINXqOUrSQ==
X-CSE-MsgGUID: c/1+bhnGQkC8icqeME4R8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3534692"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3534692"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 06:15:50 -0800
X-CSE-ConnectionGUID: Ff+P/uF8RVCG4aqmCpUFzw==
X-CSE-MsgGUID: 1e8vUvomT6Kwu8Fxr1mTJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="11239261"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 15 Nov 2026 06:15:49 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSb1H-000000002Dw-3D7q;
	Sun, 15 Nov 2026 14:15:47 +0000
Date: Sun, 15 Nov 2026 15:15:25 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/181] htmldocs: Warning:
 anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't
 exist: Documentation/amd-pstate
Message-ID: <202611151508.h31PDZkz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Tianchen,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   4f2db664ee044fbea206f4d976d61e47d4cf2158
commit: aea0cbffc6323957c930eb6c90c41d12df29fe7d [0/181] anolis: changelog: Add changelog for 6.6.102-7
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611151508.h31PDZkz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151508.h31PDZkz-lkp@intel.com/

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
