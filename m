Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E4D238163
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 18:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740680686; cv=none; b=FOPPQug0Qb8jI2csIs4BNch/UfRe2akx91bwhRLuuhS5oXW++x0S5yZx8oTw/phLzPwa8zlE5SNCsDg2/0Bq5CXmVtv7xHZwdMle7kqlVF+3aLOpRAOGPbST5WQ3pMRf8G96v9mSGn1V5L9cexjsnXC7r4IFxRfjXHLimQk39I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740680686; c=relaxed/simple;
	bh=CTQ3CrMe9y/fhsGDE2cP8Lcm6bD3sG2hHzHuYGAg828=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzp0sgCfVq/cSv6QHCHTa4DA+4zHZSJo19It0+VEfGLJ/vNAuU8xnzFTHuoufz8qGTgtZGrAoxUOydZtqg40/ux4zur4FWem/Nye2Bh9ydtNi7Gwd8gUJqA4JfrGvxMZXYE16NIdipyZSme7QP1bx8gSe/QPtFi7W573hGwI7TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Df9Onb6M; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Df9Onb6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740680685; x=1772216685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CTQ3CrMe9y/fhsGDE2cP8Lcm6bD3sG2hHzHuYGAg828=;
  b=Df9Onb6MhFkgP6Wlwwt6+0aCGJ7uemGzZNJzaOOPAvD6xqLYD+K67Ojg
   rtcNPwrcPfzXd0jmQv4b++JnpL3XEbvfBVTBZNMBjghV2Y2ZGzBgQaUoE
   dZdjkJcmhHnxJUBM6oyf1Mp6KDjbuSZLlGoc4FwjqB1r967amaNqvkW5J
   ZXaHjY9nJuouvYBU8uoJuCA+S9ib9oBFYNWhBMO/n+PvNtqxgtsdFmL/q
   ZbPfCjRds7KDMYSpMCVW2NXNHA/ZgE2tVCcPdJaiqJy0GEnHw4GzHPcpX
   BpHCGb4LK2opnX+W16IB+5ZFmQT1+BXxil7Vp/ZZ5s/a9UWNkB1EuvQhR
   w==;
X-CSE-ConnectionGUID: 1rCtfTzwQkuIMNcbF9aypw==
X-CSE-MsgGUID: JE4yAAWNRMWB8Rx18axyZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41471304"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="41471304"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 10:24:44 -0800
X-CSE-ConnectionGUID: 1lPctFgrTn6MWUdOa6/nFg==
X-CSE-MsgGUID: 9po0173QS9Cr+32aUFeHmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117102578"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Feb 2025 10:24:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tniYo-000Dqq-2Q;
	Thu, 27 Feb 2025 18:24:38 +0000
Date: Fri, 28 Feb 2025 02:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: Gerhard Engleder <gerhard@engleder-embedded.com>, andrew@lunn.ch,
	hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: Re: [PATCH net-next v8 8/8] tsnep: Add loopback selftests
Message-ID: <202502280225.eNUtFj7i-lkp@intel.com>
References: <20250224211531.115980-9-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224211531.115980-9-gerhard@engleder-embedded.com>

Hi Gerhard,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Gerhard-Engleder/net-phy-Allow-loopback-speed-selection-for-PHY-drivers/20250225-103125
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250224211531.115980-9-gerhard%40engleder-embedded.com
patch subject: [PATCH net-next v8 8/8] tsnep: Add loopback selftests
config: mips-randconfig-r064-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280225.eNUtFj7i-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280225.eNUtFj7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280225.eNUtFj7i-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/engleder/tsnep_selftests.c:7:
   include/net/selftests.h:50:59: error: 'void' must be the first and only parameter if specified
      50 | static inline int net_selftest_set_get_count(int set, void)
         |                                                           ^
   include/net/selftests.h:50:59: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
>> drivers/net/ethernet/engleder/tsnep_selftests.c:762:65: error: too few arguments to function call, expected 2, have 1
     762 |         count += net_selftest_set_get_count(NET_SELFTEST_LOOPBACK_SPEED);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~                            ^
   include/net/selftests.h:50:19: note: 'net_selftest_set_get_count' declared here
      50 | static inline int net_selftest_set_get_count(int set, void)
         |                   ^                          ~~~~~~~~~~~~~
   drivers/net/ethernet/engleder/tsnep_selftests.c:763:65: error: too few arguments to function call, expected 2, have 1
     763 |         count += net_selftest_set_get_count(NET_SELFTEST_LOOPBACK_SPEED);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~                            ^
   include/net/selftests.h:50:19: note: 'net_selftest_set_get_count' declared here
      50 | static inline int net_selftest_set_get_count(int set, void)
         |                   ^                          ~~~~~~~~~~~~~
>> drivers/net/ethernet/engleder/tsnep_selftests.c:773:65: error: incompatible pointer types passing 'u8 **' (aka 'unsigned char **') to parameter of type 'u8 *' (aka 'unsigned char *'); remove & [-Werror,-Wincompatible-pointer-types]
     773 |         net_selftest_set_get_strings(NET_SELFTEST_LOOPBACK_SPEED, 100, &data);
         |                                                                        ^~~~~
   include/net/selftests.h:55:73: note: passing argument to parameter 'data' here
      55 | static inline void net_selftest_set_get_strings(int set, int speed, u8 *data)
         |                                                                         ^
   drivers/net/ethernet/engleder/tsnep_selftests.c:774:66: error: incompatible pointer types passing 'u8 **' (aka 'unsigned char **') to parameter of type 'u8 *' (aka 'unsigned char *'); remove & [-Werror,-Wincompatible-pointer-types]
     774 |         net_selftest_set_get_strings(NET_SELFTEST_LOOPBACK_SPEED, 1000, &data);
         |                                                                         ^~~~~
   include/net/selftests.h:55:73: note: passing argument to parameter 'data' here
      55 | static inline void net_selftest_set_get_strings(int set, int speed, u8 *data)
         |                                                                         ^
   drivers/net/ethernet/engleder/tsnep_selftests.c:825:64: error: too few arguments to function call, expected 2, have 1
     825 |         data += net_selftest_set_get_count(NET_SELFTEST_LOOPBACK_SPEED);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~                            ^
   include/net/selftests.h:50:19: note: 'net_selftest_set_get_count' declared here
      50 | static inline int net_selftest_set_get_count(int set, void)
         |                   ^                          ~~~~~~~~~~~~~
   1 warning and 6 errors generated.


vim +762 drivers/net/ethernet/engleder/tsnep_selftests.c

   757	
   758	int tsnep_ethtool_get_test_count(void)
   759	{
   760		int count = TSNEP_TEST_COUNT;
   761	
 > 762		count += net_selftest_set_get_count(NET_SELFTEST_LOOPBACK_SPEED);
   763		count += net_selftest_set_get_count(NET_SELFTEST_LOOPBACK_SPEED);
   764	
   765		return count;
   766	}
   767	
   768	void tsnep_ethtool_get_test_strings(u8 *data)
   769	{
   770		memcpy(data, tsnep_test_strings, sizeof(tsnep_test_strings));
   771		data += sizeof(tsnep_test_strings);
   772	
 > 773		net_selftest_set_get_strings(NET_SELFTEST_LOOPBACK_SPEED, 100, &data);
   774		net_selftest_set_get_strings(NET_SELFTEST_LOOPBACK_SPEED, 1000, &data);
   775	}
   776	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
