Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC9931F983
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 05:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995440; cv=none; b=aRsES+NJ21EPihX1nQt7FS9l1j/M1AlGVV9WyNrwdxZv1O5IlmWbVNx0ZggodsgN7KzBD5nAtyYEI5O0ttQ48VPtWbsMlaYcwvKFhNfmJbNibLdxta5EP/FfmNkijobuTFU/gt7Aj5Z/VAiAOrjb2oHLlNfKjrWxUaC2SB8GK0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995440; c=relaxed/simple;
	bh=n4IM0Vy2zB8y8Y8820jGlZd1rY0M3jtt2gYJvJhD1HY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KyOwm1eS38/mXCtBNLk2PMGsh8HDWzpwoI59GS2VG80bp4oqE4AhHrui0Ltxw+n8Id27f2RuACoTBo2r/kntuEb+tpxsD+8ea3LQiqL09aBMVaIjOBoorruGyF5bAxMjjVG+sueQLiBoAG7E8bUhSaKoEtyJBebovGcUf70lOCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPB4iqKr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPB4iqKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785995438; x=1817531438;
  h=date:from:to:cc:subject:message-id;
  bh=n4IM0Vy2zB8y8Y8820jGlZd1rY0M3jtt2gYJvJhD1HY=;
  b=SPB4iqKrd+9HJtInZ1NTsPeTm376GGvoPcbCS6QqbPKKSkpEzok6EnXJ
   6rqUXEGORs/QV1Rt4+EhOKYlI20dsBfN+6VCjEvKjs75uP3Heww8RQRR4
   gXD+OJJmJM4LLbpIxgTxBGBJ+K1rZRClGLZmjIfIwmPr4liimshEi03Q0
   Se6/WHcUH3fnyIb3VV3mwEV6ZqdOSxVKIDtoO6WH30EhedH1+2DWFc1vP
   YbL1/yaCy2gNpmANBiLNxXbstsyfI4rWsvU6dTkqIau4fxaAMKBLEu/bN
   2D5NfX/1jCMKiVFKQFAHwu8Ta+YvGX+B+mAlQa85ttrRVRl+gTaKBaUQ5
   A==;
X-CSE-ConnectionGUID: vWM7y1TLQXOqe9O+d4f3WA==
X-CSE-MsgGUID: c1mLYvz3R3u9NvjcwcU1mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="96929865"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="96929865"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 22:50:38 -0700
X-CSE-ConnectionGUID: sexf8ZelQYGjhsU00NOUaA==
X-CSE-MsgGUID: q0W4AEDBTb6S1O7YHdmi4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="265490470"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 05 Aug 2026 22:50:36 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrqzx-000000004Z4-2u1m;
	Thu, 06 Aug 2026 05:50:33 +0000
Date: Thu, 06 Aug 2026 07:49:44 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 166/166] versioncheck:
 ./drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c: 428: need linux/version.h
Message-ID: <202608060747.g93BcFc9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5e37c0a68662ae56b301195cbb80b7e815107fb4
commit: 53fb773ccac7eaa530a03a18bcfffa9a8c88ce60 [166/166] anolis: driver: gpu: yhgch: update to version 3.7
reproduce: (https://download.01.org/0day-ci/archive/20260806/202608060747.g93BcFc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060747.g93BcFc9-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/ccp-mdev.c: 12 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/hct.c: 6 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/tdm-dev.h: 29 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
>> ./drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c: 428: need linux/version.h
   ./drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h: 6 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxe/base/compat/sxe_compat.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxe2/base/compat/sxe2_compat.h: 17 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxe2vf/base/compat/sxe2_compat.h: 17 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxevf/base/compat/sxe_compat.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-ethtool.c: 1114: need linux/version.h
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: 6256: need linux/version.h
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c: 2329: need linux/version.h
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-os.h: 27 linux/version.h not needed.
   ./drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h: 26 linux/version.h not needed.
   ./drivers/scsi/hisi_raid/hiraid_main.c: 9 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/linux/ps3_base.c: 11 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/linux/ps3_cli.c: 14 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/linux/ps3_driver_log.c: 3 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_device_manager.h: 9 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_device_manager_sas.h: 6 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_qos.c: 6 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_rb_tree.h: 7 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_sas_transport.h: 9 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c: 9 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 407: need linux/version.h
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
