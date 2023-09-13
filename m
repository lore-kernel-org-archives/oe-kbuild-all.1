Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E656A45
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 06:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694585715; x=1726121715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hZ/M8E+ZHwfsIOF+Fry8Kt1u42TV4X2c2fSobBSkMD8=;
  b=KqtvmVoZI0IXAvTEalxToi1KYn5EnIOBbsNs6QudVr4erGwN/1XPeeCZ
   7TPyl+07YmGdDcLIcTryTGDuGF0yhauV4nh9bJPxOlqJ4GSX/QwxGObsX
   WYKHL4zMyG4NBphY82BjSoDCsAip5OQv6BUZTVx/bS6XnZgOvJwbC2eal
   b8rP2UDQNQv11CD41MmGEmExlpYAO0f1LeLTOddsrcp/Ab9Q2QRyxZghQ
   BEk9P+b98NCx6gbz4dBBMPx2YMSHBvKbAr+X9xIAD5cI8QYiG7m2CzcSy
   ni2zGfOuEt34OdhlSkp9XNSGAMDqnsJoZkhgOJUMLzvKiZtteL25mcYjm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="368842203"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="368842203"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 23:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="859117127"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="859117127"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2023 23:15:12 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgJ7S-00007l-0M;
	Wed, 13 Sep 2023 06:13:25 +0000
Date: Wed, 13 Sep 2023 14:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: /tmp/ccB3TqZP.s:15: Error: unrecognized opcode: `wrtee'
Message-ID: <202309131416.qCTju9Td-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3669558bdf354cd352be955ef2764cde6a9bf5ec
commit: f5df87b855fd835ff0f4928575adbf4f5302bb40 powerpc/build: Remove -pipe from compilation flags
date:   3 months ago
config: powerpc-buildonly-randconfig-r006-20220531 (https://download.01.org/0day-ci/archive/20230913/202309131416.qCTju9Td-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131416.qCTju9Td-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131416.qCTju9Td-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccB3TqZP.s: Assembler messages:
>> /tmp/ccB3TqZP.s:15: Error: unrecognized opcode: `wrtee'
   /tmp/ccB3TqZP.s:64: Error: unrecognized opcode: `wrteei'
--
   /tmp/ccFA32eu.s: Assembler messages:
   /tmp/ccFA32eu.s:240: Error: unrecognized opcode: `wrtee'
   /tmp/ccFA32eu.s:304: Error: unrecognized opcode: `wrteei'
   /tmp/ccFA32eu.s:2159: Error: unrecognized opcode: `wrteei'
   /tmp/ccFA32eu.s:3451: Error: unrecognized opcode: `wrteei'
   /tmp/ccFA32eu.s:3710: Error: unrecognized opcode: `wrteei'
   /tmp/ccFA32eu.s:7053: Error: unrecognized opcode: `wrteei'
   /tmp/ccFA32eu.s:7507: Error: unrecognized opcode: `wrteei'
   /tmp/ccFA32eu.s:8171: Error: unrecognized opcode: `wrteei'
>> /tmp/ccFA32eu.s:8582: Error: unrecognized opcode: `mbar'
   /tmp/ccFA32eu.s:12273: Error: unrecognized opcode: `wrteei'
   /tmp/ccFA32eu.s:12607: Error: unrecognized opcode: `wrteei'
   /tmp/ccFA32eu.s:13473: Error: unrecognized opcode: `wrteei'
   /tmp/ccFA32eu.s:13726: Error: unrecognized opcode: `wrteei'
   /tmp/ccFA32eu.s:13965: Error: unrecognized opcode: `wrteei'
--
   /tmp/cczs4OOF.s: Assembler messages:
   /tmp/cczs4OOF.s:2812: Error: unrecognized opcode: `mullhwu'
   /tmp/cczs4OOF.s:2830: Error: unrecognized opcode: `mullhwu'
>> /tmp/cczs4OOF.s:19996: Error: unrecognized opcode: `mullhwu.'
   /tmp/cczs4OOF.s:20170: Error: unrecognized opcode: `mullhwu'
--
   /tmp/ccv20csa.s: Assembler messages:
>> /tmp/ccv20csa.s:24: Error: unrecognized opcode: `mtdcr'
>> /tmp/ccv20csa.s:27: Error: unrecognized opcode: `mfdcr'
   /tmp/ccv20csa.s:74: Error: unrecognized opcode: `mtdcr'
   /tmp/ccv20csa.s:77: Error: unrecognized opcode: `mfdcr'
   /tmp/ccv20csa.s:735: Error: unrecognized opcode: `mfdcr'
   /tmp/ccv20csa.s:742: Error: unrecognized opcode: `mfdcr'
   /tmp/ccv20csa.s:749: Error: unrecognized opcode: `mfdcr'
   /tmp/ccv20csa.s:757: Error: unrecognized opcode: `mfdcr'
   /tmp/ccv20csa.s:764: Error: unrecognized opcode: `mfdcr'
   /tmp/ccv20csa.s:771: Error: unrecognized opcode: `mfdcr'
   /tmp/ccv20csa.s:778: Error: unrecognized opcode: `mfdcr'
   /tmp/ccv20csa.s:786: Error: unrecognized opcode: `mfdcr'
   /tmp/ccv20csa.s:897: Error: unrecognized opcode: `mtdcr'
   /tmp/ccv20csa.s:900: Error: unrecognized opcode: `mfdcr'
   /tmp/ccv20csa.s:903: Error: unrecognized opcode: `mtdcr'
   /tmp/ccv20csa.s:909: Error: unrecognized opcode: `mtdcr'
   /tmp/ccv20csa.s:915: Error: unrecognized opcode: `mtdcr'
   /tmp/ccv20csa.s:918: Error: unrecognized opcode: `mfdcr'
   /tmp/ccv20csa.s:921: Error: unrecognized opcode: `mtdcr'
   /tmp/ccv20csa.s:927: Error: unrecognized opcode: `mtdcr'
--
   /tmp/ccAshUsv.s: Assembler messages:
   /tmp/ccAshUsv.s:299: Error: unrecognized opcode: `iccci'
>> /tmp/ccAshUsv.s:419: Error: unrecognized opcode: `tlbwe'
   /tmp/ccAshUsv.s:420: Error: unrecognized opcode: `tlbwe'
   /tmp/ccAshUsv.s:421: Error: unrecognized opcode: `tlbwe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
