Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB141B6D0F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732566012; cv=none; b=eAhwJoDdH/ZBv8K8q7SxnqEfqEmJiEx9ZLcCgLWZA1aF52vg2MsUjQJUxCwwhP+IhrYWWrY0uAyZBipuSNPydavpSf0CzW1qtAJJ8gOB132vRbQ6+G63w2tgpJG4DH3j1x9v9pb99EkmsedyASCLmN+WMvZ/vV6qU+1qGHVywuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732566012; c=relaxed/simple;
	bh=Idb3QVFihOrUNWisbpst36TIqaT00EQhHl0fTHgzHtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQUg/wEok5/HNwb8AhdpuKkx4j2cYlS1sXee6AIHX+ExKkzDFEBBjy8FmsDJrYTGB/obfvhqovvkjk9t64YsxwdpH/5mpHU5lgze/L3ukh/qJZGGpRDu7o33/D3Gik3nnZcfWrAxSNl9dboJiSlC3pHcIjKx8h/gWDZY4Bi8noA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4mqa+Qn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4mqa+Qn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732566009; x=1764102009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Idb3QVFihOrUNWisbpst36TIqaT00EQhHl0fTHgzHtQ=;
  b=X4mqa+QnHpz2OsMair/kj+x58fbC6CppDNsvQREwogHTbTk5Sz/aUyaN
   CKr0i/WbCt/MzxtE3eKG/gBFNDR822wl4ciDl9B38UdmHPaXz2HQ+iXkE
   tMeJUC4TZATYVjVDDt3QFBjuUaBK9QPPqJ2uJFehoVXL7vO/Y/zuD6G9I
   EwFNH5Ld8etfgRPRTJHv5UNDXlD0Ws09IdBgNo4YRAtKmkLuHDO3bxSG7
   5KDqzlFuw4uU5fmaAMiAyKr1edaFxrSzA+lAEpCY1gnYwKCue6JjmbpF9
   Z+v+0LwsCnA6BToyK/sTLLneWQtMqb18J4uSk5c1IrSLQ0YBY+OQSRXej
   Q==;
X-CSE-ConnectionGUID: rcGoflJnSL2Ybsd4xIVtdw==
X-CSE-MsgGUID: aoEZ1MwLRWqBtPKIhLQ6Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32824919"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="32824919"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 12:20:08 -0800
X-CSE-ConnectionGUID: ogwnT6RLRhyi6joF25CoqQ==
X-CSE-MsgGUID: KThgEERhRwur7hNAOAKOyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="96462450"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2024 12:20:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFfYz-0006ld-2q;
	Mon, 25 Nov 2024 20:20:05 +0000
Date: Tue, 26 Nov 2024 04:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "Darren Hart (VMware)" <dvhart@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1306/1306]
 drivers/platform/x86/alienware-wmi.c:539:21: warning: 'output.pointer' is
 used uninitialized
Message-ID: <202411260425.gByrWNcz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mario,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   48fd60600c1344806a27e3bb33ab33ec5a9fea7c
commit: ff0e9f26288d2daee4950f42b37a3d3d30d36ec1 [1306/1306] platform/x86: alienware-wmi: Correct a memory leak
config: x86_64-randconfig-076-20241125 (https://download.01.org/0day-ci/archive/20241126/202411260425.gByrWNcz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260425.gByrWNcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260425.gByrWNcz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/acpi.h:41,
                    from drivers/platform/x86/alienware-wmi.c:20:
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'alienware_wmi_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   drivers/platform/x86/alienware-wmi.c:852:1: note: in expansion of macro 'module_init'
     852 | module_init(alienware_wmi_init);
         | ^~~~~~~~~~~
   drivers/platform/x86/alienware-wmi.c:785:19: note: 'init_module' target declared here
     785 | static int __init alienware_wmi_init(void)
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'alienware_wmi_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/platform/x86/alienware-wmi.c:864:1: note: in expansion of macro 'module_exit'
     864 | module_exit(alienware_wmi_exit);
         | ^~~~~~~~~~~
   drivers/platform/x86/alienware-wmi.c:854:20: note: 'cleanup_module' target declared here
     854 | static void __exit alienware_wmi_exit(void)
         |                    ^~~~~~~~~~~~~~~~~~
   In function 'alienware_wmax_command',
       inlined from 'toggle_hdmi_source' at drivers/platform/x86/alienware-wmi.c:609:11:
>> drivers/platform/x86/alienware-wmi.c:539:21: warning: 'output.pointer' is used uninitialized [-Wuninitialized]
     539 |         kfree(output.pointer);
         |               ~~~~~~^~~~~~~~
   drivers/platform/x86/alienware-wmi.c: In function 'toggle_hdmi_source':
   drivers/platform/x86/alienware-wmi.c:521:28: note: 'output' declared here
     521 |         struct acpi_buffer output;
         |                            ^~~~~~
   In function 'alienware_wmax_command',
       inlined from 'toggle_deepsleep' at drivers/platform/x86/alienware-wmi.c:748:11:
>> drivers/platform/x86/alienware-wmi.c:539:21: warning: 'output.pointer' is used uninitialized [-Wuninitialized]
     539 |         kfree(output.pointer);
         |               ~~~~~~^~~~~~~~
   drivers/platform/x86/alienware-wmi.c: In function 'toggle_deepsleep':
   drivers/platform/x86/alienware-wmi.c:521:28: note: 'output' declared here
     521 |         struct acpi_buffer output;
         |                            ^~~~~~
   drivers/platform/x86/alienware-wmi.o: warning: objtool: show_hdmi_source()+0x80: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: show_hdmi_cable()+0x82: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: show_amplifier_status()+0x82: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: show_deepsleep_status()+0x82: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: alienware_update_led()+0x239: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: zone_set()+0xb0: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: global_led_set()+0x117: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: toggle_hdmi_source()+0x106: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: toggle_deepsleep()+0x103: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: show_hdmi_source.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/alienware-wmi.o: warning: objtool: show_hdmi_cable.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/alienware-wmi.o: warning: objtool: show_amplifier_status.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/alienware-wmi.o: warning: objtool: show_deepsleep_status.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/alienware-wmi.o: warning: objtool: alienware_update_led.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/alienware-wmi.o: warning: objtool: zone_set.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/alienware-wmi.o: warning: objtool: global_led_set.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/alienware-wmi.o: warning: objtool: toggle_hdmi_source.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/alienware-wmi.o: warning: objtool: toggle_deepsleep.cold()+0x0: call without frame pointer save/setup


vim +539 drivers/platform/x86/alienware-wmi.c

   514	
   515	static acpi_status alienware_wmax_command(struct wmax_basic_args *in_args,
   516						  u32 command, int *out_data)
   517	{
   518		acpi_status status;
   519		union acpi_object *obj;
   520		struct acpi_buffer input;
   521		struct acpi_buffer output;
   522	
   523		input.length = (acpi_size) sizeof(*in_args);
   524		input.pointer = in_args;
   525		if (out_data != NULL) {
   526			output.length = ACPI_ALLOCATE_BUFFER;
   527			output.pointer = NULL;
   528			status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
   529						     command, &input, &output);
   530		} else
   531			status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
   532						     command, &input, NULL);
   533	
   534		if (ACPI_SUCCESS(status) && out_data != NULL) {
   535			obj = (union acpi_object *)output.pointer;
   536			if (obj && obj->type == ACPI_TYPE_INTEGER)
   537				*out_data = (u32) obj->integer.value;
   538		}
 > 539		kfree(output.pointer);
   540		return status;
   541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
