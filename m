Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1B23242C8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 13:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765372219; cv=none; b=O8EN2xIYcS7T4Cjy17VHs7X0OEQxyR1sbNCkfQJZwMPpEELe13HHdg4vk0T7gvwUzk1kUwO539GOS4HywHwsh7w+8MV+tsHMaZu8uIw1Om5l+7Id7O622GauV71AUDDxhPGRaO9Yp6ZOTe2DL9YiRqJEK0s+OR04Pcdh8wVpFw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765372219; c=relaxed/simple;
	bh=LMJnjtw7VgElXoGjInmqB+V5prlQLNXkjnkEKuBFysY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ejxl75TBHQFygUfzuutxG/tele35ndOnfWt/0chmKpOoqTPi9+Xcip+D4esJyjQHsyBhk92Wc5opIWUYAjy9mGjA0iSLlGPZ8BgA62s/JrJonIddPrxWvAzRA6zL5oziwWFWH8YEsraMqmsFvDEanpox6I3G5jfAmENz2IU/BIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqeczWzE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqeczWzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765372217; x=1796908217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LMJnjtw7VgElXoGjInmqB+V5prlQLNXkjnkEKuBFysY=;
  b=AqeczWzE6teWYRVjMj/Gg3NuQoHDpkqNULtpRSMZ3aFe5Y5GE2NILvoF
   daxgLXK6yO6aFaB4B4heEhI2O2zkgZwd8UfyvjOT6E+zZnplw+ZrWmfZz
   SKPE9R0nEA84YDNtonQoWiLi5neiXTKt4gmGPpIaZ3cRqlw1CqWwIZV/D
   g1/4Bt0GZ1BKWVYDQAWMyjikEwBqsCcAPFyy9tCXr3AljBz0b/n1Jd/XL
   +sEnnPO+GinenVFnavDoXC6GTC0EndbiLHa6xZTcpB7HJ9YvrS6+3naPw
   Ux+Alhp6OoreYSy//YmKbhEHHa0o7xiaRrLRY4a2/JekBZQRmbsycqPLJ
   g==;
X-CSE-ConnectionGUID: TP3ydKi7R5WpaoNZKgzoag==
X-CSE-MsgGUID: H6YszAXcTiCJuF4DaUuK4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78038276"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="78038276"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 05:10:16 -0800
X-CSE-ConnectionGUID: upIlw12WRpennajEoHQaeQ==
X-CSE-MsgGUID: ZbzuYbgXTiixmcNERCvRPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196262816"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Dec 2025 05:10:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTJxN-000000003Cw-0AWj;
	Wed, 10 Dec 2025 13:10:13 +0000
Date: Wed, 10 Dec 2025 21:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Gao Xiang <xiang@kernel.org>
Subject: fs/erofs/decompressor_crypto.c:64:30: sparse: sparse: symbol
 'z_erofs_crypto' was not declared. Should it be static?
Message-ID: <202512102025.4mWeBSsf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9b47175e9131118e6f221cc8fb81397d62e7c91
commit: b4a29efc51461edf1a02e9da656d4480cabd24b0 erofs: support DEFLATE decompression by using Intel QAT
date:   7 months ago
config: s390-randconfig-r111-20251210 (https://download.01.org/0day-ci/archive/20251210/202512102025.4mWeBSsf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102025.4mWeBSsf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102025.4mWeBSsf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/erofs/decompressor_crypto.c:64:30: sparse: sparse: symbol 'z_erofs_crypto' was not declared. Should it be static?

vim +/z_erofs_crypto +64 fs/erofs/decompressor_crypto.c

    63	
  > 64	struct z_erofs_crypto_engine *z_erofs_crypto[Z_EROFS_COMPRESSION_MAX] = {
    65		[Z_EROFS_COMPRESSION_LZ4] = (struct z_erofs_crypto_engine[]) {
    66			{},
    67		},
    68		[Z_EROFS_COMPRESSION_LZMA] = (struct z_erofs_crypto_engine[]) {
    69			{},
    70		},
    71		[Z_EROFS_COMPRESSION_DEFLATE] = (struct z_erofs_crypto_engine[]) {
    72			{ .crypto_name = "qat_deflate", },
    73			{},
    74		},
    75		[Z_EROFS_COMPRESSION_ZSTD] = (struct z_erofs_crypto_engine[]) {
    76			{},
    77		},
    78	};
    79	static DECLARE_RWSEM(z_erofs_crypto_rwsem);
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
