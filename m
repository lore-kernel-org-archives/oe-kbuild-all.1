Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF9512E1DE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713280322; cv=none; b=tuB833cL8sullJ8hS2GEOzB/xL9RhzbpnuyPB/3LAr7CDmockgnHXIgExWTNfDz9ZQPUne21uGI71X7shWXMrjuppTPdHp2/Q1zAbbPsNrdMUGFk5U3iHoL0yEXhyL6ztAuh0TJFAZ3V7JhXydfFIoF+peALq02AdH1XFuHISSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713280322; c=relaxed/simple;
	bh=yKDgETD6LKl+rrE/QSFoodpaJj4hAtsGP9ZhrCwKm/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eiiK/03VfKxPZ57SfSv02vvTB/oX7V6WOJtiQNn6orFwBDqYSh9plSuBVPm9Y4Wu45quQvyyGM5jbm7BG2/N0WPAnWt1YycWtOSdMZfN0873GGd4aaWqV7SMYrPLIs8qIfw2pFcpR2IRZuDgFnDODDZiEeRCwXDQ9V6c0fRIyaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GI2QIPXe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GI2QIPXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713280321; x=1744816321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yKDgETD6LKl+rrE/QSFoodpaJj4hAtsGP9ZhrCwKm/Q=;
  b=GI2QIPXe7Bkof4Iw22Mv4ZKXqfjEESgxxkErhxv8ogdRd3VkzxVbKXS9
   AX5rF3mGZBJ16KOfLVk7bhzwFckdy8yH6H6vM5w+c3muBcPH1qKAMLcPX
   7oISzo3nmPSPb0aO/8nKoMqZXYw382mIwESukOwhjb0k7weGsN2eeCoeR
   3QI5NTALVarQuwOtirPMjwz3I4OomC/eszKA/ex0c1SOQxxaY95fqH8VT
   NyhtaGQKl8JKBT8Jkr1+OuwVjbqfTFaJxP+lzGQXIzUb8wdBjAHQENF8Z
   HLLQ7wc70+ZDnWnHutcnfm7TmDeE0fPCHh3jEMsWf2buy8z5R5l3G3G+Q
   A==;
X-CSE-ConnectionGUID: +qxHeO3xR7awk36nAnBCyg==
X-CSE-MsgGUID: y8V4IGORTVeamH54JWvNQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8891215"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8891215"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 08:11:46 -0700
X-CSE-ConnectionGUID: RiKlyoYBQdeVMbgBrgzKHA==
X-CSE-MsgGUID: O5OUyzopTGuJ7U0A8sfrWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="26711237"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Apr 2024 08:11:45 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwkTF-0005OO-11;
	Tue, 16 Apr 2024 15:11:42 +0000
Date: Tue, 16 Apr 2024 23:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 456/460] ld.lld: error: duplicate
 symbol: __pfx_eytzinger0_sort_r
Message-ID: <202404162330.0bjsLrNS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   7c3356f2aba32597d2b4927b2e237bc980fe3a07
commit: 453a5a8eb61754fa8704bdf75d87c6c852df474c [456/460] eytzinger: Promote to include/linux/
config: x86_64-randconfig-004-20240416 (https://download.01.org/0day-ci/archive/20240416/202404162330.0bjsLrNS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404162330.0bjsLrNS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404162330.0bjsLrNS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __pfx_eytzinger0_sort_r
   >>> defined at eytzinger.c
   >>>            fs/bcachefs/eytzinger.o:(__pfx_eytzinger0_sort_r) in archive vmlinux.a
   >>> defined at sort.c:0 (lib/sort.c:0)
   >>>            lib/sort.o:(.text+0x21A0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __pfx_eytzinger0_sort
   >>> defined at log2.h:0 (include/linux/log2.h:0)
   >>>            fs/bcachefs/eytzinger.o:(__pfx_eytzinger0_sort) in archive vmlinux.a
   >>> defined at log2.h:0 (include/linux/log2.h:0)
   >>>            lib/sort.o:(.text+0x3080) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
