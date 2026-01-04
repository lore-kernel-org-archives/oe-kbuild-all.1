Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B93D211A28
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767536598; cv=none; b=eEmvgxzGS1zuC3a1YdIQywGD8PDdkUb9a40ymmtyrKTVrFJKtO3wLolV4IvJndOxXG36xTz92eO8xv62HvhlT6fsAqjaSUw4y6OzF2CSfXVa8QGW+s+AMimoeexA8M8vR8sCBDBW8FZ9Idrcdev4EQgH6SpsIUNn05S0gs5hnX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767536598; c=relaxed/simple;
	bh=uDTzETNPSbBmswl0C78uGlgyaQ6MTacZCC8vgMPFFb4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DjoIEpLoopuDH22Mo11wEsGWr9wJ44Yk4OFahXi6XNLSVkMl8QpG+zOxPXb5uFFbsCSRDFPgU08TzTe3nh9wIIHQDUbZArbaNYWZhlDpFaOpvd4WoX6xnfHKFEt+EA+FmFKWJ3qNfpe+UCx2+UWDuvH/JxR3b0cRxQ0+Hii3KMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmrGLA3E; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmrGLA3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767536596; x=1799072596;
  h=date:from:to:cc:subject:message-id;
  bh=uDTzETNPSbBmswl0C78uGlgyaQ6MTacZCC8vgMPFFb4=;
  b=OmrGLA3EwEg6TP4O41goaDMMTfBgF3bA65/F+IPXZsG2x97k/nEGAMm/
   Z7y575WkQgb8RjMKvTlgCKI+mvuteRydKfZpI0oyjLMljvdRcOZOtPz/p
   MX5FVHNa786c8ViE4fZAEbr+p+wIdl0LGMnydPpPJLzLFScVVTmcuD+/6
   frPjgngPoDbwabQIzwkR4rgZXCP/A6haodCrR/t0XeGlwGqNOZex7Dhx8
   iXaqMZ3R8DT9P24elexRl2vyxu5zD62OWBmsO849gwpvIlFCeFbNtw1un
   1TZj3653EVLz/r+3Jg/KGGOvffd8k5C3rsxD1XcFInVtplV8Ub7hClAe+
   A==;
X-CSE-ConnectionGUID: AE1neCNlRqiLHx26Ui/NIg==
X-CSE-MsgGUID: lN85flzUSo6cYnOH5Ti6WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69001765"
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="69001765"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 06:23:15 -0800
X-CSE-ConnectionGUID: JeEVM6McTti5iJqiU0CmCw==
X-CSE-MsgGUID: 467hWLCAS36vUhfzt8lhfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="202221294"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Jan 2026 06:23:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcP0g-000000000cD-3NJm;
	Sun, 04 Jan 2026 14:23:10 +0000
Date: Sun, 04 Jan 2026 22:22:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 96/115] fs/bcachefs/data/ec.c:1711:2:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202601042217.zq9xE5G2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   c8443102a129f8cf440d2e0e02ee631753f16327
commit: 60ec49d3d5c5f92d0abff0a4886461be69672af3 [96/115] bcachefs: BCH_WRITE_must_ec, alloc_request.ec_replicas
config: hexagon-randconfig-r112-20260104 (https://download.01.org/0day-ci/archive/20260104/202601042217.zq9xE5G2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601042217.zq9xE5G2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601042217.zq9xE5G2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/data/ec.c:1711:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1711 |         unsigned long rw_devs_change_count = READ_ONCE(c->allocator.rw_devs_change_count);
         |         ^
   1 warning generated.

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/data/ec.c:1711:9: sparse: sparse: typename in expression
   fs/bcachefs/data/ec.c:1711:18: sparse: sparse: Expected ; at end of statement
   fs/bcachefs/data/ec.c:1711:18: sparse: sparse: got long
   fs/bcachefs/data/ec.c:1711:46: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1711:46: sparse: sparse: got 0
>> fs/bcachefs/data/ec.c:1711:46: sparse: sparse: Trying to use reserved word 'while' as identifier
   fs/bcachefs/data/ec.c:1711:46: sparse: sparse: Expected ) in nested declarator
   fs/bcachefs/data/ec.c:1711:46: sparse: sparse: got volatile
>> fs/bcachefs/data/ec.c:1711:46: sparse: sparse: Trying to use reserved word 'const' as identifier
   fs/bcachefs/data/ec.c:1711:46: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1711:46: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1712:14: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1712:14: sparse: sparse: got ->
>> fs/bcachefs/data/ec.c:1712:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/data/ec.c:1714:18: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1714:18: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1715:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1715:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1720:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1720:9: sparse: sparse: got }
>> fs/bcachefs/data/ec.c:1723:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/bcachefs/data/ec.c:1723:16: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1723:16: sparse: sparse: got h
   fs/bcachefs/data/ec.c:1724:1: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1724:1: sparse: sparse: got }
>> fs/bcachefs/data/ec.c:1736:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: got {
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: got "BUG: failure at %s:%d/%s()!n"
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: got "BUG!"
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1736:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: got {
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: got "BUG: failure at %s:%d/%s()!n"
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: got "BUG!"
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1737:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1740:23: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1740:23: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1743:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1743:9: sparse: sparse: got (
>> fs/bcachefs/data/ec.c:1743:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   fs/bcachefs/data/ec.c:1743:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1743:9: sparse: sparse: got <
   fs/bcachefs/data/ec.c:1743:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1743:9: sparse: sparse: got ++
   fs/bcachefs/data/ec.c:1753:23: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1753:23: sparse: sparse: got <
   fs/bcachefs/data/ec.c:1753:17: sparse: sparse: Trying to use reserved word 'if' as identifier
>> fs/bcachefs/data/ec.c:1755:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   fs/bcachefs/data/ec.c:1756:25: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1756:25: sparse: sparse: got nr_have_parity
   fs/bcachefs/data/ec.c:1757:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1757:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1759:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1759:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1759:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1759:9: sparse: sparse: got "BUG: failure at %s:%d/%s()!n"
   fs/bcachefs/data/ec.c:1759:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1759:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1759:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1759:9: sparse: sparse: got "BUG!"
   fs/bcachefs/data/ec.c:1759:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1759:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1759:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1759:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: got {
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: got "BUG: failure at %s:%d/%s()!n"
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: got "BUG!"
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1760:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1762:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1762:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1763:28: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1763:28: sparse: sparse: got <
   fs/bcachefs/data/ec.c:1763:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/data/ec.c:1765:20: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1765:20: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1766:20: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1766:20: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1770:17: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1770:17: sparse: sparse: got (
   fs/bcachefs/data/ec.c:1770:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   fs/bcachefs/data/ec.c:1770:17: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1770:17: sparse: sparse: got <
   fs/bcachefs/data/ec.c:1770:17: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1770:17: sparse: sparse: got ++
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: got {
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: got "BUG: failure at %s:%d/%s()!n"
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: got "BUG!"
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1774:25: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1776:26: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1776:26: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1777:26: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1777:26: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1778:25: sparse: sparse: Expected ) in nested declarator
   fs/bcachefs/data/ec.c:1778:25: sparse: sparse: got &&
   fs/bcachefs/data/ec.c:1779:17: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1779:17: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1783:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1783:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1786:26: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1786:26: sparse: sparse: got <
   fs/bcachefs/data/ec.c:1786:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/data/ec.c:1788:20: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1788:20: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1789:20: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1789:20: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1793:17: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1793:17: sparse: sparse: got (
   fs/bcachefs/data/ec.c:1793:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   fs/bcachefs/data/ec.c:1793:17: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1793:17: sparse: sparse: got <
   fs/bcachefs/data/ec.c:1793:17: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1793:17: sparse: sparse: got ++
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: got {
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: got "BUG: failure at %s:%d/%s()!n"
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: got "BUG!"
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1796:25: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1798:26: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1798:26: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1799:26: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1799:26: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1800:25: sparse: sparse: Expected ) in nested declarator
   fs/bcachefs/data/ec.c:1800:25: sparse: sparse: got &&
   fs/bcachefs/data/ec.c:1801:17: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1801:17: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1805:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1805:9: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1808:1: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1808:1: sparse: sparse: got }
   fs/bcachefs/data/ec.c:1817:26: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/data/ec.c:1817:26: sparse: sparse: got (
   fs/bcachefs/data/ec.c:1817:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/data/ec.c:1820:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1820:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1821:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1821:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1822:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1822:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1823:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1823:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1824:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1824:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1825:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1825:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1827:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1827:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1828:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1828:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1832:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1832:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1833:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1833:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1834:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1834:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1835:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1835:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1836:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1836:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1837:12: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1837:12: sparse: sparse: got ->
   fs/bcachefs/data/ec.c:1838:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/bcachefs/data/ec.c:1838:16: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/data/ec.c:1838:16: sparse: sparse: got ret
   fs/bcachefs/data/ec.c:1839:1: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/data/ec.c:1839:1: sparse: sparse: got }
>> fs/bcachefs/data/ec.c:1849:29: sparse: sparse: internal error: return without a function target

vim +1711 fs/bcachefs/data/ec.c

  1669	
  1670	static struct ec_stripe_head *
  1671	__bch2_ec_stripe_head_get(struct btree_trans *trans,
  1672				  unsigned disk_label,
  1673				  unsigned algo,
  1674				  unsigned redundancy,
  1675				  enum bch_watermark watermark)
  1676	{
  1677		struct bch_fs *c = trans->c;
  1678		struct ec_stripe_head *h;
  1679	
  1680		if (!redundancy)
  1681			return NULL;
  1682	
  1683		int ret = bch2_trans_mutex_lock(trans, &c->ec.stripe_head_lock);
  1684		if (ret)
  1685			return ERR_PTR(ret);
  1686	
  1687		if (test_bit(BCH_FS_going_ro, &c->flags)) {
  1688			h = ERR_PTR(bch_err_throw(c, erofs_no_writes));
  1689			goto err;
  1690		}
  1691	
  1692		list_for_each_entry(h, &c->ec.stripe_head_list, list)
  1693			if (h->disk_label	== disk_label &&
  1694			    h->algo		== algo &&
  1695			    h->redundancy	== redundancy &&
  1696			    h->watermark	== watermark) {
  1697				ret = bch2_trans_mutex_lock(trans, &h->lock);
  1698				if (ret) {
  1699					h = ERR_PTR(ret);
  1700					goto err;
  1701				}
  1702				goto found;
  1703			}
  1704	
  1705		h = ec_new_stripe_head_alloc(c, disk_label, algo, redundancy, watermark);
  1706		if (!h) {
  1707			h = ERR_PTR(bch_err_throw(c, ENOMEM_stripe_head_alloc));
  1708			goto err;
  1709		}
  1710	found:
> 1711		unsigned long rw_devs_change_count = READ_ONCE(c->allocator.rw_devs_change_count);
> 1712		if (h->rw_devs_change_count != rw_devs_change_count) {
  1713			ec_stripe_head_devs_update(c, h);
  1714			h->rw_devs_change_count = rw_devs_change_count;
> 1715		}
  1716	
  1717		if (h->insufficient_devs) {
  1718			mutex_unlock(&h->lock);
  1719			h = NULL;
  1720		}
  1721	err:
  1722		mutex_unlock(&c->ec.stripe_head_lock);
> 1723		return h;
  1724	}
  1725	
  1726	static int __new_stripe_alloc_buckets(struct btree_trans *trans,
  1727					    struct alloc_request *req,
  1728					    struct ec_stripe_head *h, struct ec_stripe_new *s,
  1729					    struct closure *cl)
  1730	{
  1731		struct bch_fs *c = trans->c;
  1732		struct open_bucket *ob;
  1733		struct bch_stripe *v = &bkey_i_to_stripe(&s->new_stripe.key)->v;
  1734		unsigned i, j, nr_have_parity = 0, nr_have_data = 0;
  1735	
> 1736		BUG_ON(v->nr_blocks	!= s->nr_data + s->nr_parity);
> 1737		BUG_ON(v->nr_redundant	!= s->nr_parity);
  1738	
  1739		/* * We bypass the sector allocator which normally does this: */
  1740		bitmap_and(req->devs_may_alloc.d, req->devs_may_alloc.d,
  1741			   c->allocator.rw_devs[BCH_DATA_user].d, BCH_SB_MEMBERS_MAX);
  1742	
> 1743		for_each_set_bit(i, s->blocks_gotten, v->nr_blocks) {
  1744			/*
  1745			 * Note: we don't yet repair invalid blocks (failed/removed
  1746			 * devices) when reusing stripes - we still need a codepath to
  1747			 * walk backpointers and update all extents that point to that
  1748			 * block when updating the stripe
  1749			 */
  1750			if (v->ptrs[i].dev != BCH_SB_MEMBER_INVALID)
  1751				__clear_bit(v->ptrs[i].dev, req->devs_may_alloc.d);
  1752	
  1753			if (i < s->nr_data)
  1754				nr_have_data++;
> 1755			else
  1756				nr_have_parity++;
  1757		}
  1758	
  1759		BUG_ON(nr_have_data	> s->nr_data);
  1760		BUG_ON(nr_have_parity	> s->nr_parity);
  1761	
  1762		req->ptrs.nr = 0;
  1763		if (nr_have_parity < s->nr_parity) {
  1764			req->nr_replicas	= s->nr_parity;
  1765			req->nr_effective	= nr_have_parity;
  1766			req->data_type		= BCH_DATA_parity;
  1767	
  1768			int ret = bch2_bucket_alloc_set_trans(trans, req, &h->parity_stripe, cl);
  1769	
  1770			open_bucket_for_each(c, &req->ptrs, ob, i) {
  1771				j = find_next_zero_bit(s->blocks_gotten,
  1772						       s->nr_data + s->nr_parity,
  1773						       s->nr_data);
  1774				BUG_ON(j >= s->nr_data + s->nr_parity);
  1775	
  1776				s->blocks[j] = req->ptrs.v[i];
  1777				v->ptrs[j] = bch2_ob_ptr(c, ob);
  1778				__set_bit(j, s->blocks_gotten);
  1779			}
  1780	
  1781			if (ret)
  1782				return ret;
  1783		}
  1784	
  1785		req->ptrs.nr = 0;
  1786		if (nr_have_data < s->nr_data) {
  1787			req->nr_replicas	= s->nr_data;
  1788			req->nr_effective	= nr_have_data;
  1789			req->data_type		= BCH_DATA_user;
  1790	
  1791			int ret = bch2_bucket_alloc_set_trans(trans, req, &h->block_stripe, cl);
  1792	
  1793			open_bucket_for_each(c, &req->ptrs, ob, i) {
  1794				j = find_next_zero_bit(s->blocks_gotten,
  1795						       s->nr_data, 0);
  1796				BUG_ON(j >= s->nr_data);
  1797	
  1798				s->blocks[j] = req->ptrs.v[i];
  1799				v->ptrs[j] = bch2_ob_ptr(c, ob);
  1800				__set_bit(j, s->blocks_gotten);
  1801			}
  1802	
  1803			if (ret)
  1804				return ret;
  1805		}
  1806	
  1807		return 0;
  1808	}
  1809	
  1810	static int new_stripe_alloc_buckets(struct btree_trans *trans,
  1811					    struct alloc_request *req,
  1812					    struct ec_stripe_head *h, struct ec_stripe_new *s,
  1813					    struct closure *cl)
  1814	{
  1815		struct bch_stripe *v = &bkey_i_to_stripe(&s->new_stripe.key)->v;
  1816	
  1817		if (bitmap_weight(s->blocks_gotten, v->nr_blocks) == v->nr_blocks)
  1818			return 0;
  1819	
  1820		req->scratch_data_type		= req->data_type;
  1821		req->scratch_ptrs		= req->ptrs;
  1822		req->scratch_nr_replicas	= req->nr_replicas;
  1823		req->scratch_nr_effective	= req->nr_effective;
  1824		req->scratch_have_cache		= req->have_cache;
  1825		req->scratch_devs_may_alloc	= req->devs_may_alloc;
  1826	
  1827		req->devs_may_alloc	= h->devs;
  1828		req->have_cache		= true;
  1829	
  1830		int ret = __new_stripe_alloc_buckets(trans, req, h, s, cl);
  1831	
  1832		req->data_type		= req->scratch_data_type;
  1833		req->ptrs		= req->scratch_ptrs;
  1834		req->nr_replicas	= req->scratch_nr_replicas;
  1835		req->nr_effective	= req->scratch_nr_effective;
> 1836		req->have_cache		= req->scratch_have_cache;
  1837		req->devs_may_alloc	= req->scratch_devs_may_alloc;
  1838		return ret;
  1839	}
  1840	
  1841	static int __get_old_stripe(struct btree_trans *trans,
  1842					 struct ec_stripe_head *head,
  1843					 struct ec_stripe_buf *stripe,
  1844					 u64 idx)
  1845	{
  1846		struct bch_fs *c = trans->c;
  1847	
  1848		CLASS(btree_iter, iter)(trans, BTREE_ID_stripes, POS(0, idx), BTREE_ITER_nopreserve);
> 1849		struct bkey_s_c k = bkey_try(bch2_btree_iter_peek_slot(&iter));
  1850	
  1851		/* We expect write buffer races here */
  1852		if (k.k->type != KEY_TYPE_stripe)
  1853			return 0;
  1854	
  1855		struct bkey_s_c_stripe s = bkey_s_c_to_stripe(k);
  1856		if (stripe_lru_pos(s.v) <= 1)
  1857			return 0;
  1858	
  1859		if (s.v->disk_label		== head->disk_label &&
  1860		    s.v->algorithm		== head->algo &&
  1861		    s.v->nr_redundant		== head->redundancy &&
  1862		    le16_to_cpu(s.v->sectors)	== head->blocksize &&
  1863		    bch2_stripe_handle_tryget(c, &head->s->old_stripe_handle, idx)) {
  1864			bkey_reassemble(&stripe->key, k);
  1865			return 1;
  1866		}
  1867	
  1868		return 0;
  1869	}
  1870	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
