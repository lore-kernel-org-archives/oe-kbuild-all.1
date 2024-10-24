Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BAABA4B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 03:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729739797; cv=none; b=EF9VluIruy5PBq5hZ0G0NDJgpoJMXKuhim58ZSL/4JWKbKuiDMOxaoS49YjNiP1Ya+Zu5UmJfY1hdUwwQvz/hD5FALzLv8ptpqNks+5nV8v5b+oJhv2ljP8AbEkmdGWZaizzlMVen/5Eo881x2MQE9aBUKNeIVWDEHVK0gls+fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729739797; c=relaxed/simple;
	bh=Qu9fJLr1v+5Xli+b+8NmPG2n7sMJcxBwfFrqbYFjku4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oERcwtRdPqFQpyweNy196WOTUBXZbbTOQtZY4UH13OB3aPiHbbwsyVzGwUEZbGF1n/oSzlTs669W6xXUANDSWCtAtywEI8wGY65ZehucuS167QJ92V0qZX2AQRZydYPmEcwsU3zvxI0sO9P0sjKAi8l7i81gJRGzZsQSqoIKL4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7ISqEoP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7ISqEoP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729739796; x=1761275796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qu9fJLr1v+5Xli+b+8NmPG2n7sMJcxBwfFrqbYFjku4=;
  b=I7ISqEoPe7oh172mziBXfiIvFVpZRYMTDeAqmmqIAEJNnwviKzgOIG5D
   +cy83A4XgBL+3e0vfjlCiU94nvSegza//aslNUBtagO4hVR4hZHQzjWUi
   HaCi3gHAV/+eivlcskwOILUDV5zD0yMZltUdijdb7l6X6ORBq4Di61HHD
   YBVyhrpbYYWRH35mAg9uLWW3BoG5zl9z2lIj/ukn6uLUYvK7ItKUAPs5j
   9tDQvplZesJMr9HpN5gY71rcSipFfXDY7iVjVsgwsTdialwOY/hz36bRm
   rbvJXdA/b3AQJGgK/35trDOR5ges1QR9fxb2OLK5hsCwQN1GxAW2xbGHv
   A==;
X-CSE-ConnectionGUID: Q22PZGKgTpWCE3c1+Fx9gQ==
X-CSE-MsgGUID: xyBO40iaTZWhEzb7QgtH/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="54753893"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="54753893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 20:16:35 -0700
X-CSE-ConnectionGUID: hoy4CYCsQRKlfHSguLtwgw==
X-CSE-MsgGUID: NOmV4ql1T069AUcR2ibO/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="85569884"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Oct 2024 20:16:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3oKr-000VsM-0w;
	Thu, 24 Oct 2024 03:16:29 +0000
Date: Thu, 24 Oct 2024 11:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7228/13046]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:37: error: 'NR_syscalls'
 undeclared; did you mean 'si_syscall'?
Message-ID: <202410241109.88USiTaE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: ba47bd6dc7b834ca6a02ad51205a862009981bfa [7228/13046] newfeature:crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-buildonly-randconfig-005-20241024 (https://download.01.org/0day-ci/archive/20241024/202410241109.88USiTaE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241109.88USiTaE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241109.88USiTaE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous prototype for 'tdm_service_run' [-Wmissing-prototypes]
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:5: warning: no previous prototype for 'tdm_service_exit' [-Wmissing-prototypes]
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~~
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
