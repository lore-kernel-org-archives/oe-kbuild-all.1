Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5BD3B6360
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839210; cv=none; b=gwpEFF6i0AhD42sF3tBu5T8ExuKbxaKJZfL4WPk4KO2JLqdO7QaoY2tnfcXjSN1lFMQKPJYF26mQoyINtZn6cYvMOVTE4pF/bizDtm/sheTaLQOMZUr4wlKm8KaQRNxlo1wDRsGtRbL3pG0NOdKFIwH2+QJqQ/OGXjjhKfjiA1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839210; c=relaxed/simple;
	bh=CBM5bKfkupXyo2/S3RfTHK3xqw0yQOzuFi8qAFmIQAQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LVBp93ltLdbLHj6po7k8IwKX+cHGtk3j36k/vfQjSa3N2GUtdRwDN8gIuHYRajZWWJdWLU853lUY6xLpglYwpyRrIm6aMSAxVLvvYfouYddwXaazKGAy5YwuVOOw69FnRi662EpIEvrItbtA2XJomC1xD8m2SFaW2feSrlIzuog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6MtGsh+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6MtGsh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791839210; x=1823375210;
  h=date:from:to:cc:subject:message-id;
  bh=CBM5bKfkupXyo2/S3RfTHK3xqw0yQOzuFi8qAFmIQAQ=;
  b=e6MtGsh+pErAd5cTK8b0tH3RhZClNRino4ERrfvbanBV0ZDrpWg+6J1M
   qQHizihgeMipgWRSM5pzVxdIs8KPjZQ97umhakRt4S9sbEGY+ePWpeSra
   xRCaivrRjGW2H4URnOIf9cYNKNT9b921Sxc/ZXMOL2yBwgYVlDRYcXGrD
   YeP9MAcnqjpbAuYgGDDzWlXQO/lqyBhySLqhHNg/PFj+xMu+2sdhGTa+a
   eWJB6hqG9iiVoFICB1QKImsTwqz12PlgiM8UHLYXmchpIUrEnMl7m83jw
   YEnnXgFt3eFhbXe6I2r6bh1uJDWAqN5xD3OEsJaCf/0b3gf7maQKZoVqp
   g==;
X-CSE-ConnectionGUID: EKPDrjBUTbCTPp5KQW0uZg==
X-CSE-MsgGUID: sgV4LjlnTFa1WWNlMAgR5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="456685"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="456685"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:06:49 -0700
X-CSE-ConnectionGUID: Zv6LxWmGRkaloNg57I91oQ==
X-CSE-MsgGUID: NNge9HcgTjmOBVg+D4LW+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="2765201"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 12 Oct 2026 14:06:47 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGNEL-00000000AC7-1WlM;
	Mon, 12 Oct 2026 21:06:45 +0000
Date: Mon, 12 Oct 2026 23:06:32 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3] block/blk-core.c:894:
 warning: duplicate section name 'Note'
Message-ID: <202610122255.kkwQwG24-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bart,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f2c26311c21cf60ea5bf9ac15c3242139e210689
commit: d6f0f66569f2f74c9095a8c4e8c43bff2b571769 [0/3] ANDROID: block: Do not set the I/O priority for zoned writes
config: i386-randconfig-2301-20261012 (https://download.01.org/0day-ci/archive/20261012/202610122255.kkwQwG24-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610122255.kkwQwG24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610122255.kkwQwG24-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-core.c:894: warning: duplicate section name 'Note'


vim +/Note +894 block/blk-core.c

   884	
   885	#ifdef CONFIG_BLK_DEV_ZONED
   886	/**
   887	 * blk_bio_is_seq_zoned_write() - Check if @bio requires write serialization.
   888	 * @bio: Bio to examine.
   889	 *
   890	 * Note: REQ_OP_ZONE_APPEND bios do not require serialization.
   891	 * Note: this function treats conventional zones on a zoned block device as
   892	 *   sequential zones. This is fine since zoned UFS devices have no conventional
   893	 *   zones.
 > 894	 */
   895	static bool blk_bio_is_seq_zoned_write(struct bio *bio)
   896	{
   897		if (!bdev_is_zoned(bio->bi_bdev))
   898			return false;
   899	
   900		return bio_op(bio) == REQ_OP_WRITE ||
   901			bio_op(bio) == REQ_OP_WRITE_ZEROES;
   902	}
   903	#else
   904	static bool blk_bio_is_seq_zoned_write(struct bio *bio)
   905	{
   906		return false;
   907	}
   908	#endif
   909	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
