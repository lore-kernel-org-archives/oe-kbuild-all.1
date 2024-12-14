Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C743C14
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 00:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134750; cv=none; b=s5ZjhISdzp7i675uZgvmb3m7dxNhDTdU3Z/KClTh87dXlv2+4oTBEt38wlB/9baSBfAhY04OcGxoAfNK9jtLxH+ySaWcFRes4QaUAvU9DdIHgd4bKe5SjAxQYoMEAQhCG0Emf4T5qV7CqjFS8CzC511+Fq4xxZPEJ4nzHDH1/F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134750; c=relaxed/simple;
	bh=iOdjdkWo+rtJUdsJNRRkjZAYHsRaB8I7gWoNwHaOa2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EkkrX1xaFh8Wu+55EOM+mOkugdp+VuioqHW1Xu8AX1ylvDYhBCSMb01D0q3oAofjzXoR3VGcpfg1kqzIGanWy+CTwxmjWTxtIdpNaA03+BvZaJmY0dYZTiRUzNYlk+ESCEL8euPjH5lZcuOqpn1ELn6oSuhWE+HdLVrKTIeI5m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTjf7EKJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTjf7EKJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734134749; x=1765670749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iOdjdkWo+rtJUdsJNRRkjZAYHsRaB8I7gWoNwHaOa2U=;
  b=NTjf7EKJjsgeMVbZlMTJZYUojwvhNdjXKYg8Hv8yT+IaTM60BcKr4WdY
   dO8V/UdgFtLXGRstQDanO1dn55qef02nle+lfHRZ4T2Pm6KA1akwM5n7S
   1s2riTYSyD5Jod2Xq20trB6ZvVNSA1xROYTzib5QgxmP6pjn7Hb5tNY68
   P6g23RyCRcx4IHn8FYJrg8+ODve5vqBRD8V6zy9NJs7wiAKR1HI1Fsb7a
   si1WMpEPq9l9sMLekO3Lsz1ndwapIPHjHhiZNBTBkredQdEdqw0zgMJOl
   8Jj8bDLaQmg/Rc4mZf+zD8b3UEtZWXxxokRu0Zuq945LO6cf2N5xgiAXN
   w==;
X-CSE-ConnectionGUID: w/kHuY8WRaaw2BCMRP4dkQ==
X-CSE-MsgGUID: hc5LgZ5URuq2HTLz8FzvsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="33928791"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="33928791"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 16:05:48 -0800
X-CSE-ConnectionGUID: B9qvRL3SRzydLOk8PKix8g==
X-CSE-MsgGUID: qyYRwDAIS4KN6Ra7g29tjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="97085988"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2024 16:05:47 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMFfF-000CYZ-0p;
	Sat, 14 Dec 2024 00:05:45 +0000
Date: Sat, 14 Dec 2024 08:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 11124/30000]
 include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of
 type 'long unsigned int', but argument 6 has type 'blkcnt_t' {aka 'long long
 unsigned int'}
Message-ID: <202412140809.AXUVZAXp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jaegeuk,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: c1fae4b2550e30eff0ee060298e18bf94a82df74 [11124/30000] UPSTREAM: Merge remote-tracking branch 'aosp/upstream-f2fs-stable-linux-4.19.y' into android-4.19 (v5.7-rc1)
config: i386-buildonly-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241214/202412140809.AXUVZAXp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140809.AXUVZAXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140809.AXUVZAXp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/f2fs/inode.c:8:
   fs/f2fs/inode.c: In function 'sanity_check_inode':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'blkcnt_t' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:2012:26: note: in expansion of macro 'KERN_WARNING'
    2012 |         f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~
   fs/f2fs/inode.c:303:25: note: in expansion of macro 'f2fs_warn'
     303 |                         f2fs_warn(sbi, "%s: inode (ino=%lx) has inconsistent "
         |                         ^~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
