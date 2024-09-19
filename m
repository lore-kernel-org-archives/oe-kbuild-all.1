Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894F917C8B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 06:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726726709; cv=none; b=dSuzvgIZAA+A3RPSUCdfUSIl6sudcHkxq/e4Egsy4v5npMoto2E7l7A7RXRNHD0yMLfXi1qzSGbePLiNN4PdnL//hNwzxjJMaYKJiszTvmfKWqifstTdj4QbFbZf1AYGqLLwjlaDrhrVS+0qReH/eRMehqwMYhpLxpLoOaXHOCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726726709; c=relaxed/simple;
	bh=1lrDfl4YrRnYJolGK18YagHpkzksvU8kcDi7KXK0gto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bcge2C8IWamUL/VgW3/i0j9Ba0P56B/9TSEpSUiV3tO1mbamjSgPOvDFy115KpeVpU65Z9sntq6ONUnB7BPU1tiYLGm+27fxrmkNJdpSKMXfD6AGjixKn/ePpjh2sYx7Hp33zBpp9lP7j/KgHgD/D7/mM+1zPhVyaqKxGKao5SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdGjWRBn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdGjWRBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726726707; x=1758262707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1lrDfl4YrRnYJolGK18YagHpkzksvU8kcDi7KXK0gto=;
  b=gdGjWRBnYPviPRwMBfNyvXD0uWTJvMAYXKNuwMgY+fliSzMyqF80ff64
   tzYtLDGMVQFRTNONrxsgMVm2xWLsqIHfVic2hjFUMB6SixXHo4HsAt3Nf
   GoVp8gtXsV4E/5SVAR593+1qlo90AdIFZ3YfmlKg5Ij+mwJwzgoVnhDCc
   St2Uk1NHraSquxcxbAJLRPZNL78QuOQly83GLfNVgGsHIjNn/hU0wDAUy
   ntk+3WFevyJJTpvgTac6cy7G+ZFspJuZIeImdJqxoOXlGdKViWWW74wvD
   C/85dgU3TfOjNPwWO9eDKfepvHYtpfmwsat0fgm7sIMG80MILmhLF0lVH
   w==;
X-CSE-ConnectionGUID: 6ZO3+so4RMulzfF2vcNVyw==
X-CSE-MsgGUID: CPIFkxbhQcidQfhj92tpMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29457916"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="29457916"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 23:18:26 -0700
X-CSE-ConnectionGUID: m1qKH+8QR7umR6XL4OeNzw==
X-CSE-MsgGUID: DvdmLe/fSwaC9I2Sw6nbyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="69835786"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Sep 2024 23:18:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srAUh-000CzK-1K;
	Thu, 19 Sep 2024 06:18:23 +0000
Date: Thu, 19 Sep 2024 14:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3143/16779] versioncheck:
 ./drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: 41 linux/version.h not needed.
Message-ID: <202409191430.zB7Az3j9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   60c5d539014532e8a81ac01467dc47b2c67b77c7
commit: f1fcb1c8a2f7ad2ec43d55871b3771768884c5d3 [3143/16779] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
reproduce: (https://download.01.org/0day-ci/archive/20240919/202409191430.zB7Az3j9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409191430.zB7Az3j9-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/mxc/hantro/hantrodec.c: 41 linux/version.h not needed.
   ./drivers/mxc/hantro_845/hantrodec_845s.c: 40 linux/version.h not needed.
>> ./drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: 41 linux/version.h not needed.
>> ./drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c: 41 linux/version.h not needed.
>> ./drivers/mxc/hantro_v4l2/vsi-v4l2.c: 41 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
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
