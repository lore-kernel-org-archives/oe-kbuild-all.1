Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356D22F3D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 06:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhgs/Akd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699250467; x=1730786467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5oZswAbqSURdSEzEmv3Drhh7JVsWz+/DqodEvyfPHEM=;
  b=mhgs/AkdZHJHpOcxyTwVRmbYXjB060YBzDvA6uXzLhdQbGYdzQMs3W5r
   lgsrS490sosFuGiRO5TGmiiCwcS1XzJgeOhceI4/k9NqDPEMkfcrqunai
   Lw0NsyPMWL9SkwfIRxHVdLcsSkbJtdOdVY9IBYBLmQ7Nd1twtUdwWQVmx
   fZjY7Cm/yehqJiEUNM1N/rUwSkzJDZLVK83gdrFGPlvd5PsYhjYcPpcYf
   R0J9vYjuqeqJuueucKISlAMwRSfZ0qZy/kDOE4DKVGLp99UrL0W0ZVIJd
   qxQ7hMmZ98lkdlnjV6AmBbUsMrJkCoSKuL3RqsaeX15No4nXHZ/61oFGO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455697510"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="455697510"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 22:01:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="832617597"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="832617597"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Nov 2023 22:01:04 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzsfX-0006AS-0R;
	Mon, 06 Nov 2023 06:01:03 +0000
Date: Mon, 6 Nov 2023 14:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:ext2_dir_buffer_cache_rfc_wip1 1/15]
 fs/ext2/inode.c:821:5: sparse: sparse: symbol 'ext2_read_bh_lock' was not
 declared. Should it be static?
Message-ID: <202311061350.GO6hcRw9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux ext2_dir_buffer_cache_rfc_wip1
head:   3b878bc4805dd97f67ee17c6450059a4a7f2b261
commit: 47085f278819cf21a8b60c39a9a7d48714eb767c [1/15] ext2: add bh read apis
config: i386-randconfig-061-20230929 (https://download.01.org/0day-ci/archive/20231106/202311061350.GO6hcRw9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061350.GO6hcRw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061350.GO6hcRw9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ext2/inode.c:821:5: sparse: sparse: symbol 'ext2_read_bh_lock' was not declared. Should it be static?

vim +/ext2_read_bh_lock +821 fs/ext2/inode.c

   820	
 > 821	int ext2_read_bh_lock(struct buffer_head *bh, blk_opf_t op_flags, bool wait)
   822	{
   823		lock_buffer(bh);
   824		return ext2_read_bh(bh, op_flags, NULL);
   825	}
   826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
