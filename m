Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E172117
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 09:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695462664; x=1726998664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Q0a9tAbqRywXeE4GeEHU9eeYmzwrvuvwQiNvQ/9RlQ=;
  b=dRZS7dHPgC5oF6Qf+CfqjpY/DQF/uzPpJSouPLNvbMsQfGD/CAXLkZTh
   0H4v8V3ldflp668yBvzhi0uiZd661yJ/yLw6GImVcZpklJLURMMBR9Ayw
   y//4yFI/hpxoV+ND91MTts9lwkb4ndRWKfacGv4Jcei977r2Nc9B6bqUN
   qel8bXg3iAobK11ZuduUy0V/FTkbYqbXrvjfOm8awBBsUxbrTlhXKRsV5
   2thqFRln6xmoL46nd8pnO0pyywajOWcP41REKOoB+xnEtIt2V/DJNqigM
   tkTkcXp9lwq/P/pvT0dhrEO9K4cEQeANhtNH70bdSvD3oPniGm+KtCYcL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="380915356"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="380915356"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 02:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="871539188"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="871539188"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 23 Sep 2023 02:51:01 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjzHv-00027s-1x;
	Sat, 23 Sep 2023 09:50:59 +0000
Date: Sat, 23 Sep 2023 17:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liu-song-6:bpf-tramp-to-prog-pack-test 427/428]
 .github/actions/veristat_baseline_compare/action.yml: warning: ignored by
 one of the .gitignore files
Message-ID: <202309231715.n2s282hA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/liu-song-6/linux.git bpf-tramp-to-prog-pack-test
head:   49175e9536aa1b8df9326f079e25985a72589d8a
commit: 5f68fb455993723b02cdf2e30fc80506ff9c089c [427/428] adding ci files
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230923/202309231715.n2s282hA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309231715.n2s282hA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309231715.n2s282hA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one of the .gitignore files
>> .github/scripts/bpf-objects-rootfs.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/compare-veristat-results.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/get-commit-metadata.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/matrix.py: warning: ignored by one of the .gitignore files
>> .github/scripts/prepare-incremental-builds.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/tar-artifact.sh: warning: ignored by one of the .gitignore files
   .github/scripts/veristat-compare.py: warning: ignored by one of the .gitignore files
   .github/workflows/lint.yml: warning: ignored by one of the .gitignore files
   .github/workflows/test.yml: warning: ignored by one of the .gitignore files
   ci/diffs/.keep: warning: ignored by one of the .gitignore files
   ci/diffs/0001-Revert-arch-fix-broken-BuildID-for-arm64-and-riscv.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-bpf-Add-missing-btf_put-to-register_btf_id_dtor_kfun.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-bpf-Clarify-error-expectations-from-bpf_clone_redire.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-bpf-Include-missing-nospec.h-to-avoid-build-error.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-bpftool-Fix-NULL-pointer-dereference-when-pin-PROG-M.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-libbpf-btf_dump_type_data_check_overflow-needs-to-co.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-samples-bpf-drop-unnecessary-fallthrough.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-Add-config.aarch64.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-Add-json-summary-option-to-test_progs.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-Adjust-expected-error-message-for-test.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-Fix-compilation-errors-Assign-a-value-.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-Fix-decap_sanity_ns-cleanup.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-Initial-DENYLIST-for-aarch64.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-Panic-on-hard-soft-lockup.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-S-iptables-iptables-legacy-in-the-bpf_.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-Select-CONFIG_FUNCTION_ERROR_INJECTION.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-fix-up-Andrii-s-BPF-token-v5-patch-set.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-tracing-fprobe-Initialize-ret-valiable-to-fix-smatch.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-veth-take-into-account-peer-device-for-NETDEV_XDP_AC.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-x86-vdso-Conditionally-export-__vdso_sgx_enter_enclave.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0002-selftests-bpf-Set-CONFIG_BOOTPARAM_HUNG_TASK_PANIC.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0002-selftests-bpf-Update-bpf_clone_redirect-expected-ret.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0002-tools-headers-uapi-pull-in-stddef.h-to-fix-BPF-selft.patch: warning: ignored by one of the .gitignore files
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
