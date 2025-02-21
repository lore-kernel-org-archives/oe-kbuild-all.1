Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB51D95A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740125885; cv=none; b=M6r/bXODZG9ZyWSAj1rHnpNtE9Cz5EHBg6ttdIcWhLHetYy7vsKmRTbyzoQTR1N05Y3CSkai3narDBf9/LDFW8WonMKaiW+kqdtWz26LxDfzk/iTfglyjx4TxEOXIazwCvY4ww+NjRemGTvl9dK4UCzNMfki5Y3nQoppdy0Io5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740125885; c=relaxed/simple;
	bh=TVOYYLuGcHu7xR7OJ6D32GSn5uLjkl02hhkOJYEar48=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=afTsz2J8ceGKsTXc6Jm9b+HYtUVJUrYpWduKKSkteKjMKkA/ICKV0yVUHkQtZOHNfZR6SkhR8qgjIYg4Ydp2GIB0T7R5oXVnqaqV0+gexhriKp6shmyrwzubr+b+RN7cCcAcExOEQtjkl06eNT8pgqqNFQXbtOVADduoQKzOQ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rf0j7X8H; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rf0j7X8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740125883; x=1771661883;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TVOYYLuGcHu7xR7OJ6D32GSn5uLjkl02hhkOJYEar48=;
  b=Rf0j7X8He2U8VUd+moKH6ylDntTrWqToXrYirezoGHvwxlm2Y1d/qUBo
   HKxYk0AwIK4m9xkCiHnd2ni729da50cIT26CFjjn+g9yOFKhM6gT03/Ru
   LxF+1TgRBwtDMwv1YYMg+z7z+ySDJagGIMfdDh02qw9JYRAEDETKvZlqI
   oQx1VWNNYTHzwSqKpk+WF994NPqA/yr9E/8Fsq7jKd5KNGR2UjraObEbv
   Y15CvGR2JasUeyQ5w8+JxCFibdcYr6m6EnZHFUEtQO5J3jtAMdIIw4dt+
   D0iRjCBytiyOXa8gqhMZUtzchmtyrKbLtB9VmeFFZEHLdruiOumKfX5/v
   Q==;
X-CSE-ConnectionGUID: 72WCSF9tQLyRRx/pZZ9vUg==
X-CSE-MsgGUID: B8RvHg4fQ+uRxPke4CBQUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="58479640"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="58479640"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 00:18:02 -0800
X-CSE-ConnectionGUID: 1BgQTpiTT7qRpMVhhi2yZg==
X-CSE-MsgGUID: 4jbiTvfvT9CvnSxfT5xgqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="120279524"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Feb 2025 00:18:02 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlOER-0005HP-2Q
	for oe-kbuild-all@lists.linux.dev;
	Fri, 21 Feb 2025 08:17:59 +0000
Date: Fri, 21 Feb 2025 16:17:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] drivers/iio/gyro/fxas21002c_spi.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202502211602.jEPE3snW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 4da38f1be6675734f3330578ebd2316848b383f0 [1/1] iio: gyro: fxas21002c: add spi driver
config: x86_64-buildonly-randconfig-005-20250218 (https://download.01.org/0day-ci/archive/20250221/202502211602.jEPE3snW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211602.jEPE3snW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211602.jEPE3snW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/gyro/fxas21002c_spi.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
