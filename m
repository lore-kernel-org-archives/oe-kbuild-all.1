Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119973C30
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 03:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717989879; cv=none; b=p83POIsYfZZFGwNJHOcbgraRJFDG5HoGl/S2Cxvkaz2J9fOu26dUkPCbIa1P+MwTE9GL4UEADAHATiWKn3+Y7pxGGmS2ce6BWQ2YNRIqeJqZTxYG21JN0WG1zDajQKYiDjG9B4D0nhp64P1L4PSr1THx726zszs4TCzXR6q2RX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717989879; c=relaxed/simple;
	bh=pKYPxkK6Khm57LTdsYcgq61PPqghDLWXjlIBmG5cNeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7osdikUktbsXPKnw57RFut+9xT3z1v1+uu44DQzQXaCiWn8RwyQ/TT7QIMH4YN/rp9gFNLk90kLgxI0WakstG0NHVFjpWZRsCIgDmd0RKzLV2RItkQAK2fmuNaLNgVp3Z+5LL2PFz2chfT0dFf6S3ucyViHJwO139DZ4LfZXhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZmHmAzS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZmHmAzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717989877; x=1749525877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pKYPxkK6Khm57LTdsYcgq61PPqghDLWXjlIBmG5cNeg=;
  b=CZmHmAzSiHtOxFMhM+eB8agx4sHdj4zq9CSoXA/b+xgGLrGaeGPDwLIy
   QSzOrlYRL56hCiQQM902UQbhEjtWBY4SwHS85by+rDXsjBpA5cjyVmby3
   NU8oYanm8v7cgL6zgxKJVYxAjA27I5CK6z8SOoc5CO6Vh67UzC/qTed4F
   lfiK1cz4r5VK+wOGHf6UQY2C3X9YhrGXQV+gF9upSYIe7y69dMK9a0hSL
   w3e0JMRDGf2DpCAf4A9EtPsF8e8vkw3pouMo63qLZJ5wtOPGjYTUxewdi
   1OIgSs5XNfSjg+1cm0kKeGaa+qCueR3SvxRuYYKjhM8b5coP52RyBOoi/
   Q==;
X-CSE-ConnectionGUID: Vzjp7QnEQL+T2FuFIqxNUQ==
X-CSE-MsgGUID: eUMUMR7dRxin0QYR/HcljA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25743750"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="25743750"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 20:24:37 -0700
X-CSE-ConnectionGUID: smYmUGMuQxGM64y5BZPJnw==
X-CSE-MsgGUID: HDejnukaRyqAeQEyIo+EOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="39591681"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jun 2024 20:24:35 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGVe4-0001ok-30;
	Mon, 10 Jun 2024 03:24:32 +0000
Date: Mon, 10 Jun 2024 11:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Paulo Alcantara (SUSE)" <pc@manguebit.com>
Subject: [samba-ksmbd:for-next 579/600] fs/cifs/readdir.c:68:35: error:
 implicit declaration of function 'inode_get_ctime'; did you mean
 'inode_get_bytes'?
Message-ID: <202406101141.7s5McKFF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git for-next
head:   3fe4ba20003290acf0547625cccc34db928d156e
commit: 827c1e93bb2a957cc825bc1fddf8740501cc4b84 [579/600] smb: client: stop revalidating reparse points unnecessarily
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240610/202406101141.7s5McKFF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101141.7s5McKFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406101141.7s5McKFF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/cifs/readdir.c:15:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:885:9: error: expected specifier-qualifier-list before 'struct_group'
     885 |         struct_group(common_attributes,
         |         ^~~~~~~~~~~~
   fs/cifs/cifspdu.h:2269:9: error: expected specifier-qualifier-list before 'struct_group'
    2269 |         struct_group(common_attributes,
         |         ^~~~~~~~~~~~
   fs/cifs/cifspdu.h:2332:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2332 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2381:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2381 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2492:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2492 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:26,
                    from fs/cifs/readdir.c:16:
   fs/cifs/../smbfs_common/smb2pdu.h:705:9: error: expected specifier-qualifier-list before 'struct_group'
     705 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:845:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     845 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1686:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1686 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:27:
   fs/cifs/smb2pdu.h:322:9: error: expected specifier-qualifier-list before 'struct_group'
     322 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   fs/cifs/cifsglob.h: In function 'move_cifs_info_to_smb2':
   fs/cifs/cifsglob.h:2182:45: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2182 |         memcpy(dst, src, (size_t)((u8 *)&src->AccessFlags - (u8 *)src));
         |                                             ^~
   fs/cifs/cifsglob.h:2183:31: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2183 |         dst->AccessFlags = src->AccessFlags;
         |                               ^~
   fs/cifs/cifsglob.h:2184:37: error: 'FILE_ALL_INFO' has no member named 'CurrentByteOffset'
    2184 |         dst->CurrentByteOffset = src->CurrentByteOffset;
         |                                     ^~
   fs/cifs/cifsglob.h:2185:24: error: 'FILE_ALL_INFO' has no member named 'Mode'
    2185 |         dst->Mode = src->Mode;
         |                        ^~
   fs/cifs/cifsglob.h:2186:40: error: 'FILE_ALL_INFO' has no member named 'AlignmentRequirement'
    2186 |         dst->AlignmentRequirement = src->AlignmentRequirement;
         |                                        ^~
   fs/cifs/cifsglob.h:2187:34: error: 'FILE_ALL_INFO' has no member named 'FileNameLength'
    2187 |         dst->FileNameLength = src->FileNameLength;
         |                                  ^~
   fs/cifs/readdir.c: In function 'reparse_inode_match':
>> fs/cifs/readdir.c:68:35: error: implicit declaration of function 'inode_get_ctime'; did you mean 'inode_get_bytes'? [-Werror=implicit-function-declaration]
      68 |         struct timespec64 ctime = inode_get_ctime(inode);
         |                                   ^~~~~~~~~~~~~~~
         |                                   inode_get_bytes
>> fs/cifs/readdir.c:68:35: error: invalid initializer
   fs/cifs/readdir.c: In function 'cifs_fill_dirent_unix':
   fs/cifs/readdir.c:522:25: error: 'FILE_UNIX_INFO' has no member named 'FileName'
     522 |         de->name = &info->FileName[0];
         |                         ^~
   cc1: some warnings being treated as errors


vim +68 fs/cifs/readdir.c

    57	
    58	/*
    59	 * Match a reparse point inode if reparse tag and ctime haven't changed.
    60	 *
    61	 * Windows Server updates ctime of reparse points when their data have changed.
    62	 * The server doesn't allow changing reparse tags from existing reparse points,
    63	 * though it's worth checking.
    64	 */
    65	static inline bool reparse_inode_match(struct inode *inode,
    66					       struct cifs_fattr *fattr)
    67	{
  > 68		struct timespec64 ctime = inode_get_ctime(inode);
    69	
    70		return (CIFS_I(inode)->cifsAttrs & ATTR_REPARSE) &&
    71			CIFS_I(inode)->reparse_tag == fattr->cf_cifstag &&
    72			timespec64_equal(&ctime, &fattr->cf_ctime);
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
