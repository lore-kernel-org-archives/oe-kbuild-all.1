Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ACD47D95E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360633; cv=none; b=LC5LhcoTsIX+nGSCk9PUcP4l/Tp/3c8oD9AZ22bySAl6jEj32SgdX9Pp2a9OgFi4SzUXRwcg6IU9O830XkX0dCGuSxf9oaHi0rC4beJ2iLE175PG38EjGRnNHqkoqgD09oN4l5jTyz/CaMkPTGMI20IsF1LGR1FsjKeOcBMXig4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360633; c=relaxed/simple;
	bh=1xUL+e6C4pryHQpY4YnGmszhwdjLByxzsk5gdZNUlQk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ujag7oY/bYcQVjnvclMiKwwj9thsRx6YHY6s15Q0Fkvbr0Q3NJU8umuhAZIqP3i7Dfwr0R2bDuWw2yFh1em/PjrVEXVS3Uxi0QEObHl12nZXNl0OGGvOLY+A4X+L+U9MzJEsYHhZewnQ4VOkS3gf8aVfyTefz7dUoX3DbD+47mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmmpgbC7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmmpgbC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788360631; x=1819896631;
  h=date:from:to:cc:subject:message-id;
  bh=1xUL+e6C4pryHQpY4YnGmszhwdjLByxzsk5gdZNUlQk=;
  b=gmmpgbC7fupO2f04ojZZ+neAjqFbsn56ATr6v8YhR1HMDAEZwyEaA7pi
   UWBW55mdVaYBANxAM8gLqOJMpt1MNH1xbKBHByzfTmgn4ZtNMOZk4u01n
   6RyUC7Jqj61UYBmzc+086j1P8d3yKYFgULzIvjmg7IyjZLFyul+mGMeZU
   +wP1+cAj+3la5PVFO6CcA5zTicUvFLSYSt3eT4PyjliIjjkmEFGtLolz/
   TaXas+WFFUavcFSSz2rsAHDO9Q0/qEebbrkCdZsGF9kOkFrfSarSwnkOl
   /kHto/wW23VgZzAQFNLoFoRzpTNukfPrgFNFnUHUtuyPXHgeFeWTd189/
   w==;
X-CSE-ConnectionGUID: Na+5wS5JSQCM1rRN9YMj2Q==
X-CSE-MsgGUID: ug8r9p2HTMi6shqCDD6q8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="89031584"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="89031584"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 07:50:31 -0700
X-CSE-ConnectionGUID: n3mdQrFjTiK2hdbSD31aQg==
X-CSE-MsgGUID: dAmt5P45S8GwHxwxk8033A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="268115665"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2026 07:50:28 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1mIE-000000002rG-3mjc;
	Wed, 02 Sep 2026 14:50:26 +0000
Date: Wed, 02 Sep 2026 22:49:37 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2214/3131]
 security/selinux/selinuxfs.c:1577:undefined reference to `__udivdi3'
Message-ID: <202609022215.1SXtHuum-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Paul,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
commit: fc68b6a45f1668bbe03264343115d1c97013c7ea [2214/3131] selinux: convert selinuxfs inode numbers from unsigned long to u64
config: i386-randconfig-013-20250413 (https://download.01.org/0day-ci/archive/20260902/202609022215.1SXtHuum-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609022215.1SXtHuum-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609022215.1SXtHuum-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: security/selinux/selinuxfs.o: in function `sel_ino_to_class':
>> security/selinux/selinuxfs.c:1577:(.text+0x4e2): undefined reference to `__udivdi3'
   ld: security/selinux/selinuxfs.o: in function `sel_ino_to_perm':
>> security/selinux/selinuxfs.c:1587:(.text+0x562): undefined reference to `__umoddi3'


vim +1577 security/selinux/selinuxfs.c

e47c8fc582a2c9 Christopher J. PeBenito 2007-05-23  1574  
fc68b6a45f1668 Paul Moore              2026-08-25  1575  static inline u16 sel_ino_to_class(u64 ino)
e47c8fc582a2c9 Christopher J. PeBenito 2007-05-23  1576  {
92ae9e82d9a2c4 Eric Paris              2012-04-04 @1577  	return (ino & SEL_INO_MASK) / (SEL_VEC_MAX + 1);
e47c8fc582a2c9 Christopher J. PeBenito 2007-05-23  1578  }
e47c8fc582a2c9 Christopher J. PeBenito 2007-05-23  1579  
fc68b6a45f1668 Paul Moore              2026-08-25  1580  static inline u64 sel_perm_to_ino(u16 class, u32 perm)
e47c8fc582a2c9 Christopher J. PeBenito 2007-05-23  1581  {
e47c8fc582a2c9 Christopher J. PeBenito 2007-05-23  1582  	return (class * (SEL_VEC_MAX + 1) + perm) | SEL_CLASS_INO_OFFSET;
e47c8fc582a2c9 Christopher J. PeBenito 2007-05-23  1583  }
e47c8fc582a2c9 Christopher J. PeBenito 2007-05-23  1584  
fc68b6a45f1668 Paul Moore              2026-08-25  1585  static inline u32 sel_ino_to_perm(u64 ino)
e47c8fc582a2c9 Christopher J. PeBenito 2007-05-23  1586  {
e47c8fc582a2c9 Christopher J. PeBenito 2007-05-23 @1587  	return (ino & SEL_INO_MASK) % (SEL_VEC_MAX + 1);
e47c8fc582a2c9 Christopher J. PeBenito 2007-05-23  1588  }
e47c8fc582a2c9 Christopher J. PeBenito 2007-05-23  1589  

:::::: The code at line 1577 was first introduced by commit
:::::: 92ae9e82d9a2c4b9b388d6a9e7a4b2ccb0b4452f SELinux: remove needless sel_div function

:::::: TO: Eric Paris <eparis@redhat.com>
:::::: CC: Eric Paris <eparis@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
