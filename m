Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBC22FDC5E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 18:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760121081; cv=none; b=Dnq1X4Zc8A870cIs0zAcOyvu06H42rjtLnxU/DA+dzsAf1AC4tMlEvQZeApF3K+wTNEA4Bi7ZuWlpKB48mg86eR0nPOpBBXK2YFLbf+zCEoeqiTPHBQRCXZ/aI8abaS+k4ibxFtjSTiw2H0C5PxaLe43dgpKqDUZlZgHGD4dNsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760121081; c=relaxed/simple;
	bh=QlgFLsM67oJyv4smbMUCo2bF9B4WOQ+VhwaUGLwWeH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZz70spUWtLxF2ApX9J98X7+sc69igL9POzi0wamEsWiNKTUgAH1XYHPIO6kC9B3qpBhb7n8/X8qS6dn13vaKWDxMRCka/Dpsi1nzhu1PcyCxFhDHfqTyvUby1/fFCfChBpcQ58GzRlakmRfM28ISrCjxQpSR6XyzkTEPOJ4fco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NsOdX74e; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NsOdX74e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760121078; x=1791657078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QlgFLsM67oJyv4smbMUCo2bF9B4WOQ+VhwaUGLwWeH0=;
  b=NsOdX74ew/cFOIiFYGQgN9xFfAkBtL8/LSQ1vlRpkbHXEJuTD6zD2cti
   VwxDoXqSESiQiWUehvJngA9jIornayefiMIPwHrvVVFXEdNcnZtg1tl7s
   VBi3+xmdtDRrh/+mYqVXCUyMxTjlNMIsqpn36XCBftM6UVUbVxRbQXPov
   9ZlwJ73A1Pt4iWB6Mjm/zFZRA9supynXd82EVJwsqTVxkPfVEVCkp7clO
   UAkn0gAwqspd2Tlt29G6RoYZ19ashsge4CFnn2NmTjQtWLd3TnQO6JI9T
   wUd5e7u0s19MajbYLGjaUZKeLlCbMIUL3/+agDOFSOxvBt1KlZn43K3WZ
   Q==;
X-CSE-ConnectionGUID: oNHl9MjAQTqR+GZgG2b4Vw==
X-CSE-MsgGUID: ESqZSx55QRS7ecAq9hDabQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="64966087"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="64966087"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 11:31:13 -0700
X-CSE-ConnectionGUID: 7qHq3mJMQueTtryl/0Qa6A==
X-CSE-MsgGUID: Z1/skLZmSmqM8i/EOmStNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="185062413"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Oct 2025 11:31:11 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7HtU-00033h-2k;
	Fri, 10 Oct 2025 18:31:08 +0000
Date: Sat, 11 Oct 2025 02:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ranganath V N <vnranganath.20@gmail.com>, tytso@mit.edu,
	adilger.kernel@dilger.ca
Cc: oe-kbuild-all@lists.linux.dev, linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org, Ranganath V N <vnranganath.20@gmail.com>
Subject: Re: [PATCH] fs: ext4: fix uninitialized symbols
Message-ID: <202510110215.0tTIOF83-lkp@intel.com>
References: <20251008171614.12129-1-vnranganath.20@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008171614.12129-1-vnranganath.20@gmail.com>

Hi Ranganath,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ranganath-V-N/fs-ext4-fix-uninitialized-symbols/20251010-065232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20251008171614.12129-1-vnranganath.20%40gmail.com
patch subject: [PATCH] fs: ext4: fix uninitialized symbols
config: sparc-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110215.0tTIOF83-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110215.0tTIOF83-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110215.0tTIOF83-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/sparc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382,
                    from arch/sparc/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from fs/ext4/inode.c:22:
   fs/ext4/inode.c: In function 'ext4_map_blocks_atomic_write_slow':
>> include/linux/stddef.h:8:14: warning: initialization of 'ext4_fsblk_t' {aka 'long long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
    #define NULL ((void *)0)
                 ^
   fs/ext4/inode.c:3547:27: note: in expansion of macro 'NULL'
     ext4_fsblk_t next_pblk = NULL;
                              ^~~~
--
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/sparc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382,
                    from arch/sparc/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from inode.c:22:
   inode.c: In function 'ext4_map_blocks_atomic_write_slow':
>> include/linux/stddef.h:8:14: warning: initialization of 'ext4_fsblk_t' {aka 'long long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
    #define NULL ((void *)0)
                 ^
   inode.c:3547:27: note: in expansion of macro 'NULL'
     ext4_fsblk_t next_pblk = NULL;
                              ^~~~


vim +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
