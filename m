Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D051925A2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 22:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731967834; cv=none; b=CeQGI69AgEIuooSPm9dtyp65PeKu1kdUa7Jz8OQmt5BZboLjYQ1J7hNIx+PT05Tiu8fMu9hJoscZD92OuHOSlwuaUAWqyKhHsbRYSL2D3aA6IaOiqO2A/BfrPNhRczkLI2Qk2Z4VBzDQEfo1boEHX9Kvdli3SY2BfQ81C5P7geg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731967834; c=relaxed/simple;
	bh=E4GNVvRcrxgr9ka77jltKQz+cpn6NdEvgEfpIULt+24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AddzZCzqlue85Fb5WjIMrmtoVDe6ffVJf697iMP9MA61cQPlcLbEux30E3QTlM9mf21vnDs+u6/xH8XZa9v9TsQgrj+fdpSEQ6hSJm6qfjN1QZu844yM4GKijx1XQkB/VLe5iefmUYAJTwpO/E/ZeMAeVM/EqsZcy7k7OPPMv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrXJWGMf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrXJWGMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731967833; x=1763503833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E4GNVvRcrxgr9ka77jltKQz+cpn6NdEvgEfpIULt+24=;
  b=lrXJWGMfWL/slkiBvrB6guZrE/4L/0bPI2MHPLS2ow6e5Tht/4NYc3hF
   KIn6M699zp0d/aKwoyB2oBz1hmO6zMG/Tk97U4g8S4TD3IMYafXrWCqeh
   ZyeLf5KgSNEigpt0T4MDuq+ytTTTqLeLA4YEnvWivlKlv1k+08uHr3Xtk
   V3XaifLdhTM3Jctc+GRNAGhTOPV+jSNJIMoB8Kctssq1efELFRwvv+iDi
   pSVoSjt70bEev0GgwB+pNeBmu78GseAMyR8bzRUHL7TsMf1zd2Mteh/4L
   LJSTGhzzYGK32mVNROm1SnRYfaUMdmHKqvXYKQOB2JDgK406EuzlBmESE
   A==;
X-CSE-ConnectionGUID: JEKZkWjXRBCFyApTY3SkIQ==
X-CSE-MsgGUID: OmH5F/nrQ0uFnzRqMg6m5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43017910"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="43017910"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 14:10:32 -0800
X-CSE-ConnectionGUID: zh70qY2vQD6TspnIE6CF3Q==
X-CSE-MsgGUID: hAI54PNgT4eXZRAEq8JQAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89278755"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2024 14:10:31 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD9wy-0002fJ-0A;
	Mon, 18 Nov 2024 22:10:28 +0000
Date: Tue, 19 Nov 2024 06:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.12.y 128/139] versioncheck:
 ./net/quic/packet.c: 13 linux/version.h not needed.
Message-ID: <202411190648.hy2fR9pl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.12.y
head:   c7a2a43e9cf8aff2e1c41bf6d8d75b918df3b9e6
commit: a61c8a8d71bd2477072a19042dfcf0c742f6e9e4 [128/139] net: implement QUIC protocol code in net/quic directory
reproduce: (https://download.01.org/0day-ci/archive/20241119/202411190648.hy2fR9pl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190648.hy2fR9pl-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./net/quic/packet.c: 13 linux/version.h not needed.
>> ./net/quic/path.c: 15 linux/version.h not needed.
>> ./net/quic/protocol.c: 15 linux/version.h not needed.
>> ./net/quic/socket.c: 15 linux/version.h not needed.
>> ./net/quic/test/unit_test.c: 15 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 423: need linux/version.h
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
