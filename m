Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9768480
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jun 2023 20:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688070834; x=1719606834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jHQylX9t1Ps0Q6r/iNcNApS7OxcGpV4eIw6GyBndpQ4=;
  b=PGOiBU0IhwIsfwSorcpy3ZsmdT1ljjtb0pzhuY89A6PnmhA8eYSyBnpm
   kQLKC0F5M5gPXD6uRHDz7Rn3vQ6OsSm2yZex53boY/60nduegcP8PzmlR
   dD7jpUVnZGCqwh665v1YRi8aNSduy0Ht8huBfuRYUsPm8SOIGdlHyMR7m
   UjJiID9IvL7tl52suzbQOSatw2okzrQcCEyJWtao2h9tL/3cCaRn2/Q9q
   kURRWSDy036WNlkkxRaygAX8B9ITozM2R/ct/ZK1gc2N8lkv6C0tpqzR8
   DpyXrQw5JjjoYQvl55tyVJ3q5nrYQBe/erVR5WlZwXaTuDHGKqVtDRYmr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364800462"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="364800462"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 13:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="667692848"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="667692848"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Jun 2023 13:33:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEyKp-000ENr-0Q;
	Thu, 29 Jun 2023 20:33:47 +0000
Date: Fri, 30 Jun 2023 04:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: steelseries: Add support for Arctis 1 XBox
Message-ID: <202306300419.dmlkSoqD-lkp@intel.com>
References: <20230629172041.3771-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629172041.3771-1-hadess@hadess.net>

Hi Bastien,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.4 next-20230629]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bastien-Nocera/HID-steelseries-Add-support-for-Arctis-1-XBox/20230630-012252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20230629172041.3771-1-hadess%40hadess.net
patch subject: [PATCH] HID: steelseries: Add support for Arctis 1 XBox
config: arc-randconfig-r035-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300419.dmlkSoqD-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300419.dmlkSoqD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300419.dmlkSoqD-lkp@intel.com/

All errors (new ones prefixed by >>):

   arceb-elf-ld: drivers/hid/hid-steelseries.o: in function `steelseries_headset_raw_event':
>> hid-steelseries.c:(.text+0x344): undefined reference to `usb_set_wireless_status'
>> arceb-elf-ld: hid-steelseries.c:(.text+0x344): undefined reference to `usb_set_wireless_status'
   arceb-elf-ld: drivers/hid/hid-steelseries.o: in function `steelseries_probe':
   hid-steelseries.c:(.text+0x790): undefined reference to `usb_set_wireless_status'
   arceb-elf-ld: hid-steelseries.c:(.text+0x790): undefined reference to `usb_set_wireless_status'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
