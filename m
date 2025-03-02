Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CBC1E5B9C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740934730; cv=none; b=ING3pD0Fne75Q8MKplmS295qE4zJXkU6SBxnGYM7a8BVcJRfiBGIFcuPpMbwmk5rlL3guK3gOYXHT5fb/FONrsNaN+ZZDSTaUREzCvpc6yf0Bz+aX/mcls3TEeSywteREHPZL2XrTlkirKKmHpsW4IFJbZ6IP9TwG3i0xoLXMX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740934730; c=relaxed/simple;
	bh=An0hwRlsiDFNp7UzW0BgaMkKYsQ4BZsmF5maInVWOUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gNwsibFdL9/ovEzRglzozz9azFS/xnT+p0x58mgDh0F6BFWiq/FlilxPuBHBJaW7ePT/O1Fp9sC7sd7cMKgz+s/ybiP/kXvYmNtfGyrPp6SB8xdXiXXKhruL3eUnUbh2eVpb77eGBmAenXWdrapKYCyNxZOhnJPxNo7Mb6XTbSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwxTS6pH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwxTS6pH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740934727; x=1772470727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=An0hwRlsiDFNp7UzW0BgaMkKYsQ4BZsmF5maInVWOUc=;
  b=IwxTS6pHk36W8OqzblPuUd6kSmSJS0w3WNYFxpKWIQwy4ponSOwu1UBm
   OSC5OeANl/uudEcwguShEodKIPQZU7EbQwzroPRukJNim9s7eEVkoAe2y
   1RpWa9LtnH2ZlSAbJsZqajv9kXnDsU36VbMJVDqmrMDYodJQ2dITV4YXB
   weSRywo5DUMhRXVv6zHMXAMfyeUgewqCRwvbwMTQeIex2+eFeNI3B9zIw
   s2pDH+h4OpZ1Yljpu4EW6JpkOimeHFXl+aChklq5g4WL1gBDEC4ihM1ci
   Bl46EZllDMTeoLUOayMHBk42YQPnzwq5jhQPyNZcMo7/GA6wvfIXKxzDk
   g==;
X-CSE-ConnectionGUID: VoA0+p7+RDmCg37pBL1Vag==
X-CSE-MsgGUID: 2nibD5fDRcOyh8jaYYEFeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41999963"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41999963"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 08:58:47 -0800
X-CSE-ConnectionGUID: ORU8rWgvQf2Oc1OfD0kfMg==
X-CSE-MsgGUID: hpIA8C89TM+pOGdxoUvNbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="117549904"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Mar 2025 08:58:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tomeJ-000HTC-2E;
	Sun, 02 Mar 2025 16:58:43 +0000
Date: Mon, 3 Mar 2025 00:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] fs/proc/meminfo.c:37:37:
 warning: variable 'sunreclaim' set but not used
Message-ID: <202503030020.b87Q9lb2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xunlei,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   b546d9695894905e1bc9de7646f89b06dbeae968
commit: eedf4ae2be04591b38a81690ef85cefd83b78cb3 [1/1] ck: meminfo: Add meminfo support for rich container
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250303/202503030020.b87Q9lb2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030020.b87Q9lb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030020.b87Q9lb2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/meminfo.c: In function 'meminfo_proc_show':
>> fs/proc/meminfo.c:37:37: warning: variable 'sunreclaim' set but not used [-Wunused-but-set-variable]
      37 |         unsigned long sreclaimable, sunreclaim;
         |                                     ^~~~~~~~~~


vim +/sunreclaim +37 fs/proc/meminfo.c

e16e2d8e14a14b Joe Perches     2016-10-07  32  
e1759c215bee5a Alexey Dobriyan 2008-10-15  33  static int meminfo_proc_show(struct seq_file *m, void *v)
e1759c215bee5a Alexey Dobriyan 2008-10-15  34  {
e1759c215bee5a Alexey Dobriyan 2008-10-15  35  	struct sysinfo i;
e1759c215bee5a Alexey Dobriyan 2008-10-15  36  	unsigned long committed;
61f94e18de94f7 Vlastimil Babka 2018-10-26 @37  	unsigned long sreclaimable, sunreclaim;
e1759c215bee5a Alexey Dobriyan 2008-10-15  38  	int lru;
e1759c215bee5a Alexey Dobriyan 2008-10-15  39  
eedf4ae2be0459 Xunlei Pang     2021-06-04  40  	struct mem_cgroup *memcg = NULL;
eedf4ae2be0459 Xunlei Pang     2021-06-04  41  	struct sysinfo_ext ext;
eedf4ae2be0459 Xunlei Pang     2021-06-04  42  

:::::: The code at line 37 was first introduced by commit
:::::: 61f94e18de94f79abaad3bb83549ff78923ac785 mm, proc: add KReclaimable to /proc/meminfo

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
