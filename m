Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259CFFBEF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 12:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683202848; x=1714738848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=34+wP4Naxy8S6mrFGbyePaiklMvauxCcq6X/A6XD3cs=;
  b=oFyAHa+wP1o6QO4vMOSwhQZPSUF6X6hC7fq+VrwYNhHaye6CuPZE11HL
   iYRB7CmEFqjUBMpfykSeXiF4gXQ1ifP6zW+aC8XTR0VAP/RyMSOeH7mjs
   AuXvP8t+wTS2u/Om5/i6Yryy3iW60S3ZCaVBNDP6zloc4bQzIlOsGCgwp
   wXu8Ssb3I1njZczwQg6hptZhWWUSiWqiRhbEbdmCihEetcspzxLQZ4Kew
   NOJOKbsTzJph+bygdPsR5hqAQBYawv64aVfD7VzbjSSLGmGXRrwdzGaG0
   esAb0qCF0kLXIlgATikzNppl0qqlv62r/pn6i2rg3LV0oxhCefdD2tq4/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="376983113"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="376983113"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 05:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="1026921550"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="1026921550"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 May 2023 05:20:25 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puXwe-0002uM-1D;
	Thu, 04 May 2023 12:20:24 +0000
Date: Thu, 4 May 2023 20:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Luke D. Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	acpi4asus-user@lists.sourceforge.net, hdegoede@redhat.com,
	corentin.chary@gmail.com, markgross@kernel.org, jdelvare@suse.com,
	linux@roeck-us.net, "Luke D. Jones" <luke@ljones.dev>
Subject: Re: [PATCH] platform/x86: asus-wmi: add support for ASUS screenpad
Message-ID: <202305042007.28rKu9cK-lkp@intel.com>
References: <20230503040207.257406-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503040207.257406-1-luke@ljones.dev>

Hi Luke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luke-D-Jones/platform-x86-asus-wmi-add-support-for-ASUS-screenpad/20230503-120548
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230503040207.257406-1-luke%40ljones.dev
patch subject: [PATCH] platform/x86: asus-wmi: add support for ASUS screenpad
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/ff073483de3660059cb167912c02e51226e4b32e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Luke-D-Jones/platform-x86-asus-wmi-add-support-for-ASUS-screenpad/20230503-120548
        git checkout ff073483de3660059cb167912c02e51226e4b32e
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305042007.28rKu9cK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-platform-asus-wmi:114: WARNING: Unexpected indentation.

vim +114 Documentation/ABI/testing/sysfs-platform-asus-wmi

 > 114	Date:		May 2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
