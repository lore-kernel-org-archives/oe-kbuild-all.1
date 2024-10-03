Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA94126C00
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 07:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727940503; cv=none; b=VmhlpEcSCpg460HbhdsgiCEBAAnvcqTMy69dgQUzgBfYvXcbcTYXgUZCkCnvb0vyCAAW/W6HeGTn611jepqjDgbvePnXTd5IYlhS0Fcqj/8x59Jh00bMw4j+uPAdWBZ9uWaPR7U2C9g6Z4e+hYbKjXV2wGEZM6SRVoAkJ9vkqiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727940503; c=relaxed/simple;
	bh=HZ8WgsdqBR0ue87mPsnHwXXBB2ZSxgBMnkVETg1A9+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GDn7B4p/00/TCKsVZZq32dvnQdtrkMjDE1y1804N/iBiEoYFpCSEaT8lgWGwH4U9YqRzOfCB93rhzKK5EodpMcTE9FvKw5eqv0csJmbbjUQQwg7lhmbyjXcQ0sRIAi/YuSl2LUnRNdYYZOCMr/18m4Gb3m8seqPYJ7iqFR9udbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTm42B5i; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTm42B5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727940501; x=1759476501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HZ8WgsdqBR0ue87mPsnHwXXBB2ZSxgBMnkVETg1A9+s=;
  b=YTm42B5iA6yAreRunzb6or6SziGw6Ew3cwvzgSXUG0Mrwo1zT7yb7+s7
   JPveLijpFOYx9seXphQkyTyivCQsiM7E0fELDHQ1jHqHZFP7MaoTd0Tac
   LNXFrr3/HEDxpNMyAnwoy4sYKVgJh6d6pxwsFXXnj7ZSV7sNjpe8nZIKE
   LiOkCngAPDC068O38HT/X1prgbta69b1JKWgi4wtn8Ed6zc6CQ1hJLW0R
   mkHuKjw8bhwW8veAPUIPAaWYzYZQT702hiVuzb2IrogjOFQ9Eh2XZWhQk
   f27SGQfQLUG9bGzBdmPa9OIbZzIyGl3xZD9k4IzyGOBCpOlzYiOYLGseH
   Q==;
X-CSE-ConnectionGUID: 8r1vEZOXQxSqb5SO2Wa/fg==
X-CSE-MsgGUID: Nhefb/x5RpWBidWCqkDxZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37788600"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="37788600"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 00:28:20 -0700
X-CSE-ConnectionGUID: +waLSjYFQMeXols58aVJ9g==
X-CSE-MsgGUID: ZpQug1gfR3a5ea+VZEPBKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="78279348"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Oct 2024 00:28:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swGG1-0000AA-1Y;
	Thu, 03 Oct 2024 07:28:17 +0000
Date: Thu, 3 Oct 2024 15:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4741/16788]
 drivers/soc/fsl/dpio/qbman-portal.c:1142: Error: no such instruction: `dc
 cvac,%ecx'
Message-ID: <202410031533.CsizlbLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: ecf345f453d79979725e6a41fd7f8283835d1fdf [4741/16788] soc: fsl: dpio: enable qbman CENA portal memory access
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241003/202410031533.CsizlbLE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031533.CsizlbLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031533.CsizlbLE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/qbman-portal.c: In function 'qbman_swp_enqueue_multiple_desc_direct':
   drivers/soc/fsl/dpio/qbman-portal.c:874:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     874 |         addr_cena = (uint64_t)s->addr_cena;
         |                     ^
   drivers/soc/fsl/dpio/qbman-portal.c:876:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     876 |                 dccvac((uint64_t *)(addr_cena +
         |                        ^
   drivers/soc/fsl/dpio/qbman-portal.c:174:58: note: in definition of macro 'dccvac'
     174 | #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
         |                                                          ^
   drivers/soc/fsl/dpio/qbman-portal.c: In function 'qbman_swp_enqueue_multiple_direct':
   drivers/soc/fsl/dpio/qbman-portal.c:729:1: warning: unsupported size for integer register
     729 | }
         | ^
   drivers/soc/fsl/dpio/qbman-portal.c: Assembler messages:
>> drivers/soc/fsl/dpio/qbman-portal.c:1142: Error: no such instruction: `dc cvac,%ecx'
>> drivers/soc/fsl/dpio/qbman-portal.c:1497: Error: no such instruction: `dc cvac,%edi'
>> drivers/soc/fsl/dpio/qbman-portal.c:178: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:178: Error: no such instruction: `dc ivac,%esi'
>> drivers/soc/fsl/dpio/qbman-portal.c:178: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:178: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:178: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:178: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:722: Error: no such instruction: `dc cvac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:876: Error: no such instruction: `dc cvac,%eax'
>> drivers/soc/fsl/dpio/qbman-portal.c:475: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:178: Error: no such instruction: `dc ivac,%eax'
>> drivers/soc/fsl/dpio/qbman-portal.c:178: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:475: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:178: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:475: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:178: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:475: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:178: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:475: Error: no such instruction: `dc cvac,%ebx'
>> drivers/soc/fsl/dpio/qbman-portal.c:178: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:475: Error: no such instruction: `dc cvac,%edx'


vim +1142 drivers/soc/fsl/dpio/qbman-portal.c

  1109	
  1110	/**
  1111	 * qbman_swp_pull_direct() - Issue the pull dequeue command
  1112	 * @s: the software portal object
  1113	 * @d: the software portal descriptor which has been configured with
  1114	 *     the set of qbman_pull_desc_set_*() calls
  1115	 *
  1116	 * Return 0 for success, and -EBUSY if the software portal is not ready
  1117	 * to do pull dequeue.
  1118	 */
  1119	static
  1120	int qbman_swp_pull_direct(struct qbman_swp *s, struct qbman_pull_desc *d)
  1121	{
  1122		struct qbman_pull_desc *p;
  1123	
  1124		if (!atomic_dec_and_test(&s->vdq.available)) {
  1125			atomic_inc(&s->vdq.available);
  1126			return -EBUSY;
  1127		}
  1128		s->vdq.storage = (void *)(uintptr_t)d->rsp_addr_virt;
  1129		if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000)
  1130			p = qbman_get_cmd(s, QBMAN_CENA_SWP_VDQCR);
  1131		else
  1132			p = qbman_get_cmd(s, QBMAN_CENA_SWP_VDQCR_MEM);
  1133		p->numf = d->numf;
  1134		p->tok = QMAN_DQ_TOKEN_VALID;
  1135		p->dq_src = d->dq_src;
  1136		p->rsp_addr = d->rsp_addr;
  1137		p->rsp_addr_virt = d->rsp_addr_virt;
  1138		dma_wmb();
  1139		/* Set the verb byte, have to substitute in the valid-bit */
  1140		p->verb = d->verb | s->vdq.valid_bit;
  1141		s->vdq.valid_bit ^= QB_VALID_BIT;
> 1142		dccvac(p);
  1143	
  1144		return 0;
  1145	}
  1146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
