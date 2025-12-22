Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C7C1E1A17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 03:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766375176; cv=none; b=GA23qWpN4VBhC8sDJwl7NuE2nQ7Z/86wQgETtP+g0JqW7Rxtv9nH1tLoBmLffExd3cMECqZkE0dvxj5EfMIwYBsahwku0ssBAijSXlWSyrZZtQNHqDqeucM3SIRoD+xtta2vwpmr8W8wFDVPbs1ROsMgSBxE+Q7rDYxYJXuWYdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766375176; c=relaxed/simple;
	bh=CgJbTpp8iVWmhqC5+stOz9WbD8hc1rsG+S/T5Dq+QyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h7I4CsMEeCuI0sut59I1C8pXAmYA19A+dKzIrzasOiWzj9sYZgEoV0iErv4zZa4xpBQrTw/+nsDFIiYrLcwDS3HTUBvQsevmF5hjVA+Di9lGwXpYNFw+R0SuUqp52eu/nIOs/N2EWxGL8Tomhqa6B2sZlU+kChA+J/bJwTWfM0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXHcN6g9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXHcN6g9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766375175; x=1797911175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CgJbTpp8iVWmhqC5+stOz9WbD8hc1rsG+S/T5Dq+QyQ=;
  b=gXHcN6g9fPDPhqo/WCaBhcrWQOCvn0RD20vjzN49dnHh8vlFmsMR227q
   4pwAUhpnl4Czp3UGAlBnBQWVvNMCwk1x9HToeTG5hXimL0TtUVVOkzfx8
   /tW4xRdk83vMux/AK5cnc2GFERkCCcZc90NwvsHPPw/ipgXVJ7E5Dn1j2
   nnbLPtl1PEhYEeWhW9XzhQT1zi92edOmK7f4y1rln5//yZd4rLlhhb8R6
   YgckSBYhrChcvXBS1A1LzBPiIuavMVwVDFjhBfpuaY1ZNxxw85NEvPztu
   D4PgW133CQm2TasN2t1xEb9rJyEktAcaEKDiHQEfrWnRV8pWTHszrLQKv
   w==;
X-CSE-ConnectionGUID: njD0UquCTzOFG9V1aMOxFg==
X-CSE-MsgGUID: liqVaDhjTdSc55xhVs73SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78550619"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="78550619"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 19:46:15 -0800
X-CSE-ConnectionGUID: jGbCAbZGR5GiMCsen/XRMQ==
X-CSE-MsgGUID: i5EScaTbQjCgLqScq4dzMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230439352"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Dec 2025 19:46:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXWs7-000000005Lw-0JHD;
	Mon, 22 Dec 2025 03:46:11 +0000
Date: Mon, 22 Dec 2025 04:46:04 +0100
From: kernel test robot <lkp@intel.com>
To: hungkien05 <nguyenhunghnuekt@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:pr/24 1/1] arch/x86/kvm/emulate.c:1759:11: error:
 expected expression before '/' token
Message-ID: <202512220433.9D9gTDtt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa pr/24
head:   dcd699a99ce2f40e50263e0ec438e3b57b133598
commit: dcd699a99ce2f40e50263e0ec438e3b57b133598 [1/1] Fix potential vulnerability in cloned code (arch/x86/kvm/emulate.c)
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251222/202512220433.9D9gTDtt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220433.9D9gTDtt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220433.9D9gTDtt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kvm/emulate.c: In function 'load_segment_descriptor':
>> arch/x86/kvm/emulate.c:1741:9: warning: "/*" within comment [-Wcomment]
    1741 |         /*
>> arch/x86/kvm/emulate.c:1759:11: error: expected expression before '/' token
    1759 |          */
         |           ^


vim +1759 arch/x86/kvm/emulate.c

  1733	
  1734	static int load_segment_descriptor(struct x86_emulate_ctxt *ctxt,
  1735					   u16 selector, int seg)
  1736	{
  1737		u8 cpl = ctxt->ops->cpl(ctxt);
  1738	
  1739	
  1740		/*
> 1741		/*
  1742		 * None of MOV, POP and LSS can load a NULL selector in CPL=3, but
  1743		 * None of MOV, POP and LSS can load a NULL selector in CPL=3, but
  1744		 * they can load it at CPL<3 (Intel's manual says only LSS can,
  1745		 * they can load it at CPL<3 (Intel's manual says only LSS can,
  1746		 * but it's wrong).
  1747		 * but it's wrong).
  1748		 *
  1749		 *
  1750		 * However, the Intel manual says that putting IST=1/DPL=3 in
  1751		 * However, the Intel manual says that putting IST=1/DPL=3 in
  1752		 * an interrupt gate will result in SS=3 (the AMD manual instead
  1753		 * an interrupt gate will result in SS=3 (the AMD manual instead
  1754		 * says it doesn't), so allow SS=3 in __load_segment_descriptor
  1755		 * says it doesn't), so allow SS=3 in __load_segment_descriptor
  1756		 * and only forbid it here.
  1757		 * and only forbid it here.
  1758		 */
> 1759		 */
  1760		if (seg == VCPU_SREG_SS && selector == 3 &&
  1761		if (seg == VCPU_SREG_SS && selector == 3 &&
  1762		    ctxt->mode == X86EMUL_MODE_PROT64)
  1763		    ctxt->mode == X86EMUL_MODE_PROT64)
  1764			return emulate_exception(ctxt, GP_VECTOR, 0, true);
  1765			return emulate_exception(ctxt, GP_VECTOR, 0, true);
  1766	
  1767	
  1768		return __load_segment_descriptor(ctxt, selector, seg, cpl,
  1769						 X86_TRANSFER_NONE, NULL);
  1770	}
  1771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
