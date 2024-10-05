Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E25F9FE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 01:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728092094; cv=none; b=SI6dj3BGmvDzcAjWS3aJZSHaaGFdNuzrAwlCxaLFqCpdxaTAzse6OekNWHSnlWg2nHrrEBsqI3I/4IArH/UBVA0FMZnREE0inWYNfigk84DzMzDtH95Sbt4Kr+P/Uig52DD9mGaK5A5gLF+NjQd8E8Pb0vQXbLMDaAgE3EUzR14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728092094; c=relaxed/simple;
	bh=rJYjzr9Oxh+iQ1fnGP371DNlx9a19ura9A763oWYDBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aUtNSws7kdQE9OO8K5F5pBv34Pt0gQ/xmtvGFdA90XyGfWYE7U9N6rAiCspGH/FJ33uEMOAE6H8dLt15QJl0MEeAvy/+a00RFPDMg5MRod+ep+yLVC3DKe5deejab0Ff2YiaDeR9iBtxiiJYJE9FhalcaGzwi4y8e2v3zZBGios=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Inb+7bxh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Inb+7bxh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728092092; x=1759628092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rJYjzr9Oxh+iQ1fnGP371DNlx9a19ura9A763oWYDBU=;
  b=Inb+7bxhqK8z/RfsP6l8x6AhgGspf/Oi+dogGkEo77ms8FeTlbeg6IDF
   lScAHHrN9wAhwO82GyO/W7fIwEcovqy1YwBJbRDCUO31LyiPf5H7V+hUd
   yvbZnEXKCNkcm5G7v7Lpqt+kD0EoKyGU9xDQfXZv5mPLxOj4tNUm3iCRs
   A/z353fKki3jLTCeSDD7F/35aatNBum7ifzLEfhrl9fNb2LEb6q6cBbhY
   fSmPExtkeUKGK7MgGGQPJPodFY/S3x1Ety/JE39jxOUButt9x1jjx7Aln
   +n2ksS92SwKMnbTHzfHkp2d9JfkzMg+q8/gSmqwh0uYUR+OfRyLOrInS5
   A==;
X-CSE-ConnectionGUID: wu3A9CA+Tv+3oa9Ebwd8mg==
X-CSE-MsgGUID: fewkFmPzQhefZxPDzxkXAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27202463"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27202463"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 18:34:51 -0700
X-CSE-ConnectionGUID: oPGusFMzRyONawmhmh1x9g==
X-CSE-MsgGUID: q38jIboGRYm6/ifD/PP6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="79704272"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Oct 2024 18:34:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swth0-0002QJ-2F;
	Sat, 05 Oct 2024 01:34:46 +0000
Date: Sat, 5 Oct 2024 09:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: Junwei Zhang <Jerry.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Asher Song <Asher.Song@amd.com>,
	"Le.Ma" <Le.Ma@amd.com>, Qiang Yu <Qiang.Yu@amd.com>,
	Flora Cui <flora.cui@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
	Slava Grigorev <slava.grigorev@amd.com>,
	Yang Xiong <Yang.Xiong@amd.com>
Subject: [agd5f:amd-6.2 598/3034] versioncheck:
 ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not
 needed.
Message-ID: <202410050903.RffFqsLd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-6.2
head:   89450c67d99b47b5c1929a5cd2d8467b6ee686a4
commit: 2d5f3df7418899af846a0ce32f1ce38d2997a1c6 [598/3034] drm/amdkcl: add backport support for scheduler
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410050903.RffFqsLd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050903.RffFqsLd-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.74.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
>> ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 406: need linux/version.h
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
