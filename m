Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8916E3911D3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 22:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562326; cv=none; b=gcDh8EIaJj24x8b9qR3ZDdYrXhx9BU7RH/BKjBrJqAqVUfXYpMANgreU18nJFF2B8LXAefGelsAbjkdz0bzaXpyMfqQRIaDZoAX1vovb991DFAA3IOa21YPyBYED0qjI8VxGDOkQCqnVqwxF8JyouVpN2cS4cSv8p+IeIy6RLWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562326; c=relaxed/simple;
	bh=pw0X5gPT40N1oBLMrHIbs4+lDQXJ3ziZY5TvvDwCz9o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=srjNX3YbEzL0DI0CqwNQrctkQ24bQNE11MDH6sKyoO6iiamezKg7oC8qlkBKDnVeJQakjRmJuyjT7hs0kx1Rpu9+RjSMaf+fVtBNH6iJKt5zs6J4MahQSF3yx/9vR5KYOO9AY47fYO/qAC8rDZY2nxO/D88wKG82bNRploDp6Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hk42yBe5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hk42yBe5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788562324; x=1820098324;
  h=date:from:to:cc:subject:message-id;
  bh=pw0X5gPT40N1oBLMrHIbs4+lDQXJ3ziZY5TvvDwCz9o=;
  b=Hk42yBe5Hi5i6zns6wC9oEJ4wZO8hQQONPSEhX38DYvPrBs965dddsDe
   gNFOrchrsh3UKy6ST3jQ33GknqDKfhfYVv5VbL9uXad4vFr/FUQBR7k03
   ZkBSLw5qHTwvr0LG0BBXk3ww6P4596TGxXkQ7b2PoBQjPvl3tGsXWraJ7
   oH0PLvR8LqiiFokZ633EH1ON4cAMqJmw62IKMX/kD/88ZD1Bg/ZZLXt/0
   lczfIxrarcFE3sFoxnxP9vWjXCcwmGL8lUqi0NaN571HcUYuHePlmDQCx
   FvbbRuglx+hsr7HueHs+IHROxYZCCnQzTP2NzKFccKwIcyfKI6k+SvwOm
   g==;
X-CSE-ConnectionGUID: ioBrd+M4TfSpi7wXOHMdlg==
X-CSE-MsgGUID: TcDp6X2SQfWfyqMEjvcxcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88945906"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88945906"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 15:52:03 -0700
X-CSE-ConnectionGUID: MchPAg+hSpi2EFoF5/rsgQ==
X-CSE-MsgGUID: 5muhWmXOSKeQ8iSz/+YCsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="266905049"
Received: from igk-lkp-server01.igk.intel.com (HELO bcd5fd227bc8) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 Sep 2026 15:52:02 -0700
Received: from kbuild by bcd5fd227bc8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2clL-00000000091-1yBn;
	Fri, 04 Sep 2026 22:51:59 +0000
Date: Sat, 05 Sep 2026 00:51:52 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 51/87] net/ceph/databuf.c:63:23:
 warning: variable 'part' is uninitialized when used within its own
 initialization
Message-ID: <202609050036.jr6Iabxa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   376ad9d4942bf11500931178bbeb965348f01057
commit: af8c3f8a557313c0292b31d7dc1183647bf12100 [51/87] libceph: Add a new data container type, ceph_databuf
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260905/202609050036.jr6Iabxa-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050036.jr6Iabxa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050036.jr6Iabxa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ceph/databuf.c:63:23: warning: variable 'part' is uninitialized when used within its own initialization [-Wuninitialized]
      63 |                         size_t part = umin(part, enc->space);
         |                                ~~~~        ^~~~
   include/linux/minmax.h:121:22: note: expanded from macro 'umin'
     121 |         __careful_cmp(min, (x) + 0u + 0ul + 0ull, (y) + 0u + 0ul + 0ull)
         |                             ^
   include/linux/minmax.h:98:25: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                ^
   include/linux/minmax.h:92:13: note: expanded from macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                    ^
   1 warning generated.


vim +/part +63 net/ceph/databuf.c

    44	
    45	/**
    46	 * ceph_bvecq_append - Append some data onto a buffer
    47	 * @enc: The encoding context
    48	 * @data: The data to append
    49	 * @len: The length of the data
    50	 *
    51	 * Add some data onto the end of the encoding buffer's occupied region.  This
    52	 * will expand the maximum size of the buffer if necessary.
    53	 *
    54	 * If ENOMEM is encountered, enc->nomem is set to true and all future appends
    55	 * will do nothing.
    56	 */
    57	void ceph_bvecq_append(struct ceph_encode *enc, const void *data, size_t len)
    58	{
    59		for (;;) {
    60			struct bvecq *bq;
    61	
    62			if (likely(len <= enc->space)) {
  > 63				size_t part = umin(part, enc->space);
    64	
    65				memcpy(enc->p, data, len);
    66				enc->p += len;
    67				enc->space -= len;
    68				enc->len += len;
    69	
    70				if (part >= len)
    71					return;
    72				data += part;
    73				len -= part;
    74			}
    75	
    76			if (enc->p)
    77				kunmap_local(enc->p);
    78	
    79			if (unlikely(enc->nomem))
    80				return;
    81			if (ceph_bvecq_reserve(enc, len) < 0) {
    82				enc->p = NULL;
    83				enc->nomem = true;
    84				return;
    85			}
    86	
    87			enc->slot++;
    88			bq = enc->bq;
    89			if (enc->slot >= bq->nr_slots) {
    90				bq = bq->next;
    91				enc->bq = bq;
    92				enc->slot = 0;
    93			}
    94			enc->space = bq->bv[enc->slot].bv_len;
    95			enc->p = kmap_local_bvecq(enc->bq, 0);
    96		}
    97	}
    98	EXPORT_SYMBOL(ceph_bvecq_append);
    99	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
