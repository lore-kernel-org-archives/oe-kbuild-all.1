Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D164F1332A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024224; cv=none; b=Jxys9uCnmfVKrJ81M11x9PLt7lgarU/aJQRrPJUuxRyuWN6HOMgGq3Kts81iNocrEEC+dh0mIw3YROqsWNvG8JI7NN2RapqEUZ0nUm47aABFVMkMHttPSn5GnbSxyHnkUXpJpNftKgoZGDuBGrcVORBxcToBOv4Wjyu4VYwOScY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024224; c=relaxed/simple;
	bh=ThXu0rfT/Og4ap6K6bqf4mrxg1aKt8huVbLmc0hUdks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YPvxKUsp5ccwXZFsGh2qwvvHwgZZ3gG0eFSEICzQGCVQIsMy72uqvLpVo6p80HlTJMg5Stht0BVcM7MmleY/ZHgopMsn56sI3hQie71q4P86eaCu3ROlIy+jYx0FHGSvfAscODiy+MDbP5XO+Sm1rb5tN1WBdqMg/MLbY+Fjh0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXsoZ8CY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXsoZ8CY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709024222; x=1740560222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ThXu0rfT/Og4ap6K6bqf4mrxg1aKt8huVbLmc0hUdks=;
  b=DXsoZ8CYEtTnvugYFXmt5SsjeEQtWKGT0ZOfhWqe4yj3ZfXTnMSd/sLa
   +lwulhY6b/gzjUVjc1DGa436NwKSGYD4eIom6lDs+NW6/PiydLrspMgqg
   aBzaPvktUCaQypGZ7NT5uRqSFQJMraC9YVL983e/eVjp+gSyWDNjLt9Zd
   LYZ8wYOv6YvneMt2Lu/ZBz10oBGcnV6bqi5rMEDoQVCiSmeJtvuPVNnpl
   FT92M3yzqDe/R3ceBF8ZZwX9iP/OEwo7PuWaC/1/BttxC6yj7CrHlYI8Q
   HzB8tA8w7QPzQj/ISsG3Ao5Yx0+uo0/3xMF92LNfgq8w1KHIqUjJaJd1K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="7139568"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7139568"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 00:57:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="11590812"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Feb 2024 00:56:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1retGj-000B4x-1C;
	Tue, 27 Feb 2024 08:56:57 +0000
Date: Tue, 27 Feb 2024 16:56:25 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Miklos Szeredi <mszeredi@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>
Subject: [linux-next:master 8941/10418] WARNING: modpost: vmlinux: section
 mismatch in reference: virtio_fs_init+0x8c (section: .init.text) ->
 map_benchmark_cleanup (section: .exit.text)
Message-ID: <202402271629.7zZU8sCF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   22ba90670a51a18c6b36d285fddf92b9887c0bc3
commit: a8f62f50b4e4ea92a938fca2ec1bd108d7f210e9 [8941/10418] virtiofs: export filesystem tags through sysfs
config: sh-buildonly-randconfig-r003-20230528 (https://download.01.org/0day-ci/archive/20240227/202402271629.7zZU8sCF-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402271629.7zZU8sCF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402271629.7zZU8sCF-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: virtio_fs_init+0x8c (section: .init.text) -> map_benchmark_cleanup (section: .exit.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
