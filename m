Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27884C7C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749053362; cv=none; b=HGMcCM7DcHUMlEoDL2aTpC8dQUXK6TYgsSwfi0GXme6e9y9Rdh3DGLY64W6bBpNbWrkihygrpbrUEdwSFaZWi3MG3vZgaqdSYrAUWzbVAkCB7wodKpJXdPIY6qD0fo7iKulDpYCjH/0ILtNKr4Ds5ckkF+bVhj9i0veAuhvzRMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749053362; c=relaxed/simple;
	bh=RpZhvkD0dGGVPHgFW7PWWGSaaP+pB72hneiEKmJdDms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=inC5Y/xWRFvqKcvrToEqnmQ7uvshTOB2cR9AZREk7oTYn+DYdVGQ6R2yxH+hHWjLpfCEURhN4Z7kVkjFsWzR8TbiOX6aoCZy3Ftoen7EDs0oz/9/TfmByzCohOFnzLEt9RGoAGKZ73zS6HJ48owWWHHnR0e9FNtp6lGP+FbGFI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqU/F4CH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqU/F4CH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749053361; x=1780589361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RpZhvkD0dGGVPHgFW7PWWGSaaP+pB72hneiEKmJdDms=;
  b=lqU/F4CHWQ7/gCQhwriEbZXt/9/GKu5+Ll9ZtGcsXr8b2w/+z6lh2LZG
   T/ST18s4P8KWWelmMmVZBlXM1DRfs+N9QhLXnKL/rjOdwGZrZkHO8jHW2
   GOcsafurbymHuMtiIa8dI+9QiKMDvpduK3axvdGl9i3W+ehlNFqtsFqeE
   YtEcuqLgvZBeOdnxwbTBLGUx8nim1dUOFVeKXPmTjkPmVLecI/2Ejjwan
   EqYLYkh40CIlSt5HvOsjl3JO59XDCTJQjmbVB6jefuEmdj4RjyTK0LHva
   7/HccTGVOM1ky6BCiq2gmVTzcGSa8/hZ+x1aYGyr396n4eF7Hduxh9D1z
   w==;
X-CSE-ConnectionGUID: WDcT8gu0SkSzEkEd5RVB9A==
X-CSE-MsgGUID: 6MyuBDhVQIiWChviSQ2iqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68698365"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="68698365"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 09:06:09 -0700
X-CSE-ConnectionGUID: 0tCaK24lS620L9DkGmPUiA==
X-CSE-MsgGUID: IluE2Q+DQ9eFhmN/IJTwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="150111662"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Jun 2025 09:06:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMqcv-0003HP-35;
	Wed, 04 Jun 2025 16:06:05 +0000
Date: Thu, 5 Jun 2025 00:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexghiti:alex-fixes_manual 6/6] .github/.MISSING_LINARO_DEP.swp:
 warning: ignored by one of the .gitignore files
Message-ID: <202506042314.nxH0APvb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux.git alex-fixes_manual
head:   ed78e03a2fdff0a8ac2ef2c1da5a7957cfdbf2c4
commit: ed78e03a2fdff0a8ac2ef2c1da5a7957cfdbf2c4 [6/6] Adding CI files
config: i386-buildonly-randconfig-004-20250604 (https://download.01.org/0day-ci/archive/20250604/202506042314.nxH0APvb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506042314.nxH0APvb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506042314.nxH0APvb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/.MISSING_LINARO_DEP.swp: warning: ignored by one of the .gitignore files
>> .github/.swp: warning: ignored by one of the .gitignore files
>> .github/MISSING_LINARO_DEP: warning: ignored by one of the .gitignore files
>> .github/scripts/.patches.sh.swp: warning: ignored by one of the .gitignore files
>> .github/scripts/build_ubuntu_defconfig.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/ci/__init__.py: warning: ignored by one of the .gitignore files
>> .github/scripts/ci/base.py: warning: ignored by one of the .gitignore files
>> .github/scripts/ci/shelltest.py: warning: ignored by one of the .gitignore files
>> .github/scripts/cleanup_pr.py: warning: ignored by one of the .gitignore files
>> .github/scripts/config.json: warning: ignored by one of the .gitignore files
>> .github/scripts/defconfig.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/isolated_tests.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/kselftest.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/libhugetlbfs.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/libs/__init__.py: warning: ignored by one of the .gitignore files
>> .github/scripts/libs/context.py: warning: ignored by one of the .gitignore files
>> .github/scripts/libs/email.py: warning: ignored by one of the .gitignore files
>> .github/scripts/libs/githubtool.py: warning: ignored by one of the .gitignore files
>> .github/scripts/libs/patchwork.py: warning: ignored by one of the .gitignore files
>> .github/scripts/libs/repotool.py: warning: ignored by one of the .gitignore files
   .github/scripts/libs/utils.py: warning: ignored by one of the .gitignore files
   .github/scripts/ltp.sh: warning: ignored by one of the .gitignore files
   .github/scripts/pw_ci.py: warning: ignored by one of the .gitignore files
   .github/scripts/pw_tests/build_rv32_defconfig.sh: warning: ignored by one of the .gitignore files
   .github/scripts/pw_tests/build_rv64_clang_allmodconfig.sh: warning: ignored by one of the .gitignore files
   .github/scripts/pw_tests/build_rv64_gcc_allmodconfig.sh: warning: ignored by one of the .gitignore files
   .github/scripts/pw_tests/build_rv64_nommu_k210_defconfig.sh: warning: ignored by one of the .gitignore files
   .github/scripts/pw_tests/build_rv64_nommu_virt_defconfig.sh: warning: ignored by one of the .gitignore files
   .github/scripts/pw_tests/checkpatch.sh: warning: ignored by one of the .gitignore files
   .github/scripts/pw_tests/dtb_warn_rv64.sh: warning: ignored by one of the .gitignore files
   .github/scripts/pw_tests/header_inline.sh: warning: ignored by one of the .gitignore files
   .github/scripts/pw_tests/kdoc.sh: warning: ignored by one of the .gitignore files
   .github/scripts/pw_tests/module_param.sh: warning: ignored by one of the .gitignore files
   .github/scripts/pw_tests/verify_fixes.sh: warning: ignored by one of the .gitignore files
   .github/scripts/pw_tests/verify_signedoff.sh: warning: ignored by one of the .gitignore files
   .github/scripts/requirements.txt: warning: ignored by one of the .gitignore files
   .github/scripts/series.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/build_all.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/build_kernel.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/build_only_defconfig.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/build_only_kselftest.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/build_selftest.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/generate_build_configs.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/generate_kconfigs.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/generate_metadata.py: warning: ignored by one of the .gitignore files
   .github/scripts/series/generate_qemu_test_configs.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/generate_test_runs.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/github_ci_squad_results.py: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/early_boot_alternative: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/early_boot_alternative_reloc: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/flatmem: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/hardened_usercopy_slub: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/kasan: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/kasan_inline: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/kasan_sparsemem_novmemmmap: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/kasan_sparsemem_vmemmmap: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/kasan_vmalloc: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/kfence: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/legacy_sbi: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/lockdep: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/medany: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/medlow: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/noc: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/nosmp: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/pmu: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/preempt: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/preempt_rt: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/qspinlock: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/randomize_base: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/rseq: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/rseq_debug: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/size: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/sparsemem: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/spinwait: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/strict_rwx: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/svnapot: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/ticket_spinlock: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/defconfig/vmap_stack: warning: ignored by one of the .gitignore files
   .github/scripts/series/kconfigs/ubuntu_defconfig: warning: ignored by one of the .gitignore files
   .github/scripts/series/kernel_builder.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/kernel_tester.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/kselftest_prep.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0001-selftests-bpf-Add-RISC-V-specific-config.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0002-selftests-bpf-Rename-fallback.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0003-selftests-iommu-Add-RISC-V-specific-config.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0004-selftests-exec-Remove-static-pie.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0005-selftests-hid-Fix-broken-build.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0006-Add-missing-net-lib-kselftest-target.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0007-BPF-kselftest-fix.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0008-BPF-selftest-install.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0009-selftests-clone3-Avoid-fragile-struct-poking.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0010-selftests-clone3-Avoid-fragile-struct-poking.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0011-selftests-bpf-Add-missing-per-arch-include-path.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0012-Missing-iommu-config.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0013-selftests-filesystems-mount-notify.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0014-selftests-mm-page_frag.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0015-selftests-mount_setattr-mount_setattr_test.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0016-selftests-pid_namespace-pid_max.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0017-selftests-proc-proc-pid-vm.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0018-selftests-riscv-abi-pointer_masking.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0019-selftests-ublk.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0020-Add-missing-utility-script-to-install-target.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/patches/0021-ntsync-typo.patch: warning: ignored by one of the .gitignore files
   .github/scripts/series/post_to_squad.py: warning: ignored by one of the .gitignore files
   .github/scripts/series/prepare_rootfs.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/qemu_test_utils.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/selftest_builder.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/test_all.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/test_kernel.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/test_only_defconfig.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/test_only_kselftest.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/tuxrun_to_squad_json.py: warning: ignored by one of the .gitignore files
   .github/scripts/series/unpack_fw.sh: warning: ignored by one of the .gitignore files
   .github/scripts/series/utils.sh: warning: ignored by one of the .gitignore files
   .github/scripts/sync.sh: warning: ignored by one of the .gitignore files
   .github/scripts/sync_patchwork.py: warning: ignored by one of the .gitignore files
   .github/scripts/xfstests.sh: warning: ignored by one of the .gitignore files
   .github/workflows/kselftest.yml: warning: ignored by one of the .gitignore files
   .github/workflows/libhugetlbfs.yml: warning: ignored by one of the .gitignore files
   .github/workflows/patchwork.yml: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
