Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A815D5DA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898922; cv=none; b=m1w0wsTuXzPWv0pU4hureyy5rAp6Yw5qcrmWqVuq7t3wsEP95Hf2KaokuxpW7Vp+lhM+yKTLkL1kmgZNT0qdk1E+WdGdWsLyO6TaUzDZxdMLe8hQSYO4qecpWnhFNA0gIWw/4IrbuLl0f6rAWFVUjlDZn5cObf2SXhpYnjTwFtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898922; c=relaxed/simple;
	bh=jX/jt9tF9cP+nrbXGYDSNRM45Zuv9G5vVgpD/Tw4ZU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NrcVVGH/UUVw8G4yUtw9i+8OIFGaqpoznBUzo7bT0CpGQVESuRFOZBRjsGIuRavWah0L7rHE0gkQO7rJU+8t1ykM9h1yZDUkCwNEloPAcmQOHrLR/udhNQT2b4zlZ9UPgUxQYBank+GJqID/KPvimfiLgiCY98szGG6ANxVblOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4QyMDzR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4QyMDzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728898921; x=1760434921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jX/jt9tF9cP+nrbXGYDSNRM45Zuv9G5vVgpD/Tw4ZU8=;
  b=Q4QyMDzRs6LFQPTOBRl5hy4YaWr4h+sqSAxaIHCUV/XA0XFfB73s5kaS
   jy+TLtU2fWnnYWGVMvrqiq8Z4w6j8MABJVDu2Vz5XTGoLZzpUSTMIEZvw
   FAO1JSstwbSJthhtWFFdC8Kt30he1XWxb2DimdkeeFh6I478JSCx6OZc8
   U+3p07oZE4W2VZuz5d/r93PPqy1y+oxIxqr1ecoI1+3BCvZQhZNl38Cru
   KGnZshXVSzW7lbEhaWgM+/sKj2eJ/bb2cbMiuX1SqlMq6VlXkEsj7SjKn
   tVkZ7yWuToOS3tszFSEjYm7Cjjx4a3Cok2UOYwhUikiK70GxwxwU0mZjo
   Q==;
X-CSE-ConnectionGUID: TiElo/acRzWcEVXPhKhXlg==
X-CSE-MsgGUID: Uy6CU1CRS0KBX2SYy9kQfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="32037051"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="32037051"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 02:42:01 -0700
X-CSE-ConnectionGUID: R9tH23zQTc6VS/O4jMjoTQ==
X-CSE-MsgGUID: pJydxvh4QTmwqPV67GfoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="81515762"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Oct 2024 02:41:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0HaN-000F99-0q;
	Mon, 14 Oct 2024 09:41:55 +0000
Date: Mon, 14 Oct 2024 17:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 18/98] versioncheck: ./net/toa/toa.h: 7
 linux/version.h not needed.
Message-ID: <202410141738.AK2aa43j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   413b1b249304f17f4514dd859a44e3959e5d7674
commit: 7384d821f268ce4c725e0f6649838794368ca071 [18/98] tkernel: net: add toa support
reproduce: (https://download.01.org/0day-ci/archive/20241014/202410141738.AK2aa43j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141738.AK2aa43j-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -Wformat-overflow -Wformat-truncation -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
>> ./net/toa/toa.h: 7 linux/version.h not needed.
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
