Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0DD2ED86E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 22:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760999949; cv=none; b=jUQHcj9eFpXjinPJV5LF0x8T0dRYbadozRQVMdlHJ+FhfWmnfG/3axcghrp+iXXnIyrkBrO8Pr3HHrAJkFIUpnseGjgRL7E6GaxlQszy1FPC/csQ2IB9LKyWfw8XZDFKdVUc1QJJ3wvHMZUkzSC8P+bDmuOMD6XO+G2lB53RRWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760999949; c=relaxed/simple;
	bh=PvWrIHNCaX0pNqCTDKCZx/xyLVQHAq4o4lz7ENQbhoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HgVyfdIVBnurNeGf9bpazznAkCB9l+oJ3E6JFERUuITLxd4pZ8Y8iouirMf17d6IAOcy0e0kd22YWHLJL98R1XmN0sIKhQKVZbklnvWXCz0fZW0G8J2L61NqZrC7xC3jiiwuWbBHemTe37CVIdy146zeTr8EscH2PBkwu8oyWSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMBp/btj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMBp/btj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760999948; x=1792535948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PvWrIHNCaX0pNqCTDKCZx/xyLVQHAq4o4lz7ENQbhoM=;
  b=MMBp/btjD45JgRDDTWkHpjdEJyUXCNtTUyA9rYlrl2oV8YjILd8Q+QG1
   mPtW7b0gqYqReKy+feYLglkwcbT5rTa0z3oHJ7Oia3X53+DXtdVnVOmms
   ugTEsk3HLHBFr0BgESBjV35LjCt6/JNDrCtnYvMkzw+x58DfHM7Ngwx5b
   5sH1KUVmdxdZpnx1LDU7avXmNxYjYrVSu3k6zJP/B1jHRc2k+2ANuW32m
   bfmaNMSTA4I7V6zGPdLod7QOTTNyDTuQuerWnGxyd1aQSKq3jK4eq9DDz
   0+8XmaVvDggwxVJhDg2AJCsk4s/cN+3jBYTr+HSekGbVCekyNJgAI/TTG
   A==;
X-CSE-ConnectionGUID: Ts4lg+sgRDCidbMTpZ8zNg==
X-CSE-MsgGUID: qLv761hATnSAS6TRakGSKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74242390"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="74242390"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 15:39:04 -0700
X-CSE-ConnectionGUID: skDYxwUMQkOmhJAiFV3hhQ==
X-CSE-MsgGUID: A7vma+3JRWOXUe7wYOwF4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="188724356"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 Oct 2025 15:39:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAyUt-000ADZ-1I;
	Mon, 20 Oct 2025 22:37:41 +0000
Date: Tue, 21 Oct 2025 06:34:54 +0800
From: kernel test robot <lkp@intel.com>
To: Petre Rodan <petre.rodan@subdimension.ro>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:togreg 56/96] bma220_core.c:undefined reference to
 `i2c_verify_client'
Message-ID: <202510210604.mAtgE54g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
head:   89cba586b8b4cde09c44b1896624720ea29f0205
commit: 3499375209ca839a741e775d579f8bb9b85529d5 [56/96] iio: accel: bma220: add i2c watchdog feature
config: um-randconfig-002-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210604.mAtgE54g-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210604.mAtgE54g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210604.mAtgE54g-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/iio/accel/bma220_core.o: in function `bma220_init':
>> bma220_core.c:(.text+0x3f8): undefined reference to `i2c_verify_client'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
