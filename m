Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BE33803D1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936366; cv=none; b=r4kbgB5i0bgSQJ7D+9jqqWyeIlgtDFjw9sQ0m6cDZTdPw1iKiwGgREExvKgSDM6d9TtL2tEsp3F6m/R+QVSwLltH0zHAzIBCEmzC68hfbg8kRAvhn9nNaR8Cggu6V23n1JkexPCWIOIL4r7WI7uNY5xUsld8JIBbDLVMSCunYjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936366; c=relaxed/simple;
	bh=rX2HtGxlLMbbddQm/hghS6l99iLwtyKOhOWYRkT7wyk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ot96ggBiaQ1wv2bSkESJCT3lh0tSd92ADNxqymnYENS61WMZlEtlPwF584gmtkkm3XbANjJpH5BCc98eXM4aXwg4UyZVn7VsVE35OMvCyZotd1vqFkazNXnObIzfL7f1zjqGEkpkHVXOSK5k+dbGALyfteua1C6Zma9zJFhGEBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARsFXEib; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARsFXEib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771936366; x=1803472366;
  h=date:from:to:cc:subject:message-id;
  bh=rX2HtGxlLMbbddQm/hghS6l99iLwtyKOhOWYRkT7wyk=;
  b=ARsFXEibeUzGujPBG6nj0PU/aZziW5Nr05L7hjCRpawh3bRwtN13axmF
   RN3gjl9dhdd1qFCbRBawjDE9N9E1zLsIPK8WoN6Xtu6qb2NtUYcZLy+iO
   prG5QXbbaldeV8lXlHhsD+MwZ+ozaFtflIgjS/YiJn4zw8s+k8o3FNCvu
   HNd6Zqy/kAw+ry3Lh8OQ4ZDwdERJ9Yz2njey4Ffob4ghBFwwfcIUTDchN
   aEXXf24XUym2okrY3C/s4GWYDZgqgcKQR4/YReA3P7sPFQ9Ph6H8uhvky
   Nro8pjkADv3+DgkL3CCYxLj1WUabNEtwEzlTsGiSM74svsl40V7a8Mq3d
   Q==;
X-CSE-ConnectionGUID: QgRe1HTmRpiiuduBSw5DYw==
X-CSE-MsgGUID: DWKoVwM4RV6HmBp5nr20oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90529709"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="90529709"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:32:45 -0800
X-CSE-ConnectionGUID: ZippTyupReu9gQ97XOFyHQ==
X-CSE-MsgGUID: HtkoxouKQ9+eU+U9MHxboQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220476848"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2026 04:32:43 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuraj-000000005HZ-03Gu;
	Tue, 24 Feb 2026 12:32:41 +0000
Date: Tue, 24 Feb 2026 13:32:06 +0100
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [arnd-playground:randconfig-7.1-next 31/733] htmldocs:
 Documentation/arch/ia64/index.rst: WARNING: document isn't included in any
 toctree [toc.not_included]
Message-ID: <202602241336.XHZQth3a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: 8f115a8869712a4d22aa5218e1765f659af5fb63 [31/733] Revert "arch: Remove Itanium (IA-64) architecture"
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241336.XHZQth3a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241336.XHZQth3a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:166: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:189: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/arch/ia64/index.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
