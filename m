Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A8421CC5C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742224149; cv=none; b=cYj0EO9Gl4NbgpQb+tgVMOTp8zKn+Jjm5KMrNifa7y1fQCiLoiWZ5ARPhRodPxaCfgfmO/dEgenfhfPxxkwSwmr7WACI/0eD2/50ahxy3FbXwkMMZcZ50Xx4OCD7R7NVQzdMzJcc1yBFqC9I8P4P8ZBfcaEhpPEI5z8P1TJlAMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742224149; c=relaxed/simple;
	bh=Ck8xWHa15YjzQmKK9w2kTGM38RzjSZWr/Mo19kvV+ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xss7gqhX5hFWVLTfKbQ5hGGpu4KOdyetFW8AmQklzyTYBtAhanPv1U95OOiS7DmSvKuEI1lgbbWY/IYiANvD3+IRxllcl4zCRg59osUPnSTnKhD6cYIIe+h1LDkL7ypt5Hn9Ki9S1L8oOTl/wcBSFxIWqu2p4nZ1AGw1ba5xP6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCNYXau9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCNYXau9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742224147; x=1773760147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ck8xWHa15YjzQmKK9w2kTGM38RzjSZWr/Mo19kvV+ls=;
  b=nCNYXau9UyscotUlX9YrepejQEX0B+XTiEeTSoqKNP9DQL5Cdhv6RkRv
   JCQdHSuKAbeOW9gEkR884j8+ssio6DITDdePLMfmZTWaHJ8LUGLoim7pT
   Bxnn8mijIcq7uVPBPLZBdPx3aXk7jdfCaZ1+qM5ddV0Y/l9P2MvzVll5i
   NL10NpfjwX+6Na/yNKZXuetRdsUqrjvhtPW++oaM7IKWLnxtyPL0bkT13
   2ZXPS5jhQi1Nw0RYplEY0hcOUYTFfY620bBwEffG1+c31hpwRdfDjCHe5
   z6ubId9ZHJg25DvRpzjlrUy61TqHLe3zRyc/6Ndc3HEQPE8Eq85JLwNoj
   A==;
X-CSE-ConnectionGUID: 5Fs0Wy+zTbSAewIUdjj1oQ==
X-CSE-MsgGUID: 40qYJ5KDQUKKN29KrzNwTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="65787218"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="65787218"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 08:09:07 -0700
X-CSE-ConnectionGUID: uzFlDnwOS2ChbyHkv7ABoQ==
X-CSE-MsgGUID: LSoRpkSHQ+eU7Coj602z8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="121689790"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Mar 2025 08:09:07 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuC5K-000Crv-1S;
	Mon, 17 Mar 2025 15:08:59 +0000
Date: Mon, 17 Mar 2025 23:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-efi@vger.kernel.org
Subject: [efi:urgent 10/10] fs/efivarfs/super.c:424:34: error: 'INODE_CHILD'
 undeclared; did you mean 'I_MUTEX_CHILD'?
Message-ID: <202503172331.vqCmniUS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git urgent
head:   2379221e8c43a4be62811f4d8a71cfffc23df5b0
commit: 2379221e8c43a4be62811f4d8a71cfffc23df5b0 [10/10] efivarfs: use INODE_CHILD nested lock to traverse variables on resume
config: riscv-randconfig-001-20250317 (https://download.01.org/0day-ci/archive/20250317/202503172331.vqCmniUS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503172331.vqCmniUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503172331.vqCmniUS-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/efivarfs/super.c: In function 'efivarfs_actor':
>> fs/efivarfs/super.c:424:34: error: 'INODE_CHILD' undeclared (first use in this function); did you mean 'I_MUTEX_CHILD'?
     424 |         inode_lock_nested(inode, INODE_CHILD);
         |                                  ^~~~~~~~~~~
         |                                  I_MUTEX_CHILD
   fs/efivarfs/super.c:424:34: note: each undeclared identifier is reported only once for each function it appears in


vim +424 fs/efivarfs/super.c

   401	
   402	static bool efivarfs_actor(struct dir_context *ctx, const char *name, int len,
   403				   loff_t offset, u64 ino, unsigned mode)
   404	{
   405		unsigned long size;
   406		struct efivarfs_ctx *ectx = container_of(ctx, struct efivarfs_ctx, ctx);
   407		struct qstr qstr = { .name = name, .len = len };
   408		struct dentry *dentry = d_hash_and_lookup(ectx->sb->s_root, &qstr);
   409		struct inode *inode;
   410		struct efivar_entry *entry;
   411		int err;
   412	
   413		if (IS_ERR_OR_NULL(dentry))
   414			return true;
   415	
   416		inode = d_inode(dentry);
   417		entry = efivar_entry(inode);
   418	
   419		err = efivar_entry_size(entry, &size);
   420		size += sizeof(__u32);	/* attributes */
   421		if (err)
   422			size = 0;
   423	
 > 424		inode_lock_nested(inode, INODE_CHILD);
   425		i_size_write(inode, size);
   426		inode_unlock(inode);
   427	
   428		if (!size) {
   429			ectx->dentry = dentry;
   430			return false;
   431		}
   432	
   433		dput(dentry);
   434	
   435		return true;
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
