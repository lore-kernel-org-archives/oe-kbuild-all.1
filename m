Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530530;
	b=aJlaroJ9b7kQmNQEG2A8hPPFgWxyez7o8ocmJW4QY6PL4vCd3g8z+Kg05KgUxCW6FGM7
	 tOjd5uwTcVQwf4lwJL6WFBz/Y65stP9YkwWIvipjdW4bIskkgzwgQW3cuvk9lHkTB0Of/
	 GlG1MrT4IUpbaak0WCEDvIqQRVCIIp2p+hpHPCxmftZu/Rdd9RKvo+7JDIHzXDzt7eBkq
	 sBENOgXlDJD54dzBD8JbSxbiaUHrIMnZfVbPnL6jRKuLOWyxn4QWkpI0LfZbISLSdnAP9
	 IU9d+gTmAEWgJqYAs8rEspJFAITpXLjH55E5+nbdXLmxo+o3FYRIor+5lZUMgmBzDlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530530;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZGMjdc7j7XOiqxhJ/siQVra40s1SvFGSa7BDGbh8Ju0=;
	b=fn1UQ614ctDbzPop1vrALF101VVUpsxZ1LMuuzmhMlWpBG6ssZT3r/9d0ndLXehQeb//
	 gB7/39YwstPF/24r71JR3RXmNS0LE46UgQyjxlH2wUTL5p3dZyWIX4V+UZVZDXAMO3Fmo
	 g4+sbfCBc/JOitEHVZjZk6yBSHelKgEVLdIX/L6GVWF6WIfZPySUV9l2vzZdz3AHVfHjR
	 fZRkrmlW75CvZWjk0KXXvZRSMOcV/dYIYV/PkLW1HcIC+48PxeChoEn7g96s12Y2TM/MM
	 sws/HAXF5u5iCtAmpBi368jcK+1mphn38+LQKwU0Fh4OomH3wXvmh8SblXg06zhRXNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="cQVD4F/b";
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857F3606A31D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 21:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857F3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQVD4F/b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792530530; x=1824066530;
  h=date:from:to:cc:subject:message-id;
  bh=uBAma5FT/r3w8l1CbmHmskv3/km7hsSdiomcHMLyzKI=;
  b=cQVD4F/byyMOb3YBfWGHdHZDavyHxUjOBMFpGxXsBPGbgV1FTQAHML6t
   nxeg8YHKU/LelJP5BNStOWTA8zUinrktLUItFIEWA87FBo1eR576c4y8k
   QUtfpOvpQ19LHQVDtcVq91QhKNhCh6VniWXiTfq65/v425/g9ogPAdGrA
   x6OXWEbUeaJR2eQyQjIIIwlD71NyWOKbGStUplCokj3hLXCwHfG+vz1oH
   TXgkAY/viA/99xfPxtC5qhGSH86x2uHmatUY+N+rkNO3Fqc0h9zc/GF7s
   aOrp6Z8xLDn4e8IHRdN/kxPFF50s0WPCxwCcGaUBqEM6wKaavjAxVxwY5
   g==;
X-CSE-ConnectionGUID: VZ+vgCI3TfmRIqpxtGXvbA==
X-CSE-MsgGUID: 4jDruVSpQ6GKE3U+527R1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1150102"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1150102"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:08:49 -0700
X-CSE-ConnectionGUID: JoIR90OMR2CaJ1XhGv9ong==
X-CSE-MsgGUID: eW1Qd23kQ3igCy4rGegZkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2971454"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Oct 2026 14:08:48 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJH4f-000000006RD-0src;
	Tue, 20 Oct 2026 21:08:45 +0000
Date: Tue, 20 Oct 2026 23:08:30 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 16/146]
 ./include/linux/bpf_unwind.h:208:58: warning: cast from pointer to integer of
 different size
Message-ID: <202610202350.BpzqzMcN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux fermata
head:   7b45e27f0f0faaa13da429815b6143b99eaa232c
commit: 298cbd7a71382598da5e693b292ee87ee7d98a91 [16/146] bpf: Call the callback of bpf_loop with a pad
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261020/202610202350.BpzqzMcN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610202350.BpzqzMcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610202350.BpzqzMcN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/bpf_iter.c:8:
   kernel/bpf/bpf_iter.c: In function '____bpf_loop':
>> ./include/linux/bpf_unwind.h:208:58: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     208 |         (r0) = ((bpf_callback_t)(void *)(fn))((u64)(a1), (u64)(a2), (u64)(a3),  \
         |                                                          ^
   ./include/linux/bpf_unwind.h:224:9: note: in expansion of macro '__bpf_call_cb'
     224 |         __bpf_call_cb(__bpf_callback_fn, fn, a1, a2, a3, a4, a5, r0, unwound)
         |         ^~~~~~~~~~~~~
   kernel/bpf/bpf_iter.c:770:17: note: in expansion of macro 'bpf_call_cb'
     770 |                 bpf_call_cb(callback, i, callback_ctx, 0, 0, 0, ret, unwound);
         |                 ^~~~~~~~~~~


vim +208 ./include/linux/bpf_unwind.h

cbfc8bbcca60fe1 Kumar Kartikeya Dwivedi 2026-10-20  205  
cbfc8bbcca60fe1 Kumar Kartikeya Dwivedi 2026-10-20  206  #define __bpf_call_cb(type, fn, a1, a2, a3, a4, a5, r0, unwound)		\
cbfc8bbcca60fe1 Kumar Kartikeya Dwivedi 2026-10-20  207  do {										\
cbfc8bbcca60fe1 Kumar Kartikeya Dwivedi 2026-10-20 @208  	(r0) = ((bpf_callback_t)(void *)(fn))((u64)(a1), (u64)(a2), (u64)(a3),	\
cbfc8bbcca60fe1 Kumar Kartikeya Dwivedi 2026-10-20  209  					      (u64)(a4), (u64)(a5));		\
cbfc8bbcca60fe1 Kumar Kartikeya Dwivedi 2026-10-20  210  	if (0)									\
cbfc8bbcca60fe1 Kumar Kartikeya Dwivedi 2026-10-20  211  		goto unwound;							\
cbfc8bbcca60fe1 Kumar Kartikeya Dwivedi 2026-10-20  212  } while (0)
cbfc8bbcca60fe1 Kumar Kartikeya Dwivedi 2026-10-20  213  

:::::: The code at line 208 was first introduced by commit
:::::: cbfc8bbcca60fe17eb1ec6e737d2bb6cad07e585 bpf: Give a helper a way to call its callback with a pad

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
