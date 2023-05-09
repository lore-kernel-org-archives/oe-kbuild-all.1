Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F48643
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 03:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683601794; x=1715137794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E85fafjTlmWr7GJ+3EI1MkY1pjy3i3bTw12YeWK7fU4=;
  b=FuHYPm+j5CWtFwv4EWWdJFUM7qJDH++btiwu+jyjfCJIe1TFyCaC6LSa
   RKbCEzyE8dhOETqI3lDMybW2x15teHbXWHIMG3B/GbgNKY9HtI9DGckoq
   HxOTwBgWvYOep3CrBOYukq7ceEvxxtI138OfMq6h7JoVQEnADgfrJkmmz
   RmMEARXjVh+LsvlHY6yFqYbSJZ6lh+j9mYCX3kr5BQCXog76/AXyzmEkE
   iB2uzD+fFh31eWfgKMoJ63ipofoAYQLdk2RZHCe4e+n2HdDKrTR3kv7td
   2oIdtoGktujPQCduKEtGek47TDwLZB8sCrDnTm95+e6LtJVpAK4OdFZez
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="334250141"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="334250141"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 20:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="842939434"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="842939434"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 May 2023 20:09:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwDjZ-0001cE-2l;
	Tue, 09 May 2023 03:09:49 +0000
Date: Tue, 9 May 2023 11:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: alison@she-devel.com, johan@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	alison@she-devel.com, achaiken@aurora.tech
Subject: Re: [PATCH 1/2] gnss: ubx: customize serial device open to set
 U-Blox Zed-F9P baud
Message-ID: <202305091016.ekHtVcRp-lkp@intel.com>
References: <20230429224349.1935029-2-alison@she-devel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429224349.1935029-2-alison@she-devel.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.4-rc1 next-20230508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alison-she-devel-com/gnss-ubx-customize-serial-device-open-to-set-U-Blox-Zed-F9P-baud/20230430-065242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230429224349.1935029-2-alison%40she-devel.com
patch subject: [PATCH 1/2] gnss: ubx: customize serial device open to set U-Blox Zed-F9P baud
config: mips-randconfig-c004-20230507 (https://download.01.org/0day-ci/archive/20230509/202305091016.ekHtVcRp-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091016.ekHtVcRp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gnss/ubx.c:263:5-11: ERROR: allocation function on line 262 returns NULL not ERR_PTR on failure

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
