Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934176;
	b=k6Xmjfu3eDxM40GGEeNbXMV03ZzEAc3pI6qcd88SJYpOnJmueyqajiFk53WCQp3OiYE+
	 hchcU0NL2R2VzkvdtodZYLHAZiyeE3X+VtGoXQ5ijpvnfoctfMIVtBCVTokU3n07cuewf
	 dej4SEC6W0bYF1vJEl9BrIzOWUMcMceH3shGWrRk8Ufwhy/bXXKWiOkN05C7HcW1KYvFj
	 Ro3Y2K/foZTnK6b9jbTvuCXGmkVyWPmsLnHYPBt6eL+4KFqxiU8kbM42u6CPKj9c8TWq2
	 ndDCq9zYsFeZ/0Rh80Fw2NXMDxXpjb2DDviP2hQE0RWaoaIyfRbcYSNe7MP34RslLXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934176;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2YR8rl+GGFbncmUMrSW0eijCZeC2vAMN26k0XEift+0=;
	b=5PJ1jSorn8yNrODRi4yihoQoU/qgTmu/Si5Z6/9lUi2c70IzlbkNVpjaq38xz4UuMxNY
	 KEHZDkkj+wsGc8WkCa36iKzwbX93qweUU3WG8D/8q80p7j9sjZw7+utNP7E3jh8SRsEIt
	 DXxjqhxFrXm6Y0xjUY27yvgns+uUDQt3SdMH4cRx8bt9+/UkeuKllz4XUOJ5wYb4c5mtu
	 suhJsZgg3AQJzOpgd2BKPD4ceYhtEi/UHp5sv+D1cuqOzVhJ/omjD7n46vMM4HRmG56Y+
	 LYvIVK4BwiJuwWX8EMVAN6Ggir5Jf/gpYxFnH51zHnjUQNxcxi6bADNU1KolZKs8C2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mYBDRHMQ;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD905606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 03:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD905606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mYBDRHMQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793934175; x=1825470175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oaSNQDemGHlJSYKH1ldJU5q8jgU2oc+ggmGZkRCO0vY=;
  b=mYBDRHMQrDmFPK/wgsrAmBkHLUgyMOZhqhrJlSBNJ6EeE/kT/Wb5Ri7T
   Q/6Cij2VVF5mdRRcpG/bqtTzBa3/lK4OnatnWgWAdVtzzXFEnSSEqubkP
   t9EUHOOS2ZjNsrYK36g954J9eQSjJrEp7gqCegQmREBz/jNI13eDqqC7r
   K6QYMZtiWqWgSjBuCB6sIoDihc5xogwAFxhdJqYpFpLxSrzBBcBpuYzhv
   bUpp0ztdRnijOnP7snHaUNtdxZlKMw/DAT7aU9mZet2vFbgX8hMZGxLUW
   TBm4I+cSeOFygcymAxuEMP5wOQswOq6UE/HH5ZdJUu0q+8YC6NHPhPRaC
   w==;
X-CSE-ConnectionGUID: s3zTA+LlSRGmTa+iifU58g==
X-CSE-MsgGUID: lwjgDh3pRryVVx9aiDGKHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2759322"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2759322"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:02:54 -0800
X-CSE-ConnectionGUID: 0SsrEfIQTAyQZZu4/aazfg==
X-CSE-MsgGUID: 7VdkqNl1SV6pApz3bPbGaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7206432"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2026 19:02:54 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPAE6-00000000nDn-3z65;
	Fri, 06 Nov 2026 03:02:50 +0000
Date: Fri, 6 Nov 2026 11:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: sequencing: core: add a note on descriptor
 serialization
Message-ID: <202611061108.IT0tUaIe-lkp@intel.com>
References: <20261105-pwrseq-core-desc-kerneldoc-v1-1-e10a2b03ce1f@oss.qualcomm.com>
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
In-Reply-To: <20261105-pwrseq-core-desc-kerneldoc-v1-1-e10a2b03ce1f@oss.qualcomm.com>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/power-sequencing-core-add-a-note-on-descriptor-serialization/20261105-165511
base:   ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
patch link:    https://lore.kernel.org/r/20261105-pwrseq-core-desc-kerneldoc-v1-1-e10a2b03ce1f%40oss.qualcomm.com
patch subject: [PATCH] power: sequencing: core: add a note on descriptor serialization
config: arc-randconfig-1000-20261106 (https://download.01.org/0day-ci/archive/20261106/202611061108.IT0tUaIe-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061108.IT0tUaIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061108.IT0tUaIe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/power/sequencing/core.c:282 Excess struct member 'note' description in 'pwrseq_desc'
>> Warning: drivers/power/sequencing/core.c:282 Excess struct member 'note' description in 'pwrseq_desc'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
