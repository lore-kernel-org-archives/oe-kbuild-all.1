Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87ED15A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 01:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717981378; cv=none; b=sRF5fnl57WTR5+VS4ZJOyFYdNIrdwmY6biW+jaEEBMsOWPcA4TAwEPP0YR6IS8QbSdB3zLXIqVMYGzrNfHaFeCg/ltCyECfVsczFVCoUjisEFtVUC/ZQH3D1FFrvm9goSchE0mwkKn9SJGNhyvISFwfFEXqIAQ9xy6cGNHPacNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717981378; c=relaxed/simple;
	bh=OX0B5XwGj4pKXCx0ZuDFKPQCwPT7WblmGiuXmbkPC6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FRvasdBJZP5Bzv9QcxUfl4M/DMNiqtLXfEHXMKQJ4s3eFgH69NYmTpjpaQJvfNcLzsth3L0vEEklbbSPrhqjsAEVmgt4cn1cnDsHkT7rfE4GwbjJIPF7YK4fAPzDtW6Y5wiXYR48fd/Je28svynktDnM/eTP62RTTiaDx1xGVm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vir2qumf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vir2qumf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717981376; x=1749517376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OX0B5XwGj4pKXCx0ZuDFKPQCwPT7WblmGiuXmbkPC6o=;
  b=Vir2qumfSA21Q2D5b0adplt0ai+wgfwM1K2E12/076U+hmo9OqjoBJ9m
   Emd1XEHlQDHxPAcdNUAcP30eL/PiemlKDLbt/TENHFZtujM5Rp47xGgxB
   FjXqCFJmlGeRnyD0IhetMKOJjdhQpgzV6n9O8BiG1i++bvPQMhWM1A3mz
   h2bCTp/j5oEU0cjGv6DIl3bPqTx/sOsfNz2cqQj9d4nn8hqseSX9BtYhM
   /mC0L60TfYClYcz3kaS8nq58h5YOIOW6M0/25N3WHtfLh6BAoUw4Rj06x
   iOv4wpfBOf3K0ZrGTdga2i2gFEMU2saLo5LOHEYk2KO7phOlC+jkZFTLy
   Q==;
X-CSE-ConnectionGUID: I2e1vhjDSeeASKw8uB14Ng==
X-CSE-MsgGUID: zBoWa847TPidkm3q1VqYvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="11989175"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="11989175"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 18:02:55 -0700
X-CSE-ConnectionGUID: iWtCGqoGRDWJHYhBj0GrVg==
X-CSE-MsgGUID: 7fzlvwqrT/u/23CLccs5NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="43467597"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jun 2024 18:02:54 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGTQx-0001j4-29;
	Mon, 10 Jun 2024 01:02:51 +0000
Date: Mon, 10 Jun 2024 09:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Antipov <dmantipov@yandex.ru>
Subject: [samba-ksmbd:for-next 546/600] fs/cifs/cifspdu.h:885:9: error:
 expected specifier-qualifier-list before 'struct_group'
Message-ID: <202406100856.wBb3JwZw-lkp@intel.com>
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
commit: ac97f75062003d06fedfdc4ac7bf5af08a28fab3 [546/600] smb: client, common: fix fortify warnings
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240610/202406100856.wBb3JwZw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100856.wBb3JwZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100856.wBb3JwZw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/cifs/cifsfs.c:32:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
>> fs/cifs/cifspdu.h:885:9: error: expected specifier-qualifier-list before 'struct_group'
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
                    from fs/cifs/cifsfs.c:34:
>> fs/cifs/../smbfs_common/smb2pdu.h:705:9: error: expected specifier-qualifier-list before 'struct_group'
     705 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:845:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     845 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1685:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1685 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:27:
>> fs/cifs/smb2pdu.h:322:9: error: expected specifier-qualifier-list before 'struct_group'
     322 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   fs/cifs/cifsglob.h: In function 'move_cifs_info_to_smb2':
>> fs/cifs/cifsglob.h:2161:45: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2161 |         memcpy(dst, src, (size_t)((u8 *)&src->AccessFlags - (u8 *)src));
         |                                             ^~
   fs/cifs/cifsglob.h:2162:31: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2162 |         dst->AccessFlags = src->AccessFlags;
         |                               ^~
>> fs/cifs/cifsglob.h:2163:37: error: 'FILE_ALL_INFO' has no member named 'CurrentByteOffset'
    2163 |         dst->CurrentByteOffset = src->CurrentByteOffset;
         |                                     ^~
>> fs/cifs/cifsglob.h:2164:24: error: 'FILE_ALL_INFO' has no member named 'Mode'
    2164 |         dst->Mode = src->Mode;
         |                        ^~
>> fs/cifs/cifsglob.h:2165:40: error: 'FILE_ALL_INFO' has no member named 'AlignmentRequirement'
    2165 |         dst->AlignmentRequirement = src->AlignmentRequirement;
         |                                        ^~
>> fs/cifs/cifsglob.h:2166:34: error: 'FILE_ALL_INFO' has no member named 'FileNameLength'
    2166 |         dst->FileNameLength = src->FileNameLength;
         |                                  ^~
--
   In file included from fs/cifs/connect.c:35:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
>> fs/cifs/cifspdu.h:885:9: error: expected specifier-qualifier-list before 'struct_group'
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
                    from fs/cifs/connect.c:36:
>> fs/cifs/../smbfs_common/smb2pdu.h:705:9: error: expected specifier-qualifier-list before 'struct_group'
     705 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:845:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     845 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1685:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1685 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:27:
>> fs/cifs/smb2pdu.h:322:9: error: expected specifier-qualifier-list before 'struct_group'
     322 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   fs/cifs/cifsglob.h: In function 'move_cifs_info_to_smb2':
>> fs/cifs/cifsglob.h:2161:45: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2161 |         memcpy(dst, src, (size_t)((u8 *)&src->AccessFlags - (u8 *)src));
         |                                             ^~
   fs/cifs/cifsglob.h:2162:31: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2162 |         dst->AccessFlags = src->AccessFlags;
         |                               ^~
>> fs/cifs/cifsglob.h:2163:37: error: 'FILE_ALL_INFO' has no member named 'CurrentByteOffset'
    2163 |         dst->CurrentByteOffset = src->CurrentByteOffset;
         |                                     ^~
>> fs/cifs/cifsglob.h:2164:24: error: 'FILE_ALL_INFO' has no member named 'Mode'
    2164 |         dst->Mode = src->Mode;
         |                        ^~
>> fs/cifs/cifsglob.h:2165:40: error: 'FILE_ALL_INFO' has no member named 'AlignmentRequirement'
    2165 |         dst->AlignmentRequirement = src->AlignmentRequirement;
         |                                        ^~
>> fs/cifs/cifsglob.h:2166:34: error: 'FILE_ALL_INFO' has no member named 'FileNameLength'
    2166 |         dst->FileNameLength = src->FileNameLength;
         |                                  ^~
   fs/cifs/connect.c: In function 'cifs_get_smb_ses':
   fs/cifs/connect.c:2344:49: warning: passing argument 1 of 'load_nls' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2344 |         ses->local_nls = load_nls(ctx->local_nls->charset);
         |                                   ~~~~~~~~~~~~~~^~~~~~~~~
   In file included from fs/cifs/cifsproto.h:10,
                    from fs/cifs/connect.c:37:
   include/linux/nls.h:50:35: note: expected 'char *' but argument is of type 'const char *'
      50 | extern struct nls_table *load_nls(char *);
         |                                   ^~~~~~
--
   In file included from fs/cifs/link.c:13:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
>> fs/cifs/cifspdu.h:885:9: error: expected specifier-qualifier-list before 'struct_group'
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
                    from fs/cifs/link.c:14:
>> fs/cifs/../smbfs_common/smb2pdu.h:705:9: error: expected specifier-qualifier-list before 'struct_group'
     705 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:845:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     845 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1685:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1685 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:27:
>> fs/cifs/smb2pdu.h:322:9: error: expected specifier-qualifier-list before 'struct_group'
     322 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   fs/cifs/cifsglob.h: In function 'move_cifs_info_to_smb2':
>> fs/cifs/cifsglob.h:2161:45: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2161 |         memcpy(dst, src, (size_t)((u8 *)&src->AccessFlags - (u8 *)src));
         |                                             ^~
   fs/cifs/cifsglob.h:2162:31: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2162 |         dst->AccessFlags = src->AccessFlags;
         |                               ^~
>> fs/cifs/cifsglob.h:2163:37: error: 'FILE_ALL_INFO' has no member named 'CurrentByteOffset'
    2163 |         dst->CurrentByteOffset = src->CurrentByteOffset;
         |                                     ^~
>> fs/cifs/cifsglob.h:2164:24: error: 'FILE_ALL_INFO' has no member named 'Mode'
    2164 |         dst->Mode = src->Mode;
         |                        ^~
>> fs/cifs/cifsglob.h:2165:40: error: 'FILE_ALL_INFO' has no member named 'AlignmentRequirement'
    2165 |         dst->AlignmentRequirement = src->AlignmentRequirement;
         |                                        ^~
>> fs/cifs/cifsglob.h:2166:34: error: 'FILE_ALL_INFO' has no member named 'FileNameLength'
    2166 |         dst->FileNameLength = src->FileNameLength;
         |                                  ^~
   fs/cifs/link.c: In function 'cifs_query_mf_symlink':
>> fs/cifs/link.c:276:22: error: 'FILE_ALL_INFO' has no member named 'EndOfFile'
     276 |         if (file_info.EndOfFile != cpu_to_le64(CIFS_MF_SYMLINK_FILE_SIZE)) {
         |                      ^
--
   In file included from fs/cifs/cifsglob.h:26,
                    from fs/cifs/cached_dir.c:9:
>> fs/cifs/../smbfs_common/smb2pdu.h:705:9: error: expected specifier-qualifier-list before 'struct_group'
     705 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:845:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     845 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1685:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1685 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:27:
>> fs/cifs/smb2pdu.h:322:9: error: expected specifier-qualifier-list before 'struct_group'
     322 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:97:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
>> fs/cifs/cifspdu.h:885:9: error: expected specifier-qualifier-list before 'struct_group'
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
   fs/cifs/cifsglob.h: In function 'move_cifs_info_to_smb2':
>> fs/cifs/cifsglob.h:2161:45: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2161 |         memcpy(dst, src, (size_t)((u8 *)&src->AccessFlags - (u8 *)src));
         |                                             ^~
   fs/cifs/cifsglob.h:2162:31: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2162 |         dst->AccessFlags = src->AccessFlags;
         |                               ^~
>> fs/cifs/cifsglob.h:2163:37: error: 'FILE_ALL_INFO' has no member named 'CurrentByteOffset'
    2163 |         dst->CurrentByteOffset = src->CurrentByteOffset;
         |                                     ^~
>> fs/cifs/cifsglob.h:2164:24: error: 'FILE_ALL_INFO' has no member named 'Mode'
    2164 |         dst->Mode = src->Mode;
         |                        ^~
>> fs/cifs/cifsglob.h:2165:40: error: 'FILE_ALL_INFO' has no member named 'AlignmentRequirement'
    2165 |         dst->AlignmentRequirement = src->AlignmentRequirement;
         |                                        ^~
>> fs/cifs/cifsglob.h:2166:34: error: 'FILE_ALL_INFO' has no member named 'FileNameLength'
    2166 |         dst->FileNameLength = src->FileNameLength;
         |                                  ^~
--
   In file included from fs/cifs/readdir.c:15:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
>> fs/cifs/cifspdu.h:885:9: error: expected specifier-qualifier-list before 'struct_group'
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
>> fs/cifs/../smbfs_common/smb2pdu.h:705:9: error: expected specifier-qualifier-list before 'struct_group'
     705 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:845:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     845 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1685:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1685 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:27:
>> fs/cifs/smb2pdu.h:322:9: error: expected specifier-qualifier-list before 'struct_group'
     322 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   fs/cifs/cifsglob.h: In function 'move_cifs_info_to_smb2':
>> fs/cifs/cifsglob.h:2161:45: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2161 |         memcpy(dst, src, (size_t)((u8 *)&src->AccessFlags - (u8 *)src));
         |                                             ^~
   fs/cifs/cifsglob.h:2162:31: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2162 |         dst->AccessFlags = src->AccessFlags;
         |                               ^~
>> fs/cifs/cifsglob.h:2163:37: error: 'FILE_ALL_INFO' has no member named 'CurrentByteOffset'
    2163 |         dst->CurrentByteOffset = src->CurrentByteOffset;
         |                                     ^~
>> fs/cifs/cifsglob.h:2164:24: error: 'FILE_ALL_INFO' has no member named 'Mode'
    2164 |         dst->Mode = src->Mode;
         |                        ^~
>> fs/cifs/cifsglob.h:2165:40: error: 'FILE_ALL_INFO' has no member named 'AlignmentRequirement'
    2165 |         dst->AlignmentRequirement = src->AlignmentRequirement;
         |                                        ^~
>> fs/cifs/cifsglob.h:2166:34: error: 'FILE_ALL_INFO' has no member named 'FileNameLength'
    2166 |         dst->FileNameLength = src->FileNameLength;
         |                                  ^~
   fs/cifs/readdir.c: In function 'cifs_fill_dirent_unix':
   fs/cifs/readdir.c:549:25: error: 'FILE_UNIX_INFO' has no member named 'FileName'
     549 |         de->name = &info->FileName[0];
         |                         ^~
--
   In file included from fs/cifs/cifsglob.h:26,
                    from fs/cifs/smb2ops.c:18:
>> fs/cifs/../smbfs_common/smb2pdu.h:705:9: error: expected specifier-qualifier-list before 'struct_group'
     705 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:845:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     845 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1685:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1685 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:27:
>> fs/cifs/smb2pdu.h:322:9: error: expected specifier-qualifier-list before 'struct_group'
     322 |         struct_group(network_open_info,
         |         ^~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:97:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
>> fs/cifs/cifspdu.h:885:9: error: expected specifier-qualifier-list before 'struct_group'
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
   fs/cifs/cifsglob.h: In function 'move_cifs_info_to_smb2':
>> fs/cifs/cifsglob.h:2161:45: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2161 |         memcpy(dst, src, (size_t)((u8 *)&src->AccessFlags - (u8 *)src));
         |                                             ^~
   fs/cifs/cifsglob.h:2162:31: error: 'FILE_ALL_INFO' has no member named 'AccessFlags'
    2162 |         dst->AccessFlags = src->AccessFlags;
         |                               ^~
>> fs/cifs/cifsglob.h:2163:37: error: 'FILE_ALL_INFO' has no member named 'CurrentByteOffset'
    2163 |         dst->CurrentByteOffset = src->CurrentByteOffset;
         |                                     ^~
>> fs/cifs/cifsglob.h:2164:24: error: 'FILE_ALL_INFO' has no member named 'Mode'
    2164 |         dst->Mode = src->Mode;
         |                        ^~
>> fs/cifs/cifsglob.h:2165:40: error: 'FILE_ALL_INFO' has no member named 'AlignmentRequirement'
    2165 |         dst->AlignmentRequirement = src->AlignmentRequirement;
         |                                        ^~
>> fs/cifs/cifsglob.h:2166:34: error: 'FILE_ALL_INFO' has no member named 'FileNameLength'
    2166 |         dst->FileNameLength = src->FileNameLength;
         |                                  ^~
   fs/cifs/smb2ops.c: In function 'smb2_close_getattr':
>> fs/cifs/smb2ops.c:1411:21: error: 'struct smb2_file_network_open_info' has no member named 'LastWriteTime'
    1411 |         if (file_inf.LastWriteTime)
         |                     ^
   fs/cifs/smb2ops.c:1412:60: error: 'struct smb2_file_network_open_info' has no member named 'LastWriteTime'
    1412 |                 inode->i_mtime = cifs_NTtimeToUnix(file_inf.LastWriteTime);
         |                                                            ^
>> fs/cifs/smb2ops.c:1413:21: error: 'struct smb2_file_network_open_info' has no member named 'ChangeTime'
    1413 |         if (file_inf.ChangeTime)
         |                     ^
   fs/cifs/smb2ops.c:1414:60: error: 'struct smb2_file_network_open_info' has no member named 'ChangeTime'
    1414 |                 inode->i_ctime = cifs_NTtimeToUnix(file_inf.ChangeTime);
         |                                                            ^
>> fs/cifs/smb2ops.c:1415:21: error: 'struct smb2_file_network_open_info' has no member named 'LastAccessTime'
    1415 |         if (file_inf.LastAccessTime)
         |                     ^
   fs/cifs/smb2ops.c:1416:60: error: 'struct smb2_file_network_open_info' has no member named 'LastAccessTime'
    1416 |                 inode->i_atime = cifs_NTtimeToUnix(file_inf.LastAccessTime);
         |                                                            ^
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:13,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/parisc/include/uapi/asm/byteorder.h:5,
                    from arch/parisc/include/asm/bitops.h:11,
                    from include/linux/bitops.h:33,
                    from include/linux/kernel.h:12,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from include/linux/pagemap.h:8,
                    from fs/cifs/smb2ops.c:8:
>> fs/cifs/smb2ops.c:1423:33: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |                                 ^
   include/uapi/linux/swab.h:131:39: note: in definition of macro '__swab64'
     131 |         (__builtin_constant_p((__u64)(x)) ?     \
         |                                       ^
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1423:13: note: in expansion of macro 'le64_to_cpu'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |             ^~~~~~~~~~~
>> fs/cifs/smb2ops.c:1423:33: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |                                 ^
   include/uapi/linux/swab.h:25:19: note: in definition of macro '___constant_swab64'
      25 |         (((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |   \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: in expansion of macro '__swab64'
      32 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1423:13: note: in expansion of macro 'le64_to_cpu'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |             ^~~~~~~~~~~
>> fs/cifs/smb2ops.c:1423:33: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |                                 ^
   include/uapi/linux/swab.h:26:19: note: in definition of macro '___constant_swab64'
      26 |         (((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |   \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: in expansion of macro '__swab64'
      32 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1423:13: note: in expansion of macro 'le64_to_cpu'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |             ^~~~~~~~~~~
>> fs/cifs/smb2ops.c:1423:33: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |                                 ^
   include/uapi/linux/swab.h:27:19: note: in definition of macro '___constant_swab64'
      27 |         (((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |   \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: in expansion of macro '__swab64'
      32 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1423:13: note: in expansion of macro 'le64_to_cpu'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |             ^~~~~~~~~~~
>> fs/cifs/smb2ops.c:1423:33: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |                                 ^
   include/uapi/linux/swab.h:28:19: note: in definition of macro '___constant_swab64'
      28 |         (((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |   \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: in expansion of macro '__swab64'
      32 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1423:13: note: in expansion of macro 'le64_to_cpu'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |             ^~~~~~~~~~~
>> fs/cifs/smb2ops.c:1423:33: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |                                 ^
   include/uapi/linux/swab.h:29:19: note: in definition of macro '___constant_swab64'
      29 |         (((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |   \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: in expansion of macro '__swab64'
      32 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1423:13: note: in expansion of macro 'le64_to_cpu'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |             ^~~~~~~~~~~
>> fs/cifs/smb2ops.c:1423:33: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |                                 ^
   include/uapi/linux/swab.h:30:19: note: in definition of macro '___constant_swab64'
      30 |         (((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |   \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: in expansion of macro '__swab64'
      32 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1423:13: note: in expansion of macro 'le64_to_cpu'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |             ^~~~~~~~~~~
>> fs/cifs/smb2ops.c:1423:33: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |                                 ^
   include/uapi/linux/swab.h:31:19: note: in definition of macro '___constant_swab64'
      31 |         (((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |   \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: in expansion of macro '__swab64'
      32 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1423:13: note: in expansion of macro 'le64_to_cpu'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |             ^~~~~~~~~~~
>> fs/cifs/smb2ops.c:1423:33: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |                                 ^
   include/uapi/linux/swab.h:32:19: note: in definition of macro '___constant_swab64'
      32 |         (((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: in expansion of macro '__swab64'
      32 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1423:13: note: in expansion of macro 'le64_to_cpu'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |             ^~~~~~~~~~~
   fs/cifs/smb2ops.c:1423:33: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |                                 ^
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1423:13: note: in expansion of macro 'le64_to_cpu'
    1423 |         if (le64_to_cpu(file_inf.AllocationSize) > 4096)
         |             ^~~~~~~~~~~
   fs/cifs/smb2ops.c:1425:56: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1425 |                         (512 - 1 + le64_to_cpu(file_inf.AllocationSize)) >> 9;
         |                                                        ^
   include/uapi/linux/swab.h:131:39: note: in definition of macro '__swab64'
     131 |         (__builtin_constant_p((__u64)(x)) ?     \
         |                                       ^
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1425:36: note: in expansion of macro 'le64_to_cpu'
    1425 |                         (512 - 1 + le64_to_cpu(file_inf.AllocationSize)) >> 9;
         |                                    ^~~~~~~~~~~
   fs/cifs/smb2ops.c:1425:56: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1425 |                         (512 - 1 + le64_to_cpu(file_inf.AllocationSize)) >> 9;
         |                                                        ^
   include/uapi/linux/swab.h:25:19: note: in definition of macro '___constant_swab64'
      25 |         (((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |   \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: in expansion of macro '__swab64'
      32 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1425:36: note: in expansion of macro 'le64_to_cpu'
    1425 |                         (512 - 1 + le64_to_cpu(file_inf.AllocationSize)) >> 9;
         |                                    ^~~~~~~~~~~
   fs/cifs/smb2ops.c:1425:56: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1425 |                         (512 - 1 + le64_to_cpu(file_inf.AllocationSize)) >> 9;
         |                                                        ^
   include/uapi/linux/swab.h:26:19: note: in definition of macro '___constant_swab64'
      26 |         (((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |   \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: in expansion of macro '__swab64'
      32 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1425:36: note: in expansion of macro 'le64_to_cpu'
    1425 |                         (512 - 1 + le64_to_cpu(file_inf.AllocationSize)) >> 9;
         |                                    ^~~~~~~~~~~
   fs/cifs/smb2ops.c:1425:56: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1425 |                         (512 - 1 + le64_to_cpu(file_inf.AllocationSize)) >> 9;
         |                                                        ^
   include/uapi/linux/swab.h:27:19: note: in definition of macro '___constant_swab64'
      27 |         (((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |   \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: in expansion of macro '__swab64'
      32 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1425:36: note: in expansion of macro 'le64_to_cpu'
    1425 |                         (512 - 1 + le64_to_cpu(file_inf.AllocationSize)) >> 9;
         |                                    ^~~~~~~~~~~
   fs/cifs/smb2ops.c:1425:56: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1425 |                         (512 - 1 + le64_to_cpu(file_inf.AllocationSize)) >> 9;
         |                                                        ^
   include/uapi/linux/swab.h:28:19: note: in definition of macro '___constant_swab64'
      28 |         (((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |   \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: in expansion of macro '__swab64'
      32 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:1425:36: note: in expansion of macro 'le64_to_cpu'
    1425 |                         (512 - 1 + le64_to_cpu(file_inf.AllocationSize)) >> 9;
         |                                    ^~~~~~~~~~~
   fs/cifs/smb2ops.c:1425:56: error: 'struct smb2_file_network_open_info' has no member named 'AllocationSize'
    1425 |                         (512 - 1 + le64_to_cpu(file_inf.AllocationSize)) >> 9;
..


vim +/struct_group +885 fs/cifs/cifspdu.h

   876	
   877	typedef struct smb_com_open_rsp {
   878		struct smb_hdr hdr;	/* wct = 34 BB */
   879		__u8 AndXCommand;
   880		__u8 AndXReserved;
   881		__le16 AndXOffset;
   882		__u8 OplockLevel;
   883		__u16 Fid;
   884		__le32 CreateAction;
 > 885		struct_group(common_attributes,
   886			__le64 CreationTime;
   887			__le64 LastAccessTime;
   888			__le64 LastWriteTime;
   889			__le64 ChangeTime;
   890			__le32 FileAttributes;
   891		);
   892		__le64 AllocationSize;
   893		__le64 EndOfFile;
   894		__le16 FileType;
   895		__le16 DeviceState;
   896		__u8 DirectoryFlag;
   897		__u16 ByteCount;	/* bct = 0 */
   898	} __attribute__((packed)) OPEN_RSP;
   899	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
