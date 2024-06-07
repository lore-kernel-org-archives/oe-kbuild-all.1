Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5AF17571
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 05:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717738393; cv=none; b=JwbPsB/5+vKQWeRDyl6EbxHko/9QFeY0hUJbKLcCBxvv04s7f3GaS+YuqAEPQ9qnfSMfnqxylBIzBJ43cmj02JTj7phzZX+UQEPX1c5YOiFJqnT+5A7TpgXVRYovX0JSP2QSePysrc6zPz8L40ZbIiiwj2PLDUM+fLozDBi//wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717738393; c=relaxed/simple;
	bh=1tkrsEGpD2RbfLPASe08uDN180crBue5wgvldCxYaDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dmys23ja0bJ0CiTKKVYVBugUl1pMjhHZgDswHbrS8aDgWlm4uhFbFiXEL1tiZbPJKQesWaC7DHzWiMzEmpFpm5/PAz0oSaEa8dEY2Fw1vOyKK7iR8sip5cb3QpFYGLTyuAROfHVBD27xQWHKAV0UAMurJ2lu/fFCbFlAE3CiCAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Di/JURG0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Di/JURG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717738391; x=1749274391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1tkrsEGpD2RbfLPASe08uDN180crBue5wgvldCxYaDI=;
  b=Di/JURG0jFiCg1wNITBftXVHEOhYxVY+ugaPZUZxMztRsYzuMClhrO/e
   RvUJjVusIaE0ooUTjBbl5dGZf1tQMDVc+DtD8C3O+YJcfAlkOGxgdoXMl
   YEweyDlMKWzOsJ3TDJLhjK+lS5gZc8D/D55gIOPAb2Dz9Lzde29B3eaJR
   qBE9VJ5j80lI9Syqi8pi1XO2HMfgOeq6frkOJO0nozWW8t1NHHEJ6RehB
   R32S80hvPD3+w00TQQ8lDBHTnW6Mn8UtFIDUGd/cDpZ7RWY9Cg8SBV//7
   REUKZ2FueMATlHgdNvQ2Y73PaQpmHdkjQzJrUIqAT8QdkUuZ1tcVgPyxO
   g==;
X-CSE-ConnectionGUID: d1WIvirpTLiBD0wWq0qnqA==
X-CSE-MsgGUID: 8LMHlXHuTy214KnoOAEo9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14560566"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="14560566"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 22:33:10 -0700
X-CSE-ConnectionGUID: mE+s2g/CQOSVZJpBAvMB3g==
X-CSE-MsgGUID: KsQz791VTO2dO9U9V0zeoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38134562"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 06 Jun 2024 22:33:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFSDr-00048C-0a;
	Fri, 07 Jun 2024 05:33:07 +0000
Date: Fri, 7 Jun 2024 13:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 111/126] mtk-cmdq-sec-tee.c:undefined
 reference to `tee_client_close_context'
Message-ID: <202406071327.vCuhO1Zg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   bb84077a7f2f0e6433f0c71d35738db6fcfca976
commit: a0f3bf1449bdfbea99babee760c8886ee574e42a [111/126] BACKPORT: FROMLIST: mailbox: mediatek: Add CMDQ secure mailbox driver
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240607/202406071327.vCuhO1Zg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071327.vCuhO1Zg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071327.vCuhO1Zg-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/mailbox/mtk-cmdq-sec-tee.o: in function `cmdq_sec_deinit_context':
>> mtk-cmdq-sec-tee.c:(.text+0x158): undefined reference to `tee_client_close_context'
   aarch64-linux-ld: drivers/mailbox/mtk-cmdq-sec-tee.o: in function `cmdq_sec_allocate_wsm':
>> mtk-cmdq-sec-tee.c:(.text+0x204): undefined reference to `tee_shm_register_kernel_buf'
   aarch64-linux-ld: drivers/mailbox/mtk-cmdq-sec-tee.o: in function `cmdq_sec_free_wsm':
>> mtk-cmdq-sec-tee.c:(.text+0x2f0): undefined reference to `tee_shm_free'
   aarch64-linux-ld: drivers/mailbox/mtk-cmdq-sec-tee.o: in function `cmdq_sec_open_session':
>> mtk-cmdq-sec-tee.c:(.text+0x47c): undefined reference to `tee_client_open_session'
   aarch64-linux-ld: drivers/mailbox/mtk-cmdq-sec-tee.o: in function `cmdq_sec_close_session':
>> mtk-cmdq-sec-tee.c:(.text+0x5b0): undefined reference to `tee_client_close_session'
   aarch64-linux-ld: drivers/mailbox/mtk-cmdq-sec-tee.o: in function `cmdq_sec_execute_session':
>> mtk-cmdq-sec-tee.c:(.text+0x748): undefined reference to `tee_client_invoke_func'
   aarch64-linux-ld: drivers/mailbox/mtk-cmdq-sec-tee.o: in function `cmdq_sec_init_context':
>> mtk-cmdq-sec-tee.c:(.text+0x89c): undefined reference to `tee_client_open_context'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
