Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5EE1E6732
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723036643; cv=none; b=t28Z+OjuXj0iIhiuSVZtGhzOUOpIRiXEhL7xRP8HICAz4KBzICptX9ZtspkdWxG5hfq3J4+2JfgmkdIkLjxFJfY2Qj2zI/xOWyPHCuA5iLvagBZGvh+OxGlYQ+riWiAQmex4qFwi9s9FEb9wZ1s04nLn8yUMXBORNAoLTnvjkZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723036643; c=relaxed/simple;
	bh=Y2v5KY9vJ94/4lXtjvofN/T869OBpU8udyWFiXt0hl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YkK6i2dIW6fAWCBZtYoSHHhACzWtjY4JlhIvh09G19GUdbpOHP2lL0AqOAYRnSvjaJlZMmpuHSEdBrBurcIdnIogLozCN1MxdFR35Ff5sm0a3ei3+ZIIP69jAHX5eZ22uU6pO9si2n15K1P3ad6IIrMXYePlKM2lUPfBKpCtzP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2TgmiWJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2TgmiWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723036641; x=1754572641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y2v5KY9vJ94/4lXtjvofN/T869OBpU8udyWFiXt0hl4=;
  b=P2TgmiWJs8Z/m/BUVk0NCPpw8i5uqT4ad9B22L49KXZc39V6FsMgha8h
   dgXdBGZWiASq8LpzkCf00bJ+urvr7XzxzQlEj+tUiBXl26zfZ8IrdBiLn
   erczZIewh0nlJFojmv355nVq+VxDu5l4PtwpROd6RRKuKeDF6Q7q2BdQe
   tdmrWN4CzmWlnUiG4Xn9OUCphY9rwQuitx0OmBzA+MkqQJrsBkceJBPOF
   QwCZ9eGip2NLFdUZ1jW3RqOzE1eBe0W66wzg/fBGRfVNB8kJS5Bk6NU63
   QSM+wB80oqg1X3d4ft7LCwehWzJN5HObcFhUQ1yXhB1o083BY0sggBlRy
   A==;
X-CSE-ConnectionGUID: iDEJ/ZtJSCKCVzS1trXE8Q==
X-CSE-MsgGUID: bsUFVCbdQq2fuuTcAOjjWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32249358"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="32249358"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 06:17:21 -0700
X-CSE-ConnectionGUID: M5OfLqHYSUS7wK8RXtJRTA==
X-CSE-MsgGUID: jUlgFJCuQIml1+Zsp3wyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="60972973"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 07 Aug 2024 06:17:19 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbgWz-0005Ou-2c;
	Wed, 07 Aug 2024 13:17:14 +0000
Date: Wed, 7 Aug 2024 21:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 29862/30000]
 versioncheck: ./drivers/media/platform/qcom/iris/vidc/src/msm_vidc_probe.c:
 14 linux/version.h not needed.
Message-ID: <202408072110.Vv9DmSdP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/debug/soundwire-wsa884x-interrupts
head:   77aa965762ad9c8711d005628b5c471007e0df82
commit: be387e4b07b05468462831442660e7ab575c33eb [29862/30000] iris: vidc: add core functions
reproduce: (https://download.01.org/0day-ci/archive/20240807/202408072110.Vv9DmSdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408072110.Vv9DmSdP-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/media/platform/qcom/iris/vidc/src/msm_vidc_probe.c: 14 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
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
