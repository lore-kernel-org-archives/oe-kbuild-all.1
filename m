Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D618D5465B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 04:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719288249; cv=none; b=LalVZwGiQmEw9elCMvWVcinoPHLboQSVuF+V2vnWJP3SBpb2gvYYAJNcUcNVLBbAD9xwST56Ow1JJlGd10ksz6GyLdHT1C1q/w246tPs2wXbu47X3JBzZ7To5necCE0tbE0A5htu9Y8Y42HIapTfwOzpt0UOalAswV8md97DfsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719288249; c=relaxed/simple;
	bh=s6NAGeVfJkajlwGA1I3vnfcAeTueWLQT2V/BDscvdUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llmat88n6lcV2SGWpL51rNfWdwjyLNqakyyjR5TUcxdacb6lhpUrdua6kT9yYaE/Cc0jlFw5AqjL9cm70ZrS5n+mHkfvT5xHkcByMyz3zhYrtiyFHj/KkxWc5XHd8o8DavKm6WtDASoN9zZlRIfNwC3sysrwilHqqjCYVBnrM6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCeKgSGm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCeKgSGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719288248; x=1750824248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s6NAGeVfJkajlwGA1I3vnfcAeTueWLQT2V/BDscvdUo=;
  b=QCeKgSGmOxAvr0ZkVViElhUF5OiT38fTWF/PWmU0PtST1e6Xj2Q5pzBq
   XAeBCXQ5bd22Dt6AySNr82dvfNYYeRiv/7IZxVbVyRFqSIbUpPxQIkoyL
   4LBiIGuP7Cp2E/zY92f8pkIzriew5o9kmGbFmuM70DrX5crlrqBvKb+zM
   P6GzzwtmoKO2Lfr/HrWjNcLCSnYDWm1ARHDMfp6le2g6n2W9sZONgTpYc
   BW+VSzLNydfEeYMFVm5DqLFA5YbbTVbzYV1fUHSr96WV7Z2WTmr3e/FYn
   c7njUX4v5LE3YzVT5NFi1KX3eLDVaed2j/5T6YT4AQb2PwOw1w9WsCDAz
   A==;
X-CSE-ConnectionGUID: cEC0WR+QQJKOgr/8yX0/4g==
X-CSE-MsgGUID: iJlAR/jbTiyhse7vzuhDCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26973946"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="26973946"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 21:04:05 -0700
X-CSE-ConnectionGUID: MD8O1zKpQAejAnF6Kq4w3w==
X-CSE-MsgGUID: QKPQMzWFQ8yQhnEqOEwimQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="48470549"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jun 2024 21:04:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLxPV-000E1t-2H;
	Tue, 25 Jun 2024 04:04:01 +0000
Date: Tue, 25 Jun 2024 12:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, gary.chang@realtek.com
Subject: Re: [PATCH 1/7] wifi: rtw89: wow: append security header offset for
 different cipher
Message-ID: <202406251139.1GzHAlKS-lkp@intel.com>
References: <20240620055825.17592-2-pkshih@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620055825.17592-2-pkshih@realtek.com>

Hi Ping-Ke,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.10-rc5 next-20240624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ping-Ke-Shih/wifi-rtw89-wow-append-security-header-offset-for-different-cipher/20240624-152444
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20240620055825.17592-2-pkshih%40realtek.com
patch subject: [PATCH 1/7] wifi: rtw89: wow: append security header offset for different cipher
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240625/202406251139.1GzHAlKS-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406251139.1GzHAlKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406251139.1GzHAlKS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/realtek/rtw89/core.c:21:
   drivers/net/wireless/realtek/rtw89/wow.h: In function 'rtw89_wow_get_sec_hdr_len':
>> drivers/net/wireless/realtek/rtw89/wow.h:82:52: error: implicit declaration of function 'rtw89_is_rtl885xb' [-Werror=implicit-function-declaration]
      82 |         if (!(rtwdev->chip->chip_id == RTL8852A || rtw89_is_rtl885xb(rtwdev)))
         |                                                    ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/rtw89_is_rtl885xb +82 drivers/net/wireless/realtek/rtw89/wow.h

    77	
    78	static inline int rtw89_wow_get_sec_hdr_len(struct rtw89_dev *rtwdev)
    79	{
    80		struct rtw89_wow_param *rtw_wow = &rtwdev->wow;
    81	
  > 82		if (!(rtwdev->chip->chip_id == RTL8852A || rtw89_is_rtl885xb(rtwdev)))
    83			return 0;
    84	
    85		switch (rtw_wow->ptk_alg) {
    86		case RTW89_WOW_FW_ALG_WEP40:
    87			return 4;
    88		case RTW89_WOW_FW_ALG_TKIP:
    89		case RTW89_WOW_FW_ALG_CCMP:
    90		case RTW89_WOW_FW_ALG_GCMP_256:
    91			return 8;
    92		default:
    93			return 0;
    94		}
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
