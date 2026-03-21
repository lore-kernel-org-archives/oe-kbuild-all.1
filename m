Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F402D949C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 04:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774067277; cv=none; b=ilzIDj+dT6E6IZAH1COT5yOhVrYvjOGa/xpxUMFFkNTb3g/AfPuOj0y4gFpScxN3QdwnU89U4mh1xVsjd0smC/3Oby6jnzwTIiHHJ7zAlZWmj5oP2QqNykoEd3dtdGwGjXnA5bXjE8NjW8YiqsCRybFonEz+hyckMJTjXXrSiSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774067277; c=relaxed/simple;
	bh=ImnqS5a6no+zig2QFpM8XA1x5j5gKIzFsuJCA390W90=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WZXwZ9AtPztGq1RizXGxQFQ/nIa4j1BvwdswADasREVRvQ9ZqMEtNJyetsoFhmbKbptSKMkDQBDTKtjfyauNhB3pAHduRU1SmhxJ/TfVCYdlum+Cf1OZxf3lhdKw6qv2SLCDP28tqsfPiHk80+HKkykNfA6ns54yo8jH5uHif5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekGP67mN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekGP67mN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774067275; x=1805603275;
  h=date:from:to:cc:subject:message-id;
  bh=ImnqS5a6no+zig2QFpM8XA1x5j5gKIzFsuJCA390W90=;
  b=ekGP67mNvJyyzeCBvy7L1S79VAOFgFBAWzL59gZJE1EG8bF2/PoRlWdY
   Fmicv5ggcOOXKH2fqG72Itudnv8AAEi8X+S6OqXiXxdiYRs5Zr1S+J1FC
   sbwTx/FsMTnAAOvg/O4l3NLfimfyB8iF3phicvwxHacd8nBcgnp20QMi6
   AKUASBpcvjW0l2YjTJ6UbjKHZovh80ffOQF9mcbAGr5Fj3oGffUFNDwBv
   WpO2NNU5zLvUGtg16KnDTI5f9tGAll9tebvPAG6lk/JM5sshAk9JiXKuY
   KQvMwH1exkMibnF+u0k54We5XjNLO13wcuv3CwGvkhQpxW4FQJBNtPAI6
   Q==;
X-CSE-ConnectionGUID: 3LWyTxP2QwefaatIne13Jw==
X-CSE-MsgGUID: JQaKKZTOTRW9yEZSsVCS2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75121879"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75121879"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 21:27:55 -0700
X-CSE-ConnectionGUID: jt54tj/lQh2IAirhnplCCQ==
X-CSE-MsgGUID: rWbaA63sQdqqdxGXUKilWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="261385033"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Mar 2026 21:27:54 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3nwF-000000000ID-0vz6;
	Sat, 21 Mar 2026 04:27:51 +0000
Date: Sat, 21 Mar 2026 12:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:user_path_file 4/4] Warning: fs/open.c:905 bad
 line:
Message-ID: <202603211207.BLyWjy9E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux user_path_file
head:   eddcc69d8fdf2df5597db67e422d6b91f0ce7be7
commit: eddcc69d8fdf2df5597db67e422d6b91f0ce7be7 [4/4] fs: allow backing file code to open an O_PATH file with negative dentry
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260321/202603211207.BLyWjy9E-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211207.BLyWjy9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211207.BLyWjy9E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/open.c:905 bad line: 
>> Warning: fs/open.c:905 bad line: 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
