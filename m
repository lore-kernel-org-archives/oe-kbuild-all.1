Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D152534B1A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 18:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465048; cv=none; b=Pp3vxC77DUhTqP+i217tsUaasWOcDguFkfZU/zz8LnMeXz8uJCbQG7Kye65KIIFllsDIf2f3c8nPHB+bd7Ewl4XO+ZU3+uSmbxqskYGROWaiu3QQDkXtzHEIbtKXo8te1WYbE2lPABR9DmLOGssN3OWrRdzIWjIEHWnBHkIG6jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465048; c=relaxed/simple;
	bh=aChN73re9+mDwaRjlRj252C+1Dh7cQiHjrvH4XH2fpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuZ2w/ENF5KKXSGD19r7OZwzEDnhy8DBStuN3lphqczTuqQvvg0/O5UIVP9vJ16AKUPWbY9Le6Czgyj1SkKxTNxINirGE0ae5pmDYNnYKN087FDba4yPhoOeSsSFQSjti2HHvzSWodn4PGrVbJVT/8ALBDjXEgUwfeDIhNfX460=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AL0Dlz26; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AL0Dlz26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774465047; x=1806001047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aChN73re9+mDwaRjlRj252C+1Dh7cQiHjrvH4XH2fpA=;
  b=AL0Dlz2656AzerMZuojBPYt35JNkuDqBS1h4N6Faz8HIE8QtMUT7CiEC
   kfR18klm8V/bYe3D3QJArUS+NuyoHwGrT9iGlur04Qer56USpAV8Eu7Uc
   kMPxNEfL9lJH5Yf8xyE0OJAw7xHaF465vNr7SEy8JFR7kT6n5k+p4YOJu
   ZEDlgOqjkWlI0zRpTPUgMEefPomb+dLnjIUlriGHCcAGGPSwMtJPLklqA
   vAjfKi0nNZwI6vlCykYxLk1l+VuCXPNsU2V2mzMkK0fx1ZGuwFkRnv5ME
   MXaxsfKllH4dEGxBxmrT7Ry6l0euwqy8RVdW5CfZIjeEBf531guQO9cRE
   w==;
X-CSE-ConnectionGUID: K3ZRnFAbRJa0kwFndgBHjw==
X-CSE-MsgGUID: j9rI/EuwRlK+mP1rFux9Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75230447"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75230447"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 11:57:27 -0700
X-CSE-ConnectionGUID: D6UEZT7PS+KeWoHvhF6ZIw==
X-CSE-MsgGUID: JZ77ZO8xQaWiJnHqdFbBeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="229544630"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Mar 2026 11:57:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5TPs-000000007Uf-1EVv;
	Wed, 25 Mar 2026 18:57:20 +0000
Date: Thu, 26 Mar 2026 02:57:18 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com,
	lakshay.piplani@nxp.com
Subject: Re: [PATCH v8 7/7] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <202603260207.uKW7MqMC-lkp@intel.com>
References: <20260323062737.886728-8-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323062737.886728-8-lakshay.piplani@nxp.com>

Hi Lakshay,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on linus/master v7.0-rc5 next-20260324]
[cannot apply to i3c/i3c/next lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/i3c-master-Expose-the-APIs-to-support-I3C-hub/20260325-150847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20260323062737.886728-8-lakshay.piplani%40nxp.com
patch subject: [PATCH v8 7/7] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
config: um-randconfig-002-20260326 (https://download.01.org/0day-ci/archive/20260326/202603260207.uKW7MqMC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260207.uKW7MqMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260207.uKW7MqMC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:357:10: error: 'struct i2c_algorithm' has no member named 'reg_slave'
     357 |         .reg_slave = p3h2x4x_tp_i2c_reg_slave,
         |          ^~~~~~~~~
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:357:22: error: initialization of 'int (*)(struct i2c_adapter *, struct i2c_msg *, int)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Wincompatible-pointer-types]
     357 |         .reg_slave = p3h2x4x_tp_i2c_reg_slave,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:357:22: note: (near initialization for 'p3h2x4x_tp_i2c_algorithm.<anonymous>.xfer_atomic')
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:358:10: error: 'struct i2c_algorithm' has no member named 'unreg_slave'
     358 |         .unreg_slave = p3h2x4x_tp_i2c_unreg_slave,
         |          ^~~~~~~~~~~
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:358:24: error: initialization of 'int (*)(struct i2c_adapter *, u16,  short unsigned int,  char,  u8,  int,  union i2c_smbus_data *)' {aka 'int (*)(struct i2c_adapter *, short unsigned int,  short unsigned int,  char,  unsigned char,  int,  union i2c_smbus_data *)'} from incompatible pointer type 'int (*)(struct i2c_client *)' [-Wincompatible-pointer-types]
     358 |         .unreg_slave = p3h2x4x_tp_i2c_unreg_slave,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:358:24: note: (near initialization for 'p3h2x4x_tp_i2c_algorithm.smbus_xfer')
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:355:56: warning: missing braces around initializer [-Wmissing-braces]
     355 | static struct i2c_algorithm p3h2x4x_tp_i2c_algorithm = {
         |                                                        ^
     356 |         .master_xfer    = p3h2x4x_tp_i2c_xfer,
         |                                              }
     357 |         .reg_slave = p3h2x4x_tp_i2c_reg_slave,
         |                      {                       }


vim +357 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c

   351	
   352	/*
   353	 * I2C algorithm Structure
   354	 */
 > 355	static struct i2c_algorithm p3h2x4x_tp_i2c_algorithm = {
   356		.master_xfer    = p3h2x4x_tp_i2c_xfer,
 > 357		.reg_slave = p3h2x4x_tp_i2c_reg_slave,
 > 358		.unreg_slave = p3h2x4x_tp_i2c_unreg_slave,
   359		.functionality  = p3h2x4x_tp_smbus_funcs,
   360	};
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
