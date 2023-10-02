Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4153EAEA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696251418; x=1727787418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NEgtySKddol7hj/Vb2ZJLXQI+bWqCOfjDC/T42kb3c4=;
  b=gxhNyn3c4pTg/erTLPxJL2cF4Pj4NXWie7pcVRqTYz+HOMfRsVCPFMLT
   TVB5KLCMihOnBrJdemXnTUG5jqfCDrqGK1RW34Z+rXE73kCb6lKxEWNo+
   p7vTbjMe+e5fX5SNpRM+ooKJHZv3SbGaOba8zR1auCsyEWnPH/YyhJap8
   xDZgU1xBV9xR+yBKOVpOtlR5J3lg39mlbNg2XbY0X+pQnrxKs9GThzIO5
   Coa6/LwUl0HtXccUd2tPMB3d+CH+GjngPLLLLyxYHBaq6hE4/B3uEfog5
   KyKqukXrdezVSsC4nGlUmW5yBOjMOBOdfJJRldhyJ9vxW4wrv3PClZNiA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1217211"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="1217211"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 05:56:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="744106747"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="744106747"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Oct 2023 05:56:56 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnITl-00064T-2N;
	Mon, 02 Oct 2023 12:56:53 +0000
Date: Mon, 2 Oct 2023 20:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 21/34] fs/netfs/crypto.c:89:1: warning: the
 frame size of 1040 bytes is larger than 1024 bytes
Message-ID: <202310022029.TZTszK58-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   8b08a7e2d3217f7054808246fc559c867f54a524
commit: bf516b221db7efc9fed8862b3ebba720c0ff9d79 [21/34] netfs: Perform content encryption
config: arm-randconfig-004-20231002 (https://download.01.org/0day-ci/archive/20231002/202310022029.TZTszK58-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310022029.TZTszK58-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310022029.TZTszK58-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/netfs/crypto.c: In function 'netfs_encrypt':
>> fs/netfs/crypto.c:89:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
      89 | }
         | ^


vim +89 fs/netfs/crypto.c

    34	
    35	/*
    36	 * Prepare a write request for writing.  We encrypt in/into the bounce buffer.
    37	 */
    38	bool netfs_encrypt(struct netfs_io_request *wreq)
    39	{
    40		struct netfs_inode *ctx = netfs_inode(wreq->inode);
    41		struct scatterlist source_sg[16], dest_sg[16];
    42		unsigned int n_dest;
    43		size_t n, chunk, bsize = 1UL << ctx->crypto_bshift;
    44		loff_t pos;
    45		int ret;
    46	
    47		_enter("");
    48	
    49		trace_netfs_rreq(wreq, netfs_rreq_trace_encrypt);
    50	
    51		pos = wreq->start;
    52		n = wreq->len;
    53		_debug("ENCRYPT %llx-%llx", pos, pos + n - 1);
    54	
    55		for (; n > 0; n -= chunk, pos += chunk) {
    56			chunk = min(n, bsize);
    57	
    58			ret = netfs_iter_to_sglist(&wreq->io_iter, chunk,
    59						   dest_sg, ARRAY_SIZE(dest_sg));
    60			if (ret < 0)
    61				goto error;
    62			n_dest = ret;
    63	
    64			if (test_bit(NETFS_RREQ_CRYPT_IN_PLACE, &wreq->flags)) {
    65				ret = ctx->ops->encrypt_block(wreq, pos, chunk,
    66							      dest_sg, n_dest,
    67							      dest_sg, n_dest);
    68			} else {
    69				ret = netfs_iter_to_sglist(&wreq->iter, chunk,
    70							   source_sg, ARRAY_SIZE(source_sg));
    71				if (ret < 0)
    72					goto error;
    73				ret = ctx->ops->encrypt_block(wreq, pos, chunk,
    74							      source_sg, ret,
    75							      dest_sg, n_dest);
    76			}
    77	
    78			if (ret < 0)
    79				goto error_failed;
    80		}
    81	
    82		return true;
    83	
    84	error_failed:
    85		trace_netfs_failure(wreq, NULL, ret, netfs_fail_encryption);
    86	error:
    87		wreq->error = ret;
    88		return false;
  > 89	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
