Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EC51D2F42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 02:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763431640; cv=none; b=M6363+sXvB04xfoKJgF++dD1jrc5Zt5p4YpbbcNm7MZ4+X3o6pTPb22OcDP2HbztDuiiuhjgl2TzgpZYsJy/oivHccQn5nMFyLOukwxq4DYfIXmMLvCFkkbdK1BprCt5/9G+4xCxDmGPznYfRJAe0ek5Eur3yj8jOX8S3HShQwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763431640; c=relaxed/simple;
	bh=R+A/g7bJZH508VaV8A7OtaYDuRBS4L5nfFKAy4VZ698=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BnjE8K1Jn47X+65QW4dyMP/yzPZZf2AoVsyJ9PM3vKS8IEcHxPRzshApmkCbRsuYbZdrSuhmBElGIZaZ8hGHU0QwNgWgOCFzhYR3jWXiF1Acocx8lM1FqoXwtlmS07/p3zG/n9v99D7ppBBHO6M5zDFymIICzkGIsCeRtzOShz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsXmLiAm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsXmLiAm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763431639; x=1794967639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R+A/g7bJZH508VaV8A7OtaYDuRBS4L5nfFKAy4VZ698=;
  b=HsXmLiAm8YAHY+yn3pYPtNCEEcP//zL6L20kqUSubWYajxEiguOpuvZB
   HRUYLxAUXIq1+0ccocZ7wBItpSL4px9qq4eVL9Iemss4TZ3rDN5NfWInO
   nZT3qXR15gvtUAw7XSIvi3H6EP2SqKRI6OKMuCnBnYPbTYPT6IhMkn0n0
   Ok9QnQPLo4ETPl1bEKmmVcCE+Pf8t2pSj4vA5pgiXk1JAiBlwl5DJhh9S
   xC5eEOfZwYZK2kbwQUSNWQusnwN6nXbcZpdB0Iy0pAvMd6yr7BA9bro2Y
   K6Hzb+S6wq7iNl+3MLKoQW7TLvSofxzYR0PYkayWCkUliLE+SDuAIDMQX
   w==;
X-CSE-ConnectionGUID: fD8YEIBrQlGUTwk2QJHVSg==
X-CSE-MsgGUID: e5qJVvhuSI+Uv5EmI1UCWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="90919627"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="90919627"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 18:07:18 -0800
X-CSE-ConnectionGUID: Y5DTSeaAQiKBRUlI4vWd5A==
X-CSE-MsgGUID: ar1OghDtTdGVJ9aGWxrhKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="190420659"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Nov 2025 18:07:17 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLB7j-0001Ex-15;
	Tue, 18 Nov 2025 02:07:15 +0000
Date: Tue, 18 Nov 2025 10:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 4/9] ERROR: modpost: "mldsa_44_verify"
 [lib/crypto/tests/mldsa_kunit.ko] undefined!
Message-ID: <202511181025.55ghRRNN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   e298b80f8063fcbc335870ff3f1d59dae4d5116a
commit: 2c8549faf59c9e75793de9307da5ef4755daff1a [4/9] crypto: Add ML-DSA-44 pure rejection test vectors as a kunit test
config: arm-randconfig-002-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181025.55ghRRNN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181025.55ghRRNN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181025.55ghRRNN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mldsa_44_verify" [lib/crypto/tests/mldsa_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
