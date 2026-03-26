Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29A93A6F16
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 21:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560050; cv=none; b=N85IZ4mnj5hBpbz+/AdwIFivpGWqK/+/GNDRcilQ3PBRs5VrAqfmQFxS1NR9295Ra6Uy9N+w8VDHqAp34lKgZHbpOyhK7gAcHo0Sf2Xmm+eiCz3A9fs8cQ9h+v5Yf3lWnv4jWv8zYh9P2qlytWSgoraVjECbiyzRCmDQlnfp40Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560050; c=relaxed/simple;
	bh=mjCuuv9Kksy85YKazv3RiU0J/v+SrKrQ+9sLVQkyM34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ot6xdYR+Nyw6GprvLN5hFEdgcVUGVfQ5z3Fg+ziZNB2EojZtCW9i8XTk5LxXOYStSDZl6j14HR9+nAnvaCU93Drcsc9mNuAlop+a2dvOegBjvgVCcEppDeuuQHggNAcudiCim5AWlOdeZEBtsYacIL74eK3u7tqIDR+T9uakIrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0l9WfHQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0l9WfHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774560047; x=1806096047;
  h=date:from:to:cc:subject:message-id;
  bh=mjCuuv9Kksy85YKazv3RiU0J/v+SrKrQ+9sLVQkyM34=;
  b=G0l9WfHQRzcxlITybtBZiv4U4Pebh2rCkvt1gkFrCdyvHWX3TuyskqKi
   puQeDyDDfUir1NXg4sEcNCBLu2VthuOGZ9dg2QEHPouM7cKxreH5VKTTt
   wFphsUVwZmvEszBTpFx3+LTQrmNsmHWpwizirhAmzYDWoImmzc3PmQTs0
   21wPsACK0reyxsRUivzrmuOTmWksQZLTsH1k/pmGvd3M9UOxAf4MsqCbv
   wVlEpgVD7rqfWJoBniYXJF75wmXHewYzo1CJlyauMAT1vhBoFQvXNVqHQ
   RBTXpYpTk6+HjuhpIWvKNE+Ycm9KQSXY5bECfkKUfb3GYdrA2C07eU1ci
   w==;
X-CSE-ConnectionGUID: +p7yrGH/R1q0DcltmFeQ1A==
X-CSE-MsgGUID: Jd4AAV7RQHqTMB6324aO/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75831414"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75831414"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 14:20:46 -0700
X-CSE-ConnectionGUID: xhP9+XHfSjqfK/CeZiw4VQ==
X-CSE-MsgGUID: +8lRN20QTxO8f79/2BF+Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="226757070"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2026 14:20:44 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5s8A-000000007Kr-2Bj6;
	Thu, 26 Mar 2026 21:20:42 +0000
Date: Thu, 26 Mar 2026 22:20:19 +0100
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Subject: [jack-fs:for_next 1/3] Warning: fs/mpage.c:661 function
 parameter 'write_folio' not described in '__mpage_writepages'
Message-ID: <202603262236.229TdUjO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
head:   10b7ecccce237079075f95b5363e4195bc8effcf
commit: 90347d82e4d3fa1705e513f04066f7c9c2b34694 [1/3] mpage: Provide variant of mpage_writepages() with own optional folio handler
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260326/202603262236.229TdUjO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603262236.229TdUjO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603262236.229TdUjO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/mpage.c:661 function parameter 'write_folio' not described in '__mpage_writepages'
>> Warning: fs/mpage.c:661 expecting prototype for mpage_writepages(). Prototype was for __mpage_writepages() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
