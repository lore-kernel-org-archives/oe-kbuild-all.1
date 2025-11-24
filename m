Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C06F381C4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 07:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763970294; cv=none; b=WlYOmQbc3vOOyvAAOjL39WmrWpQPscgrtOoK6IXVT4Um/JmaodCFcf8umHFXiTbEQ/2hqfZoIhQKN6ylMhsL0SxyurbzjmxzGDePLKvYMzd+Rh/2Da6qTJT+EnQ5LWwkXvsQUaHTa7/3c+FL1oJtjkEGxeH8VmrHjt5M96PhTIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763970294; c=relaxed/simple;
	bh=DskSrsbuGULqJfIJRZOtr8KRo2BpdQAeKggLzRMBaGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Prz4Jd+nXunoOmkAnTTC8dxXj6w76NMhv/ulS2ALmsV4cnocQoIVNT/mQx2v+nBKkCrqAasXJ3qBb9CfD6iGIUNkGuifl1scaqxFwjphRsdEenMb+6SXwWAt5Z53oOqx0/VZA34yZTQuHbD5EJb/qK79EOF68MKRho4ZBtspX0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L51ChGr+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L51ChGr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763970293; x=1795506293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DskSrsbuGULqJfIJRZOtr8KRo2BpdQAeKggLzRMBaGQ=;
  b=L51ChGr+LFqEDqb6UtBDJSOjOCebl5uy8jn5zkm2Fr0Tr+/wgj5OYteB
   AZForxOCR4wuQf0XA0AYhxuhl1StsklDdTb+xbDdQEOLS/YLXmqxLr+/R
   AdJLnVeAfbMEGs6vVrLOzfc/XEagIKChD/QUe5nnnWS03ox5PfHcKAKD9
   5ZqCsljuQQ2VE6yY8adLUhuGoBHtM5Y80D4y4PgnA55IWrUXMUpH3e9l7
   OCyp+2hwPUiloi2C4sitbYHEODKUf5vOX6O+jpAiDspFbEiP3VjUjvBHE
   WEgaDt6z9x+GD6pZpQXJbxgymp3SNzFu8MiHIIe0HvcTQKvBsi+I55uvA
   g==;
X-CSE-ConnectionGUID: 2csMmFDbTk6zLR7/rn//yQ==
X-CSE-MsgGUID: iGfbWC40SPWnYn4ciEMUNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76576113"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="76576113"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:44:52 -0800
X-CSE-ConnectionGUID: g9Sscr8bRg+mgNHTxQDU1Q==
X-CSE-MsgGUID: qIneXIXwSw6HEMwzfY4YMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196546693"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Nov 2025 23:44:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNRFh-000000000UR-0g9p;
	Mon, 24 Nov 2025 07:44:49 +0000
Date: Mon, 24 Nov 2025 15:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3304/3304] include/linux/sunrpc/xdr.h:606:10:
 warning: result of comparison of constant 4611686018427387903 with
 expression of type '__u32' (aka 'unsigned int') is always false
Message-ID: <202511241524.zGjjHi86-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4a93a68b1fa420e5791d9f16414d427f8dd90fb4
commit: fd2b905e3179865f7a512dfcfe14f10b6067236d [3304/3304] NFSD: prevent integer overflow on 32 bit systems
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251124/202511241524.zGjjHi86-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241524.zGjjHi86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241524.zGjjHi86-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/do_mounts.c:23:
   In file included from include/linux/nfs_fs.h:31:
   In file included from include/linux/sunrpc/auth.h:13:
   In file included from include/linux/sunrpc/sched.h:19:
>> include/linux/sunrpc/xdr.h:606:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     606 |         if (len > SIZE_MAX / sizeof(*p))
         |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +606 include/linux/sunrpc/xdr.h

   584	
   585	/**
   586	 * xdr_stream_decode_uint32_array - Decode variable length array of integers
   587	 * @xdr: pointer to xdr_stream
   588	 * @array: location to store the integer array or NULL
   589	 * @array_size: number of elements to store
   590	 *
   591	 * Return values:
   592	 *   On success, returns number of elements stored in @array
   593	 *   %-EBADMSG on XDR buffer overflow
   594	 *   %-EMSGSIZE if the size of the array exceeds @array_size
   595	 */
   596	static inline ssize_t
   597	xdr_stream_decode_uint32_array(struct xdr_stream *xdr,
   598			__u32 *array, size_t array_size)
   599	{
   600		__be32 *p;
   601		__u32 len;
   602		ssize_t retval;
   603	
   604		if (unlikely(xdr_stream_decode_u32(xdr, &len) < 0))
   605			return -EBADMSG;
 > 606		if (len > SIZE_MAX / sizeof(*p))
   607			return -EBADMSG;
   608		p = xdr_inline_decode(xdr, len * sizeof(*p));
   609		if (unlikely(!p))
   610			return -EBADMSG;
   611		if (array == NULL)
   612			return len;
   613		if (len <= array_size) {
   614			if (len < array_size)
   615				memset(array+len, 0, (array_size-len)*sizeof(*array));
   616			array_size = len;
   617			retval = len;
   618		} else
   619			retval = -EMSGSIZE;
   620		for (; array_size > 0; p++, array++, array_size--)
   621			*array = be32_to_cpup(p);
   622		return retval;
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
