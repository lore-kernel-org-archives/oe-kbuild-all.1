Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFEC22EE5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 01:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751764257; cv=none; b=vFTwlcJKW15cUhIe8rmW13/X7LkUrsdFGoRcOBoT7PdfNYT20mLF6XsdSjXXOcFmW9qhQUCppyZz2TsA6JCw5/P3IwryazOZSE8Hvh33Ht0N59SRQd7Bm+rGswGzr+wwRltDyi4Gx6wSqNDNIoWaRaTO64IMnjBWNiRBxRHzJKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751764257; c=relaxed/simple;
	bh=GrrABMI5nC7PAZz++or8aTT9hnrItyT5DzD/KPUFNrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZswJ3XNu/1zSb6ObN1HLkFqhuZ/5N5PE2BCBCx+6Lil38NKBRy7pGG/VXG3k3swM3KA5eARWpxVru/PrvDLkCvzAM5bBoAYY3Ole9Uv1Qom29c1mcD6bWDqdgNMUSQOrMUwZWQs4PFRkIjb+wOfIYYzmvY73SluhzDJTkMr4hKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxOijdY9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxOijdY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751764255; x=1783300255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GrrABMI5nC7PAZz++or8aTT9hnrItyT5DzD/KPUFNrU=;
  b=dxOijdY9aicjlXtRbQffPvo0uIQ9N0a3oD/7QJTqO3ioNpD1nULssR8/
   /LL4CQd4+vaTqRDGQTbxWSKbIRlNI6EqzmykB6LdDfr7o6FuYLq91DDwN
   Z/3/lhKJKUcjsIxa4jClmpJZmrm06EDM5DqNngM/ydQuDhvJlkrz6hTbB
   EqVNrKCt/vztsagiJJpagQ/St1wqfO8hRFToXy4CI1mQkjffKMhoD1pOw
   nkOxZWSnlGhX8H1h9zXyoeaITXmhN9rC/YYgpeok1oTmHDlpvkfi//+o6
   Csn2XZudzIO4XJPzCSHEsjt/Z16I1raaTGyGkiE45yXEMOwlZKUSDn0T7
   w==;
X-CSE-ConnectionGUID: OOfcLFn7RuKe19bX4/86bw==
X-CSE-MsgGUID: ye1Oth7MTYmTBtm0tweUEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="71461138"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="71461138"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 18:10:55 -0700
X-CSE-ConnectionGUID: JHU63uM9TsCdwlrEdiQ7JQ==
X-CSE-MsgGUID: 04mrtMccRPK4/Vt/lS+myA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="154997538"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jul 2025 18:10:54 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYDu8-0004nl-0N;
	Sun, 06 Jul 2025 01:10:52 +0000
Date: Sun, 6 Jul 2025 09:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_dir_access 13/13] fs/nfsd/nfsfh.c:325:13: error:
 'type' undeclared; did you mean '_ctype'?
Message-ID: <202507060932.uFRl5KL8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_pre_dir_access
head:   31cc229cb62d9127b8c60a33d219ea0b879a7613
commit: 31cc229cb62d9127b8c60a33d219ea0b879a7613 [13/13] nfsd: add pre-dir-content fsnotify hooks
config: nios2-randconfig-002-20250706 (https://download.01.org/0day-ci/archive/20250706/202507060932.uFRl5KL8-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060932.uFRl5KL8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060932.uFRl5KL8-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfsfh.c: In function 'fh_want_write':
>> fs/nfsd/nfsfh.c:325:13: error: 'type' undeclared (first use in this function); did you mean '_ctype'?
     325 |         if (type == S_IFDIR && !fhp->fh_got_content) {
         |             ^~~~
         |             _ctype
   fs/nfsd/nfsfh.c:325:13: note: each undeclared identifier is reported only once for each function it appears in
>> fs/nfsd/nfsfh.c:325:33: error: 'fhp' undeclared (first use in this function); did you mean 'fh'?
     325 |         if (type == S_IFDIR && !fhp->fh_got_content) {
         |                                 ^~~
         |                                 fh


vim +325 fs/nfsd/nfsfh.c

   317	
   318	int fh_want_write(struct svc_fh *fh)
   319	{
   320		int ret;
   321	
   322		if (fh->fh_got_write)
   323			return 0;
   324	
 > 325		if (type == S_IFDIR && !fhp->fh_got_content) {
   326			ret = nfsd_lookup_notify(fhp);
   327			if (ret)
   328				return ret;
   329		}
   330	
   331		ret = mnt_want_write(fh->fh_export->ex_path.mnt);
   332		if (!ret)
   333			fh->fh_got_write = true;
   334		return ret;
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
