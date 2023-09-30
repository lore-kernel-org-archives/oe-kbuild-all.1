Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D01193
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 00:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696032916; x=1727568916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6cS0OOOzJy+TWm+pONxiMK/YecABXrBmw59B3VTqqx4=;
  b=AXlgPG24vMsT3zS7bcpNJI3kKp8Q2dC7VDUPQNYvHwUk+O6d0N+vcg0c
   LVA+ETRpUrovKKPIlNOOB+E8qoERBP7n1GtFQgXKPQ49YtNXcEKF+y1w8
   ZbYEPpeBtZFSGyHvq4OXNEyaqZJtVRn6BP/mFpyeyLC59Ci5wJgCvSPgk
   edzObXBX9uMltWXlLhssV6BfSGbIAGCMeEoNNa3L+0S2gyfPZOlTi8Fsm
   t7NsiJMZOEz0U/tCOtjQJ72+hRyl3LhVR3YeA/0syGXrfoevAKOYetHVb
   iex+E4951Y08K1KjiVUC9MhMUIBZVHplrgDcnWv2veuLXPr7x6xUCwJHc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="381286457"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="381286457"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 17:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="743585064"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="743585064"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Sep 2023 17:15:09 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmNdT-0003Sf-0H;
	Sat, 30 Sep 2023 00:15:07 +0000
Date: Sat, 30 Sep 2023 08:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Fabio Estevam <festevam@gmail.com>, martink@posteo.de,
	Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH 5/7] media: bindings: ovti,ov5640: Fix handling of
 video-interface-device
Message-ID: <202309300855.B0j1LqGe-lkp@intel.com>
References: <20230929151825.6535-6-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929151825.6535-6-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on sailus-media-tree/streams linus/master v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-bindings-hynix-hi846-Add-video-interface-device-properties/20230929-232019
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230929151825.6535-6-jacopo.mondi%40ideasonboard.com
patch subject: [PATCH 5/7] media: bindings: ovti,ov5640: Fix handling of video-interface-device
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309300855.B0j1LqGe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300855.B0j1LqGe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml: 'unevaluatatedProperties' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml: 'oneOf' conditional failed, one must be fixed:
   	'unevaluatedProperties' is a required property
   	'additionalProperties' is a required property
   	hint: Either unevaluatedProperties or additionalProperties must be present
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
