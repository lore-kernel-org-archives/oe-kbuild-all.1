Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCF42DF12E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 10:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176752; cv=none; b=DM4LcehmxEShP7QT+/SY4RFc9Qya2WJad2I4NNRhQmbvaTIO9GmRTgbSTq/ocUIGIl1K93CeO2YbLmJMiT9DBqupdggjaThb2o6+gtuur+qJHxDCDbrg+tXSOmwkErEQO308NErfUZ8Ql8B2QT+KMueJWFQ2RzQxDyNYQCbXBrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176752; c=relaxed/simple;
	bh=dmLp3A72vPeiCtw701Ntc4it2nNcBGd+N15lr4ceh5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kZLdTUDaxtYolKVLljs3CtCcQWK2N6sI40tSQJUgSMx8LTM6Uo/Zxk0BZZNKps9i+d1PgU1GYlI3rh0kz7OF4wNNYUBDXZxnQAXGgeKPEjExz0bsroKfkCFHTO6m/KxmYW8sGHCZQYHfd/nQb+6WWtA2Y9UR+2cAyHi/Q/rGE+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+Ll43AI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+Ll43AI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767176750; x=1798712750;
  h=date:from:to:cc:subject:message-id;
  bh=dmLp3A72vPeiCtw701Ntc4it2nNcBGd+N15lr4ceh5A=;
  b=F+Ll43AIDeIwj7ffZoreSkVpQh/gpS0jpsn9Vd996VRrj61ZTxJDfddY
   19SobGvr/i05ZaX+JO08V4iOxbLmwTZSHt3ORa6Fth2PKyXYnQ7ANNDmQ
   WFCNCrwWGpc8n2Bv3FPiLpXbvNnwpndEJCTAvmMXvfHjzD1QZdvCaUdyY
   B8tGZVraOC33Br7c7cTfR5z5vfZN8iEhJYvmVOepp0LEi67GXhHkx5Ld8
   ezh155xfBZEYe+o5S8T5VYLX2q7rL7y4eIOBK4I9r/5Nsakh8gghnJhEG
   vEr7EWoqv6/N/enbCH/S65vAO8ebCtJSfpRN45VC167Q2sSkhqJmCEvqp
   A==;
X-CSE-ConnectionGUID: F5Qkx1K/TlWOWLqPRHLNdA==
X-CSE-MsgGUID: yhqGFt2bSbWpi91y8O+drQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79054823"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="79054823"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 02:25:49 -0800
X-CSE-ConnectionGUID: d5kQiV50S6etE6dfvg25hA==
X-CSE-MsgGUID: hgaK0siRQnW6ltZPb7f7UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="224908409"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 31 Dec 2025 02:25:48 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vatOj-0000000002b-3Fcl;
	Wed, 31 Dec 2025 10:25:45 +0000
Date: Wed, 31 Dec 2025 11:25:35 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] htmldocs:
 ./block/blk-core.c:894: warning: duplicate section name 'Note'
Message-ID: <202512311108.T4vLPAtS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bart,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ecd8c13eebd9ac39eaa1b45d9fe23ff020c4e68c
commit: d6f0f66569f2f74c9095a8c4e8c43bff2b571769 [2/2] ANDROID: block: Do not set the I/O priority for zoned writes
reproduce: (https://download.01.org/0day-ci/archive/20251231/202512311108.T4vLPAtS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512311108.T4vLPAtS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/math64.h
   Error: Cannot open file ./include/linux/math64.h
   Error: Cannot open file ./include/linux/kfifo.h
   Error: Cannot open file ./include/linux/kfifo.h
   Error: Cannot open file ./include/linux/bio.h
>> ./block/blk-core.c:894: warning: duplicate section name 'Note'
>> ./block/blk-core.c:894: warning: duplicate section name 'Note'
   Error: Cannot open file ./include/linux/clk.h
   Error: Cannot open file ./include/linux/clk.h
   Error: Cannot open file ./include/linux/rcupdate.h
   Error: Cannot open file ./include/linux/srcu.h
   Error: Cannot open file ./include/linux/rculist_bl.h


vim +/Note +894 ./block/blk-core.c

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
