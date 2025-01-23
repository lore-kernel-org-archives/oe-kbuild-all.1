Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC8012FB1B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 20:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664516; cv=none; b=qbyO4RHb7mepcc5GaUviAS+C/bIMFTteKakm4JdJM/pcyvW09YsYai34zNGs2PWawk4HWK7b4ETUpVPRuzf0uK5ZYsCh6GmGljo/Z6A/WlYJHLwfssycD+cFpnmSFNJPT48nZgn5HrjM/fG0y8ewU4dEKl80eo8Q4tz9u9/XU28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664516; c=relaxed/simple;
	bh=xxuovqnQN55OkhCJKZYU80qP3oY34zT5VsRe/Mnn5dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+zzKHGonmvxC7GgLhvvlh1hRO6X9FRhV7kxSKDKlbDzfmlNBIiSaJ+opOXro1oaivVCo9D5lY/znHDlEbHAX9fOU6pmmh9Ql/QDPhVokaVxEHcknaGeJVbLKwC58M5FuvnHrgoHjt8RQKJH6VFcT1yTI8LRcdNcl+aT+sZ2iNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dNBOD5I5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNBOD5I5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737664515; x=1769200515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xxuovqnQN55OkhCJKZYU80qP3oY34zT5VsRe/Mnn5dc=;
  b=dNBOD5I56/NrObfW0GqXL4onbtuVK06UJF0eyBVASj6Nep8EXqGiDkfq
   fdEnmuG5+63QWJcRVbUoTCHix3dIZTYet1hfszwcJi3XUr2zSJpNRYsy1
   E1vg5EieAG5HteJ506wzIMAqeNS4PlbZC4h5+/wwzQ/Xqk+wwRguj87T5
   lfVUHJEgeGtn4MkhXzQcPL/bXoouW3F4PEhMoKTyqh1SEkcRSOblHVSJ9
   As1sMwzOp5cd0Kq33UGMYVZa8tt00G/O4kugPO+R++pH8lO7TNwBSAnzp
   bzzlcxuoqHv4kIU01CKCRWNuKJC1HtRhcKR5D0jIPAibss6Zth5h2QHv+
   Q==;
X-CSE-ConnectionGUID: IBBheJ2oTXCRF8nlaUeX0w==
X-CSE-MsgGUID: cMnxp3xBT7mznwCJzr0KKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38290451"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38290451"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 12:35:14 -0800
X-CSE-ConnectionGUID: s5m/TWqnQf64b5+bi7gBAg==
X-CSE-MsgGUID: PkNqPuF+TleEKNVH53rRcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="108116318"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2025 12:35:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb3ux-000bej-1D;
	Thu, 23 Jan 2025 20:35:11 +0000
Date: Fri, 24 Jan 2025 04:34:14 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/bbr3 1/1] ERROR: modpost: "__divdi3" [net/ipv4/tcp_bbr.ko]
 undefined!
Message-ID: <202501240438.Igr5BuQa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/bbr3
head:   aa2658ab3fba8f0f16c6d9c838776502980974ed
commit: aa2658ab3fba8f0f16c6d9c838776502980974ed [1/1] tcp/bbr3: initial import
config: arc-randconfig-002-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240438.Igr5BuQa-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240438.Igr5BuQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240438.Igr5BuQa-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "__divdi3" [net/ipv4/tcp_bbr.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
