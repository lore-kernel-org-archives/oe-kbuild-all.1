Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF73E134420
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Apr 2024 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713112028; cv=none; b=NYHjc+lYs69aJH7Pns2RwkDu0rWjcDSQqapEkfLR7n/CW0DTUuPodKA61Gc192+csNxdfPeXEi3z7FUwlGBO8CbhMF/2Sz6QV9vXtvYixxB4cUrLo2+76mk0OkDQ4W162xJlXdIQsmlBnFGNgupTe5jEYtRL8hk4l4nn+dMH8y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713112028; c=relaxed/simple;
	bh=uknulULL8gCMK3ZAX7Mvgp9OYVoeYDj/xyYbadq0NWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ifmty9nYp5+RfbYzMIKMRLWOiwaP8FBTwhFre/EB9UXyVc4/Tpnax47pPsz9r8L4lOUOMHaTZ5JbeDh7gopcvZyIcQJOXHl5jDm/GVx6KfVRVdgAYa8e/zqf6eToH5Y2dmKK8p5dPDd4hXK3ueEihpu/qCS6/RCFTHff+7pOHdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhsFNsKK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhsFNsKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713112027; x=1744648027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uknulULL8gCMK3ZAX7Mvgp9OYVoeYDj/xyYbadq0NWo=;
  b=IhsFNsKKnV2FpcCTZOSAHfFlKolHuDf2IsjPjYsBIgDl9ilr7O/at0w+
   xOjp9Qzvsv22DlFjEEx/QgtFlseDZbV5MiPyBszCsmk0y6lQpsBeUK1oK
   ddB7i5iT5pecya2IWy0WCzK+p0Gq5xExLCRhoC3R9XEpQaB4JGOnW4MOm
   CVzH8yZA2XUQysafPT48wfgonBTC0OQrSsvdDdKVw57sZFr+dbVrVAW6J
   1ZPjNW3OIllTnU77BOyCIkUyTNC6qAc184SuezLsqcFJGSYEskVX/XbHn
   /0uEh/UbGI1ywcGP8LZba/OGcSAcIJBnABUaypy43LsW6O5nnqwbkeoWW
   g==;
X-CSE-ConnectionGUID: hSPXdu33QNObcJB3d+VZzg==
X-CSE-MsgGUID: fuk0lWjaTCWKhtzLxWn2sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="25962874"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="25962874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 09:27:07 -0700
X-CSE-ConnectionGUID: 9R4erXzgS4afIGoqYPjI2g==
X-CSE-MsgGUID: v4XY3eKFQciDOOKiwP7SXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="26110129"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 14 Apr 2024 09:27:01 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rw2gu-0003gg-0R;
	Sun, 14 Apr 2024 16:26:56 +0000
Date: Mon, 15 Apr 2024 00:26:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v2 1/15] versioncheck:
 ./mm/page_frag_test.c: 11 linux/version.h not needed.
Message-ID: <202404150016.QQ5PCLI2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v2
head:   498852c9076b039587557f7d682f14f78d7f7f0b
commit: 5f9fd0017d936a2e89caac1cac2c69c0c7529ad4 [1/15] mm: page_frag: add a test module for page_frag
reproduce: (https://download.01.org/0day-ci/archive/20240415/202404150016.QQ5PCLI2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404150016.QQ5PCLI2-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.76.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-17/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
>> ./mm/page_frag_test.c: 11 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 410: need linux/version.h
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
