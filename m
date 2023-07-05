Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6F6134C0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 17:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688579292; x=1720115292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BlB4G1HDmjvhmg815pJhbumkvrtOiPa+OZKNjbJXlVM=;
  b=KHnLlRjTpZn1r2NjvCnBnLiIKWYKpozFirS08PYNDpd7MxD21nZAxi7k
   5/Lk+8exkF5bPF8eoQQ31z0yfJeiP6E6+ci3bW6aaSd/V0qL/gLAi2Nhq
   DJg6rCT87o4Vtm0DXHEFy9AhPnbT4l96NQ+rM+cfcMEAsRbLFHmlHiiwy
   x/zTuSZ+TKmJwhR67EX8l3Jdf0E5tEk12mhL9K83z+dn1OAaUWt6p8fvd
   hgOcyNFSePVLz8ob25b1bGsnQ5t4xjmn7JD2oRupqUjcnxvKUowlpyyM9
   nuctt//+ESOz92+aJ5weAaBMtUOR6YcMUlPhtb1zI7NNHP9S/tnWs68Sv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="363435348"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="363435348"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 10:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="754441952"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="754441952"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Jul 2023 10:48:03 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qH6bj-0000kt-0M;
	Wed, 05 Jul 2023 17:48:03 +0000
Date: Thu, 6 Jul 2023 01:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luben Tuikov <luben.tuikov@amd.com>
Subject: [linux-next:master 12854/13235] riscv32-linux-ld: section
 __bug_table LMA [00458b18,00474c6f] overlaps section .text LMA
 [0009e41c,01aff30b]
Message-ID: <202307060144.dNY81EkU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e1f6a8eaf1c271a0158114a03e3605f4fba059ad
commit: f781f661e8c99b0cb34129f2e374234d61864e77 [12854/13235] dma-buf: keep the signaling time of merged fences v3
config: riscv-randconfig-r032-20230705 (https://download.01.org/0day-ci/archive/20230706/202307060144.dNY81EkU-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060144.dNY81EkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307060144.dNY81EkU-lkp@intel.com/

Note: the linux-next/master HEAD e1f6a8eaf1c271a0158114a03e3605f4fba059ad builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   riscv32-linux-ld: section .data LMA [0005a000,00458b17] overlaps section .init.text LMA [00001000,0008111f]
   riscv32-linux-ld: section .exit.text LMA [00081120,0009e41b] overlaps section .data LMA [0005a000,00458b17]
>> riscv32-linux-ld: section __bug_table LMA [00458b18,00474c6f] overlaps section .text LMA [0009e41c,01aff30b]
>> riscv32-linux-ld: section __param VMA [c20452ac,c2049e87] overlaps section .data VMA [c2000000,c23feb17]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
