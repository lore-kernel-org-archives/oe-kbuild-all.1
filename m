Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FE47F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 09:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682154947; x=1713690947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iu8uJ7xNMSNTRauSN2txHrU0699fv6AmGQSXp5O8OYk=;
  b=MqT1+VNmya3M6vzXmwtwofJ7mnSA8VRLqQfriXNfzdjm/VsrjtQhoDpt
   MZ6qkeld5XA4Bqp4GwVIlhCufGqAJ9M4tJ17y3vMxDa82Fz8wp6gyaXWp
   bRCAywk7wP2GvE3oNDCudTsDQItibsZJTaIyjCxEHDHf02lu9k4jkAzE7
   9ws8ZNjg3WCQ5Z2at93eYdNQjoLGDvUDof/rPivA+hHGyzNGxR74kNw8u
   Uzh0QuAQHOpjsYJY/0yuXAZ1g2Av+pDuz1sBbMzEubplzxI+ZxiIDAxtv
   8TCKo2Bejg/B6qN/0k2LPLdTZH4QHCba0b8oabl+65OWOqsaJFOZuWZmo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="409080533"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="409080533"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 02:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="1022143630"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="1022143630"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Apr 2023 02:15:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq9LI-000hCs-07;
	Sat, 22 Apr 2023 09:15:40 +0000
Date: Sat, 22 Apr 2023 17:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie 19/19] /tmp/ccLBwaxw.s:56: Error: symbol `.Lpcp' is
 already defined
Message-ID: <202304221748.4c5uFfcL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie
head:   01406d471d3e3718b3771fdabcfca8c505157404
commit: 01406d471d3e3718b3771fdabcfca8c505157404 [19/19] x86: Permit absolute per-CPU references in asm code
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230422/202304221748.4c5uFfcL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=01406d471d3e3718b3771fdabcfca8c505157404
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-pie
        git checkout 01406d471d3e3718b3771fdabcfca8c505157404
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221748.4c5uFfcL-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccLBwaxw.s: Assembler messages:
   /tmp/ccLBwaxw.s:27: Error: junk `(__x86_call_count)' after expression
>> /tmp/ccLBwaxw.s:56: Error: symbol `.Lpcp' is already defined
   /tmp/ccLBwaxw.s:56: Error: junk `(__x86_call_count)' after expression

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
