Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD55230D0A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381579; cv=none; b=SxqjOt13epWBEfnYP6HGqtloG5c3LJAP01tpwrjir6w7R3WGsJUfcXiVONI/Xbc3a2XGOMJFsWAjKbxyLgGld41PMgv4DQZfrJ7Abwc4CT1R3aLs8OCOuyrlbQel/NVZ1Wp3gPwLc9xIOyDD8kRY7OFEwcV9/nOFAZfM/HuVqbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381579; c=relaxed/simple;
	bh=aALivmULKY/0F50jzds/54vXSvJSe8Y/0bvCYn6qcms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ChxzcBIbbDapMojrdwJTP7uaMcPF+ufxId2KKKB2iAyj/ZAOY2Hs/TOlaj+KEzWtgQ+RT/QXKhxZU8g+cp9TKWSU6jHASErU+W7xGBWxg/L3F72CwkLxn5e0vpI3s3iPefeR2BPDbzWiMIAeUZ6v/TChYslpyFC1MQArVtKOuCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5tAWisg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5tAWisg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751381577; x=1782917577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aALivmULKY/0F50jzds/54vXSvJSe8Y/0bvCYn6qcms=;
  b=O5tAWisg94velwsCWlWbOX6k6JstJ1PXOSYMrCmPBGrm7YGIemy13+Rb
   c+NOMxYw28790bvNpy6Zo47auM/2XdhummhvzPPlPL6LS2m3ge31p+ARQ
   t+B1NMUy6OLaGhKROmXniB3iUeCWGKwb0VipJlQ4I6u9DQk7HX1QfK0o5
   NO8BeYZbwtk32Xbf2th8J1Q3WAt5qhtsPkv89I3yIePPJa2t65ISjQuu1
   FHHwkazUYu5jVJvVtfKSLczrsjtfEfEYUaWLddJObpAReK2wQq3wFHt9u
   1gq0yhcYTX6ZA6BaABsgZdopyc5fvZMNRWcfeesOlzRECc0/mWWE5akuq
   A==;
X-CSE-ConnectionGUID: ul0i2IdxQzSj5LkuYTriWA==
X-CSE-MsgGUID: Gx/swF55RcmbemVhUYbAgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71212579"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="71212579"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 07:52:56 -0700
X-CSE-ConnectionGUID: Uy97tLetTOmNE2Q/Ky3pYg==
X-CSE-MsgGUID: 8tZ61hHeSRmT1Y9CHHTtqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="154103367"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Jul 2025 07:52:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWcLt-000aJy-2o;
	Tue, 01 Jul 2025 14:52:53 +0000
Date: Tue, 1 Jul 2025 22:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 62/96] super.c:undefined reference to `utf8_load'
Message-ID: <202507012256.sKpOt5Lr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e0c4e73d890742c42336fcac08a3a2541832c7ed
commit: e4d5b96272266d46c64205669dfcb03315d1859a [62/96] bcachefs: More errcode conversions
config: x86_64-buildonly-randconfig-001-20250701 (https://download.01.org/0day-ci/archive/20250701/202507012256.sKpOt5Lr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507012256.sKpOt5Lr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507012256.sKpOt5Lr-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `bch2_fs_alloc':
>> super.c:(.text+0xd51aed): undefined reference to `utf8_load'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
