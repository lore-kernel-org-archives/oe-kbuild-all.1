Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3541D61A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 21:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729200903; cv=none; b=O0YftyZV6R9DbJhP7lSf1ZymKg5pX4OhrkJbl/HMdtu3+e0b0Im8BtO28Ag9gU1nGxik78xeFQKp5DO10ahguZcksNffkBVgQbbTsdeRxzfjsRQRCJuvcTI6heb84ToNzEoSGEih3ByysL5dYeAkNQmoA0ZL8EyhG+ve3JlYqH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729200903; c=relaxed/simple;
	bh=48YG+JGTHE3S5/27NawYLVVHlS4dCY4Gc+EKzKTt1sI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=of9PSLryPccg0Yjo1uCCPB0xvEqIJd+HE+pi2onz6hw6OGqR8Lh74+s6ZSwortDRoSIAIgWZkRgqBRCGAexwO+uTqFwkKsXEwCtsAo/PRnhqwxovQ8mUu0ZGcvUFTIJwO7wugZA08Cv53UiT7DwqNPeijGdF0undHlz6zFwTRQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bhfth1Pt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bhfth1Pt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729200899; x=1760736899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=48YG+JGTHE3S5/27NawYLVVHlS4dCY4Gc+EKzKTt1sI=;
  b=Bhfth1Pt2kkqBV0KLpUyBcHNy2ZZjNUNaicIfKnm+C5GEHMjnlXpSqzn
   HQtmg6gOyGeiiuYI/SHd0B6A/80SraS/8Ng1+EVqgqpTJ3ymkDwkptJb/
   y9TdwK6Cjo1TSdUeLA8zOGOqIf6S/NEwop5AX5afARF1ydY98aG+1hUHv
   MvMU3vzQTeVaTsTqSkkgp9+4Wqj40MuTDy7/2+gnSeMOXnHN0hnD4V4Mx
   eaFTTsy/EzQ8MeUhMR8MMs5BHsvb5dhO8i2RvcHxuQbrJNlcYxLvVOyrd
   OTncryF7cAo2gtrb4gD9dnL7OGAjrgyop3fZleF6i0d3Ez7CRQ23mHAZ8
   g==;
X-CSE-ConnectionGUID: +jn1bSZCQ1eCToNj8Ex0mg==
X-CSE-MsgGUID: gGmw0WGRQ8S/jXRTdVXCEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39257440"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39257440"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 14:34:53 -0700
X-CSE-ConnectionGUID: QCA6gA4EQYGs05LFkrlJdg==
X-CSE-MsgGUID: rYiiZD8rSwulP5cEu4Xizg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="83755207"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Oct 2024 14:34:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1Y8u-000My5-2f;
	Thu, 17 Oct 2024 21:34:48 +0000
Date: Fri, 18 Oct 2024 05:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20241015 17/18]
 ./usr/include/linux/if_arp.h:118:33: error: field 'arp_pa' has incomplete
 type
Message-ID: <202410180511.pR0VdibP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gustavo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20241015
head:   d64af418459145b7d8eb94cd300fb4b7d2659a3c
commit: f04e61e1c69991559f5589080462320bf772499d [17/18] uapi: net: arp: Avoid -Wflex-array-member-not-at-end warnings
config: x86_64-buildonly-randconfig-002-20241017 (https://download.01.org/0day-ci/archive/20241018/202410180511.pR0VdibP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180511.pR0VdibP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180511.pR0VdibP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/if_arp.h:118:33: error: field 'arp_pa' has incomplete type
     118 |         struct sockaddr_legacy  arp_pa;         /* protocol address              */
         |                                 ^~~~~~
>> ./usr/include/linux/if_arp.h:119:33: error: field 'arp_ha' has incomplete type
     119 |         struct sockaddr_legacy  arp_ha;         /* hardware address              */
         |                                 ^~~~~~
>> ./usr/include/linux/if_arp.h:121:33: error: field 'arp_netmask' has incomplete type
     121 |         struct sockaddr_legacy  arp_netmask;    /* netmask (only for proxy arps) */
         |                                 ^~~~~~~~~~~
   ./usr/include/linux/if_arp.h:126:33: error: field 'arp_pa' has incomplete type
     126 |         struct sockaddr_legacy  arp_pa;         /* protocol address              */
         |                                 ^~~~~~
   ./usr/include/linux/if_arp.h:127:33: error: field 'arp_ha' has incomplete type
     127 |         struct sockaddr_legacy  arp_ha;         /* hardware address              */
         |                                 ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
