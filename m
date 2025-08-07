Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C998710957
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584398; cv=none; b=CF5//G2C2NPTU26kfvuPxxH2LlDqoeWYZCrRXIfDwU5rTsoeOnlqh6bfsoJmyg+w5OBPVGCp8CCQpVRFJgu2RB++aF0aNuCL46gaqh7fIZ4CxQnFJtt14Bh7Zw4KxHZ/QjgjfUvMZ45a6LyZvYm4PE2W2gY4JzqRoIeakOKfNS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584398; c=relaxed/simple;
	bh=HDADaLzgWDbc79JlIggfFLwZ6XbbXJ/c3svGJDBoU0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqJIdSKWacw7mm6gU0+DTR9ACCsrd1TqWPA5a2PqNLsJipMuWUjWP5yJZhDqtHfwNU/+KC0SXG11oJhusRWqO/L/HY0PNpQJ6sXMbjCKkkGudsW91b+SFaLAnlsRgSVEVWP0LzpTE4FqunaKzKI3It7gRqnjgrS43ReZ4YMY36I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzBA1AYa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzBA1AYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754584396; x=1786120396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HDADaLzgWDbc79JlIggfFLwZ6XbbXJ/c3svGJDBoU0k=;
  b=gzBA1AYaJWtFYLw4Z8iuWryeLSE8V+t933kaTrHK56TfuEY9IZScE0mv
   ElMdezLJaCtH4bu2UQVPOV4XgzZ9M9KzIOp8IgAnUi0ZyAZfrKTGEmaQP
   UO1aMJK0SdADfcan0e4omrF0fDlVvLmIA1OeOVWbk/p/3jDtB4n4oglzo
   2bHojwFOtYdjxeSg8al3g8gm3lvkKjo7hL3Bkkmn/jnYXMOAYsbjhqLgj
   dI7mF+Xl8U2WSAJWOvdV7Yzx2HMYk6WSyhVjMABdj4sNwhufNptW/aAF+
   oPIK0s41Y8aaSWONOf/kt6qm5wt2TfCvEGxiNnbhWBcff5k/TVVkTU2KS
   Q==;
X-CSE-ConnectionGUID: 4eWozXYXSFyQcr84gAuWsw==
X-CSE-MsgGUID: yxhC9MZeTDmw1MpsRoeD7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="59542794"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="59542794"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 09:33:15 -0700
X-CSE-ConnectionGUID: fXz2j/ZFQE2h33cYVodByQ==
X-CSE-MsgGUID: A1SOGxC+T2+BpQ5J6TcNFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="196108320"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Aug 2025 09:33:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk3YA-0002zC-3D;
	Thu, 07 Aug 2025 16:33:08 +0000
Date: Fri, 8 Aug 2025 00:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandra Winter <wintera@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 11/17] net/dibs: Move struct device to dibs_dev
Message-ID: <202508080012.h93p1VGZ-lkp@intel.com>
References: <20250806154122.3413330-12-wintera@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806154122.3413330-12-wintera@linux.ibm.com>

Hi Alexandra,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandra-Winter/net-smc-Remove-__init-marker-from-smc_core_init/20250806-234621
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250806154122.3413330-12-wintera%40linux.ibm.com
patch subject: [RFC net-next 11/17] net/dibs: Move struct device to dibs_dev
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250808/202508080012.h93p1VGZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080012.h93p1VGZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080012.h93p1VGZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/dibs/dibs_main.c: In function 'dibs_dev_release':
>> net/dibs/dibs_main.c:96:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
      96 |         kfree(dibs);
         |         ^~~~~
   net/dibs/dibs_main.c: In function 'dibs_dev_alloc':
   net/dibs/dibs_main.c:103:16: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     103 |         dibs = kzalloc(sizeof(*dibs), GFP_KERNEL);
         |                ^~~~~~~
   net/dibs/dibs_main.c:103:14: error: assignment to 'struct dibs_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     103 |         dibs = kzalloc(sizeof(*dibs), GFP_KERNEL);
         |              ^


vim +/kfree +96 net/dibs/dibs_main.c

    89	
    90	static void dibs_dev_release(struct device *dev)
    91	{
    92		struct dibs_dev *dibs;
    93	
    94		dibs = container_of(dev, struct dibs_dev, dev);
    95	
  > 96		kfree(dibs);
    97	}
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
