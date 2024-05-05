Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E0037141
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 16:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714927722; cv=none; b=BpY/gTzeUoFIr/RcccQihaXx9CFPzQxlrZK7qAn2/2dckliIQbKsV4QYzVjJgXxvSEOwOlHUXgDKiBhEc3vYdIT7h0FvzXlI1i9lI2PF33BOcRmVr2oIZN0FjtzcbCve7DEeqrb0s6NBt1C/nqDc2JxA1JmtqvU2XO14BP6Tubg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714927722; c=relaxed/simple;
	bh=d6DQQFkOQ0VcZr7QXgY6675oIVnQ4TU1ZGryp4Al+nE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ozNmh7Q+L05WkAsMBl3zAje7dF2z+EOWCx0CzuiHdoB+5mPhrzMTuLNs2Bez8CPEa7cQFR1zyj2cVmKEU6qjV6eblyxlQ04uoBwC3++mok7vT+0LGhwMxFxgSsS58ZFZPGSIuUTckQiOf2g9YJSUMLBVFzI82qltK/iHetMEmtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHdDYua/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHdDYua/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714927721; x=1746463721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6DQQFkOQ0VcZr7QXgY6675oIVnQ4TU1ZGryp4Al+nE=;
  b=LHdDYua/DCbIQpEHEugAhnnRheHNiYp9PfUrTV1Ex48IHAXHuLualGul
   Q0+Q9sOKiLKQ0Qu17Mm9OmJgpzAqXf8szwQwtHwGShDYaHLQ/otNuhMOw
   yFm70Lo6cdtI5JgeDOFK609aVRmA5la++3H1+2Kg4PpyQ/IoWkEurZnAr
   fGm5nU47BVJCLvakBSXo4qb4p5yesAc+cb4n7d43xtcpXKubxoSi/rZMw
   Vnge6585lYC+pEuInKW2bmqHysbMdLvj+MltzCabFwgj3zR4rzZmCHppK
   5H2i4DgGzVcvuqwpdNqrf5xmQfG7SmOwOFq82i7YoaMZDMMaFxBsrmNDS
   w==;
X-CSE-ConnectionGUID: 21LWYmiyQZiu7jJb1a00zA==
X-CSE-MsgGUID: 0hSBI2q1Qi+x/oTeA4X0Zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14459700"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="14459700"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 09:48:39 -0700
X-CSE-ConnectionGUID: Hm7YlwAES7OHZCo2yhONNw==
X-CSE-MsgGUID: pq/+NPpfQaa/03+50+P3WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="32548045"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 May 2024 09:48:37 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3f2Q-00004V-2r;
	Sun, 05 May 2024 16:48:34 +0000
Date: Mon, 6 May 2024 00:48:26 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/syzbot 33/33] fs/f2fs/f2fs.h:3130:24: error: 'struct
 f2fs_inode_info' has no member named 'i_gc_failures'; did you mean
 'i_pin_failure'?
Message-ID: <202405060007.AISdO2GQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   d7c9e98caf2285d83bf9e839c7398946bbc7deb3
commit: d7c9e98caf2285d83bf9e839c7398946bbc7deb3 [33/33] f2fs: remove unused GC_FAILURE_PIN
config: arc-randconfig-002-20240505 (https://download.01.org/0day-ci/archive/20240506/202405060007.AISdO2GQ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060007.AISdO2GQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060007.AISdO2GQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:13:
   fs/f2fs/f2fs.h: In function 'f2fs_i_gc_failures_write':
>> fs/f2fs/f2fs.h:3130:24: error: 'struct f2fs_inode_info' has no member named 'i_gc_failures'; did you mean 'i_pin_failure'?
    3130 |         F2FS_I(inode)->i_gc_failures = count;
         |                        ^~~~~~~~~~~~~
         |                        i_pin_failure
--
   In file included from fs/f2fs/recovery.c:12:
   fs/f2fs/f2fs.h: In function 'f2fs_i_gc_failures_write':
>> fs/f2fs/f2fs.h:3130:24: error: 'struct f2fs_inode_info' has no member named 'i_gc_failures'; did you mean 'i_pin_failure'?
    3130 |         F2FS_I(inode)->i_gc_failures = count;
         |                        ^~~~~~~~~~~~~
         |                        i_pin_failure
   fs/f2fs/recovery.c: In function 'recover_inode':
>> fs/f2fs/recovery.c:333:24: error: 'struct f2fs_inode_info' has no member named 'i_gc_failures'; did you mean 'i_pin_failure'?
     333 |         F2FS_I(inode)->i_gc_failures = le16_to_cpu(raw->i_gc_failures);
         |                        ^~~~~~~~~~~~~
         |                        i_pin_failure
--
   In file included from fs/f2fs/file.c:29:
   fs/f2fs/f2fs.h: In function 'f2fs_i_gc_failures_write':
>> fs/f2fs/f2fs.h:3130:24: error: 'struct f2fs_inode_info' has no member named 'i_gc_failures'; did you mean 'i_pin_failure'?
    3130 |         F2FS_I(inode)->i_gc_failures = count;
         |                        ^~~~~~~~~~~~~
         |                        i_pin_failure
   fs/f2fs/file.c: In function 'f2fs_pin_file_control':
>> fs/f2fs/file.c:3220:53: error: 'struct f2fs_inode_info' has no member named 'i_gc_failures'; did you mean 'i_pin_failure'?
    3220 |                 f2fs_i_gc_failures_write(inode, fi->i_gc_failures + 1);
         |                                                     ^~~~~~~~~~~~~
         |                                                     i_pin_failure
   fs/f2fs/file.c:3222:17: error: 'struct f2fs_inode_info' has no member named 'i_gc_failures'; did you mean 'i_pin_failure'?
    3222 |         if (fi->i_gc_failures > sbi->gc_pin_file_threshold) {
         |                 ^~~~~~~~~~~~~
         |                 i_pin_failure
   fs/f2fs/file.c:3224:55: error: 'struct f2fs_inode_info' has no member named 'i_gc_failures'; did you mean 'i_pin_failure'?
    3224 |                           __func__, inode->i_ino, fi->i_gc_failures);
         |                                                       ^~~~~~~~~~~~~
   fs/f2fs/f2fs.h:1829:53: note: in definition of macro 'f2fs_warn'
    1829 |         f2fs_printk(sbi, false, KERN_WARNING fmt, ##__VA_ARGS__)
         |                                                     ^~~~~~~~~~~
   fs/f2fs/file.c: In function 'f2fs_ioc_set_pin_file':
   fs/f2fs/file.c:3288:30: error: 'struct f2fs_inode_info' has no member named 'i_gc_failures'; did you mean 'i_pin_failure'?
    3288 |         ret = F2FS_I(inode)->i_gc_failures;
         |                              ^~~~~~~~~~~~~
         |                              i_pin_failure
   fs/f2fs/file.c: In function 'f2fs_ioc_get_pin_file':
   fs/f2fs/file.c:3303:38: error: 'struct f2fs_inode_info' has no member named 'i_gc_failures'; did you mean 'i_pin_failure'?
    3303 |                 pin = F2FS_I(inode)->i_gc_failures;
         |                                      ^~~~~~~~~~~~~
         |                                      i_pin_failure
--
   In file included from fs/f2fs/inode.c:16:
   fs/f2fs/f2fs.h: In function 'f2fs_i_gc_failures_write':
>> fs/f2fs/f2fs.h:3130:24: error: 'struct f2fs_inode_info' has no member named 'i_gc_failures'; did you mean 'i_pin_failure'?
    3130 |         F2FS_I(inode)->i_gc_failures = count;
         |                        ^~~~~~~~~~~~~
         |                        i_pin_failure
   fs/f2fs/inode.c: In function 'do_read_inode':
>> fs/f2fs/inode.c:418:21: error: 'struct f2fs_inode_info' has no member named 'i_gc_failures'; did you mean 'i_pin_failure'?
     418 |                 fi->i_gc_failures = le16_to_cpu(ri->i_gc_failures);
         |                     ^~~~~~~~~~~~~
         |                     i_pin_failure
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/arc/include/uapi/asm/byteorder.h:16,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arc/include/asm/bitops.h:192,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/f2fs/inode.c:8:
   fs/f2fs/inode.c: In function 'f2fs_update_inode':
   fs/f2fs/inode.c:688:64: error: 'struct f2fs_inode_info' has no member named 'i_gc_failures'; did you mean 'i_pin_failure'?
     688 |                 ri->i_gc_failures = cpu_to_le16(F2FS_I(inode)->i_gc_failures);
         |                                                                ^~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:36:51: note: in definition of macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   fs/f2fs/inode.c:688:37: note: in expansion of macro 'cpu_to_le16'
     688 |                 ri->i_gc_failures = cpu_to_le16(F2FS_I(inode)->i_gc_failures);
         |                                     ^~~~~~~~~~~


vim +3130 fs/f2fs/f2fs.h

  3126	
  3127	static inline void f2fs_i_gc_failures_write(struct inode *inode,
  3128						unsigned int count)
  3129	{
> 3130		F2FS_I(inode)->i_gc_failures = count;
  3131		f2fs_mark_inode_dirty_sync(inode, true);
  3132	}
  3133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
