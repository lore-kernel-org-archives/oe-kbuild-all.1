Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8E2178372
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 08:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734164514; cv=none; b=m+njx1Q8uRV0dnHlWApw5BN57byX4sJ2lArpjW+CXC0EwmxilKe8IBBrXYJv4gwaFahGgKVWQYQjhv8TsRr9jGY7GQM11bciZQNfsK74z9L/WbwNNbvmxBXx5iXylEVgAY48hlKyuqitBI4SGPYkYhyOWzi1f1ec4Ovs4PCib64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734164514; c=relaxed/simple;
	bh=tGqCX5P0gKiZtXlQ7Z4k/Pv2BuqEzhqqcPET8oCkwZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IzUnDjROqiuJPjJe5JLsUhvFgPeQY4VfOfOlNKBLMd+oZe3FgdYuZlMt4AMLZL8Wyj35bBzN5VZLqc5zxoG4QqqoGsaycX7WqNP1Htsei/XsJAK6I1aL3DL9+YJPL0Z1eql5pXu9PuTCSGYrorjQKnYbh78HQOSH9BWG+kbHLQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2jy9meW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2jy9meW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734164513; x=1765700513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tGqCX5P0gKiZtXlQ7Z4k/Pv2BuqEzhqqcPET8oCkwZc=;
  b=l2jy9meWPFksnZCdnJu4CurjFjukl2Meq25YwZZ795Y0wO4h7ztuI0bP
   R8SystYIh6+dmqmWC7e4oUBNX7Xde+AK+bjEdOb20gY/uIZs5hzR4ih0i
   tC/aY1lCzHZQAPrVI0/ExQq+kUbiYzgGJ8AZgTlmbjoM9RIb/Jxzl1HTB
   rOCzydk4CaiWUMII7dcSrkRNdWNtOHsGkQvMilLnH9+AgRQz3zGDKsnOC
   j34NNMJj1BTq9kaMTp3Xnx3yoW9YB3uzOdeMtGfNgS1iAhJBeEGiPCxS9
   Dmm5HNNmn/3TggxvSeaMQmXn+Eearfok7rEeN6FPsh5V9MUCu4ESpaxg2
   w==;
X-CSE-ConnectionGUID: CtWK8y2hQ6+ye8jhCdaGRA==
X-CSE-MsgGUID: PSTRSRRBRUeE9MkCE485lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="33920167"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="33920167"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 00:21:52 -0800
X-CSE-ConnectionGUID: BsPAN69qQUOJ3duPY79/Lg==
X-CSE-MsgGUID: 5lfW7DfzRNmEOyXk5Nzsew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="97149231"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Dec 2024 00:21:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMNPI-000CnD-2S;
	Sat, 14 Dec 2024 08:21:48 +0000
Date: Sat, 14 Dec 2024 16:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 38/40] drivers/hid/hid-himax.c:5345:35:
 warning: unused variable 'himax_spi_id'
Message-ID: <202412141638.jkJUcluc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   dccc901bd5fe4dba6ee0f15af2be9ed3bd78a8ff
commit: 95761e94632784b706c0af113dfe08ab97f85e7e [38/40] CHROMIUM: HID: hid-himax: Add spi_device_id
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241214/202412141638.jkJUcluc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141638.jkJUcluc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141638.jkJUcluc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/hid-himax.c:8:
   In file included from drivers/hid/hid-himax.h:20:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:1780:
   include/linux/vmstat.h:502:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:530:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     530 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     531 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/hid-himax.c:5345:35: warning: unused variable 'himax_spi_id' [-Wunused-const-variable]
    5345 | static const struct spi_device_id himax_spi_id[] = {
         |                                   ^~~~~~~~~~~~
   6 warnings generated.


vim +/himax_spi_id +5345 drivers/hid/hid-himax.c

  5344	
> 5345	static const struct spi_device_id himax_spi_id[] = {
  5346		{ "hx83102j" },
  5347		{ },
  5348	};
  5349	MODULE_DEVICE_TABLE(spi, himax_spi_id);
  5350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
