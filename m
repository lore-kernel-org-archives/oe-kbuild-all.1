Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8138B645
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 02:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743561304; cv=none; b=GKaLb8BCboHrC2BZ1qoygAGn85eLCe6eQfAfhnB0r8s3mAEf+2ALe/49lNJZYGeJq0VbgY/SUMVD7/qFN5nh29yqNbcMdaotBfm97xaheSD+jW0PaONfV84RUvr1oYt/ndF9kdv8gWGMt4Yde+Nh3lg5vO9Zy0AzBQJ6l7NfqNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743561304; c=relaxed/simple;
	bh=wL4Qy0f0r/IR2irouvGoURVG2SiOJgkdta//sHOOP5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DzP8/czN3cBcaZDNFs0cmMsozeP5cPVeCPifgnDCE/tWl1hTozOh4FdKcZpJheJptbsmyrcgUlB9DKbj2+eeCyUun/nmBW2xMx4+px9IN5JTmK4RLTrDWtcKBN2CUakx1EG7yYRB8KONtCvPR8G1tuPHCRvQECOKTv9sWQQoxtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=id8dZN6L; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="id8dZN6L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743561303; x=1775097303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wL4Qy0f0r/IR2irouvGoURVG2SiOJgkdta//sHOOP5I=;
  b=id8dZN6LFqlabaFdiOqHLXYMoGRExaf1ohUjKROBD/7D2howkmnK6s8A
   pKWyKAiNJgewoERiP1Hc+vi8bOxVY8kWQqcqOxQTvWKlML5ZnkIxEsDMf
   n29+gTzQYgGcmlo7imvkjf0UiqeVh+SgXYnkQInwuERPOMGsfJ8/lRtnw
   tk5x7oJm8QuzLZO/G8uVE4Xn0oju7gl7R01YCixDngCnRfnXMAo9/JVv6
   w+0qjRI+kO7UdeiwPl1mWQNdZsWWP3yULod8t8S+AyZ9VmDXOr+hTIbHT
   mIiAOqCGM5a7asTWZDxQ9Z0s2csO7ilEvorYNyIcvKGyXJAV8p/ZfsP+K
   A==;
X-CSE-ConnectionGUID: XAwRrUHaQr6GRn+Q7YeUdw==
X-CSE-MsgGUID: J/XZ9LtbQe+P5Taqt4XNsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="56276749"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="56276749"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 19:35:02 -0700
X-CSE-ConnectionGUID: mHUKKjSASHGEZ4kYzKzoDw==
X-CSE-MsgGUID: TGHmPCUESoW7qv/wEYTCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="126448732"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Apr 2025 19:35:00 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tznwQ-000ALa-0k;
	Wed, 02 Apr 2025 02:34:58 +0000
Date: Wed, 2 Apr 2025 10:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1537/1537] fs/f2fs/gc.o: warning:
 objtool: f2fs_gc()+0x1f3f: unreachable instruction
Message-ID: <202504021020.oxRcBdkg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   54ad6c4559d2bcbb5d7a03050b2f417a326a1ce2
commit: 8b9ea9010139596e71aae4be5264c3dd901b13cb [1537/1537] pagecache: support percpu refcount to imporve performance
config: x86_64-buildonly-randconfig-004-20250331 (https://download.01.org/0day-ci/archive/20250402/202504021020.oxRcBdkg-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021020.oxRcBdkg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021020.oxRcBdkg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/gc.o: warning: objtool: f2fs_gc()+0x1f3f: unreachable instruction
--
>> fs/f2fs/file.o: warning: objtool: truncate_partial_data_page()+0x213: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
