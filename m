Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE9144E66B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 23:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789513525; cv=none; b=aEvwmycpjepev7HWLDDZh7vsGqwfjOvmZzB+128jWkuTEQgRyVyHfg/qbx1+4iyN7f2L7IoEiK1ec16IZDdgr3NlUyQtgw2GN5rpcRjXTkZUkTI8+m4FZo1F65gxWwcdBkdmd4Zx4RjIDSzTchfoUrpbpvnuxoAvngnl00yqwGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789513525; c=relaxed/simple;
	bh=3yokNGYPz0MvZEWQDlIcu70kqxgcVBZD/DVObgHftz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qX6DqOS6bpQllmtbWFtepb1zFREDQzN6eizX18+aUxAkZVzQYA9mwmG7ySSGfEJzuRqbSn6p/GqM8+qwoAtF2Sey2aoFndX/EglgJNVQCXTbx3MG7jBBSHqjAUoQ8cT1vjRcxwmn40WKmc5lP3Wp0XaifXJsmCzmJ77QGbtgTWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ex0AK0LZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ex0AK0LZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789513525; x=1821049525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3yokNGYPz0MvZEWQDlIcu70kqxgcVBZD/DVObgHftz4=;
  b=Ex0AK0LZnBtVKDLMJ8/pKhmKen7CmN6+NRmlXQQir4yrAQuPAFob027l
   nUBfxQ6v4I5QmvKK1QTWz2pfxlp5mrJvTtyodrdZ0rjyauoEC/xYmAehq
   tpGrNSMeoMWTLNE9+/oTN4PzIHg+nV+1zBg7FaTAHhHDa+LFtOhI/qB7y
   ou1icJPGG6Ct5dc8VuH4PcAMZ8P2iXxdqDt6WimzZmJyZ9qcCwVKBGAt3
   hIJt4GE5cvnD9p4QzQ1pDNH3mrqBvH/C7uwvlwnIIcY12UyVmQ5ExrbA3
   JD63FrUtR1yrjhnIT044JbW6Q4sONHNdFfOXaDFPzsTPh0HzjU3TjzDxx
   g==;
X-CSE-ConnectionGUID: iYUC/aRxTkiKZjD2M8+nDQ==
X-CSE-MsgGUID: dh5cgcPITzWKfOvdxYSmUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100487766"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100487766"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:05:24 -0700
X-CSE-ConnectionGUID: eBOM+r3UQmWQh+fOKmCuiw==
X-CSE-MsgGUID: oWS3IJgDRW+H3U6mfVSaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273692835"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2026 16:05:21 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6cDF-000000000kJ-1c75;
	Tue, 15 Sep 2026 23:05:17 +0000
Date: Wed, 16 Sep 2026 01:04:44 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"=D0=9A=D0=BE=D0=BD=D0=B5=D0=BD=D0=BA=D0=BE?=
 =?utf-8?B?INCQ0L3QtNGA0LXQuQ==?=
 =?utf-8?Q?_=D0=92=D0=B8=D0=BA=D1=82=D0=BE=D1=80=D0=BE=D0=B2=D0=B8=D1=87"?=
 <admin@aquinas.su>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 1/11] kismet:
 WARNING: unmet direct dependencies detected for LEDS_CLASS when selected by
 HP_WMI
Message-ID: <202609160158.O4NOekDR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   6047fcfc8971e0c01bdc840f661498b044dd8916
commit: 6249c067a3e41b698380236fae5cdfdd238145a8 [1/11] platform/x86: hp-wmi: Add multicolor LED support for HP keyboard backlight
config: x86_64-kismet-CONFIG_LEDS_CLASS-CONFIG_HP_WMI-0-0 (https://download.01.org/0day-ci/archive/20260916/202609160158.O4NOekDR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260916/202609160158.O4NOekDR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160158.O4NOekDR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_CLASS when selected by HP_WMI
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - HP_WMI [=y] && X86_PLATFORM_DEVICES [=y] && X86_PLATFORM_DRIVERS_HP [=y] && ACPI_EC [=y] && ACPI_WMI [=y] && INPUT [=y] && (RFKILL [=n] || RFKILL [=n]=n [=n])
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS_MULTICOLOR
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - HP_WMI [=y] && X86_PLATFORM_DEVICES [=y] && X86_PLATFORM_DRIVERS_HP [=y] && ACPI_EC [=y] && ACPI_WMI [=y] && INPUT [=y] && (RFKILL [=n] || RFKILL [=n]=n [=n])
   
   WARNING: unmet direct dependencies detected for LEDS_GPIO
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y] && (GPIOLIB [=y] || COMPILE_TEST [=n])
     Selected by [y]:
     - PCENGINES_APU2 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && GPIOLIB [=y] && LEDS_CLASS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
