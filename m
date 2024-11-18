Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F26A38FAD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731899949; cv=none; b=Yx4mN6gZ3RS8TszU3UV7Zzd573vY22e8bHpbi3SRhEmBXxvO8o7TK/VqlXMqvNMRWo22KDTsBoLpg7+WSlQOODMMjCSS/aptRHyseBh7uY69u7KlfKlS7WLNmkR6kYDPnuDbdUhOzZ3qnUO2QjZOTCNoV7HUJBvOjoQUmFDakRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731899949; c=relaxed/simple;
	bh=S/Tpq0SP/hL62zv9owTat0IAiTdlBRdFsQkkq8Y7d1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c4Zkp9GR2bZptc6OHGkU6KpowTR+noDKHHwYygUbMjfQzsdSzBbXy08nua1Y7q9dR7ZtkX3bLKI+4kzHmjAkW11hp1KmRpkfb7JUSHHvIkJVZYfCo7bmM+hUToZNDXFJxSKI184wQNGVq/RNCDbvcqCTSJUKQuq3dKmC1y/pl0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmTqpvgS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmTqpvgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731899947; x=1763435947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S/Tpq0SP/hL62zv9owTat0IAiTdlBRdFsQkkq8Y7d1Q=;
  b=DmTqpvgSHyWRfnvQlnw/CNzBuNpK3L6d9IP4y8rwNby/nMcTdznb8B1o
   zYkVcZduos+k1x54UjST/GCZzGfHzZWJ3YlUzjKQFhweaUOca0JJPXavm
   kRxg/tJEcI7gBNw52669KBp+3fhIlW/P7K7RbDZwpqWDptJ1i7+/Yo55u
   aCamCegJ7SiL3b52zS+V4r8SnOgD+nU5LiwY8+YaJjdZHadDsnKG12GS+
   M0gIkCvTCs5jSY5fPGWxCE8AL4xliAZNkAbufsBfvJIR0sr3+00Zv/S/0
   z5wjXbf/u7HF2xKtDGaWIDaLObpLZzIybzhUtx5+cvGyLJpZcdVQxQDRa
   Q==;
X-CSE-ConnectionGUID: P2lI4k1WQMWqI3CmaPd62g==
X-CSE-MsgGUID: EVWHk9MzQDeweRi3eCqJHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31761366"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31761366"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 19:19:06 -0800
X-CSE-ConnectionGUID: VSEdZ193T9u6AcA+rcE6qQ==
X-CSE-MsgGUID: lDJENThMQmiyKLOeFfAdaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="93552164"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2024 19:19:05 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCsI2-0002F6-1Y;
	Mon, 18 Nov 2024 03:19:02 +0000
Date: Mon, 18 Nov 2024 11:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/170-atcphy 12/17]
 include/uapi/asm-generic/errno.h:7:9: warning: "EDEADLK" redefined
Message-ID: <202411181143.zSOvqd71-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   58c27a2b420c2f6e49fdef1ce8b065e01a10f00c
commit: 8b3a6695d5a442570466a67443a79d6a99a32ec4 [12/17] phy: apple: atc: support mode switches in atcphy_dpphy_set_mode()
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20241118/202411181143.zSOvqd71-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181143.zSOvqd71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181143.zSOvqd71-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/phy/apple/atc.c:12:
>> include/uapi/asm-generic/errno.h:7:9: warning: "EDEADLK" redefined
       7 | #define EDEADLK         35      /* Resource deadlock would occur */
         |         ^~~~~~~
   In file included from include/uapi/linux/errno.h:1,
                    from include/linux/errno.h:5,
                    from include/linux/smp.h:10,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from drivers/phy/apple/atc.h:12,
                    from drivers/phy/apple/atc.c:9:
   arch/parisc/include/uapi/asm/errno.h:17:9: note: this is the location of the previous definition
      17 | #define EDEADLK         45      /* Resource deadlock would occur */
         |         ^~~~~~~
>> include/uapi/asm-generic/errno.h:8:9: warning: "ENAMETOOLONG" redefined
       8 | #define ENAMETOOLONG    36      /* File name too long */
         |         ^~~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:110:9: note: this is the location of the previous definition
     110 | #define ENAMETOOLONG    248     /* File name too long */
         |         ^~~~~~~~~~~~
>> include/uapi/asm-generic/errno.h:9:9: warning: "ENOLCK" redefined
       9 | #define ENOLCK          37      /* No record locks available */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:19:9: note: this is the location of the previous definition
      19 | #define ENOLCK          46      /* No record locks available */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:18:9: warning: "ENOSYS" redefined
      18 | #define ENOSYS          38      /* Invalid system call number */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:112:9: note: this is the location of the previous definition
     112 | #define ENOSYS          251     /* Function not implemented */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:20:9: warning: "ENOTEMPTY" redefined
      20 | #define ENOTEMPTY       39      /* Directory not empty */
         |         ^~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:109:9: note: this is the location of the previous definition
     109 | #define ENOTEMPTY       247     /* Directory not empty */
         |         ^~~~~~~~~
>> include/uapi/asm-generic/errno.h:21:9: warning: "ELOOP" redefined
      21 | #define ELOOP           40      /* Too many symbolic links encountered */
         |         ^~~~~
   arch/parisc/include/uapi/asm/errno.h:111:9: note: this is the location of the previous definition
     111 | #define ELOOP           249     /* Too many symbolic links encountered */
         |         ^~~~~
>> include/uapi/asm-generic/errno.h:23:9: warning: "ENOMSG" redefined
      23 | #define ENOMSG          42      /* No message of desired type */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:7:9: note: this is the location of the previous definition
       7 | #define ENOMSG          35      /* No message of desired type */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:24:9: warning: "EIDRM" redefined
      24 | #define EIDRM           43      /* Identifier removed */
         |         ^~~~~
   arch/parisc/include/uapi/asm/errno.h:8:9: note: this is the location of the previous definition
       8 | #define EIDRM           36      /* Identifier removed */
         |         ^~~~~
>> include/uapi/asm-generic/errno.h:25:9: warning: "ECHRNG" redefined
      25 | #define ECHRNG          44      /* Channel number out of range */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:9:9: note: this is the location of the previous definition
       9 | #define ECHRNG          37      /* Channel number out of range */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:26:9: warning: "EL2NSYNC" redefined
      26 | #define EL2NSYNC        45      /* Level 2 not synchronized */
         |         ^~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:10:9: note: this is the location of the previous definition
      10 | #define EL2NSYNC        38      /* Level 2 not synchronized */
         |         ^~~~~~~~
>> include/uapi/asm-generic/errno.h:27:9: warning: "EL3HLT" redefined
      27 | #define EL3HLT          46      /* Level 3 halted */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:11:9: note: this is the location of the previous definition
      11 | #define EL3HLT          39      /* Level 3 halted */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:28:9: warning: "EL3RST" redefined
      28 | #define EL3RST          47      /* Level 3 reset */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:12:9: note: this is the location of the previous definition
      12 | #define EL3RST          40      /* Level 3 reset */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:29:9: warning: "ELNRNG" redefined
      29 | #define ELNRNG          48      /* Link number out of range */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:13:9: note: this is the location of the previous definition
      13 | #define ELNRNG          41      /* Link number out of range */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:30:9: warning: "EUNATCH" redefined
      30 | #define EUNATCH         49      /* Protocol driver not attached */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:14:9: note: this is the location of the previous definition
      14 | #define EUNATCH         42      /* Protocol driver not attached */
         |         ^~~~~~~
>> include/uapi/asm-generic/errno.h:31:9: warning: "ENOCSI" redefined
      31 | #define ENOCSI          50      /* No CSI structure available */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:15:9: note: this is the location of the previous definition
      15 | #define ENOCSI          43      /* No CSI structure available */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:32:9: warning: "EL2HLT" redefined
      32 | #define EL2HLT          51      /* Level 2 halted */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:16:9: note: this is the location of the previous definition
      16 | #define EL2HLT          44      /* Level 2 halted */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:33:9: warning: "EBADE" redefined
      33 | #define EBADE           52      /* Invalid exchange */
         |         ^~~~~
   arch/parisc/include/uapi/asm/errno.h:47:9: note: this is the location of the previous definition
      47 | #define EBADE           160     /* Invalid exchange */
         |         ^~~~~
>> include/uapi/asm-generic/errno.h:34:9: warning: "EBADR" redefined
      34 | #define EBADR           53      /* Invalid request descriptor */
         |         ^~~~~
   arch/parisc/include/uapi/asm/errno.h:48:9: note: this is the location of the previous definition
      48 | #define EBADR           161     /* Invalid request descriptor */
         |         ^~~~~
>> include/uapi/asm-generic/errno.h:35:9: warning: "EXFULL" redefined
      35 | #define EXFULL          54      /* Exchange full */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:49:9: note: this is the location of the previous definition
      49 | #define EXFULL          162     /* Exchange full */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:36:9: warning: "ENOANO" redefined
      36 | #define ENOANO          55      /* No anode */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:50:9: note: this is the location of the previous definition
      50 | #define ENOANO          163     /* No anode */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:37:9: warning: "EBADRQC" redefined
      37 | #define EBADRQC         56      /* Invalid request code */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:51:9: note: this is the location of the previous definition
      51 | #define EBADRQC         164     /* Invalid request code */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:38:9: warning: "EBADSLT" redefined
      38 | #define EBADSLT         57      /* Invalid slot */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:52:9: note: this is the location of the previous definition
      52 | #define EBADSLT         165     /* Invalid slot */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:42:9: warning: "EBFONT" redefined
      42 | #define EBFONT          59      /* Bad font file format */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:53:9: note: this is the location of the previous definition
      53 | #define EBFONT          166     /* Bad font file format */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:43:9: warning: "ENOSTR" redefined
      43 | #define ENOSTR          60      /* Device not a stream */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:26:9: note: this is the location of the previous definition
      26 | #define ENOSTR          54      /* Device not a stream */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:44:9: warning: "ENODATA" redefined
      44 | #define ENODATA         61      /* No data available */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:23:9: note: this is the location of the previous definition
      23 | #define ENODATA         51      /* No data available */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:45:9: warning: "ETIME" redefined
      45 | #define ETIME           62      /* Timer expired */
         |         ^~~~~
   arch/parisc/include/uapi/asm/errno.h:24:9: note: this is the location of the previous definition
      24 | #define ETIME           52      /* Timer expired */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:46:9: warning: "ENOSR" redefined
      46 | #define ENOSR           63      /* Out of streams resources */
         |         ^~~~~
   arch/parisc/include/uapi/asm/errno.h:25:9: note: this is the location of the previous definition
      25 | #define ENOSR           53      /* Out of streams resources */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:47:9: warning: "ENONET" redefined
      47 | #define ENONET          64      /* Machine is not on the network */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:22:9: note: this is the location of the previous definition
      22 | #define ENONET          50      /* Machine is not on the network */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:48:9: warning: "ENOPKG" redefined
      48 | #define ENOPKG          65      /* Package not installed */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:27:9: note: this is the location of the previous definition
      27 | #define ENOPKG          55      /* Package not installed */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:49:9: warning: "EREMOTE" redefined
      49 | #define EREMOTE         66      /* Object is remote */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:42:9: note: this is the location of the previous definition
      42 | #define EREMOTE         71      /* Object is remote */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:50:9: warning: "ENOLINK" redefined
      50 | #define ENOLINK         67      /* Link has been severed */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:29:9: note: this is the location of the previous definition
      29 | #define ENOLINK         57      /* Link has been severed */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:51:9: warning: "EADV" redefined
      51 | #define EADV            68      /* Advertise error */
         |         ^~~~
   arch/parisc/include/uapi/asm/errno.h:30:9: note: this is the location of the previous definition
      30 | #define EADV            58      /* Advertise error */
         |         ^~~~
   include/uapi/asm-generic/errno.h:52:9: warning: "ESRMNT" redefined
      52 | #define ESRMNT          69      /* Srmount error */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:31:9: note: this is the location of the previous definition
      31 | #define ESRMNT          59      /* Srmount error */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:53:9: warning: "ECOMM" redefined
      53 | #define ECOMM           70      /* Communication error on send */
         |         ^~~~~
   arch/parisc/include/uapi/asm/errno.h:32:9: note: this is the location of the previous definition
      32 | #define ECOMM           60      /* Communication error on send */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:54:9: warning: "EPROTO" redefined
      54 | #define EPROTO          71      /* Protocol error */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:33:9: note: this is the location of the previous definition
      33 | #define EPROTO          61      /* Protocol error */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:55:9: warning: "EMULTIHOP" redefined
      55 | #define EMULTIHOP       72      /* Multihop attempted */
         |         ^~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:35:9: note: this is the location of the previous definition
      35 | #define EMULTIHOP       64      /* Multihop attempted */


vim +/EDEADLK +7 include/uapi/asm-generic/errno.h

^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16    6  
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   @7  #define	EDEADLK		35	/* Resource deadlock would occur */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   @8  #define	ENAMETOOLONG	36	/* File name too long */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   @9  #define	ENOLCK		37	/* No record locks available */
e15f431fe2d53c include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   10  
e15f431fe2d53c include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   11  /*
e15f431fe2d53c include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   12   * This error code is special: arch syscall entry code will return
e15f431fe2d53c include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   13   * -ENOSYS if users try to call a syscall that doesn't exist.  To keep
e15f431fe2d53c include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   14   * failures of syscalls that really do exist distinguishable from
e15f431fe2d53c include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   15   * failures due to attempts to use a nonexistent syscall, syscall
e15f431fe2d53c include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   16   * implementations should refrain from returning -ENOSYS.
e15f431fe2d53c include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   17   */
e15f431fe2d53c include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16  @18  #define	ENOSYS		38	/* Invalid system call number */
e15f431fe2d53c include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   19  
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @20  #define	ENOTEMPTY	39	/* Directory not empty */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @21  #define	ELOOP		40	/* Too many symbolic links encountered */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   22  #define	EWOULDBLOCK	EAGAIN	/* Operation would block */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @23  #define	ENOMSG		42	/* No message of desired type */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @24  #define	EIDRM		43	/* Identifier removed */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @25  #define	ECHRNG		44	/* Channel number out of range */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @26  #define	EL2NSYNC	45	/* Level 2 not synchronized */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @27  #define	EL3HLT		46	/* Level 3 halted */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @28  #define	EL3RST		47	/* Level 3 reset */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @29  #define	ELNRNG		48	/* Link number out of range */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @30  #define	EUNATCH		49	/* Protocol driver not attached */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @31  #define	ENOCSI		50	/* No CSI structure available */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @32  #define	EL2HLT		51	/* Level 2 halted */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @33  #define	EBADE		52	/* Invalid exchange */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @34  #define	EBADR		53	/* Invalid request descriptor */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @35  #define	EXFULL		54	/* Exchange full */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @36  #define	ENOANO		55	/* No anode */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @37  #define	EBADRQC		56	/* Invalid request code */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @38  #define	EBADSLT		57	/* Invalid slot */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   39  
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   40  #define	EDEADLOCK	EDEADLK
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   41  
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @42  #define	EBFONT		59	/* Bad font file format */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @43  #define	ENOSTR		60	/* Device not a stream */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @44  #define	ENODATA		61	/* No data available */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @45  #define	ETIME		62	/* Timer expired */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @46  #define	ENOSR		63	/* Out of streams resources */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @47  #define	ENONET		64	/* Machine is not on the network */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @48  #define	ENOPKG		65	/* Package not installed */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @49  #define	EREMOTE		66	/* Object is remote */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @50  #define	ENOLINK		67	/* Link has been severed */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @51  #define	EADV		68	/* Advertise error */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @52  #define	ESRMNT		69	/* Srmount error */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @53  #define	ECOMM		70	/* Communication error on send */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @54  #define	EPROTO		71	/* Protocol error */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @55  #define	EMULTIHOP	72	/* Multihop attempted */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @56  #define	EDOTDOT		73	/* RFS specific error */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @57  #define	EBADMSG		74	/* Not a data message */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @58  #define	EOVERFLOW	75	/* Value too large for defined data type */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @59  #define	ENOTUNIQ	76	/* Name not unique on network */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @60  #define	EBADFD		77	/* File descriptor in bad state */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @61  #define	EREMCHG		78	/* Remote address changed */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @62  #define	ELIBACC		79	/* Can not access a needed shared library */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @63  #define	ELIBBAD		80	/* Accessing a corrupted shared library */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @64  #define	ELIBSCN		81	/* .lib section in a.out corrupted */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @65  #define	ELIBMAX		82	/* Attempting to link in too many shared libraries */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @66  #define	ELIBEXEC	83	/* Cannot exec a shared library directly */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @67  #define	EILSEQ		84	/* Illegal byte sequence */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @68  #define	ERESTART	85	/* Interrupted system call should be restarted */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @69  #define	ESTRPIPE	86	/* Streams pipe error */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @70  #define	EUSERS		87	/* Too many users */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @71  #define	ENOTSOCK	88	/* Socket operation on non-socket */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @72  #define	EDESTADDRREQ	89	/* Destination address required */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @73  #define	EMSGSIZE	90	/* Message too long */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @74  #define	EPROTOTYPE	91	/* Protocol wrong type for socket */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @75  #define	ENOPROTOOPT	92	/* Protocol not available */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @76  #define	EPROTONOSUPPORT	93	/* Protocol not supported */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @77  #define	ESOCKTNOSUPPORT	94	/* Socket type not supported */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @78  #define	EOPNOTSUPP	95	/* Operation not supported on transport endpoint */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @79  #define	EPFNOSUPPORT	96	/* Protocol family not supported */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @80  #define	EAFNOSUPPORT	97	/* Address family not supported by protocol */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @81  #define	EADDRINUSE	98	/* Address already in use */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @82  #define	EADDRNOTAVAIL	99	/* Cannot assign requested address */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @83  #define	ENETDOWN	100	/* Network is down */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @84  #define	ENETUNREACH	101	/* Network is unreachable */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @85  #define	ENETRESET	102	/* Network dropped connection because of reset */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @86  #define	ECONNABORTED	103	/* Software caused connection abort */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @87  #define	ECONNRESET	104	/* Connection reset by peer */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @88  #define	ENOBUFS		105	/* No buffer space available */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @89  #define	EISCONN		106	/* Transport endpoint is already connected */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @90  #define	ENOTCONN	107	/* Transport endpoint is not connected */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @91  #define	ESHUTDOWN	108	/* Cannot send after transport endpoint shutdown */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @92  #define	ETOOMANYREFS	109	/* Too many references: cannot splice */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @93  #define	ETIMEDOUT	110	/* Connection timed out */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @94  #define	ECONNREFUSED	111	/* Connection refused */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @95  #define	EHOSTDOWN	112	/* Host is down */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @96  #define	EHOSTUNREACH	113	/* No route to host */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @97  #define	EALREADY	114	/* Operation already in progress */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @98  #define	EINPROGRESS	115	/* Operation now in progress */
0ca43435188b9f include/uapi/asm-generic/errno.h Eric Sandeen    2013-11-12  @99  #define	ESTALE		116	/* Stale file handle */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @100  #define	EUCLEAN		117	/* Structure needs cleaning */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @101  #define	ENOTNAM		118	/* Not a XENIX named type file */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @102  #define	ENAVAIL		119	/* No XENIX semaphores available */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @103  #define	EISNAM		120	/* Is a named type file */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @104  #define	EREMOTEIO	121	/* Remote I/O error */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @105  #define	EDQUOT		122	/* Quota exceeded */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  106  
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @107  #define	ENOMEDIUM	123	/* No medium found */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @108  #define	EMEDIUMTYPE	124	/* Wrong medium type */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @109  #define	ECANCELED	125	/* Operation Canceled */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @110  #define	ENOKEY		126	/* Required key not available */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @111  #define	EKEYEXPIRED	127	/* Key has expired */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @112  #define	EKEYREVOKED	128	/* Key has been revoked */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @113  #define	EKEYREJECTED	129	/* Key was rejected by service */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  114  
4750e2c0c59e0c include/asm-generic/errno.h      Joe Korty       2005-05-01  115  /* for robust mutexes */
4750e2c0c59e0c include/asm-generic/errno.h      Joe Korty       2005-05-01 @116  #define	EOWNERDEAD	130	/* Owner died */
4750e2c0c59e0c include/asm-generic/errno.h      Joe Korty       2005-05-01 @117  #define	ENOTRECOVERABLE	131	/* State not recoverable */
4750e2c0c59e0c include/asm-generic/errno.h      Joe Korty       2005-05-01  118  
1f87f7d3a3b42b include/asm-generic/errno.h      Johannes Berg   2009-06-02 @119  #define ERFKILL		132	/* Operation not possible due to RF-kill */
1f87f7d3a3b42b include/asm-generic/errno.h      Johannes Berg   2009-06-02  120  
69ebb83e13e514 include/asm-generic/errno.h      Huang Ying      2011-01-30 @121  #define EHWPOISON	133	/* Memory page has hardware error */
69ebb83e13e514 include/asm-generic/errno.h      Huang Ying      2011-01-30  122  

:::::: The code at line 7 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
