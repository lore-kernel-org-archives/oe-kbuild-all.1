Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5E831619C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784364139; cv=none; b=d1X/7MaipwOoFW+juV+vyQkhhj41idjp6xQV8nCR2wIONQKuuLKv4kDBlwIdm/vazy6svBpz6G2RJTeYPCsHQHlVhXJUcHDqk0X9xH6x6p+LIfO2BwnNxcuB9bs2k3WS0rNWH2vC+cgvr2M0ope78M9bh4nZ9FKZtCLXL9fPjqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784364139; c=relaxed/simple;
	bh=c//YNgFoihPMzU/kpTugttPUvNMuVe1yqUpJAS7gW7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JTeTUBqFYQuAx+H6FiPW0hKfH+U9LhurF5HV2Rxcsv+8SIoBynehzIE4RsYcN7fvvAuwKquGwdF0hya/m5R3ZaekHm4MVSH7i2oDQT2H3DEnXviXs8+vX21lUSbW9zcbDSsgHUxGoeFGbJlsueOkQA4+arThfo69LGwD4HDgWaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MB/zxzSO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MB/zxzSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784364138; x=1815900138;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=c//YNgFoihPMzU/kpTugttPUvNMuVe1yqUpJAS7gW7A=;
  b=MB/zxzSONFF7D+AFdpSnJs2VnhKWk1VfCL0bPJ7PCs86IANzCU/s3cRT
   gRQRXXTICVdpqiWeUj/+5TMxi0mPB4gpX8dxMayAxMcWzWlyjQV0K2xq6
   hj0mPKOkWf9vYbKGTcX4Z0Jq/bO2UBdReCThsvoay99SWJFFkWOGPn0RC
   +vtXd6IrfOiBlKhFt4eNpC15oJKWpziJzqu+FQJxp1wYAZJLNdtiFDNaQ
   3muNCm3uNdgMIuV9aF/521DM94w+3GlLxQnS+C6la7ZY/+4rzeL/zxcrV
   DTb/sJLetKL3qJc8Cc/PYEP0toKgEUKxGYODAKHFGfSeA8L1ekr29B+j1
   A==;
X-CSE-ConnectionGUID: 74L9GnuRT7+TGws8ob9M+g==
X-CSE-MsgGUID: rs2cutiKQR2XBJ2214VeyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85047269"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85047269"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 01:42:18 -0700
X-CSE-ConnectionGUID: N+dEAGSjTSC6Uqlc8mrSxg==
X-CSE-MsgGUID: 2uUR5SUXQBelnKCVN7LKdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="295177555"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2026 01:42:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl0cX-00000000TbN-1YPN;
	Sat, 18 Jul 2026 08:42:07 +0000
Date: Sat, 18 Jul 2026 16:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Ma=C3=ADra?= Canal" <mcanal@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [linux-next:master 267/7584] Warning:
 drivers/gpu/drm/v3d/v3d_submit.c:85 function parameter 'submit' not described
 in 'v3d_lookup_bos'
Message-ID: <202607181640.bUHG2rbh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ma=C3=ADra,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
commit: f59d986943afbb97443cf91f45b1dc2c6fb6bebc [267/7584] drm/v3d: Conver=
t submit helpers to operate on struct v3d_submit
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/2026071=
8/202607181640.bUHG2rbh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260718/202607181640.bUHG2rbh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181640.bUHG2rbh-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/v3d/v3d_submit.c:85 function parameter 'submit'=
 not described in 'v3d_lookup_bos'
>> Warning: drivers/gpu/drm/v3d/v3d_submit.c:85 function parameter 'submit'=
 not described in 'v3d_lookup_bos'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
