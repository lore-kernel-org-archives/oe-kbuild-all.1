Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDEE29E0E5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754505603; cv=none; b=Cuzftgi6pBtQoeS4EWkseehUSebw35K3BjKIXgSo9T4+6xg9YcknRtjravp3R3jnwWeOseOuk00frH8Bvi8yyYP3EekSHGv1pi94G96zOjuJZj62+3FfpeQtZYk8bYtB4brpK9dztZy3vDjCw0F+EpCSm9e+OI7kmEIUDLnHebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754505603; c=relaxed/simple;
	bh=R4Bw2sOIiv9mwwCQ7u+0ursRXTYngeUIMxOrzo2z3vE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XHCaCdxSKsZw2jJZfA+Jv3j0zVpfkg0opfti7oKEzhpKe+IHhrVB7FF/qlqPS1ANZoxozmUh0IJhP4yxCqvlteLz0Mv7TpDcrVDcQsUW1p8ForEhA1qqYE7xZ0VZltIaktXJZK2ZyUMw4rYleI2XaUz5/XlMuWTEydpBBamPFIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yy9Qvv71; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yy9Qvv71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754505601; x=1786041601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R4Bw2sOIiv9mwwCQ7u+0ursRXTYngeUIMxOrzo2z3vE=;
  b=Yy9Qvv71UkdxjQX8WfooELElWAiZHWYWp/RVTCC40kTO9joQqybWREcg
   dIMQ3siIt1x4wibYULsfbpNGA0xw2bGYnlS419b8Of2NL5+zAbWvOPkDS
   OX44/fhdE3IR6IjacBGfGTmuD4S31XSDl5vDTPIH3UtT/Bw8ijKHMjcg9
   XozahLaLBIUUO2In9p+z3C2ajH2mnBBfWJh4vuK9CdxXhmbemAuSbmmit
   RWEZO+0v9KWzR0zn3HsHwasJS39wTAsDRKTjgis4FxBHZ1zYMkRkakx9L
   2hGs3ld8nikKeKGIpqdY5Dgc6i4DOHA6FYCqdOQt+ljw3KqHth7OghRRY
   A==;
X-CSE-ConnectionGUID: kKubTllARnqi1BVCh+twvA==
X-CSE-MsgGUID: 04nA7LV8Tg+gDtwRV355tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68209411"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="68209411"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 11:40:01 -0700
X-CSE-ConnectionGUID: Hh3SdlgFTUe/SV+ABUK53A==
X-CSE-MsgGUID: OzPh/8SCQYmdwF3/ZefIvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164504425"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 06 Aug 2025 11:40:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujj3G-0001zI-1u;
	Wed, 06 Aug 2025 18:39:52 +0000
Date: Thu, 7 Aug 2025 02:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 27/27] kismet: WARNING: unmet direct
 dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
Message-ID: <202508070207.mOQgZzhu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5dd25749822c856693ee6e155552c8004f41779a
commit: 09f6a7bcc18d8ef3f558da6a12d1345cdbcc507b [27/27] anolis: Add mediated ccp driver support for hygon crypto technology.
config: x86_64-kismet-CONFIG_VFIO_MDEV-CONFIG_CRYPTO_DEV_HCT-0-0 (https://download.01.org/0day-ci/archive/20250807/202508070207.mOQgZzhu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508070207.mOQgZzhu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070207.mOQgZzhu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
   WARNING: unmet direct dependencies detected for VFIO_MDEV
     Depends on [n]: VFIO [=n]
     Selected by [y]:
     - CRYPTO_DEV_HCT [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
