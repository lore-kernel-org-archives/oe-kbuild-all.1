Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713B24655F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 20:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717964614; cv=none; b=QTMLgwSclRasfFsD1hPG7CdlhF9fk/DIOSBNonTomwIGID32XaXf9rNRCB1sQg2EVK40rLa5NIDX05G/1MH2570e14treSiy9f1/YS555YAWb77u1e7xPvjQ5ZTW3R4KeSnB6gfNoh+W5Oie7n5/ak7LfL0DwePcr2bdGJkzQ+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717964614; c=relaxed/simple;
	bh=J4lHRD68icuJMOSOpoVJq/rT+rUlqKNDCwAB4i4eZk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RoGHS2Ll0rTjmfXExkyFfPUuj2h90NnhN5dl8EdeIKkocwnJgGSTiw0iR35BifpWfHRQt0B0IMsfn3PE9U3hirBIC2GBiXrikKyt8LiXzLP6jIOmls0r24rIRHzcQl4g14wSqZeXJLqdg/TqU+Y7D/3S8aqkmrF78LEBiPrYC8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4cYFch9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4cYFch9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717964612; x=1749500612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J4lHRD68icuJMOSOpoVJq/rT+rUlqKNDCwAB4i4eZk0=;
  b=J4cYFch9dBFnmDahE/8JAqpb62zO9zjWugac5EfjDJB06pqcRBHQPpP8
   OMxiTnYd9OW0fVdfxjXJ26RpFpvdRE6nzC/yQsOqZ/Ns9DnAcE9X0lnZT
   8c2VOAlWZyI8tpiwTzJwVCxQC4GxtJ9tB6RmDiCWKL/4/P9c2ZoLsxhgA
   IwrF4tlQdk081ZpFIZWyi5K7yCeksJg8nBh854JOH9zS+0hexWNYTMOn8
   TKlxB3Rvhc688Y6xJJ9VLjzQ6LAApDhZWESAM8ofXgJrMNhJgDH67CV6L
   8Kqj++Uh59m5vrrUMl27JkN3h7q2diTEdduov0d6TKd9Wtxi2rpLLHLTj
   A==;
X-CSE-ConnectionGUID: NdK+x1BdSMuj+PpPurRr2Q==
X-CSE-MsgGUID: 94oBEooiTo6kJ2HoWlj+1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="18478178"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="18478178"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 13:23:30 -0700
X-CSE-ConnectionGUID: YENV1+U9QWGH2DDdQVMq+g==
X-CSE-MsgGUID: HIK8AplXQ4e8qQWiIyiJbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="39416703"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jun 2024 13:23:27 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGP4X-0001ZE-0X;
	Sun, 09 Jun 2024 20:23:25 +0000
Date: Mon, 10 Jun 2024 04:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:for-next 340/600] fs/cifs/readdir.c:554:25: error:
 'FILE_UNIX_INFO' has no member named 'FileName'
Message-ID: <202406100453.iSCVlAIk-lkp@intel.com>
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
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240610/202406100453.iSCVlAIk-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100453.iSCVlAIk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100453.iSCVlAIk-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   fs/cifs/readdir.c: In function 'cifs_fill_dirent_unix':
>> fs/cifs/readdir.c:554:25: error: 'FILE_UNIX_INFO' has no member named 'FileName'
     554 |         de->name = &info->FileName[0];
         |                         ^~


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
