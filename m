Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F7D2D6619
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 20:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755894438; cv=none; b=SuZXpVtEgDn5KGHXoOnHAOdD72xaTpRiYqY8Ser2stRbjZLcc3UFeCHdK9GFwHo6GAD+7TAHaekMhXAGW89POyYJIKnvycl1+gqSwVcyicr9sm3DcnADPB5Vv5v0rIS/9F8hdrdRt/LaDpI8wGauYrLyJcKz+MOLrB+GdhT+A+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755894438; c=relaxed/simple;
	bh=nYa9N61PxVp1a4UpPEbnBraecFymTEA4OBT6k68ydR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UdVRQCP57SzjjYsKdescACg9TyEpLCAFNfsR/bBDP/X1SPJjzcwzsK6wK1IrMyfNOAwqRFnU32zQhOmKSb9L9wtmRFWx7vJFA5Zfu3ssY7G7NoiQ8Wq57eKqugv5cXXR93T+k+4AwSNyDJOXjMJDsEVL08dm8j9OmTRpvK9YIkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuzwPs0h; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuzwPs0h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755894435; x=1787430435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nYa9N61PxVp1a4UpPEbnBraecFymTEA4OBT6k68ydR4=;
  b=OuzwPs0hCzxochg7ff8H12IHv5XXGthIJCz/evwZ/eH4g2SFmlvokPeO
   2jLl24hVIyQfBPQ0gG0mU5x4HB+VGKnmfJH3hda+NbxudJkV0ltmVNw4D
   4HqSSftkYoqfVs2w6Bm3EmlSleOOzX+JlM9+GGtJu2FON+q1YV36NU+HV
   7Sjuj9cPAKYfFZquCnditI3Xuufy+gLQixF45oiFQ3tjOkWZ2vm6oby46
   fk1MbENkA9hnN2ST4YCbo6ZMk2EBDOC5ykMd+xfK4jUK9p6lq/p46iIHt
   /HHOQilojtYwoFIPEgCB503SitDwQoa/oVaeCUbyZzx5wionr6e0wRyLL
   w==;
X-CSE-ConnectionGUID: i9DSjsDTRGiMNMoq6ZTwhA==
X-CSE-MsgGUID: Vfu6E2hxQJmwTQ99yyKBaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="83619670"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="83619670"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 13:27:14 -0700
X-CSE-ConnectionGUID: 8yXa65BORMKceXcxja9UWQ==
X-CSE-MsgGUID: XCM13whRRMeGqJfUiy6HIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174102000"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Aug 2025 13:27:13 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upYLu-000Lnj-1k;
	Fri, 22 Aug 2025 20:27:10 +0000
Date: Sat, 23 Aug 2025 04:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dongsheng Yang <dongsheng.yang@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Mikulas Patocka <mpatocka@redhat.com>
Subject: [linux-next:master 2953/4234] ERROR: modpost: "__umoddi3"
 [drivers/md/dm-pcache/dm-pcache.ko] undefined!
Message-ID: <202508230454.YtdClMr0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f4c93f7eb861acab537dbe94441817a270537bf
commit: fd5cc4922bef4b3c3cd0452f38dcfd066322e9a9 [2953/4234] dm-pcache: add persistent cache target in device-mapper
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250823/202508230454.YtdClMr0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230454.YtdClMr0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230454.YtdClMr0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [drivers/md/dm-pcache/dm-pcache.ko] undefined!
>> ERROR: modpost: "__moddi3" [drivers/md/dm-pcache/dm-pcache.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
