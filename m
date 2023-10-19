Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91358DF57
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 08:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/ux2ki1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697702521; x=1729238521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VQzpBULN5ai9epUjqKGJUq9uWpZtOPc/S9+4hIEb9T0=;
  b=E/ux2ki1znHS+ZhYA3EyrhS2/SB9lVN6axNTd+Uqhf9FGNf4fc4kKt4t
   ANNgyk72Wq4UpmZ3KYCyk8w7MY5ghAJddnk8TELmVqcspDXODSDv4NaOC
   nX+NqoJQntn/SPUoPFkCLA5VAkuOr2ZMj3v2xHjEsfPpzLAdp+wPpZ/VM
   KJFvyEZlFEFv6vAYDXbzmcmhhvSQIOBZqATWoaVoh0xUCI8WX6QDcpvi/
   9wg+j8PiwwvVi0ri7pDYQmCwR5vi4Jq2VXAuaJ3xYaaplbpXVjy/35976
   VzyRlpWn4bWBs2TbKP+vO5f8iEfB+cD5fNKXV1s0qeU6ojvVD2xFUgBlX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="386024177"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="386024177"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 01:02:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4868385"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2023 01:02:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtNyf-0001qO-1h;
	Thu, 19 Oct 2023 08:01:57 +0000
Date: Thu, 19 Oct 2023 16:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: "wuqiang.matt" <wuqiang.matt@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [trace:probes/for-next 4/7] versioncheck: ./lib/test_objpool.c: 9
 linux/version.h not needed.
Message-ID: <202310191512.vvypKU5Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace probes/for-next
head:   e2049d8569d94446eb581f792178c1ac4eddb58b
commit: 92f90d3b0d5e384f218c8068138ed1b3afa025af [4/7] lib: objpool test module added
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310191512.vvypKU5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191512.vvypKU5Z-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wrestrict -Warray-bounds -Wformat-overflow -Wformat-truncation -Wstringop-overflow -Wundef -funsigned-char -Wenum-conversion -Werror=return-type W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 KBUILD_MODPOST_WARN=1 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
>> ./lib/test_objpool.c: 9 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 402: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
