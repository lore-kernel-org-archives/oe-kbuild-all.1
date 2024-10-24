Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D6416133C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760031; cv=none; b=s/iDcDJHHFhhpDhUaxGjWHjvSxn1U9khJbmXgw7uZ5JTXzwbfviPI1xYF3EeYE37ZPCs7q8FSqbsqaGK7LcU0it6WD2CUe7Fq+QzBIy6RvcYno9emh1stuaXmy5/pCimhe7i92mQqtjLh4+wEnA7iuY6pYWZkxxFnajqgWHr/YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760031; c=relaxed/simple;
	bh=SmyjQ15V5nI8QUHQDbf62JQ6hCzf/aHgIfSCvG0R/Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VR0jo2lSpkjvTaaHuIOZ3A4HOykaxsYxo9EANucRqZAW6v68ow09w2Uba3EXcvLzVON802gkvtom9rI35HGzTnsS12YW13TtM9u5hkSwWcztGhezM9f/ZBDbnCcHg6mKUoXQDqNJnqwJFabGdqLNHNsU7NuONjebB/eY+Wwshg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gB2//PYG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gB2//PYG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729760029; x=1761296029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SmyjQ15V5nI8QUHQDbf62JQ6hCzf/aHgIfSCvG0R/Z4=;
  b=gB2//PYGJe32ijq8IPOxEZ4JHk0JNMtMtHfHq0UXiiSu97aFs0xBK3cO
   huOCK1vmZnbQTjTFBM6/XINLlb9s6nBapbs/VX0RuRyOmkMNLP+HBZ/3r
   TwNUvTAi+dqbbZDo6vmtv7JMfgWNj8R8rUfjb2UzZKBf5b5wflHP0k5RK
   NoEPnA5W5uryGuMSELFHrI02wkVfTSm+iqJjnDApck7V1aGSSVLvr+Caj
   zOBdTuoDxyQrr8PGjpriQFbQGvgwkocZvvRDIcRXf8r6LPuMrSgRK5jxt
   CvpmjCXgPH0kjBwx3FUxsMYi28rCCOU5kfB0TJr58mURZfwxzbp8VOOSI
   w==;
X-CSE-ConnectionGUID: AUYY67MARhaPwOYv8WpknQ==
X-CSE-MsgGUID: b0veJsQzSy2z5EPp/irDqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29244259"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29244259"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 01:53:48 -0700
X-CSE-ConnectionGUID: HK64tyB7T0SYjG74FynZ/w==
X-CSE-MsgGUID: 8mehPYFAT6CV5wEdfzK4FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="103847948"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Oct 2024 01:53:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3tbC-000WBY-1e;
	Thu, 24 Oct 2024 08:53:42 +0000
Date: Thu, 24 Oct 2024 16:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5561/13046] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_LZ4 when selected by EMM_ZRAM_CONF
Message-ID: <202410241629.SK6HMRut-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 5723adb73901b05640a72b59bfa6125a3a469cd3 [5561/13046] emm: configs: enabled EMM related configs
config: x86_64-kismet-CONFIG_CRYPTO_LZ4-CONFIG_EMM_ZRAM_CONF-0-0 (https://download.01.org/0day-ci/archive/20241024/202410241629.SK6HMRut-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241024/202410241629.SK6HMRut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241629.SK6HMRut-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_LZ4 when selected by EMM_ZRAM_CONF
   WARNING: unmet direct dependencies detected for CRYPTO_LZO
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4HC
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for MEMCG_ZRAM
     Depends on [n]: CGROUPS [=y] && MEMCG [=n] && SWAP [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
