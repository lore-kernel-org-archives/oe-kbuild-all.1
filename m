Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469B525757
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 17:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715794021; cv=none; b=chb/fWSHr7NJSEfXjn+ro5Txio7LKNOwKnPCVs+HefcjkO7PwX9YWrkhJNs38n6RcoaZUWbIpakSmIdf0K6f0Zx6oTQQC13+5U8WWfgDVemj16JpaI3NUjK8AzFcr/GBt9RKKTlu6jFGf31LPHZpxCwP9apvotgoo/mLvf67Hn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715794021; c=relaxed/simple;
	bh=hW9hMcusZjdy8DD1FdxX7zD0GPhjloviTmpuWE+e6t8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YaFIhI94IdoWb5wn7l3qIz7W+sQeGNbdbT0U4atvpW9ixjGun29C5FWiUcwxhgDK9BXqgjHz/F+idd4S3qGOu6gJRoH3CmSuACywPt77H9px1Qv2BrgG7Bx3PDFSYah5PBCOXG+sWDtVRGYokxa50X/t/b9HcVKNJECgoUBWSII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZjq5uiD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZjq5uiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715794020; x=1747330020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hW9hMcusZjdy8DD1FdxX7zD0GPhjloviTmpuWE+e6t8=;
  b=hZjq5uiD+LVCyRjXzIVI+A6Bd5t5sRWbbT2Jo0s+/RJXUbzB1CWWFp0i
   8O4Cod8HdphEoTXXjVAAR40BCBx9G6ErKCjN2UpzqPk2NqD/eUSGLBMDc
   alLAObVyLR1dkCJgsTd+VoQV9VZpP6wAJve2o03dhz4kTWQTtSBRWMGtk
   l8o5L5na6MPOuPUtclB7iS3vm0PQizhxJPq0RzcUoxrobaZCCXgVBIaeD
   u23UEAxR/A57yIMYF54t6v6xtgUtMBluy577zt/E1vdvWhtHgiiUmAS2l
   c1OFotTLKszAB/oqWJ5IiFbdGulrDO7WAIWkkCAwNLVfuQCGPj9NK29IS
   A==;
X-CSE-ConnectionGUID: eWQYhFhCQUmtNl0a2vC8RQ==
X-CSE-MsgGUID: guN+aQ0jT4aSS5ODATMIsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22534416"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="22534416"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 10:27:00 -0700
X-CSE-ConnectionGUID: 3B4oBA4VQGuiSGf39DC/Kg==
X-CSE-MsgGUID: rCNp7IFkRXGrxbqdTfV2cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="31708310"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 May 2024 10:26:56 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7IOz-000D5j-39;
	Wed, 15 May 2024 17:26:53 +0000
Date: Thu, 16 May 2024 01:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6600/6620]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:15: warning: no previous
 prototype for 'kprobe_symbol_address_byname'
Message-ID: <202405160154.ogG041Cf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   24bcde27d3b11d99cdceaa28d2ba6213e1678e90
commit: ba47bd6dc7b834ca6a02ad51205a862009981bfa [6600/6620] newfeature:crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-oc_stream_base_config (https://download.01.org/0day-ci/archive/20240516/202405160154.ogG041Cf-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160154.ogG041Cf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160154.ogG041Cf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous prototype for 'tdm_service_run' [-Wmissing-prototypes]
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:5: warning: no previous prototype for 'tdm_service_exit' [-Wmissing-prototypes]
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:15: warning: no previous prototype for 'kprobe_symbol_address_byname' [-Wmissing-prototypes]
     243 | unsigned long kprobe_symbol_address_byname(const char *name)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kprobe_symbol_address_byname +243 drivers/crypto/ccp/hygon/tdm-kernel-guard.c

   242	
 > 243	unsigned long kprobe_symbol_address_byname(const char *name)
   244	{
   245		int p_ret;
   246		struct kprobe p_kprobe;
   247		unsigned long addr = 0;
   248	
   249		memset(&p_kprobe, 0, sizeof(p_kprobe));
   250	
   251		p_kprobe.pre_handler = p_tmp_kprobe_handler;
   252		p_kprobe.symbol_name = name;
   253	
   254		p_ret = register_kprobe(&p_kprobe);
   255		if (p_ret < 0) {
   256			pr_err("register_kprobe error [%d] :(\n", p_ret);
   257			return 0;
   258		}
   259	
   260		addr = (unsigned long)p_kprobe.addr;
   261		unregister_kprobe(&p_kprobe);
   262	
   263		return addr;
   264	}
   265	#endif
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
