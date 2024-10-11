Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426111A3BAD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 09:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728640270; cv=none; b=MMmriOnl/8425PqNa3StrUjqoDvI8dfz9eQhMhPB+Xa/B6PNSFJeQPdgHcQmgLjJhiZzRkEDpDzCr+7QHb/JfHRs3Y6b2G+GnWzoPd+cjbfCBMPx6SC3C27jazZ1eqlfQHcGE9/h6J+Vg0HqsrB23/+FeNJcJdHFP6bBnMbK6uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728640270; c=relaxed/simple;
	bh=xpo8UQAV09GnI1h3wjeN8zUVjbTB6IsZc+e1iJcE+NA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=djonhSiDf/3Zy+Z0LokYHLNYupHiBVgn5r4PS0CblKn1JEbh2qH4E6pA7/uNTKBqk3dJ2hxzyPbu5XbqhA3/YUG50W7OJM1Ii5/Edr5QOPF1ot7f4cKVkOPDKvbBa+mVFAS5CqeN7/TjaVhFtUrzfSYbjcn735Vl56Iys5pWyxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=As7s5VQm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="As7s5VQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728640269; x=1760176269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xpo8UQAV09GnI1h3wjeN8zUVjbTB6IsZc+e1iJcE+NA=;
  b=As7s5VQm0H6cJ8rpUzlf63ijPsnCS3rn/lDX01BubPPB041SB2bTlLEG
   YqYQSnzGiXlo+gejhDoheoJoxQXjHjGAvyowWP88fDo4iAbK6VRQIEGc0
   +E0z08PcGFqbzvlKfS3SBj2AGOHVt6k0Sev4ZDe9RZC61YziXSUGb/myl
   RkpQlXzyYwucK3OmV9waSQbnXbmu9Z/rhByuh6GHKkeZYYE1PARYs5L26
   gje3Xz0/Nd1Y3+LiQA2NMQMzAgDHrii1OYkI67BeTbgI29vd3qSsLKHVx
   239NvWpRSLxaw7lf1L6SYAoqy3fhR2k90wN7Nk65r6EwndGzjstPFG0Eg
   g==;
X-CSE-ConnectionGUID: x7bHiTYaRuSBifi+UeMY7g==
X-CSE-MsgGUID: tv7AujMlSmGZN64bG1N+Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38683577"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="38683577"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 02:51:08 -0700
X-CSE-ConnectionGUID: yYO+9fnKTzW2oS+zNKu7Ew==
X-CSE-MsgGUID: YCHgZKFiSwSNHMWahgNmEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="76512384"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Oct 2024 02:51:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szCIb-000C8X-1u;
	Fri, 11 Oct 2024 09:51:05 +0000
Date: Fri, 11 Oct 2024 17:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2965/4143] ld.lld: error: undefined symbol:
 arc4_setkey
Message-ID: <202410111727.FxATs8Yj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d61a00525464bfc5fe92c6ad713350988e492b88
commit: 02f220b5267042d0de649614eec84ded8aeecb4f [2965/4143] wifi: ipw2x00/lib80211: move remaining lib80211 into libipw
config: powerpc64-randconfig-r052-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111727.FxATs8Yj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111727.FxATs8Yj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111727.FxATs8Yj-lkp@intel.com/

Note: the linux-next/master HEAD d61a00525464bfc5fe92c6ad713350988e492b88 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arc4_setkey
   >>> referenced by libipw_crypto_tkip.c:350 (drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c:350)
   >>>               drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.o:(libipw_tkip_encrypt) in archive vmlinux.a
   >>> referenced by libipw_crypto_tkip.c:432 (drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c:432)
   >>>               drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.o:(libipw_tkip_decrypt) in archive vmlinux.a
   >>> referenced by libipw_crypto_wep.c:132 (drivers/net/wireless/intel/ipw2x00/libipw_crypto_wep.c:132)
   >>>               drivers/net/wireless/intel/ipw2x00/libipw_crypto_wep.o:(libipw_wep_encrypt) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: arc4_crypt
   >>> referenced by libipw_crypto_tkip.c:351 (drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c:351)
   >>>               drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.o:(libipw_tkip_encrypt) in archive vmlinux.a
   >>> referenced by libipw_crypto_tkip.c:433 (drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c:433)
   >>>               drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.o:(libipw_tkip_decrypt) in archive vmlinux.a
   >>> referenced by libipw_crypto_wep.c:133 (drivers/net/wireless/intel/ipw2x00/libipw_crypto_wep.c:133)
   >>>               drivers/net/wireless/intel/ipw2x00/libipw_crypto_wep.o:(libipw_wep_encrypt) in archive vmlinux.a
   >>> referenced 1 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
