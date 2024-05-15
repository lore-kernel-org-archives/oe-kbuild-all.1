Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36713FB1B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 23:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715814194; cv=none; b=gloyRgIv5BRb6GY1liLvOa78X3gzl6xAoWdw58doB/TCkZJvpFdNcw91q+i7X90wGn9H/tT5GixfvF61/LdAsI/a9NZtfv2n8tryeTw3Vf66BKsJnz5qjxF5//RVTv0GM7yispOb4uJ+rRYzrwPfJvzg/B7u+02IU9uIwqSGMQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715814194; c=relaxed/simple;
	bh=sRqB680VTQvj7fzPc84hv8BNalE+uhs8Ck1nsl+35K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWiStbyXJSO33M3fNpmwXKhraAwZZGERdh0MSFTG5cijiJ6HuRy43XFZ7W2CkPeLo7jVakMSIHC79hEGdsNgGZu9UCqaDTw01TcMDMLh4ukzVvEajXGwMjOI42jAgSKXExdDCmeg0lw7gZ+cFzpx0mhW7nJuPxPijVafqz8axRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBW12Ns/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBW12Ns/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715814193; x=1747350193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sRqB680VTQvj7fzPc84hv8BNalE+uhs8Ck1nsl+35K4=;
  b=fBW12Ns/l/R/HXN04kR3gWCtmxqfjmOYAriISI5FUMjXaav1QmknaQt2
   ONw6Bk+PeyFxMJeNLiBxIO0Pjx32Z1EG/00GuvdsODbJEGBJXcpmhnvzG
   V7AXgW8kkqxzCYHbXLtPBbsdtNHNlXgegiZULbkJ4BSBch+ucOAz7nbVb
   HcUP7izg1uMh8LOBDMHQHECS+xVEOQscCBOIByx+DIUZkGyyHIFWR3JzJ
   8d2domGYjDIHLjNfpJOYyK4L9r1cGdja4V/4DIJcfmUt4DQzphfsE9ijT
   gENst+hqCFBGgT7utOgPvNQXW/vGQ+KI7DWBO2OiH47bBa7sbt+mhomMw
   g==;
X-CSE-ConnectionGUID: HdvJhp9hRmaoX5X33k5Z2w==
X-CSE-MsgGUID: LuZ44txTTp2SvbV+Sa0kQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12019058"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="12019058"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 16:03:12 -0700
X-CSE-ConnectionGUID: /y/vCtaLSxi9YEwbpTT0qA==
X-CSE-MsgGUID: Sg5o04ROTVaneSLM+lXQ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="35779249"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2024 16:03:10 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7NeN-000DKq-34;
	Wed, 15 May 2024 23:03:07 +0000
Date: Thu, 16 May 2024 07:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ronak Doshi <ronak.doshi@broadcom.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ronak Doshi <ronak.doshi@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next 2/4] vmxnet3: add latency measurement support in
 vmxnet3
Message-ID: <202405160624.WdmYFkNm-lkp@intel.com>
References: <20240514182050.20931-3-ronak.doshi@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514182050.20931-3-ronak.doshi@broadcom.com>

Hi Ronak,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ronak-Doshi/vmxnet3-prepare-for-version-9-changes/20240515-023833
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240514182050.20931-3-ronak.doshi%40broadcom.com
patch subject: [PATCH net-next 2/4] vmxnet3: add latency measurement support in vmxnet3
config: csky-randconfig-r081-20240516 (https://download.01.org/0day-ci/archive/20240516/202405160624.WdmYFkNm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160624.WdmYFkNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160624.WdmYFkNm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In function 'vmxnet3_get_cycles',
       inlined from 'vmxnet3_rq_rx_complete' at drivers/net/vmxnet3/vmxnet3_drv.c:1675:25:
>> drivers/net/vmxnet3/vmxnet3_drv.c:151:9: error: impossible constraint in 'asm'
     151 |         asm volatile("rdpmc" : "=a" (low), "=d" (high) : "c" (pmc));
         |         ^~~


vim +/asm +151 drivers/net/vmxnet3/vmxnet3_drv.c

   145	
   146	static u64
   147	vmxnet3_get_cycles(int pmc)
   148	{
   149		u32 low, high;
   150	
 > 151		asm volatile("rdpmc" : "=a" (low), "=d" (high) : "c" (pmc));
   152		return (low | ((u_int64_t)high << 32));
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
