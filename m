Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABA420E717
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 22:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748037940; cv=none; b=udssc16v6vd+gigLHspWZwYIpAsvYEn1sLwChob2O2dhf5Y7LJFEbeq3lnsTxrKd8wqfkEnF8EuxAe9r7Q7YI+f9WJMBimoMJiNnYX0LfP2eLtcIFalQO7z3c7dkJBTFmh93sLF7L1lCRZs3q3gqduFYZjlneIhG3fhsMangpJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748037940; c=relaxed/simple;
	bh=i3AF1JLoKNlSQrH9EWRWA0rSycPJcKgawIVPqnf0m/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T5Gp4QHyrdOGFHwQ2NjleegpdLHRRfXHmE2UIP5WD5nN/BLN72fQjbFJCAGvXMmKb5RNJ+Wadnx01LOSQ6ncn5PngnGYIHw0Hmafimh4RtjA+OL8I8YlcUMa0lt0qqvis420lhx6/CU+J9/abKXqT/9PSmYOkCh4sMtlcQAzE5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQZeyTnT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQZeyTnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748037939; x=1779573939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i3AF1JLoKNlSQrH9EWRWA0rSycPJcKgawIVPqnf0m/s=;
  b=TQZeyTnTPWRVjKtSnKy5EXhW0i45SCRLp9YmsoWe5+/kvlQDz07D9haS
   a1EQRp7zChVeX0mAxEcbUC3tX8CJUqlJ79yk6ZLmSK9IrKoYUwuykMqSk
   04KXLpDd9DNdl8AeU85xlKhL6Xu9vpr5mSpwW8qAXiZePItDEOW5tgEiu
   bUN/quZ22T2QsHHZM2nh3VHvYmutr6W76C+nMK2CgnvW7bJASuQqso+Ay
   xhCY2eC+qPek93Arl7Hm/7fEbGi0dlYHdGAxPbZSt/b6jBRbgQAaEm123
   TbBmzuF3NOdNr6ionraUtJ6E+zxK760A6IP4YJkh3cQy1TORbWpU/TFU0
   A==;
X-CSE-ConnectionGUID: BBDMcOXZQ16R43hPeIU+JQ==
X-CSE-MsgGUID: 8tW+TC6GTa+++WYPXZCSxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61153550"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="61153550"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 15:05:38 -0700
X-CSE-ConnectionGUID: PvthBKxiTgeZHNo/dkHxNA==
X-CSE-MsgGUID: tKJQ3Gk7SziHsGFcnK0Nmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="142274852"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2025 15:05:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIaWE-000Ql8-1h;
	Fri, 23 May 2025 22:05:34 +0000
Date: Sat, 24 May 2025 06:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: Gerd Rausch <gerd.rausch@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	William Kucharski <william.kucharski@oracle.com>
Subject: [jlayton:uek-localio 966/2262] versioncheck: ./net/rds/af_rds.c: 38
 linux/version.h not needed.
Message-ID: <202505240550.VrOTbWIF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 45de215356daa1d42d3b51f53cd6833192451a11 [966/2262] net/rds: Rewind RDS to 8cbd9606a636 in order to rebase UEK commits on top of it
reproduce: (https://download.01.org/0day-ci/archive/20250524/202505240550.VrOTbWIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240550.VrOTbWIF-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./net/rds/af_rds.c: 38 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 424: need linux/version.h
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
