Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B022F1BD006
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723818010; cv=none; b=Yawm9pxqaYsb2USBPVg16hHuw0uDf1nYL3Ecbi2TBg/6T+DJ606byt3OIDz7OBqgEN6spaWNrxeM8Dahbkcr5Je19HoodyggeMYmnJz5lk2CedYP9SLaD2UgNeWjE7fmehDyeyRQzLFgiRcvqdx4OlgouTPaWWcmyFxGhcbrFMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723818010; c=relaxed/simple;
	bh=8GEOXFdQCroNTE9RKjcrOgzRbyeM/Skw51IqEhD2vuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LYxGTV66loJ2NDvPlcFz6lmzYTz3xu5WYTwooY/M2dSwfVaj91GMeI1/q8H1uRyH6anUzbKmLumTAo9T6GrC8zXkOFtoCx78cjwioUJwwXqUGbbQtKKInlkW1Soc+NrcZn01k6Unh+VhgOHmUMJ4V2pPMilzCfuyNq8dDLpBPwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjlOSrnD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjlOSrnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723818009; x=1755354009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8GEOXFdQCroNTE9RKjcrOgzRbyeM/Skw51IqEhD2vuk=;
  b=WjlOSrnDIGd2oyRMWqkQwPbJ2+Zk8ybkQlaQHEUtnrLoLD0GBEgoVEa2
   WY/Ods7icsoK0zpohaB6SfZXXrBe1DmgdPaNqa1L7ai0MPP5zwaxNoua+
   E/si2gbWicR/wmvJH8zO87urJe4aDmkEcu0ZcdGe9Zo0X0hjDJ51CwFkr
   C5LaPDBR2kCoHYT/U+5UXbmaxlhV4g4Ml3Lsa0coZaivbUUAtIu4BzQpf
   7MUgiUMCLLee7htG3tyPRzF2/pfVyWalyZnrHefRMJgE0elzWUJfdhvjs
   /J98+aCzuVM37uI4GiuDFubj8XSNc10pEF/dQtcLPFO543VQh1oijUccJ
   A==;
X-CSE-ConnectionGUID: 6uiOPSzmSwqUiPYz2KdWSQ==
X-CSE-MsgGUID: BpbvpsDgRLGNIcI1wBvdaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="39627746"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="39627746"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 07:20:08 -0700
X-CSE-ConnectionGUID: zPYZnj59QiOiXHdSFPVAMA==
X-CSE-MsgGUID: qXC+k64MTP6X6GKlcHPStw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="90416718"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Aug 2024 07:19:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sexo3-0006V8-27;
	Fri, 16 Aug 2024 14:19:55 +0000
Date: Fri, 16 Aug 2024 22:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: cloud-init created default user <azureuser@kernel-patches-daemon.22zsf01kdi2efgt1o35yfjauwb.ax.internal.cloudapp.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:pr/1 2/3]
 ci/diffs/0001-arch-Kconfig-Move-SPECULATION_MITIGATIONS-to-arch-Kc.patch:
 warning: ignored by one of the .gitignore files
Message-ID: <202408162253.S37n8cB7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux pr/1
head:   838b102a1f0d055eb5ab3be126345622e10ff134
commit: d5cc4c94eeb43082cb439eb13ab498fa6ed41cb7 [2/3] adding ci files
config: arc-randconfig-002-20240816 (https://download.01.org/0day-ci/archive/20240816/202408162253.S37n8cB7-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408162253.S37n8cB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408162253.S37n8cB7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one of the .gitignore files
   .github/scripts/compare-veristat-results.sh: warning: ignored by one of the .gitignore files
   .github/scripts/get-commit-metadata.sh: warning: ignored by one of the .gitignore files
   .github/scripts/matrix.py: warning: ignored by one of the .gitignore files
   .github/scripts/prepare-incremental-builds.sh: warning: ignored by one of the .gitignore files
   .github/scripts/tar-artifact.sh: warning: ignored by one of the .gitignore files
   .github/scripts/tests/test_veristat_compare.py: warning: ignored by one of the .gitignore files
   .github/scripts/veristat_compare.py: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-veristat.yml: warning: ignored by one of the .gitignore files
   .github/workflows/lint.yml: warning: ignored by one of the .gitignore files
   .github/workflows/test.yml: warning: ignored by one of the .gitignore files
   ci/diffs/.keep: warning: ignored by one of the .gitignore files
   ci/diffs/0001-Revert-bpf-Avoid-unnecessary-audit-log-for-CPU-secur.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-arch-Kconfig-Move-SPECULATION_MITIGATIONS-to-arch-Kc.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-bpf-Fix-a-few-selftest-failures-due-to-llvm18-change.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-bpf-Fix-a-verifier-bug-due-to-incorrect-branch-offse.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-bpf-next-selftests-bpf-Fix-a-btf_dump-selftest-failure.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-net-bpf-Use-sockopt_lock_sock-in-ip_sock_set_tos.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Filter-out-_GNU_SOURCE-when-compiling-.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Fix-bpf_cookie-and-find_vma-in-nested-.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-Fix-pyperf180-compilation-failure-with.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-disable-detection-of-llvm-when-buildin.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-fix-inet_csk_accept-prototype-in-test_.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-work-around-latest-Clang-smartness.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-xskxceiver-ksft_print_msg-fix-format-t.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-tools-resolve_btfids-fix-cross-compilation-to-non-host-endianness.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-tracing-kprobes-Fix-symbol-counting-logic-by-looking.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0002-tools-resolve_btfids-fix-cross-compilation-to-non-host-endianness.patch: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
