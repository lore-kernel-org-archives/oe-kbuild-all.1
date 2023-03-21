Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0210D10E5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 02:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679365090; x=1710901090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W75ElsjLVFfYoLlYWFsDP8xCGZ2jEb+1E/+PqC6P454=;
  b=FNX1tyGIFdwA8xnFuySjQGx+j0sY5WRM4PlHFJGQDPXMXNmksCF3PaRq
   RZJyr8yygwmlnTUhF+USRey4uOPHc/PTEmuL09rWCpSipUJJVQR3diHwN
   KutJN68vqbHRY+fYErldLQXTvbDi033Whq+tyKIfA4Men/XzcOUZ0idv7
   NIGxInlqvRRrAdRWGHVDEqDQx1t1KAweqvHp/7ATFyYqH+skP75NWCfUB
   OqvRXggxBPPDBnW6Ml/g2Lnl0SqxLUwauz3YkZD3LI72cjIzIWwmNHkfy
   btwoWtv6jnFG9L3+NNKbZqaqBSzKUt0xR1UVkywJk+1rqXQkTEmky8AQC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="327205221"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="327205221"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 19:18:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="745661113"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="745661113"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Mar 2023 19:18:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peRZe-000BV0-3C;
	Tue, 21 Mar 2023 02:18:06 +0000
Date: Tue, 21 Mar 2023 10:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Yadlapati <lakshmiy@us.ibm.com>, robh+dt@kernel.org,
	linux@roeck-us.net, jdelvare@suse.com,
	krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
	eajames@linux.ibm.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	Lakshmi Yadlapati <lakshmiy@us.ibm.com>
Subject: Re: [PATCH v2 4/5] docs: hwmon: Add documenttaion for acbel-crps PSU
Message-ID: <202303211050.D9YSILr1-lkp@intel.com>
References: <20230320154019.1943770-5-lakshmiy@us.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320154019.1943770-5-lakshmiy@us.ibm.com>

Hi Lakshmi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next linus/master v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshmi-Yadlapati/dt-bindings-vendor-prefixes-Add-prefix-for-acbel/20230320-235222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230320154019.1943770-5-lakshmiy%40us.ibm.com
patch subject: [PATCH v2 4/5] docs: hwmon: Add documenttaion for acbel-crps PSU
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/e44825c6557c3020131598f7a5e842cbaf29cb1f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lakshmi-Yadlapati/dt-bindings-vendor-prefixes-Add-prefix-for-acbel/20230320-235222
        git checkout e44825c6557c3020131598f7a5e842cbaf29cb1f
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211050.D9YSILr1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/hwmon/acbel-crps.rst:2: WARNING: Title underline too short.
>> Documentation/hwmon/acbel-crps.rst:7: WARNING: Bullet list ends without a blank line; unexpected unindent.
>> Documentation/hwmon/acbel-crps.rst:30: WARNING: Malformed table.
>> Documentation/hwmon/acbel-crps.rst: WARNING: document isn't included in any toctree

vim +2 Documentation/hwmon/acbel-crps.rst

   > 2	=======================
     3	
     4	Supported chips:
     5	
     6	  * ACBEL Common Redundant Power Supply.
   > 7	  Supported models: FSG032-00xG
     8	
     9	Author: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
    10	
    11	Description
    12	-----------
    13	
    14	This driver supports ACBEL Common Redundant Power Supply. This driver
    15	is a client to the core PMBus driver.
    16	
    17	Usage Notes
    18	-----------
    19	
    20	This driver does not auto-detect devices. You will have to instantiate the
    21	devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
    22	details.
    23	
    24	Sysfs entries
    25	-------------
    26	
    27	The following attributes are supported:
    28	
    29	======================= ======================================================
  > 30	curr1_crit          Critical maximum current.
    31	curr1_crit_alarm    Input current critical alarm.
    32	curr1_input         Measured output current.
    33	curr1_label         "iin"
    34	curr1_max           Maximum input current.
    35	curr1_max_alarm     Maximum input current high alarm.
    36	curr1_rated_max     Maximum rated input current.
    37	curr2_crit          Critical maximum current.
    38	curr2_crit_alarm    Output current critical alarm.
    39	curr2_input         Measured output current.
    40	curr2_label         "iout1"
    41	curr2_max           Maximum output current.
    42	curr2_max_alarm     Output current high alarm.
    43	curr2_rated_max     Maximum rated output current.
    44	
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
