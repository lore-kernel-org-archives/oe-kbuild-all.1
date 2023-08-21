Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32E320F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 17:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692639829; x=1724175829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L1kaKABsoA/wQXLMhglLz2Do4ieEAgTULGi5YS2+kVE=;
  b=YehzjXpAKTslpmyjsAb/zib5Oi3pamvzAAN/ldq7KUHSOIIUzp516z4z
   pULrHZlyEc6q3d6DkxA/N98+7i7l9sYooizjvFKQsfcq0QHba/g5lWJgx
   ysx7kVgPLI3r0lIZbxRI2xLKJUebQQLDSR5H5jvvp/eEtBTxJZd4y+fro
   mrswBwwzR3IFTiggvPfHXrXjp4zdGQg7r71aCHfgs9Z/LyerGYFnzmDsA
   +t7nX0Wu7Jqt6pHgigMxvkU2O7/6A4+oYJM9i55tQQuU8p4Da4cfqMRO8
   JtXoAYFSdT6AN5EgkLBtek4TUDPHxRigK0krRhhpDlVqC+vPs9gg9GODa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371090659"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="371090659"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 10:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="859562798"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="859562798"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Aug 2023 10:43:43 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY8wI-0000km-1j;
	Mon, 21 Aug 2023 17:43:42 +0000
Date: Tue, 22 Aug 2023 01:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 10809/11214] fs/smb/server/smb2pdu.c:4149:
 warning: Excess function parameter 'infoclass_size' description in
 'buffer_check_err'
Message-ID: <202308220116.C2UzYhrZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: 6b26a13565d05a90d3b84267359750ab6c4c6d5a [10809/11214] ksmbd: add support for read compound
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230822/202308220116.C2UzYhrZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220116.C2UzYhrZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220116.C2UzYhrZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/smb2pdu.c:4149: warning: Excess function parameter 'infoclass_size' description in 'buffer_check_err'


vim +4149 fs/smb/server/smb2pdu.c

e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4136  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4137  /**
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4138   * buffer_check_err() - helper function to check buffer errors
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4139   * @reqOutputBufferLength:	max buffer length expected in command response
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4140   * @rsp:		query info response buffer contains output buffer length
e230d013378489 fs/ksmbd/smb2pdu.c      Yang Li     2021-12-21  4141   * @rsp_org:		base response buffer pointer in case of chained response
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4142   * @infoclass_size:	query info class response buffer size
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4143   *
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4144   * Return:	0 on success, otherwise error
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4145   */
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4146  static int buffer_check_err(int reqOutputBufferLength,
cb4517201b8acd fs/ksmbd/smb2pdu.c      Namjae Jeon 2021-11-03  4147  			    struct smb2_query_info_rsp *rsp,
6b26a13565d05a fs/smb/server/smb2pdu.c Namjae Jeon 2023-08-11  4148  			    void *rsp_org)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16 @4149  {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4150  	if (reqOutputBufferLength < le32_to_cpu(rsp->OutputBufferLength)) {
bde1694aecdb53 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-06-28  4151  		pr_err("Invalid Buffer Size Requested\n");
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4152  		rsp->hdr.Status = STATUS_INFO_LENGTH_MISMATCH;
cb4517201b8acd fs/ksmbd/smb2pdu.c      Namjae Jeon 2021-11-03  4153  		*(__be32 *)rsp_org = cpu_to_be32(sizeof(struct smb2_hdr));
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4154  		return -EINVAL;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4155  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4156  	return 0;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4157  }
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon 2021-03-16  4158  

:::::: The code at line 4149 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
