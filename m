Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8B669E0C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706697512; cv=none; b=bmOOfdVL3sm8Ymk9ARiOsYvfnFr7HK7Gbz7RokIW1GXRoOOWbUQ5Wxb2BT1naefblN/d5jcIeePU4fDcui/cjb/tQRVGQ6+KhW/7o3RFLge1DqIZxY03cpT2JgOMlSnXlbeOVJ6cR2zcDu8gDAyL/qN2Phxw6WjZqHAqaO12hyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706697512; c=relaxed/simple;
	bh=9qas5mNuhAhKNW2QQ+ffB4VVH71gFFIrEgnEzWf5wfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mQEG8a48onmVu5ffhLwpb2PHaaHVilr9Kg5B69VabaxdwO3gikbxkYTGl2Ci+bnTHCYO2SHN9ZzBM7Lc0+X+LRiUF08hbSDh5wbmFEotrpBXnw8HUxBuw3euwgk2WN6QXLrnNPU/8qLI7y3fPcY6O3VytnsJpk016ywYuL/ve5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TeFJ0TEj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TeFJ0TEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706697510; x=1738233510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9qas5mNuhAhKNW2QQ+ffB4VVH71gFFIrEgnEzWf5wfY=;
  b=TeFJ0TEjreyvoVEomEmncBiU0hsD+URFSptqVteZm8G6axk22W9MmDMq
   skJXXQ40LdC+mgJx6cWIHSjRUf/ug4mq47L5txE6wneg9Xx12MZbTeclN
   Wzydih8tXbNCfWiaWPdAHTi+n/yde/hWZ7Bb+6FAEiq04E72TAD8nN2f1
   bfaD7fRWPuSTqiqn6hFKUas6z4UOyga5JQvVMChWNB9taT9xri3frX8pn
   jgcGDIEm8O28Snu0Z3igghiZ2SJATsle87VhQepbZ5Te++aw7RRx/OKK9
   7dAdAiPW8EUSvakNgPum3DO1E6+H62HKJEsEUuG0b0QnGGzWhB9mR27d9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10315564"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10315564"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 02:38:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4120349"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 31 Jan 2024 02:38:28 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV7z6-0001Su-2G;
	Wed, 31 Jan 2024 10:38:25 +0000
Date: Wed, 31 Jan 2024 18:37:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 1/54] drivers/tty/vt/vt.c:305:13: error:
 redefinition of 'con_putc'
Message-ID: <202401311801.BvcKi62N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   ad48c5284035dd0818636f53e8320628c5142526
commit: c8bb010c206d93500d9dc638dc3cf29b35e8edb6 [1/54] tty: vt: add con_putc() helper
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240131/202401311801.BvcKi62N-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311801.BvcKi62N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311801.BvcKi62N-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/tty/vt/vt.c:305:13: error: redefinition of 'con_putc'
     305 | static void con_putc(struct vc_data *vc, u16 ca, unsigned int y, unsigned int x)
         |             ^~~~~~~~
   drivers/tty/vt/vt.c:297:13: note: previous definition of 'con_putc' with type 'void(struct vc_data *, u16,  unsigned int,  unsigned int)' {aka 'void(struct vc_data *, short unsigned int,  unsigned int,  unsigned int)'}
     297 | static void con_putc(struct vc_data *vc, u16 ca, unsigned int y, unsigned int x)
         |             ^~~~~~~~
>> drivers/tty/vt/vt.c:297:13: warning: 'con_putc' defined but not used [-Wunused-function]


vim +/con_putc +305 drivers/tty/vt/vt.c

   296	
 > 297	static void con_putc(struct vc_data *vc, u16 ca, unsigned int y, unsigned int x)
   298	{
   299		if (vc->vc_sw->con_putc)
   300			vc->vc_sw->con_putc(vc, ca, y, x);
   301		else
   302			vc->vc_sw->con_putcs(vc, &ca, 1, y, x);
   303	}
   304	
 > 305	static void con_putc(struct vc_data *vc, u16 ca, unsigned int y, unsigned int x)
   306	{
   307		if (vc->vc_sw->con_putc)
   308			vc->vc_sw->con_putc(vc, ca, y, x);
   309		else
   310			vc->vc_sw->con_putcs(vc, &ca, 1, y, x);
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
