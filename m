Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C2E1E889
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 21:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717968634; cv=none; b=rd69Z/cIaCY479csFNG3BqOiWjfdygLnRaEZ/y8SII5Ie49FmrEQQ/W4v4XDCIvNPIdI+o0HG1y3DK34eEP3P/xO9xr6amkYjKnxvYr0vCUN9MYJhBN3r8sHz9PVOZcgcMnu4prX4ucpD2Ea9fN5OAQcEPV5KgK7o01hU/SCxNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717968634; c=relaxed/simple;
	bh=ImGBQLxIy5HKLiJbFtOEj1r4jL0CFypUKFJH83h3lM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lsgjS1X6clBIMmRsmRkOX6lyQUD7EGuF1pLiZkA23nW6UzI7mV3SrXMV35xqdCycql8s7qs1AjMxa1K5ncaK+iETvcxrVf8+JLiXFv4h4xvcpmJ+muAeo+Qkr0ogcUCUKC/0FOyNyXF6tWumdCcSFdxnJARtoeNdcnkcqhsMaO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnIiAVuf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OnIiAVuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717968633; x=1749504633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ImGBQLxIy5HKLiJbFtOEj1r4jL0CFypUKFJH83h3lM4=;
  b=OnIiAVufiA5gt9e0SaumdCHs5S+uFsVhSD8H9gwpm7My0TofbGumIrPk
   LNRLDBmJNN3sEPn9avTGguusFkLGK4F6V2dyADRcm/lXLsE5tbqpN1Niu
   qxb1YkiRBSkD8Jzn8Lkz9VvylyQlquO9K1fhmM9zN6y8HorZEzibaJvsc
   NKIF4FrzWHnh+G8DV23f00/YijW9UmCBLKjfg7pjJeOY7MHKffLYGD1vG
   8yvoKHktameicOeCjSAIDLQYbMv0PcM2SxptW84MkmhZOLxUchq+Uf5HD
   bf4gIq8gQ4Oj1H0QkCx2G+NI8unCu0oeG9TNzwt8yP3M+6p8SuXoLp2mI
   g==;
X-CSE-ConnectionGUID: 86lrqcMZRZ6BWzD828XZnw==
X-CSE-MsgGUID: 5+8rJCatSZayvizIRXpZbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25245919"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="25245919"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:30:32 -0700
X-CSE-ConnectionGUID: 1EcW4/J/TeO1HStDL50Fgw==
X-CSE-MsgGUID: E4UxKnEETl6f4JWSlyOqDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="76346294"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Jun 2024 14:30:30 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGQ7Q-0001by-14;
	Sun, 09 Jun 2024 21:30:28 +0000
Date: Mon, 10 Jun 2024 05:30:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [samba-ksmbd:for-next 346/600]
 fs/cifs/../smbfs_common/smb2pdu.h:817:17: error: expected
 specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
Message-ID: <202406100528.u3UG3qRT-lkp@intel.com>
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
commit: cd3ad386810097de48e69cdd3c483ca1bf65c7c6 [346/600] smb3: Replace smb2pdu 1-element arrays with flex-arrays
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240610/202406100528.u3UG3qRT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100528.u3UG3qRT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100528.u3UG3qRT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/cifs/cifsfs.c:32:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2289:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2289 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2328:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2328 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2377:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2377 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2488:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2488 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:26,
                    from fs/cifs/cifsfs.c:34:
>> fs/cifs/../smbfs_common/smb2pdu.h:817:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     817 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1578:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1578 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
--
   In file included from fs/cifs/cifsglob.h:26,
                    from fs/cifs/cached_dir.c:9:
>> fs/cifs/../smbfs_common/smb2pdu.h:817:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     817 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1578:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1578 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:97:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2289:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2289 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2328:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2328 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2377:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2377 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2488:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2488 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
--
   In file included from fs/cifs/readdir.c:15:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2289:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2289 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2328:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2328 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2377:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2377 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2488:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2488 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:26,
                    from fs/cifs/readdir.c:16:
>> fs/cifs/../smbfs_common/smb2pdu.h:817:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     817 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1578:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1578 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/readdir.c: In function 'cifs_fill_dirent_unix':
   fs/cifs/readdir.c:554:25: error: 'FILE_UNIX_INFO' has no member named 'FileName'
     554 |         de->name = &info->FileName[0];
         |                         ^~
--
   In file included from fs/cifs/cifssmb.c:26:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2289:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2289 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2328:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2328 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2377:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2377 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2488:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2488 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:26,
                    from fs/cifs/cifssmb.c:27:
>> fs/cifs/../smbfs_common/smb2pdu.h:817:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     817 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1578:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1578 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifssmb.c: In function 'decode_ext_sec_blob':
   fs/cifs/cifssmb.c:381:33: error: 'union <anonymous>' has no member named 'extended_response'
     381 |         char    *guid = pSMBr->u.extended_response.GUID;
         |                                 ^
   fs/cifs/cifssmb.c:405:33: error: 'union <anonymous>' has no member named 'extended_response'
     405 |                         pSMBr->u.extended_response.SecurityBlob, count, server);
         |                                 ^
   fs/cifs/cifssmb.c: In function 'CIFSSMBNegotiate':
   fs/cifs/cifssmb.c:516:55: error: 'union <anonymous>' has no member named 'EncryptionKey'
     516 |                 memcpy(ses->server->cryptkey, pSMBr->u.EncryptionKey,
         |                                                       ^


vim +/DECLARE_FLEX_ARRAY +817 fs/cifs/../smbfs_common/smb2pdu.h

   802	
   803	struct smb2_lock_req {
   804		struct smb2_hdr hdr;
   805		__le16 StructureSize; /* Must be 48 */
   806		__le16 LockCount;
   807		/*
   808		 * The least significant four bits are the index, the other 28 bits are
   809		 * the lock sequence number (0 to 64). See MS-SMB2 2.2.26
   810		 */
   811		__le32 LockSequenceNumber;
   812		__u64  PersistentFileId;
   813		__u64  VolatileFileId;
   814		/* Followed by at least one */
   815		union {
   816			struct smb2_lock_element lock;
 > 817			DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
   818		};
   819	} __packed;
   820	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
