Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF37436A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 01:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEJikjE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697937336; x=1729473336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cMncATncTFYfzhwe6f27hH1TTKagdyeTl7F4cGVbeuk=;
  b=PEJikjE0qaJvQD5JkEmsFYnx/aokwZWCQnIZ56i6F18TdOOEZgvuksYp
   Hy5qdOR1S9NFYSR99yYieuXZQogU2PaWUsK2BEniX+RN3fPTaZpXWOBnO
   59p6e6wE9UU1N5oM3IvNgOpatynnqiEMtxUY8a1zhYabtKO4OGRNJLCjH
   jT3w+ByAacgxGdyjpw31BL6jwKPvx0GByn2VAFuBIF4uDgcOhS6+HIwuq
   xSdGjLu7okxk3m3j/s4bXDyZXIbgi5l0wt3agH3b3vrWExAdH56q7HuHX
   EsiI3ahwZmmZqlF4AsEILz0O+ePmJ3A6sU+w+EfY+oXEr9aevJ3itvX5c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383872720"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="383872720"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 18:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="5713586"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Oct 2023 18:15:33 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quN41-0005S7-02;
	Sun, 22 Oct 2023 01:15:33 +0000
Date: Sun, 22 Oct 2023 09:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH printk v1] printk: ringbuffer: Do not skip
 non-finalized with prb_next_seq()
Message-ID: <202310220840.5Roikkvq-lkp@intel.com>
References: <20231019132545.1190490-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132545.1190490-1-john.ogness@linutronix.de>

Hi John,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on a26f18f291f6c2eac6dac9faa12cc68fd1da5865]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ogness/printk-ringbuffer-Do-not-skip-non-finalized-with-prb_next_seq/20231019-213147
base:   a26f18f291f6c2eac6dac9faa12cc68fd1da5865
patch link:    https://lore.kernel.org/r/20231019132545.1190490-1-john.ogness%40linutronix.de
patch subject: [RFC PATCH printk v1] printk: ringbuffer: Do not skip non-finalized with prb_next_seq()
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20231022/202310220840.5Roikkvq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220840.5Roikkvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220840.5Roikkvq-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/printk/printk_ringbuffer.c: In function '__ulseq_to_u64seq':
>> kernel/printk/printk_ringbuffer.c:1456:42: error: 'prb' undeclared (first use in this function)
    1456 |         u64 rb_first_seq = prb_first_seq(prb);
         |                                          ^~~
   kernel/printk/printk_ringbuffer.c:1456:42: note: each undeclared identifier is reported only once for each function it appears in


vim +/prb +1456 kernel/printk/printk_ringbuffer.c

  1452	
  1453	#define __u64seq_to_ulseq(u64seq) ((u32)u64seq)
  1454	static inline u64 __ulseq_to_u64seq(u32 ulseq)
  1455	{
> 1456		u64 rb_first_seq = prb_first_seq(prb);
  1457		u64 seq;
  1458	
  1459		/*
  1460		 * The provided sequence is only the lower 32 bits of the ringbuffer
  1461		 * sequence. It needs to be expanded to 64bit. Get the first sequence
  1462		 * number from the ringbuffer and fold it.
  1463		 */
  1464		seq = rb_first_seq - ((u32)rb_first_seq - ulseq);
  1465	
  1466		return seq;
  1467	}
  1468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
