Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3807AEA4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 00:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722040875; cv=none; b=ASGomdzii0rYvg4/CSjiyPczAKxXbZMD3c7tDoSp+AOVHrsWspAjpgPdKceCGtJmu66qvodoH3QrBG3oEYH33Ge5UxuSZNsf301Oa4zyBDSe2KueerNkWzP7fX00yKtqsPPScYoUElSyjPKPVpZ1gKZx7+jk16zfdaZ1Rf8gWyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722040875; c=relaxed/simple;
	bh=hQ07Zk2IHiDbsiZPJlsITIvzyxMPmQhrnRZ7pR6/RNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V3WV+YocFrUGvWtBWI9lw3ZdFk1+QMyAHwLWcCU9RDRKHCJWmitEo5jzxS+P6amHqQnR83JgNcUWbrljwBX3t+TPAuAULVkqyM0ts48yTXXZqudx/v0+L0F5D/790XVKSlFR15q9W+t8ZerebhnJLObTXulPR/pfPYU8bAIxxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eme2xqRF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eme2xqRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722040873; x=1753576873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hQ07Zk2IHiDbsiZPJlsITIvzyxMPmQhrnRZ7pR6/RNI=;
  b=Eme2xqRF5tGBKei+Hs7R1mo7EbpLuk2by6HEopsh6/YTsh/IGk9dDEvl
   +3c05jAEbvxTMJcCgOS1ig6p38jFfp1nDZeq+j81VxaUhCkZqVskLYAdZ
   XwSXMb9+FwPYFBTWD20bX6MccH9aEQG4ZbzGwBZhQjTaYHQwdlZ7Ee506
   KeruS2vH2Bh70BPSqnkwyLE3TFW/11HmrxTwsneB+ioFrO49oQ9Hid03U
   X/Yy5GZlCpQmYijkrmwPYBkc2d/klxDNcHQckvsTcMJh4tshd3XR+d9DR
   Bg7CxMfpsNrPlAsjHf7fdkDLm/aYV+s0AXN7VesViXnOoQ4s/bXGLiiid
   w==;
X-CSE-ConnectionGUID: D6Or4V8KRWOUCD1XkW7qiQ==
X-CSE-MsgGUID: +dFCPIRLQpaeu6z90P1lEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19994506"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; 
   d="scan'208";a="19994506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 17:41:13 -0700
X-CSE-ConnectionGUID: d5zePLLKRteU4yeavmsWeg==
X-CSE-MsgGUID: lff/ZOARSNOdw6/RWC1nSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; 
   d="scan'208";a="57715207"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jul 2024 17:41:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXVUj-000pXC-0r;
	Sat, 27 Jul 2024 00:41:09 +0000
Date: Sat, 27 Jul 2024 08:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 21/22] fs/afs/dir.c:312:9: warning:
 explicitly assigning value of variable of type 'ssize_t' (aka 'long') to
 itself
Message-ID: <202407270847.5u0FW8oJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   6b24fc77cd5428445a25435f8cf7c56e55d600a6
commit: b2fd6d9020b74d49f3d0f7585cce82396b4a608e [21/22] afs: Use netfslib instead of ITER_XARRAY for directories
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240727/202407270847.5u0FW8oJ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407270847.5u0FW8oJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407270847.5u0FW8oJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/dir.c:312:9: warning: explicitly assigning value of variable of type 'ssize_t' (aka 'long') to itself [-Wself-assign]
     312 |                                 ret = ret;
         |                                 ~~~ ^ ~~~
   1 warning generated.


vim +312 fs/afs/dir.c

   251	
   252	/*
   253	 * Perform a read of the directory.
   254	 */
   255	static ssize_t afs_do_read_dir(struct afs_vnode *dvnode, struct file *file,
   256				       struct folio_batch *fbatch)
   257	{
   258		struct address_space *mapping = dvnode->netfs.inode.i_mapping;
   259		DEFINE_READAHEAD(ractl, file, NULL, mapping, 0);
   260		struct folio *folio;
   261		ssize_t ret = 0;
   262		size_t pos = 0;
   263		loff_t i_size;
   264	
   265		i_size = i_size_read(&dvnode->netfs.inode);
   266		if (i_size < 2048)
   267			return afs_bad(dvnode, afs_file_error_dir_small);
   268		if (i_size > 2048 * 1024) {
   269			trace_afs_file_error(dvnode, -EFBIG, afs_file_error_dir_big);
   270			return -EFBIG;
   271		}
   272	
   273		/* Lock all the folios in the range we need, filling in any gaps.  We
   274		 * drop the references we get from the VM here analogously with the VM
   275		 * readahead code.
   276		 */
   277		while (pos < i_size) {
   278			folio = filemap_get_folio(mapping, pos / PAGE_SIZE);
   279			if (IS_ERR(folio)) {
   280				fgf_t fgp_flags = FGP_LOCK | FGP_CREAT;
   281	
   282				fgp_flags |= fgf_set_order(i_size - pos);
   283	
   284				folio = __filemap_get_folio(mapping, pos / PAGE_SIZE,
   285							    fgp_flags, mapping->gfp_mask);
   286				if (IS_ERR(folio)) {
   287					ret = PTR_ERR(folio);
   288					goto revert;
   289				}
   290			}
   291	
   292			folio_clear_uptodate(folio);
   293			ractl._nr_pages += folio_nr_pages(folio);
   294			pos += folio_size(folio);
   295		}
   296	
   297		/* AFS requires us to perform the read of a directory synchronously as
   298		 * a single unit to avoid issues with the directory contents being
   299		 * changed between reads.
   300		 */
   301		ret = netfs_read_single(&ractl);
   302		if (ret >= 0) {
   303			i_size = i_size_read(&dvnode->netfs.inode);
   304			if (i_size > ret) {
   305				/* The content has grown, so we need to expand the
   306				 * buffer.
   307				 */
   308				ret = -ESTALE;
   309			} else {
   310				int ret2 = afs_dir_check(dvnode, fbatch);
   311				if (ret2 < 0)
 > 312					ret = ret;
   313			}
   314		}
   315	
   316	revert:
   317		while ((folio = readahead_folio(&ractl)) != NULL) {
   318			folio_get(folio);
   319			filemap_remove_folio(folio);
   320			folio_unlock(folio);
   321			if (!folio_batch_add(fbatch, folio))
   322				folio_batch_release(fbatch);
   323		}
   324		return ret;
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
