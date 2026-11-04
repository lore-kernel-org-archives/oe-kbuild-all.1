Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812331;
	b=aceFMmuSjK/xMo0TfZssjGhjcu4FtGcKHTj6n/E4LpSkannY5AdlBL+5NcXYC/MjAGE7
	 dtWZlqxi9ll+/A3XCiUNcWnEsZMda/xfYXuRYH+bN2PGvOW1hnTMuJ7UraPRoV/6dGgNi
	 wDRl6au3gKw5bC30W14fs0bThtwCryIahwca/l9hQFs152h1GoC1dol0R+KKdWX/fLwAq
	 JViUNYeAlrs2AtKxZBTLeqzDdTJNZQ8SwgddEUuccPls6gV3VMme0nwUkLXOkOOrNIEMQ
	 1LReADctzOgaAQ/ZH7+yo/vUu2fSuB3B9ZqNntAx5mGLO9ntOG11MS1Ntvq10mjKLZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812331;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=eEdtJLZsq5FgJ1F49dOHXA9L4hxksraEH5qSeBWlHd4=;
	b=enSFnhA9EDrtSn/ua7dS6DyBzdpwKZOL9WkR8YxBP5JyfoOyLqtuy7nR9363g8ETssk5
	 VgmiLmhiIL8GAYzJdyMbNezL5CUJFPiz4nPM+WaM5tu/PlUrXrgWD0yS3goaHEUCGL2yC
	 GaMDv29na4gPUHkhOONsSb8hv3lCotHfIK7U67cM3XtAdb6VSlhNAlkLemvYmyT3PAAq3
	 zgdnZS9pzcapJVKDGDRBdgjRVn7EMxO53Fze+zmo9FTC6yjp6KaOqmjDPUhdgkKpWONU2
	 nUYX1cg49A801Wh02RKOWqTZb2z0skbkcQkNSqqWljNLIiNQgTjXVCDzx/RHzqbshrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QfmkNCAR;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D741C606A31B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 17:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D741C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QfmkNCAR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793812330; x=1825348330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BXYJslrqbbqsyc+rbU5nWD5XEo3Udcaph7lKzHxoDBo=;
  b=QfmkNCARgm9XEjwB0kTi3k8Or1mMlNV63+QhjU/ggc8t0XJzAK2jiE/C
   OjQ4f3HC6flcWnIfeH4B/mmKl8WW28THiVY//shg4b8llVVAE7oaJ9u7/
   0tWHf1u+F/yCbQm4cqHKsel8o2PgksO8IUAYQDU91L1rctRIfJuAl2rb+
   QOZr4L/l7h4cwc4gIc9L3NtbqbL2vx1EWCbyyKm3HnfI11yJ8hF2iLXHQ
   ykg/T9XWlJF8atbcevYO3wTSQGj9UQzzSuKqTy0Dq4mXv+iFYjwH+G7ac
   dO5TqKZzjsVl9IrIktpaDO5n69J2uSWur8TfFi4yXjsEvt5bA1+wckIcZ
   g==;
X-CSE-ConnectionGUID: sk1MloCUT+qiRu6NPvt1sA==
X-CSE-MsgGUID: pUUIwZNXSfiVHNczB4GNNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2609522"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2609522"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 09:11:11 -0800
X-CSE-ConnectionGUID: 2ELJd6WxSXWEERFREpPLDQ==
X-CSE-MsgGUID: lgB4CCC3RFGvD1X25Z6r+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6878837"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2026 09:11:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOeVv-00000000kkB-15lx;
	Wed, 04 Nov 2026 17:11:07 +0000
Date: Thu, 5 Nov 2026 01:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 10/14] power/supply: add support for x86 macs in
 macsmc-power
Message-ID: <202611050048.nK2wA1Zt-lkp@intel.com>
References: <20261029085504.3547-11-atharvatiwarilinuxdev@gmail.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029085504.3547-11-atharvatiwarilinuxdev@gmail.com>

Hi Atharva,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on groeck-staging/hwmon groeck-staging/hwmon-next groeck-staging/watchdog groeck-staging/watchdog-next jic23-iio/togreg linus/master v7.3 next-20261030]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Atharva-Tiwari/treewide-Add-backend-for-macsmc/20261029-045158
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20261029085504.3547-11-atharvatiwarilinuxdev%40gmail.com
patch subject: [RFC PATCH 10/14] power/supply: add support for x86 macs in macsmc-power
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261105/202611050048.nK2wA1Zt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050048.nK2wA1Zt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050048.nK2wA1Zt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/supply/macsmc-power.c: In function 'macsmc_power_acpi_notify':
>> drivers/power/supply/macsmc-power.c:1011:38: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
    1011 |                 acpi_status status = acpi_evaluate_integer(power->adapter->handle, "_PSR", NULL,
         |                                      ^~~~~~~~~~~~~~~~~~~~~
         |                                      acpi_evaluate_object
>> drivers/power/supply/macsmc-power.c:1011:74: error: invalid use of undefined type 'struct acpi_device'
    1011 |                 acpi_status status = acpi_evaluate_integer(power->adapter->handle, "_PSR", NULL,
         |                                                                          ^~
   drivers/power/supply/macsmc-power.c: In function 'macsmc_power_probe':
>> drivers/power/supply/macsmc-power.c:1308:23: error: implicit declaration of function 'acpi_dev_install_notify_handler'; did you mean 'acpi_install_notify_handler'? [-Werror=implicit-function-declaration]
    1308 |                 ret = acpi_dev_install_notify_handler(power->adapter, ACPI_DEVICE_NOTIFY,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       acpi_install_notify_handler
   drivers/power/supply/macsmc-power.c:1313:74: error: invalid use of undefined type 'struct acpi_device'
    1313 |                 acpi_status status = acpi_evaluate_integer(power->adapter->handle, "_PSR", NULL,
         |                                                                          ^~
   drivers/power/supply/macsmc-power.c: In function 'macsmc_power_remove':
>> drivers/power/supply/macsmc-power.c:1330:17: error: implicit declaration of function 'acpi_dev_remove_notify_handler'; did you mean 'acpi_remove_notify_handler'? [-Werror=implicit-function-declaration]
    1330 |                 acpi_dev_remove_notify_handler(power->adapter, ACPI_DEVICE_NOTIFY,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 acpi_remove_notify_handler
   cc1: some warnings being treated as errors


vim +1011 drivers/power/supply/macsmc-power.c

  1005	
  1006	static void macsmc_power_acpi_notify(acpi_handle handle, u32 event, void *context)
  1007	{
  1008		struct macsmc_power *power = context;
  1009	
  1010		if (event == 0x80) {
> 1011			acpi_status status = acpi_evaluate_integer(power->adapter->handle, "_PSR", NULL,
  1012									&power->adapter_status);
  1013			if (ACPI_FAILURE(status))
  1014				return;
  1015	
  1016			power->adapter_status = !!power->adapter_status;
  1017			power_supply_changed(power->batt);
  1018			power_supply_changed(power->ac);
  1019		}
  1020	}
  1021	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
