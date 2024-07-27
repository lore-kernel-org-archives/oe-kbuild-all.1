Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C57622616
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 21:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722114401; cv=none; b=f9ojkJGLrPqT3+VZ3YuGBzkXE4Q+T1ycw+ctJvhF/h2bipcIutFueA6Nw3bD4biF5CPlOLbCx/wQnmCy1fjAbSkYGOgXXFbuBjQfmI2cyxhDMn3aNAMEtbLQUceD6WLFRE2Y6QgcS9libtmskZ0Ws9TgyPuCXqP4zkyrwqmpLz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722114401; c=relaxed/simple;
	bh=X/teQ+KCYH40dvlleuVf1SRlq2gY8ECd/T8j96DJn6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O1V3k2oEJlJ7rhRHxvsG9029KUYjOz8W7kSv9yABuU3zVLWXfs5Y55GNS+M1/G13cZcK6Gw/daiqBDCIQkEBI2Kv3miQCWmSNevaknHiulm7PfijI/fkJ1frVGU+fKbf8CsWVZumBlKSk5z4FblrwcPEp9/0JLt4qOanq854vYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLT83xbr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLT83xbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722114400; x=1753650400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X/teQ+KCYH40dvlleuVf1SRlq2gY8ECd/T8j96DJn6w=;
  b=cLT83xbrG+y9te0d2D8PMaNWDkVZRMhO+ImFpy2qOiTphrMN7SDg5YI2
   0V57a5lWuXp8oHe9CWeasrCqg5SMgavMNQO/lpyD40KemlWIEnHsPI79x
   lhSq374t/EqhzDxoBGdu1Phupj1V5/FaUzPdhU92IrYuXCmre5jb1Hmb9
   IQQgrSA//YhGaJW3RekiN+U01ns6nYZbWoXc9Z95eAP4FUdjaddk7mRNm
   QXsyzs9CLsGKrRCVmLQ+1PaaapvSzPLFePZ8ZpmVzDhsC3MUvqcoAV63W
   DofByAcYDPMkl2/L69BoraddRINat4cJ/lbhwbhbgBd28Dlw2cdUFaeXa
   A==;
X-CSE-ConnectionGUID: vmul24AGQ8anp5lFhiUe2w==
X-CSE-MsgGUID: /2ekYqjVQLOL9sfSbK0kCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="37395847"
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="37395847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 14:06:40 -0700
X-CSE-ConnectionGUID: cS4OZVW/QmmyZvuaGxXvsg==
X-CSE-MsgGUID: 3+0sJr+7QWa4yigR3vYRrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="53245068"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jul 2024 14:06:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXoce-000qEm-34;
	Sat, 27 Jul 2024 21:06:36 +0000
Date: Sun, 28 Jul 2024 05:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:for-next 7/8] fs/smb/client/compress/lz77.h:127:16:
 error: implicit declaration of function 'copy_from_kernel_nofault'
Message-ID: <202407280759.cGqYU6ve-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git for-next
head:   da98218c9ac5ff1f00b649b07cf56f93ef0902d3
commit: 7db9a00c4d9bf4996177e4946241885234afb5c0 [7/8] smb3: mark compression as CONFIG_EXPERIMENTAL and fix missing compression operation
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240728/202407280759.cGqYU6ve-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407280759.cGqYU6ve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407280759.cGqYU6ve-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/smb/client/compress/lz77.c:10:
   fs/smb/client/compress/lz77.h: In function 'lz77_copy':
>> fs/smb/client/compress/lz77.h:127:16: error: implicit declaration of function 'copy_from_kernel_nofault' [-Wimplicit-function-declaration]
     127 |         return copy_from_kernel_nofault(dst, src, count);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/copy_from_kernel_nofault +127 fs/smb/client/compress/lz77.h

   124	
   125	static __always_inline long lz77_copy(u8 *dst, const u8 *src, size_t count)
   126	{
 > 127		return copy_from_kernel_nofault(dst, src, count);
   128	}
   129	#else /* CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS */
   130	static __always_inline u8 lz77_read8(const void *ptr)
   131	{
   132		return get_unaligned((u8 *)ptr);
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
