Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D512112B76
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694101753; x=1725637753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xJ2zl9rNuAOZK/h3B8JI0WDMAy7Up9GFpXlBWrYMdiE=;
  b=gJoorH2Osr8NqOQMEsxET1pPtUCMg3DTPbqHpKYKb4tjWsEPL2/0tdD5
   0URLWzmwLrqYGwk+jhdzmZ0je0UU9PW0lQe3wg7USx8zp4GUGi04w6Xww
   Gu6waiLgupMV/cS1B1APm0ih9guvyLRjOYsqUKgp1LonWid6YlkfWo2T4
   vJZlhNe3XXhaqBJuNr6wDEmPhKQU92smWzdxHx2nBVyp0INgPB2fiztYM
   SQIaBcPRFsEw+E99VazzBLMavED+LYrOiUxUwnEhVRc7nWgbrttAqZwxF
   yCEqukiPyEiLVW12sBJb4CHjB98MnqrdR3prFfMmVQ+I7k6Ncc+BRYLic
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="408387687"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="408387687"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="771333387"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="771333387"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2023 08:49:09 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeHFj-0001LH-0L;
	Thu, 07 Sep 2023 15:49:07 +0000
Date: Thu, 7 Sep 2023 23:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Olsa <jolsa@kernel.org>
Subject: [jolsa-perf:bpf/kprobe_multi_override_ci 3/3]
 .github/scripts/veristat-compare.py: warning: ignored by one of the
 .gitignore files
Message-ID: <202309072337.O1vzvb9k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/kprobe_multi_override_ci
head:   877e214f28a27f84fc36f3abfd10f04db6a337e8
commit: 877e214f28a27f84fc36f3abfd10f04db6a337e8 [3/3] adding ci files
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230907/202309072337.O1vzvb9k-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309072337.O1vzvb9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309072337.O1vzvb9k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/scripts/veristat-compare.py: warning: ignored by one of the .gitignore files
>> .github/workflows/lint.yml: warning: ignored by one of the .gitignore files
>> .github/workflows/test.yml: warning: ignored by one of the .gitignore files
>> ci/diffs/.keep: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-Revert-arch-fix-broken-BuildID-for-arm64-and-riscv.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-bpf-Add-missing-btf_put-to-register_btf_id_dtor_kfun.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-bpf-Include-missing-nospec.h-to-avoid-build-error.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-bpftool-Fix-NULL-pointer-dereference-when-pin-PROG-M.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-libbpf-btf_dump_type_data_check_overflow-needs-to-co.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-samples-bpf-drop-unnecessary-fallthrough.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Add-config.aarch64.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Add-json-summary-option-to-test_progs.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Adjust-expected-error-message-for-test.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Fix-compilation-errors-Assign-a-value-.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Fix-decap_sanity_ns-cleanup.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Initial-DENYLIST-for-aarch64.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Panic-on-hard-soft-lockup.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-S-iptables-iptables-legacy-in-the-bpf_.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Select-CONFIG_FUNCTION_ERROR_INJECTION.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-tracing-fprobe-Initialize-ret-valiable-to-fix-smatch.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-veth-take-into-account-peer-device-for-NETDEV_XDP_AC.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-x86-vdso-Conditionally-export-__vdso_sgx_enter_enclave.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0002-selftests-bpf-Set-CONFIG_BOOTPARAM_HUNG_TASK_PANIC.patch: warning: ignored by one of the .gitignore files
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
