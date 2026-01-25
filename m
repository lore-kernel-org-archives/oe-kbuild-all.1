Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F9D238C15
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769363853; cv=none; b=G0J/q61vwCPzmf5tntmm9SR3+nI6lTTKVXmDtamIbyiCXrLvJiFHzDlVhAal1m06mydXLnDU78zl7VCfUKoEn/p12KsY5YPvQeJfH8tW/nChpjphJayKOVQ77skUz0EEvQBqjgWOFfLsG4br2wih1C9H6mR/pFoStIykdwwmMr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769363853; c=relaxed/simple;
	bh=nRxADo4Nyu8l/feUIGt4HwyEpJCIm8iUC7eNQVA3HUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp+E/oL52OZ+ZfMl28Bsz/T9jW+KMQd3LDQUfHhWPf4qWk0vVteYKTRqgHfM83HOtYroDM5HbNKOL2duLfP+FVEohGZjlSTUe1LHnio546/T+mojhEbJ26o2V5UCS9L6M/SXZmG0g6P1xKw3gb13iWvrlR0/w96vsMIe3lSVWGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3a3omRy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3a3omRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769363851; x=1800899851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nRxADo4Nyu8l/feUIGt4HwyEpJCIm8iUC7eNQVA3HUk=;
  b=A3a3omRy7MySwi56IgyPrZlSDkx3c9ZKzBkv4X5mc+g66VcfEsxfVsaX
   LKD3C49Duq673MElM214iWPO6eCrjyqfPfskhr5S7/f7AsQ6/wU4dqb2n
   RIZio4IaHyl8qaKZP8AEXLg87M903nzKJAgDcabsfe5Eb1OegBpAdvStb
   5Unigs2jAIi+ZvIJcNTRIdQh0YjUnFXp0R/NPAEbOClprr6qkVTnvevgz
   K0dtdWqoarjpA76V42V70NsnXkMHyhOBojnkduO+o5fFFr9Gkuskpc81W
   pQ1jx9I1O+xXvjIPzxSqa9Zz5azZs6mpO1jFhkGbMnR2l7fIIDoBUclfZ
   w==;
X-CSE-ConnectionGUID: 8n0zfcVBRjSuoU84s/bgQQ==
X-CSE-MsgGUID: D5K2RqDJSGiZU8HGYmWlKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70610345"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70610345"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 09:57:31 -0800
X-CSE-ConnectionGUID: 6unDacyaSai3hn1O9+Bodg==
X-CSE-MsgGUID: HC8zLoNQQfavUl7sPAyPMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207393020"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2026 09:57:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk4MZ-00000000WJi-2xuK;
	Sun, 25 Jan 2026 17:57:27 +0000
Date: Mon, 26 Jan 2026 01:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] leds: add disk trigger for each ata port
Message-ID: <202601260105.4AcOxoMJ-lkp@intel.com>
References: <20260123-ledtrig_disk_-v1-4-07004756467b@posteo.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-ledtrig_disk_-v1-4-07004756467b@posteo.de>

Hi Markus,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Probst/leds-dt-bindings-add-disk-trigger-led-pattern/20260124-030650
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260123-ledtrig_disk_-v1-4-07004756467b%40posteo.de
patch subject: [PATCH RFC 4/4] leds: add disk trigger for each ata port
config: x86_64-buildonly-randconfig-002-20260125 (https://download.01.org/0day-ci/archive/20260126/202601260105.4AcOxoMJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260105.4AcOxoMJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260105.4AcOxoMJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> Warning: drivers/ata/libata-core.c:5543 function parameter 'port_no' not described in 'ata_port_alloc'
>> Warning: drivers/ata/libata-core.c:5543 function parameter 'port_no' not described in 'ata_port_alloc'
--
   drivers/leds/trigger/ledtrig-disk.c: In function 'pattern_init':
   drivers/leds/trigger/ledtrig-disk.c:119:9: error: cleanup argument not a function
     119 |         u32 *pattern __free(kfree) = led_get_default_pattern(led_cdev, &size);
         |         ^~~
   drivers/leds/trigger/ledtrig-disk.c: In function 'ledtrig_disk_activate':
   drivers/leds/trigger/ledtrig-disk.c:139:21: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     139 |         disk_data = kzalloc(sizeof(*disk_data), GFP_KERNEL);
         |                     ^~~~~~~
   drivers/leds/trigger/ledtrig-disk.c:139:19: error: assignment to 'struct ledtrig_disk_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     139 |         disk_data = kzalloc(sizeof(*disk_data), GFP_KERNEL);
         |                   ^
   drivers/leds/trigger/ledtrig-disk.c: In function 'ledtrig_disk_blink_oneshot':
   drivers/leds/trigger/ledtrig-disk.c:186:9: error: implicit declaration of function 'list_for_each_entry_rcu'; did you mean 'list_for_each_entry_from'? [-Wimplicit-function-declaration]
     186 |         list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         list_for_each_entry_from
   drivers/leds/trigger/ledtrig-disk.c:186:61: error: 'trig_list' undeclared (first use in this function); did you mean 'lru_list'?
     186 |         list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
         |                                                             ^~~~~~~~~
         |                                                             lru_list
   drivers/leds/trigger/ledtrig-disk.c:186:61: note: each undeclared identifier is reported only once for each function it appears in
   drivers/leds/trigger/ledtrig-disk.c:186:71: error: expected ';' before '{' token
     186 |         list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
         |                                                                       ^~
         |                                                                       ;
   drivers/leds/trigger/ledtrig-disk.c:183:35: warning: unused variable 'disk_data' [-Wunused-variable]
     183 |         struct ledtrig_disk_data *disk_data;
         |                                   ^~~~~~~~~
   drivers/leds/trigger/ledtrig-disk.c: In function 'ledtrig_disk_trigger_register':
>> drivers/leds/trigger/ledtrig-disk.c:214:48: error: initialization of 'struct ledtrig_disk_trigger *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     214 |         struct ledtrig_disk_trigger *trigger = kzalloc(sizeof(*trigger), GFP_KERNEL);
         |                                                ^~~~~~~
>> drivers/leds/trigger/ledtrig-disk.c:220:27: error: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     220 |         trigger->all.name = kzalloc(TRIG_NAME_MAX, GFP_KERNEL);
         |                           ^
   drivers/leds/trigger/ledtrig-disk.c:239:28: error: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     239 |         trigger->read.name = kzalloc(TRIG_NAME_MAX, GFP_KERNEL);
         |                            ^
   drivers/leds/trigger/ledtrig-disk.c:258:29: error: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     258 |         trigger->write.name = kzalloc(TRIG_NAME_MAX, GFP_KERNEL);
         |                             ^
>> drivers/leds/trigger/ledtrig-disk.c:284:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     284 |         kfree(trigger->all.name);
         |         ^~~~~


vim +214 drivers/leds/trigger/ledtrig-disk.c

   211	
   212	struct ledtrig_disk_trigger *ledtrig_disk_trigger_register(const char *name)
   213	{
 > 214		struct ledtrig_disk_trigger *trigger = kzalloc(sizeof(*trigger), GFP_KERNEL);
   215		int ret, n;
   216	
   217		if (!trigger)
   218			return ERR_PTR(-ENOMEM);
   219	
 > 220		trigger->all.name = kzalloc(TRIG_NAME_MAX, GFP_KERNEL);
   221		if (!trigger->all.name) {
   222			ret = -ENOMEM;
   223			goto err1;
   224		}
   225	
   226		n = snprintf((char *)trigger->all.name, TRIG_NAME_MAX, "%s-disk-activity", name);
   227		if (n >= TRIG_NAME_MAX) {
   228			ret = -E2BIG;
   229			goto err1;
   230		}
   231	
   232		trigger->all.activate = ledtrig_disk_activate;
   233		trigger->all.groups = ledtrig_disk_groups;
   234	
   235		ret = led_trigger_register(&trigger->all);
   236		if (ret)
   237			goto err1;
   238	
   239		trigger->read.name = kzalloc(TRIG_NAME_MAX, GFP_KERNEL);
   240		if (!trigger->read.name) {
   241			ret = -ENOMEM;
   242			goto err2;
   243		}
   244	
   245		n = snprintf((char *)trigger->read.name, TRIG_NAME_MAX, "%s-disk-read", name);
   246		if (n >= TRIG_NAME_MAX) {
   247			ret = -E2BIG;
   248			goto err2;
   249		}
   250	
   251		trigger->read.activate = ledtrig_disk_activate;
   252		trigger->read.groups = ledtrig_disk_groups;
   253	
   254		ret = led_trigger_register(&trigger->read);
   255		if (ret)
   256			goto err2;
   257	
   258		trigger->write.name = kzalloc(TRIG_NAME_MAX, GFP_KERNEL);
   259		if (!trigger->write.name) {
   260			ret = -ENOMEM;
   261			goto err3;
   262		}
   263	
   264		n = snprintf((char *)trigger->write.name, TRIG_NAME_MAX, "%s-disk-write", name);
   265		if (n >= TRIG_NAME_MAX) {
   266			ret = -E2BIG;
   267			goto err3;
   268		}
   269	
   270		trigger->write.activate = ledtrig_disk_activate;
   271		trigger->write.groups = ledtrig_disk_groups;
   272	
   273		ret = led_trigger_register(&trigger->write);
   274		if (ret)
   275			goto err3;
   276	
   277		return trigger;
   278	
   279	err3:
   280		led_trigger_unregister(&trigger->read);
   281	err2:
   282		led_trigger_unregister(&trigger->all);
   283	err1:
 > 284		kfree(trigger->all.name);
   285		kfree(trigger->read.name);
   286		kfree(trigger->write.name);
   287		kfree(trigger);
   288	
   289		return ERR_PTR(ret);
   290	}
   291	EXPORT_SYMBOL(ledtrig_disk_trigger_register);
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
