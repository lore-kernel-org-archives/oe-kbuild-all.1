Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED31E492D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 02:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761533800; cv=none; b=Q1uZe4rf06uCKB3cZpQa0Z3JGZ9oHmpRnatmDkMfI7dY96PMGnrQNmqnOlFKR5EjLVJ5g4Ur6+B8UAwtC9ilq1y+CvzQNFANXXACdePI03tl/HfXeMTEwxMw+bhASgs+W/O/F4VAR7Dq7LVSoXrfwmHVqVF0rKA4xP8gqeTV504=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761533800; c=relaxed/simple;
	bh=G6sSgEBZNcHd25VGORZAuv3eTfW2GZlmXa3yvdrKT5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z8Dqp4VBM1C3cvOxRYrSVwDKCV+59icbpqJN+u4MlhT4Qt9LWla7p01h+tviGZ+Lfxui2Tmdkw7IejvcQcrzwGGHefe5ACZAUlcUYUbzR7mFQVrpeZpy+9LglJn4AKpn2uJjYaSt7+h4cj0+KGhMozLYuAAcpQErh2HEN/jphoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kvr5AmhJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kvr5AmhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761533799; x=1793069799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G6sSgEBZNcHd25VGORZAuv3eTfW2GZlmXa3yvdrKT5Q=;
  b=Kvr5AmhJsTkPLi9YL7qZVzxi1wONUutok8bG8tv3LfKkn+B9soIbcDNS
   BErBPosMSkA2VEIAs1F3/cMvpUxrA/++nkI8lMcEfqlWEe9G2S0WcQbim
   eh99djjWVxIYSum7v9arq6j6Av5alusg91DzZCCIW0UbYsT1UFbhj/7K6
   jpB6hb9izqMJgJEKfQwwnkA2thALc7UgEK4AAZvZuwypVAA+78HtFjdB/
   1er8L+gv+mJfuj18n598MMHKEIHKOaKBrRVik6xQ4AAAkfQr4x4NaT6bw
   7fQJrRSYTuoI8Uo9cf+ntZM+6nolUsXs1IivqSq4TM9i6YYUvtcgwt7du
   A==;
X-CSE-ConnectionGUID: uRuOBIUCR76+5zPmHeFtcg==
X-CSE-MsgGUID: /XSx0ka/QMCV7NbDVsk7kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63645258"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63645258"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 19:56:39 -0700
X-CSE-ConnectionGUID: ZmHQq0JbQCu4fYlArjgYqg==
X-CSE-MsgGUID: o5IjCMEmT62QCOfR3JOSpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="189238474"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Oct 2025 19:56:38 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDDOT-000GTt-1h;
	Mon, 27 Oct 2025 02:55:55 +0000
Date: Mon, 27 Oct 2025 10:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 468/700] fs/bcachefs/fs/inode.c:886:9:
 sparse: sparse: cast to restricted __le64
Message-ID: <202510271022.yJrs3xpD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   c317cd269380d275b75d21210fad161750800d68
commit: 0e349fe46a443dc2f5f3d2b67a3cc42c12d2bf35 [468/700] bcachefs: move fs code to fs/
config: powerpc-randconfig-r112-20251026 (https://download.01.org/0day-ci/archive/20251027/202510271022.yJrs3xpD-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271022.yJrs3xpD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510271022.yJrs3xpD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/fs/inode.c:886:9: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/fs/inode.c:886:9: sparse: sparse: cast from restricted __le32
   fs/bcachefs/fs/inode.c:1063:35: sparse: sparse: cast to restricted __le64
   fs/bcachefs/fs/inode.c:1063:35: sparse: sparse: cast from restricted __le32
--
>> fs/bcachefs/fs/check.c:385:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] fs_path_parent @@     got int @@
   fs/bcachefs/fs/check.c:385:42: sparse:     expected restricted __le32 [usertype] fs_path_parent
   fs/bcachefs/fs/check.c:385:42: sparse:     got int

vim +886 fs/bcachefs/fs/inode.c

df448ca355ce84 fs/bcachefs/inode.c Kent Overstreet 2024-12-01  880  
df448ca355ce84 fs/bcachefs/inode.c Kent Overstreet 2024-12-01  881  void bch2_inode_alloc_cursor_to_text(struct printbuf *out, struct bch_fs *c,
df448ca355ce84 fs/bcachefs/inode.c Kent Overstreet 2024-12-01  882  				     struct bkey_s_c k)
df448ca355ce84 fs/bcachefs/inode.c Kent Overstreet 2024-12-01  883  {
df448ca355ce84 fs/bcachefs/inode.c Kent Overstreet 2024-12-01  884  	struct bkey_s_c_inode_alloc_cursor i = bkey_s_c_to_inode_alloc_cursor(k);
df448ca355ce84 fs/bcachefs/inode.c Kent Overstreet 2024-12-01  885  
df448ca355ce84 fs/bcachefs/inode.c Kent Overstreet 2024-12-01 @886  	prt_printf(out, "idx %llu generation %llu",
df448ca355ce84 fs/bcachefs/inode.c Kent Overstreet 2024-12-01  887  		   le64_to_cpu(i.v->idx),
df448ca355ce84 fs/bcachefs/inode.c Kent Overstreet 2024-12-01  888  		   le64_to_cpu(i.v->gen));
df448ca355ce84 fs/bcachefs/inode.c Kent Overstreet 2024-12-01  889  }
df448ca355ce84 fs/bcachefs/inode.c Kent Overstreet 2024-12-01  890  

:::::: The code at line 886 was first introduced by commit
:::::: df448ca355ce84d62993166294f75517e4128598 bcachefs: bcachefs_metadata_version_persistent_inode_cursors

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
