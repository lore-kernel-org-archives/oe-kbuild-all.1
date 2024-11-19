Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C833F7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 02:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731984438; cv=none; b=J2WmYWM2tMcQ3pUqolAJwo5eF78qAmt145iBjWw9v/cHMOSKA5Y8fAN41pqZtLn+IWo+XWvOLsDDYKX/qy6cSmy5IvkZZtcl7uR4qJwuIZ70yeal/VWsKxZWfoD0FYQ+VjW/OpHe27hkPVRWKZebQjlTEq4bS34CAbDpW6ioUlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731984438; c=relaxed/simple;
	bh=9xN2oFVYsmU4rEQoMGu8WQj6hFUrZYhLKxC771PPJ/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hoa2o1wkUXph/ig2AmQsS0MJ0dhyskeGaCH1mD59gz3JWfPGzM1nA/L1l3VIWWRvmEiyCRi/Ddx4npLGwyL9Fr4D8cV6lcawqPIMAi641s/48JDN/pgUe9g51akO6Ripyjghl/+8Ym1S1/PEDuATDrPNmoO4v86qdK404D4PsB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNI2Q5iO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNI2Q5iO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731984437; x=1763520437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9xN2oFVYsmU4rEQoMGu8WQj6hFUrZYhLKxC771PPJ/0=;
  b=NNI2Q5iObLNidm+GVcPkNBzgQ3tvpDHINUr8LsD31MErhNz1nYi0u3t7
   5Y4lzsoRRb9QFzAc8CR3Lf30XTw/2wQwGyAzw+MOWlpTReO3xh3qUeK0n
   M22p3G2vQDZTHtB6EzctKlRXv/gfDw33dYB6snm659iBxzU5Lka2origU
   86IiqWeK2DiUHIo1T3Dw5eKuWc+0GJXxC2j6TCsiWWGuDYYxp9M2qMoIG
   B5kKNdgfWsU0hL4Cb+LIRcUk0bU1cdqRhIUwj1eTqbNb2gUTsYMpPakzy
   NHEeVysIWjwaG3dmd3QQID94NIoUHh954Hx63FYbvYkGoZAOLu1U38XYt
   g==;
X-CSE-ConnectionGUID: ltF3z7F2ROixSHeL50Gw1g==
X-CSE-MsgGUID: 1pvUzkBUSjmGNaJd3Lcibw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19576800"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="19576800"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:47:16 -0800
X-CSE-ConnectionGUID: gvWpKPaoQeChwpKOQtg6KA==
X-CSE-MsgGUID: QLfsWdDlRPWoAiLQ6MBjPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89573708"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2024 18:47:02 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDEGa-00003q-16;
	Tue, 19 Nov 2024 02:47:00 +0000
Date: Tue, 19 Nov 2024 10:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "Carrie.Cai" <carrie.cai@montage-tech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1484/1484]
 drivers/crypto/montage/tsse/tsse_dev.h:84:13: warning: variable 'cpu' set
 but not used
Message-ID: <202411191002.S36p5N3T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8a039651010897592567f5751c4e706ab794e9c0
commit: 811debd4ea52033d7393d4a7de2be11f71c70348 [1484/1484] add support for Mont-TSSE Driver
config: x86_64-randconfig-074-20241119 (https://download.01.org/0day-ci/archive/20241119/202411191002.S36p5N3T-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191002.S36p5N3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191002.S36p5N3T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/montage/tsse/tsse_irq.c:10:
   drivers/crypto/montage/tsse/tsse_dev.h: In function 'tsse_get_cur_node':
>> drivers/crypto/montage/tsse/tsse_dev.h:84:13: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      84 |         int cpu, node;
         |             ^~~
--
   In file included from drivers/crypto/montage/tsse/tsse_ipc.c:14:
   drivers/crypto/montage/tsse/tsse_dev.h: In function 'tsse_get_cur_node':
>> drivers/crypto/montage/tsse/tsse_dev.h:84:13: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      84 |         int cpu, node;
         |             ^~~
   drivers/crypto/montage/tsse/tsse_ipc.c: At top level:
   drivers/crypto/montage/tsse/tsse_ipc.c:17:18: warning: no previous prototype for 'get_msginf' [-Wmissing-prototypes]
      17 | struct tsse_msg *get_msginf(void __iomem *d2h)
         |                  ^~~~~~~~~~
   drivers/crypto/montage/tsse/tsse_ipc.c:41:6: warning: no previous prototype for 'ipc_recieve_msg' [-Wmissing-prototypes]
      41 | void ipc_recieve_msg(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
         |      ^~~~~~~~~~~~~~~
   drivers/crypto/montage/tsse/tsse_ipc.c:53:5: warning: no previous prototype for 'msg_rout' [-Wmissing-prototypes]
      53 | int msg_rout(struct tsse_ipc *tsseipc, struct tsse_msg *tssemsg)
         |     ^~~~~~~~
   drivers/crypto/montage/tsse/tsse_ipc.c:103:6: warning: no previous prototype for 'ipc_send_msg' [-Wmissing-prototypes]
     103 | void ipc_send_msg(struct tsse_ipc *tsseipc, struct ipc_data *msg)
         |      ^~~~~~~~~~~~
   drivers/crypto/montage/tsse/tsse_ipc.c:115:6: warning: no previous prototype for 'ipc_hw_init' [-Wmissing-prototypes]
     115 | void ipc_hw_init(struct tsse_ipc *hw_ipc)
         |      ^~~~~~~~~~~
   drivers/crypto/montage/tsse/tsse_ipc.c:122:5: warning: no previous prototype for 'ipc_init_msg' [-Wmissing-prototypes]
     122 | int ipc_init_msg(struct tsse_ipc *tsseipc)
         |     ^~~~~~~~~~~~
--
   In file included from drivers/crypto/montage/tsse/tsse_dev_mgr.c:15:
   drivers/crypto/montage/tsse/tsse_dev.h: In function 'tsse_get_cur_node':
>> drivers/crypto/montage/tsse/tsse_dev.h:84:13: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      84 |         int cpu, node;
         |             ^~~
   drivers/crypto/montage/tsse/tsse_dev_mgr.c: At top level:
   drivers/crypto/montage/tsse/tsse_dev_mgr.c:107:5: warning: no previous prototype for 'tsse_stop_dev' [-Wmissing-prototypes]
     107 | int tsse_stop_dev(struct tsse_dev *tdev, bool busy_exit)
         |     ^~~~~~~~~~~~~
--
   In file included from drivers/crypto/montage/tsse/tsse_vuart.c:25:
   drivers/crypto/montage/tsse/tsse_dev.h: In function 'tsse_get_cur_node':
>> drivers/crypto/montage/tsse/tsse_dev.h:84:13: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      84 |         int cpu, node;
         |             ^~~
   At top level:
   drivers/crypto/montage/tsse/tsse_vuart.c:77:13: warning: 'vuart_wait_for_xmitr' defined but not used [-Wunused-function]
      77 | static void vuart_wait_for_xmitr(struct uart_port *port)
         |             ^~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/crypto/montage/tsse/tsse_fw_service.c:20:
   drivers/crypto/montage/tsse/tsse_dev.h: In function 'tsse_get_cur_node':
>> drivers/crypto/montage/tsse/tsse_dev.h:84:13: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      84 |         int cpu, node;
         |             ^~~
   drivers/crypto/montage/tsse/tsse_fw_service.c: At top level:
   drivers/crypto/montage/tsse/tsse_fw_service.c:26:5: warning: no previous prototype for 'fw_send_msg' [-Wmissing-prototypes]
      26 | int fw_send_msg(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
         |     ^~~~~~~~~~~
   drivers/crypto/montage/tsse/tsse_fw_service.c:51:6: warning: no previous prototype for 'fw_free' [-Wmissing-prototypes]
      51 | void fw_free(void *msg_t)
         |      ^~~~~~~


vim +/cpu +84 drivers/crypto/montage/tsse/tsse_dev.h

    81	
    82	static inline int tsse_get_cur_node(void)
    83	{
  > 84		int cpu, node;
    85	
    86		cpu = get_cpu();
    87		node = topology_physical_package_id(cpu);
    88		put_cpu();
    89	
    90		return node;
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
