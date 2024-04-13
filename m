Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B61753E12
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 18:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713034014; cv=none; b=d1lfS9cyTn+DfMSH+ZRDToAqrloM/niVxTXdGWlB+6zeY8I8oKnva2lmG+fPDvLeyS4Xk0vWbVAydBGv/f8gIuEJFgftaDKm3sWXHpek2waPFVUF32frBiDP0/xvB8mIwJNpXAgsIOHu3DtulAwqsRK+hSFVwNenpOtlk7q3n6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713034014; c=relaxed/simple;
	bh=2ykaHHMKNuL2mjPQmspGYA1qmG3uq+S395gWOkokILE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fdteytrm8icQrnRnww4B3XnElELuhmzEerg1M59V1/ALz5e+H3c98ZXyWswF1c+MhSbAqubYPtDL0ejjTJJWsE7SbDYMVjEZKbLBvgBVgkXWmSYSjymkAwxgPt56OJu5KkHlsKIwYKxEwGjNVNRBTBHha3yMOcdxhRbBXWA/1pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1sCroH5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1sCroH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713034011; x=1744570011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ykaHHMKNuL2mjPQmspGYA1qmG3uq+S395gWOkokILE=;
  b=O1sCroH5CPuQkCB4nDVB1+l4kOaIqpIAwSqGQmkfqsAFoR7nZGT0ULL4
   i6RmoWk3X3VyB/sXRpl7jVht+KfZsjGsrhM8q4/RF3JY5uwQxQnv6b9YW
   vFmzQ3laJNuIZ7v9Llf6pGhR01+JicJR8h8La7M5s24YRQxpY4s4TfGrR
   l3hSyvcDkGamksvK6F46MljQ1cRB6rBrKBP55LiYzqVkAtKKL/Pni+X2B
   hukMehJsjm5spzE2rSgl368JvxpxklYIZ27/u7fYRc2aQgL7W3fUX510c
   CA9Rntkz6ZVNcmUilSNbXEw7EB3KGHui6hokrQ6VVRbNxHCTweD++mgXG
   g==;
X-CSE-ConnectionGUID: VXne9jK1TeivTdDvAaJTtQ==
X-CSE-MsgGUID: egLkisFET9OgGt8003gOnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="25931923"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="25931923"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 11:46:51 -0700
X-CSE-ConnectionGUID: iu2XbALVSFKoCBTYjZGW2Q==
X-CSE-MsgGUID: mRF13wKxRTKYRhKext1NSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="21591779"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 13 Apr 2024 11:46:48 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rviOj-0002zi-3C;
	Sat, 13 Apr 2024 18:46:45 +0000
Date: Sun, 14 Apr 2024 02:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5553/6461] mm/workingset.c:358:1: warning:
 'inline' is not at beginning of declaration
Message-ID: <202404140237.mAzeTksz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c4ce1844f1a80961c5357dac5ef4837633bdaa11
commit: ac330651f36aff323c82d05059891bf1f3368bda [5553/6461] workingset, lru_gen: apply refault-distance based protection
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240414/202404140237.mAzeTksz-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404140237.mAzeTksz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404140237.mAzeTksz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:358:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     358 | static bool inline lru_gen_test_recent(struct lruvec *lruvec, bool type,
         | ^~~~~~


vim +/inline +358 mm/workingset.c

   353	
   354	/*
   355	 * Tests if the shadow entry is for a folio that was recently evicted.
   356	 * Fills in @lruvec, @token, @workingset with the values unpacked from shadow.
   357	 */
 > 358	static bool inline lru_gen_test_recent(struct lruvec *lruvec, bool type,
   359					       unsigned long distance)
   360	{
   361		int hist;
   362		unsigned long evicted = 0;
   363		struct lru_gen_folio *lrugen;
   364	
   365		lrugen = &lruvec->lrugen;
   366		hist = lru_hist_of_min_seq(lruvec, type);
   367	
   368		for (int tier = 0; tier < MAX_NR_TIERS; tier++)
   369			evicted += atomic_long_read(&lrugen->evicted[hist][type][tier]);
   370	
   371		return distance <= evicted;
   372	}
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
