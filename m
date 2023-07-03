Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EB4F9CB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 15:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688397029; x=1719933029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zq4TPE/ConExquqFCC1NYBoUWWFuvgyzWL4EOSrGXpA=;
  b=jCl2Z38KIlnNWAojkDxzHLPyo85QRKNQfiff74W2h5Gbf/rsbg/XBIPN
   fcaM9ih5k+8D2jEASKzjGqRziygSMJxQ3VzRHtLStDcz5wxJ+uiTHiwZ5
   XYdcB1W+1ojzPIBjX1BGai1adTjffvBnjWiguBobBB2wqmRGj5zym7ElA
   t5hcKNdZjOtk4AP0KVTaiRZiaqq4oYRQCIsHmKjL1gThEO/8V8mvaXOzg
   eo5OsjWZN31wQHyzw39iLIyyKnGArteBds+ZmWITZ1grLsAVTagsq+g3D
   0PaKrqRjLiN0Zef4xNObc9+grxfQDnANPlvB4LwIqNPezhn6If94qNETs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="393646573"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="393646573"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 08:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="831859555"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="831859555"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2023 08:10:13 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGLBs-000HR5-2E;
	Mon, 03 Jul 2023 15:10:12 +0000
Date: Mon, 3 Jul 2023 23:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v5] HID: steelseries: Add support for Arctis 1 XBox
Message-ID: <202307032208.b5brKeCt-lkp@intel.com>
References: <20230703102918.9941-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703102918.9941-1-hadess@hadess.net>

Hi Bastien,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.4 next-20230703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bastien-Nocera/HID-steelseries-Add-support-for-Arctis-1-XBox/20230703-183124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20230703102918.9941-1-hadess%40hadess.net
patch subject: [PATCH v5] HID: steelseries: Add support for Arctis 1 XBox
config: parisc-randconfig-r032-20230703 (https://download.01.org/0day-ci/archive/20230703/202307032208.b5brKeCt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307032208.b5brKeCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307032208.b5brKeCt-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/hid/hid-steelseries.o: in function `.LC10':
>> hid-steelseries.c:(.rodata.cst4+0x8): undefined reference to `hid_is_usb'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
