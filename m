Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFD58BEE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 02:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744165960; cv=none; b=XYuo0U7O1l6Wi9oKfCwmN3iTl0HZ95XxtHMpXBb5RvsIL53Pwuam7eGqDToe/+e4mO9FZAyKPCXI1lVnHM5zieBlhul8fX6FxxMxvsUNS7CfcuWMHz5qxW9opQ3Peue0HcoLDdOQ91U4SEwKnGJBwV0aI+41Ub+mYKtDQdDhv6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744165960; c=relaxed/simple;
	bh=vnaDNkCLPpmH76yQp56KQf7WqL8mrYB+8sRUh34dcGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApVsNvkoKCdEu/G14Zeq8nKJaVV3wsOayYiquvE0ABov8o5yqnJms6R1g5P+mjSF5Crv6xmy1oNaROS0lndpj5UpmveVG1+w4KXoV6LbFceBY4ytMX8dLsrnVK53X5VjO9tk4bZGeW/4R60MuKJmmvgU1ewnWGBjZIk4M0HP1jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZg8UtZW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZg8UtZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744165958; x=1775701958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vnaDNkCLPpmH76yQp56KQf7WqL8mrYB+8sRUh34dcGc=;
  b=TZg8UtZWkD8eHyNWLhFe5nGl9HwxzfOjUhidmEz+B5ogljqahe9uKmUN
   73/8XPl6aaKRjEgQw+rg4ghqurS4Y9r79PiQzUXV8teJ+1YOQOrbDKDlF
   QJzc6XhNX1aWSUmv8lL5QKWdrYfznOR2Wxs+sIlsL6cnR8t/qy+hkqebN
   RXGY8ZVBtbabbylj+yFLU4x0iy3moKUlI7177saKLtPOVBlfYDDW1R8D5
   obpW/e9+bnc27WhN58RP/+kksBikOygg2Tuw/BSP7jGh6KKxGsgtaE/+v
   y9NpVRx1bXbKx18jTPbcfw1dO989+K8Arz0uMLQDR9UHjXbsTTfIFtLAh
   g==;
X-CSE-ConnectionGUID: ygCuBfcLS32vM6UfTTnqIg==
X-CSE-MsgGUID: 8Y3YhH/RSGO6nUpzyRyvew==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49465360"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="49465360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 19:32:37 -0700
X-CSE-ConnectionGUID: thhpgLzqTnyYqgpIXkTxAQ==
X-CSE-MsgGUID: 9HlMwltuT7uIdLoQ6jkFpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="151634018"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 19:32:33 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2LEt-0008CT-07;
	Wed, 09 Apr 2025 02:32:31 +0000
Date: Wed, 9 Apr 2025 10:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Heiner Kallweit <hkallweit1@gmail.com>,
	upstream@airoha.com, Kory Maincent <kory.maincent@bootlin.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Robert Hancock <robert.hancock@calian.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [net-next PATCH v2 11/14] net: axienet: Convert to use PCS
 subsystem
Message-ID: <202504091007.RSwPrfcI-lkp@intel.com>
References: <20250407232058.2317056-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407232058.2317056-1-sean.anderson@linux.dev>

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-net-Add-Xilinx-PCS/20250408-072650
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250407232058.2317056-1-sean.anderson%40linux.dev
patch subject: [net-next PATCH v2 11/14] net: axienet: Convert to use PCS subsystem
config: arm-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504091007.RSwPrfcI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504091007.RSwPrfcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504091007.RSwPrfcI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_main.c:38:0:
   include/linux/pcs.h: In function 'pcs_get':
>> include/linux/pcs.h:165:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return -EOPNOTSUPP;
            ^
   include/linux/pcs.h: In function 'pcs_get_by_fwnode':
   include/linux/pcs.h:178:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return -EOPNOTSUPP;
            ^
   include/linux/pcs.h: In function 'pcs_get_by_dev':
   include/linux/pcs.h:191:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return -EOPNOTSUPP;
            ^


vim +165 include/linux/pcs.h

b7da98b4ee6f2f Sean Anderson 2025-04-07  162  
b7da98b4ee6f2f Sean Anderson 2025-04-07  163  static inline struct phylink_pcs *pcs_get(struct device *dev, const char *id)
b7da98b4ee6f2f Sean Anderson 2025-04-07  164  {
b7da98b4ee6f2f Sean Anderson 2025-04-07 @165  	return -EOPNOTSUPP;
b7da98b4ee6f2f Sean Anderson 2025-04-07  166  }
b7da98b4ee6f2f Sean Anderson 2025-04-07  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
