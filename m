Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AB3EC4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 05:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730698125; cv=none; b=f+mVYXAkEPVn4D299vtuS3Jws0cugaJ9Kfht72Opk2+irplKL5gv9M8KtSmzoZf93QstjR/wAXN/z442mxuROj3/iGJK43NMca/rxHX5W8m1by69b1FykRkpecWqp4UQDN9Bg9LjtCwQhkvtGUJWpQBB+j5es3rdMHDYtKNXdfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730698125; c=relaxed/simple;
	bh=MqQI0A8NybK7ybHEeh1f8JrlqjBshD6D5Yu0FVTSYXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CHfzs4CiyVSeQGd/F8OlzLTl0RQH8YmKzN1j/ABKa7rj8xJjyDbsKbSqyAWg8Ib8LOTi/iGMT6u422ny0P4LvY/dudm7/3ClZwIaZz8SeOpGn3la/Xt0nWfBx08ZRLQgj+4OjLLTOHjVwKWAnhhb2NPRSgHSZi8v6Pcr3rOmW/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gxy63vMS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gxy63vMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730698124; x=1762234124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MqQI0A8NybK7ybHEeh1f8JrlqjBshD6D5Yu0FVTSYXQ=;
  b=Gxy63vMSgrwZQBVgT0PdgmVGE/gjgM8mV3dGjxv32CNwMnqA1l2K6Q2Q
   Avi9dEjPwXIdMfJSSehEIpIWEOgLDFKIFHlyhErw+i9Ft4aEJTzo6ERw6
   VCm+kU/uqvn6+aWdqPG4v9EhBtetDwaoa9jkdvT977elGwujqTcntAaB2
   aQHrmJTdXaDOkdYeWWAdS7fDMwdF+YKN6n9NZsJRcqwJ2NNt2/KjjtTcR
   6xxWgL27Q0Emohie6qd9nqwVhRejTFQP9N1x25E1fW8UO45exL9/a6ZKg
   DRMXj3Zbx0hb1bq2eWsJmNnnFE1MzoOCAWIzgs7Fmk/Dc2xOpVtckhVL+
   w==;
X-CSE-ConnectionGUID: W5NfmzWQSKOjnK4pKMdQ0A==
X-CSE-MsgGUID: iXvuQ3DtRYS6h6xzrUHTnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41482610"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41482610"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 21:28:44 -0800
X-CSE-ConnectionGUID: K/1u9rfMQI+Dy0lmmEnScg==
X-CSE-MsgGUID: jH6MwXB7R0+yqN3Ses9hlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83070497"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Nov 2024 21:28:42 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7pdo-000kUT-07;
	Mon, 04 Nov 2024 05:28:40 +0000
Date: Mon, 4 Nov 2024 13:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 2527/8858] panel-samsung-s6e3ha8.c:(.text+0x800):
 relocation truncated to fit: R_NIOS2_CALL26 against
 `drm_dsc_pps_payload_pack'
Message-ID: <202411041348.XOZVtRjs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c88416ba074a8913cf6d61b789dd834bbca6681c
commit: 779679d3c1640d8f45c75b1e15831180ab2712e2 [2527/8858] drm/panel: Add support for S6E3HA8 panel driver
config: nios2-randconfig-001-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041348.XOZVtRjs-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041348.XOZVtRjs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041348.XOZVtRjs-lkp@intel.com/

Note: the linux-next/master HEAD c88416ba074a8913cf6d61b789dd834bbca6681c builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/gpu/drm/panel/panel-samsung-s6e3ha8.o: in function `s6e3ha8_amb577px01_wqhd_prepare':
   panel-samsung-s6e3ha8.c:(.text+0x800): undefined reference to `drm_dsc_pps_payload_pack'
>> panel-samsung-s6e3ha8.c:(.text+0x800): relocation truncated to fit: R_NIOS2_CALL26 against `drm_dsc_pps_payload_pack'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
