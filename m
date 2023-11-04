Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CB212B69
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 10:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldOJDvBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699093317; x=1730629317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=emg2xa7Wz0DXz6//3gwEvIkyuahnQ3WpkSUAQpBFaek=;
  b=ldOJDvBwjWMVfmivCZ04iP7kUPyTG5kWxQk/kXGwrTUFU8ncgAN5067a
   78Dz0C4bt0nHPkNJksmhilghh5kpx4LDCMC9D2Y0Oh1ygukkObUC14CXa
   9SjX+BfyjPcizyWRuOynx/gDZLwD8nrJflrcZOEkjcCYmlkfjrsVbU96t
   xwO2Wo/jw2zT862zCRqe5vfwqElCUphit/TANpDGAXHzUOibsIpK04xbG
   GnKJOLVtY1SYMOLlrtLCo1DhgmIwKPQz4HuMNq8ILvlf9amvJUIYHW/Ac
   BwRfQwk80jkgkkCPGEe4uAXBl2+sXZhfi2jcU27gRN59v5G8oe9FZbI3m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="386250276"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="386250276"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 03:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="711759849"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="711759849"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Nov 2023 03:21:50 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzDml-0003lw-2R;
	Sat, 04 Nov 2023 10:21:47 +0000
Date: Sat, 4 Nov 2023 18:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Henry Shi <henryshi2018@gmail.com>, hbshi69@hotmail.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	hdegoede@redhat.com, markgross@kernel.org, jdelvare@suse.com,
	linux@roeck-us.net, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hb_shi2003@yahoo.com,
	henrys@silicom-usa.com, wenw@silicom-usa.com
Subject: Re: [PATCH v10] platform/x86: Add Silicom Platform Driver
Message-ID: <202311041804.4fQDRw0E-lkp@intel.com>
References: <20231027203836.25936-1-henryshi2018@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027203836.25936-1-henryshi2018@gmail.com>

Hi Henry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on linus/master tip/auto-latest v6.6 next-20231103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Henry-Shi/platform-x86-Add-Silicom-Platform-Driver/20231028-043932
base:   tip/master
patch link:    https://lore.kernel.org/r/20231027203836.25936-1-henryshi2018%40gmail.com
patch subject: [PATCH v10] platform/x86: Add Silicom Platform Driver
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311041804.4fQDRw0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041804.4fQDRw0E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: file ./Documentation/ABI/testing/sysfs-platform-silicom#18:
>> Warning: /sys/devices/platform/silicom-platform/hwmon/hwmon1/ is defined 4 times:  ./Documentation/ABI/testing/sysfs-platform-silicom:28  ./Documentation/ABI/testing/sysfs-platform-silicom:37  ./Documentation/ABI/testing/sysfs-platform-silicom:46  ./Documentation/ABI/testing/sysfs-platform-silicom:55

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
