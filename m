Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA441ABEA7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 10:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722681801; cv=none; b=PwqgmDYuuBtDxNlUT0gwiVyfNlDZ5k+ExTwnZgJvepYg5zi1OXCL9PL7bG0FAvJTjrTY/gVYwNEEWik9uKCzMNk6KVZ1uzlkp/iKvquIfvSEJP98NNWwyeHzPHVqDtpD48lQRmR16TP9g10T5GSra9BRMYir8V/nv5u8ubYSj+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722681801; c=relaxed/simple;
	bh=DNod/n8kwIdw30igi6KdH+AeZWIeDwxgPQc1G5OXUe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ro/+i70d7wqTd+ZXL/GNdjnHgYeXdb1RW/DMclbpvVHHXTAPnqmbaLZvnOoyP0+Gtmb0muzGnlJwRe5lclvjM83kOs7UoJDiCIn8cfQkWMW9260EOKOouO3KDnwcx5AkHCq/t91PLdGkNrFWHHHncKgkIyHxm2ko+EBZu2iYr4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0wL3BoJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0wL3BoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722681798; x=1754217798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DNod/n8kwIdw30igi6KdH+AeZWIeDwxgPQc1G5OXUe8=;
  b=G0wL3BoJ1FjeoMhUiYrCFvUxWNX02yZRfi1QoNxJx3pBoXetri1nmYoW
   tDTFb0TaeowNvyoJc7N/M88Z8KPtuJG2TYwDONXuxXF1kQcEV27bNvt9B
   +JW/8LOZgkAfvIjioiE3IcRG7TVgW47KdnFNDyso+0Y14BNtpOTRbZXyl
   6ozQXJGeZFoWFjZFTQpfK+KENId8bkSx7FBwGWRgnVTwk1V/Siu8rrkCI
   9ycdL11o/AHxh9KWoWf5Q23IzAXzikp5PVLsSWW2XFghQ32IYoRrsdKzx
   bdIYTgcfAhOZO45iiVNBm0CqqRdCkq54SpYYbAGv5RbHDwWcWM+udK0jW
   Q==;
X-CSE-ConnectionGUID: 6SXo5ZRnQm6zAXCHQ5BwNw==
X-CSE-MsgGUID: ufKfXfsdRPOkC2n/VT6wQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="32100616"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="32100616"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 03:43:17 -0700
X-CSE-ConnectionGUID: 1GtXMiAYRvqqnnwQ5ArFQA==
X-CSE-MsgGUID: YmvZyvWdQFGPHLi6ncpiPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="93217824"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Aug 2024 03:43:16 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saCEA-0000Na-2G;
	Sat, 03 Aug 2024 10:43:12 +0000
Date: Sat, 3 Aug 2024 18:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/4] HID: change return type of report_fixup() to
 const
Message-ID: <202408031838.exbNzxqQ-lkp@intel.com>
References: <20240730-hid-const-fixup-v1-3-f667f9a653ba@weissschuh.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730-hid-const-fixup-v1-3-f667f9a653ba@weissschuh.net>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on c91a7dee0555f6f9d3702d86312382e4c4729d0a]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/HID-treat-fixed-up-report-as-const/20240801-203141
base:   c91a7dee0555f6f9d3702d86312382e4c4729d0a
patch link:    https://lore.kernel.org/r/20240730-hid-const-fixup-v1-3-f667f9a653ba%40weissschuh.net
patch subject: [PATCH RFC 3/4] HID: change return type of report_fixup() to const
config: i386-buildonly-randconfig-002-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031838.exbNzxqQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031838.exbNzxqQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031838.exbNzxqQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hid/hid-topre.c:48:35: error: initialization of 'const __u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'const unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} from incompatible pointer type '__u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} [-Werror=incompatible-pointer-types]
      48 |         .report_fixup           = topre_report_fixup,
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/hid/hid-topre.c:48:35: note: (near initialization for 'topre_driver.report_fixup')
   cc1: some warnings being treated as errors
--
>> drivers/hid/hid-gembird.c:107:25: error: initialization of 'const __u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'const unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} from incompatible pointer type '__u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} [-Werror=incompatible-pointer-types]
     107 |         .report_fixup = gembird_report_fixup,
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-gembird.c:107:25: note: (near initialization for 'gembird_driver.report_fixup')
   cc1: some warnings being treated as errors
--
>> drivers/hid/hid-cypress.c:172:25: error: initialization of 'const __u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'const unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} from incompatible pointer type '__u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} [-Werror=incompatible-pointer-types]
     172 |         .report_fixup = cp_report_fixup,
         |                         ^~~~~~~~~~~~~~~
   drivers/hid/hid-cypress.c:172:25: note: (near initialization for 'cp_driver.report_fixup')
   cc1: some warnings being treated as errors
--
>> drivers/hid/hid-xiaomi.c:88:25: error: initialization of 'const __u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'const unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} from incompatible pointer type '__u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} [-Werror=incompatible-pointer-types]
      88 |         .report_fixup = xiaomi_report_fixup,
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-xiaomi.c:88:25: note: (near initialization for 'xiaomi_driver.report_fixup')
   cc1: some warnings being treated as errors
--
>> drivers/hid/hid-monterey.c:60:25: error: initialization of 'const __u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'const unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} from incompatible pointer type '__u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} [-Werror=incompatible-pointer-types]
      60 |         .report_fixup = mr_report_fixup,
         |                         ^~~~~~~~~~~~~~~
   drivers/hid/hid-monterey.c:60:25: note: (near initialization for 'mr_driver.report_fixup')
   cc1: some warnings being treated as errors
--
>> drivers/hid/hid-keytouch.c:47:25: error: initialization of 'const __u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'const unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} from incompatible pointer type '__u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} [-Werror=incompatible-pointer-types]
      47 |         .report_fixup = keytouch_report_fixup,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-keytouch.c:47:25: note: (near initialization for 'keytouch_driver.report_fixup')
   cc1: some warnings being treated as errors
--
>> drivers/hid/hid-dr.c:313:25: error: initialization of 'const __u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'const unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} from incompatible pointer type '__u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} [-Werror=incompatible-pointer-types]
     313 |         .report_fixup = dr_report_fixup,
         |                         ^~~~~~~~~~~~~~~
   drivers/hid/hid-dr.c:313:25: note: (near initialization for 'dr_driver.report_fixup')
   cc1: some warnings being treated as errors
--
>> drivers/hid/hid-zydacron.c:201:25: error: initialization of 'const __u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'const unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} from incompatible pointer type '__u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} [-Werror=incompatible-pointer-types]
     201 |         .report_fixup = zc_report_fixup,
         |                         ^~~~~~~~~~~~~~~
   drivers/hid/hid-zydacron.c:201:25: note: (near initialization for 'zc_driver.report_fixup')
   cc1: some warnings being treated as errors
--
>> drivers/hid/hid-glorious.c:93:25: error: initialization of 'const __u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'const unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} from incompatible pointer type '__u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} [-Werror=incompatible-pointer-types]
      93 |         .report_fixup = glorious_report_fixup
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-glorious.c:93:25: note: (near initialization for 'glorious_driver.report_fixup')
   cc1: some warnings being treated as errors
--
>> drivers/hid/hid-maltron.c:161:25: error: initialization of 'const __u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'const unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} from incompatible pointer type '__u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} [-Werror=incompatible-pointer-types]
     161 |         .report_fixup = maltron_report_fixup
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-maltron.c:161:25: note: (near initialization for 'maltron_driver.report_fixup')
   cc1: some warnings being treated as errors
--
>> drivers/hid/hid-cherry.c:66:25: error: initialization of 'const __u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'const unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} from incompatible pointer type '__u8 * (*)(struct hid_device *, __u8 *, unsigned int *)' {aka 'unsigned char * (*)(struct hid_device *, unsigned char *, unsigned int *)'} [-Werror=incompatible-pointer-types]
      66 |         .report_fixup = ch_report_fixup,
         |                         ^~~~~~~~~~~~~~~
   drivers/hid/hid-cherry.c:66:25: note: (near initialization for 'ch_driver.report_fixup')
   cc1: some warnings being treated as errors
..


vim +48 drivers/hid/hid-topre.c

a109d5c45b3d67 Harry Stern 2022-09-10  44  
a109d5c45b3d67 Harry Stern 2022-09-10  45  static struct hid_driver topre_driver = {
a109d5c45b3d67 Harry Stern 2022-09-10  46  	.name			= "topre",
a109d5c45b3d67 Harry Stern 2022-09-10  47  	.id_table		= topre_id_table,
a109d5c45b3d67 Harry Stern 2022-09-10 @48  	.report_fixup		= topre_report_fixup,
a109d5c45b3d67 Harry Stern 2022-09-10  49  };
a109d5c45b3d67 Harry Stern 2022-09-10  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
