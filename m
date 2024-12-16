Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41588207A25
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 19:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734376708; cv=none; b=fop8vAjTRTSlUiGTyCp1W0ObpXVRxCWSn30ozXnEH8pCMhhXAtbVrl3nx1mevR5OJghTUwIjL+hG/Otemz965KFptPT58PCvebvjladO1WLP1Aag/sXVqUnTJmWKxC9GKzNps0/eEqNqt+5oJFkv2X/HN6+jrAGP5dKKfwWvoug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734376708; c=relaxed/simple;
	bh=0PyCmrkTqJycZ03qn5ZpZ26As71YTGaw37JL8yCUA1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtrE14n5qPvb3Qg7dCrCNZeyiV9EYVu/kGEwwx/o5cCEdUR/GQ64yPpA5+r8YC8leF9QU549i19Vvo9NwHe7cyCSmf91vThqGZkrfHZe+vBT+7T1p5JPZ9jDSlCirkkZF3wRroPgLELzvcInmmkzdaVI3bEW8MuypwBeTC1LYWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vk/wiqgC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vk/wiqgC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734376706; x=1765912706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0PyCmrkTqJycZ03qn5ZpZ26As71YTGaw37JL8yCUA1M=;
  b=Vk/wiqgCmgj4qn14+eomivA9aeX2eh2GC6TXLhTVeHGkvlKEP6YjBDdu
   hZ8T0s/aJMmfETpfcZsvA75JOYrUwKzHZD2ony4PyWfiwpDHTRd1184tU
   i9sBUdBsUBxjSniNhx99DyUnUW1X/K3xVqpf0wrUeMSMq+sLCA7vhSi2B
   tY8KImML/QVrCa7alPPalyb0vqFsJyrjenLuCD3x7Tj3WejR/vTREN3c8
   ia6g+EyECyAoeSwG3EOQXYve4CdBWjumP8BCVyzQpDlsS4jR71U2rm6wT
   PSc7QVVv+3LJDeLj3YR8NTHL4FMdPIniQOftXZPJ6hU9yqrDWR/0HFBGw
   A==;
X-CSE-ConnectionGUID: uJqNb5PtQcymIgaSBuxZjg==
X-CSE-MsgGUID: xoiB+/sURICmtZY5LFFqPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34072614"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="34072614"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 11:18:26 -0800
X-CSE-ConnectionGUID: AayQ1StLStqIz8XHeCpE4Q==
X-CSE-MsgGUID: PI8eHK7pQRyd6deaD3q9IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98085130"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Dec 2024 11:18:25 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNGbm-000EQi-0A;
	Mon, 16 Dec 2024 19:18:22 +0000
Date: Tue, 17 Dec 2024 03:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:wip 13/20] include/linux/kern_levels.h:5:25: warning: format
 '%u' expects argument of type 'unsigned int', but argument 7 has type 'long
 unsigned int'
Message-ID: <202412170355.uN9ZOwPD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   99c1b937f7efd14347261f99e40036e481c6cbc0
commit: e958c55387d039b2804ceb0c38fb771a58874d0e [13/20] f2fs: fix to do sanity check correctly on i_inline_xattr_size
config: x86_64-buildonly-randconfig-003-20241217 (https://download.01.org/0day-ci/archive/20241217/202412170355.uN9ZOwPD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412170355.uN9ZOwPD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170355.uN9ZOwPD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from arch/x86/include/asm/paravirt.h:19,
                    from arch/x86/include/asm/irqflags.h:80,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/f2fs/inode.c:8:
   fs/f2fs/inode.c: In function 'sanity_check_inode':
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 7 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:1855:33: note: in expansion of macro 'KERN_WARNING'
    1855 |         f2fs_printk(sbi, false, KERN_WARNING fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~
   fs/f2fs/inode.c:318:17: note: in expansion of macro 'f2fs_warn'
     318 |                 f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %u, max: %lu",
         |                 ^~~~~~~~~


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
