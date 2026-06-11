Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AE73F0A82
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190121; cv=none; b=YDutrHnJmM4a0CfwNNWBTFXau/dp7GjBQO2+J6rGpKyeqqOXLYmqUAg41dpGzr6aWTqjSxGBi1//y3C9k7BwzuKtFhAv9km2bJO5UrxO1elk4ILxubox6/oFik2n9P4vVtq8zLR/eMwxywpFP7JO5VA2dDSnLej5C3i538Qy0bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190121; c=relaxed/simple;
	bh=G2hyXZrcu1aV4kLv3cCbRStqYmtr8Pv0DTLPgoZlLfI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sNvmCTKJEz+fq+FL88HRPTNH2hK9aDnBXMGVV1h29Oc+YUaFP96SZLLttRM5abI8a+UP0kiEfMoefSiTEDeXB+Dq6oHdKjx/3bXyeUMkKNi+s+UsHUw5tLwp7K5JOo6SxfA/33TfKiF4kVGvS+DrP4HQGtxN2sBlZ7Tt+0t88uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftA7Nw+I; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftA7Nw+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781190119; x=1812726119;
  h=date:from:to:cc:subject:message-id;
  bh=G2hyXZrcu1aV4kLv3cCbRStqYmtr8Pv0DTLPgoZlLfI=;
  b=ftA7Nw+IxI3vFb4+uSDvni/d6CCDSPeMOzIc2MdL746LkbNYb0cC/dKd
   XKxGrEm9wF9/gc59cXm9H7fm0/Q28j/Jc6suT25nTBcaYvYn9/Jc7UqFu
   sdmkAQMs63yzA3O7Ac6voiVY4gER/WqN8hPzJ7un0rag0VVtcdXY14FJf
   jTWJpke+UAI/knvZtl6V95IeQssAjDG8TsLKfTDQKK7u4LyqhdUP7Y3/D
   aAHUvmy79P8BsaNyoWQILx/KVOn3+8p1Z7oQ7HYlzy7NhLvlD3bkXgdRN
   kZBxfEX/9vyTCUUbKOAtuxxPzCG4b/bmJxi/XETkMSsqqddxAngVBsHlG
   g==;
X-CSE-ConnectionGUID: 4k7dgxe/SY6AyEEUKcvlcQ==
X-CSE-MsgGUID: qfPUmtCpSZKOScOjItixug==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84573390"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="84573390"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:01:48 -0700
X-CSE-ConnectionGUID: Cui4sqt5QziApYhgKpWbiw==
X-CSE-MsgGUID: rAVFdFZpTHGRibNsascTYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="243569953"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2026 08:01:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXguf-00000000NH4-1G4W;
	Thu, 11 Jun 2026 15:01:45 +0000
Date: Thu, 11 Jun 2026 23:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/bpf-ci-test 344/349]
 .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one
 of the .gitignore files
Message-ID: <202606112251.GbRmKthO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/bpf-ci-test
head:   c1eb47f92df586c6211b9f87b45b2c7179895b77
commit: d9ed8651fe31fd81a36050255ef86df7ef8c54cc [344/349] adding ci files
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260611/202606112251.GbRmKthO-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112251.GbRmKthO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112251.GbRmKthO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one of the .gitignore files
>> .github/scripts/compare-veristat-results.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/download-gh-release.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/install-github-cli.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/matrix.py: warning: ignored by one of the .gitignore files
>> .github/scripts/stagger.py: warning: ignored by one of the .gitignore files
>> .github/scripts/tests/test_veristat_compare.py: warning: ignored by one of the .gitignore files
>> .github/scripts/tmpfsify-workspace.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/veristat_compare.py: warning: ignored by one of the .gitignore files
   .github/workflows/ai-agent.yml: warning: ignored by one of the .gitignore files
   .github/workflows/ai-code-review.yml: warning: ignored by one of the .gitignore files
   .github/workflows/gcc-bpf.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/lint.yml: warning: ignored by one of the .gitignore files
   .github/workflows/linux-next-sync.yml: warning: ignored by one of the .gitignore files
   .github/workflows/test-progs-asan.yml: warning: ignored by one of the .gitignore files
   .github/workflows/test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-cilium.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-kernel.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-meta.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-scx.yml: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> ci/diffs/.keep: warning: ignored by one of the .gitignore files
>> ci/diffs/20260223-s390-bpf-Do-not-increment-tailcall-count-when-prog-i.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/20260415-selftests-bpf-Fix-timer_start_deadlock-failure-due-t.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/20260502-tools-headers-Regenerate-stddef.h-to-fix-BPF-selftes.patch: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
