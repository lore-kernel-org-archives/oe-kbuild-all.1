Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660727;
	b=ZbjDRCEA50oVK/Tnn7nFUw7KHiof7CxxNI5vLIDBp+xE+umJ+OmHTNcF9aUaY6Acbiqe
	 HOb1FqiLHipMYOG2eArmFd1dRgrfL7w6BE8ETKdYSiV3n8UaG9Ww3AZtkPk8UUrPh9Gz7
	 nReyo1nbzt5XV8uJBGd0OnWEKMWobFsapKRiJEF3za78X+lz+fErF2v3oKc5DOMeKYfLJ
	 AIvq1H2ySurzfQxbHutHvx+Rq8YIBa5FAFASLe1CuWohgeg76Uy6N3mHYH9xG7S2gRjCl
	 4VMdbD/tiIX7gOP8yBg7+4yNqhJAIJUITKWv/l4L9SOTH6ykRB9dUtVcMP01rmRw4Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660727;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6z9b9mSX5em+eYVwEbza/UZrKzP5uQ54ri96jis88Vw=;
	b=HRYp8G1Q2/kWTt9ehHFNrK8T1vmqKTU/BJ+n2ZWywnTi6O8T4oICMPg+aAc0l3JaL4ki
	 K9kgAmT7noal7VC0oqMu4zPXn5Ca129EQ5uPhgHxO7h6eXXbsA9A2x1T42IQMvF0bWWsK
	 hgF1RDGhjiLzO2/BVXgPv5kgOkYgcws8GzTfYf1SfizsWJkbX0kC6LKbMQkfqfFyME33d
	 TCSglWu8cCk7J3ub8sy/rj4BdC/0RBIFdZ3BRazVLy+tMP1A/cIqCTEdPC0RA5/CIEuHX
	 L/GX4mtImmW++2eBzbY2xLkIO9wYCrg9liXwVDJgSdWwTnSGpMtgCut9fOYCqyYxR0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C07lSpdt;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E3F606A334
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 23:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E3F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C07lSpdt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793660720; x=1825196720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=40EvMptE/g4ClcTExHfMheoYbDNv1t9uw0oFBOgt0sQ=;
  b=C07lSpdtSuFSuo8UgHMrFwOzuuIvdtfx54dAnRp5KIdPRhanp13phgnU
   /AiOqEQ4v5vBXwpTbYqsgMQvviGUVi+74T57ZSU4kVFKBeJC2y4MVAhkN
   IO6hp/e1+2Rh39L4jaRSjtobZR1IPWGipHCt69VgirH6Y7lSznRmXhjfs
   HXpC8SxbX+fxLE2mQmh3Rf28BJmvucX7xcLX/ezUqL45mhEOkozFOxVy4
   C/W0b1Ge8uvS+iU1UJtkRaeZFTYlFkiiwfNRnJx5EDWen7G1e1oNQRnWG
   6U286TXqSuoGz3zLUxO2wynqwTtyZpIgrFsVj3DMSF5gDESc0drkT4dwK
   A==;
X-CSE-ConnectionGUID: 5uq4XCd0S3+UmXT2WVtgsQ==
X-CSE-MsgGUID: QwOiixBfQKaYTV81KAkGcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2402226"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2402226"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 15:05:11 -0800
X-CSE-ConnectionGUID: 7L8gtDHPS4GOCFjXYRZf3g==
X-CSE-MsgGUID: G7MIiBXLQ5GpE8999zhnjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6583141"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Nov 2026 15:05:09 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xO15O-00000000hyq-25uT;
	Mon, 02 Nov 2026 23:05:06 +0000
Date: Tue, 3 Nov 2026 07:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Viktor Korsnes <viktor.korsnes@remarkable.no>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Viktor Korsnes <viktor.korsnes@remarkable.no>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: nxpwifi: fix hex parsing in
 nxpwifi_parse_cal_cfg()
Message-ID: <202611030637.0PbWNnLh-lkp@intel.com>
References: <20261102121856.1011263-1-viktor.korsnes@remarkable.no>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102121856.1011263-1-viktor.korsnes@remarkable.no>

Hi Viktor,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Viktor-Korsnes/wifi-nxpwifi-add-missing-header-to-HOST_CMD_CFG_DATA/20261102-131800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git main
patch link:    https://lore.kernel.org/r/20261102121856.1011263-1-viktor.korsnes%40remarkable.no
patch subject: [PATCH wireless 1/2] wifi: nxpwifi: fix hex parsing in nxpwifi_parse_cal_cfg()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20261103/202611030637.0PbWNnLh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611030637.0PbWNnLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611030637.0PbWNnLh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/nxp/nxpwifi/sta_cmd.c: In function 'nxpwifi_parse_cal_cfg':
>> drivers/net/wireless/nxp/nxpwifi/sta_cmd.c:1405:29: error: implicit declaration of function 'hex2bin' [-Wimplicit-function-declaration]
    1405 |                             hex2bin(d, s, 1))
         |                             ^~~~~~~


vim +/hex2bin +1405 drivers/net/wireless/nxp/nxpwifi/sta_cmd.c

  1393	
  1394	static u32 nxpwifi_parse_cal_cfg(u8 *src, size_t len, u8 *dst, size_t dst_size)
  1395	{
  1396		u8 *s = src, *d = dst;
  1397	
  1398		while (s - src < len) {
  1399			if (*s && (isspace(*s) || *s == '\t')) {
  1400				s++;
  1401				continue;
  1402			}
  1403			if (isxdigit(*s)) {
  1404				if (d - dst >= dst_size || src + len - s < 2 ||
> 1405				    hex2bin(d, s, 1))
  1406					return 0;
  1407				d++;
  1408				s += 2;
  1409			} else {
  1410				s++;
  1411			}
  1412		}
  1413	
  1414		return d - dst;
  1415	}
  1416	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
