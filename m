Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E56339BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 23:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKrpzCiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701299492; x=1732835492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HsqSvXSAZKGHI304Ci8UWyBplGR0aO0mPrqeArnaMds=;
  b=gKrpzCiCgJlFW2mD0D3L9dDbmkK14Xb6YBmeXyRF8C5qtUiB16j03taR
   tExm1RHq1pf7t4pD+JWVVGFjwxLfkI0UbSqXmb5hLrA/2+D9hR+Qrmig8
   A3Uke/LjLznL3uHFl+RlEhiegc4D+zDO2Ev6C5hode3qEDSlUd9J/pyBQ
   q/T6JUy1IiUzMnH36NHF2Cj6mk6FRoj8cPB6PpzeefP1h70pCl0Wn7nnL
   eIbixdLPSwvcjUr9v71q2Q+V61ZkdARE2QA7cbTLNDKjy55TvgsJYnuBv
   IF6YeAYbweAXbxB/f0toc8z64lYXvi/ozcBIYEqsHOm+8pJlElmhENDo4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14796099"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="14796099"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 15:11:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798083943"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="798083943"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Nov 2023 15:11:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8TiJ-000142-29;
	Wed, 29 Nov 2023 23:11:27 +0000
Date: Thu, 30 Nov 2023 07:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 15/16]
 drivers/net/ethernet/intel/libie/rx.c:21: warning: Excess function parameter
 'wanted' description in 'libie_rx_hw_len'
Message-ID: <202311300327.Uec3tKvu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   1b1f16c230ce8b25207b3f807bd386fa564a3dec
commit: 847eddfd3ed16a6f8d9f567e47639dfc55fd2971 [15/16] idpf: convert header split mode to libie + napi_build_skb()
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20231130/202311300327.Uec3tKvu-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300327.Uec3tKvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300327.Uec3tKvu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/libie/rx.c:21: warning: Function parameter or member 'pp' not described in 'libie_rx_hw_len'
   drivers/net/ethernet/intel/libie/rx.c:21: warning: Excess function parameter 'dev' description in 'libie_rx_hw_len'
>> drivers/net/ethernet/intel/libie/rx.c:21: warning: Excess function parameter 'wanted' description in 'libie_rx_hw_len'
   drivers/net/ethernet/intel/libie/rx.c:21: warning: Excess function parameter 'max_len' description in 'libie_rx_hw_len'


vim +21 drivers/net/ethernet/intel/libie/rx.c

58f0ab910da24e Alexander Lobakin 2023-06-20   9  
58f0ab910da24e Alexander Lobakin 2023-06-20  10  /**
58f0ab910da24e Alexander Lobakin 2023-06-20  11   * libie_rx_hw_len - get the actual buffer size to be passed to HW
58f0ab910da24e Alexander Lobakin 2023-06-20  12   * @dev: &net_device to calculate the size for
847eddfd3ed16a Alexander Lobakin 2023-11-28  13   * @wanted: desired size if differs from MTU + LL
58f0ab910da24e Alexander Lobakin 2023-06-20  14   * @max_len: maximum length for the given page size
58f0ab910da24e Alexander Lobakin 2023-06-20  15   *
58f0ab910da24e Alexander Lobakin 2023-06-20  16   * Return: HW-writeable length per one buffer to pass it to the HW accounting:
58f0ab910da24e Alexander Lobakin 2023-06-20  17   * MTU the @dev has, HW required alignment, minimum and maximum allowed values,
58f0ab910da24e Alexander Lobakin 2023-06-20  18   * and system's page size.
58f0ab910da24e Alexander Lobakin 2023-06-20  19   */
58f0ab910da24e Alexander Lobakin 2023-06-20  20  static u32 libie_rx_hw_len(const struct page_pool_params *pp)
58f0ab910da24e Alexander Lobakin 2023-06-20 @21  {
58f0ab910da24e Alexander Lobakin 2023-06-20  22  	u32 len;
58f0ab910da24e Alexander Lobakin 2023-06-20  23  
58f0ab910da24e Alexander Lobakin 2023-06-20  24  	len = READ_ONCE(pp->netdev->mtu) + LIBIE_RX_LL_LEN;
58f0ab910da24e Alexander Lobakin 2023-06-20  25  	len = ALIGN(len, LIBIE_RX_BUF_LEN_ALIGN);
58f0ab910da24e Alexander Lobakin 2023-06-20  26  	len = clamp(len, LIBIE_MIN_RX_BUF_LEN, pp->max_len);
58f0ab910da24e Alexander Lobakin 2023-06-20  27  
58f0ab910da24e Alexander Lobakin 2023-06-20  28  	return len;
58f0ab910da24e Alexander Lobakin 2023-06-20  29  }
58f0ab910da24e Alexander Lobakin 2023-06-20  30  

:::::: The code at line 21 was first introduced by commit
:::::: 58f0ab910da24eae9c4021b2ebac59d8cc8cc905 libie: add Rx buffer management (via Page Pool)

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Alexander Lobakin <aleksander.lobakin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
