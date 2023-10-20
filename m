Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44C01DDCB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeFS+w9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697815890; x=1729351890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d8WfxPaOzLW8AWmNf+EMLv4pLoLyObaSU2ANMkPjryc=;
  b=QeFS+w9GFm2fP845g8ugdDxm1yVn3R83EuVoCz2DmpU99GFTFN95ljAp
   7fpYcPCN3bgCqSeTf85ffQ6mUTtkbWkZgzvM/KDG0xZSA1yqJKiKMV+Jm
   +cU4mFfAp2n9KnZcbm+MuMnb6odMym9M7oWXzhjNdNKnug24YfKjSH79s
   baWQccS8hVUmTgg5mDl00f4iUTKL/Yw5bf4/7m1mbuFbzSuH4LLlTf3Fq
   DQyslOebcc8d7G3gwl/br0/gLQJZNotef0RJN7FkbnnOMO02d6w5AUarp
   geUJ6YPRPHBYcjs5MfcsYZ+7cQ3ODzcnmm0jtXaHSfVhBFeAw32De5h2T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="385401519"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="385401519"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 08:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="761084863"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="761084863"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Oct 2023 08:31:15 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtrSz-0003fh-0M;
	Fri, 20 Oct 2023 15:31:13 +0000
Date: Fri, 20 Oct 2023 23:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: James Ogletree <james.ogletree@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev,
	James Ogletree <james.ogletree@cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] Input: cs40l50 - Add support for the CS40L50
 haptic driver
Message-ID: <202310202344.LreohGFP-lkp@intel.com>
References: <20231018175726.3879955-5-james.ogletree@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018175726.3879955-5-james.ogletree@opensource.cirrus.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus lee-mfd/for-mfd-next robh/for-next linus/master lee-mfd/for-mfd-fixes v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Ogletree/dt-bindings-input-cirrus-cs40l50-Add-initial-DT-binding/20231019-015950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20231018175726.3879955-5-james.ogletree%40opensource.cirrus.com
patch subject: [PATCH v4 4/4] Input: cs40l50 - Add support for the CS40L50 haptic driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310202344.LreohGFP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310202344.LreohGFP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310202344.LreohGFP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/misc/cs40l50-vibra.c: In function 'cs40l50_vibra_remove':
>> drivers/input/misc/cs40l50-vibra.c:329:13: warning: the comparison will always evaluate as 'true' for the address of 'dsp' will never be NULL [-Waddress]
     329 |         if (&cs40l50->dsp)
         |             ^
   In file included from drivers/input/misc/cs40l50-vibra.c:11:
   include/linux/mfd/cs40l50.h:180:23: note: 'dsp' declared here
     180 |         struct cs_dsp dsp;
         |                       ^~~


vim +329 drivers/input/misc/cs40l50-vibra.c

   319	
   320	static int cs40l50_vibra_remove(struct platform_device *pdev)
   321	{
   322		struct cs40l50_private *cs40l50 = dev_get_drvdata(pdev->dev.parent);
   323	
   324		input_unregister_device(cs40l50->input);
   325		cs_hap_remove(&cs40l50->haptics);
   326	
   327		if (cs40l50->dsp.booted)
   328			cs_dsp_power_down(&cs40l50->dsp);
 > 329		if (&cs40l50->dsp)
   330			cs_dsp_remove(&cs40l50->dsp);
   331	
   332		return 0;
   333	}
   334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
