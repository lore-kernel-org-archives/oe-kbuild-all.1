Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FF7BD11
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 03:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674185920; x=1705721920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EB2lkS+x/9jEyhGm5ehEc71PtyQN77WPV+WuEHz58Qs=;
  b=BCn6D+msipZFM3rlsvHYZsXVNijC52RPd+oyVYplj45g1aZvGngHB3Q5
   VKfbC7OMkOyOfAJYHjoEKgs0bqimq1ObB7sHFOycLLFg1RaKfzitFPfFk
   NYrOcXXsNo4QhM6kOCBYtm+U0y3hhBCGNMoMOtT6TfQEWsZ0+yJTnuG4y
   R10HIlSqLGpptf4oulN/tfZok3/RFpIl9zGqUWjCaP/Vo+jl90bbuS5lq
   Nyd93qZWjarESJUh9iR0mCunYkjhBvvA+TBjrMrjS8sv8VzZLTt53yAz1
   awZWxfZdVg3tIEWs5p5mKAUuwKpGA8J6Ha4DZ04Th/dg/7H39Lae6Di3Y
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="313387633"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="313387633"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 19:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="638014485"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="638014485"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Jan 2023 19:38:38 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIiEf-00028u-1v;
	Fri, 20 Jan 2023 03:38:37 +0000
Date: Fri, 20 Jan 2023 11:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Steen Hegelund <steen.hegelund@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [linux-next:master 4474/6912]
 drivers/net/ethernet/microchip/vcap/vcap_api.c:977:11-18: WARNING
 opportunity for kmemdup
Message-ID: <202301201120.aIaz7dT4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d514392f17fd4d386cfadde7f849d97db4ca1fb0
commit: 814e7693207f1bd936d600f9b5467f133e3d6e40 [4474/6912] net: microchip: vcap api: Add a storage state to a VCAP rule
config: ia64-randconfig-c033-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201120.aIaz7dT4-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/microchip/vcap/vcap_api.c:977:11-18: WARNING opportunity for kmemdup
   drivers/net/ethernet/microchip/vcap/vcap_api.c:985:11-18: WARNING opportunity for kmemdup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
