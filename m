Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E123B1B3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771678329; cv=none; b=V4SYSIT2iwLyguJSjsPYrhWo5TAM1nAgXX7f59C2l1nXcSofZrXqzNS7lN+VycZIEXAAlDWte16B94sZqyF/GiG6YLc1NDx9/ZFU/iMiAtjxAaVVyV1ZkRIkqgWBPuCf2wa8mMg7z7N83FT5tgV4653KTvmqjnJY9qDr+r0ZV+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771678329; c=relaxed/simple;
	bh=0jn+S+AMCzx4rV1xd9ZiUXhl6sq11xIjCnqI55ZP8iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AI7parzMd1blQnS1ZCfAdD/rV9iqHsGt2xTj6uZd6B5+IeLorvLFAo8IZVdjCfpKDwgbBQXVtsHRVsQcliWlmnuQAEaDYCWj6KtDZRTLpI4apnhxa37xLUeZEPsRssZ9NDhiW1cLIZIntJl2GaKGwYCQD+P9wdVcOHIA/RgP8QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxqFE64H; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxqFE64H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771678328; x=1803214328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0jn+S+AMCzx4rV1xd9ZiUXhl6sq11xIjCnqI55ZP8iI=;
  b=LxqFE64HFHwa/qyLq+B4+KWb4X8JnyKVGAnZu25XWySyi7k2KQLqg4XQ
   2UreWZlnfMw+sRQ6WPxbpmnWZ2dVnkrVR2n6NYecnZCh8Qqe+96cp3mR6
   9qa9eo7Rs9q9QbMnKkCjQyyF4sJtyrPobzRA7ObqNiUa4bRRfY46KbHnv
   hXfoBdnyrH/rpMYDumW8a7xlpgp4zC9KBp8M5Tcohw1NDiEZJMGkvb2wL
   DXIohJ4pswTq9z3XA4+ectYnQ1PoRs3fwIX42f6SCICOcREAONjXJ55HF
   rLKKFUKc6ZYorgbbUX4S9jgLwYZ/Fp8jzPWtc24or4cuAMF7bnjtGWAvX
   Q==;
X-CSE-ConnectionGUID: 2+oQmUseR1uXGA3g13HIjQ==
X-CSE-MsgGUID: Z+kPjAHfSJWfo9rxBEQTUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83848277"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="83848277"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 04:52:07 -0800
X-CSE-ConnectionGUID: zPJlTwHyTTKqWPEUgqNC+Q==
X-CSE-MsgGUID: mLG27nyKR7Crwf4tEwdE3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="214341777"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Feb 2026 04:52:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtmSq-000000014v8-08Ld;
	Sat, 21 Feb 2026 12:52:04 +0000
Date: Sat, 21 Feb 2026 20:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 2/4] ethtool: module: Add CMIS loopback GET/SET
 support
Message-ID: <202602212018.KttWESkB-lkp@intel.com>
References: <20260219130050.2390226-3-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260219130050.2390226-3-bjorn@kernel.org>

Hi Björn,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 37a93dd5c49b5fda807fd204edf2547c3493319c]

url:    https://github.com/intel-lab-lkp/linux/commits/Bj-rn-T-pel/ethtool-module-Define-CMIS-loopback-YAML-spec-and-UAPI/20260219-210654
base:   37a93dd5c49b5fda807fd204edf2547c3493319c
patch link:    https://lore.kernel.org/r/20260219130050.2390226-3-bjorn%40kernel.org
patch subject: [RFC net-next 2/4] ethtool: module: Add CMIS loopback GET/SET support
config: arm64-randconfig-004-20260221 (https://download.01.org/0day-ci/archive/20260221/202602212018.KttWESkB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602212018.KttWESkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602212018.KttWESkB-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ethtool/module.c: In function 'module_is_cmis':
>> net/ethtool/module.c:87:2: error: label at end of compound statement
      87 |  default:
         |  ^~~~~~~


vim +87 net/ethtool/module.c

    76	
    77	static bool module_is_cmis(u8 phys_id)
    78	{
    79		switch (phys_id) {
    80		case SFF8024_ID_QSFP_DD:
    81		case SFF8024_ID_OSFP:
    82		case SFF8024_ID_DSFP:
    83		case SFF8024_ID_QSFP_PLUS_CMIS:
    84		case SFF8024_ID_SFP_DD_CMIS:
    85		case SFF8024_ID_SFP_PLUS_CMIS:
    86			return true;
  > 87		default:
    88		}
    89		return false;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
