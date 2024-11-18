Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859E78F66
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 01:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731894224; cv=none; b=GdaZZ47pS8v8Nw7xdkdvMLT91FQU1dt89BGi9skFgBSCS/yERa3wE0C10iGAh64a9fmwbcvMZBJFMbR0rZ0LCpxJPwbb+7UtM1pTMTl+4k4ZBONdxePBW7lODE2fGECJzCnb3ZAJ/gWJmPlohxPQRieq5kgziIodV6/lBAKFtjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731894224; c=relaxed/simple;
	bh=YAdzl53wr32CIwWD+VTziOpSA6k3uBhRyzFc6sDOoW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AY/0DDs95TwS+7lGjB/h1qDbHoAiyWypWV0PYS5rXTwtAp2RfSYcVVecAHVV7suOfmAddYoucMUc4erZHLDAnWWLntqH2MJ1rnXWAm04II3BdSTlkOcifW6s5avaYIbvvXwjMO/KPwaXDEEUumGU83KdbYxN/fnZX6p71Nj5XkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtvSl5yC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtvSl5yC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731894223; x=1763430223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YAdzl53wr32CIwWD+VTziOpSA6k3uBhRyzFc6sDOoW8=;
  b=FtvSl5yCobgdphoeiYEIF0zeWD8C1eTh7IIGWat2Ce8ESXSugziVY0Qm
   PBV8k0iw2I0XfBJhSNTCwxxIwDRLPL5+SM37qOHItZLwEJ/KG0gmhpuA9
   v+oKxgYEditH7jxmjA/KLQuf/377zHJwnaPuArmCmZr+crzZ4VL92p8MT
   bdqbx2j9bcVz4uzggV0hDAANAltcgOzJtPWv3cY+pv11//CgW2BwBba6r
   zBx0iLk4lmgf5kKO2ahvlrRAxQMYq82p2elIUJr1qWfK7+sPk+8smn+es
   6n1Ec2HBy21jUE60JTYmW5l1dQSiZ5qCdzWseAM4da/ctzzpoD+P6tlh5
   g==;
X-CSE-ConnectionGUID: T2WSY7MvSmStsvnemJ/ptQ==
X-CSE-MsgGUID: my+Oiz+fQ/y/0I09ApCb4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42465509"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="42465509"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 17:43:42 -0800
X-CSE-ConnectionGUID: n6OokZBNT4uZtzqFt+sr/A==
X-CSE-MsgGUID: WI08G+sWSEW0aeOLR9u4kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="94010378"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2024 17:43:41 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCqni-0002Bz-1a;
	Mon, 18 Nov 2024 01:43:38 +0000
Date: Mon, 18 Nov 2024 09:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 14/150]
 arch/powerpc/kernel/secvar-sysfs.c:142:24: error: assignment of member
 'size' in read-only object
Message-ID: <202411180922.Nqpocvg1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   7a315c5c3a11f198244918c63efbc9205fc501a1
commit: b9c98b9876d636cc1a76b8c41c4d5436809468f9 [14/150] powerpc
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20241118/202411180922.Nqpocvg1-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180922.Nqpocvg1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180922.Nqpocvg1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/secvar-sysfs.c: In function 'update_kobj_size':
>> arch/powerpc/kernel/secvar-sysfs.c:142:24: error: assignment of member 'size' in read-only object
     142 |         data_attr.size = varsize;
         |                        ^
   arch/powerpc/kernel/secvar-sysfs.c:143:26: error: assignment of member 'size' in read-only object
     143 |         update_attr.size = varsize;
         |                          ^


vim +/size +142 arch/powerpc/kernel/secvar-sysfs.c

bd5d9c743d38f6 Nayna Jain     2019-11-10  135  
bd5d9c743d38f6 Nayna Jain     2019-11-10  136  	u64 varsize;
e0240794405255 Russell Currey 2023-02-10  137  	int rc = secvar_ops->max_size(&varsize);
bd5d9c743d38f6 Nayna Jain     2019-11-10  138  
bd5d9c743d38f6 Nayna Jain     2019-11-10  139  	if (rc)
e0240794405255 Russell Currey 2023-02-10  140  		return rc;
bd5d9c743d38f6 Nayna Jain     2019-11-10  141  
bd5d9c743d38f6 Nayna Jain     2019-11-10 @142  	data_attr.size = varsize;
bd5d9c743d38f6 Nayna Jain     2019-11-10  143  	update_attr.size = varsize;
bd5d9c743d38f6 Nayna Jain     2019-11-10  144  
e0240794405255 Russell Currey 2023-02-10  145  	return 0;
bd5d9c743d38f6 Nayna Jain     2019-11-10  146  }
bd5d9c743d38f6 Nayna Jain     2019-11-10  147  

:::::: The code at line 142 was first introduced by commit
:::::: bd5d9c743d38f67d64ea1b512a461f6b5a5f6bec powerpc: expose secure variables to userspace via sysfs

:::::: TO: Nayna Jain <nayna@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
