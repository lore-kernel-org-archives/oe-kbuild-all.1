Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C448443E3C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 16:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514489; cv=none; b=seQXq+tjVntp0/wwsQWZ3txgg7d5Fchf7VmEBiLc0K1mCV37Zh6yV4pBHEsQcl7wJE+u5XS23dagXwlVWxfA4iQ40N2kU3grs3mYBnEXOQSXnqhAvytKpStA3gcWHa11+ZjZDmxOlWY/J9vb0qiAEsUCFgPKkHaGkodc7AnjUgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514489; c=relaxed/simple;
	bh=r3BvI6Ro7+PERPYgF16V/v3XkCSxqE29J0AJHNOpytI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YX5BXpLYEO3XuZGn9QArrNifSqoANSx1bV6iSLEElCKJAiuU56u4pHCjkD57oCs7dCVxfsNrGTnr64kLqYAXw689XFEJ71IwRwU3f9gsQqiQ20qOHCTVmx82VjVC1NeAvXWtS9H2dHdOjBh5DusW/M5bopLBHEIO1x0wX3G1L70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=D8/LMflP; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="D8/LMflP"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id EA5AB26;
	Fri, 31 Jul 2026 16:15:05 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=D8/LMflP;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 43F901D0D;
	Fri, 31 Jul 2026 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1785514477;
	bh=kS3j5y9jDATNRGSgOdztAUwSD/87/qmHJpHdbERAjTs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=D8/LMflPJu/fpYJSf4o7yDAjRQs97v14vnqGme4+j24oTzoPfvoX4mghcayqrN5y6
	 KkmHZSH85Jx8aL1j7VkhK+8WQxXXY9j6CG/jQIRg5sdv5qAYQy7YzUSjvaMblNsAXe
	 RC3GfRPZVPmqeKUxWkWuQBV/EMVVqbfQrJ2UhAuM=
Received: from [192.168.95.128] (172.30.20.148) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 31 Jul 2026 19:14:36 +0300
Message-ID: <4e502b8d-b9fa-44cb-9917-84afad34f454@paragon-software.com>
Date: Fri, 31 Jul 2026 18:14:34 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] fs/ntfs3: Add basic support for alternative data
 streams
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
References: <20260724111601.14804-1-almaz.alexandrovich@paragon-software.com>
 <202607312142.aahnA9Zj-lkp@intel.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <202607312142.aahnA9Zj-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/31/26 15:25, kernel test robot wrote:

> Hi Konstantin,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on next-20260721]
> [also build test ERROR on linus/master v7.2-rc5]
> [cannot apply to brauner-vfs/vfs.all v7.2-rc4 v7.2-rc3 v7.2-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Komarov/fs-ntfs3-Add-basic-support-for-alternative-data-streams/20260724-193931
> base:   next-20260721
> patch link:    https://lore.kernel.org/r/20260724111601.14804-1-almaz.alexandrovich%40paragon-software.com
> patch subject: [RFC PATCH] fs/ntfs3: Add basic support for alternative data streams
> config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607312142.aahnA9Zj-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607312142.aahnA9Zj-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607312142.aahnA9Zj-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     fs/ntfs3/file.c: In function 'ntfs_file_read_iter':
>>> fs/ntfs3/file.c:845:17: error: 'ret' undeclared (first use in this function); did you mean 'net'?
>       845 |                 ret = ni_query_ads(ni, &iocb->ki_pos, iter);
>           |                 ^~~
>           |                 net
>     fs/ntfs3/file.c:845:17: note: each undeclared identifier is reported only once for each function it appears in
>
>
> vim +845 fs/ntfs3/file.c
>
>     813	
>     814	/*
>     815	 * ntfs_file_read_iter - file_operations::read_iter
>     816	 */
>     817	static ssize_t ntfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
>     818	{
>     819		struct file *file = iocb->ki_filp;
>     820		struct inode *inode = file_inode(file);
>     821		struct ntfs_inode *ni = ntfs_i(inode);
>     822		size_t bytes = iov_iter_count(iter);
>     823		loff_t valid, i_size, vbo, end;
>     824		unsigned int dio_flags;
>     825		ssize_t err;
>     826	
>     827		err = check_read_restriction(inode);
>     828		if (err)
>     829			return err;
>     830	
>     831		if (!bytes)
>     832			return 0; /* skip atime */
>     833	
>     834		if (ni->file.ads.len == ARRAY_SIZE(QUERY_STREAMS) &&
>     835		    !memcmp(ni->file.ads.name, QUERY_STREAMS, sizeof(QUERY_STREAMS))) {
>     836			/* Query ADS. */
>     837			if (unlikely(iocb->ki_flags & IOCB_DIRECT)) {
>     838				ntfs_inode_warn(
>     839					inode,
>     840					"direct I/O for streams is not supported");
>     841				return -EOPNOTSUPP;
>     842			}
>     843	
>     844			inode_lock_shared(inode);
>   > 845			ret = ni_query_ads(ni, &iocb->ki_pos, iter);
>     846			inode_unlock_shared(inode);
>     847			return ret;
>     848		}
>     849	
>     850		if (is_compressed(ni)) {
>     851			if (iocb->ki_flags & IOCB_DIRECT) {
>     852				ntfs_inode_warn(
>     853					inode, "direct i/o + compressed not supported");
>     854				return -EOPNOTSUPP;
>     855			}
>     856			/* Turn off readahead for compressed files. */
>     857			file->f_ra.ra_pages = 0;
>     858		}
>     859	
>     860		/* Fallback to buffered I/O if the inode does not support direct I/O. */
>     861		if (!(iocb->ki_flags & IOCB_DIRECT) ||
>     862		    !ntfs_should_use_dio(iocb, iter)) {
>     863			iocb->ki_flags &= ~IOCB_DIRECT;
>     864			return generic_file_read_iter(iocb, iter);
>     865		}
>     866	
>     867		if (iocb->ki_flags & IOCB_NOWAIT) {
>     868			if (!inode_trylock_shared(inode))
>     869				return -EAGAIN;
>     870		} else {
>     871			inode_lock_shared(inode);
>     872		}
>     873	
>     874		vbo = iocb->ki_pos;
>     875		end = vbo + bytes;
>     876		dio_flags = 0;
>     877		valid = ni->i_valid;
>     878		i_size = inode->i_size;
>     879	
>     880		if (vbo < valid) {
>     881			if (valid < end) {
>     882				/* read cross 'valid' size. */
>     883				dio_flags |= IOMAP_DIO_FORCE_WAIT;
>     884			}
>     885	
>     886			if (ni->file.run_da.count) {
>     887				/* Direct I/O is not compatible with delalloc. */
>     888				err = ni_allocate_da_blocks(ni);
>     889				if (err)
>     890					goto out;
>     891			}
>     892	
>     893			err = iomap_dio_rw(iocb, iter, &ntfs_iomap_ops, NULL, dio_flags,
>     894					   NULL, 0);
>     895	
>     896			if (err <= 0)
>     897				goto out;
>     898			end = vbo + err;
>     899			if (valid < end) {
>     900				size_t to_zero = end - valid;
>     901				/* Fix iter. */
>     902				iov_iter_revert(iter, to_zero);
>     903				iov_iter_zero(to_zero, iter);
>     904			}
>     905		} else if (vbo < i_size) {
>     906			if (end > i_size)
>     907				bytes = i_size - vbo;
>     908			iov_iter_zero(bytes, iter);
>     909			iocb->ki_pos += bytes;
>     910			err = bytes;
>     911		}
>     912	
>     913	out:
>     914		inode_unlock_shared(inode);
>     915		file_accessed(file);
>     916		return err;
>     917	}
>     918	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Hello,

The 'ret' variable is introduced by "fs/ntfs3: Rename 'err' to 'ret' in
read paths" [1], which is applied immediately before "fs/ntfs3: Add basic
support for alternative data streams" [2] in the ntfs3 tree.

The two patches were posted separately. I can resend them as a numbered
series, so the dependency is visible.

[1] https://lore.kernel.org/ntfs3/20260724111513.14766-1-almaz.alexandrovich@paragon-software.com/
[2] https://lore.kernel.org/ntfs3/20260724111601.14804-1-almaz.alexandrovich@paragon-software.com/

Regards,
Konstantin

