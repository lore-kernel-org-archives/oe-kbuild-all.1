Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CCC3FE4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 06:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735800843; cv=none; b=rQw864aN+W0IuRnUWmlGDaAv1A0bIQ/5UiV9lGdIcrbVAB3p1C+LxaJs4QXanFUj6qNaJYR9fPyyl43TG/BaYsS1A4/tTrfF44yTP3Adr4FFrEkfz+mrKxsV3Rqe2LhER6ArxmCWsdNw+54aWWCUIuV9VDIudGIfdHbsKmNd7Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735800843; c=relaxed/simple;
	bh=xIMlwdYMck/Nrm5T6Y/7bTTaETa4MxCHKWlgA2kmjtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iP3fdNgbNbh+irrHyR+PddBs++CLo2mwgypTN49RXLJRoNvjaoO9z21XRPZXJJTPOCKmYmz1eGLxNzdaFn3xUMCl+FJIBzs6a6Fdn2dG2im9YiPnFuwHpgsYXo7ItFqL9/jFObeO9Ew1cid4RFSP1RcxuWa1Zlqqm6N6ZJuKCPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CChElAkG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CChElAkG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735800842; x=1767336842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xIMlwdYMck/Nrm5T6Y/7bTTaETa4MxCHKWlgA2kmjtU=;
  b=CChElAkGx0SOkSUsJaOc8tsjBUvlyO0hJy2KEikMK9bRgnrf7gkwEMTg
   0oBak/mbM2mkq0pZDhI38ybxnJyCcDoIwD9GN10KJH21MnAtJss9r1C9P
   KbBGm9EvEPjT5LshlDegwKEI1jW+W9G1DGVbLDSwkyIjvBNjuO/jJRx0j
   xrEGtZWSVNgVpssjyYQ9kzTw4XhD+DUNpfDrQ1b562A6r+at+QgpW8P0P
   F8tyxKCTES349arTBl3Ym/U7BRO1BK0H4AQi1oWN+g/o2Gpdt6dklQpVs
   KXoJUIwoveXdkljmB11hIZT5B5MRPzx6Jdv9HIRMqiZM52of2YpBKqUzS
   w==;
X-CSE-ConnectionGUID: Kh8W8Ek7RVOvgwjS4XE/zg==
X-CSE-MsgGUID: ZuQ2u5RDQg6aT057Mk29oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46615740"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="46615740"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 22:54:01 -0800
X-CSE-ConnectionGUID: HInorjUfSpa1KctKtsGCqQ==
X-CSE-MsgGUID: aYwZLDiIQvK4aX0PxZrs7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="106294667"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Jan 2025 22:54:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTF5i-0008Ht-0Y;
	Thu, 02 Jan 2025 06:53:58 +0000
Date: Thu, 2 Jan 2025 14:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1364/1364]
 drivers/platform/x86/alienware-wmi.c:539:21: warning: 'output.pointer' is
 used uninitialized
Message-ID: <202501021446.IMIEwcLb-lkp@intel.com>
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
head:   b68a556be26b12af79c2eee965d0a672c8a585b6
commit: ff0e9f26288d2daee4950f42b37a3d3d30d36ec1 [1364/1364] platform/x86: alienware-wmi: Correct a memory leak
config: x86_64-randconfig-161-20250102 (https://download.01.org/0day-ci/archive/20250102/202501021446.IMIEwcLb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021446.IMIEwcLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021446.IMIEwcLb-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/platform/x86/alienware-wmi.o: warning: objtool: show_hdmi_source()+0x23: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: show_hdmi_cable()+0x23: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: show_amplifier_status()+0x23: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: show_deepsleep_status()+0x23: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: alienware_update_led()+0x98: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: global_led_set()+0x63: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: toggle_hdmi_source()+0x7a: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: toggle_deepsleep()+0x7a: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/alienware-wmi.o: warning: objtool: global_led_set.cold()+0x19: sibling call from callable instruction with modified stack frame


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
