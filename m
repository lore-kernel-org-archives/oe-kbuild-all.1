Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A831B59D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 05:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708924226; cv=none; b=BswZeGR7uLE55d1Mu6AA+KjuN1eG3eoKS+dNI/DqxfcqaRR4YFVEeRbrjjjjEMG/V69gwGy1VISeb1485glbYvdRaO/qqh0KAGLhhlNNUW0SEJ4IzEdOTIwDyKoFnah0wYcSEm5z9ENIjZqpEvHojKUqZmjGnJD8c5xJaziYdU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708924226; c=relaxed/simple;
	bh=pwQDc0AW0RksJxMWqjNk6dqpZJe/lHfF4Oq+GFZD3CY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H4GkjKIfBaZo6JSPJL8KMK15Q0TBYTvop4EZ4xXA3VZtGWUgfIMhW3zw+TZewZpNZO/gkvJQjD7JvUf4SjRgXT9kqAtfUOHb84kCQg7X3MQYpxowli+wSWV3F4c7jX+U8OnxtNw41M7gou5iEnch/dNZodKvzgVEv/tC2zou92I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQwlmA21; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQwlmA21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708924225; x=1740460225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pwQDc0AW0RksJxMWqjNk6dqpZJe/lHfF4Oq+GFZD3CY=;
  b=gQwlmA21mklNbneg+Lmoz1oX6kUx9r1pYioq4VX20nPa7Na/eMY1EuIL
   aFZKdkqdaFMM/JBmfFutz5Gt/vu/Q2PaXgASeBdrRPAU9+FOhBLDn7EJD
   ZOsU+tEkLA7z1czVALMfBADCt0Nv/Msfx7oqIepU6ApqB0Rwyn1TTLLJF
   9JHcH3/ib2XfDtN35SHLfYclL/SixHdl1REnF1W6Xxy7E0V3L2MbnAQEt
   ubo+6KZs9Gh4VdRZptzWDEUOo0ekkiZgTMPRRFsWRYi+I6PFDe+UjTAY/
   40H/Jg85aBoT03Cc5U0dJBOFy/8ziTXy+n7AVM8kYT0VcHKh1t0g61P3r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28616462"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="28616462"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 21:10:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="37543663"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Feb 2024 21:10:20 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reTFk-000A5L-0t;
	Mon, 26 Feb 2024 05:10:14 +0000
Date: Mon, 26 Feb 2024 13:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8227/9575] fs/libfs.c:2018:13: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202402261334.nvl11hSF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33e1d31873f87d119e5120b88cd350efa68ef276
commit: 6cac4ea940896aa83f82e01fa22965f51a6158bc [8227/9575] libfs: add path_from_stashed()
config: hexagon-randconfig-r113-20240226 (https://download.01.org/0day-ci/archive/20240226/202402261334.nvl11hSF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce: (https://download.01.org/0day-ci/archive/20240226/202402261334.nvl11hSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402261334.nvl11hSF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/libfs.c:2018:13: sparse: sparse: Using plain integer as NULL pointer
   fs/libfs.c:2049:5: sparse: sparse: context imbalance in 'path_from_stashed' - wrong count at exit

vim +2018 fs/libfs.c

  1989	
  1990	static struct dentry *stash_dentry(struct dentry **stashed, unsigned long ino,
  1991					   struct super_block *sb,
  1992					   const struct file_operations *fops,
  1993					   void *data)
  1994	{
  1995		struct dentry *dentry;
  1996		struct inode *inode;
  1997	
  1998		dentry = d_alloc_anon(sb);
  1999		if (!dentry)
  2000			return ERR_PTR(-ENOMEM);
  2001	
  2002		inode = new_inode_pseudo(sb);
  2003		if (!inode) {
  2004			dput(dentry);
  2005			return ERR_PTR(-ENOMEM);
  2006		}
  2007	
  2008		inode->i_ino = ino;
  2009		inode->i_flags |= S_IMMUTABLE;
  2010		inode->i_mode = S_IFREG | S_IRUGO;
  2011		inode->i_fop = fops;
  2012		inode->i_private = data;
  2013		simple_inode_init_ts(inode);
  2014	
  2015		/* @data is now owned by the fs */
  2016		d_instantiate(dentry, inode);
  2017	
> 2018		if (cmpxchg(stashed, NULL, dentry)) {
  2019			d_delete(dentry); /* make sure ->d_prune() does nothing */
  2020			dput(dentry);
  2021			cpu_relax();
  2022			return ERR_PTR(-EAGAIN);
  2023		}
  2024	
  2025		return dentry;
  2026	}
  2027	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
