Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D654683
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 21:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728940086; cv=none; b=qZXIypxGiAXQ/Z7qD9XXGD354AK1VD/dJuvJNPpyiF94+p528idh0BMKkSn9kTsTlT4LsSn25yVO4YrHHfX36ggV2k1D4LZl2NXJ84YjLDoDqIx3iadrPTwvV5wSuRaKjQzymQTvgOGdrfABITxDwHfpIwWfirczmR19UYpO2Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728940086; c=relaxed/simple;
	bh=GR4ftzykAoLBDWBKFlohuk0SZ/AJVix13DytP25lUnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F1U6GgfQQOZ4Kuo7ZWbz8KBbDuUNIoDH1xTfBb/zjxJBNLB/6a/7VjvZ2mta5oSaw6iVvTW0QxeU0is94kYa7kw1UxbU6gP7eQ/FQNizlx0993B2QQQe7aRb2ldwDvgEoV+Mptb5T7jhHAo72JiDcGvnE/bxe/b07N+E1B/sOyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHfEhhd3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHfEhhd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728940084; x=1760476084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GR4ftzykAoLBDWBKFlohuk0SZ/AJVix13DytP25lUnc=;
  b=JHfEhhd3A8hzvzTPHXwxmSKxCMap1K8xn6VZefNxSXSE1HjKYciQL9hR
   J8wYe2vpzPNkn5WPko29eoSm7rCRrbXc4lus/THNQgG7JAoBu+VV2l3E4
   Qox/NpYdyK0oLPCQVRDN3A7mgEFCeRx9JwKJBoE08gbCtlULweKIVGor6
   5lV17vUmYCblWZQ3pC8JSE7hPAUEvRRvkudh9UH+W0DEswHz4pd5X2yuD
   2h8nF7HgLbUQNqq6STsje6TmOZzEPvnXPJuBVQ1BCql8IjyzdaGOpJJ6h
   V4Eg5J88EgstzwOKT85W3XD/9v0b26VlZYL5jcJcw8DCEVb6CyPi648zf
   g==;
X-CSE-ConnectionGUID: 6/ks3qrRTS+EU6nhQvEDKw==
X-CSE-MsgGUID: YFP6XpjMTfK/c1F8DcvN0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39687010"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="39687010"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 14:08:03 -0700
X-CSE-ConnectionGUID: PZexIuDrSqOQ3RxFG6aJ+w==
X-CSE-MsgGUID: yXHVw19SRaa3PCK52VfawA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="78032201"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Oct 2024 14:08:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0SIK-000H71-2z;
	Mon, 14 Oct 2024 21:08:00 +0000
Date: Tue, 15 Oct 2024 05:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rebase 1008/1105] drivers/gpu/drm/drm_plane.o:
 warning: objtool: __drm_universal_plane_init()+0x91d: unreachable
 instruction
Message-ID: <202410150729.kDiWzbiH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rebase
head:   3cdd0cc9c0e53917e2c4e56b1e7256ae8923845e
commit: 260dda7ea67e77608153a73aa5133e18306419c0 [1008/1105] drm/plane: add drmm_universal_plane_alloc()
config: x86_64-buildonly-randconfig-002-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150729.kDiWzbiH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150729.kDiWzbiH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150729.kDiWzbiH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_plane.o: warning: objtool: __drm_universal_plane_init()+0x91d: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
