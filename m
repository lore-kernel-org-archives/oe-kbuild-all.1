Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D491104
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 05:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688535713; x=1720071713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HUAt3U42HCZDHpLQ85nw0NDF0N9Ckkn1QxOID021dY4=;
  b=HuASOjpxRUwdUnOhTxjffrPU0gSVs0bXR+7C54n2IhmERO4f/cOUCXRZ
   n3AyRbgioMBmQNhQ2L3g9Cu8QTNOZLorfq5qCaaaTQT/JuDYnB4D5s39j
   yNNhcXaaU0RQjmt/qV7EDQGDz1w8gTU7lxgTbs52EmipHIlx1EYTjlUo5
   QtVHsPOdVSMF1gTIFz3SUUDL2xuMSXOmALW8+/RixxMWieVBD5Q1xkLi8
   V58PeeiIazkjluUQv1iU4we4pkjPowVwZCnoFhgh1G7goQa2p7yF8u/AO
   JB9tmAv4Tmvu//negXPjHrITkBFFhtKVZFIvkZUDF/JuF4DWRRFcLUrNs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="342845357"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="342845357"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 22:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="965687490"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="965687490"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jul 2023 22:41:49 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGvGv-0000PX-0Y;
	Wed, 05 Jul 2023 05:41:49 +0000
Date: Wed, 5 Jul 2023 13:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, linux-leds@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] leds: pca995x: Add support for PCA995X chips
Message-ID: <202307051306.EhTQLR8l-lkp@intel.com>
References: <20230705000407.153005-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705000407.153005-2-marex@denx.de>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on krzk-dt/for-next linus/master v6.4 next-20230704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/leds-pca995x-Add-support-for-PCA995X-chips/20230705-080506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20230705000407.153005-2-marex%40denx.de
patch subject: [PATCH v2 2/2] leds: pca995x: Add support for PCA995X chips
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230705/202307051306.EhTQLR8l-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307051306.EhTQLR8l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307051306.EhTQLR8l-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> FATAL: modpost: drivers/leds/leds-pca995x: sizeof(struct i2c_device_id)=24 is not a modulo of the size of section __mod_i2c__<identifier>_device_table=588.
>> Fix definition of struct i2c_device_id in mod_devicetable.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
