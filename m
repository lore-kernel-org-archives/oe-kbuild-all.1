Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C5684DF8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723043371; cv=none; b=fUTqg8VeZk7oRCbHx+n8hNrToPuA99ZfkO8UVPSPkVDtMhK/5zn7r29ZTaakpiG87N9taQO9dgLqyyklGh20FIOPpD+eDE1wPhj4A9Slsz7ujQllRO0GjzvrjRdtrj4n6/cwzdpq9eubLy41p8d+b1HlF2gHi8DrE7WY7Jb/jpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723043371; c=relaxed/simple;
	bh=CNB42pJ7oZa7OqamG+fzg7XnL7Vwos4iI4xV50pi4Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7bhzO69d+RM2dek1XYjyZmrpMuTpzj817BjxabIX0rfvdhNfQLiRrcJSVsJEw8uqMgcApSE490WS0qHmwuV2yRJNlgc3sl8zowuuo+vat4mrf8M6Le/hi0C1ImDY4MSCcar4ZGMxgd0p4EB/ai9YZqvxJxhGVLU63iDUUB+zvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXqaLoGl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXqaLoGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723043369; x=1754579369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CNB42pJ7oZa7OqamG+fzg7XnL7Vwos4iI4xV50pi4Sc=;
  b=hXqaLoGlNgGktL9RUQMwUhdpQXvsB2gD+gpRLosoYUpcs7PUHAArN441
   xOjwytM5M7KLEmMLXukwv2HzYuUYXIXqcLSX1RtnZtA/8iJQ1ft2AXUFQ
   rxxHgp4E+ZJM8gA3ne0OBqIyUanV61P4i0WDZcLpt24ENrNPUYOhYOIP+
   Gm+EvDJrcIk/efCE3Kvv+4H13OCr8pDkuQYSHcSb4lcgU7EOXz/meNkiM
   0uEIRNiTeb36jBQIlDgkY3Xkcu8Sf2rbH13Zkg9gp+hx/8spk8BPBQg0X
   tMyylPipKEupkkFYl14baWl9EvM+1enIbNmfmtBeBv/DgRQA+WVy81l+B
   A==;
X-CSE-ConnectionGUID: Fm26WRRcSOmv462lkkLqeQ==
X-CSE-MsgGUID: pvb6hxRdRv+won1TCszmiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21240882"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="21240882"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 08:09:20 -0700
X-CSE-ConnectionGUID: 4WVkGOb7Rbe5c2Ar/b1QHw==
X-CSE-MsgGUID: oFLCiBOvTU6biMhwZTQ7eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="56554165"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2024 08:09:16 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbiHq-0005Tq-1W;
	Wed, 07 Aug 2024 15:09:14 +0000
Date: Wed, 7 Aug 2024 23:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 29877/30000]
 versioncheck:
 ./drivers/media/platform/qcom/iris/vidc/inc/msm_vidc_internal.h: 13
 linux/version.h not needed.
Message-ID: <202408072320.KuZtgpHx-lkp@intel.com>
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
commit: eb19ea8f023fe00b1615006ad8b62a1b91153263 [29877/30000] iris: vidc: define various structures and enum
reproduce: (https://download.01.org/0day-ci/archive/20240807/202408072320.KuZtgpHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408072320.KuZtgpHx-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/media/platform/qcom/iris/vidc/inc/msm_vidc_internal.h: 13 linux/version.h not needed.
   ./drivers/media/platform/qcom/iris/vidc/src/msm_vidc_probe.c: 14 linux/version.h not needed.
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
