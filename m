Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654071A303F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725354297; cv=none; b=Ti6ou3aHHOx38mPmHFc2MmmvcexQ0eXaFFFJvm4oGjN8XfM3wgL3H+RHt0fSWMDyKKyZHGSWXS3EePeKB1HTEpjk4w3rmxl9O8Shbm9FYnUBFnJHA3OOq1mW3Ndnl5b6m7uUinsyd2qpFJoOUAWKORkGQeXbIDY/hYYpH1G68go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725354297; c=relaxed/simple;
	bh=oM/OCXwKVckSJ/J38gdvPJ0xDHT6FZQv1vgMXA6inMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfuUB+KAVMA6zguGAsApSJMjSuGaYkWs1nAOm4x0KKGvpNhwS0Qb8CN+7t0p4VYvnuP5H0Gi7EZFrJuvBM9v8AmMGnrX1Ea7l9IwSfzdX0fn4aBWfoZwdKIpc0dJ4mLS16B5PP85xdLz9262wxF/QwSzw8kmC8TafTskZ6Z1c5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GViPcfFE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GViPcfFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725354296; x=1756890296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oM/OCXwKVckSJ/J38gdvPJ0xDHT6FZQv1vgMXA6inMs=;
  b=GViPcfFE4EWyIpCGERIq3kpNpqqbi+9h15x7pZVUUVwxiljq4wtwEYBL
   W/AZjCms9iBLkp9A0jGkCGjvnEDc79Vog88zRK7qGMvmZAKM+LZUuAD/e
   mCfKdD8pyeC8Afy0AuD0BsT3rKzKahy1Ukz6l1pruOPZVH5nYUE8nVdou
   tW37GidLeBXY8XEbW8r0Yfdfv5tBMcpTiQU+TF7L/vAx3wLpUwJhTElh8
   dtie0GEriYNv73yhGfnWw92uxdg05bFToUiXxE5Ms74ZSdQ/8VHJoyKeB
   1ZRG3CCcddtpJxfgElK1oAcS1xrZXPxbPKHFU4y4f0bfu/HzUdvragbhh
   A==;
X-CSE-ConnectionGUID: w+uf8K9iQQ6DOkW/rlyS3Q==
X-CSE-MsgGUID: LqcPv4SPSbm2Zx7dm+kx3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="13341649"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="13341649"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 02:04:55 -0700
X-CSE-ConnectionGUID: nmml11t1TgeO0s9+tWdhvQ==
X-CSE-MsgGUID: lom32QpsSl+yZW3ZvAB3LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="65037783"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2024 02:04:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slPSz-0006Qy-1p;
	Tue, 03 Sep 2024 09:04:49 +0000
Date: Tue, 3 Sep 2024 17:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	krisman@kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	kernel-dev@igalia.com, Daniel Rosenberg <drosen@google.com>,
	smcv@collabora.com, Christoph Hellwig <hch@lst.de>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v2 6/8] tmpfs: Add flag FS_CASEFOLD_FL support for tmpfs
 dirs
Message-ID: <202409031642.6kP6Ra8c-lkp@intel.com>
References: <20240902225511.757831-7-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240902225511.757831-7-andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on tytso-ext4/dev brauner-vfs/vfs.all linus/master v6.11-rc6 next-20240903]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/unicode-Fix-utf8_load-error-path/20240903-070149
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240902225511.757831-7-andrealmeid%40igalia.com
patch subject: [PATCH v2 6/8] tmpfs: Add flag FS_CASEFOLD_FL support for tmpfs dirs
config: i386-buildonly-randconfig-002-20240903 (https://download.01.org/0day-ci/archive/20240903/202409031642.6kP6Ra8c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031642.6kP6Ra8c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031642.6kP6Ra8c-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/shmem.c: In function 'shmem_set_inode_flags':
>> mm/shmem.c:2771:24: error: 'struct super_block' has no member named 's_encoding'
    2771 |                 if (!sb->s_encoding)
         |                        ^~


vim +2771 mm/shmem.c

  2760	
  2761	/*
  2762	 * chattr's fsflags are unrelated to extended attributes,
  2763	 * but tmpfs has chosen to enable them under the same config option.
  2764	 */
  2765	static int shmem_set_inode_flags(struct inode *inode, unsigned int fsflags, struct dentry *dentry)
  2766	{
  2767		unsigned int i_flags = 0, old = inode->i_flags;
  2768		struct super_block *sb = inode->i_sb;
  2769	
  2770		if (fsflags & FS_CASEFOLD_FL) {
> 2771			if (!sb->s_encoding)
  2772				return -EOPNOTSUPP;
  2773	
  2774			if (!S_ISDIR(inode->i_mode))
  2775				return -ENOTDIR;
  2776	
  2777			if (dentry && !simple_empty(dentry))
  2778				return -ENOTEMPTY;
  2779	
  2780			i_flags |= S_CASEFOLD;
  2781		} else if (old & S_CASEFOLD) {
  2782			if (dentry && !simple_empty(dentry))
  2783				return -ENOTEMPTY;
  2784		}
  2785	
  2786		if (fsflags & FS_NOATIME_FL)
  2787			i_flags |= S_NOATIME;
  2788		if (fsflags & FS_APPEND_FL)
  2789			i_flags |= S_APPEND;
  2790		if (fsflags & FS_IMMUTABLE_FL)
  2791			i_flags |= S_IMMUTABLE;
  2792		/*
  2793		 * But FS_NODUMP_FL does not require any action in i_flags.
  2794		 */
  2795		inode_set_flags(inode, i_flags, S_NOATIME | S_APPEND | S_IMMUTABLE | S_CASEFOLD);
  2796	
  2797		return 0;
  2798	}
  2799	#else
  2800	static void shmem_set_inode_flags(struct inode *inode, unsigned int fsflags, struct dentry *dentry)
  2801	{
  2802	}
  2803	#define shmem_initxattrs NULL
  2804	#endif
  2805	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
