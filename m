Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7495D8F5A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 01:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729731754; cv=none; b=kLkf+TvdiKe9oZcrTBouA+aad8LE2rXoSk01VTzITgNVer6ZJK0gWw5WJNV4Pd+IiXjOS0AQFFf0CLh2IPg/4ahaWD6L3Uxow9+sAQ3KWLk2S6pDSUZF2YKd2aC6g+Tk2rYmmjvyEVHCgaXwYHju6nKihF9E3HziDeAcDLr3Gxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729731754; c=relaxed/simple;
	bh=W88QZfV8d3YQe/SIxYZadBLmwk5akrKhc4avWqoYr0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TMBPfnzZQ27O70AhD9xeQt6/p0ZdZQWRZAoxoMctyhsz3x/bGwaaGSmCBwsjOzmsTKUbeHfTkjL+nW3p4nXDb/AF46NqLxUAPr5IK/fci46q2of14X69sM1svi8sbUiZeM9UyyQa6JiHF/7TnF24bnuB44N+PQT3RmM0USW9xwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WptSKQSa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WptSKQSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729731752; x=1761267752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W88QZfV8d3YQe/SIxYZadBLmwk5akrKhc4avWqoYr0s=;
  b=WptSKQSaMxspNmv9IkKeYF+4+VQj7aw6leAdB9gjgAgtUbfC6ZyrTH2/
   X9tgqAMccgc6yvdy5E5cADf25kU5wL5oCEjonq+8Ibrml4KRv5Blp/XA3
   3PgG8Q7Bks1d1AhhNgM/JOsqZUc4CbXc9XfKI0zdKu5bfdJQTLLZVBDXk
   Z77Zp90niEoLOuVxvBTDgzf4bVpYivgV9iv3rp7HNroGuvltdtR3cZYk3
   xqp46IVN17FOtCbiVOSP4V2rITsY8jOIiO8zeRwMwjkRVh0FjbWbr9Amd
   jHgIU4AtLvNdNSXO6XUZLxSLh+yBt+WFmxA+tOWlo14jJitnPWfKPM4+u
   g==;
X-CSE-ConnectionGUID: osc7cLIFRPGorA0RX4yYdQ==
X-CSE-MsgGUID: gUqQuKIER/+1i/zxrnGkOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39959190"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="39959190"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 18:02:29 -0700
X-CSE-ConnectionGUID: n4usVrePQ0CqV+vLZbypWQ==
X-CSE-MsgGUID: h9QcalANQ/aPsJEljSntJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80010468"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Oct 2024 18:02:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3mF7-000Vm8-32;
	Thu, 24 Oct 2024 01:02:25 +0000
Date: Thu, 24 Oct 2024 09:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13320/15255]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:37: error: 'NR_syscalls'
 undeclared; did you mean 'si_syscall'?
Message-ID: <202410240917.ylHeViWu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi chench00,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e7bc79687a034a22f94328123d5cf8c4d4436c35
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [13320/15255] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-buildonly-randconfig-006-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240917.ylHeViWu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240917.ylHeViWu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240917.ylHeViWu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous prototype for 'tdm_service_run' [-Wmissing-prototypes]
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:5: warning: no previous prototype for 'tdm_service_exit' [-Wmissing-prototypes]
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:15: warning: no previous prototype for 'kprobe_symbol_address_byname' [-Wmissing-prototypes]
     243 | unsigned long kprobe_symbol_address_byname(const char *name)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c: In function 'kernel_security_enhance_init':
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:37: error: 'NR_syscalls' undeclared (first use in this function); did you mean 'si_syscall'?
     308 |                 eh_objs[SCT].size = NR_syscalls * sizeof(char *);
         |                                     ^~~~~~~~~~~
         |                                     si_syscall
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:37: note: each undeclared identifier is reported only once for each function it appears in


vim +308 drivers/crypto/ccp/hygon/tdm-kernel-guard.c

   286	
   287		sct_addr = (unsigned long *)kallsyms_lookup_name("sys_call_table");
   288	#endif
   289		if (!sct_addr) {
   290			ret = -DYN_ERR_API;
   291			pr_err("kallsyms_lookup_name for sys_call_table failed!");
   292			goto end;
   293		}
   294	
   295		asm("sidt %0":"=m"(idtr));
   296	
   297		if (!psp_check_tdm_support())
   298			return 0;
   299	
   300		for (i = 0; i < MAX_OBJ; i++) {
   301			memset(&eh_objs[i], 0, sizeof(eh_objs[i]));
   302			eh_objs[i].context = CONTEXT_CHECK_MODNAME;
   303			eh_objs[i].obj_name = obj_names[i];
   304		}
   305	
   306		if ((eh_obj == -1) || (eh_obj & (1 << SCT))) {
   307			eh_objs[SCT].vaddr = (uint64_t)sct_addr;
 > 308			eh_objs[SCT].size = NR_syscalls * sizeof(char *);
   309		}
   310		if ((eh_obj == -1) || (eh_obj & (1 << IDT))) {
   311			eh_objs[IDT].vaddr = idtr.address;
   312			eh_objs[IDT].size = idtr.size;
   313		}
   314	
   315		for (i = 0; i < MAX_OBJ; i++) {
   316			if (eh_objs[i].vaddr)
   317				tdm_service_run(&eh_objs[i]);
   318		}
   319	
   320		pr_info("Hygon TDM guard load successfully!\n");
   321	
   322	end:
   323		return ret;
   324	}
   325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
