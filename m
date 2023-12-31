Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A05C8CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Dec 2023 22:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVuUR8Nt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704061897; x=1735597897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tZKWzP2vsQ1X01kMkVwBVV4SK7G7oYrI6RCh+ixkJqI=;
  b=fVuUR8NtdPbkg+7HZ6zNKn1cJv1LKZ08+gKy94fSit9IR1+XpE3uDsQq
   RnU9s1tXehUk5TA2gx/D4X1wI6Y1+6VVVxFsfG0ivVnH1icuFEM+bMxQm
   k0A3cwRjWZ9m4f6MSTpUL3X6oM4pkEr/uHYy7alIT+HdF9c5hrhGRVcUO
   5w0IhhMP9LwOUWQZ95z881svSSbBTT5uSuGovQBKN4yG4gZ1TSZuM3gOF
   5YT1dYW3ClGVwTk2ACN540O8XjXlzHC/KmAYCbUcIIVKY0Nh04LYnwMDu
   0KxukcLfpmSn6LlHfFig+E0tmWZEu2l6AhkdmA7CjeXjCXcH6gTnhS6wl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="463172164"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; 
   d="scan'208";a="463172164"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2023 14:31:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="849733788"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; 
   d="scan'208";a="849733788"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 31 Dec 2023 14:31:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rK4Kh-000JmW-30;
	Sun, 31 Dec 2023 22:31:07 +0000
Date: Mon, 1 Jan 2024 06:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 198/215] fs/bcachefs/super-io.c:497:19:
 sparse: sparse: cast to restricted __le32
Message-ID: <202401010621.kF5qMPT0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   67503f8d4fce74d45b8bc5c098eb24c33e6e6b46
commit: 66ac54850bf4b835b7c2d96c1e23bce582c437bf [198/215] bcachefs: bch_sb.recovery_passes_required
config: i386-randconfig-062-20231231 (https://download.01.org/0day-ci/archive/20240101/202401010621.kF5qMPT0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240101/202401010621.kF5qMPT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401010621.kF5qMPT0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/super-io.c: note: in included file:
   fs/bcachefs/bcachefs.h:1021:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/super-io.c:497:19: sparse: sparse: cast to restricted __le32
>> fs/bcachefs/super-io.c:496:19: sparse: sparse: cast to restricted __le64

vim +497 fs/bcachefs/super-io.c

   492	
   493	static unsigned long le_ulong_to_cpu(unsigned long v)
   494	{
   495		return sizeof(unsigned long) == 8
 > 496			? le64_to_cpu(v)
 > 497			: le32_to_cpu(v);
   498	}
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
