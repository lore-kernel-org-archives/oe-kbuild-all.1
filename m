Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF527132124
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725696541; cv=none; b=k/XzaSPyWB8OedFmhrXSZZXUZhhnyLdu4KE+88H6QV0g5yGIVTWKmZSy2w8IDH3KQklOhND1FQcWCZNag8ZxlkDIpOjqxowvlHft3u//1t3V0EkEoB82NLgYpK4bqIp6f3lVHQwLrHlhKOQ4Gptfe3FLeX23aRfHuPi/d+4LahU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725696541; c=relaxed/simple;
	bh=1bLv5Q/Q7LjgXhx/8WSJo3i7fyvMovbpQTrA5voMY2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sKPN5DXsR5NtiBVZEQbF43MFIOz/8pQJERCGLEog8YxhcebAhbVJibZNONO8kEkuVO4i8mrehgWbi48Br05Ca1CYEq0+cjoxO/YlIy7I54tNqAbIQ64lQ67YIL1IZUNn3SkT1jZxgZAKna69kACWwNcAsTzRFHVZSIqVxsNB+X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMeisqlO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMeisqlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725696538; x=1757232538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1bLv5Q/Q7LjgXhx/8WSJo3i7fyvMovbpQTrA5voMY2c=;
  b=nMeisqlOUC6KXzQ5DDlitLlzjSvz2k985BNQEB/POtCblhEeivYb0RUH
   9ZP6myB7Oje3+juPYt34TQgik3AusHxhSayBM0tfrDcS98+X3c//HgUFZ
   1oHUnUia+zirmfj3EK474IFxicuorkFlAubCUewc0ceYlCQ96qSwTz9rs
   KbAYglXP492S1wY7r5SGhcrIy+opEuCSCYJQy/F2lfOTqJ6YpAG2pPGCd
   xl+lVhME58fIkNWPUvCuljMx0+zP7iQ26Fn36o9ucze63kp55Tzv/Wnns
   5Gm1pRVLxlCcHdDjPuSbny6pJAkFpi9G/upp5siAHHbiySEQZBx6O6kn7
   A==;
X-CSE-ConnectionGUID: hOZiztZzQ/GjgGmWFrVimA==
X-CSE-MsgGUID: CslDxvNXS6+dzJTb6ojXyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28241654"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="28241654"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 01:08:58 -0700
X-CSE-ConnectionGUID: oy9K8cpHRd6g/Q55+V0keQ==
X-CSE-MsgGUID: 8FITfEgURx6ZeJXNQQYpvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70987648"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Sep 2024 01:08:57 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smqV5-000CJh-0H;
	Sat, 07 Sep 2024 08:08:55 +0000
Date: Sat, 7 Sep 2024 16:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:virtio-mem-s390x-new 1/5]
 arch/s390/include/asm/kexec.h:112:25: error: static declaration of
 'is_kdump_kernel' follows non-static declaration
Message-ID: <202409071509.9d1aF7Dk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux virtio-mem-s390x-new
head:   22302461039e12befd39dfe4305e679f68aa63ea
commit: 1f80ce0bcc53dc6283ec1cb8e275950be2487c4b [1/5] s390/kdump: implement is_kdump_kernel()
config: s390-randconfig-r072-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071509.9d1aF7Dk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071509.9d1aF7Dk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071509.9d1aF7Dk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kexec.h:34,
                    from include/linux/crash_dump.h:5,
                    from kernel/elfcorehdr.c:3:
>> arch/s390/include/asm/kexec.h:112:25: error: static declaration of 'is_kdump_kernel' follows non-static declaration
     112 | #define is_kdump_kernel is_kdump_kernel
         |                         ^~~~~~~~~~~~~~~
   include/linux/crash_dump.h:118:20: note: in expansion of macro 'is_kdump_kernel'
     118 | static inline bool is_kdump_kernel(void) { return false; }
         |                    ^~~~~~~~~~~~~~~
   arch/s390/include/asm/kexec.h:111:6: note: previous declaration of 'is_kdump_kernel' with type 'bool(void)' {aka '_Bool(void)'}
     111 | bool is_kdump_kernel(void);
         |      ^~~~~~~~~~~~~~~


vim +/is_kdump_kernel +112 arch/s390/include/asm/kexec.h

   110	
   111	bool is_kdump_kernel(void);
 > 112	#define is_kdump_kernel is_kdump_kernel
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
