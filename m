Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F239237
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 18:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686162634; x=1717698634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ASfcnA8NVzuz/OGy4IzsivJ8Q0XcyO4n30x8erkkESs=;
  b=mGoOXn3f+PTqOSJYaFVxw09ErxvzMz1QYOtXCo6K470F2Zj0LHIFj6jX
   GlrjgjRJn1ZhDp+HXN7rlMOax0DERwyqa0RSBDdlIqtcsdwTWHOmuIT1q
   u1y/PU2Y8NYUkYFLxQjwhAXq8MWW0D21KIhGOkODhvAVi9i2LGBSlQxjQ
   OHTlba34QhhE36aqVkvRUIi009MeN3i/wG6d+Q6I5lsFNssYubjyzJqHN
   tZtvDp6p+nhdCNDEj9+VKNBZZGpPZqwyCRTc/ZJv/cZ83EslLD/LELk3I
   ULaC7iOox1p8F8u83QvUG9kBhGrBIJqKL3H/RTbnfKjCa/6l4gdKjU6FL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357083958"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="357083958"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 11:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709652715"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="709652715"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Jun 2023 11:30:17 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6xvE-0006ow-2G;
	Wed, 07 Jun 2023 18:30:16 +0000
Date: Thu, 8 Jun 2023 02:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/tcx 533/540] .github/scripts/veristat-compare.py:
 warning: ignored by one of the .gitignore files
Message-ID: <202306080243.pgxM6n8c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/tcx
head:   8635f164a5059efdcb16289c1e809775ad8f5414
commit: af29f6bb7028282daf6976da0089b2987522809c [533/540] adding ci files
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230608/202306080243.pgxM6n8c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/cilium/linux/commit/af29f6bb7028282daf6976da0089b2987522809c
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/tcx
        git checkout af29f6bb7028282daf6976da0089b2987522809c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080243.pgxM6n8c-lkp@intel.com/

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
