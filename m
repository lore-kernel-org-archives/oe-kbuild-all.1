Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACB26F312
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718009592; cv=none; b=RetGY06Jma5TXHgL3CDlIoXRwYzUsHwsQYYZJdfxRKQZZv+OiIslSf628Ag2A8KBG02elQJUebM8zhsDQolwzmmMM1YOVqfIKvExt6fFhpGZYviJhTsyES1yGuHGWqwqeIuyf3Gzc85gtYz0wsCIWi2WIwQSOCKCDYKzB8rN/UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718009592; c=relaxed/simple;
	bh=naUd7VV4tw45Oh8uPjXJaHHcB/Gei1aLdXRaNwHZjhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MoOTj5h8ii6uxWwDoTIUJr5NVaFcO/y5hW8eGJesJNrn9xmX3+6fZnnZ4AliVTYzQOwRUBp5uYaFaF9xfQdy0HKbuNuSJARWgQYm3jDREonZ6SOWwIqka0bZZ1FO4AqRzrcHAPlPOkFr6W+PRP5OX1CMU6maVVfbwOLUd1L+Muo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOxo4VmC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOxo4VmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718009590; x=1749545590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=naUd7VV4tw45Oh8uPjXJaHHcB/Gei1aLdXRaNwHZjhs=;
  b=VOxo4VmCx4lDuy5NVCeaFdFsYsYq7N2N4k5j++8bX3H/0YG2UpNCzAbC
   O6j//80beFUNG9lJJkH0BY3nJ8jMLe7uR0r2dXhUxovEP7/nzmhAoto8E
   2A4iGhtuUmvpgV0wl2WzPIVbYWVg0ska1cURwciOSEXiGuRXc5evVbi6f
   c8ENGvi5Stb+lzXA9F2nIees27AD0rmN5myIxHrdtQ3kkcjNOMPCigof/
   ZMhicQXzVg25gpe6efk+bZ0sDwz+9gL7xuh7eQMReDHX870DLhO9jKY4x
   B7Cv8ACKc0zXrMoTKKnwhtkDNFdoVhTNohz5+7VOZ9lBgeP6YquAkNTIN
   g==;
X-CSE-ConnectionGUID: Svh7XuvbS8OOtybyKUe4QQ==
X-CSE-MsgGUID: aS7Jql7PTxOmLTI0E1J5Ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="11993213"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="11993213"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:53:09 -0700
X-CSE-ConnectionGUID: qqWdqcnvT1KvvJ3fWqUcvw==
X-CSE-MsgGUID: PQyI85KBRvSFo+FQnpCh8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39655793"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jun 2024 01:53:08 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGam1-0001zJ-1S;
	Mon, 10 Jun 2024 08:53:05 +0000
Date: Mon, 10 Jun 2024 16:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:for-next 340/600] fs/cifs/readdir.c:554:18: error:
 'FILE_UNIX_INFO' {aka 'const struct <anonymous>'} has no member named
 'FileName'
Message-ID: <202406101624.YY1bBRno-lkp@intel.com>
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
commit: 57058257ea5c99c77c015cb17a3f97d8f6a4cf9f [340/600] cifs: Replace remaining 1-element arrays
config: x86_64-randconfig-001-20240610 (https://download.01.org/0day-ci/archive/20240610/202406101624.YY1bBRno-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101624.YY1bBRno-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406101624.YY1bBRno-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/cifs/readdir.c:15:
   fs/cifs/cifspdu.h:512:3: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |   DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |   ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2289:3: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2289 |   DECLARE_FLEX_ARRAY(char, FileName);
         |   ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2328:2: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2328 |  DECLARE_FLEX_ARRAY(char, LinkDest);
         |  ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2377:2: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2377 |  DECLARE_FLEX_ARRAY(__u8, alt_name);
         |  ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2488:3: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2488 |   DECLARE_FLEX_ARRAY(char, FileName);
         |   ^~~~~~~~~~~~~~~~~~
   fs/cifs/readdir.c: In function 'cifs_fill_dirent_unix':
>> fs/cifs/readdir.c:554:18: error: 'FILE_UNIX_INFO' {aka 'const struct <anonymous>'} has no member named 'FileName'
     554 |  de->name = &info->FileName[0];
         |                  ^~


vim +554 fs/cifs/readdir.c

3d519bd1269f1f Aurelien Aptel    2020-02-08  550  
cda0ec6a86f181 Christoph Hellwig 2011-07-16  551  static void cifs_fill_dirent_unix(struct cifs_dirent *de,
cda0ec6a86f181 Christoph Hellwig 2011-07-16  552  		const FILE_UNIX_INFO *info, bool is_unicode)
cda0ec6a86f181 Christoph Hellwig 2011-07-16  553  {
cda0ec6a86f181 Christoph Hellwig 2011-07-16 @554  	de->name = &info->FileName[0];
cda0ec6a86f181 Christoph Hellwig 2011-07-16  555  	if (is_unicode)
cda0ec6a86f181 Christoph Hellwig 2011-07-16  556  		de->namelen = cifs_unicode_bytelen(de->name);
cda0ec6a86f181 Christoph Hellwig 2011-07-16  557  	else
cda0ec6a86f181 Christoph Hellwig 2011-07-16  558  		de->namelen = strnlen(de->name, PATH_MAX);
cda0ec6a86f181 Christoph Hellwig 2011-07-16  559  	de->resume_key = info->ResumeKey;
cda0ec6a86f181 Christoph Hellwig 2011-07-16  560  	de->ino = le64_to_cpu(info->basic.UniqueId);
cda0ec6a86f181 Christoph Hellwig 2011-07-16  561  }
cda0ec6a86f181 Christoph Hellwig 2011-07-16  562  

:::::: The code at line 554 was first introduced by commit
:::::: cda0ec6a86f18127d490048a46de954c03886d5e cifs: introduce cifs_dirent

:::::: TO: Christoph Hellwig <hch@infradead.org>
:::::: CC: Steve French <sfrench@us.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
