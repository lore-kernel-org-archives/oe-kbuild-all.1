Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C44A940
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692793198; x=1724329198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wfjnevqxPpou3RcTF1BUkkopk4lQlkE/NUOux/NGZ7s=;
  b=IKop2g3fiRo7qgrg7F7GIuAo3aBG4T4Btygkgl1H4s/9YBUFxZUiXcE1
   lD4vBfGZ4gVUJM65VTmoKNZHkyVy8X5ql3u2/wzY3HMe+bfBzuKlIv4E5
   wKRxzKMnnpFNxCxVhAUItgt0A1/5nfGk6H+G2xW9IlTYMMFUzyggaShfv
   p1oBeMOZ/MXHJ4doKuIwpe2ExlhjqPHIKmgMZ6Q9ZhnM3d8y+zcyuMfgR
   Yx1Kd63wOEf6w3T4BKVZ0EENg7IcnSllYqzkhHgdFu1211P82V6HUFRUM
   LGaif9W+OFSv69NBOpbdjKJm5NDIyEjxKi7hpoN9Q+/RGVXdQXCTx9JtJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="438081768"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="438081768"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 05:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="802086803"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="802086803"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 23 Aug 2023 05:19:55 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYmq3-0001BQ-0b;
	Wed, 23 Aug 2023 12:19:55 +0000
Date: Wed, 23 Aug 2023 20:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm_buf 24/25] drivers/char/tpm/tpm-buf.c:176:16:
 sparse: sparse: cast to restricted __be16
Message-ID: <202308232048.CHgYYDuz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm_buf
head:   a1d8288229c7c1acfe0b2acf8107eaad8f49e070
commit: 9976c4e1af56380aaa5ac3eb3b717176d70bd2b3 [24/25] tpm: Add tpm_buf_read_{u8,u16,u32}
config: sh-randconfig-r122-20230823 (https://download.01.org/0day-ci/archive/20230823/202308232048.CHgYYDuz-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232048.CHgYYDuz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232048.CHgYYDuz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/tpm/tpm-buf.c:176:16: sparse: sparse: cast to restricted __be16
>> drivers/char/tpm/tpm-buf.c:176:16: sparse: sparse: cast to restricted __be16
>> drivers/char/tpm/tpm-buf.c:176:16: sparse: sparse: cast to restricted __be16
>> drivers/char/tpm/tpm-buf.c:176:16: sparse: sparse: cast to restricted __be16
>> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted __be32
>> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted __be32
>> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted __be32
>> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted __be32
>> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted __be32
>> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted __be32

vim +176 drivers/char/tpm/tpm-buf.c

   162	
   163	/**
   164	 * tpm_buf_read_u16() - Read 16-bit word from a TPM buffer
   165	 * @buf:	&tpm_buf instance
   166	 * @offset:	offset within the buffer
   167	 *
   168	 * Return: next 16-bit word
   169	 */
   170	u16 tpm_buf_read_u16(const struct tpm_buf *buf, off_t *offset)
   171	{
   172		u16 value;
   173	
   174		tpm_buf_read(buf, offset, sizeof(value), &value);
   175	
 > 176		return be16_to_cpu(value);
   177	}
   178	EXPORT_SYMBOL_GPL(tpm_buf_read_u16);
   179	
   180	/**
   181	 * tpm_buf_read_u32() - Read 32-bit word from a TPM buffer
   182	 * @buf:	&tpm_buf instance
   183	 * @offset:	offset within the buffer
   184	 *
   185	 * Return: next 32-bit word
   186	 */
   187	u32 tpm_buf_read_u32(const struct tpm_buf *buf, off_t *offset)
   188	{
   189		u32 value;
   190	
   191		tpm_buf_read(buf, offset, sizeof(value), &value);
   192	
 > 193		return be32_to_cpu(value);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
