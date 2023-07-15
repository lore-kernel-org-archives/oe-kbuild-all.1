Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226821FBF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689422701; x=1720958701;
  h=date:from:cc:subject:message-id:mime-version;
  bh=WdnzyL2kWK+kuiyOWdy/sHhL09Pb4I0L9vXvHFOIY3s=;
  b=AZOWKtAxQRpPWZFcYrcy0Cu5pBssAm9LzW+qN4zRMgy70mNZ/wh9exsK
   6DFN1lK/XcIsgzlsa06qLMII43HrRh6Xxmm89uQP5CF6pKiDl83TkSMSg
   sFDF/l+kmafed1FUUUkfXj1LN0NerpcLTNkmQa0KlwSYZ/GA56FCRZsSj
   RvbxcFgIvJ86iILP+Hkclqp8U5pLSye9Y/sWgRpDGIgKZwlHtbJR+M7K9
   Dwc4OZYuCcyI2tkVaZT/rBiZEKQ4VNGsYZFf6vxyJq8mcIPSGF0XxhPfT
   znl19UyQdAhGC0FYf5zu/WlMy/ugdw4/Qs9eFWtHrE4f5ar1ZQ48pVaPw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="345249474"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="345249474"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 05:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="722687701"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="722687701"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Jul 2023 05:04:58 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKe1B-00089N-2e;
	Sat, 15 Jul 2023 12:04:57 +0000
Date: Sat, 15 Jul 2023 20:03:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3704/30000] security/security.c:1969:21:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202307151910.XcFJSycp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   0f6dab7d9f97996aec10a8e2e854ec3bd628d550
commit: a00370b9fe9cf738dcef3f83d2e3e619b24dca00 [3704/30000] Move common usercopy into security_getpeersec_stream
config: m68k-randconfig-r072-20230713 (https://download.01.org/0day-ci/archive/20230715/202307151910.XcFJSycp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307151910.XcFJSycp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307151910.XcFJSycp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/security.c:359:5: sparse: sparse: symbol 'lsm_file_alloc' was not declared. Should it be static?
   security/security.c:380:5: sparse: sparse: symbol 'lsm_task_alloc' was not declared. Should it be static?
   security/security.c:460:5: sparse: sparse: symbol 'lsm_ipc_alloc' was not declared. Should it be static?
   security/security.c:482:5: sparse: sparse: symbol 'lsm_key_alloc' was not declared. Should it be static?
   security/security.c:504:5: sparse: sparse: symbol 'lsm_msg_msg_alloc' was not declared. Should it be static?
   security/security.c:526:5: sparse: sparse: symbol 'lsm_sock_alloc' was not declared. Should it be static?
   security/security.c:547:5: sparse: sparse: symbol 'lsm_superblock_alloc' was not declared. Should it be static?
   security/security.c:1969:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   security/security.c:1969:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   security/security.c:1969:21: sparse: sparse: cast removes address space '<asn:1>' of expression
>> security/security.c:1969:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got int [noderef] <asn:1> *optlen @@
   security/security.c:1969:21: sparse:     expected void *
   security/security.c:1969:21: sparse:     got int [noderef] <asn:1> *optlen
   security/security.c:359:5: warning: no previous prototype for 'lsm_file_alloc' [-Wmissing-prototypes]
     359 | int lsm_file_alloc(struct file *file)
         |     ^~~~~~~~~~~~~~
   security/security.c:380:5: warning: no previous prototype for 'lsm_task_alloc' [-Wmissing-prototypes]
     380 | int lsm_task_alloc(struct task_struct *task)
         |     ^~~~~~~~~~~~~~
   security/security.c:460:5: warning: no previous prototype for 'lsm_ipc_alloc' [-Wmissing-prototypes]
     460 | int lsm_ipc_alloc(struct kern_ipc_perm *kip)
         |     ^~~~~~~~~~~~~
   security/security.c:482:5: warning: no previous prototype for 'lsm_key_alloc' [-Wmissing-prototypes]
     482 | int lsm_key_alloc(struct key *key)
         |     ^~~~~~~~~~~~~
   security/security.c:504:5: warning: no previous prototype for 'lsm_msg_msg_alloc' [-Wmissing-prototypes]
     504 | int lsm_msg_msg_alloc(struct msg_msg *mp)
         |     ^~~~~~~~~~~~~~~~~
   security/security.c:526:5: warning: no previous prototype for 'lsm_sock_alloc' [-Wmissing-prototypes]
     526 | int lsm_sock_alloc(struct sock *sock, gfp_t priority)
         |     ^~~~~~~~~~~~~~
   security/security.c:547:5: warning: no previous prototype for 'lsm_superblock_alloc' [-Wmissing-prototypes]
     547 | int lsm_superblock_alloc(struct super_block *sb)
         |     ^~~~~~~~~~~~~~~~~~~~
   security/security.c:205: warning: Function parameter or member 'lsm' not described in 'security_module_enable'
   security/security.c:205: warning: Excess function parameter 'module' description in 'security_module_enable'

vim +1969 security/security.c

  1957	
  1958	int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
  1959					      int __user *optlen, unsigned len)
  1960	{
  1961		char *tval = NULL;
  1962		u32 tlen;
  1963		int rc;
  1964	
  1965		rc = call_int_hook(socket_getpeersec_stream, -ENOPROTOOPT, sock,
  1966				   &tval, &tlen, len);
  1967		if (rc == 0) {
  1968			tlen = strlen(tval) + 1;
> 1969			if (put_user(tlen, optlen))
  1970				rc = -EFAULT;
  1971			else if (copy_to_user(optval, tval, tlen))
  1972				rc = -EFAULT;
  1973			kfree(tval);
  1974		}
  1975		return rc;
  1976	}
  1977	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
