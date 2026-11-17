Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890573;
	b=nEIUefPzQjXQ7w1asQ9uKiGEi0c3aYcSd3jKweFSreOvFWiKjIJas5TL87Uq4oQon1jw
	 /slAWel/hmMXHivj9gDljpGhjUTrnNOcxAS+ihyOL+5imxu4y8yLBuFir6o3boxHLVEpD
	 uLdRjFtlToMdkeBd3eF8HO5Bd8j20OUCSTRY0Ho3WWh7oU/VKW0Dp0/DQd2buclaojwGS
	 DRGc3Y4/cxf3z6PlI6N38nHtvzsTkAH6DYm7OPsex82O+27woF045qaJhU1E4q9m6NvsY
	 yOa5oCw+75Gczk1RSu2rMOoYnedlDC/wMN04tfo3uAAJHMMphsWY4UkH4T7DuyT5VBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890573;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:Cc:
	 Subject:Message-ID:User-Agent;
	bh=B4FX48FqUt5RDWjNob8JMKRoyrIANJILJrIcsbQRQZE=;
	b=HE5rjQ+VzistEwS9dtkfavU8YIn9uLwc+gRw3Q9DXdM2ooFrmQlNoW/B7jrsN7gMZ12U
	 +gV51kKzeaqXFvakrCNdJ02VbrKRdDABHmqn7V88Q8+x4Gnu/ZtgeTJKaQziD4ZB/fW0/
	 w9V+USHhBBg7WcVHVFw7GepCXKspxi84eWR4962dx6xlGZLJoQlmbSHi7MzDbGtglxmAJ
	 kqf/9DFiY+4zkGSf9Z2OZApCniE0lc9NcBKW+tSWZqG9VkTEIlBVmppzjUYIODcPuht4P
	 HyYslRyRMX/lUHnK/FBccm8fdjuglwFb4LYJcqNll5x7kuJDGa68SZqtN3+wWBLpEjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PWNLM0LV;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F87B606A323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 04:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F87B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PWNLM0LV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794890572; x=1826426572;
  h=date:from:cc:subject:message-id;
  bh=lXiZNOJRnNvh+C63+jQFx2wHqeSsizTCNfl7tvDy+rc=;
  b=PWNLM0LVxg9cXaHIMvxKZR4IJfLdJJw2dMF0banQ10ABcs7ko662U9im
   Yu46Hfk41Vd6JEWwX2T/ldYCnNHBmW/Aqtgm34sZKED3K2Zkv7OOBEV9C
   TuqTRzYrBGsQIpGBaloXXEOBBXk4MyiA3k0ORPuwI5F+xjChrflUlFuFK
   S/ZL7R7NFCSUjLvRZBpUSXpXvslRNQnLjBv/9OIXPxBl74Uf1Z9EP/+5X
   1vz9T+iOoFRlQj3sdQCABFMfSnoZCAUeDDtI2Da9omTl0knT2WKSj2joP
   sLWNjxGuz84uHON0Jb5NHGkPdMfxlo/4UxcqKZW0+S6XD/4Prvm90l/8N
   w==;
X-CSE-ConnectionGUID: GJc/5J7GSbSvDla0f1QVhw==
X-CSE-MsgGUID: P8stT8e2Tqmer8WyD1YfbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3679218"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3679218"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 20:42:52 -0800
X-CSE-ConnectionGUID: +IeBJb1ZRI2xspSGU7FisA==
X-CSE-MsgGUID: 9OWLRQ+OSfyaeuQsV7OW0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9737238"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2026 20:42:50 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTB1r-00000001A2K-2wm9;
	Tue, 17 Nov 2026 04:42:47 +0000
Date: Tue, 17 Nov 2026 12:41:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:asoc-7.5 6/6] sound/soc/amd/acp-config.c:158:3:
 error: field name not in record or union initializer
Message-ID: <202611171205.6hdyTtx3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.5
head:   d986a3c94d54cbbe6373ec963321b85662585c4e
commit: d986a3c94d54cbbe6373ec963321b85662585c4e [6/6] ASoC: Merge up fixes
config: parisc-randconfig-1000-20261117 (https://download.01.org/0day-ci/archive/20261117/202611171205.6hdyTtx3-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611171205.6hdyTtx3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611171205.6hdyTtx3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/amd/acp-config.c:156:2: warning: braces around scalar initializer
     156 |  {
         |  ^
   sound/soc/amd/acp-config.c:156:2: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
>> sound/soc/amd/acp-config.c:158:3: error: field name not in record or union initializer
     158 |   .matches = {
         |   ^
   sound/soc/amd/acp-config.c:158:3: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
   sound/soc/amd/acp-config.c:158:3: warning: braces around scalar initializer
   sound/soc/amd/acp-config.c:158:3: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
   sound/soc/amd/acp-config.c:159:4: warning: braces around scalar initializer
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |    ^~~~~~~~~
   sound/soc/amd/acp-config.c:159:4: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
   In file included from include/linux/dmi.h:7,
                    from sound/soc/amd/acp-config.c:15:
>> include/linux/device-id/dmi.h:5:27: error: field name not in record or union initializer
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                           ^
   sound/soc/amd/acp-config.c:159:4: note: in expansion of macro 'DMI_MATCH'
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |    ^~~~~~~~~
   include/linux/device-id/dmi.h:5:27: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                           ^
   sound/soc/amd/acp-config.c:159:4: note: in expansion of macro 'DMI_MATCH'
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |    ^~~~~~~~~
>> sound/soc/amd/acp-config.c:159:14: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |              ^~~~~~~~~~~~~~
   include/linux/device-id/dmi.h:5:35: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                   ^
   sound/soc/amd/acp-config.c:159:14: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |              ^~~~~~~~~~~~~~
   include/linux/device-id/dmi.h:5:35: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                   ^
   include/linux/device-id/dmi.h:5:38: error: field name not in record or union initializer
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                      ^
   sound/soc/amd/acp-config.c:159:4: note: in expansion of macro 'DMI_MATCH'
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |    ^~~~~~~~~
   include/linux/device-id/dmi.h:5:38: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                      ^
   sound/soc/amd/acp-config.c:159:4: note: in expansion of macro 'DMI_MATCH'
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |    ^~~~~~~~~
>> sound/soc/amd/acp-config.c:159:30: warning: excess elements in scalar initializer
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |                              ^~~~~~~~~~~~~~~~
   include/linux/device-id/dmi.h:5:48: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                                ^
   sound/soc/amd/acp-config.c:159:30: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |                              ^~~~~~~~~~~~~~~~
   include/linux/device-id/dmi.h:5:48: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                                ^
   sound/soc/amd/acp-config.c:160:4: warning: braces around scalar initializer
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   sound/soc/amd/acp-config.c:160:4: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
   In file included from include/linux/dmi.h:7,
                    from sound/soc/amd/acp-config.c:15:
>> include/linux/device-id/dmi.h:5:27: error: field name not in record or union initializer
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                           ^
   sound/soc/amd/acp-config.c:160:4: note: in expansion of macro 'DMI_MATCH'
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   include/linux/device-id/dmi.h:5:27: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                           ^
   sound/soc/amd/acp-config.c:160:4: note: in expansion of macro 'DMI_MATCH'
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   sound/soc/amd/acp-config.c:160:14: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |              ^~~~~~~~~~~~~~~~
   include/linux/device-id/dmi.h:5:35: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                   ^
   sound/soc/amd/acp-config.c:160:14: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |              ^~~~~~~~~~~~~~~~
   include/linux/device-id/dmi.h:5:35: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                   ^
   include/linux/device-id/dmi.h:5:38: error: field name not in record or union initializer
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                      ^
   sound/soc/amd/acp-config.c:160:4: note: in expansion of macro 'DMI_MATCH'
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   include/linux/device-id/dmi.h:5:38: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                      ^
   sound/soc/amd/acp-config.c:160:4: note: in expansion of macro 'DMI_MATCH'
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   sound/soc/amd/acp-config.c:160:32: warning: excess elements in scalar initializer
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |                                ^~~~~~~~
   include/linux/device-id/dmi.h:5:48: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                                ^
   sound/soc/amd/acp-config.c:160:32: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |                                ^~~~~~~~
   include/linux/device-id/dmi.h:5:48: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                                ^
>> include/linux/device-id/dmi.h:5:25: warning: excess elements in scalar initializer
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                         ^
   sound/soc/amd/acp-config.c:160:4: note: in expansion of macro 'DMI_MATCH'
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   include/linux/device-id/dmi.h:5:25: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                         ^
   sound/soc/amd/acp-config.c:160:4: note: in expansion of macro 'DMI_MATCH'
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
>> sound/soc/amd/acp-config.c:163:2: error: extra brace group at end of initializer
     163 |  {}
         |  ^
   sound/soc/amd/acp-config.c:163:2: note: (near initialization for 'acp70_acpi_flag_override_table[18]')
>> sound/soc/amd/acp-config.c:163:2: warning: excess elements in struct initializer
   sound/soc/amd/acp-config.c:163:2: note: (near initialization for 'acp70_acpi_flag_override_table[18]')
>> sound/soc/amd/acp-config.c:164:2: error: expected '}' before ';' token
     164 | };
         |  ^
   sound/soc/amd/acp-config.c:26:70: note: to match this '{'
      26 | static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
         |                                                                      ^
>> sound/soc/amd/acp-config.c:26:35: warning: 'acp70_acpi_flag_override_table' defined but not used [-Wunused-const-variable=]
      26 | static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/amd/acp-config.c:24:12: warning: 'acp_quirk_data' defined but not used [-Wunused-variable]
      24 | static int acp_quirk_data;
         |            ^~~~~~~~~~~~~~
--
   acp-config.c:156:2: warning: braces around scalar initializer
     156 |  {
         |  ^
   acp-config.c:156:2: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
   acp-config.c:158:3: error: field name not in record or union initializer
     158 |   .matches = {
         |   ^
   acp-config.c:158:3: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
   acp-config.c:158:3: warning: braces around scalar initializer
   acp-config.c:158:3: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
   acp-config.c:159:4: warning: braces around scalar initializer
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |    ^~~~~~~~~
   acp-config.c:159:4: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
   In file included from include/linux/dmi.h:7,
                    from acp-config.c:15:
>> include/linux/device-id/dmi.h:5:27: error: field name not in record or union initializer
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                           ^
   acp-config.c:159:4: note: in expansion of macro 'DMI_MATCH'
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |    ^~~~~~~~~
   include/linux/device-id/dmi.h:5:27: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                           ^
   acp-config.c:159:4: note: in expansion of macro 'DMI_MATCH'
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |    ^~~~~~~~~
   acp-config.c:159:14: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |              ^~~~~~~~~~~~~~
   include/linux/device-id/dmi.h:5:35: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                   ^
   acp-config.c:159:14: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |              ^~~~~~~~~~~~~~
   include/linux/device-id/dmi.h:5:35: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                   ^
   include/linux/device-id/dmi.h:5:38: error: field name not in record or union initializer
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                      ^
   acp-config.c:159:4: note: in expansion of macro 'DMI_MATCH'
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |    ^~~~~~~~~
   include/linux/device-id/dmi.h:5:38: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                      ^
   acp-config.c:159:4: note: in expansion of macro 'DMI_MATCH'
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |    ^~~~~~~~~
   acp-config.c:159:30: warning: excess elements in scalar initializer
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |                              ^~~~~~~~~~~~~~~~
   include/linux/device-id/dmi.h:5:48: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                                ^
   acp-config.c:159:30: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
     159 |    DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
         |                              ^~~~~~~~~~~~~~~~
   include/linux/device-id/dmi.h:5:48: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                                ^
   acp-config.c:160:4: warning: braces around scalar initializer
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   acp-config.c:160:4: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
   In file included from include/linux/dmi.h:7,
                    from acp-config.c:15:
>> include/linux/device-id/dmi.h:5:27: error: field name not in record or union initializer
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                           ^
   acp-config.c:160:4: note: in expansion of macro 'DMI_MATCH'
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   include/linux/device-id/dmi.h:5:27: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                           ^
   acp-config.c:160:4: note: in expansion of macro 'DMI_MATCH'
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   acp-config.c:160:14: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |              ^~~~~~~~~~~~~~~~
   include/linux/device-id/dmi.h:5:35: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                   ^
   acp-config.c:160:14: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |              ^~~~~~~~~~~~~~~~
   include/linux/device-id/dmi.h:5:35: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                   ^
   include/linux/device-id/dmi.h:5:38: error: field name not in record or union initializer
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                      ^
   acp-config.c:160:4: note: in expansion of macro 'DMI_MATCH'
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   include/linux/device-id/dmi.h:5:38: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                      ^
   acp-config.c:160:4: note: in expansion of macro 'DMI_MATCH'
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   acp-config.c:160:32: warning: excess elements in scalar initializer
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |                                ^~~~~~~~
   include/linux/device-id/dmi.h:5:48: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                                ^
   acp-config.c:160:32: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |                                ^~~~~~~~
   include/linux/device-id/dmi.h:5:48: note: in definition of macro 'DMI_MATCH'
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                                                ^
>> include/linux/device-id/dmi.h:5:25: warning: excess elements in scalar initializer
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                         ^
   acp-config.c:160:4: note: in expansion of macro 'DMI_MATCH'
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   include/linux/device-id/dmi.h:5:25: note: (near initialization for 'acp70_acpi_flag_override_table[18].driver_data')
       5 | #define DMI_MATCH(a, b) { .slot = a, .substr = b }
         |                         ^
   acp-config.c:160:4: note: in expansion of macro 'DMI_MATCH'
     160 |    DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
         |    ^~~~~~~~~
   acp-config.c:163:2: error: extra brace group at end of initializer
     163 |  {}
         |  ^
   acp-config.c:163:2: note: (near initialization for 'acp70_acpi_flag_override_table[18]')
   acp-config.c:163:2: warning: excess elements in struct initializer
   acp-config.c:163:2: note: (near initialization for 'acp70_acpi_flag_override_table[18]')
   acp-config.c:164:2: error: expected '}' before ';' token
     164 | };
         |  ^
   acp-config.c:26:70: note: to match this '{'
      26 | static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
         |                                                                      ^
   acp-config.c:26:35: warning: 'acp70_acpi_flag_override_table' defined but not used [-Wunused-const-variable=]
      26 | static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   acp-config.c:24:12: warning: 'acp_quirk_data' defined but not used [-Wunused-variable]
      24 | static int acp_quirk_data;
         |            ^~~~~~~~~~~~~~


vim +158 sound/soc/amd/acp-config.c

8527ecc6cf25417 Vijendar Mukunda  2023-12-07   23  
f1bdd8d385a8035 Ajit Kumar Pandey 2021-11-17  @24  static int acp_quirk_data;
f1bdd8d385a8035 Ajit Kumar Pandey 2021-11-17   25  
d0426510a9e1fab Hasun Park        2026-03-09  @26  static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
d0426510a9e1fab Hasun Park        2026-03-09   27  	{
d0426510a9e1fab Hasun Park        2026-03-09   28  		.matches = {
d0426510a9e1fab Hasun Park        2026-03-09   29  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
d0426510a9e1fab Hasun Park        2026-03-09   30  			DMI_MATCH(DMI_PRODUCT_NAME, "HN7306EA"),
d0426510a9e1fab Hasun Park        2026-03-09   31  		},
d0426510a9e1fab Hasun Park        2026-03-09   32  	},
7587fc10cba6c4a Simon Trimmer     2026-10-07   33  	{
7587fc10cba6c4a Simon Trimmer     2026-10-07   34  		/* ASUS EXPERTBOOK AM7406CKA (Kraken Point, ACP 7.0) */
7587fc10cba6c4a Simon Trimmer     2026-10-07   35  		.matches = {
7587fc10cba6c4a Simon Trimmer     2026-10-07   36  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
7587fc10cba6c4a Simon Trimmer     2026-10-07   37  			DMI_MATCH(DMI_PRODUCT_NAME, "ASUS EXPERTBOOK AM7406CKA"),
7587fc10cba6c4a Simon Trimmer     2026-10-07   38  		},
7587fc10cba6c4a Simon Trimmer     2026-10-07   39  	},
6e4bfd9da8851f5 Jasper Smet       2026-05-13   40  	{
6e4bfd9da8851f5 Jasper Smet       2026-05-13   41  		/* ASUS Zenbook S16 UM5606GA (Strix Point, ACP 7.0) */
6e4bfd9da8851f5 Jasper Smet       2026-05-13   42  		.matches = {
6e4bfd9da8851f5 Jasper Smet       2026-05-13   43  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
6e4bfd9da8851f5 Jasper Smet       2026-05-13   44  			DMI_MATCH(DMI_PRODUCT_NAME, "Zenbook S16 UM5606GA"),
6e4bfd9da8851f5 Jasper Smet       2026-05-13   45  		},
6e4bfd9da8851f5 Jasper Smet       2026-05-13   46  	},
fc12cf16df9af86 Jackie Dong       2026-05-27   47  	{
fc12cf16df9af86 Jackie Dong       2026-05-27   48  		/* Lenovo Yoga Pro 7 15ASH11 (Strix Halo, ACP 7.0) */
fc12cf16df9af86 Jackie Dong       2026-05-27   49  		.matches = {
fc12cf16df9af86 Jackie Dong       2026-05-27   50  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fc12cf16df9af86 Jackie Dong       2026-05-27   51  			DMI_MATCH(DMI_PRODUCT_NAME, "83W5"),
fc12cf16df9af86 Jackie Dong       2026-05-27   52  		},
fc12cf16df9af86 Jackie Dong       2026-05-27   53  	},
9ad4c2331d2330a Jackie Dong       2026-07-27   54  	{
9ad4c2331d2330a Jackie Dong       2026-07-27   55  		/* Lenovo Legion 7 15ASH11 (Strix Halo, ACP 7.0) */
9ad4c2331d2330a Jackie Dong       2026-07-27   56  		.matches = {
9ad4c2331d2330a Jackie Dong       2026-07-27   57  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
9ad4c2331d2330a Jackie Dong       2026-07-27   58  			DMI_MATCH(DMI_PRODUCT_NAME, "83V9"),
9ad4c2331d2330a Jackie Dong       2026-07-27   59  		},
9ad4c2331d2330a Jackie Dong       2026-07-27   60  	},
5d35f9be9b54a1b Zhang Heng        2026-09-22   61  	{
5d35f9be9b54a1b Zhang Heng        2026-09-22   62  		/* Lenovo Yoga Pro 7 14ASP9 (Strix Point, ACP 7.0) */
5d35f9be9b54a1b Zhang Heng        2026-09-22   63  		.matches = {
5d35f9be9b54a1b Zhang Heng        2026-09-22   64  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
5d35f9be9b54a1b Zhang Heng        2026-09-22   65  			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
5d35f9be9b54a1b Zhang Heng        2026-09-22   66  		},
5d35f9be9b54a1b Zhang Heng        2026-09-22   67  	},
8f356232d0d563b Zhang Heng        2026-11-09   68  	{
8f356232d0d563b Zhang Heng        2026-11-09   69  		/* Lenovo Legion 5 15AGP11 (ACP 7.0) */
8f356232d0d563b Zhang Heng        2026-11-09   70  		.matches = {
8f356232d0d563b Zhang Heng        2026-11-09   71  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
8f356232d0d563b Zhang Heng        2026-11-09   72  			DMI_MATCH(DMI_PRODUCT_NAME, "83Q6"),
8f356232d0d563b Zhang Heng        2026-11-09   73  		},
8f356232d0d563b Zhang Heng        2026-11-09   74  	},
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   75  	{
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   76  		.matches = {
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   77  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
15596a87fcc6fa0 Shengyu Qu        2026-08-27   78  			DMI_MATCH(DMI_PRODUCT_NAME, "FA401EA"),
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   79  		},
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   80  	},
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   81  	{
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   82  		.matches = {
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   83  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   84  			DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook 18 M1807GA"),
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   85  		},
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   86  	},
de0be324fcb97a4 Zhang Heng        2026-09-28   87  	{
de0be324fcb97a4 Zhang Heng        2026-09-28   88  		/* ASUS Zenbook S14 UM5406GA (Strix Point, ACP 7.0) */
de0be324fcb97a4 Zhang Heng        2026-09-28   89  		.matches = {
de0be324fcb97a4 Zhang Heng        2026-09-28   90  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
de0be324fcb97a4 Zhang Heng        2026-09-28   91  			DMI_MATCH(DMI_PRODUCT_NAME, "Zenbook S14 UM5406GA"),
de0be324fcb97a4 Zhang Heng        2026-09-28   92  		},
de0be324fcb97a4 Zhang Heng        2026-09-28   93  	},
8393e0bf593be4f Ville Saarinen    2026-08-09   94  	{
8393e0bf593be4f Ville Saarinen    2026-08-09   95  		/* HP OmniBook X Flip 14-kc0xxx (Strix Point, ACP 7.2) */
8393e0bf593be4f Ville Saarinen    2026-08-09   96  		.matches = {
8393e0bf593be4f Ville Saarinen    2026-08-09   97  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
8393e0bf593be4f Ville Saarinen    2026-08-09   98  			DMI_MATCH(DMI_BOARD_NAME, "8EA1"),
8393e0bf593be4f Ville Saarinen    2026-08-09   99  		},
8393e0bf593be4f Ville Saarinen    2026-08-09  100  	},
4d6642d64cd00f2 Sehat Mahde       2026-08-25  101  	{
4d6642d64cd00f2 Sehat Mahde       2026-08-25  102  		/* HP OmniBook X Flip 16-cc0xxx */
4d6642d64cd00f2 Sehat Mahde       2026-08-25  103  		.matches = {
4d6642d64cd00f2 Sehat Mahde       2026-08-25  104  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
4d6642d64cd00f2 Sehat Mahde       2026-08-25  105  			DMI_MATCH(DMI_BOARD_NAME, "8EA2"),
4d6642d64cd00f2 Sehat Mahde       2026-08-25  106  		},
4d6642d64cd00f2 Sehat Mahde       2026-08-25  107  	},
a08578200344eb4 Baojun Xu         2026-11-03  108  	{
a08578200344eb4 Baojun Xu         2026-11-03  109  		/* HP Cashmere-A */
a08578200344eb4 Baojun Xu         2026-11-03  110  		.matches = {
a08578200344eb4 Baojun Xu         2026-11-03  111  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
a08578200344eb4 Baojun Xu         2026-11-03  112  			DMI_MATCH(DMI_BOARD_NAME, "8EF5"),
a08578200344eb4 Baojun Xu         2026-11-03  113  		},
a08578200344eb4 Baojun Xu         2026-11-03  114  	},
a08578200344eb4 Baojun Xu         2026-11-03  115  	{
a08578200344eb4 Baojun Xu         2026-11-03  116  		/* HP Sundae */
a08578200344eb4 Baojun Xu         2026-11-03  117  		.matches = {
a08578200344eb4 Baojun Xu         2026-11-03  118  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
a08578200344eb4 Baojun Xu         2026-11-03  119  			DMI_MATCH(DMI_BOARD_NAME, "8F6D"),
a08578200344eb4 Baojun Xu         2026-11-03  120  		},
a08578200344eb4 Baojun Xu         2026-11-03  121  	},
a08578200344eb4 Baojun Xu         2026-11-03  122  	{
a08578200344eb4 Baojun Xu         2026-11-03  123  		/* HP SundaeWhip UMA */
a08578200344eb4 Baojun Xu         2026-11-03  124  		.matches = {
a08578200344eb4 Baojun Xu         2026-11-03  125  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
a08578200344eb4 Baojun Xu         2026-11-03  126  			DMI_MATCH(DMI_BOARD_NAME, "8FA4"),
a08578200344eb4 Baojun Xu         2026-11-03  127  		},
a08578200344eb4 Baojun Xu         2026-11-03  128  	},
a08578200344eb4 Baojun Xu         2026-11-03  129  	{
a08578200344eb4 Baojun Xu         2026-11-03  130  		/* HP SundaeWhip DSC */
a08578200344eb4 Baojun Xu         2026-11-03  131  		.matches = {
a08578200344eb4 Baojun Xu         2026-11-03  132  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
a08578200344eb4 Baojun Xu         2026-11-03  133  			DMI_MATCH(DMI_BOARD_NAME, "8FA5"),
a08578200344eb4 Baojun Xu         2026-11-03  134  		},
a08578200344eb4 Baojun Xu         2026-11-03  135  	},
a08578200344eb4 Baojun Xu         2026-11-03  136  	{
a08578200344eb4 Baojun Xu         2026-11-03  137  		/* HP Kata-A */
a08578200344eb4 Baojun Xu         2026-11-03  138  		.matches = {
a08578200344eb4 Baojun Xu         2026-11-03  139  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
a08578200344eb4 Baojun Xu         2026-11-03  140  			DMI_MATCH(DMI_BOARD_NAME, "9056"),
a08578200344eb4 Baojun Xu         2026-11-03  141  		},
a08578200344eb4 Baojun Xu         2026-11-03  142  	},
38cb2ef26b64112 Art O Cathain     2026-10-16  143  	{
38cb2ef26b64112 Art O Cathain     2026-10-16  144  		/* Dell 14S DS14265 */
38cb2ef26b64112 Art O Cathain     2026-10-16  145  		.matches = {
38cb2ef26b64112 Art O Cathain     2026-10-16  146  			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
38cb2ef26b64112 Art O Cathain     2026-10-16  147  			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14S DS14265"),
38cb2ef26b64112 Art O Cathain     2026-10-16  148  		},
38cb2ef26b64112 Art O Cathain     2026-10-16  149  	},
817b86669dcedaf Matthew Schwartz  2026-11-04  150  	{
817b86669dcedaf Matthew Schwartz  2026-11-04  151  		/* ASUS ROG Xbox Ally X20 (Strix Point, ACP 7.0) */
817b86669dcedaf Matthew Schwartz  2026-11-04  152  		.matches = {
817b86669dcedaf Matthew Schwartz  2026-11-04  153  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
817b86669dcedaf Matthew Schwartz  2026-11-04  154  			DMI_MATCH(DMI_BOARD_NAME, "RC74XA"),
817b86669dcedaf Matthew Schwartz  2026-11-04  155  	},
067db578cc2d16d Jaehoon Kim       2026-11-11 @156  	{
067db578cc2d16d Jaehoon Kim       2026-11-11  157  		/* LG gram 16 16Z95U (ACP 7.2) */
067db578cc2d16d Jaehoon Kim       2026-11-11 @158  		.matches = {
067db578cc2d16d Jaehoon Kim       2026-11-11 @159  			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
067db578cc2d16d Jaehoon Kim       2026-11-11 @160  			DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
067db578cc2d16d Jaehoon Kim       2026-11-11  161  		},
817b86669dcedaf Matthew Schwartz  2026-11-04  162  	},
d0426510a9e1fab Hasun Park        2026-03-09 @163  	{}
d0426510a9e1fab Hasun Park        2026-03-09 @164  };
d0426510a9e1fab Hasun Park        2026-03-09  165  

:::::: The code at line 158 was first introduced by commit
:::::: 067db578cc2d16d40ba3b9908f8a0e2043203f3e ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16Z95U

:::::: TO: Jaehoon Kim <jaehoon1744@dankook.ac.kr>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
