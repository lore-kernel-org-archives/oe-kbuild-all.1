Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AFD3DA5B7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 22:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194248; cv=none; b=k9cxmzjUv12QhklFuqQm2zE5oCO5yWUkeOs33N64olYK1G2xoznuDNzFbb5UZRaXLDsjvyfA59qHcMEkMMuyzAmEbya90hkNUZz60vXRU+6vbbJxTFKwTJ48UwdXFdGllFZ9GATH1JQhpP0OuXlMjANkd42hMgg86E/SEhRrc04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194248; c=relaxed/simple;
	bh=7vK8gEsW0OemdKagQZxURht+YtE65Q1o+Z5R4br8/gg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aNvSLttqm9bY/2qFr2u0k86SJE3zXpTQjmvL+064JrS4hdO3/mcU9hDPyML1YxffLyr51yDKIUD1GsPr7BzgD0h/Sb/U1cbaeP3GHtWZXrIaDfRpSpUMvC/32yxvNz5QpQbRWIfGHuFrALxZjwMUqOVH4LQFsLlQSwN8bDCxtro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvCnGiij; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvCnGiij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778194246; x=1809730246;
  h=date:from:to:cc:subject:message-id;
  bh=7vK8gEsW0OemdKagQZxURht+YtE65Q1o+Z5R4br8/gg=;
  b=MvCnGiijlhjCIVRt1tEGbVtptiq8/A6YUhs82vg8IH4ChBWxSSjIWjJR
   ixyTc5aCwaSpHvRjJxU5HlQOwP6iNUt97NXvcP6iwF0vg45oKaSswRTvO
   X1o/qfv/8dFfKqlrrKDvGGE2yVqpC0gNxbc8nrOi4UDZhDW1zSfEUE31O
   5AVTymkqwUWuz/Z3c079PwNAfe/+P56witOss+1+bMrUaVBlydCDHD8kt
   GKz2bt4qwyyzgokTGkO9Jd2452rgJsKnmeUYrhgW07wE39rKzM+jiqBOm
   BD2CuTd8whS6cPczopb6jTJM2BR8s1pIinr+M1gHPibwge7kZyR4BCaN9
   A==;
X-CSE-ConnectionGUID: I1wfYtSiTvC/Aler9l05rw==
X-CSE-MsgGUID: 08GN9hwfQA+TQjijq/XSsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90620054"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="90620054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 15:50:45 -0700
X-CSE-ConnectionGUID: bjXDYvMKSxazMVYvcSU+Jg==
X-CSE-MsgGUID: cjhaNCd8SVqizInZ6TWilg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2026 15:50:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL7YH-000000006yj-2XXy;
	Thu, 07 May 2026 22:50:41 +0000
Date: Fri, 08 May 2026 00:50:27 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1/1] versioncheck:
 ./drivers/crypto/ccp/hygon/ccp-mdev.c: 12 linux/version.h not needed.
Message-ID: <202605080038.jFWAzTsF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   f0a12e26dc4310db527f5b389e8613759387748b
commit: 12a5b4fb5dc94317ff37f389fd2965cc7f7cafe4 [1/1] anolis: crypto: ccp: add ccp-mdev functionality to the ccp module.
reproduce: (https://download.01.org/0day-ci/archive/20260508/202605080038.jFWAzTsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080038.jFWAzTsF-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
>> ./drivers/crypto/ccp/hygon/ccp-mdev.c: 12 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/hct.c: 6 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/tdm-dev.h: 29 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
   ./drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h: 6 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxe/base/compat/sxe_compat.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxevf/base/compat/sxe_compat.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-ethtool.c: 1114: need linux/version.h
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: 6256: need linux/version.h
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c: 2329: need linux/version.h
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-os.h: 27 linux/version.h not needed.
   ./drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h: 26 linux/version.h not needed.
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
