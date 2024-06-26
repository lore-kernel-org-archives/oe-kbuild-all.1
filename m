Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB7914EC59
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719428315; cv=none; b=B80ruZriiVMOaPVgSXj1hY0nVe92A+sfj2gndRFJD0TJlkQbx7r9R7ap9+4CDqAxR7fSrG9HT2Xj09a9qzwfBG+eWpP+JerFCclZPntf4JP/SK+1QzmHCKEpKbDEkdCzc0Oqqg8DM7G1SwW3Q2AoyxKxvpaBc+1J6gkf5OLbhig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719428315; c=relaxed/simple;
	bh=i5UhpdzjYZvaqJBaD+CHTK9DLs/LV3zaokJefHlF5Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HPhBZAF/zJDbOvSXMnCl7LWOF3SSDIFmIFoDkkwu7+65QF0toampmqifSZQ440pTawLMsBvJv9D8qwbNA2y9Qk8LGdGPEpVpDNMrjc0kxD9JKuGYxTQftr1pBIeNWJ2RWTjx6jEvJ8i4BZkH3DQ3yPw7vvgYD2O3q/x9dVG7qQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rw0wHmW/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rw0wHmW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719428313; x=1750964313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i5UhpdzjYZvaqJBaD+CHTK9DLs/LV3zaokJefHlF5Gw=;
  b=Rw0wHmW/2vFMnnV3774DIuWnymtVn3duUEs0GYlrxfkvYXsMmHGzmFEN
   tElGThFmuwmVfWgB22okuDpjZprn9JI/dLJqiSoiVd/H5FHU//rbwLNRV
   38k64iKmpxIGn/HXCoo5Gmt7Xy1me+Kx+dVrhw5Hn8AvnjZCCQRUAV3cn
   PMNwFeBTSWLgyKZyHxpDxVt1p7VbQ3tEoJ8LmFWiJ8nl78h0Pnebzfrdp
   JL40r7EaEIXnLoGDQaN8rMWIEOkpcvim+VhdToKopvWZ8J4fRIYKWalO4
   bBPdLniY5r75v+X06AApuUqkPMBva+TtSTxJEZG8zhAmZcQaurN9pkB+z
   g==;
X-CSE-ConnectionGUID: Vx02NlKHQqavFi74l/6YLg==
X-CSE-MsgGUID: bJL1BAvsSc6U0bEpEi8XEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16671282"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="16671282"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 11:58:31 -0700
X-CSE-ConnectionGUID: /NMSKhx7QvKC8aoGhRvvmA==
X-CSE-MsgGUID: GRUNRkxvRj+emt5/R3qmDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="44741593"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jun 2024 11:58:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMXqd-000FUk-0e;
	Wed, 26 Jun 2024 18:58:27 +0000
Date: Thu, 27 Jun 2024 02:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5561/7880] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_LZO when selected by EMM_ZRAM_CONF
Message-ID: <202406270201.O67i64Ls-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ca7064b2308b42201419e17b030e6a9347be29cd
commit: 5723adb73901b05640a72b59bfa6125a3a469cd3 [5561/7880] emm: configs: enabled EMM related configs
config: loongarch-kismet-CONFIG_CRYPTO_LZO-CONFIG_EMM_ZRAM_CONF-0-0 (https://download.01.org/0day-ci/archive/20240627/202406270201.O67i64Ls-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240627/202406270201.O67i64Ls-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270201.O67i64Ls-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_LZO when selected by EMM_ZRAM_CONF
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
