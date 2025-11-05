Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC65E2248BE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 16:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762359349; cv=none; b=djRj8Rr+sdsfjgOQUt0whVs5d62eLXObZMAmvBXfYK014DpDX00ILMxS7BF/BpdEoODfAtk6RS6ssCvi+4bwBcCsYe47W8hfcO3TmPgwUuzttSQhgNbBQViX6z4iylrKychZEcb86Bqdr2YY5LYhRvBecB90fOe8uMPp7oOO9SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762359349; c=relaxed/simple;
	bh=mXVQGqAS8r29Zwr1cRbOBOiL4tUKNzTc2UqxOHwtQOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUlc5anx3YrGpha7BRvecRr8nyNDz1f6Jxzvjk+pWFurhzKJKNi5ZZloRMu/XBTPZrjOgCGo2dNdSqQxtME1qCblBuFnpkeuFdlp30BGpKmI1PfwhzQ+PS1PJPAT91jhh3sqf5Sq0xPFn0aza99wf2nRoXaN3HmeXVH1UsLKZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hgq0Yd3g; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hgq0Yd3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762359346; x=1793895346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mXVQGqAS8r29Zwr1cRbOBOiL4tUKNzTc2UqxOHwtQOA=;
  b=Hgq0Yd3gMBbK8bWS/qVnboHoVx+p8mQ40cZ3FgB0fBfMnxT77cxzR+/v
   Kki4x6AKkZL8QnAJagnjoowoU/LATdSdRqZK3Y4yfS+OgnV/YUdccl4DN
   l8uKoTSC5MLDLIPqZ77fr72wxTpvg+ij+RBO+46Yr3kornFpRgqUsuFM6
   HlTSP+TFdE6LXNElQ284DGnrqwaOjNtNH05Ss7BFZ9gMkzqteKtHd0tHV
   nEfKOKxU8Ad3OJMME9aopKuM8YNT0ySfgaoZB9dUQiTR8nizajL7E5Hul
   SAfTLODknp9GSBS0mmup4N5eP+1uQL90NtMfwBGNnB++I4M++2HFAZPRW
   A==;
X-CSE-ConnectionGUID: NErQWACNSB2bNChnnpKxMQ==
X-CSE-MsgGUID: 6grTfxHlSLy09sneajLxVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64577533"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="64577533"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 08:15:46 -0800
X-CSE-ConnectionGUID: xnxa2sZtTM+pwkRlQmJ27w==
X-CSE-MsgGUID: 6ioenVpvTB2mDKCpY/WaRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="210972282"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2025 08:15:44 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGgA5-000Spq-0h;
	Wed, 05 Nov 2025 16:15:17 +0000
Date: Thu, 6 Nov 2025 00:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.all 10/12] include/linux/fs.h:1818:26: warning:
 passing argument 1 of 'from_kuid' makes pointer from integer without a cast
Message-ID: <202511060038.dFRe1fsF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.all
head:   3742991d3be2fa7808d3e569366a10d7eb287b55
commit: 3fef0b63fe1c3cd51b1daae6f8b946a947d73331 [10/12] Merge branch 'vfs-6.19.fs_header' into vfs.all
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20251106/202511060038.dFRe1fsF-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060038.dFRe1fsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511060038.dFRe1fsF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h:1431:1: error: version control conflict marker in file
    1431 | <<<<<<< HEAD
         | ^~~~~~~
   include/linux/fs.h:1464:8: error: redefinition of 'struct sb_writers'
    1464 | struct sb_writers {
         |        ^~~~~~~~~~
   In file included from include/linux/fs_super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs_super_types.h:52:8: note: originally defined here
      52 | struct sb_writers {
         |        ^~~~~~~~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h:1474:8: error: redefinition of 'struct super_block'
    1474 | struct super_block {
         |        ^~~~~~~~~~~
   In file included from include/linux/fs_super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs_super_types.h:129:8: note: originally defined here
     129 | struct super_block {
         |        ^~~~~~~~~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h:1618:1: error: expected identifier or '(' before '||' token
    1618 | ||||||| dcb6fa37fd7b
         | ^~
   include/linux/fs.h:1651:8: error: redefinition of 'struct sb_writers'
    1651 | struct sb_writers {
         |        ^~~~~~~~~~
   include/linux/fs.h:1464:8: note: originally defined here
    1464 | struct sb_writers {
         |        ^~~~~~~~~~
   include/linux/fs.h:1661:8: error: redefinition of 'struct super_block'
    1661 | struct super_block {
         |        ^~~~~~~~~~~
   include/linux/fs.h:1474:8: note: originally defined here
    1474 | struct super_block {
         |        ^~~~~~~~~~~
   include/linux/fs.h:1804:1: error: version control conflict marker in file
    1804 | =======
         | ^~~~~~~
   include/linux/fs.h:1805:13: error: too many decimal points in number
    1805 | >>>>>>> vfs-6.19.fs_header
         |             ^~~~~~~~~~~~~~
   include/linux/fs.h: In function 'i_uid_read':
   include/linux/fs.h:1818:26: error: implicit declaration of function 'i_user_ns' [-Werror=implicit-function-declaration]
    1818 |         return from_kuid(i_user_ns(inode), inode->i_uid);
         |                          ^~~~~~~~~
>> include/linux/fs.h:1818:26: warning: passing argument 1 of 'from_kuid' makes pointer from integer without a cast [-Wint-conversion]
    1818 |         return from_kuid(i_user_ns(inode), inode->i_uid);
         |                          ^~~~~~~~~~~~~~~~
         |                          |
         |                          int
   In file included from include/linux/kernfs.h:18,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/irqdesc.h:6,
                    from include/linux/irq.h:581,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/nios2/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from arch/nios2/kernel/asm-offsets.c:9:
   include/linux/uidgid.h:149:54: note: expected 'struct user_namespace *' but argument is of type 'int'
     149 | static inline uid_t from_kuid(struct user_namespace *to, kuid_t kuid)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~^~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h: In function 'i_gid_read':
>> include/linux/fs.h:1823:26: warning: passing argument 1 of 'from_kgid' makes pointer from integer without a cast [-Wint-conversion]
    1823 |         return from_kgid(i_user_ns(inode), inode->i_gid);
         |                          ^~~~~~~~~~~~~~~~
         |                          |
         |                          int
   In file included from include/linux/kernfs.h:18,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/irqdesc.h:6,
                    from include/linux/irq.h:581,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/nios2/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from arch/nios2/kernel/asm-offsets.c:9:
   include/linux/uidgid.h:154:54: note: expected 'struct user_namespace *' but argument is of type 'int'
     154 | static inline gid_t from_kgid(struct user_namespace *to, kgid_t kgid)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~^~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h: In function 'i_uid_write':
>> include/linux/fs.h:1828:34: warning: passing argument 1 of 'make_kuid' makes pointer from integer without a cast [-Wint-conversion]
    1828 |         inode->i_uid = make_kuid(i_user_ns(inode), uid);
         |                                  ^~~~~~~~~~~~~~~~
         |                                  |
         |                                  int
   In file included from include/linux/kernfs.h:18,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/irqdesc.h:6,
                    from include/linux/irq.h:581,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/nios2/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from arch/nios2/kernel/asm-offsets.c:9:
   include/linux/uidgid.h:139:55: note: expected 'struct user_namespace *' but argument is of type 'int'
     139 | static inline kuid_t make_kuid(struct user_namespace *from, uid_t uid)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h: In function 'i_gid_write':
>> include/linux/fs.h:1833:34: warning: passing argument 1 of 'make_kgid' makes pointer from integer without a cast [-Wint-conversion]
    1833 |         inode->i_gid = make_kgid(i_user_ns(inode), gid);
         |                                  ^~~~~~~~~~~~~~~~
         |                                  |
         |                                  int
   In file included from include/linux/kernfs.h:18,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/irqdesc.h:6,
                    from include/linux/irq.h:581,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/nios2/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from arch/nios2/kernel/asm-offsets.c:9:
   include/linux/uidgid.h:144:55: note: expected 'struct user_namespace *' but argument is of type 'int'
     144 | static inline kgid_t make_kgid(struct user_namespace *from, gid_t gid)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h: In function 'i_uid_into_vfsuid':
>> include/linux/fs.h:1847:35: warning: passing argument 2 of 'make_vfsuid' makes pointer from integer without a cast [-Wint-conversion]
    1847 |         return make_vfsuid(idmap, i_user_ns(inode), inode->i_uid);
         |                                   ^~~~~~~~~~~~~~~~
         |                                   |
         |                                   int
   In file included from include/linux/fs.h:44,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/mnt_idmapping.h:128:45: note: expected 'struct user_namespace *' but argument is of type 'int'
     128 |                      struct user_namespace *fs_userns, kuid_t kuid);
         |                      ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h: In function 'i_uid_update':
>> include/linux/fs.h:1884:51: warning: passing argument 2 of 'from_vfsuid' makes pointer from integer without a cast [-Wint-conversion]
    1884 |                 inode->i_uid = from_vfsuid(idmap, i_user_ns(inode),
         |                                                   ^~~~~~~~~~~~~~~~
         |                                                   |
         |                                                   int
   In file included from include/linux/fs.h:44,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/mnt_idmapping.h:134:43: note: expected 'struct user_namespace *' but argument is of type 'int'
     134 |                    struct user_namespace *fs_userns, vfsuid_t vfsuid);
         |                    ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h: In function 'i_gid_into_vfsgid':
>> include/linux/fs.h:1899:35: warning: passing argument 2 of 'make_vfsgid' makes pointer from integer without a cast [-Wint-conversion]
    1899 |         return make_vfsgid(idmap, i_user_ns(inode), inode->i_gid);
         |                                   ^~~~~~~~~~~~~~~~
         |                                   |
         |                                   int
   In file included from include/linux/fs.h:44,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/mnt_idmapping.h:131:45: note: expected 'struct user_namespace *' but argument is of type 'int'
     131 |                      struct user_namespace *fs_userns, kgid_t kgid);
         |                      ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h: In function 'i_gid_update':
>> include/linux/fs.h:1936:51: warning: passing argument 2 of 'from_vfsgid' makes pointer from integer without a cast [-Wint-conversion]
    1936 |                 inode->i_gid = from_vfsgid(idmap, i_user_ns(inode),
         |                                                   ^~~~~~~~~~~~~~~~
         |                                                   |
         |                                                   int
   In file included from include/linux/fs.h:44,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/mnt_idmapping.h:137:43: note: expected 'struct user_namespace *' but argument is of type 'int'
     137 |                    struct user_namespace *fs_userns, vfsgid_t vfsgid);
         |                    ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h: In function 'inode_fsuid_set':
>> include/linux/fs.h:1951:44: warning: passing argument 2 of 'mapped_fsuid' makes pointer from integer without a cast [-Wint-conversion]
    1951 |         inode->i_uid = mapped_fsuid(idmap, i_user_ns(inode));
         |                                            ^~~~~~~~~~~~~~~~
         |                                            |
         |                                            int
   In file included from include/linux/fs.h:44,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/mnt_idmapping.h:229:58: note: expected 'struct user_namespace *' but argument is of type 'int'
     229 |                                   struct user_namespace *fs_userns)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h: In function 'inode_fsgid_set':
>> include/linux/fs.h:1965:44: warning: passing argument 2 of 'mapped_fsgid' makes pointer from integer without a cast [-Wint-conversion]
    1965 |         inode->i_gid = mapped_fsgid(idmap, i_user_ns(inode));
         |                                            ^~~~~~~~~~~~~~~~
         |                                            |
         |                                            int
   In file included from include/linux/fs.h:44,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/mnt_idmapping.h:248:58: note: expected 'struct user_namespace *' but argument is of type 'int'
     248 |                                   struct user_namespace *fs_userns)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h: At top level:
   include/linux/fs.h:3391:1: error: version control conflict marker in file
    3391 | <<<<<<< HEAD
         | ^~~~~~~
   include/linux/fs.h:3393:18: error: conflicting types for 'sb_min_blocksize'; have 'int(struct super_block *, int)'
    3393 | int __must_check sb_min_blocksize(struct super_block *sb, int size);
         |                  ^~~~~~~~~~~~~~~~
   In file included from include/linux/fs.h:5,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs_super.h:226:5: note: previous declaration of 'sb_min_blocksize' with type 'int(struct super_block *, int)'
     226 | int sb_min_blocksize(struct super_block *sb, int size);
         |     ^~~~~~~~~~~~~~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h:3395:1: error: expected identifier or '(' before '||' token
    3395 | ||||||| dcb6fa37fd7b
         | ^~
   include/linux/fs.h:3397:12: error: conflicting types for 'sb_min_blocksize'; have 'int(struct super_block *, int)'
    3397 | extern int sb_min_blocksize(struct super_block *, int);
         |            ^~~~~~~~~~~~~~~~
   In file included from include/linux/fs.h:5,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs_super.h:226:5: note: previous declaration of 'sb_min_blocksize' with type 'int(struct super_block *, int)'
     226 | int sb_min_blocksize(struct super_block *sb, int size);
         |     ^~~~~~~~~~~~~~~~
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:10:
   include/linux/fs.h:3399:1: error: version control conflict marker in file
    3399 | =======
         | ^~~~~~~
   include/linux/fs.h:3400:13: error: too many decimal points in number
    3400 | >>>>>>> vfs-6.19.fs_header
         |             ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:182: arch/nios2/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/from_kuid +1818 include/linux/fs.h

a1ec9040a2a912 Christian Brauner 2021-12-03  1810  
81754357770ebd Seth Forshee      2014-12-11  1811  /* Helper functions so that in most cases filesystems will
81754357770ebd Seth Forshee      2014-12-11  1812   * not need to deal directly with kuid_t and kgid_t and can
81754357770ebd Seth Forshee      2014-12-11  1813   * instead deal with the raw numeric values that are stored
81754357770ebd Seth Forshee      2014-12-11  1814   * in the filesystem.
81754357770ebd Seth Forshee      2014-12-11  1815   */
81754357770ebd Seth Forshee      2014-12-11  1816  static inline uid_t i_uid_read(const struct inode *inode)
81754357770ebd Seth Forshee      2014-12-11  1817  {
a1ec9040a2a912 Christian Brauner 2021-12-03 @1818  	return from_kuid(i_user_ns(inode), inode->i_uid);
81754357770ebd Seth Forshee      2014-12-11  1819  }
81754357770ebd Seth Forshee      2014-12-11  1820  
81754357770ebd Seth Forshee      2014-12-11  1821  static inline gid_t i_gid_read(const struct inode *inode)
81754357770ebd Seth Forshee      2014-12-11  1822  {
a1ec9040a2a912 Christian Brauner 2021-12-03 @1823  	return from_kgid(i_user_ns(inode), inode->i_gid);
81754357770ebd Seth Forshee      2014-12-11  1824  }
81754357770ebd Seth Forshee      2014-12-11  1825  
81754357770ebd Seth Forshee      2014-12-11  1826  static inline void i_uid_write(struct inode *inode, uid_t uid)
81754357770ebd Seth Forshee      2014-12-11  1827  {
a1ec9040a2a912 Christian Brauner 2021-12-03 @1828  	inode->i_uid = make_kuid(i_user_ns(inode), uid);
81754357770ebd Seth Forshee      2014-12-11  1829  }
81754357770ebd Seth Forshee      2014-12-11  1830  
81754357770ebd Seth Forshee      2014-12-11  1831  static inline void i_gid_write(struct inode *inode, gid_t gid)
81754357770ebd Seth Forshee      2014-12-11  1832  {
a1ec9040a2a912 Christian Brauner 2021-12-03 @1833  	inode->i_gid = make_kgid(i_user_ns(inode), gid);
81754357770ebd Seth Forshee      2014-12-11  1834  }
81754357770ebd Seth Forshee      2014-12-11  1835  
234a3113f28d02 Christian Brauner 2022-06-21  1836  /**
e67fe63341b811 Christian Brauner 2023-01-13  1837   * i_uid_into_vfsuid - map an inode's i_uid down according to an idmapping
e67fe63341b811 Christian Brauner 2023-01-13  1838   * @idmap: idmap of the mount the inode was found from
234a3113f28d02 Christian Brauner 2022-06-21  1839   * @inode: inode to map
234a3113f28d02 Christian Brauner 2022-06-21  1840   *
e67fe63341b811 Christian Brauner 2023-01-13  1841   * Return: whe inode's i_uid mapped down according to @idmap.
234a3113f28d02 Christian Brauner 2022-06-21  1842   * If the inode's i_uid has no mapping INVALID_VFSUID is returned.
234a3113f28d02 Christian Brauner 2022-06-21  1843   */
e67fe63341b811 Christian Brauner 2023-01-13  1844  static inline vfsuid_t i_uid_into_vfsuid(struct mnt_idmap *idmap,
234a3113f28d02 Christian Brauner 2022-06-21  1845  					 const struct inode *inode)
234a3113f28d02 Christian Brauner 2022-06-21  1846  {
4d7ca4090184c1 Christian Brauner 2023-01-13 @1847  	return make_vfsuid(idmap, i_user_ns(inode), inode->i_uid);
e6c9a71451560e Christian Brauner 2021-01-21  1848  }
e6c9a71451560e Christian Brauner 2021-01-21  1849  
1f36146a5a3dc6 Christian Brauner 2022-06-21  1850  /**
1f36146a5a3dc6 Christian Brauner 2022-06-21  1851   * i_uid_needs_update - check whether inode's i_uid needs to be updated
0dbe12f2e49c04 Christian Brauner 2023-01-13  1852   * @idmap: idmap of the mount the inode was found from
1f36146a5a3dc6 Christian Brauner 2022-06-21  1853   * @attr: the new attributes of @inode
1f36146a5a3dc6 Christian Brauner 2022-06-21  1854   * @inode: the inode to update
1f36146a5a3dc6 Christian Brauner 2022-06-21  1855   *
1f36146a5a3dc6 Christian Brauner 2022-06-21  1856   * Check whether the $inode's i_uid field needs to be updated taking idmapped
1f36146a5a3dc6 Christian Brauner 2022-06-21  1857   * mounts into account if the filesystem supports it.
1f36146a5a3dc6 Christian Brauner 2022-06-21  1858   *
1f36146a5a3dc6 Christian Brauner 2022-06-21  1859   * Return: true if @inode's i_uid field needs to be updated, false if not.
1f36146a5a3dc6 Christian Brauner 2022-06-21  1860   */
0dbe12f2e49c04 Christian Brauner 2023-01-13  1861  static inline bool i_uid_needs_update(struct mnt_idmap *idmap,
1f36146a5a3dc6 Christian Brauner 2022-06-21  1862  				      const struct iattr *attr,
1f36146a5a3dc6 Christian Brauner 2022-06-21  1863  				      const struct inode *inode)
1f36146a5a3dc6 Christian Brauner 2022-06-21  1864  {
1f36146a5a3dc6 Christian Brauner 2022-06-21  1865  	return ((attr->ia_valid & ATTR_UID) &&
1f36146a5a3dc6 Christian Brauner 2022-06-21  1866  		!vfsuid_eq(attr->ia_vfsuid,
e67fe63341b811 Christian Brauner 2023-01-13  1867  			   i_uid_into_vfsuid(idmap, inode)));
1f36146a5a3dc6 Christian Brauner 2022-06-21  1868  }
1f36146a5a3dc6 Christian Brauner 2022-06-21  1869  
1f36146a5a3dc6 Christian Brauner 2022-06-21  1870  /**
1f36146a5a3dc6 Christian Brauner 2022-06-21  1871   * i_uid_update - update @inode's i_uid field
0dbe12f2e49c04 Christian Brauner 2023-01-13  1872   * @idmap: idmap of the mount the inode was found from
1f36146a5a3dc6 Christian Brauner 2022-06-21  1873   * @attr: the new attributes of @inode
1f36146a5a3dc6 Christian Brauner 2022-06-21  1874   * @inode: the inode to update
1f36146a5a3dc6 Christian Brauner 2022-06-21  1875   *
1f36146a5a3dc6 Christian Brauner 2022-06-21  1876   * Safely update @inode's i_uid field translating the vfsuid of any idmapped
1f36146a5a3dc6 Christian Brauner 2022-06-21  1877   * mount into the filesystem kuid.
1f36146a5a3dc6 Christian Brauner 2022-06-21  1878   */
0dbe12f2e49c04 Christian Brauner 2023-01-13  1879  static inline void i_uid_update(struct mnt_idmap *idmap,
1f36146a5a3dc6 Christian Brauner 2022-06-21  1880  				const struct iattr *attr,
1f36146a5a3dc6 Christian Brauner 2022-06-21  1881  				struct inode *inode)
1f36146a5a3dc6 Christian Brauner 2022-06-21  1882  {
1f36146a5a3dc6 Christian Brauner 2022-06-21  1883  	if (attr->ia_valid & ATTR_UID)
4d7ca4090184c1 Christian Brauner 2023-01-13 @1884  		inode->i_uid = from_vfsuid(idmap, i_user_ns(inode),
1f36146a5a3dc6 Christian Brauner 2022-06-21  1885  					   attr->ia_vfsuid);
1f36146a5a3dc6 Christian Brauner 2022-06-21  1886  }
1f36146a5a3dc6 Christian Brauner 2022-06-21  1887  
234a3113f28d02 Christian Brauner 2022-06-21  1888  /**
e67fe63341b811 Christian Brauner 2023-01-13  1889   * i_gid_into_vfsgid - map an inode's i_gid down according to an idmapping
e67fe63341b811 Christian Brauner 2023-01-13  1890   * @idmap: idmap of the mount the inode was found from
234a3113f28d02 Christian Brauner 2022-06-21  1891   * @inode: inode to map
234a3113f28d02 Christian Brauner 2022-06-21  1892   *
e67fe63341b811 Christian Brauner 2023-01-13  1893   * Return: the inode's i_gid mapped down according to @idmap.
234a3113f28d02 Christian Brauner 2022-06-21  1894   * If the inode's i_gid has no mapping INVALID_VFSGID is returned.
234a3113f28d02 Christian Brauner 2022-06-21  1895   */
e67fe63341b811 Christian Brauner 2023-01-13  1896  static inline vfsgid_t i_gid_into_vfsgid(struct mnt_idmap *idmap,
234a3113f28d02 Christian Brauner 2022-06-21  1897  					 const struct inode *inode)
234a3113f28d02 Christian Brauner 2022-06-21  1898  {
4d7ca4090184c1 Christian Brauner 2023-01-13 @1899  	return make_vfsgid(idmap, i_user_ns(inode), inode->i_gid);
e6c9a71451560e Christian Brauner 2021-01-21  1900  }
e6c9a71451560e Christian Brauner 2021-01-21  1901  
1f36146a5a3dc6 Christian Brauner 2022-06-21  1902  /**
1f36146a5a3dc6 Christian Brauner 2022-06-21  1903   * i_gid_needs_update - check whether inode's i_gid needs to be updated
0dbe12f2e49c04 Christian Brauner 2023-01-13  1904   * @idmap: idmap of the mount the inode was found from
1f36146a5a3dc6 Christian Brauner 2022-06-21  1905   * @attr: the new attributes of @inode
1f36146a5a3dc6 Christian Brauner 2022-06-21  1906   * @inode: the inode to update
1f36146a5a3dc6 Christian Brauner 2022-06-21  1907   *
1f36146a5a3dc6 Christian Brauner 2022-06-21  1908   * Check whether the $inode's i_gid field needs to be updated taking idmapped
1f36146a5a3dc6 Christian Brauner 2022-06-21  1909   * mounts into account if the filesystem supports it.
1f36146a5a3dc6 Christian Brauner 2022-06-21  1910   *
1f36146a5a3dc6 Christian Brauner 2022-06-21  1911   * Return: true if @inode's i_gid field needs to be updated, false if not.
1f36146a5a3dc6 Christian Brauner 2022-06-21  1912   */
0dbe12f2e49c04 Christian Brauner 2023-01-13  1913  static inline bool i_gid_needs_update(struct mnt_idmap *idmap,
1f36146a5a3dc6 Christian Brauner 2022-06-21  1914  				      const struct iattr *attr,
1f36146a5a3dc6 Christian Brauner 2022-06-21  1915  				      const struct inode *inode)
1f36146a5a3dc6 Christian Brauner 2022-06-21  1916  {
1f36146a5a3dc6 Christian Brauner 2022-06-21  1917  	return ((attr->ia_valid & ATTR_GID) &&
1f36146a5a3dc6 Christian Brauner 2022-06-21  1918  		!vfsgid_eq(attr->ia_vfsgid,
e67fe63341b811 Christian Brauner 2023-01-13  1919  			   i_gid_into_vfsgid(idmap, inode)));
1f36146a5a3dc6 Christian Brauner 2022-06-21  1920  }
1f36146a5a3dc6 Christian Brauner 2022-06-21  1921  
1f36146a5a3dc6 Christian Brauner 2022-06-21  1922  /**
1f36146a5a3dc6 Christian Brauner 2022-06-21  1923   * i_gid_update - update @inode's i_gid field
0dbe12f2e49c04 Christian Brauner 2023-01-13  1924   * @idmap: idmap of the mount the inode was found from
1f36146a5a3dc6 Christian Brauner 2022-06-21  1925   * @attr: the new attributes of @inode
1f36146a5a3dc6 Christian Brauner 2022-06-21  1926   * @inode: the inode to update
1f36146a5a3dc6 Christian Brauner 2022-06-21  1927   *
1f36146a5a3dc6 Christian Brauner 2022-06-21  1928   * Safely update @inode's i_gid field translating the vfsgid of any idmapped
1f36146a5a3dc6 Christian Brauner 2022-06-21  1929   * mount into the filesystem kgid.
1f36146a5a3dc6 Christian Brauner 2022-06-21  1930   */
0dbe12f2e49c04 Christian Brauner 2023-01-13  1931  static inline void i_gid_update(struct mnt_idmap *idmap,
1f36146a5a3dc6 Christian Brauner 2022-06-21  1932  				const struct iattr *attr,
1f36146a5a3dc6 Christian Brauner 2022-06-21  1933  				struct inode *inode)
1f36146a5a3dc6 Christian Brauner 2022-06-21  1934  {
1f36146a5a3dc6 Christian Brauner 2022-06-21  1935  	if (attr->ia_valid & ATTR_GID)
4d7ca4090184c1 Christian Brauner 2023-01-13 @1936  		inode->i_gid = from_vfsgid(idmap, i_user_ns(inode),
1f36146a5a3dc6 Christian Brauner 2022-06-21  1937  					   attr->ia_vfsgid);
1f36146a5a3dc6 Christian Brauner 2022-06-21  1938  }
1f36146a5a3dc6 Christian Brauner 2022-06-21  1939  
db998553cf11dd Christian Brauner 2021-03-20  1940  /**
db998553cf11dd Christian Brauner 2021-03-20  1941   * inode_fsuid_set - initialize inode's i_uid field with callers fsuid
db998553cf11dd Christian Brauner 2021-03-20  1942   * @inode: inode to initialize
c14329d39f2daa Christian Brauner 2023-01-13  1943   * @idmap: idmap of the mount the inode was found from
db998553cf11dd Christian Brauner 2021-03-20  1944   *
db998553cf11dd Christian Brauner 2021-03-20  1945   * Initialize the i_uid field of @inode. If the inode was found/created via
c14329d39f2daa Christian Brauner 2023-01-13  1946   * an idmapped mount map the caller's fsuid according to @idmap.
db998553cf11dd Christian Brauner 2021-03-20  1947   */
db998553cf11dd Christian Brauner 2021-03-20  1948  static inline void inode_fsuid_set(struct inode *inode,
c14329d39f2daa Christian Brauner 2023-01-13  1949  				   struct mnt_idmap *idmap)
db998553cf11dd Christian Brauner 2021-03-20  1950  {
c14329d39f2daa Christian Brauner 2023-01-13 @1951  	inode->i_uid = mapped_fsuid(idmap, i_user_ns(inode));
db998553cf11dd Christian Brauner 2021-03-20  1952  }
db998553cf11dd Christian Brauner 2021-03-20  1953  
db998553cf11dd Christian Brauner 2021-03-20  1954  /**
db998553cf11dd Christian Brauner 2021-03-20  1955   * inode_fsgid_set - initialize inode's i_gid field with callers fsgid
db998553cf11dd Christian Brauner 2021-03-20  1956   * @inode: inode to initialize
c14329d39f2daa Christian Brauner 2023-01-13  1957   * @idmap: idmap of the mount the inode was found from
db998553cf11dd Christian Brauner 2021-03-20  1958   *
db998553cf11dd Christian Brauner 2021-03-20  1959   * Initialize the i_gid field of @inode. If the inode was found/created via
c14329d39f2daa Christian Brauner 2023-01-13  1960   * an idmapped mount map the caller's fsgid according to @idmap.
db998553cf11dd Christian Brauner 2021-03-20  1961   */
db998553cf11dd Christian Brauner 2021-03-20  1962  static inline void inode_fsgid_set(struct inode *inode,
c14329d39f2daa Christian Brauner 2023-01-13  1963  				   struct mnt_idmap *idmap)
db998553cf11dd Christian Brauner 2021-03-20  1964  {
c14329d39f2daa Christian Brauner 2023-01-13 @1965  	inode->i_gid = mapped_fsgid(idmap, i_user_ns(inode));
db998553cf11dd Christian Brauner 2021-03-20  1966  }
db998553cf11dd Christian Brauner 2021-03-20  1967  

:::::: The code at line 1818 was first introduced by commit
:::::: a1ec9040a2a9122605ac26e5725c6de019184419 fs: add i_user_ns() helper

:::::: TO: Christian Brauner <christian.brauner@ubuntu.com>
:::::: CC: Christian Brauner <christian.brauner@ubuntu.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
