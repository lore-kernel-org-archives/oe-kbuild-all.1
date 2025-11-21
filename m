Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B8336D4F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 05:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763702899; cv=none; b=P7nlxndzQged6aYjv0pvWARIB2NlGHuUBwEcbAg81qLSb9W8/6NlELn3/rUftUkqXD5UJiRt9li7Ym7zAc3u5k/A6LQ1KpKkizlf3FtaYttjjf0OD/07tfoEoUaD13pFKauMFGreUYl/Ofw5EzsEQB2kGIwCqjdYatkwgHfnsHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763702899; c=relaxed/simple;
	bh=fkqg2HO4s4okI7T9cuRNdLvw0w6PMBXesMWBu5oEwu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qNRTfXxvdZb9sEjtDCsa80wyfn4LfRlsCxgwqOcBoKQ0RmtMO1gKZK1EYkt1EwumNSKeamc6gOfZjhyp8V0c49X4P4+DlCnyYoG/OJXTI9bMRRX5jXveJhHseIq54H5HqAILS1thqYO075DFQbYuCoTg/REPnhSp1yNYEln0PMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3WedYU7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3WedYU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763702895; x=1795238895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fkqg2HO4s4okI7T9cuRNdLvw0w6PMBXesMWBu5oEwu4=;
  b=m3WedYU7QeSh2mDhScFFxQCh1QAKPuQCpQEPZZsQKXcNpgfHFXWTv35O
   NbMQEzQLJZkOk+SITmVstQv17W+JK6PPGLAWmOf3hDQCIU7epFMQoabDP
   V0oJdFXd4NKvAB3yHOpwais8vQJa0OToKN1IlKxrKV0OEf1zaicpOclN2
   K8oOey0iB9pcHMtO/z9U4zbxW7f42G8ExuJJnFFlsMRcMJ005dHMtv88b
   f464Biqglf0Q6+Nw3fEOqpeQ7004lA5qrF4l21/QnIH1Y6PXKjXGy6TUE
   0WX2kSuV3RgJ43BF0Ht07x9zE+Mzn5TVWItvdAWHE4smzTaGJu2qXb+Rh
   w==;
X-CSE-ConnectionGUID: NFPiMCGwR4a3qX5xFzGwmg==
X-CSE-MsgGUID: IGjeOhhfS7GNAbMvrxNAXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="88440873"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="88440873"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 21:28:15 -0800
X-CSE-ConnectionGUID: q5xvFKmTSqKcKqrwwZ4LBA==
X-CSE-MsgGUID: QcCtq01STvKjl0t99ldd/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="192050668"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Nov 2025 21:28:14 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMJgp-000507-2o;
	Fri, 21 Nov 2025 05:28:11 +0000
Date: Fri, 21 Nov 2025 13:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3297/3297] mm/kasan/shadow.c:90: undefined
 reference to `__memcpy_mc'
Message-ID: <202511211332.9jZLwiBl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5427a901f0549ec1c5dbf22e5029ae8ecf32077e
commit: b991780c836ceb9a479c6c6e385e914b487e353a [3297/3297] arm64: introduce copy_mc_to_kernel() implementation
config: arm64-randconfig-004-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211332.9jZLwiBl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211332.9jZLwiBl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211332.9jZLwiBl-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: mm/kasan/shadow.o: in function `memcpy_mc':
>> mm/kasan/shadow.c:90: undefined reference to `__memcpy_mc'


vim +90 mm/kasan/shadow.c

    81	
    82	#ifdef __HAVE_ARCH_MEMCPY_MC
    83	#undef memcpy_mc
    84	int memcpy_mc(void *dest, const void *src, size_t len)
    85	{
    86		if (!kasan_check_range(src, len, false, _RET_IP_) ||
    87		    !kasan_check_range(dest, len, true, _RET_IP_))
    88			return (int)len;
    89	
  > 90		return __memcpy_mc(dest, src, len);
    91	}
    92	#endif
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
