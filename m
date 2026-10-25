Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958256;
	b=wi175oOJc0kqB6xPqINLiDikTHYEC6sGnyCiDck1oOEf22dYuNe4GLct1LW18UmixMmF
	 xAuoIiXBzs6rM6cWzg38KzspCZj32OfAUWsn8E7lh1ugc8lkAONoWc47ypBZ2Xi2xcI3a
	 yuvOiZdtLNrj3i6Lo4SkoibMtJpHL5z+toFBUfpKnXGsxjdAlk88bH8MvRqO9Tj9sHRQ7
	 OvhtvuRuOlUGn1Py6dhWRIdnGBUIt0TPmqy46BwuS4cZozxzqm07fvL7a0ZOtrNjyhjT+
	 gSgqdkRj1ZlWz99NCav1R4tdqv/OJP8fO84sT96gUntgblI33Hp6D7e351qB8i7yPZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958256;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lUXzb6pFvz7L/haSexshqvaQj0sJSpFNp1nIKquRnhA=;
	b=T7S+Gyz6c+bchtiAr0ZnP5NT4IhAVkCkUIQ+MHXIT/NV9EFHo6yKfN7iMwynhmPQ4GLN
	 SKW4bPBnB34UHxAKahN12i7bX52vKzHIXXXTs69RLIowScKZ2b1pqOgQgYgWSdpyOVeaD
	 +IjoXMRDTVMmgaEvJLkzmq9K1YhqAtp6ZtYiTAp8lP1mys9JEwPOmHY7WX5pE/tkJIXZQ
	 BRWBO0r+104y8Fez5x9sNNNJLzV/Hjj/D3caevvqHPRGazziSGIFsuPihZQ7YWLoFAkU+
	 GS0MYjAKcunIOBNDp5LHPksPXwEmJRjSkbhHHhyt1OrQ9O7JAqPOgHJAm5CK19ZxUEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eX0gSDgw;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC0606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 19:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1EC0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eX0gSDgw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792958256; x=1824494256;
  h=date:from:to:cc:subject:message-id;
  bh=tZjJEMM1lvPbAlGKekR4M1y6dPn1HsQ7CqE/a+kQSRQ=;
  b=eX0gSDgwLW7b5N2kkPUbNNSytCztyk3VHZKmNPbfOc+ZkrlFQTrEl9ND
   iM+hWOj7v0VtOqw8tkGJIS3afopJgCpbKGy0+mCV6w1yrYspJnQNgNv/1
   4g4NUvuT/d+SXf0X6ogPiNFO6vIsvEZGldLS/zAnkhdg04XLsz3dev+Qy
   lTDeo4ApWzCJjf5rososVi6kG/YfK8rniu34p0vgUfCj14rUFRNQdfqKG
   uMBZoozfirzlzGjt77XtEb5Rx6Swhu9OQGlc6q5nwXu4cf1Ro7wwuXT0q
   2ukY9TXXfBfwag/+trBEjx3edea+jse0RmFDyBKXVyixzIMHciHLYDvig
   g==;
X-CSE-ConnectionGUID: XqXC7uKFQceZLZ4omAgMEA==
X-CSE-MsgGUID: erNvMtaPSB+yErvTXUeJyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1653839"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1653839"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 12:57:36 -0700
X-CSE-ConnectionGUID: 4ZLlw/z0TsiIq5uQtO+PFg==
X-CSE-MsgGUID: vstg6dNxTIy6ydhldJfVhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4125686"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 25 Oct 2026 12:57:34 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL4LU-000000003oN-0HVz;
	Sun, 25 Oct 2026 19:57:32 +0000
Date: Sun, 25 Oct 2026 20:56:43 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 fs/smb/server/vfs_cache.c:262:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 274.
Message-ID: <202610252021.S32f9ApF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   2f0d864181b9acf801e9b51c345e11b6156b767a
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [1/1] smb: move client and server files to common directory fs/smb
config: x86_64-randconfig-2100-20261025 (https://download.01.org/0day-ci/archive/20261025/202610252021.S32f9ApF-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610252021.S32f9ApF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/server/vfs_cache.c:262:5-24: WARNING: atomic_dec_and_test variation before object free at line 274.
   fs/smb/server/vfs_cache.c:213:5-24: WARNING: atomic_dec_and_test variation before object free at line 214.

vim +262 fs/smb/server/vfs_cache.c

f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  243  
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  244  static void __ksmbd_inode_close(struct ksmbd_file *fp)
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  245  {
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  246  	struct dentry *dir, *dentry;
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  247  	struct ksmbd_inode *ci = fp->f_ci;
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  248  	int err;
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  249  	struct file *filp;
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  250  
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  251  	filp = fp->filp;
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  252  	if (ksmbd_stream_fd(fp) && (ci->m_flags & S_DEL_ON_CLS_STREAM)) {
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  253  		ci->m_flags &= ~S_DEL_ON_CLS_STREAM;
af34983e8315874 fs/ksmbd/vfs_cache.c Hyunchul Lee 2021-06-30  254  		err = ksmbd_vfs_remove_xattr(file_mnt_user_ns(filp),
af34983e8315874 fs/ksmbd/vfs_cache.c Hyunchul Lee 2021-06-30  255  					     filp->f_path.dentry,
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  256  					     fp->stream.name);
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  257  		if (err)
bde1694aecdb535 fs/cifsd/vfs_cache.c Namjae Jeon  2021-06-28  258  			pr_err("remove xattr failed : %s\n",
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  259  			       fp->stream.name);
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  260  	}
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  261  
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16 @262  	if (atomic_dec_and_test(&ci->m_count)) {
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  263  		write_lock(&ci->m_lock);
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  264  		if (ci->m_flags & (S_DEL_ON_CLS | S_DEL_PENDING)) {
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  265  			dentry = filp->f_path.dentry;
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  266  			dir = dentry->d_parent;
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  267  			ci->m_flags &= ~(S_DEL_ON_CLS | S_DEL_PENDING);
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  268  			write_unlock(&ci->m_lock);
af34983e8315874 fs/ksmbd/vfs_cache.c Hyunchul Lee 2021-06-30  269  			ksmbd_vfs_unlink(file_mnt_user_ns(filp), dir, dentry);
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  270  			write_lock(&ci->m_lock);
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  271  		}
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  272  		write_unlock(&ci->m_lock);
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  273  
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16 @274  		ksmbd_inode_free(ci);
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  275  	}
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  276  }
f44158485826c07 fs/cifsd/vfs_cache.c Namjae Jeon  2021-03-16  277  

:::::: The code at line 262 was first introduced by commit
:::::: f44158485826c076335d6860d35872271a83791d cifsd: add file operations

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
