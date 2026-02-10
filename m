Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469561FB1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 19:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770752061; cv=none; b=HZHnt8JTJxOoA8XvIl9GYsqp3SsKwZR4L/mq2XRAO+FEhNFogVOwMebJBfT44jalmaGy0Lu3ADtkFxxtZGXlEV+iqxveFYK4M6AF9H+lQ/As+KoePKjdx4t27UbBQPD9+TVjIDNssZqdww2/6k1CXn2KlWaTjIThZIit3lxJaVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770752061; c=relaxed/simple;
	bh=5fcQqey7m8yVqiFOQe6old6k1pP6aGvrfzBIm0Szj48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sGBGkv13uVY+p2cXAkv6Salx66klXs0MjQuvyW+lndRhjhVaz61Z1musrMEynAfpwacIYoZY5k5e+0o1KLzory9XGw0ILB7OLfHE3jcjPg3ioTr841mQgUV529CfAYc74muS2jZERjgYUcL7xbVwdRlJtmrruecXuSEIVsX7Lps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIzo0IOi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIzo0IOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770752059; x=1802288059;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5fcQqey7m8yVqiFOQe6old6k1pP6aGvrfzBIm0Szj48=;
  b=oIzo0IOiqXyZmGmmHuaFu8Yi2DWE0xiGLegRHPGZVhQwxgXAD2W1Dh/P
   9RfoyGnaFSgHWmjF5S8MxkN81NyZsf0Rudjm/8Gz+GO0sx4TAGS8cgofy
   d16V4KjhlAHaEdlNctGYVGzGuylcU3fS2edqtnuf6DqSPDCXBJC67D0h8
   ErGWr2eIlR3xEQD2ofkr1c6OevdmzFFClWyWSLW8c5T4G3uP58csNgVhH
   1cwSG1Nr33glak9zYl9lHafcv6UkXBtnXsg7+E9euvMZZrTiT8KXAGwlI
   uaKBguGJzXhcOFbhCbPRHN5cBfPcQpco3j5o/xPXxf8zRFSw+jK0P1U7x
   w==;
X-CSE-ConnectionGUID: 9noybeNHRuadohUveoF+aA==
X-CSE-MsgGUID: wgfElX4mTmO3M48RSOT4cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="70908089"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="70908089"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 11:34:18 -0800
X-CSE-ConnectionGUID: YjvvlcdlTKGi4pOk/L9Agg==
X-CSE-MsgGUID: khe7VdP8QyKkFrt3UbQl4g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Feb 2026 11:34:17 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vptV1-000000000t7-1anZ;
	Tue, 10 Feb 2026 19:34:15 +0000
Date: Tue, 10 Feb 2026 20:33:22 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 futex_numa_mpol.c:134:13: warning: 'test_futex_mpol' defined but not used
Message-ID: <202602102057.2d8Qrr0P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   a8372211b97c448ad991761f27c4930cf20fc426
commit: d35ca2f642726a2c8a85c5b864fd05f59f3965af [1/1] selftests/futex: Ref=
actor futex_numa_mpol with kselftest_harness.h
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
210/202602102057.2d8Qrr0P-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260210/202602102057.2d8Qrr0P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602102057.2d8Qrr0P-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> futex_numa_mpol.c:134:13: warning: 'test_futex_mpol' defined but not use=
d [-Wunused-function]
     134 | static void test_futex_mpol(void *futex_ptr, int err_value)
         |             ^~~~~~~~~~~~~~~

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
