Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509B7250E3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 04:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694666406; x=1726202406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UBVevpx8iKvAQZS+erfu48NY+lVMoUPua626oN8p8HU=;
  b=bwdYiCiymIazl5bO2qvr+5hcDSxk803eGJFeeF8AEER4qMDp0AM474/8
   pMmK/jRM7Wj1kNHIdR+T9YT3UbP55YwHsTmanbWD7FiL1SX4rdAAGfCEz
   AfuL02uedjuBSLQ79McUNlxaxRW37YDtILRxXK1e7t/FF2so86rzoTB3a
   m8EPWxNHlsx+/2QW4/RidvfNZF80BfCuH3EFMSaXHGBX/DpY11Q3Jp+vl
   r4DUERieYEd5NqLQ5p+XbLOjQ1lEmhjgA1zvbHKaawHZRooDpj0/uRrvS
   WB1ks541KNwvSvM1SfY9k+rbE/Fo3+jzny0Gf+UgwyxdKXjfvmIg7hBQH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="358281953"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="358281953"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 21:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="744388389"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="744388389"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Sep 2023 21:39:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qge8w-00019x-2L;
	Thu, 14 Sep 2023 04:39:54 +0000
Date: Thu, 14 Sep 2023 12:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Matyas <daniel.matyas@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Matyas <daniel.matyas@analog.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/4] hwmon: max31827: Handle new properties from the
 devicetree
Message-ID: <202309141254.Dpetnhzg-lkp@intel.com>
References: <20230913152135.457892-4-daniel.matyas@analog.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913152135.457892-4-daniel.matyas@analog.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Matyas/hwmon-max31827-Make-code-cleaner/20230913-232729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230913152135.457892-4-daniel.matyas%40analog.com
patch subject: [PATCH 3/4] hwmon: max31827: Handle new properties from the devicetree
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309141254.Dpetnhzg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141254.Dpetnhzg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/hwmon/max31827.rst:82: WARNING: Unexpected indentation.

vim +82 Documentation/hwmon/max31827.rst

    76	
    77	The conversions can be manual with the one-shot functionality and automatic with
    78	a set frequency. When powered on, the chip measures temperatures with 1 conv/s.
    79	The conversion rate can be modified with update_interval attribute of the chip.
    80	Conversion/second = 1/update_interval. Thus, the available options according to
    81	the data sheet are:
  > 82		- 64000 (ms) = 1 conv/64 sec
    83		- 32000 (ms) = 1 conv/32 sec
    84		- 16000 (ms) = 1 conv/16 sec
    85		- 4000 (ms) = 1 conv/4 sec
    86		- 1000 (ms) = 1 conv/sec (default)
    87		- 250 (ms) = 4 conv/sec
    88		- 125 (ms) = 8 conv/sec
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
