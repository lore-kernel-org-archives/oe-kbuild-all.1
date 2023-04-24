Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E757129A1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682349235; x=1713885235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=frhCaQHz/0+SvLWssH9RMMeJzPVGe5R5XNjt8rhsOKc=;
  b=b6PWe2wrbXnquF9bJP4dMyJMsWqDoI/8jhLWgRhen5pD1+CcCShGI2a6
   I3Zxx2JvNXdgr2NBtpbHkn4IGXy5kJhuEDsW95GZYq67vsyEYQILi0lOI
   hSl9nxhdaihdRblmJROUjmSl/HOemC4FoLSTQVSYWTieXk0oCfurbo+8t
   KsO2NzDK+7SoqomX6aVbwwW3AILTYB4bhCANDFYXYGr2snvLj3+HzgWpf
   pr05e99XBYIxfbABr42mVd+Cj1AwhAqPW/UuEQvsrU3EKSyClJqvXM84n
   leUJY2oSf6gkO68riZqBkg6YoQehaik34NQT99u0pzCFamnV/YDYQzGj/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="345234158"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="345234158"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 08:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="723617191"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="723617191"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Apr 2023 08:13:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqxt1-000iSG-05;
	Mon, 24 Apr 2023 15:13:51 +0000
Date: Mon, 24 Apr 2023 23:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>, rafael@kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	Shyam-sundar.S-k@amd.com,
	Mario Limonciello <mario.limonciello@amd.com>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org
Subject: Re: [PATCH] ACPI: x86: Separate out the Microsoft _DSM function calls
Message-ID: <202304242231.68KXGyif-lkp@intel.com>
References: <20230420160923.14127-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420160923.14127-1-mario.limonciello@amd.com>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7124d7671af0facf115d70f9d1fadde0d768d325]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-x86-Separate-out-the-Microsoft-_DSM-function-calls/20230421-001547
base:   7124d7671af0facf115d70f9d1fadde0d768d325
patch link:    https://lore.kernel.org/r/20230420160923.14127-1-mario.limonciello%40amd.com
patch subject: [PATCH] ACPI: x86: Separate out the Microsoft _DSM function calls
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230424/202304242231.68KXGyif-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/e4ea0d2f15f2d0486bc3b4f59cbf9cea6c63fda1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mario-Limonciello/ACPI-x86-Separate-out-the-Microsoft-_DSM-function-calls/20230421-001547
        git checkout e4ea0d2f15f2d0486bc3b4f59cbf9cea6c63fda1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/acpi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304242231.68KXGyif-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/acpi/x86/s2idle.c:479:13: sparse: sparse: restricted suspend_state_t degrades to integer
   drivers/acpi/x86/s2idle.c:479:33: sparse: sparse: restricted suspend_state_t degrades to integer
>> drivers/acpi/x86/s2idle.c:552:6: sparse: sparse: symbol 'lps0_s2idle_wake' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
